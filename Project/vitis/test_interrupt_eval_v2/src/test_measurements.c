/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "generic_timer.h"
#include "gicv2.h"
#include "utility.h"

#include "ps_gpio.h"
//#include "axi_gpio.h"

extern uint64_t final_time[NUM_EXP];

int main () 
{
//   print("---Entering main---\n\r");

//   print("\tInitialization starts\n\r");

   uint64_t timer_value = 0;
   uint64_t init_time[NUM_EXP];


   timerEnable();
   PSGpioInit();

//   print("\tInitialization ends\n\r");

   GicInitialize();

//   printf("%d\n",NUM_EXP);
   int i = 0;

   while(i<NUM_EXP)
//   while(1)
   {
//	   GpioWrite((u32* const)GPIO_EXT_OUTPUT_ADDR,0);
	   PSGpioWrite(EXT_SIGN,0x0);
	   PSGpioWrite(EXT_LED,0x0);
	   sleepms(500);
//	   init_time[i] = getTime();
//	   GpioWrite((u32* const)GPIO_INT_SOURCE_ADDR,1);
	   PSGpioWrite(INT_SIGN,0x1);
	   PSGpioWrite(INT_LED,0x1);

	   for(int i=0; i<100;i++);
//	   sleep(1);
	   i++;
   }
//
//   printf("END TIMES:\r\n");
//   for(i = 0; i < NUM_EXP; i++)
//   {
//	   printf("%lu \n", final_time[i]);
//   }
//
//   printf("START TIMES:\r\n");
//   for(i = 0; i < NUM_EXP; i++)
//   {
//	   printf("%lu \n", init_time[i]);
//   }
//   printf("End!\r\n");
//   print("---Exiting main---\n\r");
   return 0;
}
