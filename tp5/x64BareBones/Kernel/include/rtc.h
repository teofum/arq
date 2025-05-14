#ifndef RTC_H
#define RTC_H

#include <stdint.h>

typedef struct {
  uint16_t seconds;
  uint16_t minutes;
  uint16_t hours;
} time_t;

typedef struct {
  uint16_t day;
  uint16_t dow;
  uint16_t month;
  uint16_t year;
} date_t;

typedef struct {
  date_t date;
  time_t time;
} datetime_t;

time_t rtc_gettime();
date_t rtc_getdate();
datetime_t rtc_getdatetime();

#endif