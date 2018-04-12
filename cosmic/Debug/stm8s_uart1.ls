   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 53 void UART1_DeInit(void)
  45                     ; 54 {
  47                     .text:	section	.text,new
  48  0000               _UART1_DeInit:
  52                     ; 57   (void)UART1->SR;
  54  0000 c65230        	ld	a,21040
  55                     ; 58   (void)UART1->DR;
  57  0003 c65231        	ld	a,21041
  58                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  60  0006 725f5233      	clr	21043
  61                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  63  000a 725f5232      	clr	21042
  64                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  66  000e 725f5234      	clr	21044
  67                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  69  0012 725f5235      	clr	21045
  70                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  72  0016 725f5236      	clr	21046
  73                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  75  001a 725f5237      	clr	21047
  76                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  78  001e 725f5238      	clr	21048
  79                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  81  0022 725f5239      	clr	21049
  82                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  84  0026 725f523a      	clr	21050
  85                     ; 71 }
  88  002a 81            	ret
 386                     .const:	section	.text
 387  0000               L21:
 388  0000 00098969      	dc.l	625001
 389  0004               L25:
 390  0004 00000064      	dc.l	100
 391                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 391                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 391                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 391                     ; 93 {
 392                     .text:	section	.text,new
 393  0000               _UART1_Init:
 395  0000 520c          	subw	sp,#12
 396       0000000c      OFST:	set	12
 399                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 403                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 405  0002 96            	ldw	x,sp
 406  0003 1c000f        	addw	x,#OFST+3
 407  0006 cd0000        	call	c_ltor
 409  0009 ae0000        	ldw	x,#L21
 410  000c cd0000        	call	c_lcmp
 412  000f 2403          	jruge	L01
 413  0011 4f            	clr	a
 414  0012 2010          	jra	L41
 415  0014               L01:
 416  0014 ae0061        	ldw	x,#97
 417  0017 89            	pushw	x
 418  0018 ae0000        	ldw	x,#0
 419  001b 89            	pushw	x
 420  001c ae0008        	ldw	x,#L561
 421  001f cd0000        	call	_assert_failed
 423  0022 5b04          	addw	sp,#4
 424  0024               L41:
 425                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 427  0024 0d13          	tnz	(OFST+7,sp)
 428  0026 2706          	jreq	L02
 429  0028 7b13          	ld	a,(OFST+7,sp)
 430  002a a110          	cp	a,#16
 431  002c 2603          	jrne	L61
 432  002e               L02:
 433  002e 4f            	clr	a
 434  002f 2010          	jra	L22
 435  0031               L61:
 436  0031 ae0062        	ldw	x,#98
 437  0034 89            	pushw	x
 438  0035 ae0000        	ldw	x,#0
 439  0038 89            	pushw	x
 440  0039 ae0008        	ldw	x,#L561
 441  003c cd0000        	call	_assert_failed
 443  003f 5b04          	addw	sp,#4
 444  0041               L22:
 445                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 447  0041 0d14          	tnz	(OFST+8,sp)
 448  0043 2712          	jreq	L62
 449  0045 7b14          	ld	a,(OFST+8,sp)
 450  0047 a110          	cp	a,#16
 451  0049 270c          	jreq	L62
 452  004b 7b14          	ld	a,(OFST+8,sp)
 453  004d a120          	cp	a,#32
 454  004f 2706          	jreq	L62
 455  0051 7b14          	ld	a,(OFST+8,sp)
 456  0053 a130          	cp	a,#48
 457  0055 2603          	jrne	L42
 458  0057               L62:
 459  0057 4f            	clr	a
 460  0058 2010          	jra	L03
 461  005a               L42:
 462  005a ae0063        	ldw	x,#99
 463  005d 89            	pushw	x
 464  005e ae0000        	ldw	x,#0
 465  0061 89            	pushw	x
 466  0062 ae0008        	ldw	x,#L561
 467  0065 cd0000        	call	_assert_failed
 469  0068 5b04          	addw	sp,#4
 470  006a               L03:
 471                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 473  006a 0d15          	tnz	(OFST+9,sp)
 474  006c 270c          	jreq	L43
 475  006e 7b15          	ld	a,(OFST+9,sp)
 476  0070 a104          	cp	a,#4
 477  0072 2706          	jreq	L43
 478  0074 7b15          	ld	a,(OFST+9,sp)
 479  0076 a106          	cp	a,#6
 480  0078 2603          	jrne	L23
 481  007a               L43:
 482  007a 4f            	clr	a
 483  007b 2010          	jra	L63
 484  007d               L23:
 485  007d ae0064        	ldw	x,#100
 486  0080 89            	pushw	x
 487  0081 ae0000        	ldw	x,#0
 488  0084 89            	pushw	x
 489  0085 ae0008        	ldw	x,#L561
 490  0088 cd0000        	call	_assert_failed
 492  008b 5b04          	addw	sp,#4
 493  008d               L63:
 494                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 496  008d 7b17          	ld	a,(OFST+11,sp)
 497  008f a108          	cp	a,#8
 498  0091 2730          	jreq	L24
 499  0093 7b17          	ld	a,(OFST+11,sp)
 500  0095 a140          	cp	a,#64
 501  0097 272a          	jreq	L24
 502  0099 7b17          	ld	a,(OFST+11,sp)
 503  009b a104          	cp	a,#4
 504  009d 2724          	jreq	L24
 505  009f 7b17          	ld	a,(OFST+11,sp)
 506  00a1 a180          	cp	a,#128
 507  00a3 271e          	jreq	L24
 508  00a5 7b17          	ld	a,(OFST+11,sp)
 509  00a7 a10c          	cp	a,#12
 510  00a9 2718          	jreq	L24
 511  00ab 7b17          	ld	a,(OFST+11,sp)
 512  00ad a10c          	cp	a,#12
 513  00af 2712          	jreq	L24
 514  00b1 7b17          	ld	a,(OFST+11,sp)
 515  00b3 a144          	cp	a,#68
 516  00b5 270c          	jreq	L24
 517  00b7 7b17          	ld	a,(OFST+11,sp)
 518  00b9 a1c0          	cp	a,#192
 519  00bb 2706          	jreq	L24
 520  00bd 7b17          	ld	a,(OFST+11,sp)
 521  00bf a188          	cp	a,#136
 522  00c1 2603          	jrne	L04
 523  00c3               L24:
 524  00c3 4f            	clr	a
 525  00c4 2010          	jra	L44
 526  00c6               L04:
 527  00c6 ae0065        	ldw	x,#101
 528  00c9 89            	pushw	x
 529  00ca ae0000        	ldw	x,#0
 530  00cd 89            	pushw	x
 531  00ce ae0008        	ldw	x,#L561
 532  00d1 cd0000        	call	_assert_failed
 534  00d4 5b04          	addw	sp,#4
 535  00d6               L44:
 536                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 538  00d6 7b16          	ld	a,(OFST+10,sp)
 539  00d8 a488          	and	a,#136
 540  00da a188          	cp	a,#136
 541  00dc 271b          	jreq	L64
 542  00de 7b16          	ld	a,(OFST+10,sp)
 543  00e0 a444          	and	a,#68
 544  00e2 a144          	cp	a,#68
 545  00e4 2713          	jreq	L64
 546  00e6 7b16          	ld	a,(OFST+10,sp)
 547  00e8 a422          	and	a,#34
 548  00ea a122          	cp	a,#34
 549  00ec 270b          	jreq	L64
 550  00ee 7b16          	ld	a,(OFST+10,sp)
 551  00f0 a411          	and	a,#17
 552  00f2 a111          	cp	a,#17
 553  00f4 2703          	jreq	L64
 554  00f6 4f            	clr	a
 555  00f7 2010          	jra	L05
 556  00f9               L64:
 557  00f9 ae0066        	ldw	x,#102
 558  00fc 89            	pushw	x
 559  00fd ae0000        	ldw	x,#0
 560  0100 89            	pushw	x
 561  0101 ae0008        	ldw	x,#L561
 562  0104 cd0000        	call	_assert_failed
 564  0107 5b04          	addw	sp,#4
 565  0109               L05:
 566                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 568  0109 72195234      	bres	21044,#4
 569                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 571  010d c65234        	ld	a,21044
 572  0110 1a13          	or	a,(OFST+7,sp)
 573  0112 c75234        	ld	21044,a
 574                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 576  0115 c65236        	ld	a,21046
 577  0118 a4cf          	and	a,#207
 578  011a c75236        	ld	21046,a
 579                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 581  011d c65236        	ld	a,21046
 582  0120 1a14          	or	a,(OFST+8,sp)
 583  0122 c75236        	ld	21046,a
 584                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 586  0125 c65234        	ld	a,21044
 587  0128 a4f9          	and	a,#249
 588  012a c75234        	ld	21044,a
 589                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 591  012d c65234        	ld	a,21044
 592  0130 1a15          	or	a,(OFST+9,sp)
 593  0132 c75234        	ld	21044,a
 594                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 596  0135 725f5232      	clr	21042
 597                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 599  0139 c65233        	ld	a,21043
 600  013c a40f          	and	a,#15
 601  013e c75233        	ld	21043,a
 602                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 604  0141 c65233        	ld	a,21043
 605  0144 a4f0          	and	a,#240
 606  0146 c75233        	ld	21043,a
 607                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 609  0149 96            	ldw	x,sp
 610  014a 1c000f        	addw	x,#OFST+3
 611  014d cd0000        	call	c_ltor
 613  0150 a604          	ld	a,#4
 614  0152 cd0000        	call	c_llsh
 616  0155 96            	ldw	x,sp
 617  0156 1c0001        	addw	x,#OFST-11
 618  0159 cd0000        	call	c_rtol
 621  015c cd0000        	call	_CLK_GetClockFreq
 623  015f 96            	ldw	x,sp
 624  0160 1c0001        	addw	x,#OFST-11
 625  0163 cd0000        	call	c_ludv
 627  0166 96            	ldw	x,sp
 628  0167 1c0009        	addw	x,#OFST-3
 629  016a cd0000        	call	c_rtol
 632                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 634  016d 96            	ldw	x,sp
 635  016e 1c000f        	addw	x,#OFST+3
 636  0171 cd0000        	call	c_ltor
 638  0174 a604          	ld	a,#4
 639  0176 cd0000        	call	c_llsh
 641  0179 96            	ldw	x,sp
 642  017a 1c0001        	addw	x,#OFST-11
 643  017d cd0000        	call	c_rtol
 646  0180 cd0000        	call	_CLK_GetClockFreq
 648  0183 a664          	ld	a,#100
 649  0185 cd0000        	call	c_smul
 651  0188 96            	ldw	x,sp
 652  0189 1c0001        	addw	x,#OFST-11
 653  018c cd0000        	call	c_ludv
 655  018f 96            	ldw	x,sp
 656  0190 1c0005        	addw	x,#OFST-7
 657  0193 cd0000        	call	c_rtol
 660                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 662  0196 96            	ldw	x,sp
 663  0197 1c0009        	addw	x,#OFST-3
 664  019a cd0000        	call	c_ltor
 666  019d a664          	ld	a,#100
 667  019f cd0000        	call	c_smul
 669  01a2 96            	ldw	x,sp
 670  01a3 1c0001        	addw	x,#OFST-11
 671  01a6 cd0000        	call	c_rtol
 674  01a9 96            	ldw	x,sp
 675  01aa 1c0005        	addw	x,#OFST-7
 676  01ad cd0000        	call	c_ltor
 678  01b0 96            	ldw	x,sp
 679  01b1 1c0001        	addw	x,#OFST-11
 680  01b4 cd0000        	call	c_lsub
 682  01b7 a604          	ld	a,#4
 683  01b9 cd0000        	call	c_llsh
 685  01bc ae0004        	ldw	x,#L25
 686  01bf cd0000        	call	c_ludv
 688  01c2 b603          	ld	a,c_lreg+3
 689  01c4 a40f          	and	a,#15
 690  01c6 ca5233        	or	a,21043
 691  01c9 c75233        	ld	21043,a
 692                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 694  01cc 96            	ldw	x,sp
 695  01cd 1c0009        	addw	x,#OFST-3
 696  01d0 cd0000        	call	c_ltor
 698  01d3 a604          	ld	a,#4
 699  01d5 cd0000        	call	c_lursh
 701  01d8 b603          	ld	a,c_lreg+3
 702  01da a4f0          	and	a,#240
 703  01dc b703          	ld	c_lreg+3,a
 704  01de 3f02          	clr	c_lreg+2
 705  01e0 3f01          	clr	c_lreg+1
 706  01e2 3f00          	clr	c_lreg
 707  01e4 b603          	ld	a,c_lreg+3
 708  01e6 ca5233        	or	a,21043
 709  01e9 c75233        	ld	21043,a
 710                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 712  01ec c65232        	ld	a,21042
 713  01ef 1a0c          	or	a,(OFST+0,sp)
 714  01f1 c75232        	ld	21042,a
 715                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 717  01f4 c65235        	ld	a,21045
 718  01f7 a4f3          	and	a,#243
 719  01f9 c75235        	ld	21045,a
 720                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 722  01fc c65236        	ld	a,21046
 723  01ff a4f8          	and	a,#248
 724  0201 c75236        	ld	21046,a
 725                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 725                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 727  0204 7b16          	ld	a,(OFST+10,sp)
 728  0206 a407          	and	a,#7
 729  0208 ca5236        	or	a,21046
 730  020b c75236        	ld	21046,a
 731                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 733  020e 7b17          	ld	a,(OFST+11,sp)
 734  0210 a504          	bcp	a,#4
 735  0212 2706          	jreq	L761
 736                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 738  0214 72165235      	bset	21045,#3
 740  0218 2004          	jra	L171
 741  021a               L761:
 742                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 744  021a 72175235      	bres	21045,#3
 745  021e               L171:
 746                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 748  021e 7b17          	ld	a,(OFST+11,sp)
 749  0220 a508          	bcp	a,#8
 750  0222 2706          	jreq	L371
 751                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 753  0224 72145235      	bset	21045,#2
 755  0228 2004          	jra	L571
 756  022a               L371:
 757                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 759  022a 72155235      	bres	21045,#2
 760  022e               L571:
 761                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 763  022e 7b16          	ld	a,(OFST+10,sp)
 764  0230 a580          	bcp	a,#128
 765  0232 2706          	jreq	L771
 766                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 768  0234 72175236      	bres	21046,#3
 770  0238 200a          	jra	L102
 771  023a               L771:
 772                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 774  023a 7b16          	ld	a,(OFST+10,sp)
 775  023c a408          	and	a,#8
 776  023e ca5236        	or	a,21046
 777  0241 c75236        	ld	21046,a
 778  0244               L102:
 779                     ; 176 }
 782  0244 5b0c          	addw	sp,#12
 783  0246 81            	ret
 838                     ; 184 void UART1_Cmd(FunctionalState NewState)
 838                     ; 185 {
 839                     .text:	section	.text,new
 840  0000               _UART1_Cmd:
 844                     ; 186   if (NewState != DISABLE)
 846  0000 4d            	tnz	a
 847  0001 2706          	jreq	L132
 848                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 850  0003 721b5234      	bres	21044,#5
 852  0007 2004          	jra	L332
 853  0009               L132:
 854                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 856  0009 721a5234      	bset	21044,#5
 857  000d               L332:
 858                     ; 196 }
 861  000d 81            	ret
 983                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 983                     ; 212 {
 984                     .text:	section	.text,new
 985  0000               _UART1_ITConfig:
 987  0000 89            	pushw	x
 988  0001 89            	pushw	x
 989       00000002      OFST:	set	2
 992                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 996                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 998  0002 a30100        	cpw	x,#256
 999  0005 2719          	jreq	L26
1000  0007 a30277        	cpw	x,#631
1001  000a 2714          	jreq	L26
1002  000c a30266        	cpw	x,#614
1003  000f 270f          	jreq	L26
1004  0011 a30205        	cpw	x,#517
1005  0014 270a          	jreq	L26
1006  0016 a30244        	cpw	x,#580
1007  0019 2705          	jreq	L26
1008  001b a30346        	cpw	x,#838
1009  001e 2603          	jrne	L06
1010  0020               L26:
1011  0020 4f            	clr	a
1012  0021 2010          	jra	L46
1013  0023               L06:
1014  0023 ae00d8        	ldw	x,#216
1015  0026 89            	pushw	x
1016  0027 ae0000        	ldw	x,#0
1017  002a 89            	pushw	x
1018  002b ae0008        	ldw	x,#L561
1019  002e cd0000        	call	_assert_failed
1021  0031 5b04          	addw	sp,#4
1022  0033               L46:
1023                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1025  0033 0d07          	tnz	(OFST+5,sp)
1026  0035 2706          	jreq	L07
1027  0037 7b07          	ld	a,(OFST+5,sp)
1028  0039 a101          	cp	a,#1
1029  003b 2603          	jrne	L66
1030  003d               L07:
1031  003d 4f            	clr	a
1032  003e 2010          	jra	L27
1033  0040               L66:
1034  0040 ae00d9        	ldw	x,#217
1035  0043 89            	pushw	x
1036  0044 ae0000        	ldw	x,#0
1037  0047 89            	pushw	x
1038  0048 ae0008        	ldw	x,#L561
1039  004b cd0000        	call	_assert_failed
1041  004e 5b04          	addw	sp,#4
1042  0050               L27:
1043                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1045  0050 7b03          	ld	a,(OFST+1,sp)
1046  0052 6b01          	ld	(OFST-1,sp),a
1048                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1050  0054 7b04          	ld	a,(OFST+2,sp)
1051  0056 a40f          	and	a,#15
1052  0058 5f            	clrw	x
1053  0059 97            	ld	xl,a
1054  005a a601          	ld	a,#1
1055  005c 5d            	tnzw	x
1056  005d 2704          	jreq	L47
1057  005f               L67:
1058  005f 48            	sll	a
1059  0060 5a            	decw	x
1060  0061 26fc          	jrne	L67
1061  0063               L47:
1062  0063 6b02          	ld	(OFST+0,sp),a
1064                     ; 224   if (NewState != DISABLE)
1066  0065 0d07          	tnz	(OFST+5,sp)
1067  0067 272a          	jreq	L703
1068                     ; 227     if (uartreg == 0x01)
1070  0069 7b01          	ld	a,(OFST-1,sp)
1071  006b a101          	cp	a,#1
1072  006d 260a          	jrne	L113
1073                     ; 229       UART1->CR1 |= itpos;
1075  006f c65234        	ld	a,21044
1076  0072 1a02          	or	a,(OFST+0,sp)
1077  0074 c75234        	ld	21044,a
1079  0077 2045          	jra	L123
1080  0079               L113:
1081                     ; 231     else if (uartreg == 0x02)
1083  0079 7b01          	ld	a,(OFST-1,sp)
1084  007b a102          	cp	a,#2
1085  007d 260a          	jrne	L513
1086                     ; 233       UART1->CR2 |= itpos;
1088  007f c65235        	ld	a,21045
1089  0082 1a02          	or	a,(OFST+0,sp)
1090  0084 c75235        	ld	21045,a
1092  0087 2035          	jra	L123
1093  0089               L513:
1094                     ; 237       UART1->CR4 |= itpos;
1096  0089 c65237        	ld	a,21047
1097  008c 1a02          	or	a,(OFST+0,sp)
1098  008e c75237        	ld	21047,a
1099  0091 202b          	jra	L123
1100  0093               L703:
1101                     ; 243     if (uartreg == 0x01)
1103  0093 7b01          	ld	a,(OFST-1,sp)
1104  0095 a101          	cp	a,#1
1105  0097 260b          	jrne	L323
1106                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1108  0099 7b02          	ld	a,(OFST+0,sp)
1109  009b 43            	cpl	a
1110  009c c45234        	and	a,21044
1111  009f c75234        	ld	21044,a
1113  00a2 201a          	jra	L123
1114  00a4               L323:
1115                     ; 247     else if (uartreg == 0x02)
1117  00a4 7b01          	ld	a,(OFST-1,sp)
1118  00a6 a102          	cp	a,#2
1119  00a8 260b          	jrne	L723
1120                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1122  00aa 7b02          	ld	a,(OFST+0,sp)
1123  00ac 43            	cpl	a
1124  00ad c45235        	and	a,21045
1125  00b0 c75235        	ld	21045,a
1127  00b3 2009          	jra	L123
1128  00b5               L723:
1129                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1131  00b5 7b02          	ld	a,(OFST+0,sp)
1132  00b7 43            	cpl	a
1133  00b8 c45237        	and	a,21047
1134  00bb c75237        	ld	21047,a
1135  00be               L123:
1136                     ; 257 }
1139  00be 5b04          	addw	sp,#4
1140  00c0 81            	ret
1177                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1177                     ; 266 {
1178                     .text:	section	.text,new
1179  0000               _UART1_HalfDuplexCmd:
1181  0000 88            	push	a
1182       00000000      OFST:	set	0
1185                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1187  0001 4d            	tnz	a
1188  0002 2704          	jreq	L401
1189  0004 a101          	cp	a,#1
1190  0006 2603          	jrne	L201
1191  0008               L401:
1192  0008 4f            	clr	a
1193  0009 2010          	jra	L601
1194  000b               L201:
1195  000b ae010b        	ldw	x,#267
1196  000e 89            	pushw	x
1197  000f ae0000        	ldw	x,#0
1198  0012 89            	pushw	x
1199  0013 ae0008        	ldw	x,#L561
1200  0016 cd0000        	call	_assert_failed
1202  0019 5b04          	addw	sp,#4
1203  001b               L601:
1204                     ; 269   if (NewState != DISABLE)
1206  001b 0d01          	tnz	(OFST+1,sp)
1207  001d 2706          	jreq	L153
1208                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1210  001f 72165238      	bset	21048,#3
1212  0023 2004          	jra	L353
1213  0025               L153:
1214                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1216  0025 72175238      	bres	21048,#3
1217  0029               L353:
1218                     ; 277 }
1221  0029 84            	pop	a
1222  002a 81            	ret
1280                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1280                     ; 286 {
1281                     .text:	section	.text,new
1282  0000               _UART1_IrDAConfig:
1284  0000 88            	push	a
1285       00000000      OFST:	set	0
1288                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1290  0001 a101          	cp	a,#1
1291  0003 2703          	jreq	L411
1292  0005 4d            	tnz	a
1293  0006 2603          	jrne	L211
1294  0008               L411:
1295  0008 4f            	clr	a
1296  0009 2010          	jra	L611
1297  000b               L211:
1298  000b ae011f        	ldw	x,#287
1299  000e 89            	pushw	x
1300  000f ae0000        	ldw	x,#0
1301  0012 89            	pushw	x
1302  0013 ae0008        	ldw	x,#L561
1303  0016 cd0000        	call	_assert_failed
1305  0019 5b04          	addw	sp,#4
1306  001b               L611:
1307                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1309  001b 0d01          	tnz	(OFST+1,sp)
1310  001d 2706          	jreq	L304
1311                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1313  001f 72145238      	bset	21048,#2
1315  0023 2004          	jra	L504
1316  0025               L304:
1317                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1319  0025 72155238      	bres	21048,#2
1320  0029               L504:
1321                     ; 297 }
1324  0029 84            	pop	a
1325  002a 81            	ret
1361                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1361                     ; 306 {
1362                     .text:	section	.text,new
1363  0000               _UART1_IrDACmd:
1365  0000 88            	push	a
1366       00000000      OFST:	set	0
1369                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1371  0001 4d            	tnz	a
1372  0002 2704          	jreq	L421
1373  0004 a101          	cp	a,#1
1374  0006 2603          	jrne	L221
1375  0008               L421:
1376  0008 4f            	clr	a
1377  0009 2010          	jra	L621
1378  000b               L221:
1379  000b ae0134        	ldw	x,#308
1380  000e 89            	pushw	x
1381  000f ae0000        	ldw	x,#0
1382  0012 89            	pushw	x
1383  0013 ae0008        	ldw	x,#L561
1384  0016 cd0000        	call	_assert_failed
1386  0019 5b04          	addw	sp,#4
1387  001b               L621:
1388                     ; 310   if (NewState != DISABLE)
1390  001b 0d01          	tnz	(OFST+1,sp)
1391  001d 2706          	jreq	L524
1392                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1394  001f 72125238      	bset	21048,#1
1396  0023 2004          	jra	L724
1397  0025               L524:
1398                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1400  0025 72135238      	bres	21048,#1
1401  0029               L724:
1402                     ; 320 }
1405  0029 84            	pop	a
1406  002a 81            	ret
1466                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1466                     ; 330 {
1467                     .text:	section	.text,new
1468  0000               _UART1_LINBreakDetectionConfig:
1470  0000 88            	push	a
1471       00000000      OFST:	set	0
1474                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1476  0001 4d            	tnz	a
1477  0002 2704          	jreq	L431
1478  0004 a101          	cp	a,#1
1479  0006 2603          	jrne	L231
1480  0008               L431:
1481  0008 4f            	clr	a
1482  0009 2010          	jra	L631
1483  000b               L231:
1484  000b ae014b        	ldw	x,#331
1485  000e 89            	pushw	x
1486  000f ae0000        	ldw	x,#0
1487  0012 89            	pushw	x
1488  0013 ae0008        	ldw	x,#L561
1489  0016 cd0000        	call	_assert_failed
1491  0019 5b04          	addw	sp,#4
1492  001b               L631:
1493                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1495  001b 0d01          	tnz	(OFST+1,sp)
1496  001d 2706          	jreq	L754
1497                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1499  001f 721a5237      	bset	21047,#5
1501  0023 2004          	jra	L164
1502  0025               L754:
1503                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1505  0025 721b5237      	bres	21047,#5
1506  0029               L164:
1507                     ; 341 }
1510  0029 84            	pop	a
1511  002a 81            	ret
1547                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1547                     ; 350 {
1548                     .text:	section	.text,new
1549  0000               _UART1_LINCmd:
1551  0000 88            	push	a
1552       00000000      OFST:	set	0
1555                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1557  0001 4d            	tnz	a
1558  0002 2704          	jreq	L441
1559  0004 a101          	cp	a,#1
1560  0006 2603          	jrne	L241
1561  0008               L441:
1562  0008 4f            	clr	a
1563  0009 2010          	jra	L641
1564  000b               L241:
1565  000b ae015f        	ldw	x,#351
1566  000e 89            	pushw	x
1567  000f ae0000        	ldw	x,#0
1568  0012 89            	pushw	x
1569  0013 ae0008        	ldw	x,#L561
1570  0016 cd0000        	call	_assert_failed
1572  0019 5b04          	addw	sp,#4
1573  001b               L641:
1574                     ; 353   if (NewState != DISABLE)
1576  001b 0d01          	tnz	(OFST+1,sp)
1577  001d 2706          	jreq	L105
1578                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1580  001f 721c5236      	bset	21046,#6
1582  0023 2004          	jra	L305
1583  0025               L105:
1584                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1586  0025 721d5236      	bres	21046,#6
1587  0029               L305:
1588                     ; 363 }
1591  0029 84            	pop	a
1592  002a 81            	ret
1628                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1628                     ; 372 {
1629                     .text:	section	.text,new
1630  0000               _UART1_SmartCardCmd:
1632  0000 88            	push	a
1633       00000000      OFST:	set	0
1636                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1638  0001 4d            	tnz	a
1639  0002 2704          	jreq	L451
1640  0004 a101          	cp	a,#1
1641  0006 2603          	jrne	L251
1642  0008               L451:
1643  0008 4f            	clr	a
1644  0009 2010          	jra	L651
1645  000b               L251:
1646  000b ae0175        	ldw	x,#373
1647  000e 89            	pushw	x
1648  000f ae0000        	ldw	x,#0
1649  0012 89            	pushw	x
1650  0013 ae0008        	ldw	x,#L561
1651  0016 cd0000        	call	_assert_failed
1653  0019 5b04          	addw	sp,#4
1654  001b               L651:
1655                     ; 375   if (NewState != DISABLE)
1657  001b 0d01          	tnz	(OFST+1,sp)
1658  001d 2706          	jreq	L325
1659                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1661  001f 721a5238      	bset	21048,#5
1663  0023 2004          	jra	L525
1664  0025               L325:
1665                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1667  0025 721b5238      	bres	21048,#5
1668  0029               L525:
1669                     ; 385 }
1672  0029 84            	pop	a
1673  002a 81            	ret
1710                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1710                     ; 395 {
1711                     .text:	section	.text,new
1712  0000               _UART1_SmartCardNACKCmd:
1714  0000 88            	push	a
1715       00000000      OFST:	set	0
1718                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1720  0001 4d            	tnz	a
1721  0002 2704          	jreq	L461
1722  0004 a101          	cp	a,#1
1723  0006 2603          	jrne	L261
1724  0008               L461:
1725  0008 4f            	clr	a
1726  0009 2010          	jra	L661
1727  000b               L261:
1728  000b ae018c        	ldw	x,#396
1729  000e 89            	pushw	x
1730  000f ae0000        	ldw	x,#0
1731  0012 89            	pushw	x
1732  0013 ae0008        	ldw	x,#L561
1733  0016 cd0000        	call	_assert_failed
1735  0019 5b04          	addw	sp,#4
1736  001b               L661:
1737                     ; 398   if (NewState != DISABLE)
1739  001b 0d01          	tnz	(OFST+1,sp)
1740  001d 2706          	jreq	L545
1741                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1743  001f 72185238      	bset	21048,#4
1745  0023 2004          	jra	L745
1746  0025               L545:
1747                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1749  0025 72195238      	bres	21048,#4
1750  0029               L745:
1751                     ; 408 }
1754  0029 84            	pop	a
1755  002a 81            	ret
1813                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1813                     ; 417 {
1814                     .text:	section	.text,new
1815  0000               _UART1_WakeUpConfig:
1817  0000 88            	push	a
1818       00000000      OFST:	set	0
1821                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1823  0001 4d            	tnz	a
1824  0002 2704          	jreq	L471
1825  0004 a108          	cp	a,#8
1826  0006 2603          	jrne	L271
1827  0008               L471:
1828  0008 4f            	clr	a
1829  0009 2010          	jra	L671
1830  000b               L271:
1831  000b ae01a2        	ldw	x,#418
1832  000e 89            	pushw	x
1833  000f ae0000        	ldw	x,#0
1834  0012 89            	pushw	x
1835  0013 ae0008        	ldw	x,#L561
1836  0016 cd0000        	call	_assert_failed
1838  0019 5b04          	addw	sp,#4
1839  001b               L671:
1840                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1842  001b 72175234      	bres	21044,#3
1843                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1845  001f c65234        	ld	a,21044
1846  0022 1a01          	or	a,(OFST+1,sp)
1847  0024 c75234        	ld	21044,a
1848                     ; 422 }
1851  0027 84            	pop	a
1852  0028 81            	ret
1889                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1889                     ; 431 {
1890                     .text:	section	.text,new
1891  0000               _UART1_ReceiverWakeUpCmd:
1893  0000 88            	push	a
1894       00000000      OFST:	set	0
1897                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1899  0001 4d            	tnz	a
1900  0002 2704          	jreq	L402
1901  0004 a101          	cp	a,#1
1902  0006 2603          	jrne	L202
1903  0008               L402:
1904  0008 4f            	clr	a
1905  0009 2010          	jra	L602
1906  000b               L202:
1907  000b ae01b0        	ldw	x,#432
1908  000e 89            	pushw	x
1909  000f ae0000        	ldw	x,#0
1910  0012 89            	pushw	x
1911  0013 ae0008        	ldw	x,#L561
1912  0016 cd0000        	call	_assert_failed
1914  0019 5b04          	addw	sp,#4
1915  001b               L602:
1916                     ; 434   if (NewState != DISABLE)
1918  001b 0d01          	tnz	(OFST+1,sp)
1919  001d 2706          	jreq	L516
1920                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1922  001f 72125235      	bset	21045,#1
1924  0023 2004          	jra	L716
1925  0025               L516:
1926                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1928  0025 72135235      	bres	21045,#1
1929  0029               L716:
1930                     ; 444 }
1933  0029 84            	pop	a
1934  002a 81            	ret
1957                     ; 451 uint8_t UART1_ReceiveData8(void)
1957                     ; 452 {
1958                     .text:	section	.text,new
1959  0000               _UART1_ReceiveData8:
1963                     ; 453   return ((uint8_t)UART1->DR);
1965  0000 c65231        	ld	a,21041
1968  0003 81            	ret
2000                     ; 461 uint16_t UART1_ReceiveData9(void)
2000                     ; 462 {
2001                     .text:	section	.text,new
2002  0000               _UART1_ReceiveData9:
2004  0000 89            	pushw	x
2005       00000002      OFST:	set	2
2008                     ; 463   uint16_t temp = 0;
2010                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2012  0001 c65234        	ld	a,21044
2013  0004 5f            	clrw	x
2014  0005 a480          	and	a,#128
2015  0007 5f            	clrw	x
2016  0008 02            	rlwa	x,a
2017  0009 58            	sllw	x
2018  000a 1f01          	ldw	(OFST-1,sp),x
2020                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2022  000c c65231        	ld	a,21041
2023  000f 5f            	clrw	x
2024  0010 97            	ld	xl,a
2025  0011 01            	rrwa	x,a
2026  0012 1a02          	or	a,(OFST+0,sp)
2027  0014 01            	rrwa	x,a
2028  0015 1a01          	or	a,(OFST-1,sp)
2029  0017 01            	rrwa	x,a
2030  0018 01            	rrwa	x,a
2031  0019 a4ff          	and	a,#255
2032  001b 01            	rrwa	x,a
2033  001c a401          	and	a,#1
2034  001e 01            	rrwa	x,a
2037  001f 5b02          	addw	sp,#2
2038  0021 81            	ret
2070                     ; 474 void UART1_SendData8(uint8_t Data)
2070                     ; 475 {
2071                     .text:	section	.text,new
2072  0000               _UART1_SendData8:
2076                     ; 477   UART1->DR = Data;
2078  0000 c75231        	ld	21041,a
2079                     ; 478 }
2082  0003 81            	ret
2114                     ; 486 void UART1_SendData9(uint16_t Data)
2114                     ; 487 {
2115                     .text:	section	.text,new
2116  0000               _UART1_SendData9:
2118  0000 89            	pushw	x
2119       00000000      OFST:	set	0
2122                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2124  0001 721d5234      	bres	21044,#6
2125                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2127  0005 54            	srlw	x
2128  0006 54            	srlw	x
2129  0007 9f            	ld	a,xl
2130  0008 a440          	and	a,#64
2131  000a ca5234        	or	a,21044
2132  000d c75234        	ld	21044,a
2133                     ; 493   UART1->DR   = (uint8_t)(Data);
2135  0010 7b02          	ld	a,(OFST+2,sp)
2136  0012 c75231        	ld	21041,a
2137                     ; 494 }
2140  0015 85            	popw	x
2141  0016 81            	ret
2164                     ; 501 void UART1_SendBreak(void)
2164                     ; 502 {
2165                     .text:	section	.text,new
2166  0000               _UART1_SendBreak:
2170                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2172  0000 72105235      	bset	21045,#0
2173                     ; 504 }
2176  0004 81            	ret
2209                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2209                     ; 512 {
2210                     .text:	section	.text,new
2211  0000               _UART1_SetAddress:
2213  0000 88            	push	a
2214       00000000      OFST:	set	0
2217                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2219  0001 a110          	cp	a,#16
2220  0003 2403          	jruge	L422
2221  0005 4f            	clr	a
2222  0006 2010          	jra	L622
2223  0008               L422:
2224  0008 ae0202        	ldw	x,#514
2225  000b 89            	pushw	x
2226  000c ae0000        	ldw	x,#0
2227  000f 89            	pushw	x
2228  0010 ae0008        	ldw	x,#L561
2229  0013 cd0000        	call	_assert_failed
2231  0016 5b04          	addw	sp,#4
2232  0018               L622:
2233                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2235  0018 c65237        	ld	a,21047
2236  001b a4f0          	and	a,#240
2237  001d c75237        	ld	21047,a
2238                     ; 519   UART1->CR4 |= UART1_Address;
2240  0020 c65237        	ld	a,21047
2241  0023 1a01          	or	a,(OFST+1,sp)
2242  0025 c75237        	ld	21047,a
2243                     ; 520 }
2246  0028 84            	pop	a
2247  0029 81            	ret
2279                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2279                     ; 529 {
2280                     .text:	section	.text,new
2281  0000               _UART1_SetGuardTime:
2285                     ; 531   UART1->GTR = UART1_GuardTime;
2287  0000 c75239        	ld	21049,a
2288                     ; 532 }
2291  0003 81            	ret
2323                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2323                     ; 557 {
2324                     .text:	section	.text,new
2325  0000               _UART1_SetPrescaler:
2329                     ; 559   UART1->PSCR = UART1_Prescaler;
2331  0000 c7523a        	ld	21050,a
2332                     ; 560 }
2335  0003 81            	ret
2479                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2479                     ; 569 {
2480                     .text:	section	.text,new
2481  0000               _UART1_GetFlagStatus:
2483  0000 89            	pushw	x
2484  0001 88            	push	a
2485       00000001      OFST:	set	1
2488                     ; 570   FlagStatus status = RESET;
2490                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2492  0002 a30080        	cpw	x,#128
2493  0005 272d          	jreq	L042
2494  0007 a30040        	cpw	x,#64
2495  000a 2728          	jreq	L042
2496  000c a30020        	cpw	x,#32
2497  000f 2723          	jreq	L042
2498  0011 a30010        	cpw	x,#16
2499  0014 271e          	jreq	L042
2500  0016 a30008        	cpw	x,#8
2501  0019 2719          	jreq	L042
2502  001b a30004        	cpw	x,#4
2503  001e 2714          	jreq	L042
2504  0020 a30002        	cpw	x,#2
2505  0023 270f          	jreq	L042
2506  0025 a30001        	cpw	x,#1
2507  0028 270a          	jreq	L042
2508  002a a30101        	cpw	x,#257
2509  002d 2705          	jreq	L042
2510  002f a30210        	cpw	x,#528
2511  0032 2603          	jrne	L632
2512  0034               L042:
2513  0034 4f            	clr	a
2514  0035 2010          	jra	L242
2515  0037               L632:
2516  0037 ae023d        	ldw	x,#573
2517  003a 89            	pushw	x
2518  003b ae0000        	ldw	x,#0
2519  003e 89            	pushw	x
2520  003f ae0008        	ldw	x,#L561
2521  0042 cd0000        	call	_assert_failed
2523  0045 5b04          	addw	sp,#4
2524  0047               L242:
2525                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2527  0047 1e02          	ldw	x,(OFST+1,sp)
2528  0049 a30210        	cpw	x,#528
2529  004c 2611          	jrne	L3301
2530                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2532  004e c65237        	ld	a,21047
2533  0051 1503          	bcp	a,(OFST+2,sp)
2534  0053 2706          	jreq	L5301
2535                     ; 582       status = SET;
2537  0055 a601          	ld	a,#1
2538  0057 6b01          	ld	(OFST+0,sp),a
2541  0059 202b          	jra	L1401
2542  005b               L5301:
2543                     ; 587       status = RESET;
2545  005b 0f01          	clr	(OFST+0,sp)
2547  005d 2027          	jra	L1401
2548  005f               L3301:
2549                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2551  005f 1e02          	ldw	x,(OFST+1,sp)
2552  0061 a30101        	cpw	x,#257
2553  0064 2611          	jrne	L3401
2554                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2556  0066 c65235        	ld	a,21045
2557  0069 1503          	bcp	a,(OFST+2,sp)
2558  006b 2706          	jreq	L5401
2559                     ; 595       status = SET;
2561  006d a601          	ld	a,#1
2562  006f 6b01          	ld	(OFST+0,sp),a
2565  0071 2013          	jra	L1401
2566  0073               L5401:
2567                     ; 600       status = RESET;
2569  0073 0f01          	clr	(OFST+0,sp)
2571  0075 200f          	jra	L1401
2572  0077               L3401:
2573                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2575  0077 c65230        	ld	a,21040
2576  007a 1503          	bcp	a,(OFST+2,sp)
2577  007c 2706          	jreq	L3501
2578                     ; 608       status = SET;
2580  007e a601          	ld	a,#1
2581  0080 6b01          	ld	(OFST+0,sp),a
2584  0082 2002          	jra	L1401
2585  0084               L3501:
2586                     ; 613       status = RESET;
2588  0084 0f01          	clr	(OFST+0,sp)
2590  0086               L1401:
2591                     ; 617   return status;
2593  0086 7b01          	ld	a,(OFST+0,sp)
2596  0088 5b03          	addw	sp,#3
2597  008a 81            	ret
2633                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2633                     ; 647 {
2634                     .text:	section	.text,new
2635  0000               _UART1_ClearFlag:
2637  0000 89            	pushw	x
2638       00000000      OFST:	set	0
2641                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2643  0001 a30020        	cpw	x,#32
2644  0004 2705          	jreq	L052
2645  0006 a30210        	cpw	x,#528
2646  0009 2603          	jrne	L642
2647  000b               L052:
2648  000b 4f            	clr	a
2649  000c 2010          	jra	L252
2650  000e               L642:
2651  000e ae0288        	ldw	x,#648
2652  0011 89            	pushw	x
2653  0012 ae0000        	ldw	x,#0
2654  0015 89            	pushw	x
2655  0016 ae0008        	ldw	x,#L561
2656  0019 cd0000        	call	_assert_failed
2658  001c 5b04          	addw	sp,#4
2659  001e               L252:
2660                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2662  001e 1e01          	ldw	x,(OFST+1,sp)
2663  0020 a30020        	cpw	x,#32
2664  0023 2606          	jrne	L5701
2665                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2667  0025 35df5230      	mov	21040,#223
2669  0029 2004          	jra	L7701
2670  002b               L5701:
2671                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2673  002b 72195237      	bres	21047,#4
2674  002f               L7701:
2675                     ; 660 }
2678  002f 85            	popw	x
2679  0030 81            	ret
2754                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2754                     ; 676 {
2755                     .text:	section	.text,new
2756  0000               _UART1_GetITStatus:
2758  0000 89            	pushw	x
2759  0001 89            	pushw	x
2760       00000002      OFST:	set	2
2763                     ; 677   ITStatus pendingbitstatus = RESET;
2765                     ; 678   uint8_t itpos = 0;
2767                     ; 679   uint8_t itmask1 = 0;
2769                     ; 680   uint8_t itmask2 = 0;
2771                     ; 681   uint8_t enablestatus = 0;
2773                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2775  0002 a30277        	cpw	x,#631
2776  0005 271e          	jreq	L062
2777  0007 a30266        	cpw	x,#614
2778  000a 2719          	jreq	L062
2779  000c a30255        	cpw	x,#597
2780  000f 2714          	jreq	L062
2781  0011 a30244        	cpw	x,#580
2782  0014 270f          	jreq	L062
2783  0016 a30235        	cpw	x,#565
2784  0019 270a          	jreq	L062
2785  001b a30346        	cpw	x,#838
2786  001e 2705          	jreq	L062
2787  0020 a30100        	cpw	x,#256
2788  0023 2603          	jrne	L652
2789  0025               L062:
2790  0025 4f            	clr	a
2791  0026 2010          	jra	L262
2792  0028               L652:
2793  0028 ae02ac        	ldw	x,#684
2794  002b 89            	pushw	x
2795  002c ae0000        	ldw	x,#0
2796  002f 89            	pushw	x
2797  0030 ae0008        	ldw	x,#L561
2798  0033 cd0000        	call	_assert_failed
2800  0036 5b04          	addw	sp,#4
2801  0038               L262:
2802                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2804  0038 7b04          	ld	a,(OFST+2,sp)
2805  003a a40f          	and	a,#15
2806  003c 5f            	clrw	x
2807  003d 97            	ld	xl,a
2808  003e a601          	ld	a,#1
2809  0040 5d            	tnzw	x
2810  0041 2704          	jreq	L462
2811  0043               L662:
2812  0043 48            	sll	a
2813  0044 5a            	decw	x
2814  0045 26fc          	jrne	L662
2815  0047               L462:
2816  0047 6b01          	ld	(OFST-1,sp),a
2818                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2820  0049 7b04          	ld	a,(OFST+2,sp)
2821  004b 4e            	swap	a
2822  004c a40f          	and	a,#15
2823  004e 6b02          	ld	(OFST+0,sp),a
2825                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2827  0050 7b02          	ld	a,(OFST+0,sp)
2828  0052 5f            	clrw	x
2829  0053 97            	ld	xl,a
2830  0054 a601          	ld	a,#1
2831  0056 5d            	tnzw	x
2832  0057 2704          	jreq	L072
2833  0059               L272:
2834  0059 48            	sll	a
2835  005a 5a            	decw	x
2836  005b 26fc          	jrne	L272
2837  005d               L072:
2838  005d 6b02          	ld	(OFST+0,sp),a
2840                     ; 695   if (UART1_IT == UART1_IT_PE)
2842  005f 1e03          	ldw	x,(OFST+1,sp)
2843  0061 a30100        	cpw	x,#256
2844  0064 261c          	jrne	L3311
2845                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2847  0066 c65234        	ld	a,21044
2848  0069 1402          	and	a,(OFST+0,sp)
2849  006b 6b02          	ld	(OFST+0,sp),a
2851                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2853  006d c65230        	ld	a,21040
2854  0070 1501          	bcp	a,(OFST-1,sp)
2855  0072 270a          	jreq	L5311
2857  0074 0d02          	tnz	(OFST+0,sp)
2858  0076 2706          	jreq	L5311
2859                     ; 704       pendingbitstatus = SET;
2861  0078 a601          	ld	a,#1
2862  007a 6b02          	ld	(OFST+0,sp),a
2865  007c 2041          	jra	L1411
2866  007e               L5311:
2867                     ; 709       pendingbitstatus = RESET;
2869  007e 0f02          	clr	(OFST+0,sp)
2871  0080 203d          	jra	L1411
2872  0082               L3311:
2873                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2875  0082 1e03          	ldw	x,(OFST+1,sp)
2876  0084 a30346        	cpw	x,#838
2877  0087 261c          	jrne	L3411
2878                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2880  0089 c65237        	ld	a,21047
2881  008c 1402          	and	a,(OFST+0,sp)
2882  008e 6b02          	ld	(OFST+0,sp),a
2884                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2886  0090 c65237        	ld	a,21047
2887  0093 1501          	bcp	a,(OFST-1,sp)
2888  0095 270a          	jreq	L5411
2890  0097 0d02          	tnz	(OFST+0,sp)
2891  0099 2706          	jreq	L5411
2892                     ; 721       pendingbitstatus = SET;
2894  009b a601          	ld	a,#1
2895  009d 6b02          	ld	(OFST+0,sp),a
2898  009f 201e          	jra	L1411
2899  00a1               L5411:
2900                     ; 726       pendingbitstatus = RESET;
2902  00a1 0f02          	clr	(OFST+0,sp)
2904  00a3 201a          	jra	L1411
2905  00a5               L3411:
2906                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2908  00a5 c65235        	ld	a,21045
2909  00a8 1402          	and	a,(OFST+0,sp)
2910  00aa 6b02          	ld	(OFST+0,sp),a
2912                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2914  00ac c65230        	ld	a,21040
2915  00af 1501          	bcp	a,(OFST-1,sp)
2916  00b1 270a          	jreq	L3511
2918  00b3 0d02          	tnz	(OFST+0,sp)
2919  00b5 2706          	jreq	L3511
2920                     ; 737       pendingbitstatus = SET;
2922  00b7 a601          	ld	a,#1
2923  00b9 6b02          	ld	(OFST+0,sp),a
2926  00bb 2002          	jra	L1411
2927  00bd               L3511:
2928                     ; 742       pendingbitstatus = RESET;
2930  00bd 0f02          	clr	(OFST+0,sp)
2932  00bf               L1411:
2933                     ; 747   return  pendingbitstatus;
2935  00bf 7b02          	ld	a,(OFST+0,sp)
2938  00c1 5b04          	addw	sp,#4
2939  00c3 81            	ret
2976                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2976                     ; 776 {
2977                     .text:	section	.text,new
2978  0000               _UART1_ClearITPendingBit:
2980  0000 89            	pushw	x
2981       00000000      OFST:	set	0
2984                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2986  0001 a30255        	cpw	x,#597
2987  0004 2705          	jreq	L003
2988  0006 a30346        	cpw	x,#838
2989  0009 2603          	jrne	L672
2990  000b               L003:
2991  000b 4f            	clr	a
2992  000c 2010          	jra	L203
2993  000e               L672:
2994  000e ae0309        	ldw	x,#777
2995  0011 89            	pushw	x
2996  0012 ae0000        	ldw	x,#0
2997  0015 89            	pushw	x
2998  0016 ae0008        	ldw	x,#L561
2999  0019 cd0000        	call	_assert_failed
3001  001c 5b04          	addw	sp,#4
3002  001e               L203:
3003                     ; 780   if (UART1_IT == UART1_IT_RXNE)
3005  001e 1e01          	ldw	x,(OFST+1,sp)
3006  0020 a30255        	cpw	x,#597
3007  0023 2606          	jrne	L5711
3008                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3010  0025 35df5230      	mov	21040,#223
3012  0029 2004          	jra	L7711
3013  002b               L5711:
3014                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3016  002b 72195237      	bres	21047,#4
3017  002f               L7711:
3018                     ; 789 }
3021  002f 85            	popw	x
3022  0030 81            	ret
3035                     	xdef	_UART1_ClearITPendingBit
3036                     	xdef	_UART1_GetITStatus
3037                     	xdef	_UART1_ClearFlag
3038                     	xdef	_UART1_GetFlagStatus
3039                     	xdef	_UART1_SetPrescaler
3040                     	xdef	_UART1_SetGuardTime
3041                     	xdef	_UART1_SetAddress
3042                     	xdef	_UART1_SendBreak
3043                     	xdef	_UART1_SendData9
3044                     	xdef	_UART1_SendData8
3045                     	xdef	_UART1_ReceiveData9
3046                     	xdef	_UART1_ReceiveData8
3047                     	xdef	_UART1_ReceiverWakeUpCmd
3048                     	xdef	_UART1_WakeUpConfig
3049                     	xdef	_UART1_SmartCardNACKCmd
3050                     	xdef	_UART1_SmartCardCmd
3051                     	xdef	_UART1_LINCmd
3052                     	xdef	_UART1_LINBreakDetectionConfig
3053                     	xdef	_UART1_IrDACmd
3054                     	xdef	_UART1_IrDAConfig
3055                     	xdef	_UART1_HalfDuplexCmd
3056                     	xdef	_UART1_ITConfig
3057                     	xdef	_UART1_Cmd
3058                     	xdef	_UART1_Init
3059                     	xdef	_UART1_DeInit
3060                     	xref	_assert_failed
3061                     	xref	_CLK_GetClockFreq
3062                     	switch	.const
3063  0008               L561:
3064  0008 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
3065  001a 75617274312e  	dc.b	"uart1.c",0
3066                     	xref.b	c_lreg
3067                     	xref.b	c_x
3087                     	xref	c_lursh
3088                     	xref	c_lsub
3089                     	xref	c_smul
3090                     	xref	c_ludv
3091                     	xref	c_rtol
3092                     	xref	c_llsh
3093                     	xref	c_lcmp
3094                     	xref	c_ltor
3095                     	end
