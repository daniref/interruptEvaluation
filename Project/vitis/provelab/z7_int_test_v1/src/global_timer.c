#include "global_timer.h"

void timerEnable(void)
{
    *HW_ADDR32(GTIMER_BASEADDR_PHY + GTIMER_CONTROL_OFFSET)       = 0U;         // Disabilita il counter
    *HW_ADDR32(GTIMER_BASEADDR_PHY + GTIMER_COUNTER_LOWER_OFFSET) = 0x00U;      // Imposta la parte bassa del counter a 0
    *HW_ADDR32(GTIMER_BASEADDR_PHY + GTIMER_COUNTER_UPPER_OFFSET) = 0x00U;      // Imposta la parte alta del counter a 0
    *HW_ADDR32(GTIMER_BASEADDR_PHY + GTIMER_CONTROL_OFFSET)       = 0x00000001; // Abilita il counter
}

uint64_t getTime(void)
{
    uint32_t lowerBit;
    uint32_t higherBit;
    do /* Reading Global Timer Counter Register */
    {
        higherBit = *HW_ADDR32(GTIMER_BASEADDR_PHY + GTIMER_COUNTER_UPPER_OFFSET);        /* 1. Read the upper 32-bit */
        lowerBit  = *HW_ADDR32(GTIMER_BASEADDR_PHY + GTIMER_COUNTER_LOWER_OFFSET);        /* 2. Read the lower 32-bit */
    } while (*HW_ADDR32(GTIMER_BASEADDR_PHY + GTIMER_COUNTER_UPPER_OFFSET) != higherBit); /* 3. Read the upper 32-bit timer counter register again. */

    return ((((uint64_t)higherBit) << 32U) | (uint64_t)lowerBit);

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
