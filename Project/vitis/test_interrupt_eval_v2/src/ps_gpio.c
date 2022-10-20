#include "ps_gpio.h"
#include "xgpiops.h"
#include "xgpiops_hw.h"
#include "stdio.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xplatform_info.h"
#include <xil_printf.h>

XGpioPs Gpio;

void PSGpioInit()
{
	int Status;
	XGpioPs_Config *ConfigPtr;
	int Type_of_board;

	/* Initialize the GPIO driver. */
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);

	Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr,
					ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set the direction for the pin to be output and
	 * Enable the Output enable for the LED Pin.
	 */
	XGpioPs_SetDirectionPin(&Gpio, INT_SIGN, 1);
	XGpioPs_SetDirectionPin(&Gpio, INT_LED, 1);
	XGpioPs_SetDirectionPin(&Gpio, EXT_SIGN, 1);
	XGpioPs_SetDirectionPin(&Gpio, EXT_LED, 1);

	XGpioPs_SetOutputEnablePin(&Gpio, INT_SIGN, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, INT_LED, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, EXT_SIGN, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, EXT_LED, 1);

	/* Set the GPIO output to be low. */
	XGpioPs_WritePin(&Gpio, INT_SIGN, 0x0);
	XGpioPs_WritePin(&Gpio, INT_LED, 0x0);
	XGpioPs_WritePin(&Gpio, EXT_SIGN, 0x0);
	XGpioPs_WritePin(&Gpio, EXT_LED, 0x0);


	printf("PS_Gpio initialized successfully!\r\n");
	return &Gpio;

}

void PSGpioWrite(uint32_t pin,uint32_t value)
{
	XGpioPs_WritePin(&Gpio, pin, value);

}


