#!/usr/bin/env python
'''
Get total runtime for a snpcall run.

Might be worth breaking this down into per task or per step timings.
'''

import datetime

logFile = '/mnt/data/test_1000g_bams/output2/umake.snpcall.Makefile.cluster'

with open(logFile, 'r') as log:
	firstLine = log.next()
	for line in log:
		lastLine = line

def extractDatetime(line):
	line = line.strip().split()
	date = line[1].split('-')
	year = int(date[0])
	month = int(date[1])
	day = int(date[2])
	time = line[2].split(':')
	hour = int(time[0])
	minute = int(time[1])
	sec = int(time[2])
	dt = datetime.datetime(year, month, day, hour, minute, sec)
	return(dt)

start = extractDatetime(firstLine)
end =  extractDatetime(lastLine)
print (end - start)

