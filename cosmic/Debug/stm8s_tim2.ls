   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 52 void TIM2_DeInit(void)
  45                     ; 53 {
  47                     .text:	section	.text,new
  48  0000               _TIM2_DeInit:
  52                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  54  0000 725f5300      	clr	21248
  55                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  57  0004 725f5303      	clr	21251
  58                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  60  0008 725f5305      	clr	21253
  61                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  63  000c 725f530a      	clr	21258
  64                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  66  0010 725f530b      	clr	21259
  67                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  69  0014 725f530a      	clr	21258
  70                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  72  0018 725f530b      	clr	21259
  73                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  75  001c 725f5307      	clr	21255
  76                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  78  0020 725f5308      	clr	21256
  79                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  81  0024 725f5309      	clr	21257
  82                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  84  0028 725f530c      	clr	21260
  85                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  87  002c 725f530d      	clr	21261
  88                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  90  0030 725f530e      	clr	21262
  91                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  93  0034 35ff530f      	mov	21263,#255
  94                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  96  0038 35ff5310      	mov	21264,#255
  97                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  99  003c 725f5311      	clr	21265
 100                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 102  0040 725f5312      	clr	21266
 103                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 105  0044 725f5313      	clr	21267
 106                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 108  0048 725f5314      	clr	21268
 109                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 111  004c 725f5315      	clr	21269
 112                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 114  0050 725f5316      	clr	21270
 115                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 117  0054 725f5304      	clr	21252
 118                     ; 81 }
 121  0058 81            	ret
 287                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 287                     ; 90                         uint16_t TIM2_Period)
 287                     ; 91 {
 288                     .text:	section	.text,new
 289  0000               _TIM2_TimeBaseInit:
 291  0000 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 297  0001 c7530e        	ld	21262,a
 298                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 300  0004 7b04          	ld	a,(OFST+4,sp)
 301  0006 c7530f        	ld	21263,a
 302                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 304  0009 7b05          	ld	a,(OFST+5,sp)
 305  000b c75310        	ld	21264,a
 306                     ; 97 }
 309  000e 84            	pop	a
 310  000f 81            	ret
 466                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 466                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 466                     ; 110                   uint16_t TIM2_Pulse,
 466                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 466                     ; 112 {
 467                     .text:	section	.text,new
 468  0000               _TIM2_OC1Init:
 470  0000 89            	pushw	x
 471  0001 88            	push	a
 472       00000001      OFST:	set	1
 475                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 477  0002 9e            	ld	a,xh
 478  0003 4d            	tnz	a
 479  0004 2719          	jreq	L41
 480  0006 9e            	ld	a,xh
 481  0007 a110          	cp	a,#16
 482  0009 2714          	jreq	L41
 483  000b 9e            	ld	a,xh
 484  000c a120          	cp	a,#32
 485  000e 270f          	jreq	L41
 486  0010 9e            	ld	a,xh
 487  0011 a130          	cp	a,#48
 488  0013 270a          	jreq	L41
 489  0015 9e            	ld	a,xh
 490  0016 a160          	cp	a,#96
 491  0018 2705          	jreq	L41
 492  001a 9e            	ld	a,xh
 493  001b a170          	cp	a,#112
 494  001d 2603          	jrne	L21
 495  001f               L41:
 496  001f 4f            	clr	a
 497  0020 2010          	jra	L61
 498  0022               L21:
 499  0022 ae0072        	ldw	x,#114
 500  0025 89            	pushw	x
 501  0026 ae0000        	ldw	x,#0
 502  0029 89            	pushw	x
 503  002a ae0000        	ldw	x,#L302
 504  002d cd0000        	call	_assert_failed
 506  0030 5b04          	addw	sp,#4
 507  0032               L61:
 508                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 510  0032 0d03          	tnz	(OFST+2,sp)
 511  0034 2706          	jreq	L22
 512  0036 7b03          	ld	a,(OFST+2,sp)
 513  0038 a111          	cp	a,#17
 514  003a 2603          	jrne	L02
 515  003c               L22:
 516  003c 4f            	clr	a
 517  003d 2010          	jra	L42
 518  003f               L02:
 519  003f ae0073        	ldw	x,#115
 520  0042 89            	pushw	x
 521  0043 ae0000        	ldw	x,#0
 522  0046 89            	pushw	x
 523  0047 ae0000        	ldw	x,#L302
 524  004a cd0000        	call	_assert_failed
 526  004d 5b04          	addw	sp,#4
 527  004f               L42:
 528                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 530  004f 0d08          	tnz	(OFST+7,sp)
 531  0051 2706          	jreq	L03
 532  0053 7b08          	ld	a,(OFST+7,sp)
 533  0055 a122          	cp	a,#34
 534  0057 2603          	jrne	L62
 535  0059               L03:
 536  0059 4f            	clr	a
 537  005a 2010          	jra	L23
 538  005c               L62:
 539  005c ae0074        	ldw	x,#116
 540  005f 89            	pushw	x
 541  0060 ae0000        	ldw	x,#0
 542  0063 89            	pushw	x
 543  0064 ae0000        	ldw	x,#L302
 544  0067 cd0000        	call	_assert_failed
 546  006a 5b04          	addw	sp,#4
 547  006c               L23:
 548                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 550  006c c6530a        	ld	a,21258
 551  006f a4fc          	and	a,#252
 552  0071 c7530a        	ld	21258,a
 553                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 553                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 555  0074 7b08          	ld	a,(OFST+7,sp)
 556  0076 a402          	and	a,#2
 557  0078 6b01          	ld	(OFST+0,sp),a
 559  007a 7b03          	ld	a,(OFST+2,sp)
 560  007c a401          	and	a,#1
 561  007e 1a01          	or	a,(OFST+0,sp)
 562  0080 ca530a        	or	a,21258
 563  0083 c7530a        	ld	21258,a
 564                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 564                     ; 126                           (uint8_t)TIM2_OCMode);
 566  0086 c65307        	ld	a,21255
 567  0089 a48f          	and	a,#143
 568  008b 1a02          	or	a,(OFST+1,sp)
 569  008d c75307        	ld	21255,a
 570                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 572  0090 7b06          	ld	a,(OFST+5,sp)
 573  0092 c75311        	ld	21265,a
 574                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 576  0095 7b07          	ld	a,(OFST+6,sp)
 577  0097 c75312        	ld	21266,a
 578                     ; 131 }
 581  009a 5b03          	addw	sp,#3
 582  009c 81            	ret
 645                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 645                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 645                     ; 144                   uint16_t TIM2_Pulse,
 645                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 645                     ; 146 {
 646                     .text:	section	.text,new
 647  0000               _TIM2_OC2Init:
 649  0000 89            	pushw	x
 650  0001 88            	push	a
 651       00000001      OFST:	set	1
 654                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 656  0002 9e            	ld	a,xh
 657  0003 4d            	tnz	a
 658  0004 2719          	jreq	L04
 659  0006 9e            	ld	a,xh
 660  0007 a110          	cp	a,#16
 661  0009 2714          	jreq	L04
 662  000b 9e            	ld	a,xh
 663  000c a120          	cp	a,#32
 664  000e 270f          	jreq	L04
 665  0010 9e            	ld	a,xh
 666  0011 a130          	cp	a,#48
 667  0013 270a          	jreq	L04
 668  0015 9e            	ld	a,xh
 669  0016 a160          	cp	a,#96
 670  0018 2705          	jreq	L04
 671  001a 9e            	ld	a,xh
 672  001b a170          	cp	a,#112
 673  001d 2603          	jrne	L63
 674  001f               L04:
 675  001f 4f            	clr	a
 676  0020 2010          	jra	L24
 677  0022               L63:
 678  0022 ae0094        	ldw	x,#148
 679  0025 89            	pushw	x
 680  0026 ae0000        	ldw	x,#0
 681  0029 89            	pushw	x
 682  002a ae0000        	ldw	x,#L302
 683  002d cd0000        	call	_assert_failed
 685  0030 5b04          	addw	sp,#4
 686  0032               L24:
 687                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 689  0032 0d03          	tnz	(OFST+2,sp)
 690  0034 2706          	jreq	L64
 691  0036 7b03          	ld	a,(OFST+2,sp)
 692  0038 a111          	cp	a,#17
 693  003a 2603          	jrne	L44
 694  003c               L64:
 695  003c 4f            	clr	a
 696  003d 2010          	jra	L05
 697  003f               L44:
 698  003f ae0095        	ldw	x,#149
 699  0042 89            	pushw	x
 700  0043 ae0000        	ldw	x,#0
 701  0046 89            	pushw	x
 702  0047 ae0000        	ldw	x,#L302
 703  004a cd0000        	call	_assert_failed
 705  004d 5b04          	addw	sp,#4
 706  004f               L05:
 707                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 709  004f 0d08          	tnz	(OFST+7,sp)
 710  0051 2706          	jreq	L45
 711  0053 7b08          	ld	a,(OFST+7,sp)
 712  0055 a122          	cp	a,#34
 713  0057 2603          	jrne	L25
 714  0059               L45:
 715  0059 4f            	clr	a
 716  005a 2010          	jra	L65
 717  005c               L25:
 718  005c ae0096        	ldw	x,#150
 719  005f 89            	pushw	x
 720  0060 ae0000        	ldw	x,#0
 721  0063 89            	pushw	x
 722  0064 ae0000        	ldw	x,#L302
 723  0067 cd0000        	call	_assert_failed
 725  006a 5b04          	addw	sp,#4
 726  006c               L65:
 727                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 729  006c c6530a        	ld	a,21258
 730  006f a4cf          	and	a,#207
 731  0071 c7530a        	ld	21258,a
 732                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 732                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 734  0074 7b08          	ld	a,(OFST+7,sp)
 735  0076 a420          	and	a,#32
 736  0078 6b01          	ld	(OFST+0,sp),a
 738  007a 7b03          	ld	a,(OFST+2,sp)
 739  007c a410          	and	a,#16
 740  007e 1a01          	or	a,(OFST+0,sp)
 741  0080 ca530a        	or	a,21258
 742  0083 c7530a        	ld	21258,a
 743                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 743                     ; 162                           (uint8_t)TIM2_OCMode);
 745  0086 c65308        	ld	a,21256
 746  0089 a48f          	and	a,#143
 747  008b 1a02          	or	a,(OFST+1,sp)
 748  008d c75308        	ld	21256,a
 749                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 751  0090 7b06          	ld	a,(OFST+5,sp)
 752  0092 c75313        	ld	21267,a
 753                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 755  0095 7b07          	ld	a,(OFST+6,sp)
 756  0097 c75314        	ld	21268,a
 757                     ; 168 }
 760  009a 5b03          	addw	sp,#3
 761  009c 81            	ret
 824                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 824                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 824                     ; 181                   uint16_t TIM2_Pulse,
 824                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 824                     ; 183 {
 825                     .text:	section	.text,new
 826  0000               _TIM2_OC3Init:
 828  0000 89            	pushw	x
 829  0001 88            	push	a
 830       00000001      OFST:	set	1
 833                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 835  0002 9e            	ld	a,xh
 836  0003 4d            	tnz	a
 837  0004 2719          	jreq	L46
 838  0006 9e            	ld	a,xh
 839  0007 a110          	cp	a,#16
 840  0009 2714          	jreq	L46
 841  000b 9e            	ld	a,xh
 842  000c a120          	cp	a,#32
 843  000e 270f          	jreq	L46
 844  0010 9e            	ld	a,xh
 845  0011 a130          	cp	a,#48
 846  0013 270a          	jreq	L46
 847  0015 9e            	ld	a,xh
 848  0016 a160          	cp	a,#96
 849  0018 2705          	jreq	L46
 850  001a 9e            	ld	a,xh
 851  001b a170          	cp	a,#112
 852  001d 2603          	jrne	L26
 853  001f               L46:
 854  001f 4f            	clr	a
 855  0020 2010          	jra	L66
 856  0022               L26:
 857  0022 ae00b9        	ldw	x,#185
 858  0025 89            	pushw	x
 859  0026 ae0000        	ldw	x,#0
 860  0029 89            	pushw	x
 861  002a ae0000        	ldw	x,#L302
 862  002d cd0000        	call	_assert_failed
 864  0030 5b04          	addw	sp,#4
 865  0032               L66:
 866                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 868  0032 0d03          	tnz	(OFST+2,sp)
 869  0034 2706          	jreq	L27
 870  0036 7b03          	ld	a,(OFST+2,sp)
 871  0038 a111          	cp	a,#17
 872  003a 2603          	jrne	L07
 873  003c               L27:
 874  003c 4f            	clr	a
 875  003d 2010          	jra	L47
 876  003f               L07:
 877  003f ae00ba        	ldw	x,#186
 878  0042 89            	pushw	x
 879  0043 ae0000        	ldw	x,#0
 880  0046 89            	pushw	x
 881  0047 ae0000        	ldw	x,#L302
 882  004a cd0000        	call	_assert_failed
 884  004d 5b04          	addw	sp,#4
 885  004f               L47:
 886                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 888  004f 0d08          	tnz	(OFST+7,sp)
 889  0051 2706          	jreq	L001
 890  0053 7b08          	ld	a,(OFST+7,sp)
 891  0055 a122          	cp	a,#34
 892  0057 2603          	jrne	L67
 893  0059               L001:
 894  0059 4f            	clr	a
 895  005a 2010          	jra	L201
 896  005c               L67:
 897  005c ae00bb        	ldw	x,#187
 898  005f 89            	pushw	x
 899  0060 ae0000        	ldw	x,#0
 900  0063 89            	pushw	x
 901  0064 ae0000        	ldw	x,#L302
 902  0067 cd0000        	call	_assert_failed
 904  006a 5b04          	addw	sp,#4
 905  006c               L201:
 906                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 908  006c c6530b        	ld	a,21259
 909  006f a4fc          	and	a,#252
 910  0071 c7530b        	ld	21259,a
 911                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 911                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 913  0074 7b08          	ld	a,(OFST+7,sp)
 914  0076 a402          	and	a,#2
 915  0078 6b01          	ld	(OFST+0,sp),a
 917  007a 7b03          	ld	a,(OFST+2,sp)
 918  007c a401          	and	a,#1
 919  007e 1a01          	or	a,(OFST+0,sp)
 920  0080 ca530b        	or	a,21259
 921  0083 c7530b        	ld	21259,a
 922                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 922                     ; 196                           (uint8_t)TIM2_OCMode);
 924  0086 c65309        	ld	a,21257
 925  0089 a48f          	and	a,#143
 926  008b 1a02          	or	a,(OFST+1,sp)
 927  008d c75309        	ld	21257,a
 928                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 930  0090 7b06          	ld	a,(OFST+5,sp)
 931  0092 c75315        	ld	21269,a
 932                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 934  0095 7b07          	ld	a,(OFST+6,sp)
 935  0097 c75316        	ld	21270,a
 936                     ; 201 }
 939  009a 5b03          	addw	sp,#3
 940  009c 81            	ret
