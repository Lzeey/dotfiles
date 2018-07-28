. "$BASH_IT/themes/powerline/powerline.base.bash"

#Overwrite __powerline_cwd_prompt from base file
function __powerline_cwd_prompt {
  # Only show ellipses for directory trees -gt 3
  # Otherwise use the default pwd as the current \w replacement
  local cwd=$(pwd | sed "s|^${HOME}|~|")
  if [ $(echo ${cwd%/} | grep -o '/' | wc -l) -gt 4 ]; then
    local base_dir=$(echo "$cwd" | cut -d'/' -f 1-2 )
    # Trick to grab last 3 parts of pwd
    # Inpsired by: https://stackoverflow.com/questions/22727107/how-to-find-the-last-field-using-cut
    local leaf_dir=$(echo "$cwd" | rev | cut -d'/' -f1-3 | rev)
    echo "${base_dir}/../${leaf_dir}|${CWD_THEME_PROMPT_COLOR}"
  else
    echo "${cwd}|${CWD_THEME_PROMPT_COLOR}"
  fi
}

function __powerline_left_segment {
  local OLD_IFS="${IFS}"; IFS="|"
  local params=( $1 )
  IFS="${OLD_IFS}"
  #Custom arrow separator
  if [[ "$LEFT_PROMPT" == "" ]]; then
    LEFT_PROMPT+="$(set_color - ${params[1]}) "
  else
    LEFT_PROMPT+="$(set_color ${LAST_SEGMENT_COLOR:-"-"} ${params[1]})${normal}"
  fi
  LEFT_PROMPT+="${separator}$(set_color - ${params[1]})${params[0]}${normal}"
  LAST_SEGMENT_COLOR=${params[1]}
}

function __powerline_prompt_command {
  local last_status="$?" ## always the first

  LEFT_PROMPT=""

  ## left prompt ##
  for segment in $POWERLINE_PROMPT; do
    local info="$(__powerline_${segment}_prompt)"
    [[ -n "${info}" ]] && __powerline_left_segment "${info}"
  done
  [[ "${last_status}" -ne 0 ]] && __powerline_left_segment $(__powerline_last_status_prompt ${last_status})
  [[ -n "${LEFT_PROMPT}" ]] && LEFT_PROMPT+="$(set_color ${LAST_SEGMENT_COLOR} -)${normal}"

  PS1="${LEFT_PROMPT} "
  
  ## cleanup ##
  unset LEFT_PROMPT
  unset LAST_SEGMENT_COLOR
}
