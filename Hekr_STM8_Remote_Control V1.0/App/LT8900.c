#include "stm8_spi.h"
#include "delay.h"
#include "sys.h"
#include "lt8900.h"
#include "stm8_uart.h"

u8 LT8900_Recv_Buffer[MAXSize];
u8 LT8900_Recv_Len = 0;
u8 LT8900_Send_Buffer[MAXSize] = {0xAA,0X00,0X00,0xBB};
u8 LT8900_Send_Len = 4;

void LT8900_init(void)
{
		LT8900_Pin_init();
		LT8900_RST = 0;
    delay_ms(100);
    LT8900_RST = 1;
    delay_ms(200);
   
    LT8900_Write_REG(0, 0x6f, 0xe0);
    LT8900_Write_REG(1, 0x56, 0x81);  
    LT8900_Write_REG(2, 0x66, 0x17);  
    LT8900_Write_REG(4, 0x9c, 0xc9);  
    LT8900_Write_REG(5, 0x66, 0x37);  
    LT8900_Write_REG(7, 0x00, 0x00);  
    LT8900_Write_REG(8, 0x6c, 0x90);
    LT8900_Write_REG(9, 0x48, 0x00);				// 5.5dBm
    LT8900_Write_REG(10, 0x7f, 0xfd);
    LT8900_Write_REG(11, 0x00, 0x08);
    LT8900_Write_REG(12, 0x00, 0x00);
    LT8900_Write_REG(13, 0x48, 0xbd);
    
    LT8900_Write_REG(22, 0x00, 0xff);
    LT8900_Write_REG(23, 0x80, 0x05);
    LT8900_Write_REG(24, 0x00, 0x67);
    LT8900_Write_REG(25, 0x16, 0x59);
    LT8900_Write_REG(26, 0x19, 0xe0);
    LT8900_Write_REG(27, 0x13, 0x00); //------------ 1200
    LT8900_Write_REG(28, 0x18, 0x00);
    
    LT8900_Write_REG(32, 0x50, 0x00); //5004
    LT8900_Write_REG(33, 0x3f, 0xc7);
    LT8900_Write_REG(34, 0x20, 0x00);
    LT8900_Write_REG(35, 0x0F, 0x00);//0300  0320
    LT8900_Write_REG(36, 0x03, 0x80);
    LT8900_Write_REG(37, 0x03, 0x80);
    LT8900_Write_REG(38, 0x5a, 0x5a);
    LT8900_Write_REG(39, 0x03, 0x80);
    LT8900_Write_REG(40, 0x44, 0x01);
    LT8900_Write_REG(41, 0xB8, 0x00);  //crc on scramble off ,1st byte packet length ,auto ack on
    LT8900_Write_REG(42, 0xfd, 0xb0);  //176us
    LT8900_Write_REG(43, 0x00, 0x0f);
    LT8900_Write_REG(50, 0x00, 0x00);
		delay_ms(200);
	
    LT8900_Write_REG(7, 0x01, 0x00);
		delay_ms(2);
    LT8900_Write_REG(7, 0x00, 0x30);
}


void LT8900_Pin_init(void)
{
		PC3_DDR=0; //PKT
		PC3_CR1=1;
		PC3_CR2=0;
		
		PC4_DDR=1; //RST
		PC4_CR1=1;
		PC4_CR2=0;
		PC4_ODR=1;
}

u16 LT8900_Read_REG(unsigned char reg)
{
		u16 temp;
		SS = 0;
		SPI_SendByte(LT8900_READ | reg);
		temp = SPI_ReadByte();
		temp = temp << 8;
		temp |= SPI_ReadByte();
		SS = 1;
		return temp;
}

void LT8900_Write_REG(unsigned char reg, unsigned char byteH, unsigned char byteL)
{
		SS = 0;
		SPI_SendByte(LT8900_WRITE & reg);
		SPI_SendByte(byteH);
		SPI_SendByte(byteL);
		SS = 1;
}

void LT8900_Send_Date(void)
{
		u8 i;
		LT8900_Write_REG(7, 0x00, 0x00);			  // 2402 + 48 = 2.45GHz
		LT8900_Write_REG(52, 0x80, 0x00);				// 清空发送缓存区	

		// 发送LT8900_Send_Len + 1个字节
		LT8900_Write_REG(50, LT8900_Send_Len, LT8900_Send_Buffer[0]);
		for(i = 2; i <= LT8900_Send_Len ; i+=2)
				LT8900_Write_REG(50,LT8900_Send_Buffer[i-1], LT8900_Send_Buffer[i]);

		LT8900_Write_REG(7, 0x01, 0x30);				// 允许发射使能
		
		while (LT8900_PKT == 0);
}

void LT8900_Config(void)
{
		LT8900_Write_REG(32,0x48,0x00);   // 
		LT8900_Write_REG(34, 0x20, 0x00); //传输CW调制信号的时间 
		LT8900_Write_REG(11, 0x00, 0x08); // 关闭RSSI
}

void LT8900_Set_Recv_Mode(void)
{
		LT8900_Write_REG(7, 0x00, 0x30);
		delay_ms(3);
		LT8900_Write_REG(52, 0x00, 0x80);			// 清接收缓存区
		LT8900_Write_REG(7, 0x00, 0xB0);				// 允许接收使能
		delay_ms(5);					
}

void LT8900_Recv_Data(void)
{
		u16 temp;
		u8 i;
		if (1 == LT8900_PKT)
		{
			temp = LT8900_Read_REG(48); // Read CRC result
			if (0x0000 == (temp & 0x8000))
			{
					temp = LT8900_Read_REG(50);
					LT8900_Recv_Len = temp >> 8;
					LT8900_Recv_Buffer[0] = temp & 0x00FF;
					for(i = 2;i <= LT8900_Recv_Len; i+=2)
					{
						temp = LT8900_Read_REG(50);
						LT8900_Recv_Buffer[i-1] = temp >> 8;
						LT8900_Recv_Buffer[i] = temp & 0x00FF;
					}
			}
			else
			{
					UART1_SendChar(0xFF);
					UART1_SendChar(0xFF);
					UART1_SendChar(0xFF);
					UART1_SendChar(0xFF);
			}
			LT8900_Write_REG(52, 0x00, 0x80); 
			LT8900_Write_REG(7, 0x00, 0XB0);
		}				
}
