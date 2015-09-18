   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
4221                     	bsct
4222  0000               _System_State:
4223  0000 00            	dc.b	0
4224  0001               _PD_Lock:
4225  0001 00            	dc.b	0
4226  0002               _PA_Lock:
4227  0002 00            	dc.b	0
4281                     ; 25 main()
4281                     ; 26 {
4283                     	switch	.text
4284  0000               _main:
4288  0000               L1472:
4289                     ; 29 		switch(System_State)
4291  0000 b600          	ld	a,_System_State
4293                     ; 36 			default:System_State = System_Halt;break;
4294  0002 4d            	tnz	a
4295  0003 2707          	jreq	L5172
4296  0005 4a            	dec	a
4297  0006 2708          	jreq	L7172
4298  0008               L1272:
4301  0008 3f00          	clr	_System_State
4304  000a 20f4          	jra	L1472
4305  000c               L5172:
4306                     ; 31 			case System_Halt:Halt_Handler();break;
4308  000c ad11          	call	_Halt_Handler
4312  000e 20f0          	jra	L1472
4313  0010               L7172:
4314                     ; 32 			case System_Run:System_init();
4316  0010 cd00a5        	call	_System_init
4318                     ; 33 											Date_Handler();
4320  0013 cd00bc        	call	_Date_Handler
4322                     ; 34 											LT8900_Send_Date();
4324  0016 cd0000        	call	_LT8900_Send_Date
4326                     ; 35 											System_State = System_Halt;break;
4328  0019 3f00          	clr	_System_State
4331  001b 20e3          	jra	L1472
4332  001d               L7472:
4333                     ; 36 			default:System_State = System_Halt;break;
4334  001d 20e1          	jra	L1472
4380                     ; 43 void Halt_Handler(void)
4380                     ; 44 {
4381                     	switch	.text
4382  001f               _Halt_Handler:
4386                     ; 45 	FLASH_CR1 &= ~(1 << 3);
4388  001f 7217505a      	bres	_FLASH_CR1,#3
4389                     ; 46 	CLK_ICKR &= (1 << 2);
4391  0023 c650c0        	ld	a,_CLK_ICKR
4392  0026 a404          	and	a,#4
4393  0028 c750c0        	ld	_CLK_ICKR,a
4394                     ; 47 	CLK_PCKENR1 = 0x0000;
4396  002b 725f50c7      	clr	_CLK_PCKENR1
4397                     ; 48 	CLK_PCKENR2 = 0x0000;
4399  002f 725f50ca      	clr	_CLK_PCKENR2
4400                     ; 49 	_asm("sim");
4403  0033 9b            sim
4405                     ; 50 	PA_DDR = 0xFF;PA_CR1 = 0xFF;PA_CR2 = 0x00;
4407  0034 35ff5002      	mov	_PA_DDR,#255
4410  0038 35ff5003      	mov	_PA_CR1,#255
4413  003c 725f5004      	clr	_PA_CR2
4414                     ; 51 	PB_DDR = 0xFF;PB_CR1 = 0xFF;PB_CR2 = 0x00;
4416  0040 35ff5007      	mov	_PB_DDR,#255
4419  0044 35ff5008      	mov	_PB_CR1,#255
4422  0048 725f5009      	clr	_PB_CR2
4423                     ; 52 	PC_DDR = 0xFF;PC_CR1 = 0xFF;PC_CR2 = 0x00;
4425  004c 35ff500c      	mov	_PC_DDR,#255
4428  0050 35ff500d      	mov	_PC_CR1,#255
4431  0054 725f500e      	clr	_PC_CR2
4432                     ; 53 	PD_DDR = 0xFF;PD_CR1 = 0xFF;PD_CR2 = 0x00;
4434  0058 35ff5011      	mov	_PD_DDR,#255
4437  005c 35ff5012      	mov	_PD_CR1,#255
4440  0060 725f5013      	clr	_PD_CR2
4441                     ; 55 	PD_DDR &= ~(1 << 2 | 1 << 4 | 1 << 5 | 1 << 6);
4443  0064 c65011        	ld	a,_PD_DDR
4444  0067 a48b          	and	a,#139
4445  0069 c75011        	ld	_PD_DDR,a
4446                     ; 56 	PD_CR1 |= (1 << 2 | 1 << 4 | 1 << 5 | 1 << 6);
4448  006c c65012        	ld	a,_PD_CR1
4449  006f aa74          	or	a,#116
4450  0071 c75012        	ld	_PD_CR1,a
4451                     ; 57 	PD_CR2 |= (1 << 2 | 1 << 4 | 1 << 5 | 1 << 6);
4453  0074 c65013        	ld	a,_PD_CR2
4454  0077 aa74          	or	a,#116
4455  0079 c75013        	ld	_PD_CR2,a
4456                     ; 58 	PA_DDR &= ~(1 << 3);PA_CR1 |= (1 << 3);	PA_CR2 |= (1 << 3);
4458  007c 72175002      	bres	_PA_DDR,#3
4461  0080 72165003      	bset	_PA_CR1,#3
4464  0084 72165004      	bset	_PA_CR2,#3
4465                     ; 60 	PB4_DDR=1;PB4_CR1=1;PB4_CR2=0;PB4_ODR=1;	
4467  0088 72185007      	bset	_PB4_DDR
4470  008c 72185008      	bset	_PB4_CR1
4473  0090 72195009      	bres	_PB4_CR2
4476  0094 72185005      	bset	_PB4_ODR
4477                     ; 61 	delay_init(16);
4479  0098 a610          	ld	a,#16
4480  009a cd0000        	call	_delay_init
4482                     ; 62 	EXTI_CR1 = 0x00;
4484  009d 725f50a0      	clr	_EXTI_CR1
4485                     ; 63 	System_State = System_Halt;
4487  00a1 3f00          	clr	_System_State
4488                     ; 64 	_asm("Halt");
4491  00a3 8e            Halt
4493                     ; 65 }
4496  00a4 81            	ret
4526                     ; 67 void System_init(void)
4526                     ; 68 {
4527                     	switch	.text
4528  00a5               _System_init:
4532                     ; 69 	System_Clock_init();
4534  00a5 cd0000        	call	_System_Clock_init
4536                     ; 70 	CLK_PCKENR1 = 0x0002;
4538  00a8 350250c7      	mov	_CLK_PCKENR1,#2
4539                     ; 71 	SPI_init();
4541  00ac cd0000        	call	_SPI_init
4543                     ; 72 	delay_init(16);
4545  00af a610          	ld	a,#16
4546  00b1 cd0000        	call	_delay_init
4548                     ; 73 	LT8900_init();
4550  00b4 cd0000        	call	_LT8900_init
4552                     ; 74 	LT8900_Config();
4554  00b7 cd0000        	call	_LT8900_Config
4556                     ; 75 	_asm("rim");
4559  00ba 9a            rim
4561                     ; 76 }
4564  00bb 81            	ret
4594                     ; 78 void Date_Handler(void)
4594                     ; 79 {
4595                     	switch	.text
4596  00bc               _Date_Handler:
4600                     ; 80 	if(!PA_temp)
4602  00bc 3d00          	tnz	_PA_temp
4603  00be 2606          	jrne	L1203
4604                     ; 82 		LT8900_Send_Buffer[1] = 0x01;
4606  00c0 35010001      	mov	_LT8900_Send_Buffer+1,#1
4607                     ; 83 		goto END;
4609  00c4 2039          	jra	L5003
4610  00c6               L1203:
4611                     ; 86 	switch(PD_temp)
4613  00c6 b601          	ld	a,_PD_temp
4615                     ; 93 	default:LT8900_Send_Buffer[2] = 0xFF;break;
4616  00c8 4d            	tnz	a
4617  00c9 2734          	jreq	L5003
4618  00cb a034          	sub	a,#52
4619  00cd 2722          	jreq	L5772
4620  00cf a020          	sub	a,#32
4621  00d1 270e          	jreq	L1772
4622  00d3 a010          	sub	a,#16
4623  00d5 2722          	jreq	L7772
4624  00d7 a00c          	sub	a,#12
4625  00d9 270e          	jreq	L3772
4626  00db               L3003:
4629  00db 35ff0002      	mov	_LT8900_Send_Buffer+2,#255
4632  00df 201e          	jra	L5003
4633  00e1               L1772:
4634                     ; 88 	case 0x54:LT8900_Send_Buffer[1] = 0x02;LT8900_Send_Buffer[2] = 0x00;break;
4636  00e1 35020001      	mov	_LT8900_Send_Buffer+1,#2
4639  00e5 3f02          	clr	_LT8900_Send_Buffer+2
4642  00e7 2016          	jra	L5003
4643  00e9               L3772:
4644                     ; 89 	case 0x70:LT8900_Send_Buffer[1] = 0x03;LT8900_Send_Buffer[2] = 0x00;break;
4646  00e9 35030001      	mov	_LT8900_Send_Buffer+1,#3
4649  00ed 3f02          	clr	_LT8900_Send_Buffer+2
4652  00ef 200e          	jra	L5003
4653  00f1               L5772:
4654                     ; 90 	case 0x34:LT8900_Send_Buffer[1] = 0x04;LT8900_Send_Buffer[2] = 0x00;break;
4656  00f1 35040001      	mov	_LT8900_Send_Buffer+1,#4
4659  00f5 3f02          	clr	_LT8900_Send_Buffer+2
4662  00f7 2006          	jra	L5003
4663  00f9               L7772:
4664                     ; 91 	case 0x64:LT8900_Send_Buffer[1] = 0x05;LT8900_Send_Buffer[2] = 0x00;break;
4666  00f9 35050001      	mov	_LT8900_Send_Buffer+1,#5
4669  00fd 3f02          	clr	_LT8900_Send_Buffer+2
4672  00ff               L5203:
4673  00ff               L5003:
4674                     ; 95 END:
4674                     ; 96 	PA_temp = 0x08;
4676  00ff 35080000      	mov	_PA_temp,#8
4677                     ; 97 	PA_Lock = 0;
4679  0103 3f02          	clr	_PA_Lock
4680                     ; 98 	PD_temp = 0x74;
4682  0105 35740001      	mov	_PD_temp,#116
4683                     ; 99 	PD_Lock = 0;
4685  0109 3f01          	clr	_PD_Lock
4686                     ; 100 }
4689  010b 81            	ret
4717                     ; 102 @far @interrupt void PA_IRQHandler(void)
4717                     ; 103 {
4719                     	switch	.text
4720  010c               f_PA_IRQHandler:
4723  010c 3b0002        	push	c_x+2
4724  010f be00          	ldw	x,c_x
4725  0111 89            	pushw	x
4726  0112 3b0002        	push	c_y+2
4727  0115 be00          	ldw	x,c_y
4728  0117 89            	pushw	x
4731                     ; 104 	if(!PA_Lock)
4733  0118 3d02          	tnz	_PA_Lock
4734  011a 2619          	jrne	L7303
4735                     ; 106 		delay_ms(10);
4737  011c ae000a        	ldw	x,#10
4738  011f cd0000        	call	_delay_ms
4740                     ; 107 		PA_temp = PA_IDR & 0x08;
4742  0122 c65001        	ld	a,_PA_IDR
4743  0125 a408          	and	a,#8
4744  0127 b700          	ld	_PA_temp,a
4745                     ; 108 		if(!PA_temp)
4747  0129 3d00          	tnz	_PA_temp
4748  012b 2608          	jrne	L7303
4749                     ; 110 			PA_Lock = 1;
4751  012d 35010002      	mov	_PA_Lock,#1
4752                     ; 111 			System_State = System_Run;
4754  0131 35010000      	mov	_System_State,#1
4755  0135               L7303:
4756                     ; 114 }
4759  0135 85            	popw	x
4760  0136 bf00          	ldw	c_y,x
4761  0138 320002        	pop	c_y+2
4762  013b 85            	popw	x
4763  013c bf00          	ldw	c_x,x
4764  013e 320002        	pop	c_x+2
4765  0141 80            	iret
4792                     ; 116 @far @interrupt void PD_IRQHandler(void)
4792                     ; 117 {
4793                     	switch	.text
4794  0142               f_PD_IRQHandler:
4797  0142 3b0002        	push	c_x+2
4798  0145 be00          	ldw	x,c_x
4799  0147 89            	pushw	x
4800  0148 3b0002        	push	c_y+2
4801  014b be00          	ldw	x,c_y
4802  014d 89            	pushw	x
4805                     ; 118 	delay_ms(10);
4807  014e ae000a        	ldw	x,#10
4808  0151 cd0000        	call	_delay_ms
4810                     ; 119 	if(!PD_Lock)
4812  0154 3d01          	tnz	_PD_Lock
4813  0156 2613          	jrne	L3503
4814                     ; 121 		PD_temp = PD_IDR & 0x74;
4816  0158 c65010        	ld	a,_PD_IDR
4817  015b a474          	and	a,#116
4818  015d b701          	ld	_PD_temp,a
4819                     ; 122 		if(PD_temp )
4821  015f 3d01          	tnz	_PD_temp
4822  0161 2708          	jreq	L3503
4823                     ; 124 			PD_Lock = 1;
4825  0163 35010001      	mov	_PD_Lock,#1
4826                     ; 125 			System_State = System_Run;
4828  0167 35010000      	mov	_System_State,#1
4829  016b               L3503:
4830                     ; 128 }
4833  016b 85            	popw	x
4834  016c bf00          	ldw	c_y,x
4835  016e 320002        	pop	c_y+2
4836  0171 85            	popw	x
4837  0172 bf00          	ldw	c_x,x
4838  0174 320002        	pop	c_x+2
4839  0177 80            	iret
4898                     	xdef	f_PD_IRQHandler
4899                     	xdef	f_PA_IRQHandler
4900                     	xdef	_main
4901                     	xdef	_Date_Handler
4902                     	xdef	_System_init
4903                     	xdef	_Halt_Handler
4904                     	xdef	_PA_Lock
4905                     	switch	.ubsct
4906  0000               _PA_temp:
4907  0000 00            	ds.b	1
4908                     	xdef	_PA_temp
4909                     	xdef	_PD_Lock
4910  0001               _PD_temp:
4911  0001 00            	ds.b	1
4912                     	xdef	_PD_temp
4913                     	xdef	_System_State
4914                     	xref.b	_LT8900_Send_Buffer
4915                     	xref	_LT8900_Send_Date
4916                     	xref	_LT8900_Config
4917                     	xref	_LT8900_init
4918                     	xref	_SPI_init
4919                     	xref	_delay_ms
4920                     	xref	_delay_init
4921                     	xref	_System_Clock_init
4922                     	xref.b	c_x
4923                     	xref.b	c_y
4943                     	end
