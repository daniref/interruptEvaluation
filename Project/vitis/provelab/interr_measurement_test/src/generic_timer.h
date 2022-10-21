#ifndef TIMER_H
#define TIMER_H

#include "utility.h"

#define CNTFREQ_HZ 99990005U

typedef struct
{
	uint32_t h;
	uint32_t m;
	uint32_t s;
	uint32_t ms;
	uint32_t us;
	uint32_t ns;
}timestamp_t;

void timerEnable(void);

uint64_t getTime(void);

timestamp_t tickTotime(const uint64_t counter_tick);

void sleepms(uint64_t ms);

#endif
