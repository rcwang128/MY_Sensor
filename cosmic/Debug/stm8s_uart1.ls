   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  49                     ; 53 void UART1_DeInit(void)
  49                     ; 54 {
  51                     .text:	section	.text,new
  52  0000               _UART1_DeInit:
  56                     ; 57   (void)UART1->SR;
  58  0000 c65230        	ld	a,21040
  59                     ; 58   (void)UART1->DR;
  61  0003 c65231        	ld	a,21041
  62                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  64  0006 725f5233      	clr	21043
  65                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  67  000a 725f5232      	clr	21042
  68                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  70  000e 725f5234      	clr	21044
  71                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  73  0012 725f5235      	clr	21045
  74                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  76  0016 725f5236      	clr	21046
  77                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  79  001a 725f5237      	clr	21047
  80                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  82  001e 725f5238      	clr	21048
  83                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  85  0022 725f5239      	clr	21049
  86                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  88  0026 725f523a      	clr	21050
  89                     ; 71 }
  92  002a 81            	ret	
 390                     .const:	section	.text
 391  0000               L21:
 392  0000 00098969      	dc.l	625001
 393  0004               L27:
 394  0004 00000064      	dc.l	100
 395                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 395                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 395                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 395                     ; 93 {
 396                     .text:	section	.text,new
 397  0000               _UART1_Init:
 399  0000 520c          	subw	sp,#12
 400       0000000c      OFST:	set	12
 403                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 407                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 409  0002 96            	ldw	x,sp
 410  0003 1c000f        	addw	x,#OFST+3
 411  0006 cd0000        	call	c_ltor
 413  0009 ae0000        	ldw	x,#L21
 414  000c cd0000        	call	c_lcmp
 416  000f 2506          	jrult	L41
 417  0011 ae0061        	ldw	x,#97
 418  0014 cd01b5        	call	LC001
 419  0017               L41:
 420                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 422  0017 7b13          	ld	a,(OFST+7,sp)
 423  0019 270a          	jreq	L42
 424  001b a110          	cp	a,#16
 425  001d 2706          	jreq	L42
 426  001f ae0062        	ldw	x,#98
 427  0022 cd01b5        	call	LC001
 428  0025               L42:
 429                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 431  0025 7b14          	ld	a,(OFST+8,sp)
 432  0027 2712          	jreq	L43
 433  0029 a110          	cp	a,#16
 434  002b 270e          	jreq	L43
 435  002d a120          	cp	a,#32
 436  002f 270a          	jreq	L43
 437  0031 a130          	cp	a,#48
 438  0033 2706          	jreq	L43
 439  0035 ae0063        	ldw	x,#99
 440  0038 cd01b5        	call	LC001
 441  003b               L43:
 442                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 444  003b 7b15          	ld	a,(OFST+9,sp)
 445  003d 270e          	jreq	L44
 446  003f a104          	cp	a,#4
 447  0041 270a          	jreq	L44
 448  0043 a106          	cp	a,#6
 449  0045 2706          	jreq	L44
 450  0047 ae0064        	ldw	x,#100
 451  004a cd01b5        	call	LC001
 452  004d               L44:
 453                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 455  004d 7b17          	ld	a,(OFST+11,sp)
 456  004f a108          	cp	a,#8
 457  0051 2722          	jreq	L45
 458  0053 a140          	cp	a,#64
 459  0055 271e          	jreq	L45
 460  0057 a104          	cp	a,#4
 461  0059 271a          	jreq	L45
 462  005b a180          	cp	a,#128
 463  005d 2716          	jreq	L45
 464  005f a10c          	cp	a,#12
 465  0061 2712          	jreq	L45
 466  0063 a144          	cp	a,#68
 467  0065 270e          	jreq	L45
 468  0067 a1c0          	cp	a,#192
 469  0069 270a          	jreq	L45
 470  006b a188          	cp	a,#136
 471  006d 2706          	jreq	L45
 472  006f ae0065        	ldw	x,#101
 473  0072 cd01b5        	call	LC001
 474  0075               L45:
 475                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 477  0075 7b16          	ld	a,(OFST+10,sp)
 478  0077 a488          	and	a,#136
 479  0079 a188          	cp	a,#136
 480  007b 2718          	jreq	L06
 481  007d 7b16          	ld	a,(OFST+10,sp)
 482  007f a444          	and	a,#68
 483  0081 a144          	cp	a,#68
 484  0083 2710          	jreq	L06
 485  0085 7b16          	ld	a,(OFST+10,sp)
 486  0087 a422          	and	a,#34
 487  0089 a122          	cp	a,#34
 488  008b 2708          	jreq	L06
 489  008d 7b16          	ld	a,(OFST+10,sp)
 490  008f a411          	and	a,#17
 491  0091 a111          	cp	a,#17
 492  0093 2606          	jrne	L26
 493  0095               L06:
 494  0095 ae0066        	ldw	x,#102
 495  0098 cd01b5        	call	LC001
 496  009b               L26:
 497                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 499  009b 72195234      	bres	21044,#4
 500                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 502  009f c65234        	ld	a,21044
 503  00a2 1a13          	or	a,(OFST+7,sp)
 504  00a4 c75234        	ld	21044,a
 505                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 507  00a7 c65236        	ld	a,21046
 508  00aa a4cf          	and	a,#207
 509  00ac c75236        	ld	21046,a
 510                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 512  00af c65236        	ld	a,21046
 513  00b2 1a14          	or	a,(OFST+8,sp)
 514  00b4 c75236        	ld	21046,a
 515                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 517  00b7 c65234        	ld	a,21044
 518  00ba a4f9          	and	a,#249
 519  00bc c75234        	ld	21044,a
 520                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 522  00bf c65234        	ld	a,21044
 523  00c2 1a15          	or	a,(OFST+9,sp)
 524  00c4 c75234        	ld	21044,a
 525                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 527  00c7 725f5232      	clr	21042
 528                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 530  00cb c65233        	ld	a,21043
 531  00ce a40f          	and	a,#15
 532  00d0 c75233        	ld	21043,a
 533                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 535  00d3 c65233        	ld	a,21043
 536  00d6 a4f0          	and	a,#240
 537  00d8 c75233        	ld	21043,a
 538                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 540  00db 96            	ldw	x,sp
 541  00dc cd01c1        	call	LC002
 543  00df 96            	ldw	x,sp
 544  00e0 5c            	incw	x
 545  00e1 cd0000        	call	c_rtol
 548  00e4 cd0000        	call	_CLK_GetClockFreq
 550  00e7 96            	ldw	x,sp
 551  00e8 5c            	incw	x
 552  00e9 cd0000        	call	c_ludv
 554  00ec 96            	ldw	x,sp
 555  00ed 1c0009        	addw	x,#OFST-3
 556  00f0 cd0000        	call	c_rtol
 559                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 561  00f3 96            	ldw	x,sp
 562  00f4 cd01c1        	call	LC002
 564  00f7 96            	ldw	x,sp
 565  00f8 5c            	incw	x
 566  00f9 cd0000        	call	c_rtol
 569  00fc cd0000        	call	_CLK_GetClockFreq
 571  00ff a664          	ld	a,#100
 572  0101 cd0000        	call	c_smul
 574  0104 96            	ldw	x,sp
 575  0105 5c            	incw	x
 576  0106 cd0000        	call	c_ludv
 578  0109 96            	ldw	x,sp
 579  010a 1c0005        	addw	x,#OFST-7
 580  010d cd0000        	call	c_rtol
 583                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 585  0110 96            	ldw	x,sp
 586  0111 1c0009        	addw	x,#OFST-3
 587  0114 cd0000        	call	c_ltor
 589  0117 a664          	ld	a,#100
 590  0119 cd0000        	call	c_smul
 592  011c 96            	ldw	x,sp
 593  011d 5c            	incw	x
 594  011e cd0000        	call	c_rtol
 597  0121 96            	ldw	x,sp
 598  0122 1c0005        	addw	x,#OFST-7
 599  0125 cd0000        	call	c_ltor
 601  0128 96            	ldw	x,sp
 602  0129 5c            	incw	x
 603  012a cd0000        	call	c_lsub
 605  012d a604          	ld	a,#4
 606  012f cd0000        	call	c_llsh
 608  0132 ae0004        	ldw	x,#L27
 609  0135 cd0000        	call	c_ludv
 611  0138 b603          	ld	a,c_lreg+3
 612  013a a40f          	and	a,#15
 613  013c ca5233        	or	a,21043
 614  013f c75233        	ld	21043,a
 615                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 617  0142 96            	ldw	x,sp
 618  0143 1c0009        	addw	x,#OFST-3
 619  0146 cd0000        	call	c_ltor
 621  0149 a604          	ld	a,#4
 622  014b cd0000        	call	c_lursh
 624  014e b603          	ld	a,c_lreg+3
 625  0150 a4f0          	and	a,#240
 626  0152 b703          	ld	c_lreg+3,a
 627  0154 3f02          	clr	c_lreg+2
 628  0156 3f01          	clr	c_lreg+1
 629  0158 3f00          	clr	c_lreg
 630  015a ca5233        	or	a,21043
 631  015d c75233        	ld	21043,a
 632                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 634  0160 c65232        	ld	a,21042
 635  0163 1a0c          	or	a,(OFST+0,sp)
 636  0165 c75232        	ld	21042,a
 637                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 639  0168 c65235        	ld	a,21045
 640  016b a4f3          	and	a,#243
 641  016d c75235        	ld	21045,a
 642                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 644  0170 c65236        	ld	a,21046
 645  0173 a4f8          	and	a,#248
 646  0175 c75236        	ld	21046,a
 647                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 647                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 649  0178 7b16          	ld	a,(OFST+10,sp)
 650  017a a407          	and	a,#7
 651  017c ca5236        	or	a,21046
 652  017f c75236        	ld	21046,a
 653                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 655  0182 7b17          	ld	a,(OFST+11,sp)
 656  0184 a504          	bcp	a,#4
 657  0186 2706          	jreq	L761
 658                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 660  0188 72165235      	bset	21045,#3
 662  018c 2004          	jra	L171
 663  018e               L761:
 664                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 666  018e 72175235      	bres	21045,#3
 667  0192               L171:
 668                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 670  0192 a508          	bcp	a,#8
 671  0194 2706          	jreq	L371
 672                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 674  0196 72145235      	bset	21045,#2
 676  019a 2004          	jra	L571
 677  019c               L371:
 678                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 680  019c 72155235      	bres	21045,#2
 681  01a0               L571:
 682                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 684  01a0 7b16          	ld	a,(OFST+10,sp)
 685  01a2 2a06          	jrpl	L771
 686                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 688  01a4 72175236      	bres	21046,#3
 690  01a8 2008          	jra	L102
 691  01aa               L771:
 692                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 694  01aa a408          	and	a,#8
 695  01ac ca5236        	or	a,21046
 696  01af c75236        	ld	21046,a
 697  01b2               L102:
 698                     ; 176 }
 701  01b2 5b0c          	addw	sp,#12
 702  01b4 81            	ret	
 703  01b5               LC001:
 704  01b5 89            	pushw	x
 705  01b6 5f            	clrw	x
 706  01b7 89            	pushw	x
 707  01b8 ae0008        	ldw	x,#L561
 708  01bb cd0000        	call	_assert_failed
 710  01be 5b04          	addw	sp,#4
 711  01c0 81            	ret	
 712  01c1               LC002:
 713  01c1 1c000f        	addw	x,#OFST+3
 714  01c4 cd0000        	call	c_ltor
 716  01c7 a604          	ld	a,#4
 717  01c9 cc0000        	jp	c_llsh
 772                     ; 184 void UART1_Cmd(FunctionalState NewState)
 772                     ; 185 {
 773                     .text:	section	.text,new
 774  0000               _UART1_Cmd:
 778                     ; 186   if (NewState != DISABLE)
 780  0000 4d            	tnz	a
 781  0001 2705          	jreq	L132
 782                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 784  0003 721b5234      	bres	21044,#5
 787  0007 81            	ret	
 788  0008               L132:
 789                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 791  0008 721a5234      	bset	21044,#5
 792                     ; 196 }
 795  000c 81            	ret	
 917                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 917                     ; 212 {
 918                     .text:	section	.text,new
 919  0000               _UART1_ITConfig:
 921  0000 89            	pushw	x
 922  0001 89            	pushw	x
 923       00000002      OFST:	set	2
 926                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 930                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 932  0002 a30100        	cpw	x,#256
 933  0005 271e          	jreq	L401
 934  0007 a30277        	cpw	x,#631
 935  000a 2719          	jreq	L401
 936  000c a30266        	cpw	x,#614
 937  000f 2714          	jreq	L401
 938  0011 a30205        	cpw	x,#517
 939  0014 270f          	jreq	L401
 940  0016 a30244        	cpw	x,#580
 941  0019 270a          	jreq	L401
 942  001b a30346        	cpw	x,#838
 943  001e 2705          	jreq	L401
 944  0020 ae00d8        	ldw	x,#216
 945  0023 ad70          	call	LC006
 946  0025               L401:
 947                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 949  0025 7b07          	ld	a,(OFST+5,sp)
 950  0027 2708          	jreq	L411
 951  0029 4a            	dec	a
 952  002a 2705          	jreq	L411
 953  002c ae00d9        	ldw	x,#217
 954  002f ad64          	call	LC006
 955  0031               L411:
 956                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 958  0031 7b03          	ld	a,(OFST+1,sp)
 959  0033 6b01          	ld	(OFST-1,sp),a
 961                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 963  0035 7b04          	ld	a,(OFST+2,sp)
 964  0037 a40f          	and	a,#15
 965  0039 5f            	clrw	x
 966  003a 97            	ld	xl,a
 967  003b a601          	ld	a,#1
 968  003d 5d            	tnzw	x
 969  003e 2704          	jreq	L021
 970  0040               L221:
 971  0040 48            	sll	a
 972  0041 5a            	decw	x
 973  0042 26fc          	jrne	L221
 974  0044               L021:
 975  0044 6b02          	ld	(OFST+0,sp),a
 977                     ; 224   if (NewState != DISABLE)
 979  0046 7b07          	ld	a,(OFST+5,sp)
 980  0048 271f          	jreq	L703
 981                     ; 227     if (uartreg == 0x01)
 983  004a 7b01          	ld	a,(OFST-1,sp)
 984  004c a101          	cp	a,#1
 985  004e 2607          	jrne	L113
 986                     ; 229       UART1->CR1 |= itpos;
 988  0050 c65234        	ld	a,21044
 989  0053 1a02          	or	a,(OFST+0,sp)
 991  0055 201e          	jp	LC004
 992  0057               L113:
 993                     ; 231     else if (uartreg == 0x02)
 995  0057 a102          	cp	a,#2
 996  0059 2607          	jrne	L513
 997                     ; 233       UART1->CR2 |= itpos;
 999  005b c65235        	ld	a,21045
1000  005e 1a02          	or	a,(OFST+0,sp)
1002  0060 2022          	jp	LC005
1003  0062               L513:
1004                     ; 237       UART1->CR4 |= itpos;
1006  0062 c65237        	ld	a,21047
1007  0065 1a02          	or	a,(OFST+0,sp)
1008  0067 2026          	jp	LC003
1009  0069               L703:
1010                     ; 243     if (uartreg == 0x01)
1012  0069 7b01          	ld	a,(OFST-1,sp)
1013  006b a101          	cp	a,#1
1014  006d 260b          	jrne	L323
1015                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1017  006f 7b02          	ld	a,(OFST+0,sp)
1018  0071 43            	cpl	a
1019  0072 c45234        	and	a,21044
1020  0075               LC004:
1021  0075 c75234        	ld	21044,a
1023  0078 2018          	jra	L123
1024  007a               L323:
1025                     ; 247     else if (uartreg == 0x02)
1027  007a a102          	cp	a,#2
1028  007c 260b          	jrne	L723
1029                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1031  007e 7b02          	ld	a,(OFST+0,sp)
1032  0080 43            	cpl	a
1033  0081 c45235        	and	a,21045
1034  0084               LC005:
1035  0084 c75235        	ld	21045,a
1037  0087 2009          	jra	L123
1038  0089               L723:
1039                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1041  0089 7b02          	ld	a,(OFST+0,sp)
1042  008b 43            	cpl	a
1043  008c c45237        	and	a,21047
1044  008f               LC003:
1045  008f c75237        	ld	21047,a
1046  0092               L123:
1047                     ; 257 }
1050  0092 5b04          	addw	sp,#4
1051  0094 81            	ret	
1052  0095               LC006:
1053  0095 89            	pushw	x
1054  0096 5f            	clrw	x
1055  0097 89            	pushw	x
1056  0098 ae0008        	ldw	x,#L561
1057  009b cd0000        	call	_assert_failed
1059  009e 5b04          	addw	sp,#4
1060  00a0 81            	ret	
1097                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1097                     ; 266 {
1098                     .text:	section	.text,new
1099  0000               _UART1_HalfDuplexCmd:
1101  0000 88            	push	a
1102       00000000      OFST:	set	0
1105                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1107  0001 4d            	tnz	a
1108  0002 2711          	jreq	L231
1109  0004 4a            	dec	a
1110  0005 270e          	jreq	L231
1111  0007 ae010b        	ldw	x,#267
1112  000a 89            	pushw	x
1113  000b 5f            	clrw	x
1114  000c 89            	pushw	x
1115  000d ae0008        	ldw	x,#L561
1116  0010 cd0000        	call	_assert_failed
1118  0013 5b04          	addw	sp,#4
1119  0015               L231:
1120                     ; 269   if (NewState != DISABLE)
1122  0015 7b01          	ld	a,(OFST+1,sp)
1123  0017 2706          	jreq	L153
1124                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1126  0019 72165238      	bset	21048,#3
1128  001d 2004          	jra	L353
1129  001f               L153:
1130                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1132  001f 72175238      	bres	21048,#3
1133  0023               L353:
1134                     ; 277 }
1137  0023 84            	pop	a
1138  0024 81            	ret	
1196                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1196                     ; 286 {
1197                     .text:	section	.text,new
1198  0000               _UART1_IrDAConfig:
1200  0000 88            	push	a
1201       00000000      OFST:	set	0
1204                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1206  0001 a101          	cp	a,#1
1207  0003 2711          	jreq	L441
1208  0005 4d            	tnz	a
1209  0006 270e          	jreq	L441
1210  0008 ae011f        	ldw	x,#287
1211  000b 89            	pushw	x
1212  000c 5f            	clrw	x
1213  000d 89            	pushw	x
1214  000e ae0008        	ldw	x,#L561
1215  0011 cd0000        	call	_assert_failed
1217  0014 5b04          	addw	sp,#4
1218  0016               L441:
1219                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1221  0016 7b01          	ld	a,(OFST+1,sp)
1222  0018 2706          	jreq	L304
1223                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1225  001a 72145238      	bset	21048,#2
1227  001e 2004          	jra	L504
1228  0020               L304:
1229                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1231  0020 72155238      	bres	21048,#2
1232  0024               L504:
1233                     ; 297 }
1236  0024 84            	pop	a
1237  0025 81            	ret	
1273                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1273                     ; 306 {
1274                     .text:	section	.text,new
1275  0000               _UART1_IrDACmd:
1277  0000 88            	push	a
1278       00000000      OFST:	set	0
1281                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1283  0001 4d            	tnz	a
1284  0002 2711          	jreq	L651
1285  0004 4a            	dec	a
1286  0005 270e          	jreq	L651
1287  0007 ae0134        	ldw	x,#308
1288  000a 89            	pushw	x
1289  000b 5f            	clrw	x
1290  000c 89            	pushw	x
1291  000d ae0008        	ldw	x,#L561
1292  0010 cd0000        	call	_assert_failed
1294  0013 5b04          	addw	sp,#4
1295  0015               L651:
1296                     ; 310   if (NewState != DISABLE)
1298  0015 7b01          	ld	a,(OFST+1,sp)
1299  0017 2706          	jreq	L524
1300                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1302  0019 72125238      	bset	21048,#1
1304  001d 2004          	jra	L724
1305  001f               L524:
1306                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1308  001f 72135238      	bres	21048,#1
1309  0023               L724:
1310                     ; 320 }
1313  0023 84            	pop	a
1314  0024 81            	ret	
1374                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1374                     ; 330 {
1375                     .text:	section	.text,new
1376  0000               _UART1_LINBreakDetectionConfig:
1378  0000 88            	push	a
1379       00000000      OFST:	set	0
1382                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1384  0001 4d            	tnz	a
1385  0002 2711          	jreq	L071
1386  0004 4a            	dec	a
1387  0005 270e          	jreq	L071
1388  0007 ae014b        	ldw	x,#331
1389  000a 89            	pushw	x
1390  000b 5f            	clrw	x
1391  000c 89            	pushw	x
1392  000d ae0008        	ldw	x,#L561
1393  0010 cd0000        	call	_assert_failed
1395  0013 5b04          	addw	sp,#4
1396  0015               L071:
1397                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1399  0015 7b01          	ld	a,(OFST+1,sp)
1400  0017 2706          	jreq	L754
1401                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1403  0019 721a5237      	bset	21047,#5
1405  001d 2004          	jra	L164
1406  001f               L754:
1407                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1409  001f 721b5237      	bres	21047,#5
1410  0023               L164:
1411                     ; 341 }
1414  0023 84            	pop	a
1415  0024 81            	ret	
1451                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1451                     ; 350 {
1452                     .text:	section	.text,new
1453  0000               _UART1_LINCmd:
1455  0000 88            	push	a
1456       00000000      OFST:	set	0
1459                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1461  0001 4d            	tnz	a
1462  0002 2711          	jreq	L202
1463  0004 4a            	dec	a
1464  0005 270e          	jreq	L202
1465  0007 ae015f        	ldw	x,#351
1466  000a 89            	pushw	x
1467  000b 5f            	clrw	x
1468  000c 89            	pushw	x
1469  000d ae0008        	ldw	x,#L561
1470  0010 cd0000        	call	_assert_failed
1472  0013 5b04          	addw	sp,#4
1473  0015               L202:
1474                     ; 353   if (NewState != DISABLE)
1476  0015 7b01          	ld	a,(OFST+1,sp)
1477  0017 2706          	jreq	L105
1478                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1480  0019 721c5236      	bset	21046,#6
1482  001d 2004          	jra	L305
1483  001f               L105:
1484                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1486  001f 721d5236      	bres	21046,#6
1487  0023               L305:
1488                     ; 363 }
1491  0023 84            	pop	a
1492  0024 81            	ret	
1528                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1528                     ; 372 {
1529                     .text:	section	.text,new
1530  0000               _UART1_SmartCardCmd:
1532  0000 88            	push	a
1533       00000000      OFST:	set	0
1536                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1538  0001 4d            	tnz	a
1539  0002 2711          	jreq	L412
1540  0004 4a            	dec	a
1541  0005 270e          	jreq	L412
1542  0007 ae0175        	ldw	x,#373
1543  000a 89            	pushw	x
1544  000b 5f            	clrw	x
1545  000c 89            	pushw	x
1546  000d ae0008        	ldw	x,#L561
1547  0010 cd0000        	call	_assert_failed
1549  0013 5b04          	addw	sp,#4
1550  0015               L412:
1551                     ; 375   if (NewState != DISABLE)
1553  0015 7b01          	ld	a,(OFST+1,sp)
1554  0017 2706          	jreq	L325
1555                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1557  0019 721a5238      	bset	21048,#5
1559  001d 2004          	jra	L525
1560  001f               L325:
1561                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1563  001f 721b5238      	bres	21048,#5
1564  0023               L525:
1565                     ; 385 }
1568  0023 84            	pop	a
1569  0024 81            	ret	
1606                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1606                     ; 395 {
1607                     .text:	section	.text,new
1608  0000               _UART1_SmartCardNACKCmd:
1610  0000 88            	push	a
1611       00000000      OFST:	set	0
1614                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1616  0001 4d            	tnz	a
1617  0002 2711          	jreq	L622
1618  0004 4a            	dec	a
1619  0005 270e          	jreq	L622
1620  0007 ae018c        	ldw	x,#396
1621  000a 89            	pushw	x
1622  000b 5f            	clrw	x
1623  000c 89            	pushw	x
1624  000d ae0008        	ldw	x,#L561
1625  0010 cd0000        	call	_assert_failed
1627  0013 5b04          	addw	sp,#4
1628  0015               L622:
1629                     ; 398   if (NewState != DISABLE)
1631  0015 7b01          	ld	a,(OFST+1,sp)
1632  0017 2706          	jreq	L545
1633                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1635  0019 72185238      	bset	21048,#4
1637  001d 2004          	jra	L745
1638  001f               L545:
1639                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1641  001f 72195238      	bres	21048,#4
1642  0023               L745:
1643                     ; 408 }
1646  0023 84            	pop	a
1647  0024 81            	ret	
1705                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1705                     ; 417 {
1706                     .text:	section	.text,new
1707  0000               _UART1_WakeUpConfig:
1709  0000 88            	push	a
1710       00000000      OFST:	set	0
1713                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1715  0001 4d            	tnz	a
1716  0002 2712          	jreq	L042
1717  0004 a108          	cp	a,#8
1718  0006 270e          	jreq	L042
1719  0008 ae01a2        	ldw	x,#418
1720  000b 89            	pushw	x
1721  000c 5f            	clrw	x
1722  000d 89            	pushw	x
1723  000e ae0008        	ldw	x,#L561
1724  0011 cd0000        	call	_assert_failed
1726  0014 5b04          	addw	sp,#4
1727  0016               L042:
1728                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1730  0016 72175234      	bres	21044,#3
1731                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1733  001a c65234        	ld	a,21044
1734  001d 1a01          	or	a,(OFST+1,sp)
1735  001f c75234        	ld	21044,a
1736                     ; 422 }
1739  0022 84            	pop	a
1740  0023 81            	ret	
1777                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1777                     ; 431 {
1778                     .text:	section	.text,new
1779  0000               _UART1_ReceiverWakeUpCmd:
1781  0000 88            	push	a
1782       00000000      OFST:	set	0
1785                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1787  0001 4d            	tnz	a
1788  0002 2711          	jreq	L252
1789  0004 4a            	dec	a
1790  0005 270e          	jreq	L252
1791  0007 ae01b0        	ldw	x,#432
1792  000a 89            	pushw	x
1793  000b 5f            	clrw	x
1794  000c 89            	pushw	x
1795  000d ae0008        	ldw	x,#L561
1796  0010 cd0000        	call	_assert_failed
1798  0013 5b04          	addw	sp,#4
1799  0015               L252:
1800                     ; 434   if (NewState != DISABLE)
1802  0015 7b01          	ld	a,(OFST+1,sp)
1803  0017 2706          	jreq	L516
1804                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1806  0019 72125235      	bset	21045,#1
1808  001d 2004          	jra	L716
1809  001f               L516:
1810                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1812  001f 72135235      	bres	21045,#1
1813  0023               L716:
1814                     ; 444 }
1817  0023 84            	pop	a
1818  0024 81            	ret	
1841                     ; 451 uint8_t UART1_ReceiveData8(void)
1841                     ; 452 {
1842                     .text:	section	.text,new
1843  0000               _UART1_ReceiveData8:
1847                     ; 453   return ((uint8_t)UART1->DR);
1849  0000 c65231        	ld	a,21041
1852  0003 81            	ret	
1884                     ; 461 uint16_t UART1_ReceiveData9(void)
1884                     ; 462 {
1885                     .text:	section	.text,new
1886  0000               _UART1_ReceiveData9:
1888  0000 89            	pushw	x
1889       00000002      OFST:	set	2
1892                     ; 463   uint16_t temp = 0;
1894                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1896  0001 c65234        	ld	a,21044
1897  0004 a480          	and	a,#128
1898  0006 5f            	clrw	x
1899  0007 02            	rlwa	x,a
1900  0008 58            	sllw	x
1901  0009 1f01          	ldw	(OFST-1,sp),x
1903                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1905  000b c65231        	ld	a,21041
1906  000e 5f            	clrw	x
1907  000f 97            	ld	xl,a
1908  0010 01            	rrwa	x,a
1909  0011 1a02          	or	a,(OFST+0,sp)
1910  0013 01            	rrwa	x,a
1911  0014 1a01          	or	a,(OFST-1,sp)
1912  0016 a401          	and	a,#1
1913  0018 01            	rrwa	x,a
1916  0019 5b02          	addw	sp,#2
1917  001b 81            	ret	
1949                     ; 474 void UART1_SendData8(uint8_t Data)
1949                     ; 475 {
1950                     .text:	section	.text,new
1951  0000               _UART1_SendData8:
1955                     ; 477   UART1->DR = Data;
1957  0000 c75231        	ld	21041,a
1958                     ; 478 }
1961  0003 81            	ret	
1993                     ; 486 void UART1_SendData9(uint16_t Data)
1993                     ; 487 {
1994                     .text:	section	.text,new
1995  0000               _UART1_SendData9:
1997  0000 89            	pushw	x
1998       00000000      OFST:	set	0
2001                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2003  0001 721d5234      	bres	21044,#6
2004                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2006  0005 54            	srlw	x
2007  0006 54            	srlw	x
2008  0007 9f            	ld	a,xl
2009  0008 a440          	and	a,#64
2010  000a ca5234        	or	a,21044
2011  000d c75234        	ld	21044,a
2012                     ; 493   UART1->DR   = (uint8_t)(Data);
2014  0010 7b02          	ld	a,(OFST+2,sp)
2015  0012 c75231        	ld	21041,a
2016                     ; 494 }
2019  0015 85            	popw	x
2020  0016 81            	ret	
2043                     ; 501 void UART1_SendBreak(void)
2043                     ; 502 {
2044                     .text:	section	.text,new
2045  0000               _UART1_SendBreak:
2049                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2051  0000 72105235      	bset	21045,#0
2052                     ; 504 }
2055  0004 81            	ret	
2088                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2088                     ; 512 {
2089                     .text:	section	.text,new
2090  0000               _UART1_SetAddress:
2092  0000 88            	push	a
2093       00000000      OFST:	set	0
2096                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2098  0001 a110          	cp	a,#16
2099  0003 250e          	jrult	L472
2100  0005 ae0202        	ldw	x,#514
2101  0008 89            	pushw	x
2102  0009 5f            	clrw	x
2103  000a 89            	pushw	x
2104  000b ae0008        	ldw	x,#L561
2105  000e cd0000        	call	_assert_failed
2107  0011 5b04          	addw	sp,#4
2108  0013               L472:
2109                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2111  0013 c65237        	ld	a,21047
2112  0016 a4f0          	and	a,#240
2113  0018 c75237        	ld	21047,a
2114                     ; 519   UART1->CR4 |= UART1_Address;
2116  001b c65237        	ld	a,21047
2117  001e 1a01          	or	a,(OFST+1,sp)
2118  0020 c75237        	ld	21047,a
2119                     ; 520 }
2122  0023 84            	pop	a
2123  0024 81            	ret	
2155                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2155                     ; 529 {
2156                     .text:	section	.text,new
2157  0000               _UART1_SetGuardTime:
2161                     ; 531   UART1->GTR = UART1_GuardTime;
2163  0000 c75239        	ld	21049,a
2164                     ; 532 }
2167  0003 81            	ret	
2199                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2199                     ; 557 {
2200                     .text:	section	.text,new
2201  0000               _UART1_SetPrescaler:
2205                     ; 559   UART1->PSCR = UART1_Prescaler;
2207  0000 c7523a        	ld	21050,a
2208                     ; 560 }
2211  0003 81            	ret	
2355                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2355                     ; 569 {
2356                     .text:	section	.text,new
2357  0000               _UART1_GetFlagStatus:
2359  0000 89            	pushw	x
2360  0001 88            	push	a
2361       00000001      OFST:	set	1
2364                     ; 570   FlagStatus status = RESET;
2366                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2368  0002 a30080        	cpw	x,#128
2369  0005 273b          	jreq	L213
2370  0007 a30040        	cpw	x,#64
2371  000a 2736          	jreq	L213
2372  000c a30020        	cpw	x,#32
2373  000f 2731          	jreq	L213
2374  0011 a30010        	cpw	x,#16
2375  0014 272c          	jreq	L213
2376  0016 a30008        	cpw	x,#8
2377  0019 2727          	jreq	L213
2378  001b a30004        	cpw	x,#4
2379  001e 2722          	jreq	L213
2380  0020 a30002        	cpw	x,#2
2381  0023 271d          	jreq	L213
2382  0025 a30001        	cpw	x,#1
2383  0028 2718          	jreq	L213
2384  002a a30101        	cpw	x,#257
2385  002d 2713          	jreq	L213
2386  002f a30210        	cpw	x,#528
2387  0032 270e          	jreq	L213
2388  0034 ae023d        	ldw	x,#573
2389  0037 89            	pushw	x
2390  0038 5f            	clrw	x
2391  0039 89            	pushw	x
2392  003a ae0008        	ldw	x,#L561
2393  003d cd0000        	call	_assert_failed
2395  0040 5b04          	addw	sp,#4
2396  0042               L213:
2397                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2399  0042 1e02          	ldw	x,(OFST+1,sp)
2400  0044 a30210        	cpw	x,#528
2401  0047 2605          	jrne	L3301
2402                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2404  0049 c65237        	ld	a,21047
2405                     ; 582       status = SET;
2407  004c 2008          	jp	LC009
2408                     ; 587       status = RESET;
2409  004e               L3301:
2410                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2412  004e a30101        	cpw	x,#257
2413  0051 260b          	jrne	L3401
2414                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2416  0053 c65235        	ld	a,21045
2417  0056               LC009:
2418  0056 1503          	bcp	a,(OFST+2,sp)
2419  0058 270b          	jreq	L3501
2420                     ; 595       status = SET;
2422  005a               LC008:
2425  005a a601          	ld	a,#1
2428  005c 2008          	jra	L1401
2429                     ; 600       status = RESET;
2430  005e               L3401:
2431                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2433  005e c65230        	ld	a,21040
2434  0061 1503          	bcp	a,(OFST+2,sp)
2435                     ; 608       status = SET;
2437  0063 26f5          	jrne	LC008
2438  0065               L3501:
2439                     ; 613       status = RESET;
2443  0065 4f            	clr	a
2445  0066               L1401:
2446                     ; 617   return status;
2450  0066 5b03          	addw	sp,#3
2451  0068 81            	ret	
2487                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2487                     ; 647 {
2488                     .text:	section	.text,new
2489  0000               _UART1_ClearFlag:
2491  0000 89            	pushw	x
2492       00000000      OFST:	set	0
2495                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2497  0001 a30020        	cpw	x,#32
2498  0004 2713          	jreq	L423
2499  0006 a30210        	cpw	x,#528
2500  0009 270e          	jreq	L423
2501  000b ae0288        	ldw	x,#648
2502  000e 89            	pushw	x
2503  000f 5f            	clrw	x
2504  0010 89            	pushw	x
2505  0011 ae0008        	ldw	x,#L561
2506  0014 cd0000        	call	_assert_failed
2508  0017 5b04          	addw	sp,#4
2509  0019               L423:
2510                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2512  0019 1e01          	ldw	x,(OFST+1,sp)
2513  001b a30020        	cpw	x,#32
2514  001e 2606          	jrne	L5701
2515                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2517  0020 35df5230      	mov	21040,#223
2519  0024 2004          	jra	L7701
2520  0026               L5701:
2521                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2523  0026 72195237      	bres	21047,#4
2524  002a               L7701:
2525                     ; 660 }
2528  002a 85            	popw	x
2529  002b 81            	ret	
2604                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2604                     ; 676 {
2605                     .text:	section	.text,new
2606  0000               _UART1_GetITStatus:
2608  0000 89            	pushw	x
2609  0001 89            	pushw	x
2610       00000002      OFST:	set	2
2613                     ; 677   ITStatus pendingbitstatus = RESET;
2615                     ; 678   uint8_t itpos = 0;
2617                     ; 679   uint8_t itmask1 = 0;
2619                     ; 680   uint8_t itmask2 = 0;
2621                     ; 681   uint8_t enablestatus = 0;
2623                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2625  0002 a30277        	cpw	x,#631
2626  0005 272c          	jreq	L633
2627  0007 a30266        	cpw	x,#614
2628  000a 2727          	jreq	L633
2629  000c a30255        	cpw	x,#597
2630  000f 2722          	jreq	L633
2631  0011 a30244        	cpw	x,#580
2632  0014 271d          	jreq	L633
2633  0016 a30235        	cpw	x,#565
2634  0019 2718          	jreq	L633
2635  001b a30346        	cpw	x,#838
2636  001e 2713          	jreq	L633
2637  0020 a30100        	cpw	x,#256
2638  0023 270e          	jreq	L633
2639  0025 ae02ac        	ldw	x,#684
2640  0028 89            	pushw	x
2641  0029 5f            	clrw	x
2642  002a 89            	pushw	x
2643  002b ae0008        	ldw	x,#L561
2644  002e cd0000        	call	_assert_failed
2646  0031 5b04          	addw	sp,#4
2647  0033               L633:
2648                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2650  0033 7b04          	ld	a,(OFST+2,sp)
2651  0035 a40f          	and	a,#15
2652  0037 5f            	clrw	x
2653  0038 97            	ld	xl,a
2654  0039 a601          	ld	a,#1
2655  003b 5d            	tnzw	x
2656  003c 2704          	jreq	L243
2657  003e               L443:
2658  003e 48            	sll	a
2659  003f 5a            	decw	x
2660  0040 26fc          	jrne	L443
2661  0042               L243:
2662  0042 6b01          	ld	(OFST-1,sp),a
2664                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2666  0044 7b04          	ld	a,(OFST+2,sp)
2667  0046 4e            	swap	a
2668  0047 a40f          	and	a,#15
2669  0049 6b02          	ld	(OFST+0,sp),a
2671                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2673  004b 5f            	clrw	x
2674  004c 97            	ld	xl,a
2675  004d a601          	ld	a,#1
2676  004f 5d            	tnzw	x
2677  0050 2704          	jreq	L643
2678  0052               L053:
2679  0052 48            	sll	a
2680  0053 5a            	decw	x
2681  0054 26fc          	jrne	L053
2682  0056               L643:
2683  0056 6b02          	ld	(OFST+0,sp),a
2685                     ; 695   if (UART1_IT == UART1_IT_PE)
2687  0058 1e03          	ldw	x,(OFST+1,sp)
2688  005a a30100        	cpw	x,#256
2689  005d 260c          	jrne	L3311
2690                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2692  005f c65234        	ld	a,21044
2693  0062 1402          	and	a,(OFST+0,sp)
2694  0064 6b02          	ld	(OFST+0,sp),a
2696                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2698  0066 c65230        	ld	a,21040
2700                     ; 704       pendingbitstatus = SET;
2702  0069 200f          	jp	LC012
2703                     ; 709       pendingbitstatus = RESET;
2704  006b               L3311:
2705                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2707  006b a30346        	cpw	x,#838
2708  006e 2616          	jrne	L3411
2709                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2711  0070 c65237        	ld	a,21047
2712  0073 1402          	and	a,(OFST+0,sp)
2713  0075 6b02          	ld	(OFST+0,sp),a
2715                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2717  0077 c65237        	ld	a,21047
2719  007a               LC012:
2720  007a 1501          	bcp	a,(OFST-1,sp)
2721  007c 271a          	jreq	L3511
2722  007e 7b02          	ld	a,(OFST+0,sp)
2723  0080 2716          	jreq	L3511
2724                     ; 721       pendingbitstatus = SET;
2726  0082               LC011:
2729  0082 a601          	ld	a,#1
2732  0084 2013          	jra	L1411
2733                     ; 726       pendingbitstatus = RESET;
2734  0086               L3411:
2735                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2737  0086 c65235        	ld	a,21045
2738  0089 1402          	and	a,(OFST+0,sp)
2739  008b 6b02          	ld	(OFST+0,sp),a
2741                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2743  008d c65230        	ld	a,21040
2744  0090 1501          	bcp	a,(OFST-1,sp)
2745  0092 2704          	jreq	L3511
2747  0094 7b02          	ld	a,(OFST+0,sp)
2748                     ; 737       pendingbitstatus = SET;
2750  0096 26ea          	jrne	LC011
2751  0098               L3511:
2752                     ; 742       pendingbitstatus = RESET;
2756  0098 4f            	clr	a
2758  0099               L1411:
2759                     ; 747   return  pendingbitstatus;
2763  0099 5b04          	addw	sp,#4
2764  009b 81            	ret	
2801                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2801                     ; 776 {
2802                     .text:	section	.text,new
2803  0000               _UART1_ClearITPendingBit:
2805  0000 89            	pushw	x
2806       00000000      OFST:	set	0
2809                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2811  0001 a30255        	cpw	x,#597
2812  0004 2713          	jreq	L063
2813  0006 a30346        	cpw	x,#838
2814  0009 270e          	jreq	L063
2815  000b ae0309        	ldw	x,#777
2816  000e 89            	pushw	x
2817  000f 5f            	clrw	x
2818  0010 89            	pushw	x
2819  0011 ae0008        	ldw	x,#L561
2820  0014 cd0000        	call	_assert_failed
2822  0017 5b04          	addw	sp,#4
2823  0019               L063:
2824                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2826  0019 1e01          	ldw	x,(OFST+1,sp)
2827  001b a30255        	cpw	x,#597
2828  001e 2606          	jrne	L5711
2829                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2831  0020 35df5230      	mov	21040,#223
2833  0024 2004          	jra	L7711
2834  0026               L5711:
2835                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2837  0026 72195237      	bres	21047,#4
2838  002a               L7711:
2839                     ; 789 }
2842  002a 85            	popw	x
2843  002b 81            	ret	
2856                     	xdef	_UART1_ClearITPendingBit
2857                     	xdef	_UART1_GetITStatus
2858                     	xdef	_UART1_ClearFlag
2859                     	xdef	_UART1_GetFlagStatus
2860                     	xdef	_UART1_SetPrescaler
2861                     	xdef	_UART1_SetGuardTime
2862                     	xdef	_UART1_SetAddress
2863                     	xdef	_UART1_SendBreak
2864                     	xdef	_UART1_SendData9
2865                     	xdef	_UART1_SendData8
2866                     	xdef	_UART1_ReceiveData9
2867                     	xdef	_UART1_ReceiveData8
2868                     	xdef	_UART1_ReceiverWakeUpCmd
2869                     	xdef	_UART1_WakeUpConfig
2870                     	xdef	_UART1_SmartCardNACKCmd
2871                     	xdef	_UART1_SmartCardCmd
2872                     	xdef	_UART1_LINCmd
2873                     	xdef	_UART1_LINBreakDetectionConfig
2874                     	xdef	_UART1_IrDACmd
2875                     	xdef	_UART1_IrDAConfig
2876                     	xdef	_UART1_HalfDuplexCmd
2877                     	xdef	_UART1_ITConfig
2878                     	xdef	_UART1_Cmd
2879                     	xdef	_UART1_Init
2880                     	xdef	_UART1_DeInit
2881                     	xref	_assert_failed
2882                     	xref	_CLK_GetClockFreq
2883                     	switch	.const
2884  0008               L561:
2885  0008 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
2886  001a 75617274312e  	dc.b	"uart1.c",0
2887                     	xref.b	c_lreg
2888                     	xref.b	c_x
2908                     	xref	c_lursh
2909                     	xref	c_lsub
2910                     	xref	c_smul
2911                     	xref	c_ludv
2912                     	xref	c_rtol
2913                     	xref	c_llsh
2914                     	xref	c_lcmp
2915                     	xref	c_ltor
2916                     	end
