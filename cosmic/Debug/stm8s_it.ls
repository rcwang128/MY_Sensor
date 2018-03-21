   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  46                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  46                     ; 60 {
  47                     .text:	section	.text,new
  48  0000               f_NonHandledInterrupt:
  52                     ; 64 }
  55  0000 80            	iret
  77                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 73 {
  78                     .text:	section	.text,new
  79  0000               f_TRAP_IRQHandler:
  83                     ; 77 }
  86  0000 80            	iret
 108                     ; 83 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 108                     ; 84 {
 109                     .text:	section	.text,new
 110  0000               f_TLI_IRQHandler:
 114                     ; 88 }
 117  0000 80            	iret
 139                     ; 95 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 139                     ; 96 {
 140                     .text:	section	.text,new
 141  0000               f_AWU_IRQHandler:
 145                     ; 100 }
 148  0000 80            	iret
 170                     ; 107 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 170                     ; 108 {
 171                     .text:	section	.text,new
 172  0000               f_CLK_IRQHandler:
 176                     ; 112 }
 179  0000 80            	iret
 202                     ; 119 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 202                     ; 120 {
 203                     .text:	section	.text,new
 204  0000               f_EXTI_PORTA_IRQHandler:
 208                     ; 124 }
 211  0000 80            	iret
 234                     ; 131 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 234                     ; 132 {
 235                     .text:	section	.text,new
 236  0000               f_EXTI_PORTB_IRQHandler:
 240                     ; 136 }
 243  0000 80            	iret
 266                     ; 143 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 266                     ; 144 {
 267                     .text:	section	.text,new
 268  0000               f_EXTI_PORTC_IRQHandler:
 272                     ; 148 }
 275  0000 80            	iret
 298                     ; 155 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 298                     ; 156 {
 299                     .text:	section	.text,new
 300  0000               f_EXTI_PORTD_IRQHandler:
 304                     ; 160 }
 307  0000 80            	iret
 330                     ; 167 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 330                     ; 168 {
 331                     .text:	section	.text,new
 332  0000               f_EXTI_PORTE_IRQHandler:
 336                     ; 172 }
 339  0000 80            	iret
 361                     ; 218 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 361                     ; 219 {
 362                     .text:	section	.text,new
 363  0000               f_SPI_IRQHandler:
 367                     ; 223 }
 370  0000 80            	iret
 393                     ; 230 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 393                     ; 231 {
 394                     .text:	section	.text,new
 395  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 399                     ; 235 }
 402  0000 80            	iret
 428                     ; 242 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 428                     ; 243 {
 429                     .text:	section	.text,new
 430  0000               f_TIM1_CAP_COM_IRQHandler:
 432  0000 8a            	push	cc
 433  0001 84            	pop	a
 434  0002 a4bf          	and	a,#191
 435  0004 88            	push	a
 436  0005 86            	pop	cc
 437  0006 3b0002        	push	c_x+2
 438  0009 be00          	ldw	x,c_x
 439  000b 89            	pushw	x
 440  000c 3b0002        	push	c_y+2
 441  000f be00          	ldw	x,c_y
 442  0011 89            	pushw	x
 445                     ; 247 	overflow_count_tim1++;
 447  0012 ce0000        	ldw	x,_overflow_count_tim1
 448  0015 1c0001        	addw	x,#1
 449  0018 cf0000        	ldw	_overflow_count_tim1,x
 450                     ; 248 	TIM1_ClearITPendingBit(TIM1_IT_CC1);
 452  001b a602          	ld	a,#2
 453  001d cd0000        	call	_TIM1_ClearITPendingBit
 455                     ; 249 	TIM1_ClearFlag(TIM1_FLAG_CC1);
 457  0020 ae0002        	ldw	x,#2
 458  0023 cd0000        	call	_TIM1_ClearFlag
 460                     ; 250 }
 463  0026 85            	popw	x
 464  0027 bf00          	ldw	c_y,x
 465  0029 320002        	pop	c_y+2
 466  002c 85            	popw	x
 467  002d bf00          	ldw	c_x,x
 468  002f 320002        	pop	c_x+2
 469  0032 80            	iret
 498                     ; 282  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 498                     ; 283 {
 499                     .text:	section	.text,new
 500  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 502  0000 8a            	push	cc
 503  0001 84            	pop	a
 504  0002 a4bf          	and	a,#191
 505  0004 88            	push	a
 506  0005 86            	pop	cc
 507       00000004      OFST:	set	4
 508  0006 3b0002        	push	c_x+2
 509  0009 be00          	ldw	x,c_x
 510  000b 89            	pushw	x
 511  000c 3b0002        	push	c_y+2
 512  000f be00          	ldw	x,c_y
 513  0011 89            	pushw	x
 514  0012 be02          	ldw	x,c_lreg+2
 515  0014 89            	pushw	x
 516  0015 be00          	ldw	x,c_lreg
 517  0017 89            	pushw	x
 518  0018 5204          	subw	sp,#4
 521                     ; 287 	freq = (overflow_count_tim1 + 1) * SAMP_RES;
 523  001a ce0000        	ldw	x,_overflow_count_tim1
 524  001d 5c            	incw	x
 525  001e 90ce0000      	ldw	y,_SAMP_RES
 526  0022 cd0000        	call	c_imul
 528  0025 cf0000        	ldw	_freq,x
 529                     ; 288 	overflow_count_tim1 = 0;
 531  0028 5f            	clrw	x
 532  0029 cf0000        	ldw	_overflow_count_tim1,x
 533                     ; 290 	cap = 167150 / freq; // freq = 1.44 / ((R2 + 2R7)*cap ) => cap = 1.44*1000000 / (8.615*freq) pF 
 535  002c ce0000        	ldw	x,_freq
 536  002f cd0000        	call	c_uitolx
 538  0032 96            	ldw	x,sp
 539  0033 1c0001        	addw	x,#OFST-3
 540  0036 cd0000        	call	c_rtol
 543  0039 ae8cee        	ldw	x,#36078
 544  003c bf02          	ldw	c_lreg+2,x
 545  003e ae0002        	ldw	x,#2
 546  0041 bf00          	ldw	c_lreg,x
 547  0043 96            	ldw	x,sp
 548  0044 1c0001        	addw	x,#OFST-3
 549  0047 cd0000        	call	c_ldiv
 551  004a be02          	ldw	x,c_lreg+2
 552  004c cf0000        	ldw	_cap,x
 553                     ; 291 	cap = cap >> 1;
 555  004f 72540000      	srl	_cap
 556  0053 72560001      	rrc	_cap+1
 557                     ; 292 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 559  0057 a601          	ld	a,#1
 560  0059 cd0000        	call	_TIM2_ClearITPendingBit
 562                     ; 293 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 564  005c ae0001        	ldw	x,#1
 565  005f cd0000        	call	_TIM2_ClearFlag
 567                     ; 294 }
 570  0062 5b04          	addw	sp,#4
 571  0064 85            	popw	x
 572  0065 bf00          	ldw	c_lreg,x
 573  0067 85            	popw	x
 574  0068 bf02          	ldw	c_lreg+2,x
 575  006a 85            	popw	x
 576  006b bf00          	ldw	c_y,x
 577  006d 320002        	pop	c_y+2
 578  0070 85            	popw	x
 579  0071 bf00          	ldw	c_x,x
 580  0073 320002        	pop	c_x+2
 581  0076 80            	iret
 604                     ; 301  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 604                     ; 302 {
 605                     .text:	section	.text,new
 606  0000               f_TIM2_CAP_COM_IRQHandler:
 610                     ; 306 }
 613  0000 80            	iret
 636                     ; 343  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 636                     ; 344 {
 637                     .text:	section	.text,new
 638  0000               f_UART1_TX_IRQHandler:
 642                     ; 348 }
 645  0000 80            	iret
 668                     ; 355  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 668                     ; 356 {
 669                     .text:	section	.text,new
 670  0000               f_UART1_RX_IRQHandler:
 674                     ; 360 }
 677  0000 80            	iret
 700                     ; 368 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 700                     ; 369 {
 701                     .text:	section	.text,new
 702  0000               f_I2C_IRQHandler:
 704  0000 8a            	push	cc
 705  0001 84            	pop	a
 706  0002 a4bf          	and	a,#191
 707  0004 88            	push	a
 708  0005 86            	pop	cc
 709  0006 3b0002        	push	c_x+2
 710  0009 be00          	ldw	x,c_x
 711  000b 89            	pushw	x
 712  000c 3b0002        	push	c_y+2
 713  000f be00          	ldw	x,c_y
 714  0011 89            	pushw	x
 717                     ; 373 	ErrProc();
 719  0012 cd0000        	call	_ErrProc
 721                     ; 374 }
 724  0015 85            	popw	x
 725  0016 bf00          	ldw	c_y,x
 726  0018 320002        	pop	c_y+2
 727  001b 85            	popw	x
 728  001c bf00          	ldw	c_x,x
 729  001e 320002        	pop	c_x+2
 730  0021 80            	iret
 752                     ; 449  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 752                     ; 450 {
 753                     .text:	section	.text,new
 754  0000               f_ADC1_IRQHandler:
 758                     ; 455     return;
 761  0000 80            	iret
 795                     ; 478  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 795                     ; 479 {
 796                     .text:	section	.text,new
 797  0000               f_TIM4_UPD_OVF_IRQHandler:
 799       00000001      OFST:	set	1
 800  0000 88            	push	a
 803                     ; 481 	u8 dly= 10;
 805  0001 a60a          	ld	a,#10
 806  0003 6b01          	ld	(OFST+0,sp),a
 808                     ; 483   TIM4->SR1= 0;
 810  0005 725f5344      	clr	21316
 811                     ; 485   if(TIM4_tout)
 813  0009 ce0000        	ldw	x,_TIM4_tout
 814  000c 270c          	jreq	L362
 815                     ; 486     if(--TIM4_tout == 0)
 817  000e ce0000        	ldw	x,_TIM4_tout
 818  0011 1d0001        	subw	x,#1
 819  0014 cf0000        	ldw	_TIM4_tout,x
 820  0017 2601          	jrne	L362
 821                     ; 488       _asm("nop");
 824  0019 9d            nop
 826  001a               L362:
 827                     ; 492   while(dly--);
 829  001a 7b01          	ld	a,(OFST+0,sp)
 830  001c 0a01          	dec	(OFST+0,sp)
 832  001e 4d            	tnz	a
 833  001f 26f9          	jrne	L362
 834                     ; 505 }
 837  0021 84            	pop	a
 838  0022 80            	iret
 861                     ; 513 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 861                     ; 514 {
 862                     .text:	section	.text,new
 863  0000               f_EEPROM_EEC_IRQHandler:
 867                     ; 518 }
 870  0000 80            	iret
 882                     	xref	_ErrProc
 883                     	xref	_TIM4_tout
 884                     	xref	_SAMP_RES
 885                     	xref	_cap
 886                     	xref	_freq
 887                     	xref	_overflow_count_tim1
 888                     	xdef	f_EEPROM_EEC_IRQHandler
 889                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 890                     	xdef	f_ADC1_IRQHandler
 891                     	xdef	f_I2C_IRQHandler
 892                     	xdef	f_UART1_RX_IRQHandler
 893                     	xdef	f_UART1_TX_IRQHandler
 894                     	xdef	f_TIM2_CAP_COM_IRQHandler
 895                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 896                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 897                     	xdef	f_TIM1_CAP_COM_IRQHandler
 898                     	xdef	f_SPI_IRQHandler
 899                     	xdef	f_EXTI_PORTE_IRQHandler
 900                     	xdef	f_EXTI_PORTD_IRQHandler
 901                     	xdef	f_EXTI_PORTC_IRQHandler
 902                     	xdef	f_EXTI_PORTB_IRQHandler
 903                     	xdef	f_EXTI_PORTA_IRQHandler
 904                     	xdef	f_CLK_IRQHandler
 905                     	xdef	f_AWU_IRQHandler
 906                     	xdef	f_TLI_IRQHandler
 907                     	xdef	f_TRAP_IRQHandler
 908                     	xdef	f_NonHandledInterrupt
 909                     	xref	_TIM2_ClearITPendingBit
 910                     	xref	_TIM2_ClearFlag
 911                     	xref	_TIM1_ClearITPendingBit
 912                     	xref	_TIM1_ClearFlag
 913                     	xref.b	c_lreg
 914                     	xref.b	c_x
 915                     	xref.b	c_y
 934                     	xref	c_ldiv
 935                     	xref	c_rtol
 936                     	xref	c_uitolx
 937                     	xref	c_imul
 938                     	end
