#ifndef UTILITY_H
#define UTILITY_H
#include "xgpiops.h"
#include "xscugic.h"

typedef __UINT8_TYPE__					uint8_t;
typedef __UINT32_TYPE__					uint32_t;
typedef __UINT64_TYPE__					uint64_t;

#define STR(X)                          #X
#define ASSTR(X)                        STR(X)
#define READ_SYSTEM_REGISTER(reg)       ({uint64_t rval = 0U; __asm volatile("mrs %0, " ASSTR(reg) : "=r" (rval) : : "cc"); rval; })
#define WRITE_SYSTEM_REGISTER(reg, in)  __asm volatile("msr " ASSTR(reg) " , %0" : : "r" (in) : "cc")

//#define GPIO_INT_SOURCE_ADDR		0xA0010000
//#define GPIO_EXT_OUTPUT_ADDR		0xA0000000

#define NUM_EXP						2
static XGpioPs Gpio; /* The Instance of the GPIO Driver */

static XScuGic Intc; /* The Instance of the Interrupt Controller Driver */

#endif
