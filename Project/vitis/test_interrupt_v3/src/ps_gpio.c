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

	XGpioPs_SetDirectionPin(&Gpio, INT_SIGN_IN, 0);

	/*
	 * Set the direction for the pin to be output and
	 * Enable the Output enable for the LED Pin.
	 */
	XGpioPs_SetDirectionPin(&Gpio, INT_SIGN_OUT, 1);
	XGpioPs_SetDirectionPin(&Gpio, INT_LED_OUT, 1);
	XGpioPs_SetDirectionPin(&Gpio, EXT_SIGN_OUT, 1);
	XGpioPs_SetDirectionPin(&Gpio, EXT_LED_OUT, 1);

	XGpioPs_SetOutputEnablePin(&Gpio, INT_SIGN_OUT, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, INT_LED_OUT, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, EXT_SIGN_OUT, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, EXT_LED_OUT, 1);

	/* Set the GPIO output to be low. */
	XGpioPs_WritePin(&Gpio, INT_SIGN_OUT, 0x0);
	XGpioPs_WritePin(&Gpio, INT_LED_OUT, 0x0);
	XGpioPs_WritePin(&Gpio, EXT_SIGN_OUT, 0x1);
	XGpioPs_WritePin(&Gpio, EXT_LED_OUT, 0x0);


	/* Enable falling edge interrupts for all the pins in GPIO bank. */
	XGpioPs_SetIntrType(&Gpio, GPIO_BANK, 0x00, 0xFFFFFFFF, 0x00);

	/* Enable the GPIO interrupts of GPIO Bank. */
	XGpioPs_IntrEnable(&Gpio, GPIO_BANK, (1 << INT_SIGN_IN));

	printf("PS_Gpio initialized successfully!\r\n");
	return &Gpio;

}

void PSGpioWrite(uint32_t pin,uint32_t value)
{
	XGpioPs_WritePin(&Gpio, pin, value);

}


