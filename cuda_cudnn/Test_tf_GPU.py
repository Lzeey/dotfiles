#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov  7 08:04:59 2017

@author: zeyi

Script for testing if tensorflow is working as expected

Source code inspired from fchollet's multi_gpu_model()
"""

import tensorflow as tf
import numpy as np
#gpus = 4

def _get_available_devices():
    from tensorflow.python.client import device_lib
    local_device_protos = device_lib.list_local_devices()
    return [x.name for x in local_device_protos]

#target_devices = ['/cpu:0'] + ['/GPU:%d' % i for i in range(gpus)]
available_devices = _get_available_devices()
#for device in target_devices:
#    if device not in available_devices:
#        raise ValueError(
#            'To call `multi_gpu_model` with `gpu=%d`, '
#            'we expect the following devices to be available: %s. '
#            'However this machine only has: %s. '
#            'Try reducing `gpus`.' % (gpus,
#                                      target_devices,
#                                      available_devices))




#

results = []
for device in available_devices:
    try:
        # Creates a graph.
        with tf.device(device):
          a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
          b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
          c = tf.matmul(a, b)
        # Creates a session with log_device_placement set to True.
        sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
        # Runs the op.
        assert(np.sum(np.array([[22, 28], [49, 64]]) - sess.run(c)) == 0)
        print(device, ": OK")
        results.append(device + ": OK")
    except:
        print(device, "met with an Exception")
        results.append(device + ": met with an Exception")

print('\n'.join(results))
