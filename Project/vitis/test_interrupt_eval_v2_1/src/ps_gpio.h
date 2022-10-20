#ifndef GPIO_PS_HEADER_H		/* prevent circular inclusions */
#define GPIO_PS_HEADER_H		/* by using protection macros */

#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xgpiops.h"
#include "xgpiops_hw.h"

#ifndef GPIO_DEVICE_ID
#define GPIO_DEVICE_ID		XPAR_XGPIOPS_0_DEVICE_ID
#endif

#define INT_SIGN	81
#define INT_LED		80
#define EXT_SIGN	79
#define EXT_LED		78

#define INT_MASK	(INT_SIGN) | INT_LED
#define EXT_MASK	(EXT_SIGN) | EXT_LED

void PSGpioInit();
void PSGpioWrite(uint32_t pin,uint32_t value);


#endif

