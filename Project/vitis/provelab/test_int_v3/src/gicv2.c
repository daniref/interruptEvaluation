#include "gicv2.h"


#include "stdio.h"
#include "xil_exception.h"
#include "utility.h"
#include "generic_timer.h"

#include "ps_gpio.h"
#include "xgpiops.h"
#include "xstatus.h"
//#include "axi_gpio.h"


#define PL_PS_IRQID 			89U
#define GIC_CPU_BASE_ADDR		0xF9020000LU
#define GIC_DIS_BASE_ADDR 		0xF9010000LU

uint64_t final_time[NUM_EXP];
uint32_t timestamp_index;

static XScuGic GicInstancePtr; /* The Instance of the Interrupt Controller Driver */
static void IntrHandler(void *CallBackRef, u32 Bank, u32 Status);


static void IntrHandler(void *CallBackRef, u32 Bank, u32 Status)
{
	XGpioPs *Gpio = (XGpioPs *)CallBackRef;
	u32 DataRead;

	/* Push the switch button */
	DataRead = XGpioPs_ReadPin(Gpio, INT_SIGN_IN);
	if (DataRead != 0) {
		XGpioPs_SetDirectionPin(Gpio, EXT_SIGN_OUT, 1);
		XGpioPs_SetOutputEnablePin(Gpio, EXT_SIGN_OUT, 1);
		XGpioPs_WritePin(Gpio, EXT_SIGN_OUT, DataRead);
//		AllButtonsPressed = TRUE;
	}
}


void gpio_isr_callback(void)
{
	final_time[timestamp_index] = getTime();
//	GpioWrite((u32* const)GPIO_EXT_OUTPUT_ADDR,3);
	PSGpioWrite(EXT_SIGN_OUT,0x1);
	PSGpioWrite(EXT_LED_OUT,0x1);

	sleepms(500);
//	printf("La ISR è stata servita\r\n");
//	sleep(1);
//	GpioWrite((u32* const)GPIO_EXT_OUTPUT_ADDR,0);
//	GpioWrite((u32* const)GPIO_INT_SOURCE_ADDR,0);

	   PSGpioWrite(EXT_SIGN_OUT,0x0);
		PSGpioWrite(EXT_LED_OUT,0x0);
	   PSGpioWrite(INT_SIGN_OUT,0x0);
	   PSGpioWrite(INT_LED_OUT,0x0);
	timestamp_index++;
}

void GicInitialize(void)
{
	int Status;

	XScuGic_Config *IntcConfig; /* Instance of the interrupt controller */
	XGpioPs* Gpio = get_gpio_controller();

	Xil_ExceptionInit();

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(0);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(&GicInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
				&GicInstancePtr);

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XScuGic_Connect(&GicInstancePtr, GPIO_INTERR_ID,
				(Xil_ExceptionHandler)XGpioPs_IntrHandler,
				(void *)Gpio);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	/* Enable falling edge interrupts for all the pins in GPIO bank. */
	XGpioPs_SetIntrType(Gpio, GPIO_BANK, 0xFFFF, 0xFFFFFFFF, 0x00);

	/* Set the handler for gpio interrupts. */
	XGpioPs_SetCallbackHandler(Gpio, (void *)Gpio, gpio_isr_callback);


	/* Enable the GPIO interrupts of GPIO Bank. */
	XGpioPs_IntrEnable(Gpio, GPIO_BANK, (1 << 0));


	/* Enable the interrupt for the GPIO device. */
	XScuGic_Enable(&GicInstancePtr, GPIO_INTERR_ID);

	XGpioPs_IntrClear(Gpio, GPIO_BANK,
			(1 << 0));


	/* Enable interrupts in the Processor. */
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);

	return XST_SUCCESS;
}
