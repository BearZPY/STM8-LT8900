   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
4271                     ; 5 void SPI_init(void)
4271                     ; 6 {
4273                     	switch	.text
4274  0000               _SPI_init:
4278                     ; 8 	SPI_CR1 = 0x1D;
4280  0000 351d5200      	mov	_SPI_CR1,#29
4281                     ; 9 	SPI_CR2 = 0x03;
4283  0004 35035201      	mov	_SPI_CR2,#3
4284                     ; 10 	SPI_CR1 |= 0x40;
4286  0008 721c5200      	bset	_SPI_CR1,#6
4287                     ; 12 	SPI_CS_init();
4289  000c ad1d          	call	L3651_SPI_CS_init
4291                     ; 15 	PC_DDR |= 1 << 5;
4293  000e 721a500c      	bset	_PC_DDR,#5
4294                     ; 16 	PC_CR1 |= 1 << 5;
4296  0012 721a500d      	bset	_PC_CR1,#5
4297                     ; 17 	PC_CR2 |= 1 << 5;
4299  0016 721a500e      	bset	_PC_CR2,#5
4300                     ; 18 	PC_DDR |= 1 << 6;
4302  001a 721c500c      	bset	_PC_DDR,#6
4303                     ; 19 	PC_CR1 |= 1 << 6;
4305  001e 721c500d      	bset	_PC_CR1,#6
4306                     ; 20 	PC_CR2 |= 1 << 6;
4308  0022 721c500e      	bset	_PC_CR2,#6
4309                     ; 21 	PC_CR1 |= 1 << 7;
4311  0026 721e500d      	bset	_PC_CR1,#7
4312                     ; 23 }
4315  002a 81            	ret
4342                     ; 25 static void SPI_CS_init(void)
4342                     ; 26 {
4343                     	switch	.text
4344  002b               L3651_SPI_CS_init:
4348                     ; 27 	PB4_DDR=1;
4350  002b 72185007      	bset	_PB4_DDR
4351                     ; 28 	PB4_CR1=1;
4353  002f 72185008      	bset	_PB4_CR1
4354                     ; 29 	PB4_CR2=0;
4356  0033 72195009      	bres	_PB4_CR2
4357                     ; 30 	PB4_ODR=1;
4359  0037 72185005      	bset	_PB4_ODR
4360                     ; 31 }
4363  003b 81            	ret
4387                     ; 36 unsigned char SPI_ReadByte(void)
4387                     ; 37 {
4388                     	switch	.text
4389  003c               _SPI_ReadByte:
4393                     ; 38 	return (SPI_SendByte(0xFF));        
4395  003c a6ff          	ld	a,#255
4396  003e ad01          	call	_SPI_SendByte
4400  0040 81            	ret
4445                     ; 45 unsigned char SPI_SendByte(unsigned char spi_send_byte)
4445                     ; 46 {
4446                     	switch	.text
4447  0041               _SPI_SendByte:
4449  0041 88            	push	a
4450  0042 88            	push	a
4451       00000001      OFST:	set	1
4454                     ; 47 	unsigned char TimeOut=0xff;
4456  0043 a6ff          	ld	a,#255
4457  0045 6b01          	ld	(OFST+0,sp),a
4459  0047               L1003:
4460                     ; 48   while(((SPI_SR & (1<<1))==0x00)&&TimeOut--);
4462  0047 c65203        	ld	a,_SPI_SR
4463  004a a502          	bcp	a,#2
4464  004c 2607          	jrne	L5003
4466  004e 7b01          	ld	a,(OFST+0,sp)
4467  0050 0a01          	dec	(OFST+0,sp)
4468  0052 4d            	tnz	a
4469  0053 26f2          	jrne	L1003
4470  0055               L5003:
4471                     ; 49   SPI_DR=spi_send_byte;
4473  0055 7b02          	ld	a,(OFST+1,sp)
4474  0057 c75204        	ld	_SPI_DR,a
4475                     ; 51   TimeOut=0xff;
4477  005a a6ff          	ld	a,#255
4478  005c 6b01          	ld	(OFST+0,sp),a
4480  005e               L3103:
4481                     ; 52   while(((SPI_SR & (1<<0))==0x00)&&TimeOut--);
4483  005e c65203        	ld	a,_SPI_SR
4484  0061 a501          	bcp	a,#1
4485  0063 2607          	jrne	L7103
4487  0065 7b01          	ld	a,(OFST+0,sp)
4488  0067 0a01          	dec	(OFST+0,sp)
4489  0069 4d            	tnz	a
4490  006a 26f2          	jrne	L3103
4491  006c               L7103:
4492                     ; 53   return (SPI_DR);
4494  006c c65204        	ld	a,_SPI_DR
4497  006f 85            	popw	x
4498  0070 81            	ret
4511                     	xdef	_SPI_SendByte
4512                     	xdef	_SPI_ReadByte
4513                     	xdef	_SPI_init
4532                     	end
