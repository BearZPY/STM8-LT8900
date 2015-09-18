/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s103f.h"
#include "sys.h"
#include "delay.h"
#include "stm8_spi.h"
#include "lt8900.h"
#include "stm8_uart.h"


#define System_Run  1
#define System_Halt 0
u8 System_State = System_Halt;
u8 PD_temp;
u8 PD_Lock = 0;
u8 PA_temp;
u8 PA_Lock = 0;
void Halt_Handler(void);
void System_init(void);
void Date_Handler(void);

main()
{
	while(1)
	{
		switch(System_State)
		{
			case System_Halt:Halt_Handler();break;
			case System_Run:System_init();
											Date_Handler();
											LT8900_Send_Date();
											System_State = System_Halt;break;
			default:System_State = System_Halt;break;
		}
	}
}
 
 
 
void Halt_Handler(void)
{
	FLASH_CR1 &= ~(1 << 3);
	CLK_ICKR &= (1 << 2);
	CLK_PCKENR1 = 0x0000;
	CLK_PCKENR2 = 0x0000;
	_asm("sim");
	PA_DDR = 0xFF;PA_CR1 = 0xFF;PA_CR2 = 0x00;
	PB_DDR = 0xFF;PB_CR1 = 0xFF;PB_CR2 = 0x00;
	PC_DDR = 0xFF;PC_CR1 = 0xFF;PC_CR2 = 0x00;
	PD_DDR = 0xFF;PD_CR1 = 0xFF;PD_CR2 = 0x00;
	
	PD_DDR &= ~(1 << 2 | 1 << 4 | 1 << 5 | 1 << 6);
	PD_CR1 |= (1 << 2 | 1 << 4 | 1 << 5 | 1 << 6);
	PD_CR2 |= (1 << 2 | 1 << 4 | 1 << 5 | 1 << 6);
	PA_DDR &= ~(1 << 3);PA_CR1 |= (1 << 3);	PA_CR2 |= (1 << 3);

	PB4_DDR=1;PB4_CR1=1;PB4_CR2=0;PB4_ODR=1;	
	delay_init(16);
	EXTI_CR1 = 0x00;
	System_State = System_Halt;
	_asm("Halt");
}
 
void System_init(void)
{
	System_Clock_init();
	CLK_PCKENR1 = 0x0002;
	SPI_init();
	delay_init(16);
	LT8900_init();
	LT8900_Config();
	_asm("rim");
}

void Date_Handler(void)
{
	if(!PA_temp)
	{
		LT8900_Send_Buffer[1] = 0x01;
		goto END;
		//return ;
	}
	switch(PD_temp)
	{
	case 0x54:LT8900_Send_Buffer[1] = 0x02;LT8900_Send_Buffer[2] = 0x00;break;
	case 0x70:LT8900_Send_Buffer[1] = 0x03;LT8900_Send_Buffer[2] = 0x00;break;
	case 0x34:LT8900_Send_Buffer[1] = 0x04;LT8900_Send_Buffer[2] = 0x00;break;
	case 0x64:LT8900_Send_Buffer[1] = 0x05;LT8900_Send_Buffer[2] = 0x00;break;
	case 0x00:break;
	default:LT8900_Send_Buffer[2] = 0xFF;break;
	}
END:
	PA_temp = 0x08;
	PA_Lock = 0;
	PD_temp = 0x74;
	PD_Lock = 0;
}

@far @interrupt void PA_IRQHandler(void)
{
	if(!PA_Lock)
	{
		delay_ms(10);
		PA_temp = PA_IDR & 0x08;
		if(!PA_temp)
		{
			PA_Lock = 1;
			System_State = System_Run;
		}
	}
}

@far @interrupt void PD_IRQHandler(void)
{
	delay_ms(10);
	if(!PD_Lock)
	{
		PD_temp = PD_IDR & 0x74;
		if(PD_temp )
		{
			PD_Lock = 1;
			System_State = System_Run;
		}
	}
}

