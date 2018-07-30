#!/usr/bin/env python
try:
    import configparser
except ImportError: #Python 2
    import ConfigParser as configparser
import glob
import os
import ast
from os.path import expanduser

SPYDER_CONFIG_PATH = os.path.join(expanduser('~'), '.config/spyder-py3/spyder.ini')

def insert_dummy_section(f, section_name='dummy'):
    """Inserts dummy section name to read a config file without section headers
    Usage:
        with open(CONFIG_PATH, 'r') as f:
            cfg = insert_dummy_section(f)
        config = configparser.ConfigParser()
        config.read_string(cfg)
    """
    return ('[%s]\n' % section_name) + f.read()

if __name__ == "__main__":

    color_themes_files = glob.glob("*.ini")
    color_themes = [f[:-4] for f in color_themes_files]

    # Load spyder theme files settings
    print(color_themes)
    config = configparser.ConfigParser()
    config.read(SPYDER_CONFIG_PATH)

    theme_config = dict(config['color_schemes'])
    theme_config['names'] = ast.literal_eval(str(theme_config['names']))
    #Inject themes
    for color_theme, theme_file in zip(color_themes, color_themes_files):
        color_theme_mod = color_theme.replace('-', '/')

        if color_theme not in theme_config['names']:
            theme_config['names'].append(color_theme_mod)
            
            #Read config file
            with open(theme_file, 'r') as f:
                cfg = insert_dummy_section(f)
            config_tmp = configparser.ConfigParser()
            config_tmp.read_string(cfg)
            
            #Insert into the other dictionary
            for k, v in dict(config_tmp['dummy']).items():
                if k not in theme_config:
                    theme_config[k] = v
        else:
            print(color_theme, "already in spyder schemes")
    
    #Write the 'names' attribute back as a string
    theme_config['names'] = str(theme_config['names'])
    
    #Inject to the original config
    config['color_schemes'] = theme_config
    
    #Write
    with open(SPYDER_CONFIG_PATH, 'w') as f:
        config.write(f)
    #color_schemes = dict(config['color_schemes'])
    #print(color_schemes['names'])



