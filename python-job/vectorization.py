#!/usr/bin/env python
"""
Python 3.6 script demonstrating vectorized execution
"""
import numpy as np
import time


# 10 million entries
t = np.linspace(-10,10,10000000)
x1 = np.zeros(len(t))
x2 = np.zeros(len(t))

time1 = time.process_time()
# naive, non-vectorized implementation
for i, ti in enumerate(t):
    x1[i] = np.sin(ti)
time2 = time.process_time()
print(f"naive implementation {time2-time1:.2f} cpu seconds elapsed")

# vectorized implementation
time1 = time.process_time()
x2 = np.sin(t)
time2 = time.process_time()
print(f"vectorized implementation {time2-time1:.2f} cpu seconds elapsed")

if np.array_equal(x1,x2):
	print("arrays equal!")
