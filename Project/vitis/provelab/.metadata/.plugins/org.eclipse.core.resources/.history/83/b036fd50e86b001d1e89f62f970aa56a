#include "ps_gpio.h"
#include "xgpiops.h"
#include "xgpiops_hw.h"
#include "stdio.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xplatform_info.h"
#include <xil_printf.h>

static XGpioPs Gpio;

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

	/* Run a self-test on the GPIO device. */
	Status = XGpioPs_SelfTest(&Gpio);
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
	XGpioPs_WritePin(&Gpio, EXT_SIGN_OUT, 0x0);
	XGpioPs_WritePin(&Gpio, EXT_LED_OUT, 0x0);


	XGpioPs_WritePin(&Gpio, INT_SIGN_OUT, 0x1);
	XGpioPs_WritePin(&Gpio, INT_LED_OUT, 0x1);
	XGpioPs_WritePin(&Gpio, EXT_SIGN_OUT, 0x1);
	XGpioPs_WritePin(&Gpio, EXT_LED_OUT, 0x1);


	XGpioPs_WritePin(&Gpio, INT_SIGN_OUT, 0x0);
	XGpioPs_WritePin(&Gpio, INT_LED_OUT, 0x0);
	XGpioPs_WritePin(&Gpio, EXT_SIGN_OUT, 0x0);
	XGpioPs_WritePin(&Gpio, EXT_LED_OUT, 0x0);



	/* Enable falling edge interrupts for all the pins in GPIO bank. */
//	XGpioPs_SetIntrType(&Gpio, GPIO_BANK, 0xFFFF, 0xFFFFFFFF, 0x00);
//
////	/* Set the handler for gpio interrupts. */
////	XGpioPs_SetCallbackHandler(Gpio, (void *)Gpio, IntrHandler);
//
//
//	/* Enable the GPIO interrupts of GPIO Bank. */
//	XGpioPs_IntrEnable(&Gpio, GPIO_BANK, (1 << 0));


//	/* Enable the interrupt for the GPIO device. */
//	XScuGic_Enable(GicInstancePtr, GPIO_INTERR_ID);

//
//	/* Enable interrupts in the Processor. */
//	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);




	printf("PS_Gpio initialized successfully!\r\n");
	return &Gpio;

}

void PSGpioWrite(uint32_t pin,uint32_t value)
{
	XGpioPs_WritePin(&Gpio, pin, value);

}

XGpioPs* get_gpio_controller()
{
	return &Gpio;
}

static void IntrHandler(void *CallBackRef, u32 Bank, u32 Status)
{
//	XGpioPs *Gpio = (XGpioPs *)CallBackRef;
//	u32 DataRead;
//
//	/* Push the switch button */
//	DataRead = XGpioPs_ReadPin(Gpio, Input_Pin);
//	if (DataRead != 0) {
//		XGpioPs_SetDirectionPin(Gpio, Output_Pin, 1);
//		XGpioPs_SetOutputEnablePin(Gpio, Output_Pin, 1);
//		XGpioPs_WritePin(Gpio, Output_Pin, DataRead);
//		AllButtonsPressed = TRUE;
//	}
}

