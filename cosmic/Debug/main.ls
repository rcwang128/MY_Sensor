   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  17                     	switch	.data
  18  0000               _dataBuf:
  19  0000 00            	dc.b	0
  20  0001 000000000000  	ds.b	7
  21  0008               _SAMP_RES:
  22  0008 0005          	dc.w	5
  23  000a               _overflow_count_tim1:
  24  000a 0000          	dc.w	0
  25  000c               _overflow_count_tim2:
  26  000c 0000          	dc.w	0
  27  000e               _freq:
  28  000e 0000          	dc.w	0
  29  0010               _cap:
  30  0010 0000          	dc.w	0
  75                     ; 69 void main(void)
  75                     ; 70 {
  77                     .text:	section	.text,new
  78  0000               _main:
  82                     ; 71 	CLK_Config();
  84  0000 cd0000        	call	L3_CLK_Config
  86                     ; 72 	GPIO_Config();
  88  0003 cd0000        	call	L7_GPIO_Config
  90                     ; 73 	UART1_Config();
  92  0006 cd0000        	call	L5_UART1_Config
  94                     ; 74 	TIM4_Init();
  96  0009 cd0000        	call	_TIM4_Init
  98                     ; 75 	I2C_Master_Init();
 100  000c cd0000        	call	_I2C_Master_Init
 102                     ; 83 	TIM2_Config(); // Input capture - channel 2
 104  000f cd0000        	call	L31_TIM2_Config
 106                     ; 84 	TIM1_Config(); // Set sample resolution
 108  0012 cd0000        	call	L11_TIM1_Config
 110                     ; 85 	printf("Begin capture...\n");
 112  0015 ae00d5        	ldw	x,#L53
 113  0018 cd0000        	call	_printf
 115                     ; 88 	enableInterrupts();
 118  001b 9a            rim
 120                     ; 90 	delay(1000);
 123  001c ae03e8        	ldw	x,#1000
 124  001f cf0000        	ldw	_TIM4_tout,x
 126  0022               L34:
 129  0022 ce0000        	ldw	x,_TIM4_tout
 130  0025 26fb          	jrne	L34
 131  0027               L74:
 132                     ; 96 		set_tout_ms(10);
 134  0027 ae000a        	ldw	x,#10
 135  002a cf0000        	ldw	_TIM4_tout,x
 136                     ; 98     if(tout()) 
 139  002d ce0000        	ldw	x,_TIM4_tout
 140  0030 274b          	jreq	L35
 141                     ; 100 			memset(dataBuf, 0, 8);
 143  0032 ae0008        	ldw	x,#8
 144  0035 89            	pushw	x
 145  0036 4b00          	push	#0
 146  0038 ae0000        	ldw	x,#_dataBuf
 147  003b cd0000        	call	_memset
 149  003e 5b03          	addw	sp,#3
 150                     ; 102       set_tout_ms(10);
 152  0040 ae000a        	ldw	x,#10
 153  0043 cf0000        	ldw	_TIM4_tout,x
 154                     ; 103       I2C_ReadRegister(0x00, 1, &dataBuf[0]);
 157  0046 ae0000        	ldw	x,#_dataBuf
 158  0049 89            	pushw	x
 159  004a ae0001        	ldw	x,#1
 160  004d cd0000        	call	_I2C_ReadRegister
 162  0050 85            	popw	x
 163                     ; 104 			I2C_ReadRegister(0x07, 1, &dataBuf[1]);
 165  0051 ae0001        	ldw	x,#_dataBuf+1
 166  0054 89            	pushw	x
 167  0055 ae0701        	ldw	x,#1793
 168  0058 cd0000        	call	_I2C_ReadRegister
 170  005b 85            	popw	x
 171                     ; 105 			I2C_ReadRegister(0x0A, 1, &dataBuf[2]);
 173  005c ae0002        	ldw	x,#_dataBuf+2
 174  005f 89            	pushw	x
 175  0060 ae0a01        	ldw	x,#2561
 176  0063 cd0000        	call	_I2C_ReadRegister
 178  0066 85            	popw	x
 179                     ; 106 			I2C_ReadRegister(0x0B, 1, &dataBuf[3]);
 181  0067 ae0003        	ldw	x,#_dataBuf+3
 182  006a 89            	pushw	x
 183  006b ae0b01        	ldw	x,#2817
 184  006e cd0000        	call	_I2C_ReadRegister
 186  0071 85            	popw	x
 187                     ; 107 			I2C_ReadRegister(0x0C, 1, &dataBuf[4]);
 189  0072 ae0004        	ldw	x,#_dataBuf+4
 190  0075 89            	pushw	x
 191  0076 ae0c01        	ldw	x,#3073
 192  0079 cd0000        	call	_I2C_ReadRegister
 194  007c 85            	popw	x
 195  007d               L35:
 196                     ; 111 		printf("AD7747 Status 		0x00 = 0x%02x\n", (int)dataBuf[0]);
 198  007d c60000        	ld	a,_dataBuf
 199  0080 5f            	clrw	x
 200  0081 97            	ld	xl,a
 201  0082 89            	pushw	x
 202  0083 ae00b6        	ldw	x,#L55
 203  0086 cd0000        	call	_printf
 205  0089 85            	popw	x
 206                     ; 112 		printf("AD7747 Cap Setup 	0x07 = 0x%02x\n", (int)dataBuf[1]);
 208  008a c60001        	ld	a,_dataBuf+1
 209  008d 5f            	clrw	x
 210  008e 97            	ld	xl,a
 211  008f 89            	pushw	x
 212  0090 ae0095        	ldw	x,#L75
 213  0093 cd0000        	call	_printf
 215  0096 85            	popw	x
 216                     ; 113 		printf("AD7747 Config 		0x0A = 0x%02x\n", (int)dataBuf[2]);
 218  0097 c60002        	ld	a,_dataBuf+2
 219  009a 5f            	clrw	x
 220  009b 97            	ld	xl,a
 221  009c 89            	pushw	x
 222  009d ae0076        	ldw	x,#L16
 223  00a0 cd0000        	call	_printf
 225  00a3 85            	popw	x
 226                     ; 114 		printf("AD7747 Cap DAC A 	0x0B = 0x%02x\n", (int)dataBuf[3]);
 228  00a4 c60003        	ld	a,_dataBuf+3
 229  00a7 5f            	clrw	x
 230  00a8 97            	ld	xl,a
 231  00a9 89            	pushw	x
 232  00aa ae0055        	ldw	x,#L36
 233  00ad cd0000        	call	_printf
 235  00b0 85            	popw	x
 236                     ; 115 		printf("AD7747 Cap DAC B 	0x0C = 0x%02x\n", (int)dataBuf[4]);
 238  00b1 c60004        	ld	a,_dataBuf+4
 239  00b4 5f            	clrw	x
 240  00b5 97            	ld	xl,a
 241  00b6 89            	pushw	x
 242  00b7 ae0034        	ldw	x,#L56
 243  00ba cd0000        	call	_printf
 245  00bd 85            	popw	x
 246                     ; 116 		delay(10);
 248  00be ae000a        	ldw	x,#10
 249  00c1 cf0000        	ldw	_TIM4_tout,x
 251  00c4               L37:
 254  00c4 ce0000        	ldw	x,_TIM4_tout
 255  00c7 26fb          	jrne	L37
 256                     ; 117 		printf("\nDetected 555 Freq = %d Hz\n", freq-3);
 259  00c9 ce000e        	ldw	x,_freq
 260  00cc 1d0003        	subw	x,#3
 261  00cf 89            	pushw	x
 262  00d0 ae0018        	ldw	x,#L77
 263  00d3 cd0000        	call	_printf
 265  00d6 85            	popw	x
 266                     ; 118 		printf("555 Cap value = %d pF\n\n", cap);
 268  00d7 ce0010        	ldw	x,_cap
 269  00da 89            	pushw	x
 270  00db ae0000        	ldw	x,#L101
 271  00de cd0000        	call	_printf
 273  00e1 85            	popw	x
 274                     ; 119 		GPIO_WriteReverse(GPIOD, GPIO_PIN_2);
 276  00e2 4b04          	push	#4
 277  00e4 ae500f        	ldw	x,#20495
 278  00e7 cd0000        	call	_GPIO_WriteReverse
 280  00ea 84            	pop	a
 281                     ; 129 		delay(1000);
 283  00eb ae03e8        	ldw	x,#1000
 284  00ee cf0000        	ldw	_TIM4_tout,x
 286  00f1               L701:
 289  00f1 ce0000        	ldw	x,_TIM4_tout
 290  00f4 26fb          	jrne	L701
 293  00f6 ac270027      	jpf	L74
 326                     ; 139 static void CLK_Config(void)
 326                     ; 140 {
 327                     .text:	section	.text,new
 328  0000               L3_CLK_Config:
 332                     ; 141 	CLK_DeInit();
 334  0000 cd0000        	call	_CLK_DeInit
 336                     ; 143 	CLK_HSECmd(ENABLE);
 338  0003 a601          	ld	a,#1
 339  0005 cd0000        	call	_CLK_HSECmd
 341                     ; 144 	CLK_LSICmd(DISABLE);
 343  0008 4f            	clr	a
 344  0009 cd0000        	call	_CLK_LSICmd
 346                     ; 145 	CLK_HSICmd(DISABLE);
 348  000c 4f            	clr	a
 349  000d cd0000        	call	_CLK_HSICmd
 352  0010               L521:
 353                     ; 146 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 355  0010 ae0102        	ldw	x,#258
 356  0013 cd0000        	call	_CLK_GetFlagStatus
 358  0016 4d            	tnz	a
 359  0017 27f7          	jreq	L521
 360                     ; 148 	CLK_ClockSwitchCmd(ENABLE);
 362  0019 a601          	ld	a,#1
 363  001b cd0000        	call	_CLK_ClockSwitchCmd
 365                     ; 149 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 367  001e 4f            	clr	a
 368  001f cd0000        	call	_CLK_HSIPrescalerConfig
 370                     ; 150 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // 16MHz
 372  0022 a680          	ld	a,#128
 373  0024 cd0000        	call	_CLK_SYSCLKConfig
 375                     ; 152 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 377  0027 4b00          	push	#0
 378  0029 4b00          	push	#0
 379  002b ae01b4        	ldw	x,#436
 380  002e cd0000        	call	_CLK_ClockSwitchConfig
 382  0031 85            	popw	x
 383                     ; 154 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE); // Has to enable for UART2 to work?
 385  0032 ae0301        	ldw	x,#769
 386  0035 cd0000        	call	_CLK_PeripheralClockConfig
 388                     ; 155 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, ENABLE);
 390  0038 ae0301        	ldw	x,#769
 391  003b cd0000        	call	_CLK_PeripheralClockConfig
 393                     ; 156 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 395  003e ae0701        	ldw	x,#1793
 396  0041 cd0000        	call	_CLK_PeripheralClockConfig
 398                     ; 157 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 400  0044 ae0501        	ldw	x,#1281
 401  0047 cd0000        	call	_CLK_PeripheralClockConfig
 403                     ; 158 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
 405  004a ae0601        	ldw	x,#1537
 406  004d cd0000        	call	_CLK_PeripheralClockConfig
 408                     ; 159 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 410  0050 ae0401        	ldw	x,#1025
 411  0053 cd0000        	call	_CLK_PeripheralClockConfig
 413                     ; 160 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 415  0056 ae0001        	ldw	x,#1
 416  0059 cd0000        	call	_CLK_PeripheralClockConfig
 418                     ; 162 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 420  005c ae0100        	ldw	x,#256
 421  005f cd0000        	call	_CLK_PeripheralClockConfig
 423                     ; 163 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 425  0062 ae1300        	ldw	x,#4864
 426  0065 cd0000        	call	_CLK_PeripheralClockConfig
 428                     ; 164 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 430  0068 ae1200        	ldw	x,#4608
 431  006b cd0000        	call	_CLK_PeripheralClockConfig
 433                     ; 168 }
 436  006e 81            	ret
 462                     ; 170 static void UART1_Config(void)
 462                     ; 171 {
 463                     .text:	section	.text,new
 464  0000               L5_UART1_Config:
 468                     ; 172 	UART1_DeInit();
 470  0000 cd0000        	call	_UART1_DeInit
 472                     ; 173 	UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 474  0003 4b0c          	push	#12
 475  0005 4b80          	push	#128
 476  0007 4b00          	push	#0
 477  0009 4b00          	push	#0
 478  000b 4b00          	push	#0
 479  000d aec200        	ldw	x,#49664
 480  0010 89            	pushw	x
 481  0011 ae0001        	ldw	x,#1
 482  0014 89            	pushw	x
 483  0015 cd0000        	call	_UART1_Init
 485  0018 5b09          	addw	sp,#9
 486                     ; 174 	UART1_Cmd(ENABLE);
 488  001a a601          	ld	a,#1
 489  001c cd0000        	call	_UART1_Cmd
 491                     ; 175 }
 494  001f 81            	ret
 519                     ; 177 static void GPIO_Config(void)
 519                     ; 178 {
 520                     .text:	section	.text,new
 521  0000               L7_GPIO_Config:
 525                     ; 179 	GPIO_DeInit(GPIOD);
 527  0000 ae500f        	ldw	x,#20495
 528  0003 cd0000        	call	_GPIO_DeInit
 530                     ; 181 	GPIO_DeInit(GPIOC);
 532  0006 ae500a        	ldw	x,#20490
 533  0009 cd0000        	call	_GPIO_DeInit
 535                     ; 182 	GPIO_DeInit(GPIOB);
 537  000c ae5005        	ldw	x,#20485
 538  000f cd0000        	call	_GPIO_DeInit
 540                     ; 184 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 542  0012 4be0          	push	#224
 543  0014 4b04          	push	#4
 544  0016 ae500f        	ldw	x,#20495
 545  0019 cd0000        	call	_GPIO_Init
 547  001c 85            	popw	x
 548                     ; 187 	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
 550  001d 4b00          	push	#0
 551  001f 4b40          	push	#64
 552  0021 ae500a        	ldw	x,#20490
 553  0024 cd0000        	call	_GPIO_Init
 555  0027 85            	popw	x
 556                     ; 188 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
 558  0028 4bb0          	push	#176
 559  002a 4b10          	push	#16
 560  002c ae5005        	ldw	x,#20485
 561  002f cd0000        	call	_GPIO_Init
 563  0032 85            	popw	x
 564                     ; 189 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
 566  0033 4bb0          	push	#176
 567  0035 4b20          	push	#32
 568  0037 ae5005        	ldw	x,#20485
 569  003a cd0000        	call	_GPIO_Init
 571  003d 85            	popw	x
 572                     ; 190 }
 575  003e 81            	ret
 603                     ; 217 static void TIM1_Config(void)
 603                     ; 218 {	
 604                     .text:	section	.text,new
 605  0000               L11_TIM1_Config:
 609                     ; 219 	TIM1_DeInit();
 611  0000 cd0000        	call	_TIM1_DeInit
 613                     ; 220 	TIM1_TimeBaseInit(8, TIM1_COUNTERMODE_UP, 19, 0);	// 16M / 8 / 20 = 100k, 10us
 615  0003 4b00          	push	#0
 616  0005 ae0013        	ldw	x,#19
 617  0008 89            	pushw	x
 618  0009 4b00          	push	#0
 619  000b ae0008        	ldw	x,#8
 620  000e cd0000        	call	_TIM1_TimeBaseInit
 622  0011 5b04          	addw	sp,#4
 623                     ; 222 	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV1, 1);
 625  0013 4b01          	push	#1
 626  0015 4b00          	push	#0
 627  0017 4b01          	push	#1
 628  0019 5f            	clrw	x
 629  001a cd0000        	call	_TIM1_ICInit
 631  001d 5b03          	addw	sp,#3
 632                     ; 224 	TIM1_ITConfig(TIM1_IT_CC1, ENABLE);
 634  001f ae0201        	ldw	x,#513
 635  0022 cd0000        	call	_TIM1_ITConfig
 637                     ; 225 	TIM1_Cmd(ENABLE);
 639  0025 a601          	ld	a,#1
 640  0027 cd0000        	call	_TIM1_Cmd
 642                     ; 226 }
 645  002a 81            	ret
 673                     ; 228 static void TIM2_Config(void)
 673                     ; 229 {
 674                     .text:	section	.text,new
 675  0000               L31_TIM2_Config:
 679                     ; 230 	TIM2_DeInit();
 681  0000 cd0000        	call	_TIM2_DeInit
 683                     ; 231 	TIM2_TimeBaseInit(TIM2_PRESCALER_512, 31250/SAMP_RES-1); //16M / 512 / = 31250
 685  0003 ae7a12        	ldw	x,#31250
 686  0006 90ce0008      	ldw	y,_SAMP_RES
 687  000a 65            	divw	x,y
 688  000b 5a            	decw	x
 689  000c 89            	pushw	x
 690  000d a609          	ld	a,#9
 691  000f cd0000        	call	_TIM2_TimeBaseInit
 693  0012 85            	popw	x
 694                     ; 232 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 696  0013 ae0101        	ldw	x,#257
 697  0016 cd0000        	call	_TIM2_ITConfig
 699                     ; 233 	TIM2_Cmd(ENABLE);
 701  0019 a601          	ld	a,#1
 702  001b cd0000        	call	_TIM2_Cmd
 704                     ; 234 }
 707  001e 81            	ret
 741                     ; 237 PUTCHAR_PROTOTYPE
 741                     ; 238 {
 742                     .text:	section	.text,new
 743  0000               _putchar:
 745  0000 88            	push	a
 746       00000000      OFST:	set	0
 749                     ; 240   UART1_SendData8(c);
 751  0001 cd0000        	call	_UART1_SendData8
 754  0004               L702:
 755                     ; 242   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 757  0004 ae0080        	ldw	x,#128
 758  0007 cd0000        	call	_UART1_GetFlagStatus
 760  000a 4d            	tnz	a
 761  000b 27f7          	jreq	L702
 762                     ; 243   return (c);
 764  000d 7b01          	ld	a,(OFST+1,sp)
 767  000f 5b01          	addw	sp,#1
 768  0011 81            	ret
 802                     ; 251 GETCHAR_PROTOTYPE
 802                     ; 252 {
 803                     .text:	section	.text,new
 804  0000               _getchar:
 806  0000 88            	push	a
 807       00000001      OFST:	set	1
 810                     ; 254   char c = 0;
 813  0001               L132:
 814                     ; 259   while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 816  0001 ae0020        	ldw	x,#32
 817  0004 cd0000        	call	_UART1_GetFlagStatus
 819  0007 4d            	tnz	a
 820  0008 27f7          	jreq	L132
 821                     ; 260     c = UART1_ReceiveData8();
 823  000a cd0000        	call	_UART1_ReceiveData8
 825  000d 6b01          	ld	(OFST+0,sp),a
 827                     ; 261   return (c);
 829  000f 7b01          	ld	a,(OFST+0,sp)
 832  0011 5b01          	addw	sp,#1
 833  0013 81            	ret
 868                     ; 274 void assert_failed(uint8_t* file, uint32_t line)
 868                     ; 275 {
 869                     .text:	section	.text,new
 870  0000               _assert_failed:
 874  0000               L352:
 875  0000 20fe          	jra	L352
 946                     	xdef	_main
 947                     	xdef	_cap
 948                     	xdef	_freq
 949                     	xdef	_overflow_count_tim2
 950                     	xdef	_overflow_count_tim1
 951                     	xdef	_SAMP_RES
 952                     	xdef	_dataBuf
 953                     	xdef	_putchar
 954                     	xref	_printf
 955                     	xdef	_getchar
 956                     	switch	.bss
 957  0000               _TIM4_tout:
 958  0000 0000          	ds.b	2
 959                     	xdef	_TIM4_tout
 960                     	xref	_I2C_ReadRegister
 961                     	xref	_TIM4_Init
 962                     	xref	_I2C_Master_Init
 963                     	xdef	_assert_failed
 964                     	xref	_UART1_GetFlagStatus
 965                     	xref	_UART1_SendData8
 966                     	xref	_UART1_ReceiveData8
 967                     	xref	_UART1_Cmd
 968                     	xref	_UART1_Init
 969                     	xref	_UART1_DeInit
 970                     	xref	_TIM2_ITConfig
 971                     	xref	_TIM2_Cmd
 972                     	xref	_TIM2_TimeBaseInit
 973                     	xref	_TIM2_DeInit
 974                     	xref	_TIM1_ITConfig
 975                     	xref	_TIM1_Cmd
 976                     	xref	_TIM1_ICInit
 977                     	xref	_TIM1_TimeBaseInit
 978                     	xref	_TIM1_DeInit
 979                     	xref	_GPIO_WriteReverse
 980                     	xref	_GPIO_Init
 981                     	xref	_GPIO_DeInit
 982                     	xref	_CLK_GetFlagStatus
 983                     	xref	_CLK_SYSCLKConfig
 984                     	xref	_CLK_HSIPrescalerConfig
 985                     	xref	_CLK_ClockSwitchConfig
 986                     	xref	_CLK_PeripheralClockConfig
 987                     	xref	_CLK_ClockSwitchCmd
 988                     	xref	_CLK_LSICmd
 989                     	xref	_CLK_HSICmd
 990                     	xref	_CLK_HSECmd
 991                     	xref	_CLK_DeInit
 992                     	xref	_memset
 993                     .const:	section	.text
 994  0000               L101:
 995  0000 353535204361  	dc.b	"555 Cap value = %d"
 996  0012 2070460a      	dc.b	" pF",10
 997  0016 0a00          	dc.b	10,0
 998  0018               L77:
 999  0018 0a4465746563  	dc.b	10,68,101,116,101,99
1000  001e 746564203535  	dc.b	"ted 555 Freq = %d "
1001  0030 487a0a00      	dc.b	"Hz",10,0
1002  0034               L56:
1003  0034 414437373437  	dc.b	"AD7747 Cap DAC B ",9
1004  0046 30783043203d  	dc.b	"0x0C = 0x%02x",10,0
1005  0055               L36:
1006  0055 414437373437  	dc.b	"AD7747 Cap DAC A ",9
1007  0067 30783042203d  	dc.b	"0x0B = 0x%02x",10,0
1008  0076               L16:
1009  0076 414437373437  	dc.b	"AD7747 Config ",9
1010  0085 093078304120  	dc.b	9,48,120,48,65,32
1011  008b 3d2030782530  	dc.b	"= 0x%02x",10,0
1012  0095               L75:
1013  0095 414437373437  	dc.b	"AD7747 Cap Setup ",9
1014  00a7 30783037203d  	dc.b	"0x07 = 0x%02x",10,0
1015  00b6               L55:
1016  00b6 414437373437  	dc.b	"AD7747 Status ",9
1017  00c5 093078303020  	dc.b	9,48,120,48,48,32
1018  00cb 3d2030782530  	dc.b	"= 0x%02x",10,0
1019  00d5               L53:
1020  00d5 426567696e20  	dc.b	"Begin capture...",10,0
1040                     	end
