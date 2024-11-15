#include "generic_timer.h"

void timerEnable(void)
{

	WRITE_SYSTEM_REGISTER(CNTP_CTL_EL0, 1);
}

uint64_t getTime(void)
{
    return READ_SYSTEM_REGISTER(CNTPCT_EL0);
}

timestamp_t tickTotime(const uint64_t counter_tick)
{
	timestamp_t time_value;

	double time_s = (double)counter_tick/(double)CNTFREQ_HZ;

	time_value.ns = (uint64_t)(time_s * 1000000000) % 1000;
	time_value.us = (uint64_t)(time_s * 1000000) % 1000;
	time_value.ms = (uint64_t)(time_s * 1000) % 1000;

	time_value.s = (uint64_t)time_s % 60;
	time_value.m = (uint64_t)time_s / 60;
	time_value.h = (uint64_t)time_s / 3600;

//	printf("- DEBUG - tick value %lu\r\n", counter_tick);
//	printf(" - DEBUG - time value\r\n");
//	printf("\t ns: %d\r\n", time_value.ns);
//	printf("\t us: %d\r\n", time_value.us);
//	printf("\t ms: %d\r\n", time_value.ms);
//	printf("\t  s: %d\r\n", time_value.s);
//	printf("\t  m: %d\r\n", time_value.m);
//	printf("\t  h: %d\r\n", time_value.h);

	return time_value;
}

void sleepms(uint64_t ms)
{
    uint64_t t0 = 0;
    uint64_t t1;
    uint64_t tick = (ms*CNTFREQ_HZ)/1000;

    t0 = getTime();
    t1 = t0;

    while ((t1 - t0) < tick)
    {
        t1 = getTime();
    }
}
