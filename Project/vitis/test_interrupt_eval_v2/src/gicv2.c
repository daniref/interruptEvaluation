#include "gicv2.h"

#include "stdio.h"
#include "xil_exception.h"
#include "utility.h"
#include "generic_timer.h"

#include "ps_gpio.h"
//#include "axi_gpio.h"


#define PL_PS_IRQID 			89U
#define GIC_CPU_BASE_ADDR		0xF9020000LU
#define GIC_DIS_BASE_ADDR 		0xF9010000LU

uint64_t final_time[NUM_EXP];
uint32_t timestamp_index;


void gpio_isr_callback(void)
{
//	final_time[timestamp_index] = getTime();
//	GpioWrite((u32* const)GPIO_EXT_OUTPUT_ADDR,3);
	PSGpioWrite(EXT_SIGN,0x1);
	sleepms(500);
//	printf("La ISR è stata servita\r\n");
//	sleep(1);
//	GpioWrite((u32* const)GPIO_EXT_OUTPUT_ADDR,0);
//	GpioWrite((u32* const)GPIO_INT_SOURCE_ADDR,0);

	   PSGpioWrite(EXT_SIGN,0x0);
	   PSGpioWrite(INT_SIGN,0x0);
	   PSGpioWrite(INT_LED,0x0);
	timestamp_index++;
}

void GicInitialize(void)
{
	timestamp_index=0;
	Xil_ExceptionInit();

	XScuGic_DeviceInitialize(0);

	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
			(Xil_ExceptionHandler)XScuGic_DeviceInterruptHandler,
			(void *)0);

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	uint32_t* data;
	* data = 0;
	XScuGic_RegisterHandler(GIC_CPU_BASE_ADDR, PL_PS_IRQID+32,
					(Xil_ExceptionHandler)gpio_isr_callback,
					data);
	/*
	 * Enable the interrupt for gpio.
	 */
	XScuGic_EnableIntr(GIC_DIS_BASE_ADDR, PL_PS_IRQID+32);

	/*
	 * Enable non-critical exceptions.
	 */
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);
//	XScuTimer_EnableInterrupt(&TimerInstance);
//	XScuTimer_Start(&TimerInstance);

	return;

}
