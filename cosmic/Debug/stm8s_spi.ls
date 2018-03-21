   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 50 void SPI_DeInit(void)
  45                     ; 51 {
  47                     .text:	section	.text,new
  48  0000               _SPI_DeInit:
  52                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  54  0000 725f5200      	clr	20992
  55                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  57  0004 725f5201      	clr	20993
  58                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  60  0008 725f5202      	clr	20994
  61                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  63  000c 35025203      	mov	20995,#2
  64                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  66  0010 35075205      	mov	20997,#7
  67                     ; 57 }
  70  0014 81            	ret
 385                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 385                     ; 79 {
 386                     .text:	section	.text,new
 387  0000               _SPI_Init:
 389  0000 89            	pushw	x
 390  0001 88            	push	a
 391       00000001      OFST:	set	1
 394                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 396  0002 9e            	ld	a,xh
 397  0003 4d            	tnz	a
 398  0004 2705          	jreq	L21
 399  0006 9e            	ld	a,xh
 400  0007 a180          	cp	a,#128
 401  0009 2603          	jrne	L01
 402  000b               L21:
 403  000b 4f            	clr	a
 404  000c 2010          	jra	L41
 405  000e               L01:
 406  000e ae0051        	ldw	x,#81
 407  0011 89            	pushw	x
 408  0012 ae0000        	ldw	x,#0
 409  0015 89            	pushw	x
 410  0016 ae0000        	ldw	x,#L102
 411  0019 cd0000        	call	_assert_failed
 413  001c 5b04          	addw	sp,#4
 414  001e               L41:
 415                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 417  001e 0d03          	tnz	(OFST+2,sp)
 418  0020 272a          	jreq	L02
 419  0022 7b03          	ld	a,(OFST+2,sp)
 420  0024 a108          	cp	a,#8
 421  0026 2724          	jreq	L02
 422  0028 7b03          	ld	a,(OFST+2,sp)
 423  002a a110          	cp	a,#16
 424  002c 271e          	jreq	L02
 425  002e 7b03          	ld	a,(OFST+2,sp)
 426  0030 a118          	cp	a,#24
 427  0032 2718          	jreq	L02
 428  0034 7b03          	ld	a,(OFST+2,sp)
 429  0036 a120          	cp	a,#32
 430  0038 2712          	jreq	L02
 431  003a 7b03          	ld	a,(OFST+2,sp)
 432  003c a128          	cp	a,#40
 433  003e 270c          	jreq	L02
 434  0040 7b03          	ld	a,(OFST+2,sp)
 435  0042 a130          	cp	a,#48
 436  0044 2706          	jreq	L02
 437  0046 7b03          	ld	a,(OFST+2,sp)
 438  0048 a138          	cp	a,#56
 439  004a 2603          	jrne	L61
 440  004c               L02:
 441  004c 4f            	clr	a
 442  004d 2010          	jra	L22
 443  004f               L61:
 444  004f ae0052        	ldw	x,#82
 445  0052 89            	pushw	x
 446  0053 ae0000        	ldw	x,#0
 447  0056 89            	pushw	x
 448  0057 ae0000        	ldw	x,#L102
 449  005a cd0000        	call	_assert_failed
 451  005d 5b04          	addw	sp,#4
 452  005f               L22:
 453                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 455  005f 7b06          	ld	a,(OFST+5,sp)
 456  0061 a104          	cp	a,#4
 457  0063 2704          	jreq	L62
 458  0065 0d06          	tnz	(OFST+5,sp)
 459  0067 2603          	jrne	L42
 460  0069               L62:
 461  0069 4f            	clr	a
 462  006a 2010          	jra	L03
 463  006c               L42:
 464  006c ae0053        	ldw	x,#83
 465  006f 89            	pushw	x
 466  0070 ae0000        	ldw	x,#0
 467  0073 89            	pushw	x
 468  0074 ae0000        	ldw	x,#L102
 469  0077 cd0000        	call	_assert_failed
 471  007a 5b04          	addw	sp,#4
 472  007c               L03:
 473                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 475  007c 0d07          	tnz	(OFST+6,sp)
 476  007e 2706          	jreq	L43
 477  0080 7b07          	ld	a,(OFST+6,sp)
 478  0082 a102          	cp	a,#2
 479  0084 2603          	jrne	L23
 480  0086               L43:
 481  0086 4f            	clr	a
 482  0087 2010          	jra	L63
 483  0089               L23:
 484  0089 ae0054        	ldw	x,#84
 485  008c 89            	pushw	x
 486  008d ae0000        	ldw	x,#0
 487  0090 89            	pushw	x
 488  0091 ae0000        	ldw	x,#L102
 489  0094 cd0000        	call	_assert_failed
 491  0097 5b04          	addw	sp,#4
 492  0099               L63:
 493                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 495  0099 0d08          	tnz	(OFST+7,sp)
 496  009b 2706          	jreq	L24
 497  009d 7b08          	ld	a,(OFST+7,sp)
 498  009f a101          	cp	a,#1
 499  00a1 2603          	jrne	L04
 500  00a3               L24:
 501  00a3 4f            	clr	a
 502  00a4 2010          	jra	L44
 503  00a6               L04:
 504  00a6 ae0055        	ldw	x,#85
 505  00a9 89            	pushw	x
 506  00aa ae0000        	ldw	x,#0
 507  00ad 89            	pushw	x
 508  00ae ae0000        	ldw	x,#L102
 509  00b1 cd0000        	call	_assert_failed
 511  00b4 5b04          	addw	sp,#4
 512  00b6               L44:
 513                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 515  00b6 0d09          	tnz	(OFST+8,sp)
 516  00b8 2712          	jreq	L05
 517  00ba 7b09          	ld	a,(OFST+8,sp)
 518  00bc a104          	cp	a,#4
 519  00be 270c          	jreq	L05
 520  00c0 7b09          	ld	a,(OFST+8,sp)
 521  00c2 a180          	cp	a,#128
 522  00c4 2706          	jreq	L05
 523  00c6 7b09          	ld	a,(OFST+8,sp)
 524  00c8 a1c0          	cp	a,#192
 525  00ca 2603          	jrne	L64
 526  00cc               L05:
 527  00cc 4f            	clr	a
 528  00cd 2010          	jra	L25
 529  00cf               L64:
 530  00cf ae0056        	ldw	x,#86
 531  00d2 89            	pushw	x
 532  00d3 ae0000        	ldw	x,#0
 533  00d6 89            	pushw	x
 534  00d7 ae0000        	ldw	x,#L102
 535  00da cd0000        	call	_assert_failed
 537  00dd 5b04          	addw	sp,#4
 538  00df               L25:
 539                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 541  00df 7b0a          	ld	a,(OFST+9,sp)
 542  00e1 a102          	cp	a,#2
 543  00e3 2704          	jreq	L65
 544  00e5 0d0a          	tnz	(OFST+9,sp)
 545  00e7 2603          	jrne	L45
 546  00e9               L65:
 547  00e9 4f            	clr	a
 548  00ea 2010          	jra	L06
 549  00ec               L45:
 550  00ec ae0057        	ldw	x,#87
 551  00ef 89            	pushw	x
 552  00f0 ae0000        	ldw	x,#0
 553  00f3 89            	pushw	x
 554  00f4 ae0000        	ldw	x,#L102
 555  00f7 cd0000        	call	_assert_failed
 557  00fa 5b04          	addw	sp,#4
 558  00fc               L06:
 559                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 561  00fc 0d0b          	tnz	(OFST+10,sp)
 562  00fe 2703          	jreq	L26
 563  0100 4f            	clr	a
 564  0101 2010          	jra	L46
 565  0103               L26:
 566  0103 ae0058        	ldw	x,#88
 567  0106 89            	pushw	x
 568  0107 ae0000        	ldw	x,#0
 569  010a 89            	pushw	x
 570  010b ae0000        	ldw	x,#L102
 571  010e cd0000        	call	_assert_failed
 573  0111 5b04          	addw	sp,#4
 574  0113               L46:
 575                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 575                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 577  0113 7b07          	ld	a,(OFST+6,sp)
 578  0115 1a08          	or	a,(OFST+7,sp)
 579  0117 6b01          	ld	(OFST+0,sp),a
 581  0119 7b02          	ld	a,(OFST+1,sp)
 582  011b 1a03          	or	a,(OFST+2,sp)
 583  011d 1a01          	or	a,(OFST+0,sp)
 584  011f c75200        	ld	20992,a
 585                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 587  0122 7b09          	ld	a,(OFST+8,sp)
 588  0124 1a0a          	or	a,(OFST+9,sp)
 589  0126 c75201        	ld	20993,a
 590                     ; 97   if (Mode == SPI_MODE_MASTER)
 592  0129 7b06          	ld	a,(OFST+5,sp)
 593  012b a104          	cp	a,#4
 594  012d 2606          	jrne	L302
 595                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 597  012f 72105201      	bset	20993,#0
 599  0133 2004          	jra	L502
 600  0135               L302:
 601                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 603  0135 72115201      	bres	20993,#0
 604  0139               L502:
 605                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 607  0139 c65200        	ld	a,20992
 608  013c 1a06          	or	a,(OFST+5,sp)
 609  013e c75200        	ld	20992,a
 610                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 612  0141 7b0b          	ld	a,(OFST+10,sp)
 613  0143 c75205        	ld	20997,a
 614                     ; 111 }
 617  0146 5b03          	addw	sp,#3
 618  0148 81            	ret
 674                     ; 119 void SPI_Cmd(FunctionalState NewState)
 674                     ; 120 {
 675                     .text:	section	.text,new
 676  0000               _SPI_Cmd:
 678  0000 88            	push	a
 679       00000000      OFST:	set	0
 682                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 684  0001 4d            	tnz	a
 685  0002 2704          	jreq	L27
 686  0004 a101          	cp	a,#1
 687  0006 2603          	jrne	L07
 688  0008               L27:
 689  0008 4f            	clr	a
 690  0009 2010          	jra	L47
 691  000b               L07:
 692  000b ae007a        	ldw	x,#122
 693  000e 89            	pushw	x
 694  000f ae0000        	ldw	x,#0
 695  0012 89            	pushw	x
 696  0013 ae0000        	ldw	x,#L102
 697  0016 cd0000        	call	_assert_failed
 699  0019 5b04          	addw	sp,#4
 700  001b               L47:
 701                     ; 124   if (NewState != DISABLE)
 703  001b 0d01          	tnz	(OFST+1,sp)
 704  001d 2706          	jreq	L532
 705                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 707  001f 721c5200      	bset	20992,#6
 709  0023 2004          	jra	L732
 710  0025               L532:
 711                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 713  0025 721d5200      	bres	20992,#6
 714  0029               L732:
 715                     ; 132 }
 718  0029 84            	pop	a
 719  002a 81            	ret
 827                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 827                     ; 142 {
 828                     .text:	section	.text,new
 829  0000               _SPI_ITConfig:
 831  0000 89            	pushw	x
 832  0001 88            	push	a
 833       00000001      OFST:	set	1
 836                     ; 143   uint8_t itpos = 0;
 838                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 840  0002 9e            	ld	a,xh
 841  0003 a117          	cp	a,#23
 842  0005 270f          	jreq	L201
 843  0007 9e            	ld	a,xh
 844  0008 a106          	cp	a,#6
 845  000a 270a          	jreq	L201
 846  000c 9e            	ld	a,xh
 847  000d a105          	cp	a,#5
 848  000f 2705          	jreq	L201
 849  0011 9e            	ld	a,xh
 850  0012 a134          	cp	a,#52
 851  0014 2603          	jrne	L001
 852  0016               L201:
 853  0016 4f            	clr	a
 854  0017 2010          	jra	L401
 855  0019               L001:
 856  0019 ae0091        	ldw	x,#145
 857  001c 89            	pushw	x
 858  001d ae0000        	ldw	x,#0
 859  0020 89            	pushw	x
 860  0021 ae0000        	ldw	x,#L102
 861  0024 cd0000        	call	_assert_failed
 863  0027 5b04          	addw	sp,#4
 864  0029               L401:
 865                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 867  0029 0d03          	tnz	(OFST+2,sp)
 868  002b 2706          	jreq	L011
 869  002d 7b03          	ld	a,(OFST+2,sp)
 870  002f a101          	cp	a,#1
 871  0031 2603          	jrne	L601
 872  0033               L011:
 873  0033 4f            	clr	a
 874  0034 2010          	jra	L211
 875  0036               L601:
 876  0036 ae0092        	ldw	x,#146
 877  0039 89            	pushw	x
 878  003a ae0000        	ldw	x,#0
 879  003d 89            	pushw	x
 880  003e ae0000        	ldw	x,#L102
 881  0041 cd0000        	call	_assert_failed
 883  0044 5b04          	addw	sp,#4
 884  0046               L211:
 885                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 887  0046 7b02          	ld	a,(OFST+1,sp)
 888  0048 a40f          	and	a,#15
 889  004a 5f            	clrw	x
 890  004b 97            	ld	xl,a
 891  004c a601          	ld	a,#1
 892  004e 5d            	tnzw	x
 893  004f 2704          	jreq	L411
 894  0051               L611:
 895  0051 48            	sll	a
 896  0052 5a            	decw	x
 897  0053 26fc          	jrne	L611
 898  0055               L411:
 899  0055 6b01          	ld	(OFST+0,sp),a
 901                     ; 151   if (NewState != DISABLE)
 903  0057 0d03          	tnz	(OFST+2,sp)
 904  0059 270a          	jreq	L703
 905                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 907  005b c65202        	ld	a,20994
 908  005e 1a01          	or	a,(OFST+0,sp)
 909  0060 c75202        	ld	20994,a
 911  0063 2009          	jra	L113
 912  0065               L703:
 913                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 915  0065 7b01          	ld	a,(OFST+0,sp)
 916  0067 43            	cpl	a
 917  0068 c45202        	and	a,20994
 918  006b c75202        	ld	20994,a
 919  006e               L113:
 920                     ; 159 }
 923  006e 5b03          	addw	sp,#3
 924  0070 81            	ret
 956                     ; 166 void SPI_SendData(uint8_t Data)
 956                     ; 167 {
 957                     .text:	section	.text,new
 958  0000               _SPI_SendData:
 962                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 964  0000 c75204        	ld	20996,a
 965                     ; 169 }
 968  0003 81            	ret
 991                     ; 176 uint8_t SPI_ReceiveData(void)
 991                     ; 177 {
 992                     .text:	section	.text,new
 993  0000               _SPI_ReceiveData:
 997                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 999  0000 c65204        	ld	a,20996
1002  0003 81            	ret
1039                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
1039                     ; 188 {
1040                     .text:	section	.text,new
1041  0000               _SPI_NSSInternalSoftwareCmd:
1043  0000 88            	push	a
1044       00000000      OFST:	set	0
1047                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1049  0001 4d            	tnz	a
1050  0002 2704          	jreq	L031
1051  0004 a101          	cp	a,#1
1052  0006 2603          	jrne	L621
1053  0008               L031:
1054  0008 4f            	clr	a
1055  0009 2010          	jra	L231
1056  000b               L621:
1057  000b ae00be        	ldw	x,#190
1058  000e 89            	pushw	x
1059  000f ae0000        	ldw	x,#0
1060  0012 89            	pushw	x
1061  0013 ae0000        	ldw	x,#L102
1062  0016 cd0000        	call	_assert_failed
1064  0019 5b04          	addw	sp,#4
1065  001b               L231:
1066                     ; 192   if (NewState != DISABLE)
1068  001b 0d01          	tnz	(OFST+1,sp)
1069  001d 2706          	jreq	L553
1070                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1072  001f 72105201      	bset	20993,#0
1074  0023 2004          	jra	L753
1075  0025               L553:
1076                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1078  0025 72115201      	bres	20993,#0
1079  0029               L753:
1080                     ; 200 }
1083  0029 84            	pop	a
1084  002a 81            	ret
1107                     ; 207 void SPI_TransmitCRC(void)
1107                     ; 208 {
1108                     .text:	section	.text,new
1109  0000               _SPI_TransmitCRC:
1113                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1115  0000 72185201      	bset	20993,#4
1116                     ; 210 }
1119  0004 81            	ret
1156                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
1156                     ; 219 {
1157                     .text:	section	.text,new
1158  0000               _SPI_CalculateCRCCmd:
1160  0000 88            	push	a
1161       00000000      OFST:	set	0
1164                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1166  0001 4d            	tnz	a
1167  0002 2704          	jreq	L241
1168  0004 a101          	cp	a,#1
1169  0006 2603          	jrne	L041
1170  0008               L241:
1171  0008 4f            	clr	a
1172  0009 2010          	jra	L441
1173  000b               L041:
1174  000b ae00dd        	ldw	x,#221
1175  000e 89            	pushw	x
1176  000f ae0000        	ldw	x,#0
1177  0012 89            	pushw	x
1178  0013 ae0000        	ldw	x,#L102
1179  0016 cd0000        	call	_assert_failed
1181  0019 5b04          	addw	sp,#4
1182  001b               L441:
1183                     ; 223   if (NewState != DISABLE)
1185  001b 0d01          	tnz	(OFST+1,sp)
1186  001d 2706          	jreq	L704
1187                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1189  001f 721a5201      	bset	20993,#5
1191  0023 2004          	jra	L114
1192  0025               L704:
1193                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1195  0025 721b5201      	bres	20993,#5
1196  0029               L114:
1197                     ; 231 }
1200  0029 84            	pop	a
1201  002a 81            	ret
1264                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1264                     ; 239 {
1265                     .text:	section	.text,new
1266  0000               _SPI_GetCRC:
1268  0000 88            	push	a
1269  0001 88            	push	a
1270       00000001      OFST:	set	1
1273                     ; 240   uint8_t crcreg = 0;
1275                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1277  0002 a101          	cp	a,#1
1278  0004 2703          	jreq	L251
1279  0006 4d            	tnz	a
1280  0007 2603          	jrne	L051
1281  0009               L251:
1282  0009 4f            	clr	a
1283  000a 2010          	jra	L451
1284  000c               L051:
1285  000c ae00f3        	ldw	x,#243
1286  000f 89            	pushw	x
1287  0010 ae0000        	ldw	x,#0
1288  0013 89            	pushw	x
1289  0014 ae0000        	ldw	x,#L102
1290  0017 cd0000        	call	_assert_failed
1292  001a 5b04          	addw	sp,#4
1293  001c               L451:
1294                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1296  001c 0d02          	tnz	(OFST+1,sp)
1297  001e 2707          	jreq	L344
1298                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1300  0020 c65207        	ld	a,20999
1301  0023 6b01          	ld	(OFST+0,sp),a
1304  0025 2005          	jra	L544
1305  0027               L344:
1306                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1308  0027 c65206        	ld	a,20998
1309  002a 6b01          	ld	(OFST+0,sp),a
1311  002c               L544:
1312                     ; 255   return crcreg;
1314  002c 7b01          	ld	a,(OFST+0,sp)
1317  002e 85            	popw	x
1318  002f 81            	ret
1343                     ; 263 void SPI_ResetCRC(void)
1343                     ; 264 {
1344                     .text:	section	.text,new
1345  0000               _SPI_ResetCRC:
1349                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1351  0000 a601          	ld	a,#1
1352  0002 cd0000        	call	_SPI_CalculateCRCCmd
1354                     ; 270   SPI_Cmd(ENABLE);
1356  0005 a601          	ld	a,#1
1357  0007 cd0000        	call	_SPI_Cmd
1359                     ; 271 }
1362  000a 81            	ret
1386                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1386                     ; 279 {
1387                     .text:	section	.text,new
1388  0000               _SPI_GetCRCPolynomial:
1392                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1394  0000 c65205        	ld	a,20997
1397  0003 81            	ret
1454                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1454                     ; 289 {
1455                     .text:	section	.text,new
1456  0000               _SPI_BiDirectionalLineConfig:
1458  0000 88            	push	a
1459       00000000      OFST:	set	0
1462                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1464  0001 4d            	tnz	a
1465  0002 2704          	jreq	L661
1466  0004 a101          	cp	a,#1
1467  0006 2603          	jrne	L461
1468  0008               L661:
1469  0008 4f            	clr	a
1470  0009 2010          	jra	L071
1471  000b               L461:
1472  000b ae0123        	ldw	x,#291
1473  000e 89            	pushw	x
1474  000f ae0000        	ldw	x,#0
1475  0012 89            	pushw	x
1476  0013 ae0000        	ldw	x,#L102
1477  0016 cd0000        	call	_assert_failed
1479  0019 5b04          	addw	sp,#4
1480  001b               L071:
1481                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1483  001b 0d01          	tnz	(OFST+1,sp)
1484  001d 2706          	jreq	L515
1485                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1487  001f 721c5201      	bset	20993,#6
1489  0023 2004          	jra	L715
1490  0025               L515:
1491                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1493  0025 721d5201      	bres	20993,#6
1494  0029               L715:
1495                     ; 301 }
1498  0029 84            	pop	a
1499  002a 81            	ret
1621                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1621                     ; 312 {
1622                     .text:	section	.text,new
1623  0000               _SPI_GetFlagStatus:
1625  0000 88            	push	a
1626  0001 88            	push	a
1627       00000001      OFST:	set	1
1630                     ; 313   FlagStatus status = RESET;
1632                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1634  0002 a140          	cp	a,#64
1635  0004 2718          	jreq	L671
1636  0006 a120          	cp	a,#32
1637  0008 2714          	jreq	L671
1638  000a a110          	cp	a,#16
1639  000c 2710          	jreq	L671
1640  000e a108          	cp	a,#8
1641  0010 270c          	jreq	L671
1642  0012 a102          	cp	a,#2
1643  0014 2708          	jreq	L671
1644  0016 a101          	cp	a,#1
1645  0018 2704          	jreq	L671
1646  001a a180          	cp	a,#128
1647  001c 2603          	jrne	L471
1648  001e               L671:
1649  001e 4f            	clr	a
1650  001f 2010          	jra	L002
1651  0021               L471:
1652  0021 ae013b        	ldw	x,#315
1653  0024 89            	pushw	x
1654  0025 ae0000        	ldw	x,#0
1655  0028 89            	pushw	x
1656  0029 ae0000        	ldw	x,#L102
1657  002c cd0000        	call	_assert_failed
1659  002f 5b04          	addw	sp,#4
1660  0031               L002:
1661                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1663  0031 c65203        	ld	a,20995
1664  0034 1502          	bcp	a,(OFST+1,sp)
1665  0036 2706          	jreq	L575
1666                     ; 320     status = SET; /* SPI_FLAG is set */
1668  0038 a601          	ld	a,#1
1669  003a 6b01          	ld	(OFST+0,sp),a
1672  003c 2002          	jra	L775
1673  003e               L575:
1674                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1676  003e 0f01          	clr	(OFST+0,sp)
1678  0040               L775:
1679                     ; 328   return status;
1681  0040 7b01          	ld	a,(OFST+0,sp)
1684  0042 85            	popw	x
1685  0043 81            	ret
1721                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1721                     ; 347 {
1722                     .text:	section	.text,new
1723  0000               _SPI_ClearFlag:
1725  0000 88            	push	a
1726       00000000      OFST:	set	0
1729                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1731  0001 a110          	cp	a,#16
1732  0003 2704          	jreq	L602
1733  0005 a108          	cp	a,#8
1734  0007 2603          	jrne	L402
1735  0009               L602:
1736  0009 4f            	clr	a
1737  000a 2010          	jra	L012
1738  000c               L402:
1739  000c ae015c        	ldw	x,#348
1740  000f 89            	pushw	x
1741  0010 ae0000        	ldw	x,#0
1742  0013 89            	pushw	x
1743  0014 ae0000        	ldw	x,#L102
1744  0017 cd0000        	call	_assert_failed
1746  001a 5b04          	addw	sp,#4
1747  001c               L012:
1748                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1750  001c 7b01          	ld	a,(OFST+1,sp)
1751  001e 43            	cpl	a
1752  001f c75203        	ld	20995,a
1753                     ; 351 }
1756  0022 84            	pop	a
1757  0023 81            	ret
1832                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1832                     ; 367 {
1833                     .text:	section	.text,new
1834  0000               _SPI_GetITStatus:
1836  0000 88            	push	a
1837  0001 89            	pushw	x
1838       00000002      OFST:	set	2
1841                     ; 368   ITStatus pendingbitstatus = RESET;
1843                     ; 369   uint8_t itpos = 0;
1845                     ; 370   uint8_t itmask1 = 0;
1847                     ; 371   uint8_t itmask2 = 0;
1849                     ; 372   uint8_t enablestatus = 0;
1851                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1853  0002 a165          	cp	a,#101
1854  0004 2714          	jreq	L612
1855  0006 a155          	cp	a,#85
1856  0008 2710          	jreq	L612
1857  000a a145          	cp	a,#69
1858  000c 270c          	jreq	L612
1859  000e a134          	cp	a,#52
1860  0010 2708          	jreq	L612
1861  0012 a117          	cp	a,#23
1862  0014 2704          	jreq	L612
1863  0016 a106          	cp	a,#6
1864  0018 2603          	jrne	L412
1865  001a               L612:
1866  001a 4f            	clr	a
1867  001b 2010          	jra	L022
1868  001d               L412:
1869  001d ae0175        	ldw	x,#373
1870  0020 89            	pushw	x
1871  0021 ae0000        	ldw	x,#0
1872  0024 89            	pushw	x
1873  0025 ae0000        	ldw	x,#L102
1874  0028 cd0000        	call	_assert_failed
1876  002b 5b04          	addw	sp,#4
1877  002d               L022:
1878                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1880  002d 7b03          	ld	a,(OFST+1,sp)
1881  002f a40f          	and	a,#15
1882  0031 5f            	clrw	x
1883  0032 97            	ld	xl,a
1884  0033 a601          	ld	a,#1
1885  0035 5d            	tnzw	x
1886  0036 2704          	jreq	L222
1887  0038               L422:
1888  0038 48            	sll	a
1889  0039 5a            	decw	x
1890  003a 26fc          	jrne	L422
1891  003c               L222:
1892  003c 6b01          	ld	(OFST-1,sp),a
1894                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1896  003e 7b03          	ld	a,(OFST+1,sp)
1897  0040 4e            	swap	a
1898  0041 a40f          	and	a,#15
1899  0043 6b02          	ld	(OFST+0,sp),a
1901                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1903  0045 7b02          	ld	a,(OFST+0,sp)
1904  0047 5f            	clrw	x
1905  0048 97            	ld	xl,a
1906  0049 a601          	ld	a,#1
1907  004b 5d            	tnzw	x
1908  004c 2704          	jreq	L622
1909  004e               L032:
1910  004e 48            	sll	a
1911  004f 5a            	decw	x
1912  0050 26fc          	jrne	L032
1913  0052               L622:
1914  0052 6b02          	ld	(OFST+0,sp),a
1916                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1918  0054 c65203        	ld	a,20995
1919  0057 1402          	and	a,(OFST+0,sp)
1920  0059 6b02          	ld	(OFST+0,sp),a
1922                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1924  005b c65202        	ld	a,20994
1925  005e 1501          	bcp	a,(OFST-1,sp)
1926  0060 270a          	jreq	L156
1928  0062 0d02          	tnz	(OFST+0,sp)
1929  0064 2706          	jreq	L156
1930                     ; 387     pendingbitstatus = SET;
1932  0066 a601          	ld	a,#1
1933  0068 6b02          	ld	(OFST+0,sp),a
1936  006a 2002          	jra	L356
1937  006c               L156:
1938                     ; 392     pendingbitstatus = RESET;
1940  006c 0f02          	clr	(OFST+0,sp)
1942  006e               L356:
1943                     ; 395   return  pendingbitstatus;
1945  006e 7b02          	ld	a,(OFST+0,sp)
1948  0070 5b03          	addw	sp,#3
1949  0072 81            	ret
1993                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1993                     ; 413 {
1994                     .text:	section	.text,new
1995  0000               _SPI_ClearITPendingBit:
1997  0000 88            	push	a
1998  0001 88            	push	a
1999       00000001      OFST:	set	1
2002                     ; 414   uint8_t itpos = 0;
2004                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
2006  0002 a145          	cp	a,#69
2007  0004 2704          	jreq	L632
2008  0006 a134          	cp	a,#52
2009  0008 2603          	jrne	L432
2010  000a               L632:
2011  000a 4f            	clr	a
2012  000b 2010          	jra	L042
2013  000d               L432:
2014  000d ae019f        	ldw	x,#415
2015  0010 89            	pushw	x
2016  0011 ae0000        	ldw	x,#0
2017  0014 89            	pushw	x
2018  0015 ae0000        	ldw	x,#L102
2019  0018 cd0000        	call	_assert_failed
2021  001b 5b04          	addw	sp,#4
2022  001d               L042:
2023                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2025  001d 7b02          	ld	a,(OFST+1,sp)
2026  001f a4f0          	and	a,#240
2027  0021 4e            	swap	a
2028  0022 a40f          	and	a,#15
2029  0024 5f            	clrw	x
2030  0025 97            	ld	xl,a
2031  0026 a601          	ld	a,#1
2032  0028 5d            	tnzw	x
2033  0029 2704          	jreq	L242
2034  002b               L442:
2035  002b 48            	sll	a
2036  002c 5a            	decw	x
2037  002d 26fc          	jrne	L442
2038  002f               L242:
2039  002f 6b01          	ld	(OFST+0,sp),a
2041                     ; 422   SPI->SR = (uint8_t)(~itpos);
2043  0031 7b01          	ld	a,(OFST+0,sp)
2044  0033 43            	cpl	a
2045  0034 c75203        	ld	20995,a
2046                     ; 424 }
2049  0037 85            	popw	x
2050  0038 81            	ret
2063                     	xdef	_SPI_ClearITPendingBit
2064                     	xdef	_SPI_GetITStatus
2065                     	xdef	_SPI_ClearFlag
2066                     	xdef	_SPI_GetFlagStatus
2067                     	xdef	_SPI_BiDirectionalLineConfig
2068                     	xdef	_SPI_GetCRCPolynomial
2069                     	xdef	_SPI_ResetCRC
2070                     	xdef	_SPI_GetCRC
2071                     	xdef	_SPI_CalculateCRCCmd
2072                     	xdef	_SPI_TransmitCRC
2073                     	xdef	_SPI_NSSInternalSoftwareCmd
2074                     	xdef	_SPI_ReceiveData
2075                     	xdef	_SPI_SendData
2076                     	xdef	_SPI_ITConfig
2077                     	xdef	_SPI_Cmd
2078                     	xdef	_SPI_Init
2079                     	xdef	_SPI_DeInit
2080                     	xref	_assert_failed
2081                     .const:	section	.text
2082  0000               L102:
2083  0000 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
2084  0012 7370692e6300  	dc.b	"spi.c",0
2104                     	end
