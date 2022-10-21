#ifndef GPIO_HEADER_H		/* prevent circular inclusions */
#define GPIO_HEADER_H		/* by using protection macros */

#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"

#define GPIO_DATA_OFFSET	0x0000
#define GPIO_TRI_OFFSET 	0x0004
#define GPIO2_DATA_OFFSET	0x0008
#define GPIO2_TRI_OFFSET	0x000C
#define GIER_OFFSET			0x011C
#define IP_IER_OFFSET		0x0128
#define IP_ISR_OFFSET		0x0120

void GpioInit(u32* const GpioAddress);
void GpioWrite(u32* const GpioAddress, const u32 value);

#endif

