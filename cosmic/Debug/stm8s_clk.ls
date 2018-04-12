   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004               _CLKPrescTable:
  24  0004 01            	dc.b	1
  25  0005 02            	dc.b	2
  26  0006 04            	dc.b	4
  27  0007 08            	dc.b	8
  28  0008 0a            	dc.b	10
  29  0009 10            	dc.b	16
  30  000a 14            	dc.b	20
  31  000b 28            	dc.b	40
  60                     ; 72 void CLK_DeInit(void)
  60                     ; 73 {
  62                     .text:	section	.text,new
  63  0000               _CLK_DeInit:
  67                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  69  0000 350150c0      	mov	20672,#1
  70                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  72  0004 725f50c1      	clr	20673
  73                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  75  0008 35e150c4      	mov	20676,#225
  76                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  78  000c 725f50c5      	clr	20677
  79                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  81  0010 351850c6      	mov	20678,#24
  82                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  84  0014 35ff50c7      	mov	20679,#255
  85                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  87  0018 35ff50ca      	mov	20682,#255
  88                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  90  001c 725f50c8      	clr	20680
  91                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  93  0020 725f50c9      	clr	20681
  95  0024               L52:
  96                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  98  0024 c650c9        	ld	a,20681
  99  0027 a501          	bcp	a,#1
 100  0029 26f9          	jrne	L52
 101                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  002b 725f50c9      	clr	20681
 104                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002f 725f50cc      	clr	20684
 107                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0033 725f50cd      	clr	20685
 110                     ; 88 }
 113  0037 81            	ret
 170                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 100 {
 171                     .text:	section	.text,new
 172  0000               _CLK_FastHaltWakeUpCmd:
 174  0000 88            	push	a
 175       00000000      OFST:	set	0
 178                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 180  0001 4d            	tnz	a
 181  0002 2704          	jreq	L21
 182  0004 a101          	cp	a,#1
 183  0006 2603          	jrne	L01
 184  0008               L21:
 185  0008 4f            	clr	a
 186  0009 2010          	jra	L41
 187  000b               L01:
 188  000b ae0066        	ldw	x,#102
 189  000e 89            	pushw	x
 190  000f ae0000        	ldw	x,#0
 191  0012 89            	pushw	x
 192  0013 ae000c        	ldw	x,#L75
 193  0016 cd0000        	call	_assert_failed
 195  0019 5b04          	addw	sp,#4
 196  001b               L41:
 197                     ; 104   if (NewState != DISABLE)
 199  001b 0d01          	tnz	(OFST+1,sp)
 200  001d 2706          	jreq	L16
 201                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 203  001f 721450c0      	bset	20672,#2
 205  0023 2004          	jra	L36
 206  0025               L16:
 207                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 209  0025 721550c0      	bres	20672,#2
 210  0029               L36:
 211                     ; 114 }
 214  0029 84            	pop	a
 215  002a 81            	ret
 251                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 251                     ; 122 {
 252                     .text:	section	.text,new
 253  0000               _CLK_HSECmd:
 255  0000 88            	push	a
 256       00000000      OFST:	set	0
 259                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 261  0001 4d            	tnz	a
 262  0002 2704          	jreq	L22
 263  0004 a101          	cp	a,#1
 264  0006 2603          	jrne	L02
 265  0008               L22:
 266  0008 4f            	clr	a
 267  0009 2010          	jra	L42
 268  000b               L02:
 269  000b ae007c        	ldw	x,#124
 270  000e 89            	pushw	x
 271  000f ae0000        	ldw	x,#0
 272  0012 89            	pushw	x
 273  0013 ae000c        	ldw	x,#L75
 274  0016 cd0000        	call	_assert_failed
 276  0019 5b04          	addw	sp,#4
 277  001b               L42:
 278                     ; 126   if (NewState != DISABLE)
 280  001b 0d01          	tnz	(OFST+1,sp)
 281  001d 2706          	jreq	L301
 282                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 284  001f 721050c1      	bset	20673,#0
 286  0023 2004          	jra	L501
 287  0025               L301:
 288                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 290  0025 721150c1      	bres	20673,#0
 291  0029               L501:
 292                     ; 136 }
 295  0029 84            	pop	a
 296  002a 81            	ret
 332                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 332                     ; 144 {
 333                     .text:	section	.text,new
 334  0000               _CLK_HSICmd:
 336  0000 88            	push	a
 337       00000000      OFST:	set	0
 340                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 342  0001 4d            	tnz	a
 343  0002 2704          	jreq	L23
 344  0004 a101          	cp	a,#1
 345  0006 2603          	jrne	L03
 346  0008               L23:
 347  0008 4f            	clr	a
 348  0009 2010          	jra	L43
 349  000b               L03:
 350  000b ae0092        	ldw	x,#146
 351  000e 89            	pushw	x
 352  000f ae0000        	ldw	x,#0
 353  0012 89            	pushw	x
 354  0013 ae000c        	ldw	x,#L75
 355  0016 cd0000        	call	_assert_failed
 357  0019 5b04          	addw	sp,#4
 358  001b               L43:
 359                     ; 148   if (NewState != DISABLE)
 361  001b 0d01          	tnz	(OFST+1,sp)
 362  001d 2706          	jreq	L521
 363                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 365  001f 721050c0      	bset	20672,#0
 367  0023 2004          	jra	L721
 368  0025               L521:
 369                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 371  0025 721150c0      	bres	20672,#0
 372  0029               L721:
 373                     ; 158 }
 376  0029 84            	pop	a
 377  002a 81            	ret
 413                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 413                     ; 167 {
 414                     .text:	section	.text,new
 415  0000               _CLK_LSICmd:
 417  0000 88            	push	a
 418       00000000      OFST:	set	0
 421                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 423  0001 4d            	tnz	a
 424  0002 2704          	jreq	L24
 425  0004 a101          	cp	a,#1
 426  0006 2603          	jrne	L04
 427  0008               L24:
 428  0008 4f            	clr	a
 429  0009 2010          	jra	L44
 430  000b               L04:
 431  000b ae00a9        	ldw	x,#169
 432  000e 89            	pushw	x
 433  000f ae0000        	ldw	x,#0
 434  0012 89            	pushw	x
 435  0013 ae000c        	ldw	x,#L75
 436  0016 cd0000        	call	_assert_failed
 438  0019 5b04          	addw	sp,#4
 439  001b               L44:
 440                     ; 171   if (NewState != DISABLE)
 442  001b 0d01          	tnz	(OFST+1,sp)
 443  001d 2706          	jreq	L741
 444                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 446  001f 721650c0      	bset	20672,#3
 448  0023 2004          	jra	L151
 449  0025               L741:
 450                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 452  0025 721750c0      	bres	20672,#3
 453  0029               L151:
 454                     ; 181 }
 457  0029 84            	pop	a
 458  002a 81            	ret
 494                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 494                     ; 190 {
 495                     .text:	section	.text,new
 496  0000               _CLK_CCOCmd:
 498  0000 88            	push	a
 499       00000000      OFST:	set	0
 502                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 504  0001 4d            	tnz	a
 505  0002 2704          	jreq	L25
 506  0004 a101          	cp	a,#1
 507  0006 2603          	jrne	L05
 508  0008               L25:
 509  0008 4f            	clr	a
 510  0009 2010          	jra	L45
 511  000b               L05:
 512  000b ae00c0        	ldw	x,#192
 513  000e 89            	pushw	x
 514  000f ae0000        	ldw	x,#0
 515  0012 89            	pushw	x
 516  0013 ae000c        	ldw	x,#L75
 517  0016 cd0000        	call	_assert_failed
 519  0019 5b04          	addw	sp,#4
 520  001b               L45:
 521                     ; 194   if (NewState != DISABLE)
 523  001b 0d01          	tnz	(OFST+1,sp)
 524  001d 2706          	jreq	L171
 525                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 527  001f 721050c9      	bset	20681,#0
 529  0023 2004          	jra	L371
 530  0025               L171:
 531                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 533  0025 721150c9      	bres	20681,#0
 534  0029               L371:
 535                     ; 204 }
 538  0029 84            	pop	a
 539  002a 81            	ret
 575                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 575                     ; 214 {
 576                     .text:	section	.text,new
 577  0000               _CLK_ClockSwitchCmd:
 579  0000 88            	push	a
 580       00000000      OFST:	set	0
 583                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 585  0001 4d            	tnz	a
 586  0002 2704          	jreq	L26
 587  0004 a101          	cp	a,#1
 588  0006 2603          	jrne	L06
 589  0008               L26:
 590  0008 4f            	clr	a
 591  0009 2010          	jra	L46
 592  000b               L06:
 593  000b ae00d8        	ldw	x,#216
 594  000e 89            	pushw	x
 595  000f ae0000        	ldw	x,#0
 596  0012 89            	pushw	x
 597  0013 ae000c        	ldw	x,#L75
 598  0016 cd0000        	call	_assert_failed
 600  0019 5b04          	addw	sp,#4
 601  001b               L46:
 602                     ; 218   if (NewState != DISABLE )
 604  001b 0d01          	tnz	(OFST+1,sp)
 605  001d 2706          	jreq	L312
 606                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 608  001f 721250c5      	bset	20677,#1
 610  0023 2004          	jra	L512
 611  0025               L312:
 612                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 614  0025 721350c5      	bres	20677,#1
 615  0029               L512:
 616                     ; 228 }
 619  0029 84            	pop	a
 620  002a 81            	ret
 657                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 657                     ; 239 {
 658                     .text:	section	.text,new
 659  0000               _CLK_SlowActiveHaltWakeUpCmd:
 661  0000 88            	push	a
 662       00000000      OFST:	set	0
 665                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 667  0001 4d            	tnz	a
 668  0002 2704          	jreq	L27
 669  0004 a101          	cp	a,#1
 670  0006 2603          	jrne	L07
 671  0008               L27:
 672  0008 4f            	clr	a
 673  0009 2010          	jra	L47
 674  000b               L07:
 675  000b ae00f1        	ldw	x,#241
 676  000e 89            	pushw	x
 677  000f ae0000        	ldw	x,#0
 678  0012 89            	pushw	x
 679  0013 ae000c        	ldw	x,#L75
 680  0016 cd0000        	call	_assert_failed
 682  0019 5b04          	addw	sp,#4
 683  001b               L47:
 684                     ; 243   if (NewState != DISABLE)
 686  001b 0d01          	tnz	(OFST+1,sp)
 687  001d 2706          	jreq	L532
 688                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 690  001f 721a50c0      	bset	20672,#5
 692  0023 2004          	jra	L732
 693  0025               L532:
 694                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 696  0025 721b50c0      	bres	20672,#5
 697  0029               L732:
 698                     ; 253 }
 701  0029 84            	pop	a
 702  002a 81            	ret
 862                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 862                     ; 264 {
 863                     .text:	section	.text,new
 864  0000               _CLK_PeripheralClockConfig:
 866  0000 89            	pushw	x
 867       00000000      OFST:	set	0
 870                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 872  0001 9f            	ld	a,xl
 873  0002 4d            	tnz	a
 874  0003 2705          	jreq	L201
 875  0005 9f            	ld	a,xl
 876  0006 a101          	cp	a,#1
 877  0008 2603          	jrne	L001
 878  000a               L201:
 879  000a 4f            	clr	a
 880  000b 2010          	jra	L401
 881  000d               L001:
 882  000d ae010a        	ldw	x,#266
 883  0010 89            	pushw	x
 884  0011 ae0000        	ldw	x,#0
 885  0014 89            	pushw	x
 886  0015 ae000c        	ldw	x,#L75
 887  0018 cd0000        	call	_assert_failed
 889  001b 5b04          	addw	sp,#4
 890  001d               L401:
 891                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 893  001d 0d01          	tnz	(OFST+1,sp)
 894  001f 274e          	jreq	L011
 895  0021 7b01          	ld	a,(OFST+1,sp)
 896  0023 a101          	cp	a,#1
 897  0025 2748          	jreq	L011
 898  0027 7b01          	ld	a,(OFST+1,sp)
 899  0029 a103          	cp	a,#3
 900  002b 2742          	jreq	L011
 901  002d 7b01          	ld	a,(OFST+1,sp)
 902  002f a103          	cp	a,#3
 903  0031 273c          	jreq	L011
 904  0033 7b01          	ld	a,(OFST+1,sp)
 905  0035 a103          	cp	a,#3
 906  0037 2736          	jreq	L011
 907  0039 7b01          	ld	a,(OFST+1,sp)
 908  003b a104          	cp	a,#4
 909  003d 2730          	jreq	L011
 910  003f 7b01          	ld	a,(OFST+1,sp)
 911  0041 a105          	cp	a,#5
 912  0043 272a          	jreq	L011
 913  0045 7b01          	ld	a,(OFST+1,sp)
 914  0047 a105          	cp	a,#5
 915  0049 2724          	jreq	L011
 916  004b 7b01          	ld	a,(OFST+1,sp)
 917  004d a104          	cp	a,#4
 918  004f 271e          	jreq	L011
 919  0051 7b01          	ld	a,(OFST+1,sp)
 920  0053 a106          	cp	a,#6
 921  0055 2718          	jreq	L011
 922  0057 7b01          	ld	a,(OFST+1,sp)
 923  0059 a107          	cp	a,#7
 924  005b 2712          	jreq	L011
 925  005d 7b01          	ld	a,(OFST+1,sp)
 926  005f a117          	cp	a,#23
 927  0061 270c          	jreq	L011
 928  0063 7b01          	ld	a,(OFST+1,sp)
 929  0065 a113          	cp	a,#19
 930  0067 2706          	jreq	L011
 931  0069 7b01          	ld	a,(OFST+1,sp)
 932  006b a112          	cp	a,#18
 933  006d 2603          	jrne	L601
 934  006f               L011:
 935  006f 4f            	clr	a
 936  0070 2010          	jra	L211
 937  0072               L601:
 938  0072 ae010b        	ldw	x,#267
 939  0075 89            	pushw	x
 940  0076 ae0000        	ldw	x,#0
 941  0079 89            	pushw	x
 942  007a ae000c        	ldw	x,#L75
 943  007d cd0000        	call	_assert_failed
 945  0080 5b04          	addw	sp,#4
 946  0082               L211:
 947                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 949  0082 7b01          	ld	a,(OFST+1,sp)
 950  0084 a510          	bcp	a,#16
 951  0086 2633          	jrne	L323
 952                     ; 271     if (NewState != DISABLE)
 954  0088 0d02          	tnz	(OFST+2,sp)
 955  008a 2717          	jreq	L523
 956                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 958  008c 7b01          	ld	a,(OFST+1,sp)
 959  008e a40f          	and	a,#15
 960  0090 5f            	clrw	x
 961  0091 97            	ld	xl,a
 962  0092 a601          	ld	a,#1
 963  0094 5d            	tnzw	x
 964  0095 2704          	jreq	L411
 965  0097               L611:
 966  0097 48            	sll	a
 967  0098 5a            	decw	x
 968  0099 26fc          	jrne	L611
 969  009b               L411:
 970  009b ca50c7        	or	a,20679
 971  009e c750c7        	ld	20679,a
 973  00a1 2049          	jra	L133
 974  00a3               L523:
 975                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 977  00a3 7b01          	ld	a,(OFST+1,sp)
 978  00a5 a40f          	and	a,#15
 979  00a7 5f            	clrw	x
 980  00a8 97            	ld	xl,a
 981  00a9 a601          	ld	a,#1
 982  00ab 5d            	tnzw	x
 983  00ac 2704          	jreq	L021
 984  00ae               L221:
 985  00ae 48            	sll	a
 986  00af 5a            	decw	x
 987  00b0 26fc          	jrne	L221
 988  00b2               L021:
 989  00b2 43            	cpl	a
 990  00b3 c450c7        	and	a,20679
 991  00b6 c750c7        	ld	20679,a
 992  00b9 2031          	jra	L133
 993  00bb               L323:
 994                     ; 284     if (NewState != DISABLE)
 996  00bb 0d02          	tnz	(OFST+2,sp)
 997  00bd 2717          	jreq	L333
 998                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1000  00bf 7b01          	ld	a,(OFST+1,sp)
1001  00c1 a40f          	and	a,#15
1002  00c3 5f            	clrw	x
1003  00c4 97            	ld	xl,a
1004  00c5 a601          	ld	a,#1
1005  00c7 5d            	tnzw	x
1006  00c8 2704          	jreq	L421
1007  00ca               L621:
1008  00ca 48            	sll	a
1009  00cb 5a            	decw	x
1010  00cc 26fc          	jrne	L621
1011  00ce               L421:
1012  00ce ca50ca        	or	a,20682
1013  00d1 c750ca        	ld	20682,a
1015  00d4 2016          	jra	L133
1016  00d6               L333:
1017                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1019  00d6 7b01          	ld	a,(OFST+1,sp)
1020  00d8 a40f          	and	a,#15
1021  00da 5f            	clrw	x
1022  00db 97            	ld	xl,a
1023  00dc a601          	ld	a,#1
1024  00de 5d            	tnzw	x
1025  00df 2704          	jreq	L031
1026  00e1               L231:
1027  00e1 48            	sll	a
1028  00e2 5a            	decw	x
1029  00e3 26fc          	jrne	L231
1030  00e5               L031:
1031  00e5 43            	cpl	a
1032  00e6 c450ca        	and	a,20682
1033  00e9 c750ca        	ld	20682,a
1034  00ec               L133:
1035                     ; 295 }
1038  00ec 85            	popw	x
1039  00ed 81            	ret
1226                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1226                     ; 310 {
1227                     .text:	section	.text,new
1228  0000               _CLK_ClockSwitchConfig:
1230  0000 89            	pushw	x
1231  0001 5204          	subw	sp,#4
1232       00000004      OFST:	set	4
1235                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1237  0003 aeffff        	ldw	x,#65535
1238  0006 1f03          	ldw	(OFST-1,sp),x
1240                     ; 313   ErrorStatus Swif = ERROR;
1242                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1244  0008 7b06          	ld	a,(OFST+2,sp)
1245  000a a1e1          	cp	a,#225
1246  000c 270c          	jreq	L041
1247  000e 7b06          	ld	a,(OFST+2,sp)
1248  0010 a1d2          	cp	a,#210
1249  0012 2706          	jreq	L041
1250  0014 7b06          	ld	a,(OFST+2,sp)
1251  0016 a1b4          	cp	a,#180
1252  0018 2603          	jrne	L631
1253  001a               L041:
1254  001a 4f            	clr	a
1255  001b 2010          	jra	L241
1256  001d               L631:
1257  001d ae013c        	ldw	x,#316
1258  0020 89            	pushw	x
1259  0021 ae0000        	ldw	x,#0
1260  0024 89            	pushw	x
1261  0025 ae000c        	ldw	x,#L75
1262  0028 cd0000        	call	_assert_failed
1264  002b 5b04          	addw	sp,#4
1265  002d               L241:
1266                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1268  002d 0d05          	tnz	(OFST+1,sp)
1269  002f 2706          	jreq	L641
1270  0031 7b05          	ld	a,(OFST+1,sp)
1271  0033 a101          	cp	a,#1
1272  0035 2603          	jrne	L441
1273  0037               L641:
1274  0037 4f            	clr	a
1275  0038 2010          	jra	L051
1276  003a               L441:
1277  003a ae013d        	ldw	x,#317
1278  003d 89            	pushw	x
1279  003e ae0000        	ldw	x,#0
1280  0041 89            	pushw	x
1281  0042 ae000c        	ldw	x,#L75
1282  0045 cd0000        	call	_assert_failed
1284  0048 5b04          	addw	sp,#4
1285  004a               L051:
1286                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1288  004a 0d09          	tnz	(OFST+5,sp)
1289  004c 2706          	jreq	L451
1290  004e 7b09          	ld	a,(OFST+5,sp)
1291  0050 a101          	cp	a,#1
1292  0052 2603          	jrne	L251
1293  0054               L451:
1294  0054 4f            	clr	a
1295  0055 2010          	jra	L651
1296  0057               L251:
1297  0057 ae013e        	ldw	x,#318
1298  005a 89            	pushw	x
1299  005b ae0000        	ldw	x,#0
1300  005e 89            	pushw	x
1301  005f ae000c        	ldw	x,#L75
1302  0062 cd0000        	call	_assert_failed
1304  0065 5b04          	addw	sp,#4
1305  0067               L651:
1306                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1308  0067 0d0a          	tnz	(OFST+6,sp)
1309  0069 2706          	jreq	L261
1310  006b 7b0a          	ld	a,(OFST+6,sp)
1311  006d a101          	cp	a,#1
1312  006f 2603          	jrne	L061
1313  0071               L261:
1314  0071 4f            	clr	a
1315  0072 2010          	jra	L461
1316  0074               L061:
1317  0074 ae013f        	ldw	x,#319
1318  0077 89            	pushw	x
1319  0078 ae0000        	ldw	x,#0
1320  007b 89            	pushw	x
1321  007c ae000c        	ldw	x,#L75
1322  007f cd0000        	call	_assert_failed
1324  0082 5b04          	addw	sp,#4
1325  0084               L461:
1326                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1328  0084 c650c3        	ld	a,20675
1329  0087 6b01          	ld	(OFST-3,sp),a
1331                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1333  0089 7b05          	ld	a,(OFST+1,sp)
1334  008b a101          	cp	a,#1
1335  008d 264b          	jrne	L544
1336                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1338  008f 721250c5      	bset	20677,#1
1339                     ; 331     if (ITState != DISABLE)
1341  0093 0d09          	tnz	(OFST+5,sp)
1342  0095 2706          	jreq	L744
1343                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1345  0097 721450c5      	bset	20677,#2
1347  009b 2004          	jra	L154
1348  009d               L744:
1349                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1351  009d 721550c5      	bres	20677,#2
1352  00a1               L154:
1353                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1355  00a1 7b06          	ld	a,(OFST+2,sp)
1356  00a3 c750c4        	ld	20676,a
1358  00a6 2007          	jra	L754
1359  00a8               L354:
1360                     ; 346       DownCounter--;
1362  00a8 1e03          	ldw	x,(OFST-1,sp)
1363  00aa 1d0001        	subw	x,#1
1364  00ad 1f03          	ldw	(OFST-1,sp),x
1366  00af               L754:
1367                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1369  00af c650c5        	ld	a,20677
1370  00b2 a501          	bcp	a,#1
1371  00b4 2704          	jreq	L364
1373  00b6 1e03          	ldw	x,(OFST-1,sp)
1374  00b8 26ee          	jrne	L354
1375  00ba               L364:
1376                     ; 349     if(DownCounter != 0)
1378  00ba 1e03          	ldw	x,(OFST-1,sp)
1379  00bc 2706          	jreq	L564
1380                     ; 351       Swif = SUCCESS;
1382  00be a601          	ld	a,#1
1383  00c0 6b02          	ld	(OFST-2,sp),a
1386  00c2 2002          	jra	L174
1387  00c4               L564:
1388                     ; 355       Swif = ERROR;
1390  00c4 0f02          	clr	(OFST-2,sp)
1392  00c6               L174:
1393                     ; 390   if(Swif != ERROR)
1395  00c6 0d02          	tnz	(OFST-2,sp)
1396  00c8 2767          	jreq	L515
1397                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1399  00ca 0d0a          	tnz	(OFST+6,sp)
1400  00cc 2645          	jrne	L715
1402  00ce 7b01          	ld	a,(OFST-3,sp)
1403  00d0 a1e1          	cp	a,#225
1404  00d2 263f          	jrne	L715
1405                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1407  00d4 721150c0      	bres	20672,#0
1409  00d8 2057          	jra	L515
1410  00da               L544:
1411                     ; 361     if (ITState != DISABLE)
1413  00da 0d09          	tnz	(OFST+5,sp)
1414  00dc 2706          	jreq	L374
1415                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1417  00de 721450c5      	bset	20677,#2
1419  00e2 2004          	jra	L574
1420  00e4               L374:
1421                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1423  00e4 721550c5      	bres	20677,#2
1424  00e8               L574:
1425                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1427  00e8 7b06          	ld	a,(OFST+2,sp)
1428  00ea c750c4        	ld	20676,a
1430  00ed 2007          	jra	L305
1431  00ef               L774:
1432                     ; 376       DownCounter--;
1434  00ef 1e03          	ldw	x,(OFST-1,sp)
1435  00f1 1d0001        	subw	x,#1
1436  00f4 1f03          	ldw	(OFST-1,sp),x
1438  00f6               L305:
1439                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1441  00f6 c650c5        	ld	a,20677
1442  00f9 a508          	bcp	a,#8
1443  00fb 2704          	jreq	L705
1445  00fd 1e03          	ldw	x,(OFST-1,sp)
1446  00ff 26ee          	jrne	L774
1447  0101               L705:
1448                     ; 379     if(DownCounter != 0)
1450  0101 1e03          	ldw	x,(OFST-1,sp)
1451  0103 270a          	jreq	L115
1452                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1454  0105 721250c5      	bset	20677,#1
1455                     ; 383       Swif = SUCCESS;
1457  0109 a601          	ld	a,#1
1458  010b 6b02          	ld	(OFST-2,sp),a
1461  010d 20b7          	jra	L174
1462  010f               L115:
1463                     ; 387       Swif = ERROR;
1465  010f 0f02          	clr	(OFST-2,sp)
1467  0111 20b3          	jra	L174
1468  0113               L715:
1469                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1471  0113 0d0a          	tnz	(OFST+6,sp)
1472  0115 260c          	jrne	L325
1474  0117 7b01          	ld	a,(OFST-3,sp)
1475  0119 a1d2          	cp	a,#210
1476  011b 2606          	jrne	L325
1477                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1479  011d 721750c0      	bres	20672,#3
1481  0121 200e          	jra	L515
1482  0123               L325:
1483                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1485  0123 0d0a          	tnz	(OFST+6,sp)
1486  0125 260a          	jrne	L515
1488  0127 7b01          	ld	a,(OFST-3,sp)
1489  0129 a1b4          	cp	a,#180
1490  012b 2604          	jrne	L515
1491                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1493  012d 721150c1      	bres	20673,#0
1494  0131               L515:
1495                     ; 406   return(Swif);
1497  0131 7b02          	ld	a,(OFST-2,sp)
1500  0133 5b06          	addw	sp,#6
1501  0135 81            	ret
1640                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1640                     ; 416 {
1641                     .text:	section	.text,new
1642  0000               _CLK_HSIPrescalerConfig:
1644  0000 88            	push	a
1645       00000000      OFST:	set	0
1648                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1650  0001 4d            	tnz	a
1651  0002 270c          	jreq	L271
1652  0004 a108          	cp	a,#8
1653  0006 2708          	jreq	L271
1654  0008 a110          	cp	a,#16
1655  000a 2704          	jreq	L271
1656  000c a118          	cp	a,#24
1657  000e 2603          	jrne	L071
1658  0010               L271:
1659  0010 4f            	clr	a
1660  0011 2010          	jra	L471
1661  0013               L071:
1662  0013 ae01a2        	ldw	x,#418
1663  0016 89            	pushw	x
1664  0017 ae0000        	ldw	x,#0
1665  001a 89            	pushw	x
1666  001b ae000c        	ldw	x,#L75
1667  001e cd0000        	call	_assert_failed
1669  0021 5b04          	addw	sp,#4
1670  0023               L471:
1671                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1673  0023 c650c6        	ld	a,20678
1674  0026 a4e7          	and	a,#231
1675  0028 c750c6        	ld	20678,a
1676                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1678  002b c650c6        	ld	a,20678
1679  002e 1a01          	or	a,(OFST+1,sp)
1680  0030 c750c6        	ld	20678,a
1681                     ; 425 }
1684  0033 84            	pop	a
1685  0034 81            	ret
1821                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1821                     ; 437 {
1822                     .text:	section	.text,new
1823  0000               _CLK_CCOConfig:
1825  0000 88            	push	a
1826       00000000      OFST:	set	0
1829                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1831  0001 4d            	tnz	a
1832  0002 2730          	jreq	L202
1833  0004 a104          	cp	a,#4
1834  0006 272c          	jreq	L202
1835  0008 a102          	cp	a,#2
1836  000a 2728          	jreq	L202
1837  000c a108          	cp	a,#8
1838  000e 2724          	jreq	L202
1839  0010 a10a          	cp	a,#10
1840  0012 2720          	jreq	L202
1841  0014 a10c          	cp	a,#12
1842  0016 271c          	jreq	L202
1843  0018 a10e          	cp	a,#14
1844  001a 2718          	jreq	L202
1845  001c a110          	cp	a,#16
1846  001e 2714          	jreq	L202
1847  0020 a112          	cp	a,#18
1848  0022 2710          	jreq	L202
1849  0024 a114          	cp	a,#20
1850  0026 270c          	jreq	L202
1851  0028 a116          	cp	a,#22
1852  002a 2708          	jreq	L202
1853  002c a118          	cp	a,#24
1854  002e 2704          	jreq	L202
1855  0030 a11a          	cp	a,#26
1856  0032 2603          	jrne	L002
1857  0034               L202:
1858  0034 4f            	clr	a
1859  0035 2010          	jra	L402
1860  0037               L002:
1861  0037 ae01b7        	ldw	x,#439
1862  003a 89            	pushw	x
1863  003b ae0000        	ldw	x,#0
1864  003e 89            	pushw	x
1865  003f ae000c        	ldw	x,#L75
1866  0042 cd0000        	call	_assert_failed
1868  0045 5b04          	addw	sp,#4
1869  0047               L402:
1870                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1872  0047 c650c9        	ld	a,20681
1873  004a a4e1          	and	a,#225
1874  004c c750c9        	ld	20681,a
1875                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1877  004f c650c9        	ld	a,20681
1878  0052 1a01          	or	a,(OFST+1,sp)
1879  0054 c750c9        	ld	20681,a
1880                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1882  0057 721050c9      	bset	20681,#0
1883                     ; 449 }
1886  005b 84            	pop	a
1887  005c 81            	ret
1953                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1953                     ; 460 {
1954                     .text:	section	.text,new
1955  0000               _CLK_ITConfig:
1957  0000 89            	pushw	x
1958       00000000      OFST:	set	0
1961                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1963  0001 9f            	ld	a,xl
1964  0002 4d            	tnz	a
1965  0003 2705          	jreq	L212
1966  0005 9f            	ld	a,xl
1967  0006 a101          	cp	a,#1
1968  0008 2603          	jrne	L012
1969  000a               L212:
1970  000a 4f            	clr	a
1971  000b 2010          	jra	L412
1972  000d               L012:
1973  000d ae01ce        	ldw	x,#462
1974  0010 89            	pushw	x
1975  0011 ae0000        	ldw	x,#0
1976  0014 89            	pushw	x
1977  0015 ae000c        	ldw	x,#L75
1978  0018 cd0000        	call	_assert_failed
1980  001b 5b04          	addw	sp,#4
1981  001d               L412:
1982                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1984  001d 7b01          	ld	a,(OFST+1,sp)
1985  001f a10c          	cp	a,#12
1986  0021 2706          	jreq	L022
1987  0023 7b01          	ld	a,(OFST+1,sp)
1988  0025 a11c          	cp	a,#28
1989  0027 2603          	jrne	L612
1990  0029               L022:
1991  0029 4f            	clr	a
1992  002a 2010          	jra	L222
1993  002c               L612:
1994  002c ae01cf        	ldw	x,#463
1995  002f 89            	pushw	x
1996  0030 ae0000        	ldw	x,#0
1997  0033 89            	pushw	x
1998  0034 ae000c        	ldw	x,#L75
1999  0037 cd0000        	call	_assert_failed
2001  003a 5b04          	addw	sp,#4
2002  003c               L222:
2003                     ; 465   if (NewState != DISABLE)
2005  003c 0d02          	tnz	(OFST+2,sp)
2006  003e 271a          	jreq	L527
2007                     ; 467     switch (CLK_IT)
2009  0040 7b01          	ld	a,(OFST+1,sp)
2011                     ; 475     default:
2011                     ; 476       break;
2012  0042 a00c          	sub	a,#12
2013  0044 270a          	jreq	L166
2014  0046 a010          	sub	a,#16
2015  0048 2624          	jrne	L337
2016                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
2016                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
2018  004a 721450c5      	bset	20677,#2
2019                     ; 471       break;
2021  004e 201e          	jra	L337
2022  0050               L166:
2023                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
2023                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
2025  0050 721450c8      	bset	20680,#2
2026                     ; 474       break;
2028  0054 2018          	jra	L337
2029  0056               L366:
2030                     ; 475     default:
2030                     ; 476       break;
2032  0056 2016          	jra	L337
2033  0058               L137:
2035  0058 2014          	jra	L337
2036  005a               L527:
2037                     ; 481     switch (CLK_IT)
2039  005a 7b01          	ld	a,(OFST+1,sp)
2041                     ; 489     default:
2041                     ; 490       break;
2042  005c a00c          	sub	a,#12
2043  005e 270a          	jreq	L766
2044  0060 a010          	sub	a,#16
2045  0062 260a          	jrne	L337
2046                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2046                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2048  0064 721550c5      	bres	20677,#2
2049                     ; 485       break;
2051  0068 2004          	jra	L337
2052  006a               L766:
2053                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2053                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2055  006a 721550c8      	bres	20680,#2
2056                     ; 488       break;
2057  006e               L337:
2058                     ; 493 }
2061  006e 85            	popw	x
2062  006f 81            	ret
2063  0070               L176:
2064                     ; 489     default:
2064                     ; 490       break;
2066  0070 20fc          	jra	L337
2067  0072               L737:
2068  0072 20fa          	jra	L337
2104                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2104                     ; 501 {
2105                     .text:	section	.text,new
2106  0000               _CLK_SYSCLKConfig:
2108  0000 88            	push	a
2109       00000000      OFST:	set	0
2112                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2114  0001 4d            	tnz	a
2115  0002 272c          	jreq	L032
2116  0004 a108          	cp	a,#8
2117  0006 2728          	jreq	L032
2118  0008 a110          	cp	a,#16
2119  000a 2724          	jreq	L032
2120  000c a118          	cp	a,#24
2121  000e 2720          	jreq	L032
2122  0010 a180          	cp	a,#128
2123  0012 271c          	jreq	L032
2124  0014 a181          	cp	a,#129
2125  0016 2718          	jreq	L032
2126  0018 a182          	cp	a,#130
2127  001a 2714          	jreq	L032
2128  001c a183          	cp	a,#131
2129  001e 2710          	jreq	L032
2130  0020 a184          	cp	a,#132
2131  0022 270c          	jreq	L032
2132  0024 a185          	cp	a,#133
2133  0026 2708          	jreq	L032
2134  0028 a186          	cp	a,#134
2135  002a 2704          	jreq	L032
2136  002c a187          	cp	a,#135
2137  002e 2603          	jrne	L622
2138  0030               L032:
2139  0030 4f            	clr	a
2140  0031 2010          	jra	L232
2141  0033               L622:
2142  0033 ae01f7        	ldw	x,#503
2143  0036 89            	pushw	x
2144  0037 ae0000        	ldw	x,#0
2145  003a 89            	pushw	x
2146  003b ae000c        	ldw	x,#L75
2147  003e cd0000        	call	_assert_failed
2149  0041 5b04          	addw	sp,#4
2150  0043               L232:
2151                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2153  0043 7b01          	ld	a,(OFST+1,sp)
2154  0045 a580          	bcp	a,#128
2155  0047 2614          	jrne	L757
2156                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2158  0049 c650c6        	ld	a,20678
2159  004c a4e7          	and	a,#231
2160  004e c750c6        	ld	20678,a
2161                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2163  0051 7b01          	ld	a,(OFST+1,sp)
2164  0053 a418          	and	a,#24
2165  0055 ca50c6        	or	a,20678
2166  0058 c750c6        	ld	20678,a
2168  005b 2012          	jra	L167
2169  005d               L757:
2170                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2172  005d c650c6        	ld	a,20678
2173  0060 a4f8          	and	a,#248
2174  0062 c750c6        	ld	20678,a
2175                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2177  0065 7b01          	ld	a,(OFST+1,sp)
2178  0067 a407          	and	a,#7
2179  0069 ca50c6        	or	a,20678
2180  006c c750c6        	ld	20678,a
2181  006f               L167:
2182                     ; 515 }
2185  006f 84            	pop	a
2186  0070 81            	ret
2243                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2243                     ; 524 {
2244                     .text:	section	.text,new
2245  0000               _CLK_SWIMConfig:
2247  0000 88            	push	a
2248       00000000      OFST:	set	0
2251                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2253  0001 4d            	tnz	a
2254  0002 2704          	jreq	L042
2255  0004 a101          	cp	a,#1
2256  0006 2603          	jrne	L632
2257  0008               L042:
2258  0008 4f            	clr	a
2259  0009 2010          	jra	L242
2260  000b               L632:
2261  000b ae020e        	ldw	x,#526
2262  000e 89            	pushw	x
2263  000f ae0000        	ldw	x,#0
2264  0012 89            	pushw	x
2265  0013 ae000c        	ldw	x,#L75
2266  0016 cd0000        	call	_assert_failed
2268  0019 5b04          	addw	sp,#4
2269  001b               L242:
2270                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2272  001b 0d01          	tnz	(OFST+1,sp)
2273  001d 2706          	jreq	L1101
2274                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2276  001f 721050cd      	bset	20685,#0
2278  0023 2004          	jra	L3101
2279  0025               L1101:
2280                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2282  0025 721150cd      	bres	20685,#0
2283  0029               L3101:
2284                     ; 538 }
2287  0029 84            	pop	a
2288  002a 81            	ret
2312                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2312                     ; 548 {
2313                     .text:	section	.text,new
2314  0000               _CLK_ClockSecuritySystemEnable:
2318                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2320  0000 721050c8      	bset	20680,#0
2321                     ; 551 }
2324  0004 81            	ret
2349                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2349                     ; 560 {
2350                     .text:	section	.text,new
2351  0000               _CLK_GetSYSCLKSource:
2355                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2357  0000 c650c3        	ld	a,20675
2360  0003 81            	ret
2417                     ; 569 uint32_t CLK_GetClockFreq(void)
2417                     ; 570 {
2418                     .text:	section	.text,new
2419  0000               _CLK_GetClockFreq:
2421  0000 5209          	subw	sp,#9
2422       00000009      OFST:	set	9
2425                     ; 571   uint32_t clockfrequency = 0;
2427                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2429                     ; 573   uint8_t tmp = 0, presc = 0;
2433                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2435  0002 c650c3        	ld	a,20675
2436  0005 6b09          	ld	(OFST+0,sp),a
2438                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2440  0007 7b09          	ld	a,(OFST+0,sp)
2441  0009 a1e1          	cp	a,#225
2442  000b 2641          	jrne	L1601
2443                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2445  000d c650c6        	ld	a,20678
2446  0010 a418          	and	a,#24
2447  0012 6b09          	ld	(OFST+0,sp),a
2449                     ; 581     tmp = (uint8_t)(tmp >> 3);
2451  0014 0409          	srl	(OFST+0,sp)
2452  0016 0409          	srl	(OFST+0,sp)
2453  0018 0409          	srl	(OFST+0,sp)
2455                     ; 582     presc = HSIDivFactor[tmp];
2457  001a 7b09          	ld	a,(OFST+0,sp)
2458  001c 5f            	clrw	x
2459  001d 97            	ld	xl,a
2460  001e d60000        	ld	a,(_HSIDivFactor,x)
2461  0021 6b09          	ld	(OFST+0,sp),a
2463                     ; 583     clockfrequency = HSI_VALUE / presc;
2465  0023 7b09          	ld	a,(OFST+0,sp)
2466  0025 b703          	ld	c_lreg+3,a
2467  0027 3f02          	clr	c_lreg+2
2468  0029 3f01          	clr	c_lreg+1
2469  002b 3f00          	clr	c_lreg
2470  002d 96            	ldw	x,sp
2471  002e 1c0001        	addw	x,#OFST-8
2472  0031 cd0000        	call	c_rtol
2475  0034 ae2400        	ldw	x,#9216
2476  0037 bf02          	ldw	c_lreg+2,x
2477  0039 ae00f4        	ldw	x,#244
2478  003c bf00          	ldw	c_lreg,x
2479  003e 96            	ldw	x,sp
2480  003f 1c0001        	addw	x,#OFST-8
2481  0042 cd0000        	call	c_ludv
2483  0045 96            	ldw	x,sp
2484  0046 1c0005        	addw	x,#OFST-4
2485  0049 cd0000        	call	c_rtol
2489  004c 201c          	jra	L3601
2490  004e               L1601:
2491                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2493  004e 7b09          	ld	a,(OFST+0,sp)
2494  0050 a1d2          	cp	a,#210
2495  0052 260c          	jrne	L5601
2496                     ; 587     clockfrequency = LSI_VALUE;
2498  0054 aef400        	ldw	x,#62464
2499  0057 1f07          	ldw	(OFST-2,sp),x
2500  0059 ae0001        	ldw	x,#1
2501  005c 1f05          	ldw	(OFST-4,sp),x
2504  005e 200a          	jra	L3601
2505  0060               L5601:
2506                     ; 591     clockfrequency = HSE_VALUE;
2508  0060 ae2400        	ldw	x,#9216
2509  0063 1f07          	ldw	(OFST-2,sp),x
2510  0065 ae00f4        	ldw	x,#244
2511  0068 1f05          	ldw	(OFST-4,sp),x
2513  006a               L3601:
2514                     ; 594   return((uint32_t)clockfrequency);
2516  006a 96            	ldw	x,sp
2517  006b 1c0005        	addw	x,#OFST-4
2518  006e cd0000        	call	c_ltor
2522  0071 5b09          	addw	sp,#9
2523  0073 81            	ret
2623                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2623                     ; 605 {
2624                     .text:	section	.text,new
2625  0000               _CLK_AdjustHSICalibrationValue:
2627  0000 88            	push	a
2628       00000000      OFST:	set	0
2631                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2633  0001 4d            	tnz	a
2634  0002 271c          	jreq	L652
2635  0004 a101          	cp	a,#1
2636  0006 2718          	jreq	L652
2637  0008 a102          	cp	a,#2
2638  000a 2714          	jreq	L652
2639  000c a103          	cp	a,#3
2640  000e 2710          	jreq	L652
2641  0010 a104          	cp	a,#4
2642  0012 270c          	jreq	L652
2643  0014 a105          	cp	a,#5
2644  0016 2708          	jreq	L652
2645  0018 a106          	cp	a,#6
2646  001a 2704          	jreq	L652
2647  001c a107          	cp	a,#7
2648  001e 2603          	jrne	L452
2649  0020               L652:
2650  0020 4f            	clr	a
2651  0021 2010          	jra	L062
2652  0023               L452:
2653  0023 ae025f        	ldw	x,#607
2654  0026 89            	pushw	x
2655  0027 ae0000        	ldw	x,#0
2656  002a 89            	pushw	x
2657  002b ae000c        	ldw	x,#L75
2658  002e cd0000        	call	_assert_failed
2660  0031 5b04          	addw	sp,#4
2661  0033               L062:
2662                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2664  0033 c650cc        	ld	a,20684
2665  0036 a4f8          	and	a,#248
2666  0038 1a01          	or	a,(OFST+1,sp)
2667  003a c750cc        	ld	20684,a
2668                     ; 611 }
2671  003d 84            	pop	a
2672  003e 81            	ret
2696                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2696                     ; 623 {
2697                     .text:	section	.text,new
2698  0000               _CLK_SYSCLKEmergencyClear:
2702                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2704  0000 721150c5      	bres	20677,#0
2705                     ; 625 }
2708  0004 81            	ret
2858                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2858                     ; 635 {
2859                     .text:	section	.text,new
2860  0000               _CLK_GetFlagStatus:
2862  0000 89            	pushw	x
2863  0001 5203          	subw	sp,#3
2864       00000003      OFST:	set	3
2867                     ; 636   uint16_t statusreg = 0;
2869                     ; 637   uint8_t tmpreg = 0;
2871                     ; 638   FlagStatus bitstatus = RESET;
2873                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2875  0003 a30110        	cpw	x,#272
2876  0006 2728          	jreq	L072
2877  0008 a30102        	cpw	x,#258
2878  000b 2723          	jreq	L072
2879  000d a30202        	cpw	x,#514
2880  0010 271e          	jreq	L072
2881  0012 a30308        	cpw	x,#776
2882  0015 2719          	jreq	L072
2883  0017 a30301        	cpw	x,#769
2884  001a 2714          	jreq	L072
2885  001c a30408        	cpw	x,#1032
2886  001f 270f          	jreq	L072
2887  0021 a30402        	cpw	x,#1026
2888  0024 270a          	jreq	L072
2889  0026 a30504        	cpw	x,#1284
2890  0029 2705          	jreq	L072
2891  002b a30502        	cpw	x,#1282
2892  002e 2603          	jrne	L662
2893  0030               L072:
2894  0030 4f            	clr	a
2895  0031 2010          	jra	L272
2896  0033               L662:
2897  0033 ae0281        	ldw	x,#641
2898  0036 89            	pushw	x
2899  0037 ae0000        	ldw	x,#0
2900  003a 89            	pushw	x
2901  003b ae000c        	ldw	x,#L75
2902  003e cd0000        	call	_assert_failed
2904  0041 5b04          	addw	sp,#4
2905  0043               L272:
2906                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2908  0043 7b04          	ld	a,(OFST+1,sp)
2909  0045 97            	ld	xl,a
2910  0046 7b05          	ld	a,(OFST+2,sp)
2911  0048 9f            	ld	a,xl
2912  0049 a4ff          	and	a,#255
2913  004b 97            	ld	xl,a
2914  004c 4f            	clr	a
2915  004d 02            	rlwa	x,a
2916  004e 1f01          	ldw	(OFST-2,sp),x
2917  0050 01            	rrwa	x,a
2919                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2921  0051 1e01          	ldw	x,(OFST-2,sp)
2922  0053 a30100        	cpw	x,#256
2923  0056 2607          	jrne	L7221
2924                     ; 649     tmpreg = CLK->ICKR;
2926  0058 c650c0        	ld	a,20672
2927  005b 6b03          	ld	(OFST+0,sp),a
2930  005d 202f          	jra	L1321
2931  005f               L7221:
2932                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2934  005f 1e01          	ldw	x,(OFST-2,sp)
2935  0061 a30200        	cpw	x,#512
2936  0064 2607          	jrne	L3321
2937                     ; 653     tmpreg = CLK->ECKR;
2939  0066 c650c1        	ld	a,20673
2940  0069 6b03          	ld	(OFST+0,sp),a
2943  006b 2021          	jra	L1321
2944  006d               L3321:
2945                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2947  006d 1e01          	ldw	x,(OFST-2,sp)
2948  006f a30300        	cpw	x,#768
2949  0072 2607          	jrne	L7321
2950                     ; 657     tmpreg = CLK->SWCR;
2952  0074 c650c5        	ld	a,20677
2953  0077 6b03          	ld	(OFST+0,sp),a
2956  0079 2013          	jra	L1321
2957  007b               L7321:
2958                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2960  007b 1e01          	ldw	x,(OFST-2,sp)
2961  007d a30400        	cpw	x,#1024
2962  0080 2607          	jrne	L3421
2963                     ; 661     tmpreg = CLK->CSSR;
2965  0082 c650c8        	ld	a,20680
2966  0085 6b03          	ld	(OFST+0,sp),a
2969  0087 2005          	jra	L1321
2970  0089               L3421:
2971                     ; 665     tmpreg = CLK->CCOR;
2973  0089 c650c9        	ld	a,20681
2974  008c 6b03          	ld	(OFST+0,sp),a
2976  008e               L1321:
2977                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2979  008e 7b05          	ld	a,(OFST+2,sp)
2980  0090 1503          	bcp	a,(OFST+0,sp)
2981  0092 2706          	jreq	L7421
2982                     ; 670     bitstatus = SET;
2984  0094 a601          	ld	a,#1
2985  0096 6b03          	ld	(OFST+0,sp),a
2988  0098 2002          	jra	L1521
2989  009a               L7421:
2990                     ; 674     bitstatus = RESET;
2992  009a 0f03          	clr	(OFST+0,sp)
2994  009c               L1521:
2995                     ; 678   return((FlagStatus)bitstatus);
2997  009c 7b03          	ld	a,(OFST+0,sp)
3000  009e 5b05          	addw	sp,#5
3001  00a0 81            	ret
3048                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3048                     ; 688 {
3049                     .text:	section	.text,new
3050  0000               _CLK_GetITStatus:
3052  0000 88            	push	a
3053  0001 88            	push	a
3054       00000001      OFST:	set	1
3057                     ; 689   ITStatus bitstatus = RESET;
3059                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
3061  0002 a10c          	cp	a,#12
3062  0004 2704          	jreq	L003
3063  0006 a11c          	cp	a,#28
3064  0008 2603          	jrne	L672
3065  000a               L003:
3066  000a 4f            	clr	a
3067  000b 2010          	jra	L203
3068  000d               L672:
3069  000d ae02b4        	ldw	x,#692
3070  0010 89            	pushw	x
3071  0011 ae0000        	ldw	x,#0
3072  0014 89            	pushw	x
3073  0015 ae000c        	ldw	x,#L75
3074  0018 cd0000        	call	_assert_failed
3076  001b 5b04          	addw	sp,#4
3077  001d               L203:
3078                     ; 694   if (CLK_IT == CLK_IT_SWIF)
3080  001d 7b02          	ld	a,(OFST+1,sp)
3081  001f a11c          	cp	a,#28
3082  0021 2613          	jrne	L5721
3083                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3085  0023 c650c5        	ld	a,20677
3086  0026 1402          	and	a,(OFST+1,sp)
3087  0028 a10c          	cp	a,#12
3088  002a 2606          	jrne	L7721
3089                     ; 699       bitstatus = SET;
3091  002c a601          	ld	a,#1
3092  002e 6b01          	ld	(OFST+0,sp),a
3095  0030 2015          	jra	L3031
3096  0032               L7721:
3097                     ; 703       bitstatus = RESET;
3099  0032 0f01          	clr	(OFST+0,sp)
3101  0034 2011          	jra	L3031
3102  0036               L5721:
3103                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3105  0036 c650c8        	ld	a,20680
3106  0039 1402          	and	a,(OFST+1,sp)
3107  003b a10c          	cp	a,#12
3108  003d 2606          	jrne	L5031
3109                     ; 711       bitstatus = SET;
3111  003f a601          	ld	a,#1
3112  0041 6b01          	ld	(OFST+0,sp),a
3115  0043 2002          	jra	L3031
3116  0045               L5031:
3117                     ; 715       bitstatus = RESET;
3119  0045 0f01          	clr	(OFST+0,sp)
3121  0047               L3031:
3122                     ; 720   return bitstatus;
3124  0047 7b01          	ld	a,(OFST+0,sp)
3127  0049 85            	popw	x
3128  004a 81            	ret
3165                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3165                     ; 730 {
3166                     .text:	section	.text,new
3167  0000               _CLK_ClearITPendingBit:
3169  0000 88            	push	a
3170       00000000      OFST:	set	0
3173                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
3175  0001 a10c          	cp	a,#12
3176  0003 2704          	jreq	L013
3177  0005 a11c          	cp	a,#28
3178  0007 2603          	jrne	L603
3179  0009               L013:
3180  0009 4f            	clr	a
3181  000a 2010          	jra	L213
3182  000c               L603:
3183  000c ae02dc        	ldw	x,#732
3184  000f 89            	pushw	x
3185  0010 ae0000        	ldw	x,#0
3186  0013 89            	pushw	x
3187  0014 ae000c        	ldw	x,#L75
3188  0017 cd0000        	call	_assert_failed
3190  001a 5b04          	addw	sp,#4
3191  001c               L213:
3192                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3194  001c 7b01          	ld	a,(OFST+1,sp)
3195  001e a10c          	cp	a,#12
3196  0020 2606          	jrne	L7231
3197                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3199  0022 721750c8      	bres	20680,#3
3201  0026 2004          	jra	L1331
3202  0028               L7231:
3203                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3205  0028 721750c5      	bres	20677,#3
3206  002c               L1331:
3207                     ; 745 }
3210  002c 84            	pop	a
3211  002d 81            	ret
3246                     	xdef	_CLKPrescTable
3247                     	xdef	_HSIDivFactor
3248                     	xdef	_CLK_ClearITPendingBit
3249                     	xdef	_CLK_GetITStatus
3250                     	xdef	_CLK_GetFlagStatus
3251                     	xdef	_CLK_GetSYSCLKSource
3252                     	xdef	_CLK_GetClockFreq
3253                     	xdef	_CLK_AdjustHSICalibrationValue
3254                     	xdef	_CLK_SYSCLKEmergencyClear
3255                     	xdef	_CLK_ClockSecuritySystemEnable
3256                     	xdef	_CLK_SWIMConfig
3257                     	xdef	_CLK_SYSCLKConfig
3258                     	xdef	_CLK_ITConfig
3259                     	xdef	_CLK_CCOConfig
3260                     	xdef	_CLK_HSIPrescalerConfig
3261                     	xdef	_CLK_ClockSwitchConfig
3262                     	xdef	_CLK_PeripheralClockConfig
3263                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3264                     	xdef	_CLK_FastHaltWakeUpCmd
3265                     	xdef	_CLK_ClockSwitchCmd
3266                     	xdef	_CLK_CCOCmd
3267                     	xdef	_CLK_LSICmd
3268                     	xdef	_CLK_HSICmd
3269                     	xdef	_CLK_HSECmd
3270                     	xdef	_CLK_DeInit
3271                     	xref	_assert_failed
3272                     	switch	.const
3273  000c               L75:
3274  000c 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
3275  001e 636c6b2e6300  	dc.b	"clk.c",0
3276                     	xref.b	c_lreg
3277                     	xref.b	c_x
3297                     	xref	c_ltor
3298                     	xref	c_ludv
3299                     	xref	c_rtol
3300                     	end
