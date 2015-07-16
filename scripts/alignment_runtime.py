#!/usr/bin/env python

import datetime as df
from ggplot import *
import pandas as pd
import os

def extract_time(line):
  return int(line.split()[3])

def __main__():
  '''
  Summarize runtimes for alignment of 24 WGS samples.
  '''
  times = []
  for root, dirs, files in os.walk('/Users/vasya/Projects/boehnkelab/google-gotcloud/logs/'):
    for log in files:
      with open(root+log) as fconn:
        for line in fconn:
           lastLine = line
        times.append(extract_time(lastLine))  
        #times.append( dt.timedelta(seconds=extract_time(lastLine)) )
  
  timesDict = {'sample_pair_runtimes':times}

  timesdf = pd.DataFrame(data=timesDict)
  p = ggplot(timesdf, aes(x='sample_pair_runtimes')) + geom_histogram()
  p.show(1)

if __name__ == '__main__':
  __main__()

