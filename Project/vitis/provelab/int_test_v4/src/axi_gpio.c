#include "axi_gpio.h"

void GpioInit(u32* const GpioAddress)
{
	// All ports are configured as outputs
	*(GpioAddress + GPIO_TRI_OFFSET) = 0x0;

	// All outputs are 0
	*(GpioAddress + GPIO_DATA_OFFSET) = 0x0;

}

void GpioWrite(u32* const GpioAddress, const u32 value)
{

	*(GpioAddress + GPIO_DATA_OFFSET) = value;

}
