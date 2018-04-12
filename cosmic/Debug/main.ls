   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  17                     	switch	.data
  18  0000               _SAMP_RES:
  19  0000 0005          	dc.w	5
  20  0002               _overflow_count_tim1:
  21  0002 0000          	dc.w	0
  22  0004               _overflow_count_tim2:
  23  0004 0000          	dc.w	0
  24  0006               _freq:
  25  0006 0000          	dc.w	0
  26  0008               _cap:
  27  0008 0000          	dc.w	0
  68                     ; 67 void main(void)
  68                     ; 68 {
  70                     .text:	section	.text,new
  71  0000               _main:
  75                     ; 69 	CLK_Config();
  77  0000 cd0000        	call	L3_CLK_Config
  79                     ; 70 	GPIO_Config();
  81  0003 cd0000        	call	L7_GPIO_Config
  83                     ; 71 	UART1_Config();
  85  0006 cd0000        	call	L5_UART1_Config
  87                     ; 73 	TIM4_Init();
  89  0009 cd0000        	call	_TIM4_Init
  91                     ; 74 	I2C_Master_Init();
  93  000c cd0000        	call	_I2C_Master_Init
  95                     ; 76 	TIM2_Config(); // Input capture - channel 2
  97  000f cd0000        	call	L31_TIM2_Config
  99                     ; 77 	TIM1_Config(); // Set sample resolution
 101  0012 cd0000        	call	L11_TIM1_Config
 103                     ; 78 	printf("Begin capture...\n");
 105  0015 ae002a        	ldw	x,#L33
 106  0018 cd0000        	call	_printf
 108                     ; 81 	enableInterrupts();
 111  001b 9a            rim
 113  001c               L53:
 114                     ; 104 		printf("Detected Freq = %d Hz\n", freq-3);
 116  001c ce0006        	ldw	x,_freq
 117  001f 1d0003        	subw	x,#3
 118  0022 89            	pushw	x
 119  0023 ae0013        	ldw	x,#L14
 120  0026 cd0000        	call	_printf
 122  0029 85            	popw	x
 123                     ; 105 		printf("Cap value = %d pF\n", cap);
 125  002a ce0008        	ldw	x,_cap
 126  002d 89            	pushw	x
 127  002e ae0000        	ldw	x,#L34
 128  0031 cd0000        	call	_printf
 130  0034 85            	popw	x
 131                     ; 108 		delay(1000);
 133  0035 ae03e8        	ldw	x,#1000
 134  0038 cf0000        	ldw	_TIM4_tout,x
 136  003b               L15:
 139  003b ce0000        	ldw	x,_TIM4_tout
 140  003e 26fb          	jrne	L15
 143  0040 20da          	jra	L53
 176                     ; 117 static void CLK_Config(void)
 176                     ; 118 {
 177                     .text:	section	.text,new
 178  0000               L3_CLK_Config:
 182                     ; 119 	CLK_DeInit();
 184  0000 cd0000        	call	_CLK_DeInit
 186                     ; 121 	CLK_HSECmd(ENABLE);
 188  0003 a601          	ld	a,#1
 189  0005 cd0000        	call	_CLK_HSECmd
 191                     ; 122 	CLK_LSICmd(DISABLE);
 193  0008 4f            	clr	a
 194  0009 cd0000        	call	_CLK_LSICmd
 196                     ; 123 	CLK_HSICmd(DISABLE);
 198  000c 4f            	clr	a
 199  000d cd0000        	call	_CLK_HSICmd
 202  0010               L76:
 203                     ; 124 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 205  0010 ae0102        	ldw	x,#258
 206  0013 cd0000        	call	_CLK_GetFlagStatus
 208  0016 4d            	tnz	a
 209  0017 27f7          	jreq	L76
 210                     ; 126 	CLK_ClockSwitchCmd(ENABLE);
 212  0019 a601          	ld	a,#1
 213  001b cd0000        	call	_CLK_ClockSwitchCmd
 215                     ; 127 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 217  001e 4f            	clr	a
 218  001f cd0000        	call	_CLK_HSIPrescalerConfig
 220                     ; 128 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // 16MHz
 222  0022 a680          	ld	a,#128
 223  0024 cd0000        	call	_CLK_SYSCLKConfig
 225                     ; 130 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 227  0027 4b00          	push	#0
 228  0029 4b00          	push	#0
 229  002b ae01b4        	ldw	x,#436
 230  002e cd0000        	call	_CLK_ClockSwitchConfig
 232  0031 85            	popw	x
 233                     ; 132 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE); // Has to enable for UART2 to work?
 235  0032 ae0301        	ldw	x,#769
 236  0035 cd0000        	call	_CLK_PeripheralClockConfig
 238                     ; 133 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, ENABLE);
 240  0038 ae0301        	ldw	x,#769
 241  003b cd0000        	call	_CLK_PeripheralClockConfig
 243                     ; 134 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 245  003e ae0701        	ldw	x,#1793
 246  0041 cd0000        	call	_CLK_PeripheralClockConfig
 248                     ; 135 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 250  0044 ae0501        	ldw	x,#1281
 251  0047 cd0000        	call	_CLK_PeripheralClockConfig
 253                     ; 136 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
 255  004a ae0601        	ldw	x,#1537
 256  004d cd0000        	call	_CLK_PeripheralClockConfig
 258                     ; 137 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 260  0050 ae0401        	ldw	x,#1025
 261  0053 cd0000        	call	_CLK_PeripheralClockConfig
 263                     ; 139 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 265  0056 ae0100        	ldw	x,#256
 266  0059 cd0000        	call	_CLK_PeripheralClockConfig
 268                     ; 140 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 270  005c 5f            	clrw	x
 271  005d cd0000        	call	_CLK_PeripheralClockConfig
 273                     ; 141 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 275  0060 ae1300        	ldw	x,#4864
 276  0063 cd0000        	call	_CLK_PeripheralClockConfig
 278                     ; 142 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 280  0066 ae1200        	ldw	x,#4608
 281  0069 cd0000        	call	_CLK_PeripheralClockConfig
 283                     ; 146 }
 286  006c 81            	ret
 312                     ; 148 static void UART1_Config(void)
 312                     ; 149 {
 313                     .text:	section	.text,new
 314  0000               L5_UART1_Config:
 318                     ; 150 	UART1_DeInit();
 320  0000 cd0000        	call	_UART1_DeInit
 322                     ; 151 	UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 324  0003 4b0c          	push	#12
 325  0005 4b80          	push	#128
 326  0007 4b00          	push	#0
 327  0009 4b00          	push	#0
 328  000b 4b00          	push	#0
 329  000d aec200        	ldw	x,#49664
 330  0010 89            	pushw	x
 331  0011 ae0001        	ldw	x,#1
 332  0014 89            	pushw	x
 333  0015 cd0000        	call	_UART1_Init
 335  0018 5b09          	addw	sp,#9
 336                     ; 152 	UART1_Cmd(ENABLE);
 338  001a a601          	ld	a,#1
 339  001c cd0000        	call	_UART1_Cmd
 341                     ; 153 }
 344  001f 81            	ret
 369                     ; 155 static void GPIO_Config(void)
 369                     ; 156 {
 370                     .text:	section	.text,new
 371  0000               L7_GPIO_Config:
 375                     ; 159 	GPIO_DeInit(GPIOC);
 377  0000 ae500a        	ldw	x,#20490
 378  0003 cd0000        	call	_GPIO_DeInit
 380                     ; 164 	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
 382  0006 4b00          	push	#0
 383  0008 4b40          	push	#64
 384  000a ae500a        	ldw	x,#20490
 385  000d cd0000        	call	_GPIO_Init
 387  0010 85            	popw	x
 388                     ; 165 }
 391  0011 81            	ret
 419                     ; 184 static void TIM1_Config(void)
 419                     ; 185 {	
 420                     .text:	section	.text,new
 421  0000               L11_TIM1_Config:
 425                     ; 186 	TIM1_DeInit();
 427  0000 cd0000        	call	_TIM1_DeInit
 429                     ; 187 	TIM1_TimeBaseInit(8, TIM1_COUNTERMODE_UP, 19, 0);	// 16M / 8 / 20 = 100k, 10us
 431  0003 4b00          	push	#0
 432  0005 ae0013        	ldw	x,#19
 433  0008 89            	pushw	x
 434  0009 4b00          	push	#0
 435  000b ae0008        	ldw	x,#8
 436  000e cd0000        	call	_TIM1_TimeBaseInit
 438  0011 5b04          	addw	sp,#4
 439                     ; 189 	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV1, 1);
 441  0013 4b01          	push	#1
 442  0015 4b00          	push	#0
 443  0017 4b01          	push	#1
 444  0019 5f            	clrw	x
 445  001a cd0000        	call	_TIM1_ICInit
 447  001d 5b03          	addw	sp,#3
 448                     ; 191 	TIM1_ITConfig(TIM1_IT_CC1, ENABLE);
 450  001f ae0201        	ldw	x,#513
 451  0022 cd0000        	call	_TIM1_ITConfig
 453                     ; 192 	TIM1_Cmd(ENABLE);
 455  0025 a601          	ld	a,#1
 456  0027 cd0000        	call	_TIM1_Cmd
 458                     ; 193 }
 461  002a 81            	ret
 489                     ; 195 static void TIM2_Config(void)
 489                     ; 196 {
 490                     .text:	section	.text,new
 491  0000               L31_TIM2_Config:
 495                     ; 197 	TIM2_DeInit();
 497  0000 cd0000        	call	_TIM2_DeInit
 499                     ; 198 	TIM2_TimeBaseInit(TIM2_PRESCALER_512, 31250/SAMP_RES-1); //16M / 512 / = 31250
 501  0003 ae7a12        	ldw	x,#31250
 502  0006 90ce0000      	ldw	y,_SAMP_RES
 503  000a 65            	divw	x,y
 504  000b 5a            	decw	x
 505  000c 89            	pushw	x
 506  000d a609          	ld	a,#9
 507  000f cd0000        	call	_TIM2_TimeBaseInit
 509  0012 85            	popw	x
 510                     ; 199 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 512  0013 ae0101        	ldw	x,#257
 513  0016 cd0000        	call	_TIM2_ITConfig
 515                     ; 200 	TIM2_Cmd(ENABLE);
 517  0019 a601          	ld	a,#1
 518  001b cd0000        	call	_TIM2_Cmd
 520                     ; 201 }
 523  001e 81            	ret
 557                     ; 204 PUTCHAR_PROTOTYPE
 557                     ; 205 {
 558                     .text:	section	.text,new
 559  0000               _putchar:
 561  0000 88            	push	a
 562       00000000      OFST:	set	0
 565                     ; 207   UART1_SendData8(c);
 567  0001 cd0000        	call	_UART1_SendData8
 570  0004               L151:
 571                     ; 209   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 573  0004 ae0080        	ldw	x,#128
 574  0007 cd0000        	call	_UART1_GetFlagStatus
 576  000a 4d            	tnz	a
 577  000b 27f7          	jreq	L151
 578                     ; 210   return (c);
 580  000d 7b01          	ld	a,(OFST+1,sp)
 583  000f 5b01          	addw	sp,#1
 584  0011 81            	ret
 618                     ; 218 GETCHAR_PROTOTYPE
 618                     ; 219 {
 619                     .text:	section	.text,new
 620  0000               _getchar:
 622  0000 88            	push	a
 623       00000001      OFST:	set	1
 626                     ; 221   char c = 0;
 629  0001               L371:
 630                     ; 226   while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 632  0001 ae0020        	ldw	x,#32
 633  0004 cd0000        	call	_UART1_GetFlagStatus
 635  0007 4d            	tnz	a
 636  0008 27f7          	jreq	L371
 637                     ; 227     c = UART1_ReceiveData8();
 639  000a cd0000        	call	_UART1_ReceiveData8
 641  000d 6b01          	ld	(OFST+0,sp),a
 643                     ; 228   return (c);
 645  000f 7b01          	ld	a,(OFST+0,sp)
 648  0011 5b01          	addw	sp,#1
 649  0013 81            	ret
 684                     ; 241 void assert_failed(uint8_t* file, uint32_t line)
 684                     ; 242 {
 685                     .text:	section	.text,new
 686  0000               _assert_failed:
 690  0000               L512:
 691  0000 20fe          	jra	L512
 752                     	xdef	_main
 753                     	xdef	_cap
 754                     	xdef	_freq
 755                     	xdef	_overflow_count_tim2
 756                     	xdef	_overflow_count_tim1
 757                     	xdef	_SAMP_RES
 758                     	xdef	_putchar
 759                     	xref	_printf
 760                     	xdef	_getchar
 761                     	switch	.bss
 762  0000               _TIM4_tout:
 763  0000 0000          	ds.b	2
 764                     	xdef	_TIM4_tout
 765                     	xref	_TIM4_Init
 766                     	xref	_I2C_Master_Init
 767                     	xdef	_assert_failed
 768                     	xref	_UART1_GetFlagStatus
 769                     	xref	_UART1_SendData8
 770                     	xref	_UART1_ReceiveData8
 771                     	xref	_UART1_Cmd
 772                     	xref	_UART1_Init
 773                     	xref	_UART1_DeInit
 774                     	xref	_TIM2_ITConfig
 775                     	xref	_TIM2_Cmd
 776                     	xref	_TIM2_TimeBaseInit
 777                     	xref	_TIM2_DeInit
 778                     	xref	_TIM1_ITConfig
 779                     	xref	_TIM1_Cmd
 780                     	xref	_TIM1_ICInit
 781                     	xref	_TIM1_TimeBaseInit
 782                     	xref	_TIM1_DeInit
 783                     	xref	_GPIO_Init
 784                     	xref	_GPIO_DeInit
 785                     	xref	_CLK_GetFlagStatus
 786                     	xref	_CLK_SYSCLKConfig
 787                     	xref	_CLK_HSIPrescalerConfig
 788                     	xref	_CLK_ClockSwitchConfig
 789                     	xref	_CLK_PeripheralClockConfig
 790                     	xref	_CLK_ClockSwitchCmd
 791                     	xref	_CLK_LSICmd
 792                     	xref	_CLK_HSICmd
 793                     	xref	_CLK_HSECmd
 794                     	xref	_CLK_DeInit
 795                     .const:	section	.text
 796  0000               L34:
 797  0000 436170207661  	dc.b	"Cap value = %d pF",10,0
 798  0013               L14:
 799  0013 446574656374  	dc.b	"Detected Freq = %d"
 800  0025 20487a0a00    	dc.b	" Hz",10,0
 801  002a               L33:
 802  002a 426567696e20  	dc.b	"Begin capture...",10,0
 822                     	end
