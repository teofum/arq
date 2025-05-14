#include <rtc.h>

extern uint16_t rtc_getval(uint8_t id);

#define RTC_VAL_SECONDS 0x0
#define RTC_VAL_MINUTES 0x2
#define RTC_VAL_HOURS 0x4
#define RTC_VAL_DAY 0x7
#define RTC_VAL_DOW 0x6
#define RTC_VAL_MONTH 0x8
#define RTC_VAL_YEAR 0x9

time_t rtc_gettime() {
  time_t time = {
      .seconds = rtc_getval(RTC_VAL_SECONDS),
      .minutes = rtc_getval(RTC_VAL_MINUTES),
      .hours = rtc_getval(RTC_VAL_HOURS),
  };

  return time;
}

date_t rtc_getdate() {
  date_t date = {
      .day = rtc_getval(RTC_VAL_DAY),
      .dow = rtc_getval(RTC_VAL_DOW),
      .month = rtc_getval(RTC_VAL_MONTH),
      .year = rtc_getval(RTC_VAL_YEAR),
  };

  return date;
}

datetime_t rtc_getdatetime() {
  datetime_t dt = {
    .date = rtc_getdate(),
    .time = rtc_gettime(),
  };

  return dt;
}