   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
4221                     	bsct
4222  0000               _LT8900_Recv_Len:
4223  0000 00            	dc.b	0
4224  0001               _LT8900_Send_Buffer:
4225  0001 aa            	dc.b	170
4226  0002 00            	dc.b	0
4227  0003 00            	dc.b	0
4228  0004 bb            	dc.b	187
4229  0005 000000000000  	ds.b	16
4230  0015               _LT8900_Send_Len:
4231  0015 04            	dc.b	4
4284                     ; 12 void LT8900_init(void)
4284                     ; 13 {
4286                     	switch	.text
4287  0000               _LT8900_init:
4291                     ; 14 		LT8900_Pin_init();
4293  0000 cd01a7        	call	_LT8900_Pin_init
4295                     ; 15 		LT8900_RST = 0;
4297  0003 7219500a      	bres	_PC4_ODR
4298                     ; 16     delay_ms(100);
4300  0007 ae0064        	ldw	x,#100
4301  000a cd0000        	call	_delay_ms
4303                     ; 17     LT8900_RST = 1;
4305  000d 7218500a      	bset	_PC4_ODR
4306                     ; 18     delay_ms(200);
4308  0011 ae00c8        	ldw	x,#200
4309  0014 cd0000        	call	_delay_ms
4311                     ; 20     LT8900_Write_REG(0, 0x6f, 0xe0);
4313  0017 4be0          	push	#224
4314  0019 ae006f        	ldw	x,#111
4315  001c 4f            	clr	a
4316  001d 95            	ld	xh,a
4317  001e cd01f2        	call	_LT8900_Write_REG
4319  0021 84            	pop	a
4320                     ; 21     LT8900_Write_REG(1, 0x56, 0x81);  
4322  0022 4b81          	push	#129
4323  0024 ae0056        	ldw	x,#86
4324  0027 a601          	ld	a,#1
4325  0029 95            	ld	xh,a
4326  002a cd01f2        	call	_LT8900_Write_REG
4328  002d 84            	pop	a
4329                     ; 22     LT8900_Write_REG(2, 0x66, 0x17);  
4331  002e 4b17          	push	#23
4332  0030 ae0066        	ldw	x,#102
4333  0033 a602          	ld	a,#2
4334  0035 95            	ld	xh,a
4335  0036 cd01f2        	call	_LT8900_Write_REG
4337  0039 84            	pop	a
4338                     ; 23     LT8900_Write_REG(4, 0x9c, 0xc9);  
4340  003a 4bc9          	push	#201
4341  003c ae009c        	ldw	x,#156
4342  003f a604          	ld	a,#4
4343  0041 95            	ld	xh,a
4344  0042 cd01f2        	call	_LT8900_Write_REG
4346  0045 84            	pop	a
4347                     ; 24     LT8900_Write_REG(5, 0x66, 0x37);  
4349  0046 4b37          	push	#55
4350  0048 ae0066        	ldw	x,#102
4351  004b a605          	ld	a,#5
4352  004d 95            	ld	xh,a
4353  004e cd01f2        	call	_LT8900_Write_REG
4355  0051 84            	pop	a
4356                     ; 25     LT8900_Write_REG(7, 0x00, 0x00);  
4358  0052 4b00          	push	#0
4359  0054 5f            	clrw	x
4360  0055 a607          	ld	a,#7
4361  0057 95            	ld	xh,a
4362  0058 cd01f2        	call	_LT8900_Write_REG
4364  005b 84            	pop	a
4365                     ; 26     LT8900_Write_REG(8, 0x6c, 0x90);
4367  005c 4b90          	push	#144
4368  005e ae006c        	ldw	x,#108
4369  0061 a608          	ld	a,#8
4370  0063 95            	ld	xh,a
4371  0064 cd01f2        	call	_LT8900_Write_REG
4373  0067 84            	pop	a
4374                     ; 27     LT8900_Write_REG(9, 0x48, 0x00);				// 5.5dBm
4376  0068 4b00          	push	#0
4377  006a ae0048        	ldw	x,#72
4378  006d a609          	ld	a,#9
4379  006f 95            	ld	xh,a
4380  0070 cd01f2        	call	_LT8900_Write_REG
4382  0073 84            	pop	a
4383                     ; 28     LT8900_Write_REG(10, 0x7f, 0xfd);
4385  0074 4bfd          	push	#253
4386  0076 ae007f        	ldw	x,#127
4387  0079 a60a          	ld	a,#10
4388  007b 95            	ld	xh,a
4389  007c cd01f2        	call	_LT8900_Write_REG
4391  007f 84            	pop	a
4392                     ; 29     LT8900_Write_REG(11, 0x00, 0x08);
4394  0080 4b08          	push	#8
4395  0082 5f            	clrw	x
4396  0083 a60b          	ld	a,#11
4397  0085 95            	ld	xh,a
4398  0086 cd01f2        	call	_LT8900_Write_REG
4400  0089 84            	pop	a
4401                     ; 30     LT8900_Write_REG(12, 0x00, 0x00);
4403  008a 4b00          	push	#0
4404  008c 5f            	clrw	x
4405  008d a60c          	ld	a,#12
4406  008f 95            	ld	xh,a
4407  0090 cd01f2        	call	_LT8900_Write_REG
4409  0093 84            	pop	a
4410                     ; 31     LT8900_Write_REG(13, 0x48, 0xbd);
4412  0094 4bbd          	push	#189
4413  0096 ae0048        	ldw	x,#72
4414  0099 a60d          	ld	a,#13
4415  009b 95            	ld	xh,a
4416  009c cd01f2        	call	_LT8900_Write_REG
4418  009f 84            	pop	a
4419                     ; 33     LT8900_Write_REG(22, 0x00, 0xff);
4421  00a0 4bff          	push	#255
4422  00a2 5f            	clrw	x
4423  00a3 a616          	ld	a,#22
4424  00a5 95            	ld	xh,a
4425  00a6 cd01f2        	call	_LT8900_Write_REG
4427  00a9 84            	pop	a
4428                     ; 34     LT8900_Write_REG(23, 0x80, 0x05);
4430  00aa 4b05          	push	#5
4431  00ac ae0080        	ldw	x,#128
4432  00af a617          	ld	a,#23
4433  00b1 95            	ld	xh,a
4434  00b2 cd01f2        	call	_LT8900_Write_REG
4436  00b5 84            	pop	a
4437                     ; 35     LT8900_Write_REG(24, 0x00, 0x67);
4439  00b6 4b67          	push	#103
4440  00b8 5f            	clrw	x
4441  00b9 a618          	ld	a,#24
4442  00bb 95            	ld	xh,a
4443  00bc cd01f2        	call	_LT8900_Write_REG
4445  00bf 84            	pop	a
4446                     ; 36     LT8900_Write_REG(25, 0x16, 0x59);
4448  00c0 4b59          	push	#89
4449  00c2 ae0016        	ldw	x,#22
4450  00c5 a619          	ld	a,#25
4451  00c7 95            	ld	xh,a
4452  00c8 cd01f2        	call	_LT8900_Write_REG
4454  00cb 84            	pop	a
4455                     ; 37     LT8900_Write_REG(26, 0x19, 0xe0);
4457  00cc 4be0          	push	#224
4458  00ce ae0019        	ldw	x,#25
4459  00d1 a61a          	ld	a,#26
4460  00d3 95            	ld	xh,a
4461  00d4 cd01f2        	call	_LT8900_Write_REG
4463  00d7 84            	pop	a
4464                     ; 38     LT8900_Write_REG(27, 0x13, 0x00); //------------ 1200
4466  00d8 4b00          	push	#0
4467  00da ae0013        	ldw	x,#19
4468  00dd a61b          	ld	a,#27
4469  00df 95            	ld	xh,a
4470  00e0 cd01f2        	call	_LT8900_Write_REG
4472  00e3 84            	pop	a
4473                     ; 39     LT8900_Write_REG(28, 0x18, 0x00);
4475  00e4 4b00          	push	#0
4476  00e6 ae0018        	ldw	x,#24
4477  00e9 a61c          	ld	a,#28
4478  00eb 95            	ld	xh,a
4479  00ec cd01f2        	call	_LT8900_Write_REG
4481  00ef 84            	pop	a
4482                     ; 41     LT8900_Write_REG(32, 0x50, 0x00); //5004
4484  00f0 4b00          	push	#0
4485  00f2 ae0050        	ldw	x,#80
4486  00f5 a620          	ld	a,#32
4487  00f7 95            	ld	xh,a
4488  00f8 cd01f2        	call	_LT8900_Write_REG
4490  00fb 84            	pop	a
4491                     ; 42     LT8900_Write_REG(33, 0x3f, 0xc7);
4493  00fc 4bc7          	push	#199
4494  00fe ae003f        	ldw	x,#63
4495  0101 a621          	ld	a,#33
4496  0103 95            	ld	xh,a
4497  0104 cd01f2        	call	_LT8900_Write_REG
4499  0107 84            	pop	a
4500                     ; 43     LT8900_Write_REG(34, 0x20, 0x00);
4502  0108 4b00          	push	#0
4503  010a ae0020        	ldw	x,#32
4504  010d a622          	ld	a,#34
4505  010f 95            	ld	xh,a
4506  0110 cd01f2        	call	_LT8900_Write_REG
4508  0113 84            	pop	a
4509                     ; 44     LT8900_Write_REG(35, 0x0F, 0x00);//0300  0320
4511  0114 4b00          	push	#0
4512  0116 ae000f        	ldw	x,#15
4513  0119 a623          	ld	a,#35
4514  011b 95            	ld	xh,a
4515  011c cd01f2        	call	_LT8900_Write_REG
4517  011f 84            	pop	a
4518                     ; 45     LT8900_Write_REG(36, 0x03, 0x80);
4520  0120 4b80          	push	#128
4521  0122 ae0003        	ldw	x,#3
4522  0125 a624          	ld	a,#36
4523  0127 95            	ld	xh,a
4524  0128 cd01f2        	call	_LT8900_Write_REG
4526  012b 84            	pop	a
4527                     ; 46     LT8900_Write_REG(37, 0x03, 0x80);
4529  012c 4b80          	push	#128
4530  012e ae0003        	ldw	x,#3
4531  0131 a625          	ld	a,#37
4532  0133 95            	ld	xh,a
4533  0134 cd01f2        	call	_LT8900_Write_REG
4535  0137 84            	pop	a
4536                     ; 47     LT8900_Write_REG(38, 0x5a, 0x5a);
4538  0138 4b5a          	push	#90
4539  013a ae005a        	ldw	x,#90
4540  013d a626          	ld	a,#38
4541  013f 95            	ld	xh,a
4542  0140 cd01f2        	call	_LT8900_Write_REG
4544  0143 84            	pop	a
4545                     ; 48     LT8900_Write_REG(39, 0x03, 0x80);
4547  0144 4b80          	push	#128
4548  0146 ae0003        	ldw	x,#3
4549  0149 a627          	ld	a,#39
4550  014b 95            	ld	xh,a
4551  014c cd01f2        	call	_LT8900_Write_REG
4553  014f 84            	pop	a
4554                     ; 49     LT8900_Write_REG(40, 0x44, 0x01);
4556  0150 4b01          	push	#1
4557  0152 ae0044        	ldw	x,#68
4558  0155 a628          	ld	a,#40
4559  0157 95            	ld	xh,a
4560  0158 cd01f2        	call	_LT8900_Write_REG
4562  015b 84            	pop	a
4563                     ; 50     LT8900_Write_REG(41, 0xB8, 0x00);  //crc on scramble off ,1st byte packet length ,auto ack on
4565  015c 4b00          	push	#0
4566  015e ae00b8        	ldw	x,#184
4567  0161 a629          	ld	a,#41
4568  0163 95            	ld	xh,a
4569  0164 cd01f2        	call	_LT8900_Write_REG
4571  0167 84            	pop	a
4572                     ; 51     LT8900_Write_REG(42, 0xfd, 0xb0);  //176us
4574  0168 4bb0          	push	#176
4575  016a ae00fd        	ldw	x,#253
4576  016d a62a          	ld	a,#42
4577  016f 95            	ld	xh,a
4578  0170 cd01f2        	call	_LT8900_Write_REG
4580  0173 84            	pop	a
4581                     ; 52     LT8900_Write_REG(43, 0x00, 0x0f);
4583  0174 4b0f          	push	#15
4584  0176 5f            	clrw	x
4585  0177 a62b          	ld	a,#43
4586  0179 95            	ld	xh,a
4587  017a ad76          	call	_LT8900_Write_REG
4589  017c 84            	pop	a
4590                     ; 53     LT8900_Write_REG(50, 0x00, 0x00);
4592  017d 4b00          	push	#0
4593  017f 5f            	clrw	x
4594  0180 a632          	ld	a,#50
4595  0182 95            	ld	xh,a
4596  0183 ad6d          	call	_LT8900_Write_REG
4598  0185 84            	pop	a
4599                     ; 54 		delay_ms(200);
4601  0186 ae00c8        	ldw	x,#200
4602  0189 cd0000        	call	_delay_ms
4604                     ; 56     LT8900_Write_REG(7, 0x01, 0x00);
4606  018c 4b00          	push	#0
4607  018e ae0001        	ldw	x,#1
4608  0191 a607          	ld	a,#7
4609  0193 95            	ld	xh,a
4610  0194 ad5c          	call	_LT8900_Write_REG
4612  0196 84            	pop	a
4613                     ; 57 		delay_ms(2);
4615  0197 ae0002        	ldw	x,#2
4616  019a cd0000        	call	_delay_ms
4618                     ; 58     LT8900_Write_REG(7, 0x00, 0x30);
4620  019d 4b30          	push	#48
4621  019f 5f            	clrw	x
4622  01a0 a607          	ld	a,#7
4623  01a2 95            	ld	xh,a
4624  01a3 ad4d          	call	_LT8900_Write_REG
4626  01a5 84            	pop	a
4627                     ; 59 }
4630  01a6 81            	ret
4660                     ; 62 void LT8900_Pin_init(void)
4660                     ; 63 {
4661                     	switch	.text
4662  01a7               _LT8900_Pin_init:
4666                     ; 64 		PC3_DDR=0; //PKT
4668  01a7 7217500c      	bres	_PC3_DDR
4669                     ; 65 		PC3_CR1=1;
4671  01ab 7216500d      	bset	_PC3_CR1
4672                     ; 66 		PC3_CR2=0;
4674  01af 7217500e      	bres	_PC3_CR2
4675                     ; 68 		PC4_DDR=1; //RST
4677  01b3 7218500c      	bset	_PC4_DDR
4678                     ; 69 		PC4_CR1=1;
4680  01b7 7218500d      	bset	_PC4_CR1
4681                     ; 70 		PC4_CR2=0;
4683  01bb 7219500e      	bres	_PC4_CR2
4684                     ; 71 		PC4_ODR=1;
4686  01bf 7218500a      	bset	_PC4_ODR
4687                     ; 72 }
4690  01c3 81            	ret
4736                     ; 74 u16 LT8900_Read_REG(unsigned char reg)
4736                     ; 75 {
4737                     	switch	.text
4738  01c4               _LT8900_Read_REG:
4740  01c4 89            	pushw	x
4741       00000002      OFST:	set	2
4744                     ; 77 		SS = 0;
4746  01c5 72195005      	bres	_PB4_ODR
4747                     ; 78 		SPI_SendByte(LT8900_READ | reg);
4749  01c9 aa80          	or	a,#128
4750  01cb cd0000        	call	_SPI_SendByte
4752                     ; 79 		temp = SPI_ReadByte();
4754  01ce cd0000        	call	_SPI_ReadByte
4756  01d1 5f            	clrw	x
4757  01d2 97            	ld	xl,a
4758  01d3 1f01          	ldw	(OFST-1,sp),x
4759                     ; 80 		temp = temp << 8;
4761  01d5 7b02          	ld	a,(OFST+0,sp)
4762  01d7 6b01          	ld	(OFST-1,sp),a
4763  01d9 0f02          	clr	(OFST+0,sp)
4764                     ; 81 		temp |= SPI_ReadByte();
4766  01db cd0000        	call	_SPI_ReadByte
4768  01de 5f            	clrw	x
4769  01df 97            	ld	xl,a
4770  01e0 01            	rrwa	x,a
4771  01e1 1a02          	or	a,(OFST+0,sp)
4772  01e3 01            	rrwa	x,a
4773  01e4 1a01          	or	a,(OFST-1,sp)
4774  01e6 01            	rrwa	x,a
4775  01e7 1f01          	ldw	(OFST-1,sp),x
4776                     ; 82 		SS = 1;
4778  01e9 72185005      	bset	_PB4_ODR
4779                     ; 83 		return temp;
4781  01ed 1e01          	ldw	x,(OFST-1,sp)
4784  01ef 5b02          	addw	sp,#2
4785  01f1 81            	ret
4839                     ; 86 void LT8900_Write_REG(unsigned char reg, unsigned char byteH, unsigned char byteL)
4839                     ; 87 {
4840                     	switch	.text
4841  01f2               _LT8900_Write_REG:
4843  01f2 89            	pushw	x
4844       00000000      OFST:	set	0
4847                     ; 88 		SS = 0;
4849  01f3 72195005      	bres	_PB4_ODR
4850                     ; 89 		SPI_SendByte(LT8900_WRITE & reg);
4852  01f7 9e            	ld	a,xh
4853  01f8 a47f          	and	a,#127
4854  01fa cd0000        	call	_SPI_SendByte
4856                     ; 90 		SPI_SendByte(byteH);
4858  01fd 7b02          	ld	a,(OFST+2,sp)
4859  01ff cd0000        	call	_SPI_SendByte
4861                     ; 91 		SPI_SendByte(byteL);
4863  0202 7b05          	ld	a,(OFST+5,sp)
4864  0204 cd0000        	call	_SPI_SendByte
4866                     ; 92 		SS = 1;
4868  0207 72185005      	bset	_PB4_ODR
4869                     ; 93 }
4872  020b 85            	popw	x
4873  020c 81            	ret
4911                     ; 95 void LT8900_Send_Date(void)
4911                     ; 96 {
4912                     	switch	.text
4913  020d               _LT8900_Send_Date:
4915  020d 88            	push	a
4916       00000001      OFST:	set	1
4919                     ; 98 		LT8900_Write_REG(7, 0x00, 0x00);			  // 2402 + 48 = 2.45GHz
4921  020e 4b00          	push	#0
4922  0210 5f            	clrw	x
4923  0211 a607          	ld	a,#7
4924  0213 95            	ld	xh,a
4925  0214 addc          	call	_LT8900_Write_REG
4927  0216 84            	pop	a
4928                     ; 99 		LT8900_Write_REG(52, 0x80, 0x00);				// 清空发送缓存区	
4930  0217 4b00          	push	#0
4931  0219 ae0080        	ldw	x,#128
4932  021c a634          	ld	a,#52
4933  021e 95            	ld	xh,a
4934  021f add1          	call	_LT8900_Write_REG
4936  0221 84            	pop	a
4937                     ; 102 		LT8900_Write_REG(50, LT8900_Send_Len, LT8900_Send_Buffer[0]);
4939  0222 3b0001        	push	_LT8900_Send_Buffer
4940  0225 b615          	ld	a,_LT8900_Send_Len
4941  0227 97            	ld	xl,a
4942  0228 a632          	ld	a,#50
4943  022a 95            	ld	xh,a
4944  022b adc5          	call	_LT8900_Write_REG
4946  022d 84            	pop	a
4947                     ; 103 		for(i = 2; i <= LT8900_Send_Len ; i+=2)
4949  022e a602          	ld	a,#2
4950  0230 6b01          	ld	(OFST+0,sp),a
4952  0232 2019          	jra	L5303
4953  0234               L1303:
4954                     ; 104 				LT8900_Write_REG(50,LT8900_Send_Buffer[i-1], LT8900_Send_Buffer[i]);
4956  0234 7b01          	ld	a,(OFST+0,sp)
4957  0236 5f            	clrw	x
4958  0237 97            	ld	xl,a
4959  0238 e601          	ld	a,(_LT8900_Send_Buffer,x)
4960  023a 88            	push	a
4961  023b 7b02          	ld	a,(OFST+1,sp)
4962  023d 5f            	clrw	x
4963  023e 97            	ld	xl,a
4964  023f 5a            	decw	x
4965  0240 e601          	ld	a,(_LT8900_Send_Buffer,x)
4966  0242 97            	ld	xl,a
4967  0243 a632          	ld	a,#50
4968  0245 95            	ld	xh,a
4969  0246 adaa          	call	_LT8900_Write_REG
4971  0248 84            	pop	a
4972                     ; 103 		for(i = 2; i <= LT8900_Send_Len ; i+=2)
4974  0249 0c01          	inc	(OFST+0,sp)
4975  024b 0c01          	inc	(OFST+0,sp)
4976  024d               L5303:
4979  024d 7b01          	ld	a,(OFST+0,sp)
4980  024f b115          	cp	a,_LT8900_Send_Len
4981  0251 23e1          	jrule	L1303
4982                     ; 106 		LT8900_Write_REG(7, 0x01, 0x30);				// 允许发射使能
4984  0253 4b30          	push	#48
4985  0255 ae0001        	ldw	x,#1
4986  0258 a607          	ld	a,#7
4987  025a 95            	ld	xh,a
4988  025b ad95          	call	_LT8900_Write_REG
4990  025d 84            	pop	a
4992  025e               L3403:
4993                     ; 108 		while (LT8900_PKT == 0);
4995                     	btst	_PC3_IDR
4996  0263 24f9          	jruge	L3403
4997                     ; 109 }
5000  0265 84            	pop	a
5001  0266 81            	ret
5025                     ; 111 void LT8900_Config(void)
5025                     ; 112 {
5026                     	switch	.text
5027  0267               _LT8900_Config:
5031                     ; 113 		LT8900_Write_REG(32,0x48,0x00);   // 
5033  0267 4b00          	push	#0
5034  0269 ae0048        	ldw	x,#72
5035  026c a620          	ld	a,#32
5036  026e 95            	ld	xh,a
5037  026f ad81          	call	_LT8900_Write_REG
5039  0271 84            	pop	a
5040                     ; 114 		LT8900_Write_REG(34, 0x20, 0x00); //传输CW调制信号的时间 
5042  0272 4b00          	push	#0
5043  0274 ae0020        	ldw	x,#32
5044  0277 a622          	ld	a,#34
5045  0279 95            	ld	xh,a
5046  027a cd01f2        	call	_LT8900_Write_REG
5048  027d 84            	pop	a
5049                     ; 115 		LT8900_Write_REG(11, 0x00, 0x08); // 关闭RSSI
5051  027e 4b08          	push	#8
5052  0280 5f            	clrw	x
5053  0281 a60b          	ld	a,#11
5054  0283 95            	ld	xh,a
5055  0284 cd01f2        	call	_LT8900_Write_REG
5057  0287 84            	pop	a
5058                     ; 116 }
5061  0288 81            	ret
5087                     ; 118 void LT8900_Set_Recv_Mode(void)
5087                     ; 119 {
5088                     	switch	.text
5089  0289               _LT8900_Set_Recv_Mode:
5093                     ; 120 		LT8900_Write_REG(7, 0x00, 0x30);
5095  0289 4b30          	push	#48
5096  028b 5f            	clrw	x
5097  028c a607          	ld	a,#7
5098  028e 95            	ld	xh,a
5099  028f cd01f2        	call	_LT8900_Write_REG
5101  0292 84            	pop	a
5102                     ; 121 		delay_ms(3);
5104  0293 ae0003        	ldw	x,#3
5105  0296 cd0000        	call	_delay_ms
5107                     ; 122 		LT8900_Write_REG(52, 0x00, 0x80);			// 清接收缓存区
5109  0299 4b80          	push	#128
5110  029b 5f            	clrw	x
5111  029c a634          	ld	a,#52
5112  029e 95            	ld	xh,a
5113  029f cd01f2        	call	_LT8900_Write_REG
5115  02a2 84            	pop	a
5116                     ; 123 		LT8900_Write_REG(7, 0x00, 0xB0);				// 允许接收使能
5118  02a3 4bb0          	push	#176
5119  02a5 5f            	clrw	x
5120  02a6 a607          	ld	a,#7
5121  02a8 95            	ld	xh,a
5122  02a9 cd01f2        	call	_LT8900_Write_REG
5124  02ac 84            	pop	a
5125                     ; 124 		delay_ms(5);					
5127  02ad ae0005        	ldw	x,#5
5128  02b0 cd0000        	call	_delay_ms
5130                     ; 125 }
5133  02b3 81            	ret
5182                     ; 127 void LT8900_Recv_Data(void)
5182                     ; 128 {
5183                     	switch	.text
5184  02b4               _LT8900_Recv_Data:
5186  02b4 5203          	subw	sp,#3
5187       00000003      OFST:	set	3
5190                     ; 131 		if (1 == LT8900_PKT)
5192                     	btst	_PC3_IDR
5193  02bb 2472          	jruge	L1113
5194                     ; 133 			temp = LT8900_Read_REG(48); // Read CRC result
5196  02bd a630          	ld	a,#48
5197  02bf cd01c4        	call	_LT8900_Read_REG
5199  02c2 1f02          	ldw	(OFST-1,sp),x
5200                     ; 134 			if (0x0000 == (temp & 0x8000))
5202  02c4 7b02          	ld	a,(OFST-1,sp)
5203  02c6 a580          	bcp	a,#128
5204  02c8 263d          	jrne	L3113
5205                     ; 136 					temp = LT8900_Read_REG(50);
5207  02ca a632          	ld	a,#50
5208  02cc cd01c4        	call	_LT8900_Read_REG
5210  02cf 1f02          	ldw	(OFST-1,sp),x
5211                     ; 137 					LT8900_Recv_Len = temp >> 8;
5213  02d1 7b02          	ld	a,(OFST-1,sp)
5214  02d3 b700          	ld	_LT8900_Recv_Len,a
5215                     ; 138 					LT8900_Recv_Buffer[0] = temp & 0x00FF;
5217  02d5 7b03          	ld	a,(OFST+0,sp)
5218  02d7 a4ff          	and	a,#255
5219  02d9 b700          	ld	_LT8900_Recv_Buffer,a
5220                     ; 139 					for(i = 2;i <= LT8900_Recv_Len; i+=2)
5222  02db a602          	ld	a,#2
5223  02dd 6b01          	ld	(OFST-2,sp),a
5225  02df 201e          	jra	L1213
5226  02e1               L5113:
5227                     ; 141 						temp = LT8900_Read_REG(50);
5229  02e1 a632          	ld	a,#50
5230  02e3 cd01c4        	call	_LT8900_Read_REG
5232  02e6 1f02          	ldw	(OFST-1,sp),x
5233                     ; 142 						LT8900_Recv_Buffer[i-1] = temp >> 8;
5235  02e8 7b01          	ld	a,(OFST-2,sp)
5236  02ea 5f            	clrw	x
5237  02eb 97            	ld	xl,a
5238  02ec 5a            	decw	x
5239  02ed 7b02          	ld	a,(OFST-1,sp)
5240  02ef e700          	ld	(_LT8900_Recv_Buffer,x),a
5241                     ; 143 						LT8900_Recv_Buffer[i] = temp & 0x00FF;
5243  02f1 7b01          	ld	a,(OFST-2,sp)
5244  02f3 5f            	clrw	x
5245  02f4 97            	ld	xl,a
5246  02f5 7b03          	ld	a,(OFST+0,sp)
5247  02f7 a4ff          	and	a,#255
5248  02f9 e700          	ld	(_LT8900_Recv_Buffer,x),a
5249                     ; 139 					for(i = 2;i <= LT8900_Recv_Len; i+=2)
5251  02fb 0c01          	inc	(OFST-2,sp)
5252  02fd 0c01          	inc	(OFST-2,sp)
5253  02ff               L1213:
5256  02ff 7b01          	ld	a,(OFST-2,sp)
5257  0301 b100          	cp	a,_LT8900_Recv_Len
5258  0303 23dc          	jrule	L5113
5260  0305 2014          	jra	L5213
5261  0307               L3113:
5262                     ; 148 					UART1_SendChar(0xFF);
5264  0307 a6ff          	ld	a,#255
5265  0309 cd0000        	call	_UART1_SendChar
5267                     ; 149 					UART1_SendChar(0xFF);
5269  030c a6ff          	ld	a,#255
5270  030e cd0000        	call	_UART1_SendChar
5272                     ; 150 					UART1_SendChar(0xFF);
5274  0311 a6ff          	ld	a,#255
5275  0313 cd0000        	call	_UART1_SendChar
5277                     ; 151 					UART1_SendChar(0xFF);
5279  0316 a6ff          	ld	a,#255
5280  0318 cd0000        	call	_UART1_SendChar
5282  031b               L5213:
5283                     ; 153 			LT8900_Write_REG(52, 0x00, 0x80); 
5285  031b 4b80          	push	#128
5286  031d 5f            	clrw	x
5287  031e a634          	ld	a,#52
5288  0320 95            	ld	xh,a
5289  0321 cd01f2        	call	_LT8900_Write_REG
5291  0324 84            	pop	a
5292                     ; 154 			LT8900_Write_REG(7, 0x00, 0XB0);
5294  0325 4bb0          	push	#176
5295  0327 5f            	clrw	x
5296  0328 a607          	ld	a,#7
5297  032a 95            	ld	xh,a
5298  032b cd01f2        	call	_LT8900_Write_REG
5300  032e 84            	pop	a
5301  032f               L1113:
5302                     ; 156 }
5305  032f 5b03          	addw	sp,#3
5306  0331 81            	ret
5359                     	xref	_UART1_SendChar
5360                     	xdef	_LT8900_Send_Len
5361                     	xdef	_LT8900_Send_Buffer
5362                     	xdef	_LT8900_Recv_Len
5363                     	switch	.ubsct
5364  0000               _LT8900_Recv_Buffer:
5365  0000 000000000000  	ds.b	20
5366                     	xdef	_LT8900_Recv_Buffer
5367                     	xdef	_LT8900_Set_Recv_Mode
5368                     	xdef	_LT8900_Recv_Data
5369                     	xdef	_LT8900_Send_Date
5370                     	xdef	_LT8900_Config
5371                     	xdef	_LT8900_Pin_init
5372                     	xdef	_LT8900_Write_REG
5373                     	xdef	_LT8900_Read_REG
5374                     	xdef	_LT8900_init
5375                     	xref	_delay_ms
5376                     	xref	_SPI_SendByte
5377                     	xref	_SPI_ReadByte
5397                     	end
