#ifndef _STM8_SPI_H
#define _STM8_SPI_H

#define SS PB4_ODR

void SPI_init(void);
unsigned char SPI_ReadByte(void);
unsigned char SPI_SendByte(unsigned char spi_send_byte);
static void SPI_CS_init(void);

#endif 
