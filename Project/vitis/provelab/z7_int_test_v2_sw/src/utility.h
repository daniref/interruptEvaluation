#ifndef UTILITY_H
#define UTILITY_H
#include "xgpiops.h"
#include "xscugic.h"

typedef __UINT8_TYPE__					uint8_t;
typedef __UINT32_TYPE__					uint32_t;
typedef __UINT64_TYPE__					uint64_t;

#define STR(X)                          	#X
#define ASSTR(X)                       		STR(X)
#define READ_PERF_CYCLE_COUNTER()        	({uint64_t rval = 0U; __asm volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(rval)); rval;})
#define READ_PERF_CONTROL_COUNTER()     	({uint64_t rval = 0U; __asm volatile("mrc p15, 0, %0, c9, c12, 0" : "=r"(rval)); rval;})
#define WRITE_PERF_CONTROL_COUNTER(value)   __asm volatile("mcr p15, 0, %0, c9, c12, 0" : "=r"(value))


#define WRITE_SYSTEM_REGISTER(reg, in)  __asm volatile("mcr " ASSTR(reg) " , %0" : : "r" (in) : "cc")
#define HW_ADDR32(addr) 				((volatile uint32_t*)(addr))

//#define GPIO_INT_SOURCE_ADDR		0xA0010000
//#define GPIO_EXT_OUTPUT_ADDR		0xA0000000

#define NUM_EXP						2
static XGpioPs Gpio; /* The Instance of the GPIO Driver */

static XScuGic Intc; /* The Instance of the Interrupt Controller Driver */

#endif
