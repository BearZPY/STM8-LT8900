#include "stm8s103f.h"
#include "stm8_spi.h"
#include "sys.h"

void SPI_init(void)
{
	
	SPI_CR1 = 0x1D;
	SPI_CR2 = 0x03;
	SPI_CR1 |= 0x40;

	SPI_CS_init();
	
	//端口配置为快速摆率
	PC_DDR |= 1 << 5;
	PC_CR1 |= 1 << 5;
	PC_CR2 |= 1 << 5;
	PC_DDR |= 1 << 6;
	PC_CR1 |= 1 << 6;
	PC_CR2 |= 1 << 6;
	PC_CR1 |= 1 << 7;

}

static void SPI_CS_init(void)
{
	PB4_DDR=1;
	PB4_CR1=1;
	PB4_CR2=0;
	PB4_ODR=1;
}
/*
SPI_ReadByte
接受一字节数据
*/
unsigned char SPI_ReadByte(void)
{
	return (SPI_SendByte(0xFF));        
}

/*
SPI_Send_Byte
发送一字节数据到从机
*/
unsigned char SPI_SendByte(unsigned char spi_send_byte)
{
	unsigned char TimeOut=0xff;
  while(((SPI_SR & (1<<1))==0x00)&&TimeOut--);
  SPI_DR=spi_send_byte;

  TimeOut=0xff;
  while(((SPI_SR & (1<<0))==0x00)&&TimeOut--);
  return (SPI_DR);
}
