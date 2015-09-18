#ifndef _LT8900_H_
#define _LT8900_H_

#define	IDLE		0
#define STANDBY		1
#define RECEIVE		2
#define SENDDATA	3
#define TESTPA		4
#define ACK			5
#define NO_CHANGE   255
#define MAXSize  20

#define LT8900_WRITE		0x7F
#define LT8900_READ			0x80
#define LT8900_PKT PC3_IDR
#define LT8900_RST PC4_ODR


void LT8900_init(void);
u16 LT8900_Read_REG(unsigned char reg);
void LT8900_Write_REG(unsigned char reg, unsigned char byteH, unsigned char byteL);
void LT8900_Pin_init(void);
void LT8900_Config(void);
void LT8900_Send_Date(void);
void LT8900_Recv_Data(void);
void LT8900_Set_Recv_Mode(void);

extern u8 LT8900_Recv_Buffer[MAXSize];
extern u8 LT8900_Recv_Len;
extern u8 LT8900_Send_Buffer[MAXSize];
extern u8 LT8900_Send_Len;

#endif

