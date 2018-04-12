   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 50 uint8_t ITC_GetCPUCC(void)
  45                     ; 51 {
  47                     .text:	section	.text,new
  48  0000               _ITC_GetCPUCC:
  52                     ; 53   _asm("push cc");
  55  0000 8a            push cc
  57                     ; 54   _asm("pop a");
  60  0001 84            pop a
  62                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  65  0002 81            	ret
  88                     ; 80 void ITC_DeInit(void)
  88                     ; 81 {
  89                     .text:	section	.text,new
  90  0000               _ITC_DeInit:
  94                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  96  0000 35ff7f70      	mov	32624,#255
  97                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  99  0004 35ff7f71      	mov	32625,#255
 100                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 102  0008 35ff7f72      	mov	32626,#255
 103                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 105  000c 35ff7f73      	mov	32627,#255
 106                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 108  0010 35ff7f74      	mov	32628,#255
 109                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 111  0014 35ff7f75      	mov	32629,#255
 112                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 114  0018 35ff7f76      	mov	32630,#255
 115                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 117  001c 35ff7f77      	mov	32631,#255
 118                     ; 90 }
 121  0020 81            	ret
 146                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 146                     ; 98 {
 147                     .text:	section	.text,new
 148  0000               _ITC_GetSoftIntStatus:
 152                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 154  0000 cd0000        	call	_ITC_GetCPUCC
 156  0003 a428          	and	a,#40
 159  0005 81            	ret
 405                     .const:	section	.text
 406  0000               L62:
 407  0000 003c          	dc.w	L14
 408  0002 003c          	dc.w	L14
 409  0004 003c          	dc.w	L14
 410  0006 003c          	dc.w	L14
 411  0008 0045          	dc.w	L34
 412  000a 0045          	dc.w	L34
 413  000c 0045          	dc.w	L34
 414  000e 0045          	dc.w	L34
 415  0010 0079          	dc.w	L102
 416  0012 0079          	dc.w	L102
 417  0014 004e          	dc.w	L54
 418  0016 004e          	dc.w	L54
 419  0018 0057          	dc.w	L74
 420  001a 0057          	dc.w	L74
 421  001c 0057          	dc.w	L74
 422  001e 0057          	dc.w	L74
 423  0020 0060          	dc.w	L15
 424  0022 0060          	dc.w	L15
 425  0024 0060          	dc.w	L15
 426  0026 0060          	dc.w	L15
 427  0028 0079          	dc.w	L102
 428  002a 0079          	dc.w	L102
 429  002c 0069          	dc.w	L35
 430  002e 0069          	dc.w	L35
 431  0030 0072          	dc.w	L55
 432                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 432                     ; 108 {
 433                     .text:	section	.text,new
 434  0000               _ITC_GetSoftwarePriority:
 436  0000 88            	push	a
 437  0001 89            	pushw	x
 438       00000002      OFST:	set	2
 441                     ; 109   uint8_t Value = 0;
 443  0002 0f02          	clr	(OFST+0,sp)
 445                     ; 110   uint8_t Mask = 0;
 447                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 449  0004 a119          	cp	a,#25
 450  0006 2403          	jruge	L41
 451  0008 4f            	clr	a
 452  0009 2010          	jra	L61
 453  000b               L41:
 454  000b ae0071        	ldw	x,#113
 455  000e 89            	pushw	x
 456  000f ae0000        	ldw	x,#0
 457  0012 89            	pushw	x
 458  0013 ae0064        	ldw	x,#L571
 459  0016 cd0000        	call	_assert_failed
 461  0019 5b04          	addw	sp,#4
 462  001b               L61:
 463                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 465  001b 7b03          	ld	a,(OFST+1,sp)
 466  001d a403          	and	a,#3
 467  001f 48            	sll	a
 468  0020 5f            	clrw	x
 469  0021 97            	ld	xl,a
 470  0022 a603          	ld	a,#3
 471  0024 5d            	tnzw	x
 472  0025 2704          	jreq	L02
 473  0027               L22:
 474  0027 48            	sll	a
 475  0028 5a            	decw	x
 476  0029 26fc          	jrne	L22
 477  002b               L02:
 478  002b 6b01          	ld	(OFST-1,sp),a
 480                     ; 118   switch (IrqNum)
 482  002d 7b03          	ld	a,(OFST+1,sp)
 484                     ; 198   default:
 484                     ; 199     break;
 485  002f a119          	cp	a,#25
 486  0031 2407          	jruge	L42
 487  0033 5f            	clrw	x
 488  0034 97            	ld	xl,a
 489  0035 58            	sllw	x
 490  0036 de0000        	ldw	x,(L62,x)
 491  0039 fc            	jp	(x)
 492  003a               L42:
 493  003a 203d          	jra	L102
 494  003c               L14:
 495                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 495                     ; 121   case ITC_IRQ_AWU:
 495                     ; 122   case ITC_IRQ_CLK:
 495                     ; 123   case ITC_IRQ_PORTA:
 495                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 497  003c c67f70        	ld	a,32624
 498  003f 1401          	and	a,(OFST-1,sp)
 499  0041 6b02          	ld	(OFST+0,sp),a
 501                     ; 125     break;
 503  0043 2034          	jra	L102
 504  0045               L34:
 505                     ; 127   case ITC_IRQ_PORTB:
 505                     ; 128   case ITC_IRQ_PORTC:
 505                     ; 129   case ITC_IRQ_PORTD:
 505                     ; 130   case ITC_IRQ_PORTE:
 505                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 507  0045 c67f71        	ld	a,32625
 508  0048 1401          	and	a,(OFST-1,sp)
 509  004a 6b02          	ld	(OFST+0,sp),a
 511                     ; 132     break;
 513  004c 202b          	jra	L102
 514  004e               L54:
 515                     ; 141   case ITC_IRQ_SPI:
 515                     ; 142   case ITC_IRQ_TIM1_OVF:
 515                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 517  004e c67f72        	ld	a,32626
 518  0051 1401          	and	a,(OFST-1,sp)
 519  0053 6b02          	ld	(OFST+0,sp),a
 521                     ; 144     break;
 523  0055 2022          	jra	L102
 524  0057               L74:
 525                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 525                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 525                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 525                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 525                     ; 150 #else
 525                     ; 151   case ITC_IRQ_TIM2_OVF:
 525                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 525                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 525                     ; 154   case ITC_IRQ_TIM3_OVF:
 525                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 527  0057 c67f73        	ld	a,32627
 528  005a 1401          	and	a,(OFST-1,sp)
 529  005c 6b02          	ld	(OFST+0,sp),a
 531                     ; 156     break;
 533  005e 2019          	jra	L102
 534  0060               L15:
 535                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 535                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 535                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 535                     ; 161   case ITC_IRQ_UART1_TX:
 535                     ; 162   case ITC_IRQ_UART1_RX:
 535                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 535                     ; 164 #if defined(STM8AF622x)
 535                     ; 165   case ITC_IRQ_UART4_TX:
 535                     ; 166   case ITC_IRQ_UART4_RX:
 535                     ; 167 #endif /*STM8AF622x */
 535                     ; 168   case ITC_IRQ_I2C:
 535                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 537  0060 c67f74        	ld	a,32628
 538  0063 1401          	and	a,(OFST-1,sp)
 539  0065 6b02          	ld	(OFST+0,sp),a
 541                     ; 170     break;
 543  0067 2010          	jra	L102
 544  0069               L35:
 545                     ; 184   case ITC_IRQ_ADC1:
 545                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 545                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 545                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 545                     ; 188 #else
 545                     ; 189   case ITC_IRQ_TIM4_OVF:
 545                     ; 190 #endif /*STM8S903 or STM8AF622x */
 545                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 547  0069 c67f75        	ld	a,32629
 548  006c 1401          	and	a,(OFST-1,sp)
 549  006e 6b02          	ld	(OFST+0,sp),a
 551                     ; 192     break;
 553  0070 2007          	jra	L102
 554  0072               L55:
 555                     ; 194   case ITC_IRQ_EEPROM_EEC:
 555                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 557  0072 c67f76        	ld	a,32630
 558  0075 1401          	and	a,(OFST-1,sp)
 559  0077 6b02          	ld	(OFST+0,sp),a
 561                     ; 196     break;
 563  0079               L75:
 564                     ; 198   default:
 564                     ; 199     break;
 566  0079               L102:
 567                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 569  0079 7b03          	ld	a,(OFST+1,sp)
 570  007b a403          	and	a,#3
 571  007d 48            	sll	a
 572  007e 5f            	clrw	x
 573  007f 97            	ld	xl,a
 574  0080 7b02          	ld	a,(OFST+0,sp)
 575  0082 5d            	tnzw	x
 576  0083 2704          	jreq	L03
 577  0085               L23:
 578  0085 44            	srl	a
 579  0086 5a            	decw	x
 580  0087 26fc          	jrne	L23
 581  0089               L03:
 582  0089 6b02          	ld	(OFST+0,sp),a
 584                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 586  008b 7b02          	ld	a,(OFST+0,sp)
 589  008d 5b03          	addw	sp,#3
 590  008f 81            	ret
 652                     	switch	.const
 653  0032               L66:
 654  0032 0091          	dc.w	L302
 655  0034 0091          	dc.w	L302
 656  0036 0091          	dc.w	L302
 657  0038 0091          	dc.w	L302
 658  003a 00a3          	dc.w	L502
 659  003c 00a3          	dc.w	L502
 660  003e 00a3          	dc.w	L502
 661  0040 00a3          	dc.w	L502
 662  0042 010d          	dc.w	L352
 663  0044 010d          	dc.w	L352
 664  0046 00b5          	dc.w	L702
 665  0048 00b5          	dc.w	L702
 666  004a 00c7          	dc.w	L112
 667  004c 00c7          	dc.w	L112
 668  004e 00c7          	dc.w	L112
 669  0050 00c7          	dc.w	L112
 670  0052 00d9          	dc.w	L312
 671  0054 00d9          	dc.w	L312
 672  0056 00d9          	dc.w	L312
 673  0058 00d9          	dc.w	L312
 674  005a 010d          	dc.w	L352
 675  005c 010d          	dc.w	L352
 676  005e 00eb          	dc.w	L512
 677  0060 00eb          	dc.w	L512
 678  0062 00fd          	dc.w	L712
 679                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 679                     ; 221 {
 680                     .text:	section	.text,new
 681  0000               _ITC_SetSoftwarePriority:
 683  0000 89            	pushw	x
 684  0001 89            	pushw	x
 685       00000002      OFST:	set	2
 688                     ; 222   uint8_t Mask = 0;
 690                     ; 223   uint8_t NewPriority = 0;
 692                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 694  0002 9e            	ld	a,xh
 695  0003 a119          	cp	a,#25
 696  0005 2403          	jruge	L63
 697  0007 4f            	clr	a
 698  0008 2010          	jra	L04
 699  000a               L63:
 700  000a ae00e2        	ldw	x,#226
 701  000d 89            	pushw	x
 702  000e ae0000        	ldw	x,#0
 703  0011 89            	pushw	x
 704  0012 ae0064        	ldw	x,#L571
 705  0015 cd0000        	call	_assert_failed
 707  0018 5b04          	addw	sp,#4
 708  001a               L04:
 709                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 711  001a 7b04          	ld	a,(OFST+2,sp)
 712  001c a102          	cp	a,#2
 713  001e 2710          	jreq	L44
 714  0020 7b04          	ld	a,(OFST+2,sp)
 715  0022 a101          	cp	a,#1
 716  0024 270a          	jreq	L44
 717  0026 0d04          	tnz	(OFST+2,sp)
 718  0028 2706          	jreq	L44
 719  002a 7b04          	ld	a,(OFST+2,sp)
 720  002c a103          	cp	a,#3
 721  002e 2603          	jrne	L24
 722  0030               L44:
 723  0030 4f            	clr	a
 724  0031 2010          	jra	L64
 725  0033               L24:
 726  0033 ae00e3        	ldw	x,#227
 727  0036 89            	pushw	x
 728  0037 ae0000        	ldw	x,#0
 729  003a 89            	pushw	x
 730  003b ae0064        	ldw	x,#L571
 731  003e cd0000        	call	_assert_failed
 733  0041 5b04          	addw	sp,#4
 734  0043               L64:
 735                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 737  0043 cd0000        	call	_ITC_GetSoftIntStatus
 739  0046 a128          	cp	a,#40
 740  0048 2603          	jrne	L05
 741  004a 4f            	clr	a
 742  004b 2010          	jra	L25
 743  004d               L05:
 744  004d ae00e6        	ldw	x,#230
 745  0050 89            	pushw	x
 746  0051 ae0000        	ldw	x,#0
 747  0054 89            	pushw	x
 748  0055 ae0064        	ldw	x,#L571
 749  0058 cd0000        	call	_assert_failed
 751  005b 5b04          	addw	sp,#4
 752  005d               L25:
 753                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 755  005d 7b03          	ld	a,(OFST+1,sp)
 756  005f a403          	and	a,#3
 757  0061 48            	sll	a
 758  0062 5f            	clrw	x
 759  0063 97            	ld	xl,a
 760  0064 a603          	ld	a,#3
 761  0066 5d            	tnzw	x
 762  0067 2704          	jreq	L45
 763  0069               L65:
 764  0069 48            	sll	a
 765  006a 5a            	decw	x
 766  006b 26fc          	jrne	L65
 767  006d               L45:
 768  006d 43            	cpl	a
 769  006e 6b01          	ld	(OFST-1,sp),a
 771                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 773  0070 7b03          	ld	a,(OFST+1,sp)
 774  0072 a403          	and	a,#3
 775  0074 48            	sll	a
 776  0075 5f            	clrw	x
 777  0076 97            	ld	xl,a
 778  0077 7b04          	ld	a,(OFST+2,sp)
 779  0079 5d            	tnzw	x
 780  007a 2704          	jreq	L06
 781  007c               L26:
 782  007c 48            	sll	a
 783  007d 5a            	decw	x
 784  007e 26fc          	jrne	L26
 785  0080               L06:
 786  0080 6b02          	ld	(OFST+0,sp),a
 788                     ; 239   switch (IrqNum)
 790  0082 7b03          	ld	a,(OFST+1,sp)
 792                     ; 329   default:
 792                     ; 330     break;
 793  0084 a119          	cp	a,#25
 794  0086 2407          	jruge	L46
 795  0088 5f            	clrw	x
 796  0089 97            	ld	xl,a
 797  008a 58            	sllw	x
 798  008b de0032        	ldw	x,(L66,x)
 799  008e fc            	jp	(x)
 800  008f               L46:
 801  008f 207c          	jra	L352
 802  0091               L302:
 803                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 803                     ; 242   case ITC_IRQ_AWU:
 803                     ; 243   case ITC_IRQ_CLK:
 803                     ; 244   case ITC_IRQ_PORTA:
 803                     ; 245     ITC->ISPR1 &= Mask;
 805  0091 c67f70        	ld	a,32624
 806  0094 1401          	and	a,(OFST-1,sp)
 807  0096 c77f70        	ld	32624,a
 808                     ; 246     ITC->ISPR1 |= NewPriority;
 810  0099 c67f70        	ld	a,32624
 811  009c 1a02          	or	a,(OFST+0,sp)
 812  009e c77f70        	ld	32624,a
 813                     ; 247     break;
 815  00a1 206a          	jra	L352
 816  00a3               L502:
 817                     ; 249   case ITC_IRQ_PORTB:
 817                     ; 250   case ITC_IRQ_PORTC:
 817                     ; 251   case ITC_IRQ_PORTD:
 817                     ; 252   case ITC_IRQ_PORTE:
 817                     ; 253     ITC->ISPR2 &= Mask;
 819  00a3 c67f71        	ld	a,32625
 820  00a6 1401          	and	a,(OFST-1,sp)
 821  00a8 c77f71        	ld	32625,a
 822                     ; 254     ITC->ISPR2 |= NewPriority;
 824  00ab c67f71        	ld	a,32625
 825  00ae 1a02          	or	a,(OFST+0,sp)
 826  00b0 c77f71        	ld	32625,a
 827                     ; 255     break;
 829  00b3 2058          	jra	L352
 830  00b5               L702:
 831                     ; 264   case ITC_IRQ_SPI:
 831                     ; 265   case ITC_IRQ_TIM1_OVF:
 831                     ; 266     ITC->ISPR3 &= Mask;
 833  00b5 c67f72        	ld	a,32626
 834  00b8 1401          	and	a,(OFST-1,sp)
 835  00ba c77f72        	ld	32626,a
 836                     ; 267     ITC->ISPR3 |= NewPriority;
 838  00bd c67f72        	ld	a,32626
 839  00c0 1a02          	or	a,(OFST+0,sp)
 840  00c2 c77f72        	ld	32626,a
 841                     ; 268     break;
 843  00c5 2046          	jra	L352
 844  00c7               L112:
 845                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 845                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 845                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 845                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 845                     ; 274 #else
 845                     ; 275   case ITC_IRQ_TIM2_OVF:
 845                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 845                     ; 277 #endif /*STM8S903 or STM8AF622x */
 845                     ; 278   case ITC_IRQ_TIM3_OVF:
 845                     ; 279     ITC->ISPR4 &= Mask;
 847  00c7 c67f73        	ld	a,32627
 848  00ca 1401          	and	a,(OFST-1,sp)
 849  00cc c77f73        	ld	32627,a
 850                     ; 280     ITC->ISPR4 |= NewPriority;
 852  00cf c67f73        	ld	a,32627
 853  00d2 1a02          	or	a,(OFST+0,sp)
 854  00d4 c77f73        	ld	32627,a
 855                     ; 281     break;
 857  00d7 2034          	jra	L352
 858  00d9               L312:
 859                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 859                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 859                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 859                     ; 286   case ITC_IRQ_UART1_TX:
 859                     ; 287   case ITC_IRQ_UART1_RX:
 859                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 859                     ; 289 #if defined(STM8AF622x)
 859                     ; 290   case ITC_IRQ_UART4_TX:
 859                     ; 291   case ITC_IRQ_UART4_RX:
 859                     ; 292 #endif /*STM8AF622x */
 859                     ; 293   case ITC_IRQ_I2C:
 859                     ; 294     ITC->ISPR5 &= Mask;
 861  00d9 c67f74        	ld	a,32628
 862  00dc 1401          	and	a,(OFST-1,sp)
 863  00de c77f74        	ld	32628,a
 864                     ; 295     ITC->ISPR5 |= NewPriority;
 866  00e1 c67f74        	ld	a,32628
 867  00e4 1a02          	or	a,(OFST+0,sp)
 868  00e6 c77f74        	ld	32628,a
 869                     ; 296     break;
 871  00e9 2022          	jra	L352
 872  00eb               L512:
 873                     ; 312   case ITC_IRQ_ADC1:
 873                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 873                     ; 314     
 873                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 873                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 873                     ; 317 #else
 873                     ; 318   case ITC_IRQ_TIM4_OVF:
 873                     ; 319 #endif /* STM8S903 or STM8AF622x */
 873                     ; 320     ITC->ISPR6 &= Mask;
 875  00eb c67f75        	ld	a,32629
 876  00ee 1401          	and	a,(OFST-1,sp)
 877  00f0 c77f75        	ld	32629,a
 878                     ; 321     ITC->ISPR6 |= NewPriority;
 880  00f3 c67f75        	ld	a,32629
 881  00f6 1a02          	or	a,(OFST+0,sp)
 882  00f8 c77f75        	ld	32629,a
 883                     ; 322     break;
 885  00fb 2010          	jra	L352
 886  00fd               L712:
 887                     ; 324   case ITC_IRQ_EEPROM_EEC:
 887                     ; 325     ITC->ISPR7 &= Mask;
 889  00fd c67f76        	ld	a,32630
 890  0100 1401          	and	a,(OFST-1,sp)
 891  0102 c77f76        	ld	32630,a
 892                     ; 326     ITC->ISPR7 |= NewPriority;
 894  0105 c67f76        	ld	a,32630
 895  0108 1a02          	or	a,(OFST+0,sp)
 896  010a c77f76        	ld	32630,a
 897                     ; 327     break;
 899  010d               L122:
 900                     ; 329   default:
 900                     ; 330     break;
 902  010d               L352:
 903                     ; 332 }
 906  010d 5b04          	addw	sp,#4
 907  010f 81            	ret
 920                     	xdef	_ITC_GetSoftwarePriority
 921                     	xdef	_ITC_SetSoftwarePriority
 922                     	xdef	_ITC_GetSoftIntStatus
 923                     	xdef	_ITC_DeInit
 924                     	xdef	_ITC_GetCPUCC
 925                     	xref	_assert_failed
 926                     	switch	.const
 927  0064               L571:
 928  0064 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
 929  0076 6974632e6300  	dc.b	"itc.c",0
 949                     	end
