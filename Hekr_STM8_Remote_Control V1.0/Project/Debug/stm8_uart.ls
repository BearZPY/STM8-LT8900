   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2456                     ; 19 void  UART1_Init(void)
2456                     ; 20 {   
2458                     	switch	.text
2459  0000               _UART1_Init:
2463                     ; 21 		UART1_CR1 = 0x00; //8bit
2465  0000 725f5234      	clr	_UART1_CR1
2466                     ; 22 		UART1_CR2 = 0x00;
2468  0004 725f5235      	clr	_UART1_CR2
2469                     ; 23 		UART1_CR3 = 0x00;//1 stop bit
2471  0008 725f5236      	clr	_UART1_CR3
2472                     ; 40 		UART1_BRR2=0x0b;
2474  000c 350b5233      	mov	_UART1_BRR2,#11
2475                     ; 41 		UART1_BRR1=0x08;
2477  0010 35085232      	mov	_UART1_BRR1,#8
2478                     ; 43 		UART1_CR2 = 0x2C;//enable REN and RIEN
2480  0014 352c5235      	mov	_UART1_CR2,#44
2481                     ; 46 }
2484  0018 81            	ret
2520                     ; 48 void UART1_SendChar(unsigned char ch)
2520                     ; 49 {
2521                     	switch	.text
2522  0019               _UART1_SendChar:
2524  0019 88            	push	a
2525       00000000      OFST:	set	0
2528  001a               L1261:
2529                     ; 50 	while((UART1_SR & 0x80) == 0x00);	//  若发送寄存器不空，则等待
2531  001a c65230        	ld	a,_UART1_SR
2532  001d a580          	bcp	a,#128
2533  001f 27f9          	jreq	L1261
2534                     ; 51 		UART1_DR = ch;										 // 将要发送的字符送到数据寄存器
2536  0021 7b01          	ld	a,(OFST+1,sp)
2537  0023 c75231        	ld	_UART1_DR,a
2538                     ; 52 }
2541  0026 84            	pop	a
2542  0027 81            	ret
2577                     ; 54 char putchar(char ch)
2577                     ; 55 {
2578                     	switch	.text
2579  0028               _putchar:
2581  0028 88            	push	a
2582       00000000      OFST:	set	0
2585                     ; 56 		UART1_SendChar(ch);
2587  0029 adee          	call	_UART1_SendChar
2589                     ; 57 		return ch;
2591  002b 7b01          	ld	a,(OFST+1,sp)
2594  002d 5b01          	addw	sp,#1
2595  002f 81            	ret
2608                     	xdef	_putchar
2609                     	xdef	_UART1_SendChar
2610                     	xdef	_UART1_Init
2629                     	end