1132                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1132                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1132                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1132                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1132                     ; 216                  uint8_t TIM2_ICFilter)
1132                     ; 217 {
1133                     .text:	section	.text,new
1134  0000               _TIM2_ICInit:
1136  0000 89            	pushw	x
1137       00000000      OFST:	set	0
1140                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1142  0001 9e            	ld	a,xh
1143  0002 4d            	tnz	a
1144  0003 270a          	jreq	L011
1145  0005 9e            	ld	a,xh
1146  0006 a101          	cp	a,#1
1147  0008 2705          	jreq	L011
1148  000a 9e            	ld	a,xh
1149  000b a102          	cp	a,#2
1150  000d 2603          	jrne	L601
1151  000f               L011:
1152  000f 4f            	clr	a
1153  0010 2010          	jra	L211
1154  0012               L601:
1155  0012 ae00db        	ldw	x,#219
1156  0015 89            	pushw	x
1157  0016 ae0000        	ldw	x,#0
1158  0019 89            	pushw	x
1159  001a ae0000        	ldw	x,#L302
1160  001d cd0000        	call	_assert_failed
1162  0020 5b04          	addw	sp,#4
1163  0022               L211:
1164                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1166  0022 0d02          	tnz	(OFST+2,sp)
1167  0024 2706          	jreq	L611
1168  0026 7b02          	ld	a,(OFST+2,sp)
1169  0028 a144          	cp	a,#68
1170  002a 2603          	jrne	L411
1171  002c               L611:
1172  002c 4f            	clr	a
1173  002d 2010          	jra	L021
1174  002f               L411:
1175  002f ae00dc        	ldw	x,#220
1176  0032 89            	pushw	x
1177  0033 ae0000        	ldw	x,#0
1178  0036 89            	pushw	x
1179  0037 ae0000        	ldw	x,#L302
1180  003a cd0000        	call	_assert_failed
1182  003d 5b04          	addw	sp,#4
1183  003f               L021:
1184                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1186  003f 7b05          	ld	a,(OFST+5,sp)
1187  0041 a101          	cp	a,#1
1188  0043 270c          	jreq	L421
1189  0045 7b05          	ld	a,(OFST+5,sp)
1190  0047 a102          	cp	a,#2
1191  0049 2706          	jreq	L421
1192  004b 7b05          	ld	a,(OFST+5,sp)
1193  004d a103          	cp	a,#3
1194  004f 2603          	jrne	L221
1195  0051               L421:
1196  0051 4f            	clr	a
1197  0052 2010          	jra	L621
1198  0054               L221:
1199  0054 ae00dd        	ldw	x,#221
1200  0057 89            	pushw	x
1201  0058 ae0000        	ldw	x,#0
1202  005b 89            	pushw	x
1203  005c ae0000        	ldw	x,#L302
1204  005f cd0000        	call	_assert_failed
1206  0062 5b04          	addw	sp,#4
1207  0064               L621:
1208                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1210  0064 0d06          	tnz	(OFST+6,sp)
1211  0066 2712          	jreq	L231
1212  0068 7b06          	ld	a,(OFST+6,sp)
1213  006a a104          	cp	a,#4
1214  006c 270c          	jreq	L231
1215  006e 7b06          	ld	a,(OFST+6,sp)
1216  0070 a108          	cp	a,#8
1217  0072 2706          	jreq	L231
1218  0074 7b06          	ld	a,(OFST+6,sp)
1219  0076 a10c          	cp	a,#12
1220  0078 2603          	jrne	L031
1221  007a               L231:
1222  007a 4f            	clr	a
1223  007b 2010          	jra	L431
1224  007d               L031:
1225  007d ae00de        	ldw	x,#222
1226  0080 89            	pushw	x
1227  0081 ae0000        	ldw	x,#0
1228  0084 89            	pushw	x
1229  0085 ae0000        	ldw	x,#L302
1230  0088 cd0000        	call	_assert_failed
1232  008b 5b04          	addw	sp,#4
1233  008d               L431:
1234                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1236  008d 7b07          	ld	a,(OFST+7,sp)
1237  008f a110          	cp	a,#16
1238  0091 2403          	jruge	L631
1239  0093 4f            	clr	a
1240  0094 2010          	jra	L041
1241  0096               L631:
1242  0096 ae00df        	ldw	x,#223
1243  0099 89            	pushw	x
1244  009a ae0000        	ldw	x,#0
1245  009d 89            	pushw	x
1246  009e ae0000        	ldw	x,#L302
1247  00a1 cd0000        	call	_assert_failed
1249  00a4 5b04          	addw	sp,#4
1250  00a6               L041:
1251                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1253  00a6 0d01          	tnz	(OFST+1,sp)
1254  00a8 2614          	jrne	L173
1255                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1255                     ; 229                (uint8_t)TIM2_ICSelection,
1255                     ; 230                (uint8_t)TIM2_ICFilter);
1257  00aa 7b07          	ld	a,(OFST+7,sp)
1258  00ac 88            	push	a
1259  00ad 7b06          	ld	a,(OFST+6,sp)
1260  00af 97            	ld	xl,a
1261  00b0 7b03          	ld	a,(OFST+3,sp)
1262  00b2 95            	ld	xh,a
1263  00b3 cd0000        	call	L3_TI1_Config
1265  00b6 84            	pop	a
1266                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1268  00b7 7b06          	ld	a,(OFST+6,sp)
1269  00b9 cd0000        	call	_TIM2_SetIC1Prescaler
1272  00bc 202c          	jra	L373
1273  00be               L173:
1274                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1276  00be 7b01          	ld	a,(OFST+1,sp)
1277  00c0 a101          	cp	a,#1
1278  00c2 2614          	jrne	L573
1279                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1279                     ; 239                (uint8_t)TIM2_ICSelection,
1279                     ; 240                (uint8_t)TIM2_ICFilter);
1281  00c4 7b07          	ld	a,(OFST+7,sp)
1282  00c6 88            	push	a
1283  00c7 7b06          	ld	a,(OFST+6,sp)
1284  00c9 97            	ld	xl,a
1285  00ca 7b03          	ld	a,(OFST+3,sp)
1286  00cc 95            	ld	xh,a
1287  00cd cd0000        	call	L5_TI2_Config
1289  00d0 84            	pop	a
1290                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1292  00d1 7b06          	ld	a,(OFST+6,sp)
1293  00d3 cd0000        	call	_TIM2_SetIC2Prescaler
1296  00d6 2012          	jra	L373
1297  00d8               L573:
1298                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1298                     ; 249                (uint8_t)TIM2_ICSelection,
1298                     ; 250                (uint8_t)TIM2_ICFilter);
1300  00d8 7b07          	ld	a,(OFST+7,sp)
1301  00da 88            	push	a
1302  00db 7b06          	ld	a,(OFST+6,sp)
1303  00dd 97            	ld	xl,a
1304  00de 7b03          	ld	a,(OFST+3,sp)
1305  00e0 95            	ld	xh,a
1306  00e1 cd0000        	call	L7_TI3_Config
1308  00e4 84            	pop	a
1309                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1311  00e5 7b06          	ld	a,(OFST+6,sp)
1312  00e7 cd0000        	call	_TIM2_SetIC3Prescaler
1314  00ea               L373:
1315                     ; 255 }
1318  00ea 85            	popw	x
1319  00eb 81            	ret
1410                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1410                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1410                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1410                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1410                     ; 270                      uint8_t TIM2_ICFilter)
1410                     ; 271 {
1411                     .text:	section	.text,new
1412  0000               _TIM2_PWMIConfig:
1414  0000 89            	pushw	x
1415  0001 89            	pushw	x
1416       00000002      OFST:	set	2
1419                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1421                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1423                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1425  0002 9e            	ld	a,xh
1426  0003 4d            	tnz	a
1427  0004 2705          	jreq	L641
1428  0006 9e            	ld	a,xh
1429  0007 a101          	cp	a,#1
1430  0009 2603          	jrne	L441
1431  000b               L641:
1432  000b 4f            	clr	a
1433  000c 2010          	jra	L051
1434  000e               L441:
1435  000e ae0114        	ldw	x,#276
1436  0011 89            	pushw	x
1437  0012 ae0000        	ldw	x,#0
1438  0015 89            	pushw	x
1439  0016 ae0000        	ldw	x,#L302
1440  0019 cd0000        	call	_assert_failed
1442  001c 5b04          	addw	sp,#4
1443  001e               L051:
1444                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1446  001e 0d04          	tnz	(OFST+2,sp)
1447  0020 2706          	jreq	L451
1448  0022 7b04          	ld	a,(OFST+2,sp)
1449  0024 a144          	cp	a,#68
1450  0026 2603          	jrne	L251
1451  0028               L451:
1452  0028 4f            	clr	a
1453  0029 2010          	jra	L651
1454  002b               L251:
1455  002b ae0115        	ldw	x,#277
1456  002e 89            	pushw	x
1457  002f ae0000        	ldw	x,#0
1458  0032 89            	pushw	x
1459  0033 ae0000        	ldw	x,#L302
1460  0036 cd0000        	call	_assert_failed
1462  0039 5b04          	addw	sp,#4
1463  003b               L651:
1464                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1466  003b 7b07          	ld	a,(OFST+5,sp)
1467  003d a101          	cp	a,#1
1468  003f 270c          	jreq	L261
1469  0041 7b07          	ld	a,(OFST+5,sp)
1470  0043 a102          	cp	a,#2
1471  0045 2706          	jreq	L261
1472  0047 7b07          	ld	a,(OFST+5,sp)
1473  0049 a103          	cp	a,#3
1474  004b 2603          	jrne	L061
1475  004d               L261:
1476  004d 4f            	clr	a
1477  004e 2010          	jra	L461
1478  0050               L061:
1479  0050 ae0116        	ldw	x,#278
1480  0053 89            	pushw	x
1481  0054 ae0000        	ldw	x,#0
1482  0057 89            	pushw	x
1483  0058 ae0000        	ldw	x,#L302
1484  005b cd0000        	call	_assert_failed
1486  005e 5b04          	addw	sp,#4
1487  0060               L461:
1488                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1490  0060 0d08          	tnz	(OFST+6,sp)
1491  0062 2712          	jreq	L071
1492  0064 7b08          	ld	a,(OFST+6,sp)
1493  0066 a104          	cp	a,#4
1494  0068 270c          	jreq	L071
1495  006a 7b08          	ld	a,(OFST+6,sp)
1496  006c a108          	cp	a,#8
1497  006e 2706          	jreq	L071
1498  0070 7b08          	ld	a,(OFST+6,sp)
1499  0072 a10c          	cp	a,#12
1500  0074 2603          	jrne	L661
1501  0076               L071:
1502  0076 4f            	clr	a
1503  0077 2010          	jra	L271
1504  0079               L661:
1505  0079 ae0117        	ldw	x,#279
1506  007c 89            	pushw	x
1507  007d ae0000        	ldw	x,#0
1508  0080 89            	pushw	x
1509  0081 ae0000        	ldw	x,#L302
1510  0084 cd0000        	call	_assert_failed
1512  0087 5b04          	addw	sp,#4
1513  0089               L271:
1514                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1516  0089 7b04          	ld	a,(OFST+2,sp)
1517  008b a144          	cp	a,#68
1518  008d 2706          	jreq	L144
1519                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1521  008f a644          	ld	a,#68
1522  0091 6b01          	ld	(OFST-1,sp),a
1525  0093 2002          	jra	L344
1526  0095               L144:
1527                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1529  0095 0f01          	clr	(OFST-1,sp)
1531  0097               L344:
1532                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1534  0097 7b07          	ld	a,(OFST+5,sp)
1535  0099 a101          	cp	a,#1
1536  009b 2606          	jrne	L544
1537                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1539  009d a602          	ld	a,#2
1540  009f 6b02          	ld	(OFST+0,sp),a
1543  00a1 2004          	jra	L744
1544  00a3               L544:
1545                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1547  00a3 a601          	ld	a,#1
1548  00a5 6b02          	ld	(OFST+0,sp),a
1550  00a7               L744:
1551                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1553  00a7 0d03          	tnz	(OFST+1,sp)
1554  00a9 2626          	jrne	L154
1555                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1555                     ; 305                (uint8_t)TIM2_ICFilter);
1557  00ab 7b09          	ld	a,(OFST+7,sp)
1558  00ad 88            	push	a
1559  00ae 7b08          	ld	a,(OFST+6,sp)
1560  00b0 97            	ld	xl,a
1561  00b1 7b05          	ld	a,(OFST+3,sp)
1562  00b3 95            	ld	xh,a
1563  00b4 cd0000        	call	L3_TI1_Config
1565  00b7 84            	pop	a
1566                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1568  00b8 7b08          	ld	a,(OFST+6,sp)
1569  00ba cd0000        	call	_TIM2_SetIC1Prescaler
1571                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1573  00bd 7b09          	ld	a,(OFST+7,sp)
1574  00bf 88            	push	a
1575  00c0 7b03          	ld	a,(OFST+1,sp)
1576  00c2 97            	ld	xl,a
1577  00c3 7b02          	ld	a,(OFST+0,sp)
1578  00c5 95            	ld	xh,a
1579  00c6 cd0000        	call	L5_TI2_Config
1581  00c9 84            	pop	a
1582                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1584  00ca 7b08          	ld	a,(OFST+6,sp)
1585  00cc cd0000        	call	_TIM2_SetIC2Prescaler
1588  00cf 2024          	jra	L354
1589  00d1               L154:
1590                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1590                     ; 320                (uint8_t)TIM2_ICFilter);
1592  00d1 7b09          	ld	a,(OFST+7,sp)
1593  00d3 88            	push	a
1594  00d4 7b08          	ld	a,(OFST+6,sp)
1595  00d6 97            	ld	xl,a
1596  00d7 7b05          	ld	a,(OFST+3,sp)
1597  00d9 95            	ld	xh,a
1598  00da cd0000        	call	L5_TI2_Config
1600  00dd 84            	pop	a
1601                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1603  00de 7b08          	ld	a,(OFST+6,sp)
1604  00e0 cd0000        	call	_TIM2_SetIC2Prescaler
1606                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1608  00e3 7b09          	ld	a,(OFST+7,sp)
1609  00e5 88            	push	a
1610  00e6 7b03          	ld	a,(OFST+1,sp)
1611  00e8 97            	ld	xl,a
1612  00e9 7b02          	ld	a,(OFST+0,sp)
1613  00eb 95            	ld	xh,a
1614  00ec cd0000        	call	L3_TI1_Config
1616  00ef 84            	pop	a
1617                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1619  00f0 7b08          	ld	a,(OFST+6,sp)
1620  00f2 cd0000        	call	_TIM2_SetIC1Prescaler
1622  00f5               L354:
1623                     ; 331 }
1626  00f5 5b04          	addw	sp,#4
1627  00f7 81            	ret
1683                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1683                     ; 340 {
1684                     .text:	section	.text,new
1685  0000               _TIM2_Cmd:
1687  0000 88            	push	a
1688       00000000      OFST:	set	0
1691                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1693  0001 4d            	tnz	a
1694  0002 2704          	jreq	L002
1695  0004 a101          	cp	a,#1
1696  0006 2603          	jrne	L671
1697  0008               L002:
1698  0008 4f            	clr	a
1699  0009 2010          	jra	L202
1700  000b               L671:
1701  000b ae0156        	ldw	x,#342
1702  000e 89            	pushw	x
1703  000f ae0000        	ldw	x,#0
1704  0012 89            	pushw	x
1705  0013 ae0000        	ldw	x,#L302
1706  0016 cd0000        	call	_assert_failed
1708  0019 5b04          	addw	sp,#4
1709  001b               L202:
1710                     ; 345   if (NewState != DISABLE)
1712  001b 0d01          	tnz	(OFST+1,sp)
1713  001d 2706          	jreq	L305
1714                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1716  001f 72105300      	bset	21248,#0
1718  0023 2004          	jra	L505
1719  0025               L305:
1720                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1722  0025 72115300      	bres	21248,#0
1723  0029               L505:
1724                     ; 353 }
1727  0029 84            	pop	a
1728  002a 81            	ret
1808                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1808                     ; 369 {
1809                     .text:	section	.text,new
1810  0000               _TIM2_ITConfig:
1812  0000 89            	pushw	x
1813       00000000      OFST:	set	0
1816                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1818  0001 9e            	ld	a,xh
1819  0002 4d            	tnz	a
1820  0003 2708          	jreq	L602
1821  0005 9e            	ld	a,xh
1822  0006 a110          	cp	a,#16
1823  0008 2403          	jruge	L602
1824  000a 4f            	clr	a
1825  000b 2010          	jra	L012
1826  000d               L602:
1827  000d ae0173        	ldw	x,#371
1828  0010 89            	pushw	x
1829  0011 ae0000        	ldw	x,#0
1830  0014 89            	pushw	x
1831  0015 ae0000        	ldw	x,#L302
1832  0018 cd0000        	call	_assert_failed
1834  001b 5b04          	addw	sp,#4
1835  001d               L012:
1836                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1838  001d 0d02          	tnz	(OFST+2,sp)
1839  001f 2706          	jreq	L412
1840  0021 7b02          	ld	a,(OFST+2,sp)
1841  0023 a101          	cp	a,#1
1842  0025 2603          	jrne	L212
1843  0027               L412:
1844  0027 4f            	clr	a
1845  0028 2010          	jra	L612
1846  002a               L212:
1847  002a ae0174        	ldw	x,#372
1848  002d 89            	pushw	x
1849  002e ae0000        	ldw	x,#0
1850  0031 89            	pushw	x
1851  0032 ae0000        	ldw	x,#L302
1852  0035 cd0000        	call	_assert_failed
1854  0038 5b04          	addw	sp,#4
1855  003a               L612:
1856                     ; 374   if (NewState != DISABLE)
1858  003a 0d02          	tnz	(OFST+2,sp)
1859  003c 270a          	jreq	L545
1860                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1862  003e c65303        	ld	a,21251
1863  0041 1a01          	or	a,(OFST+1,sp)
1864  0043 c75303        	ld	21251,a
1866  0046 2009          	jra	L745
1867  0048               L545:
1868                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1870  0048 7b01          	ld	a,(OFST+1,sp)
1871  004a 43            	cpl	a
1872  004b c45303        	and	a,21251
1873  004e c75303        	ld	21251,a
1874  0051               L745:
1875                     ; 384 }
1878  0051 85            	popw	x
1879  0052 81            	ret
1916                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1916                     ; 393 {
1917                     .text:	section	.text,new
1918  0000               _TIM2_UpdateDisableConfig:
1920  0000 88            	push	a
1921       00000000      OFST:	set	0
1924                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1926  0001 4d            	tnz	a
1927  0002 2704          	jreq	L422
1928  0004 a101          	cp	a,#1
1929  0006 2603          	jrne	L222
1930  0008               L422:
1931  0008 4f            	clr	a
1932  0009 2010          	jra	L622
1933  000b               L222:
1934  000b ae018b        	ldw	x,#395
1935  000e 89            	pushw	x
1936  000f ae0000        	ldw	x,#0
1937  0012 89            	pushw	x
1938  0013 ae0000        	ldw	x,#L302
1939  0016 cd0000        	call	_assert_failed
1941  0019 5b04          	addw	sp,#4
1942  001b               L622:
1943                     ; 398   if (NewState != DISABLE)
1945  001b 0d01          	tnz	(OFST+1,sp)
1946  001d 2706          	jreq	L765
1947                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1949  001f 72125300      	bset	21248,#1
1951  0023 2004          	jra	L175
1952  0025               L765:
1953                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1955  0025 72135300      	bres	21248,#1
1956  0029               L175:
1957                     ; 406 }
1960  0029 84            	pop	a
1961  002a 81            	ret
2020                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2020                     ; 417 {
2021                     .text:	section	.text,new
2022  0000               _TIM2_UpdateRequestConfig:
2024  0000 88            	push	a
2025       00000000      OFST:	set	0
2028                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2030  0001 4d            	tnz	a
2031  0002 2704          	jreq	L432
2032  0004 a101          	cp	a,#1
2033  0006 2603          	jrne	L232
2034  0008               L432:
2035  0008 4f            	clr	a
2036  0009 2010          	jra	L632
2037  000b               L232:
2038  000b ae01a3        	ldw	x,#419
2039  000e 89            	pushw	x
2040  000f ae0000        	ldw	x,#0
2041  0012 89            	pushw	x
2042  0013 ae0000        	ldw	x,#L302
2043  0016 cd0000        	call	_assert_failed
2045  0019 5b04          	addw	sp,#4
2046  001b               L632:
2047                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2049  001b 0d01          	tnz	(OFST+1,sp)
2050  001d 2706          	jreq	L126
2051                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2053  001f 72145300      	bset	21248,#2
2055  0023 2004          	jra	L326
2056  0025               L126:
2057                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2059  0025 72155300      	bres	21248,#2
2060  0029               L326:
2061                     ; 430 }
2064  0029 84            	pop	a
2065  002a 81            	ret
2123                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2123                     ; 441 {
2124                     .text:	section	.text,new
2125  0000               _TIM2_SelectOnePulseMode:
2127  0000 88            	push	a
2128       00000000      OFST:	set	0
2131                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2133  0001 a101          	cp	a,#1
2134  0003 2703          	jreq	L442
2135  0005 4d            	tnz	a
2136  0006 2603          	jrne	L242
2137  0008               L442:
2138  0008 4f            	clr	a
2139  0009 2010          	jra	L642
2140  000b               L242:
2141  000b ae01bb        	ldw	x,#443
2142  000e 89            	pushw	x
2143  000f ae0000        	ldw	x,#0
2144  0012 89            	pushw	x
2145  0013 ae0000        	ldw	x,#L302
2146  0016 cd0000        	call	_assert_failed
2148  0019 5b04          	addw	sp,#4
2149  001b               L642:
2150                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2152  001b 0d01          	tnz	(OFST+1,sp)
2153  001d 2706          	jreq	L356
2154                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2156  001f 72165300      	bset	21248,#3
2158  0023 2004          	jra	L556
2159  0025               L356:
2160                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2162  0025 72175300      	bres	21248,#3
2163  0029               L556:
2164                     ; 454 }
2167  0029 84            	pop	a
2168  002a 81            	ret
2237                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2237                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2237                     ; 486 {
2238                     .text:	section	.text,new
2239  0000               _TIM2_PrescalerConfig:
2241  0000 89            	pushw	x
2242       00000000      OFST:	set	0
2245                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2247  0001 9f            	ld	a,xl
2248  0002 4d            	tnz	a
2249  0003 2705          	jreq	L452
2250  0005 9f            	ld	a,xl
2251  0006 a101          	cp	a,#1
2252  0008 2603          	jrne	L252
2253  000a               L452:
2254  000a 4f            	clr	a
2255  000b 2010          	jra	L652
2256  000d               L252:
2257  000d ae01e8        	ldw	x,#488
2258  0010 89            	pushw	x
2259  0011 ae0000        	ldw	x,#0
2260  0014 89            	pushw	x
2261  0015 ae0000        	ldw	x,#L302
2262  0018 cd0000        	call	_assert_failed
2264  001b 5b04          	addw	sp,#4
2265  001d               L652:
2266                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2268  001d 0d01          	tnz	(OFST+1,sp)
2269  001f 275a          	jreq	L262
2270  0021 7b01          	ld	a,(OFST+1,sp)
2271  0023 a101          	cp	a,#1
2272  0025 2754          	jreq	L262
2273  0027 7b01          	ld	a,(OFST+1,sp)
2274  0029 a102          	cp	a,#2
2275  002b 274e          	jreq	L262
2276  002d 7b01          	ld	a,(OFST+1,sp)
2277  002f a103          	cp	a,#3
2278  0031 2748          	jreq	L262
2279  0033 7b01          	ld	a,(OFST+1,sp)
2280  0035 a104          	cp	a,#4
2281  0037 2742          	jreq	L262
2282  0039 7b01          	ld	a,(OFST+1,sp)
2283  003b a105          	cp	a,#5
2284  003d 273c          	jreq	L262
2285  003f 7b01          	ld	a,(OFST+1,sp)
2286  0041 a106          	cp	a,#6
2287  0043 2736          	jreq	L262
2288  0045 7b01          	ld	a,(OFST+1,sp)
2289  0047 a107          	cp	a,#7
2290  0049 2730          	jreq	L262
2291  004b 7b01          	ld	a,(OFST+1,sp)
2292  004d a108          	cp	a,#8
2293  004f 272a          	jreq	L262
2294  0051 7b01          	ld	a,(OFST+1,sp)
2295  0053 a109          	cp	a,#9
2296  0055 2724          	jreq	L262
2297  0057 7b01          	ld	a,(OFST+1,sp)
2298  0059 a10a          	cp	a,#10
2299  005b 271e          	jreq	L262
2300  005d 7b01          	ld	a,(OFST+1,sp)
2301  005f a10b          	cp	a,#11
2302  0061 2718          	jreq	L262
2303  0063 7b01          	ld	a,(OFST+1,sp)
2304  0065 a10c          	cp	a,#12
2305  0067 2712          	jreq	L262
2306  0069 7b01          	ld	a,(OFST+1,sp)
2307  006b a10d          	cp	a,#13
2308  006d 270c          	jreq	L262
2309  006f 7b01          	ld	a,(OFST+1,sp)
2310  0071 a10e          	cp	a,#14
2311  0073 2706          	jreq	L262
2312  0075 7b01          	ld	a,(OFST+1,sp)
2313  0077 a10f          	cp	a,#15
2314  0079 2603          	jrne	L062
2315  007b               L262:
2316  007b 4f            	clr	a
2317  007c 2010          	jra	L462
2318  007e               L062:
2319  007e ae01e9        	ldw	x,#489
2320  0081 89            	pushw	x
2321  0082 ae0000        	ldw	x,#0
2322  0085 89            	pushw	x
2323  0086 ae0000        	ldw	x,#L302
2324  0089 cd0000        	call	_assert_failed
2326  008c 5b04          	addw	sp,#4
2327  008e               L462:
2328                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2330  008e 7b01          	ld	a,(OFST+1,sp)
2331  0090 c7530e        	ld	21262,a
2332                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2334  0093 7b02          	ld	a,(OFST+2,sp)
2335  0095 c75306        	ld	21254,a
2336                     ; 496 }
2339  0098 85            	popw	x
2340  0099 81            	ret
2399                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2399                     ; 508 {
2400                     .text:	section	.text,new
2401  0000               _TIM2_ForcedOC1Config:
2403  0000 88            	push	a
2404       00000000      OFST:	set	0
2407                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2409  0001 a150          	cp	a,#80
2410  0003 2704          	jreq	L272
2411  0005 a140          	cp	a,#64
2412  0007 2603          	jrne	L072
2413  0009               L272:
2414  0009 4f            	clr	a
2415  000a 2010          	jra	L472
2416  000c               L072:
2417  000c ae01fe        	ldw	x,#510
2418  000f 89            	pushw	x
2419  0010 ae0000        	ldw	x,#0
2420  0013 89            	pushw	x
2421  0014 ae0000        	ldw	x,#L302
2422  0017 cd0000        	call	_assert_failed
2424  001a 5b04          	addw	sp,#4
2425  001c               L472:
2426                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2426                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2428  001c c65307        	ld	a,21255
2429  001f a48f          	and	a,#143
2430  0021 1a01          	or	a,(OFST+1,sp)
2431  0023 c75307        	ld	21255,a
2432                     ; 515 }
2435  0026 84            	pop	a
2436  0027 81            	ret
2473                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2473                     ; 527 {
2474                     .text:	section	.text,new
2475  0000               _TIM2_ForcedOC2Config:
2477  0000 88            	push	a
2478       00000000      OFST:	set	0
2481                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2483  0001 a150          	cp	a,#80
2484  0003 2704          	jreq	L203
2485  0005 a140          	cp	a,#64
2486  0007 2603          	jrne	L003
2487  0009               L203:
2488  0009 4f            	clr	a
2489  000a 2010          	jra	L403
2490  000c               L003:
2491  000c ae0211        	ldw	x,#529
2492  000f 89            	pushw	x
2493  0010 ae0000        	ldw	x,#0
2494  0013 89            	pushw	x
2495  0014 ae0000        	ldw	x,#L302
2496  0017 cd0000        	call	_assert_failed
2498  001a 5b04          	addw	sp,#4
2499  001c               L403:
2500                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2500                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2502  001c c65308        	ld	a,21256
2503  001f a48f          	and	a,#143
2504  0021 1a01          	or	a,(OFST+1,sp)
2505  0023 c75308        	ld	21256,a
2506                     ; 534 }
2509  0026 84            	pop	a
2510  0027 81            	ret
2547                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2547                     ; 546 {
2548                     .text:	section	.text,new
2549  0000               _TIM2_ForcedOC3Config:
2551  0000 88            	push	a
2552       00000000      OFST:	set	0
2555                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2557  0001 a150          	cp	a,#80
2558  0003 2704          	jreq	L213
2559  0005 a140          	cp	a,#64
2560  0007 2603          	jrne	L013
2561  0009               L213:
2562  0009 4f            	clr	a
2563  000a 2010          	jra	L413
2564  000c               L013:
2565  000c ae0224        	ldw	x,#548
2566  000f 89            	pushw	x
2567  0010 ae0000        	ldw	x,#0
2568  0013 89            	pushw	x
2569  0014 ae0000        	ldw	x,#L302
2570  0017 cd0000        	call	_assert_failed
2572  001a 5b04          	addw	sp,#4
2573  001c               L413:
2574                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2574                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2576  001c c65309        	ld	a,21257
2577  001f a48f          	and	a,#143
2578  0021 1a01          	or	a,(OFST+1,sp)
2579  0023 c75309        	ld	21257,a
2580                     ; 553 }
2583  0026 84            	pop	a
2584  0027 81            	ret
2621                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2621                     ; 562 {
2622                     .text:	section	.text,new
2623  0000               _TIM2_ARRPreloadConfig:
2625  0000 88            	push	a
2626       00000000      OFST:	set	0
2629                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2631  0001 4d            	tnz	a
2632  0002 2704          	jreq	L223
2633  0004 a101          	cp	a,#1
2634  0006 2603          	jrne	L023
2635  0008               L223:
2636  0008 4f            	clr	a
2637  0009 2010          	jra	L423
2638  000b               L023:
2639  000b ae0234        	ldw	x,#564
2640  000e 89            	pushw	x
2641  000f ae0000        	ldw	x,#0
2642  0012 89            	pushw	x
2643  0013 ae0000        	ldw	x,#L302
2644  0016 cd0000        	call	_assert_failed
2646  0019 5b04          	addw	sp,#4
2647  001b               L423:
2648                     ; 567   if (NewState != DISABLE)
2650  001b 0d01          	tnz	(OFST+1,sp)
2651  001d 2706          	jreq	L1101
2652                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2654  001f 721e5300      	bset	21248,#7
2656  0023 2004          	jra	L3101
2657  0025               L1101:
2658                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2660  0025 721f5300      	bres	21248,#7
2661  0029               L3101:
2662                     ; 575 }
2665  0029 84            	pop	a
2666  002a 81            	ret
2703                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2703                     ; 584 {
2704                     .text:	section	.text,new
2705  0000               _TIM2_OC1PreloadConfig:
2707  0000 88            	push	a
2708       00000000      OFST:	set	0
2711                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2713  0001 4d            	tnz	a
2714  0002 2704          	jreq	L233
2715  0004 a101          	cp	a,#1
2716  0006 2603          	jrne	L033
2717  0008               L233:
2718  0008 4f            	clr	a
2719  0009 2010          	jra	L433
2720  000b               L033:
2721  000b ae024a        	ldw	x,#586
2722  000e 89            	pushw	x
2723  000f ae0000        	ldw	x,#0
2724  0012 89            	pushw	x
2725  0013 ae0000        	ldw	x,#L302
2726  0016 cd0000        	call	_assert_failed
2728  0019 5b04          	addw	sp,#4
2729  001b               L433:
2730                     ; 589   if (NewState != DISABLE)
2732  001b 0d01          	tnz	(OFST+1,sp)
2733  001d 2706          	jreq	L3301
2734                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2736  001f 72165307      	bset	21255,#3
2738  0023 2004          	jra	L5301
2739  0025               L3301:
2740                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2742  0025 72175307      	bres	21255,#3
2743  0029               L5301:
2744                     ; 597 }
2747  0029 84            	pop	a
2748  002a 81            	ret
2785                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2785                     ; 606 {
2786                     .text:	section	.text,new
2787  0000               _TIM2_OC2PreloadConfig:
2789  0000 88            	push	a
2790       00000000      OFST:	set	0
2793                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2795  0001 4d            	tnz	a
2796  0002 2704          	jreq	L243
2797  0004 a101          	cp	a,#1
2798  0006 2603          	jrne	L043
2799  0008               L243:
2800  0008 4f            	clr	a
2801  0009 2010          	jra	L443
2802  000b               L043:
2803  000b ae0260        	ldw	x,#608
2804  000e 89            	pushw	x
2805  000f ae0000        	ldw	x,#0
2806  0012 89            	pushw	x
2807  0013 ae0000        	ldw	x,#L302
2808  0016 cd0000        	call	_assert_failed
2810  0019 5b04          	addw	sp,#4
2811  001b               L443:
2812                     ; 611   if (NewState != DISABLE)
2814  001b 0d01          	tnz	(OFST+1,sp)
2815  001d 2706          	jreq	L5501
2816                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2818  001f 72165308      	bset	21256,#3
2820  0023 2004          	jra	L7501
2821  0025               L5501:
2822                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2824  0025 72175308      	bres	21256,#3
2825  0029               L7501:
2826                     ; 619 }
2829  0029 84            	pop	a
2830  002a 81            	ret
2867                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2867                     ; 628 {
2868                     .text:	section	.text,new
2869  0000               _TIM2_OC3PreloadConfig:
2871  0000 88            	push	a
2872       00000000      OFST:	set	0
2875                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2877  0001 4d            	tnz	a
2878  0002 2704          	jreq	L253
2879  0004 a101          	cp	a,#1
2880  0006 2603          	jrne	L053
2881  0008               L253:
2882  0008 4f            	clr	a
2883  0009 2010          	jra	L453
2884  000b               L053:
2885  000b ae0276        	ldw	x,#630
2886  000e 89            	pushw	x
2887  000f ae0000        	ldw	x,#0
2888  0012 89            	pushw	x
2889  0013 ae0000        	ldw	x,#L302
2890  0016 cd0000        	call	_assert_failed
2892  0019 5b04          	addw	sp,#4
2893  001b               L453:
2894                     ; 633   if (NewState != DISABLE)
2896  001b 0d01          	tnz	(OFST+1,sp)
2897  001d 2706          	jreq	L7701
2898                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2900  001f 72165309      	bset	21257,#3
2902  0023 2004          	jra	L1011
2903  0025               L7701:
2904                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2906  0025 72175309      	bres	21257,#3
2907  0029               L1011:
2908                     ; 641 }
2911  0029 84            	pop	a
2912  002a 81            	ret
2986                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2986                     ; 654 {
2987                     .text:	section	.text,new
2988  0000               _TIM2_GenerateEvent:
2990  0000 88            	push	a
2991       00000000      OFST:	set	0
2994                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2996  0001 4d            	tnz	a
2997  0002 2703          	jreq	L063
2998  0004 4f            	clr	a
2999  0005 2010          	jra	L263
3000  0007               L063:
3001  0007 ae0290        	ldw	x,#656
3002  000a 89            	pushw	x
3003  000b ae0000        	ldw	x,#0
3004  000e 89            	pushw	x
3005  000f ae0000        	ldw	x,#L302
3006  0012 cd0000        	call	_assert_failed
3008  0015 5b04          	addw	sp,#4
3009  0017               L263:
3010                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
3012  0017 7b01          	ld	a,(OFST+1,sp)
3013  0019 c75306        	ld	21254,a
3014                     ; 660 }
3017  001c 84            	pop	a
3018  001d 81            	ret
3055                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3055                     ; 671 {
3056                     .text:	section	.text,new
3057  0000               _TIM2_OC1PolarityConfig:
3059  0000 88            	push	a
3060       00000000      OFST:	set	0
3063                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3065  0001 4d            	tnz	a
3066  0002 2704          	jreq	L073
3067  0004 a122          	cp	a,#34
3068  0006 2603          	jrne	L663
3069  0008               L073:
3070  0008 4f            	clr	a
3071  0009 2010          	jra	L273
3072  000b               L663:
3073  000b ae02a1        	ldw	x,#673
3074  000e 89            	pushw	x
3075  000f ae0000        	ldw	x,#0
3076  0012 89            	pushw	x
3077  0013 ae0000        	ldw	x,#L302
3078  0016 cd0000        	call	_assert_failed
3080  0019 5b04          	addw	sp,#4
3081  001b               L273:
3082                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3084  001b 0d01          	tnz	(OFST+1,sp)
3085  001d 2706          	jreq	L3511
3086                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3088  001f 7212530a      	bset	21258,#1
3090  0023 2004          	jra	L5511
3091  0025               L3511:
3092                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3094  0025 7213530a      	bres	21258,#1
3095  0029               L5511:
3096                     ; 684 }
3099  0029 84            	pop	a
3100  002a 81            	ret
3137                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3137                     ; 695 {
3138                     .text:	section	.text,new
3139  0000               _TIM2_OC2PolarityConfig:
3141  0000 88            	push	a
3142       00000000      OFST:	set	0
3145                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3147  0001 4d            	tnz	a
3148  0002 2704          	jreq	L004
3149  0004 a122          	cp	a,#34
3150  0006 2603          	jrne	L673
3151  0008               L004:
3152  0008 4f            	clr	a
3153  0009 2010          	jra	L204
3154  000b               L673:
3155  000b ae02b9        	ldw	x,#697
3156  000e 89            	pushw	x
3157  000f ae0000        	ldw	x,#0
3158  0012 89            	pushw	x
3159  0013 ae0000        	ldw	x,#L302
3160  0016 cd0000        	call	_assert_failed
3162  0019 5b04          	addw	sp,#4
3163  001b               L204:
3164                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3166  001b 0d01          	tnz	(OFST+1,sp)
3167  001d 2706          	jreq	L5711
3168                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
3170  001f 721a530a      	bset	21258,#5
3172  0023 2004          	jra	L7711
3173  0025               L5711:
3174                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3176  0025 721b530a      	bres	21258,#5
3177  0029               L7711:
3178                     ; 708 }
3181  0029 84            	pop	a
3182  002a 81            	ret
3219                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3219                     ; 719 {
3220                     .text:	section	.text,new
3221  0000               _TIM2_OC3PolarityConfig:
3223  0000 88            	push	a
3224       00000000      OFST:	set	0
3227                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3229  0001 4d            	tnz	a
3230  0002 2704          	jreq	L014
3231  0004 a122          	cp	a,#34
3232  0006 2603          	jrne	L604
3233  0008               L014:
3234  0008 4f            	clr	a
3235  0009 2010          	jra	L214
3236  000b               L604:
3237  000b ae02d1        	ldw	x,#721
3238  000e 89            	pushw	x
3239  000f ae0000        	ldw	x,#0
3240  0012 89            	pushw	x
3241  0013 ae0000        	ldw	x,#L302
3242  0016 cd0000        	call	_assert_failed
3244  0019 5b04          	addw	sp,#4
3245  001b               L214:
3246                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3248  001b 0d01          	tnz	(OFST+1,sp)
3249  001d 2706          	jreq	L7121
3250                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3252  001f 7212530b      	bset	21259,#1
3254  0023 2004          	jra	L1221
3255  0025               L7121:
3256                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3258  0025 7213530b      	bres	21259,#1
3259  0029               L1221:
3260                     ; 732 }
3263  0029 84            	pop	a
3264  002a 81            	ret
3310                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3310                     ; 746 {
3311                     .text:	section	.text,new
3312  0000               _TIM2_CCxCmd:
3314  0000 89            	pushw	x
3315       00000000      OFST:	set	0
3318                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3320  0001 9e            	ld	a,xh
3321  0002 4d            	tnz	a
3322  0003 270a          	jreq	L024
3323  0005 9e            	ld	a,xh
3324  0006 a101          	cp	a,#1
3325  0008 2705          	jreq	L024
3326  000a 9e            	ld	a,xh
3327  000b a102          	cp	a,#2
3328  000d 2603          	jrne	L614
3329  000f               L024:
3330  000f 4f            	clr	a
3331  0010 2010          	jra	L224
3332  0012               L614:
3333  0012 ae02ec        	ldw	x,#748
3334  0015 89            	pushw	x
3335  0016 ae0000        	ldw	x,#0
3336  0019 89            	pushw	x
3337  001a ae0000        	ldw	x,#L302
3338  001d cd0000        	call	_assert_failed
3340  0020 5b04          	addw	sp,#4
3341  0022               L224:
3342                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3344  0022 0d02          	tnz	(OFST+2,sp)
3345  0024 2706          	jreq	L624
3346  0026 7b02          	ld	a,(OFST+2,sp)
3347  0028 a101          	cp	a,#1
3348  002a 2603          	jrne	L424
3349  002c               L624:
3350  002c 4f            	clr	a
3351  002d 2010          	jra	L034
3352  002f               L424:
3353  002f ae02ed        	ldw	x,#749
3354  0032 89            	pushw	x
3355  0033 ae0000        	ldw	x,#0
3356  0036 89            	pushw	x
3357  0037 ae0000        	ldw	x,#L302
3358  003a cd0000        	call	_assert_failed
3360  003d 5b04          	addw	sp,#4
3361  003f               L034:
3362                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3364  003f 0d01          	tnz	(OFST+1,sp)
3365  0041 2610          	jrne	L5421
3366                     ; 754     if (NewState != DISABLE)
3368  0043 0d02          	tnz	(OFST+2,sp)
3369  0045 2706          	jreq	L7421
3370                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3372  0047 7210530a      	bset	21258,#0
3374  004b 202a          	jra	L3521
3375  004d               L7421:
3376                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3378  004d 7211530a      	bres	21258,#0
3379  0051 2024          	jra	L3521
3380  0053               L5421:
3381                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3383  0053 7b01          	ld	a,(OFST+1,sp)
3384  0055 a101          	cp	a,#1
3385  0057 2610          	jrne	L5521
3386                     ; 767     if (NewState != DISABLE)
3388  0059 0d02          	tnz	(OFST+2,sp)
3389  005b 2706          	jreq	L7521
3390                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3392  005d 7218530a      	bset	21258,#4
3394  0061 2014          	jra	L3521
3395  0063               L7521:
3396                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3398  0063 7219530a      	bres	21258,#4
3399  0067 200e          	jra	L3521
3400  0069               L5521:
3401                     ; 779     if (NewState != DISABLE)
3403  0069 0d02          	tnz	(OFST+2,sp)
3404  006b 2706          	jreq	L5621
3405                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3407  006d 7210530b      	bset	21259,#0
3409  0071 2004          	jra	L3521
3410  0073               L5621:
3411                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3413  0073 7211530b      	bres	21259,#0
3414  0077               L3521:
3415                     ; 788 }
3418  0077 85            	popw	x
3419  0078 81            	ret
3465                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3465                     ; 811 {
3466                     .text:	section	.text,new
3467  0000               _TIM2_SelectOCxM:
3469  0000 89            	pushw	x
3470       00000000      OFST:	set	0
3473                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3475  0001 9e            	ld	a,xh
3476  0002 4d            	tnz	a
3477  0003 270a          	jreq	L634
3478  0005 9e            	ld	a,xh
3479  0006 a101          	cp	a,#1
3480  0008 2705          	jreq	L634
3481  000a 9e            	ld	a,xh
3482  000b a102          	cp	a,#2
3483  000d 2603          	jrne	L434
3484  000f               L634:
3485  000f 4f            	clr	a
3486  0010 2010          	jra	L044
3487  0012               L434:
3488  0012 ae032d        	ldw	x,#813
3489  0015 89            	pushw	x
3490  0016 ae0000        	ldw	x,#0
3491  0019 89            	pushw	x
3492  001a ae0000        	ldw	x,#L302
3493  001d cd0000        	call	_assert_failed
3495  0020 5b04          	addw	sp,#4
3496  0022               L044:
3497                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3499  0022 0d02          	tnz	(OFST+2,sp)
3500  0024 272a          	jreq	L444
3501  0026 7b02          	ld	a,(OFST+2,sp)
3502  0028 a110          	cp	a,#16
3503  002a 2724          	jreq	L444
3504  002c 7b02          	ld	a,(OFST+2,sp)
3505  002e a120          	cp	a,#32
3506  0030 271e          	jreq	L444
3507  0032 7b02          	ld	a,(OFST+2,sp)
3508  0034 a130          	cp	a,#48
3509  0036 2718          	jreq	L444
3510  0038 7b02          	ld	a,(OFST+2,sp)
3511  003a a160          	cp	a,#96
3512  003c 2712          	jreq	L444
3513  003e 7b02          	ld	a,(OFST+2,sp)
3514  0040 a170          	cp	a,#112
3515  0042 270c          	jreq	L444
3516  0044 7b02          	ld	a,(OFST+2,sp)
3517  0046 a150          	cp	a,#80
3518  0048 2706          	jreq	L444
3519  004a 7b02          	ld	a,(OFST+2,sp)
3520  004c a140          	cp	a,#64
3521  004e 2603          	jrne	L244
3522  0050               L444:
3523  0050 4f            	clr	a
3524  0051 2010          	jra	L644
3525  0053               L244:
3526  0053 ae032e        	ldw	x,#814
3527  0056 89            	pushw	x
3528  0057 ae0000        	ldw	x,#0
3529  005a 89            	pushw	x
3530  005b ae0000        	ldw	x,#L302
3531  005e cd0000        	call	_assert_failed
3533  0061 5b04          	addw	sp,#4
3534  0063               L644:
3535                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3537  0063 0d01          	tnz	(OFST+1,sp)
3538  0065 2610          	jrne	L3131
3539                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3541  0067 7211530a      	bres	21258,#0
3542                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3542                     ; 823                             | (uint8_t)TIM2_OCMode);
3544  006b c65307        	ld	a,21255
3545  006e a48f          	and	a,#143
3546  0070 1a02          	or	a,(OFST+2,sp)
3547  0072 c75307        	ld	21255,a
3549  0075 2024          	jra	L5131
3550  0077               L3131:
3551                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3553  0077 7b01          	ld	a,(OFST+1,sp)
3554  0079 a101          	cp	a,#1
3555  007b 2610          	jrne	L7131
3556                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3558  007d 7219530a      	bres	21258,#4
3559                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3559                     ; 832                             | (uint8_t)TIM2_OCMode);
3561  0081 c65308        	ld	a,21256
3562  0084 a48f          	and	a,#143
3563  0086 1a02          	or	a,(OFST+2,sp)
3564  0088 c75308        	ld	21256,a
3566  008b 200e          	jra	L5131
3567  008d               L7131:
3568                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3570  008d 7211530b      	bres	21259,#0
3571                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3571                     ; 841                             | (uint8_t)TIM2_OCMode);
3573  0091 c65309        	ld	a,21257
3574  0094 a48f          	and	a,#143
3575  0096 1a02          	or	a,(OFST+2,sp)
3576  0098 c75309        	ld	21257,a
3577  009b               L5131:
3578                     ; 843 }
3581  009b 85            	popw	x
3582  009c 81            	ret
3614                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3614                     ; 852 {
3615                     .text:	section	.text,new
3616  0000               _TIM2_SetCounter:
3620                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3622  0000 9e            	ld	a,xh
3623  0001 c7530c        	ld	21260,a
3624                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3626  0004 9f            	ld	a,xl
3627  0005 c7530d        	ld	21261,a
3628                     ; 856 }
3631  0008 81            	ret
3663                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3663                     ; 865 {
3664                     .text:	section	.text,new
3665  0000               _TIM2_SetAutoreload:
3669                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3671  0000 9e            	ld	a,xh
3672  0001 c7530f        	ld	21263,a
3673                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3675  0004 9f            	ld	a,xl
3676  0005 c75310        	ld	21264,a
3677                     ; 869 }
3680  0008 81            	ret
3712                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3712                     ; 878 {
3713                     .text:	section	.text,new
3714  0000               _TIM2_SetCompare1:
3718                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3720  0000 9e            	ld	a,xh
3721  0001 c75311        	ld	21265,a
3722                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3724  0004 9f            	ld	a,xl
3725  0005 c75312        	ld	21266,a
3726                     ; 882 }
3729  0008 81            	ret
3761                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3761                     ; 891 {
3762                     .text:	section	.text,new
3763  0000               _TIM2_SetCompare2:
3767                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3769  0000 9e            	ld	a,xh
3770  0001 c75313        	ld	21267,a
3771                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3773  0004 9f            	ld	a,xl
3774  0005 c75314        	ld	21268,a
3775                     ; 895 }
3778  0008 81            	ret
3810                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3810                     ; 904 {
3811                     .text:	section	.text,new
3812  0000               _TIM2_SetCompare3:
3816                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3818  0000 9e            	ld	a,xh
3819  0001 c75315        	ld	21269,a
3820                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3822  0004 9f            	ld	a,xl
3823  0005 c75316        	ld	21270,a
3824                     ; 908 }
3827  0008 81            	ret
3864                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3864                     ; 921 {
3865                     .text:	section	.text,new
3866  0000               _TIM2_SetIC1Prescaler:
3868  0000 88            	push	a
3869       00000000      OFST:	set	0
3872                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3874  0001 4d            	tnz	a
3875  0002 270c          	jreq	L664
3876  0004 a104          	cp	a,#4
3877  0006 2708          	jreq	L664
3878  0008 a108          	cp	a,#8
3879  000a 2704          	jreq	L664
3880  000c a10c          	cp	a,#12
3881  000e 2603          	jrne	L464
3882  0010               L664:
3883  0010 4f            	clr	a
3884  0011 2010          	jra	L074
3885  0013               L464:
3886  0013 ae039b        	ldw	x,#923
3887  0016 89            	pushw	x
3888  0017 ae0000        	ldw	x,#0
3889  001a 89            	pushw	x
3890  001b ae0000        	ldw	x,#L302
3891  001e cd0000        	call	_assert_failed
3893  0021 5b04          	addw	sp,#4
3894  0023               L074:
3895                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3895                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3897  0023 c65307        	ld	a,21255
3898  0026 a4f3          	and	a,#243
3899  0028 1a01          	or	a,(OFST+1,sp)
3900  002a c75307        	ld	21255,a
3901                     ; 928 }
3904  002d 84            	pop	a
3905  002e 81            	ret
3942                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3942                     ; 941 {
3943                     .text:	section	.text,new
3944  0000               _TIM2_SetIC2Prescaler:
3946  0000 88            	push	a
3947       00000000      OFST:	set	0
3950                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3952  0001 4d            	tnz	a
3953  0002 270c          	jreq	L674
3954  0004 a104          	cp	a,#4
3955  0006 2708          	jreq	L674
3956  0008 a108          	cp	a,#8
3957  000a 2704          	jreq	L674
3958  000c a10c          	cp	a,#12
3959  000e 2603          	jrne	L474
3960  0010               L674:
3961  0010 4f            	clr	a
3962  0011 2010          	jra	L005
3963  0013               L474:
3964  0013 ae03af        	ldw	x,#943
3965  0016 89            	pushw	x
3966  0017 ae0000        	ldw	x,#0
3967  001a 89            	pushw	x
3968  001b ae0000        	ldw	x,#L302
3969  001e cd0000        	call	_assert_failed
3971  0021 5b04          	addw	sp,#4
3972  0023               L005:
3973                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3973                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3975  0023 c65308        	ld	a,21256
3976  0026 a4f3          	and	a,#243
3977  0028 1a01          	or	a,(OFST+1,sp)
3978  002a c75308        	ld	21256,a
3979                     ; 948 }
3982  002d 84            	pop	a
3983  002e 81            	ret
4020                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4020                     ; 961 {
4021                     .text:	section	.text,new
4022  0000               _TIM2_SetIC3Prescaler:
4024  0000 88            	push	a
4025       00000000      OFST:	set	0
4028                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4030  0001 4d            	tnz	a
4031  0002 270c          	jreq	L605
4032  0004 a104          	cp	a,#4
4033  0006 2708          	jreq	L605
4034  0008 a108          	cp	a,#8
4035  000a 2704          	jreq	L605
4036  000c a10c          	cp	a,#12
4037  000e 2603          	jrne	L405
4038  0010               L605:
4039  0010 4f            	clr	a
4040  0011 2010          	jra	L015
4041  0013               L405:
4042  0013 ae03c4        	ldw	x,#964
4043  0016 89            	pushw	x
4044  0017 ae0000        	ldw	x,#0
4045  001a 89            	pushw	x
4046  001b ae0000        	ldw	x,#L302
4047  001e cd0000        	call	_assert_failed
4049  0021 5b04          	addw	sp,#4
4050  0023               L015:
4051                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4051                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
4053  0023 c65309        	ld	a,21257
4054  0026 a4f3          	and	a,#243
4055  0028 1a01          	or	a,(OFST+1,sp)
4056  002a c75309        	ld	21257,a
4057                     ; 968 }
4060  002d 84            	pop	a
4061  002e 81            	ret
4107                     ; 975 uint16_t TIM2_GetCapture1(void)
4107                     ; 976 {
4108                     .text:	section	.text,new
4109  0000               _TIM2_GetCapture1:
4111  0000 5204          	subw	sp,#4
4112       00000004      OFST:	set	4
4115                     ; 978   uint16_t tmpccr1 = 0;
4117                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
4121                     ; 981   tmpccr1h = TIM2->CCR1H;
4123  0002 c65311        	ld	a,21265
4124  0005 6b02          	ld	(OFST-2,sp),a
4126                     ; 982   tmpccr1l = TIM2->CCR1L;
4128  0007 c65312        	ld	a,21266
4129  000a 6b01          	ld	(OFST-3,sp),a
4131                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
4133  000c 7b01          	ld	a,(OFST-3,sp)
4134  000e 5f            	clrw	x
4135  000f 97            	ld	xl,a
4136  0010 1f03          	ldw	(OFST-1,sp),x
4138                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4140  0012 7b02          	ld	a,(OFST-2,sp)
4141  0014 5f            	clrw	x
4142  0015 97            	ld	xl,a
4143  0016 4f            	clr	a
4144  0017 02            	rlwa	x,a
4145  0018 01            	rrwa	x,a
4146  0019 1a04          	or	a,(OFST+0,sp)
4147  001b 01            	rrwa	x,a
4148  001c 1a03          	or	a,(OFST-1,sp)
4149  001e 01            	rrwa	x,a
4150  001f 1f03          	ldw	(OFST-1,sp),x
4152                     ; 987   return (uint16_t)tmpccr1;
4154  0021 1e03          	ldw	x,(OFST-1,sp)
4157  0023 5b04          	addw	sp,#4
4158  0025 81            	ret
4204                     ; 995 uint16_t TIM2_GetCapture2(void)
4204                     ; 996 {
4205                     .text:	section	.text,new
4206  0000               _TIM2_GetCapture2:
4208  0000 5204          	subw	sp,#4
4209       00000004      OFST:	set	4
4212                     ; 998   uint16_t tmpccr2 = 0;
4214                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
4218                     ; 1001   tmpccr2h = TIM2->CCR2H;
4220  0002 c65313        	ld	a,21267
4221  0005 6b02          	ld	(OFST-2,sp),a
4223                     ; 1002   tmpccr2l = TIM2->CCR2L;
4225  0007 c65314        	ld	a,21268
4226  000a 6b01          	ld	(OFST-3,sp),a
4228                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
4230  000c 7b01          	ld	a,(OFST-3,sp)
4231  000e 5f            	clrw	x
4232  000f 97            	ld	xl,a
4233  0010 1f03          	ldw	(OFST-1,sp),x
4235                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4237  0012 7b02          	ld	a,(OFST-2,sp)
4238  0014 5f            	clrw	x
4239  0015 97            	ld	xl,a
4240  0016 4f            	clr	a
4241  0017 02            	rlwa	x,a
4242  0018 01            	rrwa	x,a
4243  0019 1a04          	or	a,(OFST+0,sp)
4244  001b 01            	rrwa	x,a
4245  001c 1a03          	or	a,(OFST-1,sp)
4246  001e 01            	rrwa	x,a
4247  001f 1f03          	ldw	(OFST-1,sp),x
4249                     ; 1007   return (uint16_t)tmpccr2;
4251  0021 1e03          	ldw	x,(OFST-1,sp)
4254  0023 5b04          	addw	sp,#4
4255  0025 81            	ret
4301                     ; 1015 uint16_t TIM2_GetCapture3(void)
4301                     ; 1016 {
4302                     .text:	section	.text,new
4303  0000               _TIM2_GetCapture3:
4305  0000 5204          	subw	sp,#4
4306       00000004      OFST:	set	4
4309                     ; 1018   uint16_t tmpccr3 = 0;
4311                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4315                     ; 1021   tmpccr3h = TIM2->CCR3H;
4317  0002 c65315        	ld	a,21269
4318  0005 6b02          	ld	(OFST-2,sp),a
4320                     ; 1022   tmpccr3l = TIM2->CCR3L;
4322  0007 c65316        	ld	a,21270
4323  000a 6b01          	ld	(OFST-3,sp),a
4325                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4327  000c 7b01          	ld	a,(OFST-3,sp)
4328  000e 5f            	clrw	x
4329  000f 97            	ld	xl,a
4330  0010 1f03          	ldw	(OFST-1,sp),x
4332                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4334  0012 7b02          	ld	a,(OFST-2,sp)
4335  0014 5f            	clrw	x
4336  0015 97            	ld	xl,a
4337  0016 4f            	clr	a
4338  0017 02            	rlwa	x,a
4339  0018 01            	rrwa	x,a
4340  0019 1a04          	or	a,(OFST+0,sp)
4341  001b 01            	rrwa	x,a
4342  001c 1a03          	or	a,(OFST-1,sp)
4343  001e 01            	rrwa	x,a
4344  001f 1f03          	ldw	(OFST-1,sp),x
4346                     ; 1027   return (uint16_t)tmpccr3;
4348  0021 1e03          	ldw	x,(OFST-1,sp)
4351  0023 5b04          	addw	sp,#4
4352  0025 81            	ret
4384                     ; 1035 uint16_t TIM2_GetCounter(void)
4384                     ; 1036 {
4385                     .text:	section	.text,new
4386  0000               _TIM2_GetCounter:
4388  0000 89            	pushw	x
4389       00000002      OFST:	set	2
4392                     ; 1037   uint16_t tmpcntr = 0;
4394                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4396  0001 c6530c        	ld	a,21260
4397  0004 5f            	clrw	x
4398  0005 97            	ld	xl,a
4399  0006 4f            	clr	a
4400  0007 02            	rlwa	x,a
4401  0008 1f01          	ldw	(OFST-1,sp),x
4403                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4405  000a c6530d        	ld	a,21261
4406  000d 5f            	clrw	x
4407  000e 97            	ld	xl,a
4408  000f 01            	rrwa	x,a
4409  0010 1a02          	or	a,(OFST+0,sp)
4410  0012 01            	rrwa	x,a
4411  0013 1a01          	or	a,(OFST-1,sp)
4412  0015 01            	rrwa	x,a
4415  0016 5b02          	addw	sp,#2
4416  0018 81            	ret
4440                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4440                     ; 1050 {
4441                     .text:	section	.text,new
4442  0000               _TIM2_GetPrescaler:
4446                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4448  0000 c6530e        	ld	a,21262
4451  0003 81            	ret
4587                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4587                     ; 1069 {
4588                     .text:	section	.text,new
4589  0000               _TIM2_GetFlagStatus:
4591  0000 89            	pushw	x
4592  0001 89            	pushw	x
4593       00000002      OFST:	set	2
4596                     ; 1070   FlagStatus bitstatus = RESET;
4598                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4602                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4604  0002 a30001        	cpw	x,#1
4605  0005 271e          	jreq	L035
4606  0007 a30002        	cpw	x,#2
4607  000a 2719          	jreq	L035
4608  000c a30004        	cpw	x,#4
4609  000f 2714          	jreq	L035
4610  0011 a30008        	cpw	x,#8
4611  0014 270f          	jreq	L035
4612  0016 a30200        	cpw	x,#512
4613  0019 270a          	jreq	L035
4614  001b a30400        	cpw	x,#1024
4615  001e 2705          	jreq	L035
4616  0020 a30800        	cpw	x,#2048
4617  0023 2603          	jrne	L625
4618  0025               L035:
4619  0025 4f            	clr	a
4620  0026 2010          	jra	L235
4621  0028               L625:
4622  0028 ae0432        	ldw	x,#1074
4623  002b 89            	pushw	x
4624  002c ae0000        	ldw	x,#0
4625  002f 89            	pushw	x
4626  0030 ae0000        	ldw	x,#L302
4627  0033 cd0000        	call	_assert_failed
4629  0036 5b04          	addw	sp,#4
4630  0038               L235:
4631                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4633  0038 c65304        	ld	a,21252
4634  003b 1404          	and	a,(OFST+2,sp)
4635  003d 6b01          	ld	(OFST-1,sp),a
4637                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4639  003f 7b03          	ld	a,(OFST+1,sp)
4640  0041 6b02          	ld	(OFST+0,sp),a
4642                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4644  0043 c65305        	ld	a,21253
4645  0046 1402          	and	a,(OFST+0,sp)
4646  0048 1a01          	or	a,(OFST-1,sp)
4647  004a 2706          	jreq	L5561
4648                     ; 1081     bitstatus = SET;
4650  004c a601          	ld	a,#1
4651  004e 6b02          	ld	(OFST+0,sp),a
4654  0050 2002          	jra	L7561
4655  0052               L5561:
4656                     ; 1085     bitstatus = RESET;
4658  0052 0f02          	clr	(OFST+0,sp)
4660  0054               L7561:
4661                     ; 1087   return (FlagStatus)bitstatus;
4663  0054 7b02          	ld	a,(OFST+0,sp)
4666  0056 5b04          	addw	sp,#4
4667  0058 81            	ret
4703                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4703                     ; 1104 {
4704                     .text:	section	.text,new
4705  0000               _TIM2_ClearFlag:
4707  0000 89            	pushw	x
4708       00000000      OFST:	set	0
4711                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4713  0001 01            	rrwa	x,a
4714  0002 a4f0          	and	a,#240
4715  0004 01            	rrwa	x,a
4716  0005 a4f1          	and	a,#241
4717  0007 01            	rrwa	x,a
4718  0008 a30000        	cpw	x,#0
4719  000b 2607          	jrne	L635
4720  000d 1e01          	ldw	x,(OFST+1,sp)
4721  000f 2703          	jreq	L635
4722  0011 4f            	clr	a
4723  0012 2010          	jra	L045
4724  0014               L635:
4725  0014 ae0452        	ldw	x,#1106
4726  0017 89            	pushw	x
4727  0018 ae0000        	ldw	x,#0
4728  001b 89            	pushw	x
4729  001c ae0000        	ldw	x,#L302
4730  001f cd0000        	call	_assert_failed
4732  0022 5b04          	addw	sp,#4
4733  0024               L045:
4734                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4736  0024 7b02          	ld	a,(OFST+2,sp)
4737  0026 43            	cpl	a
4738  0027 c75304        	ld	21252,a
4739                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4741  002a 35ff5305      	mov	21253,#255
4742                     ; 1111 }
4745  002e 85            	popw	x
4746  002f 81            	ret
4807                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4807                     ; 1124 {
4808                     .text:	section	.text,new
4809  0000               _TIM2_GetITStatus:
4811  0000 88            	push	a
4812  0001 89            	pushw	x
4813       00000002      OFST:	set	2
4816                     ; 1125   ITStatus bitstatus = RESET;
4818                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4822                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4824  0002 a101          	cp	a,#1
4825  0004 270c          	jreq	L645
4826  0006 a102          	cp	a,#2
4827  0008 2708          	jreq	L645
4828  000a a104          	cp	a,#4
4829  000c 2704          	jreq	L645
4830  000e a108          	cp	a,#8
4831  0010 2603          	jrne	L445
4832  0012               L645:
4833  0012 4f            	clr	a
4834  0013 2010          	jra	L055
4835  0015               L445:
4836  0015 ae0469        	ldw	x,#1129
4837  0018 89            	pushw	x
4838  0019 ae0000        	ldw	x,#0
4839  001c 89            	pushw	x
4840  001d ae0000        	ldw	x,#L302
4841  0020 cd0000        	call	_assert_failed
4843  0023 5b04          	addw	sp,#4
4844  0025               L055:
4845                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4847  0025 c65304        	ld	a,21252
4848  0028 1403          	and	a,(OFST+1,sp)
4849  002a 6b01          	ld	(OFST-1,sp),a
4851                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4853  002c c65303        	ld	a,21251
4854  002f 1403          	and	a,(OFST+1,sp)
4855  0031 6b02          	ld	(OFST+0,sp),a
4857                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4859  0033 0d01          	tnz	(OFST-1,sp)
4860  0035 270a          	jreq	L5271
4862  0037 0d02          	tnz	(OFST+0,sp)
4863  0039 2706          	jreq	L5271
4864                     ; 1137     bitstatus = SET;
4866  003b a601          	ld	a,#1
4867  003d 6b02          	ld	(OFST+0,sp),a
4870  003f 2002          	jra	L7271
4871  0041               L5271:
4872                     ; 1141     bitstatus = RESET;
4874  0041 0f02          	clr	(OFST+0,sp)
4876  0043               L7271:
4877                     ; 1143   return (ITStatus)(bitstatus);
4879  0043 7b02          	ld	a,(OFST+0,sp)
4882  0045 5b03          	addw	sp,#3
4883  0047 81            	ret
4920                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4920                     ; 1157 {
4921                     .text:	section	.text,new
4922  0000               _TIM2_ClearITPendingBit:
4924  0000 88            	push	a
4925       00000000      OFST:	set	0
4928                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4930  0001 4d            	tnz	a
4931  0002 2707          	jreq	L455
4932  0004 a110          	cp	a,#16
4933  0006 2403          	jruge	L455
4934  0008 4f            	clr	a
4935  0009 2010          	jra	L655
4936  000b               L455:
4937  000b ae0487        	ldw	x,#1159
4938  000e 89            	pushw	x
4939  000f ae0000        	ldw	x,#0
4940  0012 89            	pushw	x
4941  0013 ae0000        	ldw	x,#L302
4942  0016 cd0000        	call	_assert_failed
4944  0019 5b04          	addw	sp,#4
4945  001b               L655:
4946                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4948  001b 7b01          	ld	a,(OFST+1,sp)
4949  001d 43            	cpl	a
4950  001e c75304        	ld	21252,a
4951                     ; 1163 }
4954  0021 84            	pop	a
4955  0022 81            	ret
5001                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
5001                     ; 1182                        uint8_t TIM2_ICSelection,
5001                     ; 1183                        uint8_t TIM2_ICFilter)
5001                     ; 1184 {
5002                     .text:	section	.text,new
5003  0000               L3_TI1_Config:
5005  0000 89            	pushw	x
5006  0001 88            	push	a
5007       00000001      OFST:	set	1
5010                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5012  0002 7211530a      	bres	21258,#0
5013                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5013                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5015  0006 7b06          	ld	a,(OFST+5,sp)
5016  0008 97            	ld	xl,a
5017  0009 a610          	ld	a,#16
5018  000b 42            	mul	x,a
5019  000c 9f            	ld	a,xl
5020  000d 1a03          	or	a,(OFST+2,sp)
5021  000f 6b01          	ld	(OFST+0,sp),a
5023  0011 c65307        	ld	a,21255
5024  0014 a40c          	and	a,#12
5025  0016 1a01          	or	a,(OFST+0,sp)
5026  0018 c75307        	ld	21255,a
5027                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5029  001b 0d02          	tnz	(OFST+1,sp)
5030  001d 2706          	jreq	L7671
5031                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
5033  001f 7212530a      	bset	21258,#1
5035  0023 2004          	jra	L1771
5036  0025               L7671:
5037                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5039  0025 7213530a      	bres	21258,#1
5040  0029               L1771:
5041                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
5043  0029 7210530a      	bset	21258,#0
5044                     ; 1203 }
5047  002d 5b03          	addw	sp,#3
5048  002f 81            	ret
5094                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
5094                     ; 1222                        uint8_t TIM2_ICSelection,
5094                     ; 1223                        uint8_t TIM2_ICFilter)
5094                     ; 1224 {
5095                     .text:	section	.text,new
5096  0000               L5_TI2_Config:
5098  0000 89            	pushw	x
5099  0001 88            	push	a
5100       00000001      OFST:	set	1
5103                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5105  0002 7219530a      	bres	21258,#4
5106                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5106                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5108  0006 7b06          	ld	a,(OFST+5,sp)
5109  0008 97            	ld	xl,a
5110  0009 a610          	ld	a,#16
5111  000b 42            	mul	x,a
5112  000c 9f            	ld	a,xl
5113  000d 1a03          	or	a,(OFST+2,sp)
5114  000f 6b01          	ld	(OFST+0,sp),a
5116  0011 c65308        	ld	a,21256
5117  0014 a40c          	and	a,#12
5118  0016 1a01          	or	a,(OFST+0,sp)
5119  0018 c75308        	ld	21256,a
5120                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5122  001b 0d02          	tnz	(OFST+1,sp)
5123  001d 2706          	jreq	L3102
5124                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
5126  001f 721a530a      	bset	21258,#5
5128  0023 2004          	jra	L5102
5129  0025               L3102:
5130                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5132  0025 721b530a      	bres	21258,#5
5133  0029               L5102:
5134                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
5136  0029 7218530a      	bset	21258,#4
5137                     ; 1245 }
5140  002d 5b03          	addw	sp,#3
5141  002f 81            	ret
5187                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5187                     ; 1262                        uint8_t TIM2_ICFilter)
5187                     ; 1263 {
5188                     .text:	section	.text,new
5189  0000               L7_TI3_Config:
5191  0000 89            	pushw	x
5192  0001 88            	push	a
5193       00000001      OFST:	set	1
5196                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5198  0002 7211530b      	bres	21259,#0
5199                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5199                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5201  0006 7b06          	ld	a,(OFST+5,sp)
5202  0008 97            	ld	xl,a
5203  0009 a610          	ld	a,#16
5204  000b 42            	mul	x,a
5205  000c 9f            	ld	a,xl
5206  000d 1a03          	or	a,(OFST+2,sp)
5207  000f 6b01          	ld	(OFST+0,sp),a
5209  0011 c65309        	ld	a,21257
5210  0014 a40c          	and	a,#12
5211  0016 1a01          	or	a,(OFST+0,sp)
5212  0018 c75309        	ld	21257,a
5213                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5215  001b 0d02          	tnz	(OFST+1,sp)
5216  001d 2706          	jreq	L7302
5217                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
5219  001f 7212530b      	bset	21259,#1
5221  0023 2004          	jra	L1402
5222  0025               L7302:
5223                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5225  0025 7213530b      	bres	21259,#1
5226  0029               L1402:
5227                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
5229  0029 7210530b      	bset	21259,#0
5230                     ; 1283 }
5233  002d 5b03          	addw	sp,#3
5234  002f 81            	ret
5247                     	xdef	_TIM2_ClearITPendingBit
5248                     	xdef	_TIM2_GetITStatus
5249                     	xdef	_TIM2_ClearFlag
5250                     	xdef	_TIM2_GetFlagStatus
5251                     	xdef	_TIM2_GetPrescaler
5252                     	xdef	_TIM2_GetCounter
5253                     	xdef	_TIM2_GetCapture3
5254                     	xdef	_TIM2_GetCapture2
5255                     	xdef	_TIM2_GetCapture1
5256                     	xdef	_TIM2_SetIC3Prescaler
5257                     	xdef	_TIM2_SetIC2Prescaler
5258                     	xdef	_TIM2_SetIC1Prescaler
5259                     	xdef	_TIM2_SetCompare3
5260                     	xdef	_TIM2_SetCompare2
5261                     	xdef	_TIM2_SetCompare1
5262                     	xdef	_TIM2_SetAutoreload
5263                     	xdef	_TIM2_SetCounter
5264                     	xdef	_TIM2_SelectOCxM
5265                     	xdef	_TIM2_CCxCmd
5266                     	xdef	_TIM2_OC3PolarityConfig
5267                     	xdef	_TIM2_OC2PolarityConfig
5268                     	xdef	_TIM2_OC1PolarityConfig
5269                     	xdef	_TIM2_GenerateEvent
5270                     	xdef	_TIM2_OC3PreloadConfig
5271                     	xdef	_TIM2_OC2PreloadConfig
5272                     	xdef	_TIM2_OC1PreloadConfig
5273                     	xdef	_TIM2_ARRPreloadConfig
5274                     	xdef	_TIM2_ForcedOC3Config
5275                     	xdef	_TIM2_ForcedOC2Config
5276                     	xdef	_TIM2_ForcedOC1Config
5277                     	xdef	_TIM2_PrescalerConfig
5278                     	xdef	_TIM2_SelectOnePulseMode
5279                     	xdef	_TIM2_UpdateRequestConfig
5280                     	xdef	_TIM2_UpdateDisableConfig
5281                     	xdef	_TIM2_ITConfig
5282                     	xdef	_TIM2_Cmd
5283                     	xdef	_TIM2_PWMIConfig
5284                     	xdef	_TIM2_ICInit
5285                     	xdef	_TIM2_OC3Init
5286                     	xdef	_TIM2_OC2Init
5287                     	xdef	_TIM2_OC1Init
5288                     	xdef	_TIM2_TimeBaseInit
5289                     	xdef	_TIM2_DeInit
5290                     	xref	_assert_failed
5291                     .const:	section	.text
5292  0000               L302:
5293  0000 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
5294  0012 74696d322e63  	dc.b	"tim2.c",0
5314                     	end
