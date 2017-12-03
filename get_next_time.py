#!/usr/bin/env python
# Finds the next recording time at least 90 second in the future.
import sys, time, calendar, os, datetime
from subprocess import call

# 0 = Monday ... 6 = Sunday
def getDow(timeStruct):
  dow = int(time.strftime("%w", timeStruct)) - 1
  if dow < 0:
    dow += 7
  return dow
  
def extractPlanDays(bitArray):
  days = []
  tmp = int(bitArray)
  for i in range(0,7):
    days.append(tmp&1)
    tmp >>= 1
  return days

def timeStructToLocal(timeStruct):
  return time.localtime(calendar.timegm(timeStruct))


def addDays(timeStruct, dayCnt):
  futureTimeLocal = datetime.datetime(timeStruct.tm_year, timeStruct.tm_mon, timeStruct.tm_mday, timeStruct.tm_hour, timeStruct.tm_min, timeStruct.tm_sec) + datetime.timedelta(days=dayCnt)
  return futureTimeLocal.timetuple()


f = open(sys.argv[1],'w')
curTime = int(time.time())
print curTime
print datetime.datetime.fromtimestamp(curTime)
nextRecTime = -1
for i in range(2, len(sys.argv)):
  recArray = sys.argv[i].split("|")
  print recArray
  timeStruct = time.strptime(recArray[0], "%Y-%m-%dT%H:%M:%SZZ")
  timeStructLocal = timeStructToLocal(timeStruct)
  print "Local time for this show in the database: ", time.strftime("%Y-%m-%d %H:%M:%S", timeStructLocal)
  days = extractPlanDays(recArray[1])
  futureDays = 1 if (int(recArray[1])==0) else 10000
  for i in range(0, futureDays):
    futureTimeLocal = addDays(timeStructLocal, i)
    dow = getDow(futureTimeLocal)
    nextRecTimeCur = int(time.mktime(futureTimeLocal))
    if (i==0 or days[dow]) and nextRecTimeCur >= curTime + 90:
      if nextRecTime<0 or nextRecTimeCur < nextRecTime:
        nextRecTime = nextRecTimeCur
      print "Next recording local time for this show is ", time.strftime("%Y-%m-%d %H:%M:%S", futureTimeLocal), ", which is ", i, " days after the day in the database."
      break
print "Next recording local time is ", time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(nextRecTime))
f.write(str(nextRecTime))
