   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 58 void TIM1_DeInit(void)
  45                     ; 59 {
  47                     .text:	section	.text,new
  48  0000               _TIM1_DeInit:
  52                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  54  0000 725f5250      	clr	21072
  55                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  57  0004 725f5251      	clr	21073
  58                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  60  0008 725f5252      	clr	21074
  61                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  63  000c 725f5253      	clr	21075
  64                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  66  0010 725f5254      	clr	21076
  67                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  69  0014 725f5256      	clr	21078
  70                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  72  0018 725f525c      	clr	21084
  73                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  75  001c 725f525d      	clr	21085
  76                     ; 70   TIM1->CCMR1 = 0x01;
  78  0020 35015258      	mov	21080,#1
  79                     ; 71   TIM1->CCMR2 = 0x01;
  81  0024 35015259      	mov	21081,#1
  82                     ; 72   TIM1->CCMR3 = 0x01;
  84  0028 3501525a      	mov	21082,#1
  85                     ; 73   TIM1->CCMR4 = 0x01;
  87  002c 3501525b      	mov	21083,#1
  88                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  90  0030 725f525c      	clr	21084
  91                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  93  0034 725f525d      	clr	21085
  94                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  96  0038 725f5258      	clr	21080
  97                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  99  003c 725f5259      	clr	21081
 100                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 102  0040 725f525a      	clr	21082
 103                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 105  0044 725f525b      	clr	21083
 106                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 108  0048 725f525e      	clr	21086
 109                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 111  004c 725f525f      	clr	21087
 112                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 114  0050 725f5260      	clr	21088
 115                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 117  0054 725f5261      	clr	21089
 118                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 120  0058 35ff5262      	mov	21090,#255
 121                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 123  005c 35ff5263      	mov	21091,#255
 124                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 126  0060 725f5265      	clr	21093
 127                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 129  0064 725f5266      	clr	21094
 130                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 132  0068 725f5267      	clr	21095
 133                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 135  006c 725f5268      	clr	21096
 136                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 138  0070 725f5269      	clr	21097
 139                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 141  0074 725f526a      	clr	21098
 142                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 144  0078 725f526b      	clr	21099
 145                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 147  007c 725f526c      	clr	21100
 148                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 150  0080 725f526f      	clr	21103
 151                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 153  0084 35015257      	mov	21079,#1
 154                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 156  0088 725f526e      	clr	21102
 157                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 159  008c 725f526d      	clr	21101
 160                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 162  0090 725f5264      	clr	21092
 163                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 165  0094 725f5255      	clr	21077
 166                     ; 101 }
 169  0098 81            	ret
 273                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 273                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 273                     ; 113                        uint16_t TIM1_Period,
 273                     ; 114                        uint8_t TIM1_RepetitionCounter)
 273                     ; 115 {
 274                     .text:	section	.text,new
 275  0000               _TIM1_TimeBaseInit:
 277  0000 89            	pushw	x
 278       00000000      OFST:	set	0
 281                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 283  0001 0d05          	tnz	(OFST+5,sp)
 284  0003 2718          	jreq	L21
 285  0005 7b05          	ld	a,(OFST+5,sp)
 286  0007 a110          	cp	a,#16
 287  0009 2712          	jreq	L21
 288  000b 7b05          	ld	a,(OFST+5,sp)
 289  000d a120          	cp	a,#32
 290  000f 270c          	jreq	L21
 291  0011 7b05          	ld	a,(OFST+5,sp)
 292  0013 a140          	cp	a,#64
 293  0015 2706          	jreq	L21
 294  0017 7b05          	ld	a,(OFST+5,sp)
 295  0019 a160          	cp	a,#96
 296  001b 2603          	jrne	L01
 297  001d               L21:
 298  001d 4f            	clr	a
 299  001e 2010          	jra	L41
 300  0020               L01:
 301  0020 ae0075        	ldw	x,#117
 302  0023 89            	pushw	x
 303  0024 ae0000        	ldw	x,#0
 304  0027 89            	pushw	x
 305  0028 ae0000        	ldw	x,#L37
 306  002b cd0000        	call	_assert_failed
 308  002e 5b04          	addw	sp,#4
 309  0030               L41:
 310                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 312  0030 7b06          	ld	a,(OFST+6,sp)
 313  0032 c75262        	ld	21090,a
 314                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 316  0035 7b07          	ld	a,(OFST+7,sp)
 317  0037 c75263        	ld	21091,a
 318                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 320  003a 7b01          	ld	a,(OFST+1,sp)
 321  003c c75260        	ld	21088,a
 322                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 324  003f 7b02          	ld	a,(OFST+2,sp)
 325  0041 c75261        	ld	21089,a
 326                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 326                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 328  0044 c65250        	ld	a,21072
 329  0047 a48f          	and	a,#143
 330  0049 1a05          	or	a,(OFST+5,sp)
 331  004b c75250        	ld	21072,a
 332                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 334  004e 7b08          	ld	a,(OFST+8,sp)
 335  0050 c75264        	ld	21092,a
 336                     ; 133 }
 339  0053 85            	popw	x
 340  0054 81            	ret
 624                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 624                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 624                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 624                     ; 157                   uint16_t TIM1_Pulse,
 624                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 624                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 624                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 624                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 624                     ; 162 {
 625                     .text:	section	.text,new
 626  0000               _TIM1_OC1Init:
 628  0000 89            	pushw	x
 629  0001 5203          	subw	sp,#3
 630       00000003      OFST:	set	3
 633                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 635  0003 9e            	ld	a,xh
 636  0004 4d            	tnz	a
 637  0005 2719          	jreq	L22
 638  0007 9e            	ld	a,xh
 639  0008 a110          	cp	a,#16
 640  000a 2714          	jreq	L22
 641  000c 9e            	ld	a,xh
 642  000d a120          	cp	a,#32
 643  000f 270f          	jreq	L22
 644  0011 9e            	ld	a,xh
 645  0012 a130          	cp	a,#48
 646  0014 270a          	jreq	L22
 647  0016 9e            	ld	a,xh
 648  0017 a160          	cp	a,#96
 649  0019 2705          	jreq	L22
 650  001b 9e            	ld	a,xh
 651  001c a170          	cp	a,#112
 652  001e 2603          	jrne	L02
 653  0020               L22:
 654  0020 4f            	clr	a
 655  0021 2010          	jra	L42
 656  0023               L02:
 657  0023 ae00a4        	ldw	x,#164
 658  0026 89            	pushw	x
 659  0027 ae0000        	ldw	x,#0
 660  002a 89            	pushw	x
 661  002b ae0000        	ldw	x,#L37
 662  002e cd0000        	call	_assert_failed
 664  0031 5b04          	addw	sp,#4
 665  0033               L42:
 666                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 668  0033 0d05          	tnz	(OFST+2,sp)
 669  0035 2706          	jreq	L03
 670  0037 7b05          	ld	a,(OFST+2,sp)
 671  0039 a111          	cp	a,#17
 672  003b 2603          	jrne	L62
 673  003d               L03:
 674  003d 4f            	clr	a
 675  003e 2010          	jra	L23
 676  0040               L62:
 677  0040 ae00a5        	ldw	x,#165
 678  0043 89            	pushw	x
 679  0044 ae0000        	ldw	x,#0
 680  0047 89            	pushw	x
 681  0048 ae0000        	ldw	x,#L37
 682  004b cd0000        	call	_assert_failed
 684  004e 5b04          	addw	sp,#4
 685  0050               L23:
 686                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 688  0050 0d08          	tnz	(OFST+5,sp)
 689  0052 2706          	jreq	L63
 690  0054 7b08          	ld	a,(OFST+5,sp)
 691  0056 a144          	cp	a,#68
 692  0058 2603          	jrne	L43
 693  005a               L63:
 694  005a 4f            	clr	a
 695  005b 2010          	jra	L04
 696  005d               L43:
 697  005d ae00a6        	ldw	x,#166
 698  0060 89            	pushw	x
 699  0061 ae0000        	ldw	x,#0
 700  0064 89            	pushw	x
 701  0065 ae0000        	ldw	x,#L37
 702  0068 cd0000        	call	_assert_failed
 704  006b 5b04          	addw	sp,#4
 705  006d               L04:
 706                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 708  006d 0d0b          	tnz	(OFST+8,sp)
 709  006f 2706          	jreq	L44
 710  0071 7b0b          	ld	a,(OFST+8,sp)
 711  0073 a122          	cp	a,#34
 712  0075 2603          	jrne	L24
 713  0077               L44:
 714  0077 4f            	clr	a
 715  0078 2010          	jra	L64
 716  007a               L24:
 717  007a ae00a7        	ldw	x,#167
 718  007d 89            	pushw	x
 719  007e ae0000        	ldw	x,#0
 720  0081 89            	pushw	x
 721  0082 ae0000        	ldw	x,#L37
 722  0085 cd0000        	call	_assert_failed
 724  0088 5b04          	addw	sp,#4
 725  008a               L64:
 726                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 728  008a 0d0c          	tnz	(OFST+9,sp)
 729  008c 2706          	jreq	L25
 730  008e 7b0c          	ld	a,(OFST+9,sp)
 731  0090 a188          	cp	a,#136
 732  0092 2603          	jrne	L05
 733  0094               L25:
 734  0094 4f            	clr	a
 735  0095 2010          	jra	L45
 736  0097               L05:
 737  0097 ae00a8        	ldw	x,#168
 738  009a 89            	pushw	x
 739  009b ae0000        	ldw	x,#0
 740  009e 89            	pushw	x
 741  009f ae0000        	ldw	x,#L37
 742  00a2 cd0000        	call	_assert_failed
 744  00a5 5b04          	addw	sp,#4
 745  00a7               L45:
 746                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 748  00a7 7b0d          	ld	a,(OFST+10,sp)
 749  00a9 a155          	cp	a,#85
 750  00ab 2704          	jreq	L06
 751  00ad 0d0d          	tnz	(OFST+10,sp)
 752  00af 2603          	jrne	L65
 753  00b1               L06:
 754  00b1 4f            	clr	a
 755  00b2 2010          	jra	L26
 756  00b4               L65:
 757  00b4 ae00a9        	ldw	x,#169
 758  00b7 89            	pushw	x
 759  00b8 ae0000        	ldw	x,#0
 760  00bb 89            	pushw	x
 761  00bc ae0000        	ldw	x,#L37
 762  00bf cd0000        	call	_assert_failed
 764  00c2 5b04          	addw	sp,#4
 765  00c4               L26:
 766                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 768  00c4 7b0e          	ld	a,(OFST+11,sp)
 769  00c6 a12a          	cp	a,#42
 770  00c8 2704          	jreq	L66
 771  00ca 0d0e          	tnz	(OFST+11,sp)
 772  00cc 2603          	jrne	L46
 773  00ce               L66:
 774  00ce 4f            	clr	a
 775  00cf 2010          	jra	L07
 776  00d1               L46:
 777  00d1 ae00aa        	ldw	x,#170
 778  00d4 89            	pushw	x
 779  00d5 ae0000        	ldw	x,#0
 780  00d8 89            	pushw	x
 781  00d9 ae0000        	ldw	x,#L37
 782  00dc cd0000        	call	_assert_failed
 784  00df 5b04          	addw	sp,#4
 785  00e1               L07:
 786                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 786                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 788  00e1 c6525c        	ld	a,21084
 789  00e4 a4f0          	and	a,#240
 790  00e6 c7525c        	ld	21084,a
 791                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 791                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 791                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 791                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 793  00e9 7b0c          	ld	a,(OFST+9,sp)
 794  00eb a408          	and	a,#8
 795  00ed 6b03          	ld	(OFST+0,sp),a
 797  00ef 7b0b          	ld	a,(OFST+8,sp)
 798  00f1 a402          	and	a,#2
 799  00f3 1a03          	or	a,(OFST+0,sp)
 800  00f5 6b02          	ld	(OFST-1,sp),a
 802  00f7 7b08          	ld	a,(OFST+5,sp)
 803  00f9 a404          	and	a,#4
 804  00fb 6b01          	ld	(OFST-2,sp),a
 806  00fd 7b05          	ld	a,(OFST+2,sp)
 807  00ff a401          	and	a,#1
 808  0101 1a01          	or	a,(OFST-2,sp)
 809  0103 1a02          	or	a,(OFST-1,sp)
 810  0105 ca525c        	or	a,21084
 811  0108 c7525c        	ld	21084,a
 812                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 812                     ; 185                           (uint8_t)TIM1_OCMode);
 814  010b c65258        	ld	a,21080
 815  010e a48f          	and	a,#143
 816  0110 1a04          	or	a,(OFST+1,sp)
 817  0112 c75258        	ld	21080,a
 818                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 820  0115 c6526f        	ld	a,21103
 821  0118 a4fc          	and	a,#252
 822  011a c7526f        	ld	21103,a
 823                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 823                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 825  011d 7b0e          	ld	a,(OFST+11,sp)
 826  011f a402          	and	a,#2
 827  0121 6b03          	ld	(OFST+0,sp),a
 829  0123 7b0d          	ld	a,(OFST+10,sp)
 830  0125 a401          	and	a,#1
 831  0127 1a03          	or	a,(OFST+0,sp)
 832  0129 ca526f        	or	a,21103
 833  012c c7526f        	ld	21103,a
 834                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 836  012f 7b09          	ld	a,(OFST+6,sp)
 837  0131 c75265        	ld	21093,a
 838                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 840  0134 7b0a          	ld	a,(OFST+7,sp)
 841  0136 c75266        	ld	21094,a
 842                     ; 196 }
 845  0139 5b05          	addw	sp,#5
 846  013b 81            	ret
 949                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 949                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 949                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 949                     ; 220                   uint16_t TIM1_Pulse,
 949                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 949                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 949                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 949                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 949                     ; 225 {
 950                     .text:	section	.text,new
 951  0000               _TIM1_OC2Init:
 953  0000 89            	pushw	x
 954  0001 5203          	subw	sp,#3
 955       00000003      OFST:	set	3
 958                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 960  0003 9e            	ld	a,xh
 961  0004 4d            	tnz	a
 962  0005 2719          	jreq	L67
 963  0007 9e            	ld	a,xh
 964  0008 a110          	cp	a,#16
 965  000a 2714          	jreq	L67
 966  000c 9e            	ld	a,xh
 967  000d a120          	cp	a,#32
 968  000f 270f          	jreq	L67
 969  0011 9e            	ld	a,xh
 970  0012 a130          	cp	a,#48
 971  0014 270a          	jreq	L67
 972  0016 9e            	ld	a,xh
 973  0017 a160          	cp	a,#96
 974  0019 2705          	jreq	L67
 975  001b 9e            	ld	a,xh
 976  001c a170          	cp	a,#112
 977  001e 2603          	jrne	L47
 978  0020               L67:
 979  0020 4f            	clr	a
 980  0021 2010          	jra	L001
 981  0023               L47:
 982  0023 ae00e3        	ldw	x,#227
 983  0026 89            	pushw	x
 984  0027 ae0000        	ldw	x,#0
 985  002a 89            	pushw	x
 986  002b ae0000        	ldw	x,#L37
 987  002e cd0000        	call	_assert_failed
 989  0031 5b04          	addw	sp,#4
 990  0033               L001:
 991                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 993  0033 0d05          	tnz	(OFST+2,sp)
 994  0035 2706          	jreq	L401
 995  0037 7b05          	ld	a,(OFST+2,sp)
 996  0039 a111          	cp	a,#17
 997  003b 2603          	jrne	L201
 998  003d               L401:
 999  003d 4f            	clr	a
1000  003e 2010          	jra	L601
1001  0040               L201:
1002  0040 ae00e4        	ldw	x,#228
1003  0043 89            	pushw	x
1004  0044 ae0000        	ldw	x,#0
1005  0047 89            	pushw	x
1006  0048 ae0000        	ldw	x,#L37
1007  004b cd0000        	call	_assert_failed
1009  004e 5b04          	addw	sp,#4
1010  0050               L601:
1011                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1013  0050 0d08          	tnz	(OFST+5,sp)
1014  0052 2706          	jreq	L211
1015  0054 7b08          	ld	a,(OFST+5,sp)
1016  0056 a144          	cp	a,#68
1017  0058 2603          	jrne	L011
1018  005a               L211:
1019  005a 4f            	clr	a
1020  005b 2010          	jra	L411
1021  005d               L011:
1022  005d ae00e5        	ldw	x,#229
1023  0060 89            	pushw	x
1024  0061 ae0000        	ldw	x,#0
1025  0064 89            	pushw	x
1026  0065 ae0000        	ldw	x,#L37
1027  0068 cd0000        	call	_assert_failed
1029  006b 5b04          	addw	sp,#4
1030  006d               L411:
1031                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1033  006d 0d0b          	tnz	(OFST+8,sp)
1034  006f 2706          	jreq	L021
1035  0071 7b0b          	ld	a,(OFST+8,sp)
1036  0073 a122          	cp	a,#34
1037  0075 2603          	jrne	L611
1038  0077               L021:
1039  0077 4f            	clr	a
1040  0078 2010          	jra	L221
1041  007a               L611:
1042  007a ae00e6        	ldw	x,#230
1043  007d 89            	pushw	x
1044  007e ae0000        	ldw	x,#0
1045  0081 89            	pushw	x
1046  0082 ae0000        	ldw	x,#L37
1047  0085 cd0000        	call	_assert_failed
1049  0088 5b04          	addw	sp,#4
1050  008a               L221:
1051                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1053  008a 0d0c          	tnz	(OFST+9,sp)
1054  008c 2706          	jreq	L621
1055  008e 7b0c          	ld	a,(OFST+9,sp)
1056  0090 a188          	cp	a,#136
1057  0092 2603          	jrne	L421
1058  0094               L621:
1059  0094 4f            	clr	a
1060  0095 2010          	jra	L031
1061  0097               L421:
1062  0097 ae00e7        	ldw	x,#231
1063  009a 89            	pushw	x
1064  009b ae0000        	ldw	x,#0
1065  009e 89            	pushw	x
1066  009f ae0000        	ldw	x,#L37
1067  00a2 cd0000        	call	_assert_failed
1069  00a5 5b04          	addw	sp,#4
1070  00a7               L031:
1071                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1073  00a7 7b0d          	ld	a,(OFST+10,sp)
1074  00a9 a155          	cp	a,#85
1075  00ab 2704          	jreq	L431
1076  00ad 0d0d          	tnz	(OFST+10,sp)
1077  00af 2603          	jrne	L231
1078  00b1               L431:
1079  00b1 4f            	clr	a
1080  00b2 2010          	jra	L631
1081  00b4               L231:
1082  00b4 ae00e8        	ldw	x,#232
1083  00b7 89            	pushw	x
1084  00b8 ae0000        	ldw	x,#0
1085  00bb 89            	pushw	x
1086  00bc ae0000        	ldw	x,#L37
1087  00bf cd0000        	call	_assert_failed
1089  00c2 5b04          	addw	sp,#4
1090  00c4               L631:
1091                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1093  00c4 7b0e          	ld	a,(OFST+11,sp)
1094  00c6 a12a          	cp	a,#42
1095  00c8 2704          	jreq	L241
1096  00ca 0d0e          	tnz	(OFST+11,sp)
1097  00cc 2603          	jrne	L041
1098  00ce               L241:
1099  00ce 4f            	clr	a
1100  00cf 2010          	jra	L441
1101  00d1               L041:
1102  00d1 ae00e9        	ldw	x,#233
1103  00d4 89            	pushw	x
1104  00d5 ae0000        	ldw	x,#0
1105  00d8 89            	pushw	x
1106  00d9 ae0000        	ldw	x,#L37
1107  00dc cd0000        	call	_assert_failed
1109  00df 5b04          	addw	sp,#4
1110  00e1               L441:
1111                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1111                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1113  00e1 c6525c        	ld	a,21084
1114  00e4 a40f          	and	a,#15
1115  00e6 c7525c        	ld	21084,a
1116                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1116                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1116                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1116                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1118  00e9 7b0c          	ld	a,(OFST+9,sp)
1119  00eb a480          	and	a,#128
1120  00ed 6b03          	ld	(OFST+0,sp),a
1122  00ef 7b0b          	ld	a,(OFST+8,sp)
1123  00f1 a420          	and	a,#32
1124  00f3 1a03          	or	a,(OFST+0,sp)
1125  00f5 6b02          	ld	(OFST-1,sp),a
1127  00f7 7b08          	ld	a,(OFST+5,sp)
1128  00f9 a440          	and	a,#64
1129  00fb 6b01          	ld	(OFST-2,sp),a
1131  00fd 7b05          	ld	a,(OFST+2,sp)
1132  00ff a410          	and	a,#16
1133  0101 1a01          	or	a,(OFST-2,sp)
1134  0103 1a02          	or	a,(OFST-1,sp)
1135  0105 ca525c        	or	a,21084
1136  0108 c7525c        	ld	21084,a
1137                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1137                     ; 249                           (uint8_t)TIM1_OCMode);
1139  010b c65259        	ld	a,21081
1140  010e a48f          	and	a,#143
1141  0110 1a04          	or	a,(OFST+1,sp)
1142  0112 c75259        	ld	21081,a
1143                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1145  0115 c6526f        	ld	a,21103
1146  0118 a4f3          	and	a,#243
1147  011a c7526f        	ld	21103,a
1148                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1148                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1150  011d 7b0e          	ld	a,(OFST+11,sp)
1151  011f a408          	and	a,#8
1152  0121 6b03          	ld	(OFST+0,sp),a
1154  0123 7b0d          	ld	a,(OFST+10,sp)
1155  0125 a404          	and	a,#4
1156  0127 1a03          	or	a,(OFST+0,sp)
1157  0129 ca526f        	or	a,21103
1158  012c c7526f        	ld	21103,a
1159                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1161  012f 7b09          	ld	a,(OFST+6,sp)
1162  0131 c75267        	ld	21095,a
1163                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1165  0134 7b0a          	ld	a,(OFST+7,sp)
1166  0136 c75268        	ld	21096,a
1167                     ; 260 }
1170  0139 5b05          	addw	sp,#5
1171  013b 81            	ret
1274                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1274                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1274                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1274                     ; 284                   uint16_t TIM1_Pulse,
1274                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1274                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1274                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1274                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1274                     ; 289 {
1275                     .text:	section	.text,new
1276  0000               _TIM1_OC3Init:
1278  0000 89            	pushw	x
1279  0001 5203          	subw	sp,#3
1280       00000003      OFST:	set	3
1283                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1285  0003 9e            	ld	a,xh
1286  0004 4d            	tnz	a
1287  0005 2719          	jreq	L251
1288  0007 9e            	ld	a,xh
1289  0008 a110          	cp	a,#16
1290  000a 2714          	jreq	L251
1291  000c 9e            	ld	a,xh
1292  000d a120          	cp	a,#32
1293  000f 270f          	jreq	L251
1294  0011 9e            	ld	a,xh
1295  0012 a130          	cp	a,#48
1296  0014 270a          	jreq	L251
1297  0016 9e            	ld	a,xh
1298  0017 a160          	cp	a,#96
1299  0019 2705          	jreq	L251
1300  001b 9e            	ld	a,xh
1301  001c a170          	cp	a,#112
1302  001e 2603          	jrne	L051
1303  0020               L251:
1304  0020 4f            	clr	a
1305  0021 2010          	jra	L451
1306  0023               L051:
1307  0023 ae0123        	ldw	x,#291
1308  0026 89            	pushw	x
1309  0027 ae0000        	ldw	x,#0
1310  002a 89            	pushw	x
1311  002b ae0000        	ldw	x,#L37
1312  002e cd0000        	call	_assert_failed
1314  0031 5b04          	addw	sp,#4
1315  0033               L451:
1316                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1318  0033 0d05          	tnz	(OFST+2,sp)
1319  0035 2706          	jreq	L061
1320  0037 7b05          	ld	a,(OFST+2,sp)
1321  0039 a111          	cp	a,#17
1322  003b 2603          	jrne	L651
1323  003d               L061:
1324  003d 4f            	clr	a
1325  003e 2010          	jra	L261
1326  0040               L651:
1327  0040 ae0124        	ldw	x,#292
1328  0043 89            	pushw	x
1329  0044 ae0000        	ldw	x,#0
1330  0047 89            	pushw	x
1331  0048 ae0000        	ldw	x,#L37
1332  004b cd0000        	call	_assert_failed
1334  004e 5b04          	addw	sp,#4
1335  0050               L261:
1336                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1338  0050 0d08          	tnz	(OFST+5,sp)
1339  0052 2706          	jreq	L661
1340  0054 7b08          	ld	a,(OFST+5,sp)
1341  0056 a144          	cp	a,#68
1342  0058 2603          	jrne	L461
1343  005a               L661:
1344  005a 4f            	clr	a
1345  005b 2010          	jra	L071
1346  005d               L461:
1347  005d ae0125        	ldw	x,#293
1348  0060 89            	pushw	x
1349  0061 ae0000        	ldw	x,#0
1350  0064 89            	pushw	x
1351  0065 ae0000        	ldw	x,#L37
1352  0068 cd0000        	call	_assert_failed
1354  006b 5b04          	addw	sp,#4
1355  006d               L071:
1356                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1358  006d 0d0b          	tnz	(OFST+8,sp)
1359  006f 2706          	jreq	L471
1360  0071 7b0b          	ld	a,(OFST+8,sp)
1361  0073 a122          	cp	a,#34
1362  0075 2603          	jrne	L271
1363  0077               L471:
1364  0077 4f            	clr	a
1365  0078 2010          	jra	L671
1366  007a               L271:
1367  007a ae0126        	ldw	x,#294
1368  007d 89            	pushw	x
1369  007e ae0000        	ldw	x,#0
1370  0081 89            	pushw	x
1371  0082 ae0000        	ldw	x,#L37
1372  0085 cd0000        	call	_assert_failed
1374  0088 5b04          	addw	sp,#4
1375  008a               L671:
1376                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1378  008a 0d0c          	tnz	(OFST+9,sp)
1379  008c 2706          	jreq	L202
1380  008e 7b0c          	ld	a,(OFST+9,sp)
1381  0090 a188          	cp	a,#136
1382  0092 2603          	jrne	L002
1383  0094               L202:
1384  0094 4f            	clr	a
1385  0095 2010          	jra	L402
1386  0097               L002:
1387  0097 ae0127        	ldw	x,#295
1388  009a 89            	pushw	x
1389  009b ae0000        	ldw	x,#0
1390  009e 89            	pushw	x
1391  009f ae0000        	ldw	x,#L37
1392  00a2 cd0000        	call	_assert_failed
1394  00a5 5b04          	addw	sp,#4
1395  00a7               L402:
1396                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1398  00a7 7b0d          	ld	a,(OFST+10,sp)
1399  00a9 a155          	cp	a,#85
1400  00ab 2704          	jreq	L012
1401  00ad 0d0d          	tnz	(OFST+10,sp)
1402  00af 2603          	jrne	L602
1403  00b1               L012:
1404  00b1 4f            	clr	a
1405  00b2 2010          	jra	L212
1406  00b4               L602:
1407  00b4 ae0128        	ldw	x,#296
1408  00b7 89            	pushw	x
1409  00b8 ae0000        	ldw	x,#0
1410  00bb 89            	pushw	x
1411  00bc ae0000        	ldw	x,#L37
1412  00bf cd0000        	call	_assert_failed
1414  00c2 5b04          	addw	sp,#4
1415  00c4               L212:
1416                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1418  00c4 7b0e          	ld	a,(OFST+11,sp)
1419  00c6 a12a          	cp	a,#42
1420  00c8 2704          	jreq	L612
1421  00ca 0d0e          	tnz	(OFST+11,sp)
1422  00cc 2603          	jrne	L412
1423  00ce               L612:
1424  00ce 4f            	clr	a
1425  00cf 2010          	jra	L022
1426  00d1               L412:
1427  00d1 ae0129        	ldw	x,#297
1428  00d4 89            	pushw	x
1429  00d5 ae0000        	ldw	x,#0
1430  00d8 89            	pushw	x
1431  00d9 ae0000        	ldw	x,#L37
1432  00dc cd0000        	call	_assert_failed
1434  00df 5b04          	addw	sp,#4
1435  00e1               L022:
1436                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1436                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1438  00e1 c6525d        	ld	a,21085
1439  00e4 a4f0          	and	a,#240
1440  00e6 c7525d        	ld	21085,a
1441                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1441                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1441                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1441                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1443  00e9 7b0c          	ld	a,(OFST+9,sp)
1444  00eb a408          	and	a,#8
1445  00ed 6b03          	ld	(OFST+0,sp),a
1447  00ef 7b0b          	ld	a,(OFST+8,sp)
1448  00f1 a402          	and	a,#2
1449  00f3 1a03          	or	a,(OFST+0,sp)
1450  00f5 6b02          	ld	(OFST-1,sp),a
1452  00f7 7b08          	ld	a,(OFST+5,sp)
1453  00f9 a404          	and	a,#4
1454  00fb 6b01          	ld	(OFST-2,sp),a
1456  00fd 7b05          	ld	a,(OFST+2,sp)
1457  00ff a401          	and	a,#1
1458  0101 1a01          	or	a,(OFST-2,sp)
1459  0103 1a02          	or	a,(OFST-1,sp)
1460  0105 ca525d        	or	a,21085
1461  0108 c7525d        	ld	21085,a
1462                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1462                     ; 312                           (uint8_t)TIM1_OCMode);
1464  010b c6525a        	ld	a,21082
1465  010e a48f          	and	a,#143
1466  0110 1a04          	or	a,(OFST+1,sp)
1467  0112 c7525a        	ld	21082,a
1468                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1470  0115 c6526f        	ld	a,21103
1471  0118 a4cf          	and	a,#207
1472  011a c7526f        	ld	21103,a
1473                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1473                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1475  011d 7b0e          	ld	a,(OFST+11,sp)
1476  011f a420          	and	a,#32
1477  0121 6b03          	ld	(OFST+0,sp),a
1479  0123 7b0d          	ld	a,(OFST+10,sp)
1480  0125 a410          	and	a,#16
1481  0127 1a03          	or	a,(OFST+0,sp)
1482  0129 ca526f        	or	a,21103
1483  012c c7526f        	ld	21103,a
1484                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1486  012f 7b09          	ld	a,(OFST+6,sp)
1487  0131 c75269        	ld	21097,a
1488                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1490  0134 7b0a          	ld	a,(OFST+7,sp)
1491  0136 c7526a        	ld	21098,a
1492                     ; 323 }
1495  0139 5b05          	addw	sp,#5
1496  013b 81            	ret
1569                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1569                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1569                     ; 340                   uint16_t TIM1_Pulse,
1569                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1569                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1569                     ; 343 {
1570                     .text:	section	.text,new
1571  0000               _TIM1_OC4Init:
1573  0000 89            	pushw	x
1574  0001 88            	push	a
1575       00000001      OFST:	set	1
1578                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1580  0002 9e            	ld	a,xh
1581  0003 4d            	tnz	a
1582  0004 2719          	jreq	L622
1583  0006 9e            	ld	a,xh
1584  0007 a110          	cp	a,#16
1585  0009 2714          	jreq	L622
1586  000b 9e            	ld	a,xh
1587  000c a120          	cp	a,#32
1588  000e 270f          	jreq	L622
1589  0010 9e            	ld	a,xh
1590  0011 a130          	cp	a,#48
1591  0013 270a          	jreq	L622
1592  0015 9e            	ld	a,xh
1593  0016 a160          	cp	a,#96
1594  0018 2705          	jreq	L622
1595  001a 9e            	ld	a,xh
1596  001b a170          	cp	a,#112
1597  001d 2603          	jrne	L422
1598  001f               L622:
1599  001f 4f            	clr	a
1600  0020 2010          	jra	L032
1601  0022               L422:
1602  0022 ae0159        	ldw	x,#345
1603  0025 89            	pushw	x
1604  0026 ae0000        	ldw	x,#0
1605  0029 89            	pushw	x
1606  002a ae0000        	ldw	x,#L37
1607  002d cd0000        	call	_assert_failed
1609  0030 5b04          	addw	sp,#4
1610  0032               L032:
1611                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1613  0032 0d03          	tnz	(OFST+2,sp)
1614  0034 2706          	jreq	L432
1615  0036 7b03          	ld	a,(OFST+2,sp)
1616  0038 a111          	cp	a,#17
1617  003a 2603          	jrne	L232
1618  003c               L432:
1619  003c 4f            	clr	a
1620  003d 2010          	jra	L632
1621  003f               L232:
1622  003f ae015a        	ldw	x,#346
1623  0042 89            	pushw	x
1624  0043 ae0000        	ldw	x,#0
1625  0046 89            	pushw	x
1626  0047 ae0000        	ldw	x,#L37
1627  004a cd0000        	call	_assert_failed
1629  004d 5b04          	addw	sp,#4
1630  004f               L632:
1631                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1633  004f 0d08          	tnz	(OFST+7,sp)
1634  0051 2706          	jreq	L242
1635  0053 7b08          	ld	a,(OFST+7,sp)
1636  0055 a122          	cp	a,#34
1637  0057 2603          	jrne	L042
1638  0059               L242:
1639  0059 4f            	clr	a
1640  005a 2010          	jra	L442
1641  005c               L042:
1642  005c ae015b        	ldw	x,#347
1643  005f 89            	pushw	x
1644  0060 ae0000        	ldw	x,#0
1645  0063 89            	pushw	x
1646  0064 ae0000        	ldw	x,#L37
1647  0067 cd0000        	call	_assert_failed
1649  006a 5b04          	addw	sp,#4
1650  006c               L442:
1651                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1653  006c 7b09          	ld	a,(OFST+8,sp)
1654  006e a155          	cp	a,#85
1655  0070 2704          	jreq	L052
1656  0072 0d09          	tnz	(OFST+8,sp)
1657  0074 2603          	jrne	L642
1658  0076               L052:
1659  0076 4f            	clr	a
1660  0077 2010          	jra	L252
1661  0079               L642:
1662  0079 ae015c        	ldw	x,#348
1663  007c 89            	pushw	x
1664  007d ae0000        	ldw	x,#0
1665  0080 89            	pushw	x
1666  0081 ae0000        	ldw	x,#L37
1667  0084 cd0000        	call	_assert_failed
1669  0087 5b04          	addw	sp,#4
1670  0089               L252:
1671                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1673  0089 c6525d        	ld	a,21085
1674  008c a4cf          	and	a,#207
1675  008e c7525d        	ld	21085,a
1676                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1676                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1678  0091 7b08          	ld	a,(OFST+7,sp)
1679  0093 a420          	and	a,#32
1680  0095 6b01          	ld	(OFST+0,sp),a
1682  0097 7b03          	ld	a,(OFST+2,sp)
1683  0099 a410          	and	a,#16
1684  009b 1a01          	or	a,(OFST+0,sp)
1685  009d ca525d        	or	a,21085
1686  00a0 c7525d        	ld	21085,a
1687                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1687                     ; 358                           TIM1_OCMode);
1689  00a3 c6525b        	ld	a,21083
1690  00a6 a48f          	and	a,#143
1691  00a8 1a02          	or	a,(OFST+1,sp)
1692  00aa c7525b        	ld	21083,a
1693                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1695  00ad 0d09          	tnz	(OFST+8,sp)
1696  00af 270a          	jreq	L124
1697                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1699  00b1 c6526f        	ld	a,21103
1700  00b4 aadf          	or	a,#223
1701  00b6 c7526f        	ld	21103,a
1703  00b9 2004          	jra	L324
1704  00bb               L124:
1705                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1707  00bb 721d526f      	bres	21103,#6
1708  00bf               L324:
1709                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1711  00bf 7b06          	ld	a,(OFST+5,sp)
1712  00c1 c7526b        	ld	21099,a
1713                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1715  00c4 7b07          	ld	a,(OFST+6,sp)
1716  00c6 c7526c        	ld	21100,a
1717                     ; 373 }
1720  00c9 5b03          	addw	sp,#3
1721  00cb 81            	ret
1925                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1925                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1925                     ; 390                      uint8_t TIM1_DeadTime,
1925                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1925                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1925                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1925                     ; 394 {
1926                     .text:	section	.text,new
1927  0000               _TIM1_BDTRConfig:
1929  0000 89            	pushw	x
1930  0001 88            	push	a
1931       00000001      OFST:	set	1
1934                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1936  0002 9e            	ld	a,xh
1937  0003 a104          	cp	a,#4
1938  0005 2704          	jreq	L062
1939  0007 9e            	ld	a,xh
1940  0008 4d            	tnz	a
1941  0009 2603          	jrne	L652
1942  000b               L062:
1943  000b 4f            	clr	a
1944  000c 2010          	jra	L262
1945  000e               L652:
1946  000e ae018c        	ldw	x,#396
1947  0011 89            	pushw	x
1948  0012 ae0000        	ldw	x,#0
1949  0015 89            	pushw	x
1950  0016 ae0000        	ldw	x,#L37
1951  0019 cd0000        	call	_assert_failed
1953  001c 5b04          	addw	sp,#4
1954  001e               L262:
1955                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1957  001e 0d03          	tnz	(OFST+2,sp)
1958  0020 2712          	jreq	L662
1959  0022 7b03          	ld	a,(OFST+2,sp)
1960  0024 a101          	cp	a,#1
1961  0026 270c          	jreq	L662
1962  0028 7b03          	ld	a,(OFST+2,sp)
1963  002a a102          	cp	a,#2
1964  002c 2706          	jreq	L662
1965  002e 7b03          	ld	a,(OFST+2,sp)
1966  0030 a103          	cp	a,#3
1967  0032 2603          	jrne	L462
1968  0034               L662:
1969  0034 4f            	clr	a
1970  0035 2010          	jra	L072
1971  0037               L462:
1972  0037 ae018d        	ldw	x,#397
1973  003a 89            	pushw	x
1974  003b ae0000        	ldw	x,#0
1975  003e 89            	pushw	x
1976  003f ae0000        	ldw	x,#L37
1977  0042 cd0000        	call	_assert_failed
1979  0045 5b04          	addw	sp,#4
1980  0047               L072:
1981                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1983  0047 7b07          	ld	a,(OFST+6,sp)
1984  0049 a110          	cp	a,#16
1985  004b 2704          	jreq	L472
1986  004d 0d07          	tnz	(OFST+6,sp)
1987  004f 2603          	jrne	L272
1988  0051               L472:
1989  0051 4f            	clr	a
1990  0052 2010          	jra	L672
1991  0054               L272:
1992  0054 ae018e        	ldw	x,#398
1993  0057 89            	pushw	x
1994  0058 ae0000        	ldw	x,#0
1995  005b 89            	pushw	x
1996  005c ae0000        	ldw	x,#L37
1997  005f cd0000        	call	_assert_failed
1999  0062 5b04          	addw	sp,#4
2000  0064               L672:
2001                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
2003  0064 0d08          	tnz	(OFST+7,sp)
2004  0066 2706          	jreq	L203
2005  0068 7b08          	ld	a,(OFST+7,sp)
2006  006a a120          	cp	a,#32
2007  006c 2603          	jrne	L003
2008  006e               L203:
2009  006e 4f            	clr	a
2010  006f 2010          	jra	L403
2011  0071               L003:
2012  0071 ae018f        	ldw	x,#399
2013  0074 89            	pushw	x
2014  0075 ae0000        	ldw	x,#0
2015  0078 89            	pushw	x
2016  0079 ae0000        	ldw	x,#L37
2017  007c cd0000        	call	_assert_failed
2019  007f 5b04          	addw	sp,#4
2020  0081               L403:
2021                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
2023  0081 7b09          	ld	a,(OFST+8,sp)
2024  0083 a140          	cp	a,#64
2025  0085 2704          	jreq	L013
2026  0087 0d09          	tnz	(OFST+8,sp)
2027  0089 2603          	jrne	L603
2028  008b               L013:
2029  008b 4f            	clr	a
2030  008c 2010          	jra	L213
2031  008e               L603:
2032  008e ae0190        	ldw	x,#400
2033  0091 89            	pushw	x
2034  0092 ae0000        	ldw	x,#0
2035  0095 89            	pushw	x
2036  0096 ae0000        	ldw	x,#L37
2037  0099 cd0000        	call	_assert_failed
2039  009c 5b04          	addw	sp,#4
2040  009e               L213:
2041                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2043  009e 7b06          	ld	a,(OFST+5,sp)
2044  00a0 c7526e        	ld	21102,a
2045                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2045                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2045                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
2047  00a3 7b07          	ld	a,(OFST+6,sp)
2048  00a5 1a08          	or	a,(OFST+7,sp)
2049  00a7 1a09          	or	a,(OFST+8,sp)
2050  00a9 6b01          	ld	(OFST+0,sp),a
2052  00ab 7b02          	ld	a,(OFST+1,sp)
2053  00ad 1a03          	or	a,(OFST+2,sp)
2054  00af 1a01          	or	a,(OFST+0,sp)
2055  00b1 c7526d        	ld	21101,a
2056                     ; 409 }
2059  00b4 5b03          	addw	sp,#3
2060  00b6 81            	ret
2261                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2261                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2261                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2261                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2261                     ; 427                  uint8_t TIM1_ICFilter)
2261                     ; 428 {
2262                     .text:	section	.text,new
2263  0000               _TIM1_ICInit:
2265  0000 89            	pushw	x
2266       00000000      OFST:	set	0
2269                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2271  0001 9e            	ld	a,xh
2272  0002 4d            	tnz	a
2273  0003 270f          	jreq	L023
2274  0005 9e            	ld	a,xh
2275  0006 a101          	cp	a,#1
2276  0008 270a          	jreq	L023
2277  000a 9e            	ld	a,xh
2278  000b a102          	cp	a,#2
2279  000d 2705          	jreq	L023
2280  000f 9e            	ld	a,xh
2281  0010 a103          	cp	a,#3
2282  0012 2603          	jrne	L613
2283  0014               L023:
2284  0014 4f            	clr	a
2285  0015 2010          	jra	L223
2286  0017               L613:
2287  0017 ae01ae        	ldw	x,#430
2288  001a 89            	pushw	x
2289  001b ae0000        	ldw	x,#0
2290  001e 89            	pushw	x
2291  001f ae0000        	ldw	x,#L37
2292  0022 cd0000        	call	_assert_failed
2294  0025 5b04          	addw	sp,#4
2295  0027               L223:
2296                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2298  0027 0d02          	tnz	(OFST+2,sp)
2299  0029 2706          	jreq	L623
2300  002b 7b02          	ld	a,(OFST+2,sp)
2301  002d a101          	cp	a,#1
2302  002f 2603          	jrne	L423
2303  0031               L623:
2304  0031 4f            	clr	a
2305  0032 2010          	jra	L033
2306  0034               L423:
2307  0034 ae01af        	ldw	x,#431
2308  0037 89            	pushw	x
2309  0038 ae0000        	ldw	x,#0
2310  003b 89            	pushw	x
2311  003c ae0000        	ldw	x,#L37
2312  003f cd0000        	call	_assert_failed
2314  0042 5b04          	addw	sp,#4
2315  0044               L033:
2316                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2318  0044 7b05          	ld	a,(OFST+5,sp)
2319  0046 a101          	cp	a,#1
2320  0048 270c          	jreq	L433
2321  004a 7b05          	ld	a,(OFST+5,sp)
2322  004c a102          	cp	a,#2
2323  004e 2706          	jreq	L433
2324  0050 7b05          	ld	a,(OFST+5,sp)
2325  0052 a103          	cp	a,#3
2326  0054 2603          	jrne	L233
2327  0056               L433:
2328  0056 4f            	clr	a
2329  0057 2010          	jra	L633
2330  0059               L233:
2331  0059 ae01b0        	ldw	x,#432
2332  005c 89            	pushw	x
2333  005d ae0000        	ldw	x,#0
2334  0060 89            	pushw	x
2335  0061 ae0000        	ldw	x,#L37
2336  0064 cd0000        	call	_assert_failed
2338  0067 5b04          	addw	sp,#4
2339  0069               L633:
2340                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2342  0069 0d06          	tnz	(OFST+6,sp)
2343  006b 2712          	jreq	L243
2344  006d 7b06          	ld	a,(OFST+6,sp)
2345  006f a104          	cp	a,#4
2346  0071 270c          	jreq	L243
2347  0073 7b06          	ld	a,(OFST+6,sp)
2348  0075 a108          	cp	a,#8
2349  0077 2706          	jreq	L243
2350  0079 7b06          	ld	a,(OFST+6,sp)
2351  007b a10c          	cp	a,#12
2352  007d 2603          	jrne	L043
2353  007f               L243:
2354  007f 4f            	clr	a
2355  0080 2010          	jra	L443
2356  0082               L043:
2357  0082 ae01b1        	ldw	x,#433
2358  0085 89            	pushw	x
2359  0086 ae0000        	ldw	x,#0
2360  0089 89            	pushw	x
2361  008a ae0000        	ldw	x,#L37
2362  008d cd0000        	call	_assert_failed
2364  0090 5b04          	addw	sp,#4
2365  0092               L443:
2366                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2368  0092 7b07          	ld	a,(OFST+7,sp)
2369  0094 a110          	cp	a,#16
2370  0096 2403          	jruge	L643
2371  0098 4f            	clr	a
2372  0099 2010          	jra	L053
2373  009b               L643:
2374  009b ae01b2        	ldw	x,#434
2375  009e 89            	pushw	x
2376  009f ae0000        	ldw	x,#0
2377  00a2 89            	pushw	x
2378  00a3 ae0000        	ldw	x,#L37
2379  00a6 cd0000        	call	_assert_failed
2381  00a9 5b04          	addw	sp,#4
2382  00ab               L053:
2383                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2385  00ab 0d01          	tnz	(OFST+1,sp)
2386  00ad 2614          	jrne	L746
2387                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2387                     ; 440                (uint8_t)TIM1_ICSelection,
2387                     ; 441                (uint8_t)TIM1_ICFilter);
2389  00af 7b07          	ld	a,(OFST+7,sp)
2390  00b1 88            	push	a
2391  00b2 7b06          	ld	a,(OFST+6,sp)
2392  00b4 97            	ld	xl,a
2393  00b5 7b03          	ld	a,(OFST+3,sp)
2394  00b7 95            	ld	xh,a
2395  00b8 cd0000        	call	L3_TI1_Config
2397  00bb 84            	pop	a
2398                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2400  00bc 7b06          	ld	a,(OFST+6,sp)
2401  00be cd0000        	call	_TIM1_SetIC1Prescaler
2404  00c1 2046          	jra	L156
2405  00c3               L746:
2406                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2408  00c3 7b01          	ld	a,(OFST+1,sp)
2409  00c5 a101          	cp	a,#1
2410  00c7 2614          	jrne	L356
2411                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2411                     ; 449                (uint8_t)TIM1_ICSelection,
2411                     ; 450                (uint8_t)TIM1_ICFilter);
2413  00c9 7b07          	ld	a,(OFST+7,sp)
2414  00cb 88            	push	a
2415  00cc 7b06          	ld	a,(OFST+6,sp)
2416  00ce 97            	ld	xl,a
2417  00cf 7b03          	ld	a,(OFST+3,sp)
2418  00d1 95            	ld	xh,a
2419  00d2 cd0000        	call	L5_TI2_Config
2421  00d5 84            	pop	a
2422                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2424  00d6 7b06          	ld	a,(OFST+6,sp)
2425  00d8 cd0000        	call	_TIM1_SetIC2Prescaler
2428  00db 202c          	jra	L156
2429  00dd               L356:
2430                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2432  00dd 7b01          	ld	a,(OFST+1,sp)
2433  00df a102          	cp	a,#2
2434  00e1 2614          	jrne	L756
2435                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2435                     ; 458                (uint8_t)TIM1_ICSelection,
2435                     ; 459                (uint8_t)TIM1_ICFilter);
2437  00e3 7b07          	ld	a,(OFST+7,sp)
2438  00e5 88            	push	a
2439  00e6 7b06          	ld	a,(OFST+6,sp)
2440  00e8 97            	ld	xl,a
2441  00e9 7b03          	ld	a,(OFST+3,sp)
2442  00eb 95            	ld	xh,a
2443  00ec cd0000        	call	L7_TI3_Config
2445  00ef 84            	pop	a
2446                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2448  00f0 7b06          	ld	a,(OFST+6,sp)
2449  00f2 cd0000        	call	_TIM1_SetIC3Prescaler
2452  00f5 2012          	jra	L156
2453  00f7               L756:
2454                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2454                     ; 467                (uint8_t)TIM1_ICSelection,
2454                     ; 468                (uint8_t)TIM1_ICFilter);
2456  00f7 7b07          	ld	a,(OFST+7,sp)
2457  00f9 88            	push	a
2458  00fa 7b06          	ld	a,(OFST+6,sp)
2459  00fc 97            	ld	xl,a
2460  00fd 7b03          	ld	a,(OFST+3,sp)
2461  00ff 95            	ld	xh,a
2462  0100 cd0000        	call	L11_TI4_Config
2464  0103 84            	pop	a
2465                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2467  0104 7b06          	ld	a,(OFST+6,sp)
2468  0106 cd0000        	call	_TIM1_SetIC4Prescaler
2470  0109               L156:
2471                     ; 472 }
2474  0109 85            	popw	x
2475  010a 81            	ret
2566                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2566                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2566                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2566                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2566                     ; 492                      uint8_t TIM1_ICFilter)
2566                     ; 493 {
2567                     .text:	section	.text,new
2568  0000               _TIM1_PWMIConfig:
2570  0000 89            	pushw	x
2571  0001 89            	pushw	x
2572       00000002      OFST:	set	2
2575                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2577                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2579                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2581  0002 9e            	ld	a,xh
2582  0003 4d            	tnz	a
2583  0004 2705          	jreq	L653
2584  0006 9e            	ld	a,xh
2585  0007 a101          	cp	a,#1
2586  0009 2603          	jrne	L453
2587  000b               L653:
2588  000b 4f            	clr	a
2589  000c 2010          	jra	L063
2590  000e               L453:
2591  000e ae01f2        	ldw	x,#498
2592  0011 89            	pushw	x
2593  0012 ae0000        	ldw	x,#0
2594  0015 89            	pushw	x
2595  0016 ae0000        	ldw	x,#L37
2596  0019 cd0000        	call	_assert_failed
2598  001c 5b04          	addw	sp,#4
2599  001e               L063:
2600                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2602  001e 0d04          	tnz	(OFST+2,sp)
2603  0020 2706          	jreq	L463
2604  0022 7b04          	ld	a,(OFST+2,sp)
2605  0024 a101          	cp	a,#1
2606  0026 2603          	jrne	L263
2607  0028               L463:
2608  0028 4f            	clr	a
2609  0029 2010          	jra	L663
2610  002b               L263:
2611  002b ae01f3        	ldw	x,#499
2612  002e 89            	pushw	x
2613  002f ae0000        	ldw	x,#0
2614  0032 89            	pushw	x
2615  0033 ae0000        	ldw	x,#L37
2616  0036 cd0000        	call	_assert_failed
2618  0039 5b04          	addw	sp,#4
2619  003b               L663:
2620                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2622  003b 7b07          	ld	a,(OFST+5,sp)
2623  003d a101          	cp	a,#1
2624  003f 270c          	jreq	L273
2625  0041 7b07          	ld	a,(OFST+5,sp)
2626  0043 a102          	cp	a,#2
2627  0045 2706          	jreq	L273
2628  0047 7b07          	ld	a,(OFST+5,sp)
2629  0049 a103          	cp	a,#3
2630  004b 2603          	jrne	L073
2631  004d               L273:
2632  004d 4f            	clr	a
2633  004e 2010          	jra	L473
2634  0050               L073:
2635  0050 ae01f4        	ldw	x,#500
2636  0053 89            	pushw	x
2637  0054 ae0000        	ldw	x,#0
2638  0057 89            	pushw	x
2639  0058 ae0000        	ldw	x,#L37
2640  005b cd0000        	call	_assert_failed
2642  005e 5b04          	addw	sp,#4
2643  0060               L473:
2644                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2646  0060 0d08          	tnz	(OFST+6,sp)
2647  0062 2712          	jreq	L004
2648  0064 7b08          	ld	a,(OFST+6,sp)
2649  0066 a104          	cp	a,#4
2650  0068 270c          	jreq	L004
2651  006a 7b08          	ld	a,(OFST+6,sp)
2652  006c a108          	cp	a,#8
2653  006e 2706          	jreq	L004
2654  0070 7b08          	ld	a,(OFST+6,sp)
2655  0072 a10c          	cp	a,#12
2656  0074 2603          	jrne	L673
2657  0076               L004:
2658  0076 4f            	clr	a
2659  0077 2010          	jra	L204
2660  0079               L673:
2661  0079 ae01f5        	ldw	x,#501
2662  007c 89            	pushw	x
2663  007d ae0000        	ldw	x,#0
2664  0080 89            	pushw	x
2665  0081 ae0000        	ldw	x,#L37
2666  0084 cd0000        	call	_assert_failed
2668  0087 5b04          	addw	sp,#4
2669  0089               L204:
2670                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2672  0089 7b04          	ld	a,(OFST+2,sp)
2673  008b a101          	cp	a,#1
2674  008d 2706          	jreq	L327
2675                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2677  008f a601          	ld	a,#1
2678  0091 6b01          	ld	(OFST-1,sp),a
2681  0093 2002          	jra	L527
2682  0095               L327:
2683                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2685  0095 0f01          	clr	(OFST-1,sp)
2687  0097               L527:
2688                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2690  0097 7b07          	ld	a,(OFST+5,sp)
2691  0099 a101          	cp	a,#1
2692  009b 2606          	jrne	L727
2693                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2695  009d a602          	ld	a,#2
2696  009f 6b02          	ld	(OFST+0,sp),a
2699  00a1 2004          	jra	L137
2700  00a3               L727:
2701                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2703  00a3 a601          	ld	a,#1
2704  00a5 6b02          	ld	(OFST+0,sp),a
2706  00a7               L137:
2707                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2709  00a7 0d03          	tnz	(OFST+1,sp)
2710  00a9 2626          	jrne	L337
2711                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2711                     ; 527                (uint8_t)TIM1_ICFilter);
2713  00ab 7b09          	ld	a,(OFST+7,sp)
2714  00ad 88            	push	a
2715  00ae 7b08          	ld	a,(OFST+6,sp)
2716  00b0 97            	ld	xl,a
2717  00b1 7b05          	ld	a,(OFST+3,sp)
2718  00b3 95            	ld	xh,a
2719  00b4 cd0000        	call	L3_TI1_Config
2721  00b7 84            	pop	a
2722                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2724  00b8 7b08          	ld	a,(OFST+6,sp)
2725  00ba cd0000        	call	_TIM1_SetIC1Prescaler
2727                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2729  00bd 7b09          	ld	a,(OFST+7,sp)
2730  00bf 88            	push	a
2731  00c0 7b03          	ld	a,(OFST+1,sp)
2732  00c2 97            	ld	xl,a
2733  00c3 7b02          	ld	a,(OFST+0,sp)
2734  00c5 95            	ld	xh,a
2735  00c6 cd0000        	call	L5_TI2_Config
2737  00c9 84            	pop	a
2738                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2740  00ca 7b08          	ld	a,(OFST+6,sp)
2741  00cc cd0000        	call	_TIM1_SetIC2Prescaler
2744  00cf 2024          	jra	L537
2745  00d1               L337:
2746                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2746                     ; 542                (uint8_t)TIM1_ICFilter);
2748  00d1 7b09          	ld	a,(OFST+7,sp)
2749  00d3 88            	push	a
2750  00d4 7b08          	ld	a,(OFST+6,sp)
2751  00d6 97            	ld	xl,a
2752  00d7 7b05          	ld	a,(OFST+3,sp)
2753  00d9 95            	ld	xh,a
2754  00da cd0000        	call	L5_TI2_Config
2756  00dd 84            	pop	a
2757                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2759  00de 7b08          	ld	a,(OFST+6,sp)
2760  00e0 cd0000        	call	_TIM1_SetIC2Prescaler
2762                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2764  00e3 7b09          	ld	a,(OFST+7,sp)
2765  00e5 88            	push	a
2766  00e6 7b03          	ld	a,(OFST+1,sp)
2767  00e8 97            	ld	xl,a
2768  00e9 7b02          	ld	a,(OFST+0,sp)
2769  00eb 95            	ld	xh,a
2770  00ec cd0000        	call	L3_TI1_Config
2772  00ef 84            	pop	a
2773                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2775  00f0 7b08          	ld	a,(OFST+6,sp)
2776  00f2 cd0000        	call	_TIM1_SetIC1Prescaler
2778  00f5               L537:
2779                     ; 553 }
2782  00f5 5b04          	addw	sp,#4
2783  00f7 81            	ret
2839                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2839                     ; 562 {
2840                     .text:	section	.text,new
2841  0000               _TIM1_Cmd:
2843  0000 88            	push	a
2844       00000000      OFST:	set	0
2847                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2849  0001 4d            	tnz	a
2850  0002 2704          	jreq	L014
2851  0004 a101          	cp	a,#1
2852  0006 2603          	jrne	L604
2853  0008               L014:
2854  0008 4f            	clr	a
2855  0009 2010          	jra	L214
2856  000b               L604:
2857  000b ae0234        	ldw	x,#564
2858  000e 89            	pushw	x
2859  000f ae0000        	ldw	x,#0
2860  0012 89            	pushw	x
2861  0013 ae0000        	ldw	x,#L37
2862  0016 cd0000        	call	_assert_failed
2864  0019 5b04          	addw	sp,#4
2865  001b               L214:
2866                     ; 567   if (NewState != DISABLE)
2868  001b 0d01          	tnz	(OFST+1,sp)
2869  001d 2706          	jreq	L567
2870                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2872  001f 72105250      	bset	21072,#0
2874  0023 2004          	jra	L767
2875  0025               L567:
2876                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2878  0025 72115250      	bres	21072,#0
2879  0029               L767:
2880                     ; 575 }
2883  0029 84            	pop	a
2884  002a 81            	ret
2921                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2921                     ; 584 {
2922                     .text:	section	.text,new
2923  0000               _TIM1_CtrlPWMOutputs:
2925  0000 88            	push	a
2926       00000000      OFST:	set	0
2929                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2931  0001 4d            	tnz	a
2932  0002 2704          	jreq	L024
2933  0004 a101          	cp	a,#1
2934  0006 2603          	jrne	L614
2935  0008               L024:
2936  0008 4f            	clr	a
2937  0009 2010          	jra	L224
2938  000b               L614:
2939  000b ae024a        	ldw	x,#586
2940  000e 89            	pushw	x
2941  000f ae0000        	ldw	x,#0
2942  0012 89            	pushw	x
2943  0013 ae0000        	ldw	x,#L37
2944  0016 cd0000        	call	_assert_failed
2946  0019 5b04          	addw	sp,#4
2947  001b               L224:
2948                     ; 590   if (NewState != DISABLE)
2950  001b 0d01          	tnz	(OFST+1,sp)
2951  001d 2706          	jreq	L7001
2952                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2954  001f 721e526d      	bset	21101,#7
2956  0023 2004          	jra	L1101
2957  0025               L7001:
2958                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2960  0025 721f526d      	bres	21101,#7
2961  0029               L1101:
2962                     ; 598 }
2965  0029 84            	pop	a
2966  002a 81            	ret
3074                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3074                     ; 618 {
3075                     .text:	section	.text,new
3076  0000               _TIM1_ITConfig:
3078  0000 89            	pushw	x
3079       00000000      OFST:	set	0
3082                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
3084  0001 9e            	ld	a,xh
3085  0002 4d            	tnz	a
3086  0003 2703          	jreq	L624
3087  0005 4f            	clr	a
3088  0006 2010          	jra	L034
3089  0008               L624:
3090  0008 ae026c        	ldw	x,#620
3091  000b 89            	pushw	x
3092  000c ae0000        	ldw	x,#0
3093  000f 89            	pushw	x
3094  0010 ae0000        	ldw	x,#L37
3095  0013 cd0000        	call	_assert_failed
3097  0016 5b04          	addw	sp,#4
3098  0018               L034:
3099                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3101  0018 0d02          	tnz	(OFST+2,sp)
3102  001a 2706          	jreq	L434
3103  001c 7b02          	ld	a,(OFST+2,sp)
3104  001e a101          	cp	a,#1
3105  0020 2603          	jrne	L234
3106  0022               L434:
3107  0022 4f            	clr	a
3108  0023 2010          	jra	L634
3109  0025               L234:
3110  0025 ae026d        	ldw	x,#621
3111  0028 89            	pushw	x
3112  0029 ae0000        	ldw	x,#0
3113  002c 89            	pushw	x
3114  002d ae0000        	ldw	x,#L37
3115  0030 cd0000        	call	_assert_failed
3117  0033 5b04          	addw	sp,#4
3118  0035               L634:
3119                     ; 623   if (NewState != DISABLE)
3121  0035 0d02          	tnz	(OFST+2,sp)
3122  0037 270a          	jreq	L1601
3123                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
3125  0039 c65254        	ld	a,21076
3126  003c 1a01          	or	a,(OFST+1,sp)
3127  003e c75254        	ld	21076,a
3129  0041 2009          	jra	L3601
3130  0043               L1601:
3131                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3133  0043 7b01          	ld	a,(OFST+1,sp)
3134  0045 43            	cpl	a
3135  0046 c45254        	and	a,21076
3136  0049 c75254        	ld	21076,a
3137  004c               L3601:
3138                     ; 633 }
3141  004c 85            	popw	x
3142  004d 81            	ret
3166                     ; 640 void TIM1_InternalClockConfig(void)
3166                     ; 641 {
3167                     .text:	section	.text,new
3168  0000               _TIM1_InternalClockConfig:
3172                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3174  0000 c65252        	ld	a,21074
3175  0003 a4f8          	and	a,#248
3176  0005 c75252        	ld	21074,a
3177                     ; 644 }
3180  0008 81            	ret
3296                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3296                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3296                     ; 664                               uint8_t ExtTRGFilter)
3296                     ; 665 {
3297                     .text:	section	.text,new
3298  0000               _TIM1_ETRClockMode1Config:
3300  0000 89            	pushw	x
3301       00000000      OFST:	set	0
3304                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3306  0001 9e            	ld	a,xh
3307  0002 4d            	tnz	a
3308  0003 270f          	jreq	L644
3309  0005 9e            	ld	a,xh
3310  0006 a110          	cp	a,#16
3311  0008 270a          	jreq	L644
3312  000a 9e            	ld	a,xh
3313  000b a120          	cp	a,#32
3314  000d 2705          	jreq	L644
3315  000f 9e            	ld	a,xh
3316  0010 a130          	cp	a,#48
3317  0012 2603          	jrne	L444
3318  0014               L644:
3319  0014 4f            	clr	a
3320  0015 2010          	jra	L054
3321  0017               L444:
3322  0017 ae029b        	ldw	x,#667
3323  001a 89            	pushw	x
3324  001b ae0000        	ldw	x,#0
3325  001e 89            	pushw	x
3326  001f ae0000        	ldw	x,#L37
3327  0022 cd0000        	call	_assert_failed
3329  0025 5b04          	addw	sp,#4
3330  0027               L054:
3331                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3333  0027 7b02          	ld	a,(OFST+2,sp)
3334  0029 a180          	cp	a,#128
3335  002b 2704          	jreq	L454
3336  002d 0d02          	tnz	(OFST+2,sp)
3337  002f 2603          	jrne	L254
3338  0031               L454:
3339  0031 4f            	clr	a
3340  0032 2010          	jra	L654
3341  0034               L254:
3342  0034 ae029c        	ldw	x,#668
3343  0037 89            	pushw	x
3344  0038 ae0000        	ldw	x,#0
3345  003b 89            	pushw	x
3346  003c ae0000        	ldw	x,#L37
3347  003f cd0000        	call	_assert_failed
3349  0042 5b04          	addw	sp,#4
3350  0044               L654:
3351                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3353  0044 7b05          	ld	a,(OFST+5,sp)
3354  0046 88            	push	a
3355  0047 7b03          	ld	a,(OFST+3,sp)
3356  0049 97            	ld	xl,a
3357  004a 7b02          	ld	a,(OFST+2,sp)
3358  004c 95            	ld	xh,a
3359  004d cd0000        	call	_TIM1_ETRConfig
3361  0050 84            	pop	a
3362                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3362                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3364  0051 c65252        	ld	a,21074
3365  0054 a488          	and	a,#136
3366  0056 aa77          	or	a,#119
3367  0058 c75252        	ld	21074,a
3368                     ; 676 }
3371  005b 85            	popw	x
3372  005c 81            	ret
3429                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3429                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3429                     ; 696                               uint8_t ExtTRGFilter)
3429                     ; 697 {
3430                     .text:	section	.text,new
3431  0000               _TIM1_ETRClockMode2Config:
3433  0000 89            	pushw	x
3434       00000000      OFST:	set	0
3437                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3439  0001 9e            	ld	a,xh
3440  0002 4d            	tnz	a
3441  0003 270f          	jreq	L464
3442  0005 9e            	ld	a,xh
3443  0006 a110          	cp	a,#16
3444  0008 270a          	jreq	L464
3445  000a 9e            	ld	a,xh
3446  000b a120          	cp	a,#32
3447  000d 2705          	jreq	L464
3448  000f 9e            	ld	a,xh
3449  0010 a130          	cp	a,#48
3450  0012 2603          	jrne	L264
3451  0014               L464:
3452  0014 4f            	clr	a
3453  0015 2010          	jra	L664
3454  0017               L264:
3455  0017 ae02bb        	ldw	x,#699
3456  001a 89            	pushw	x
3457  001b ae0000        	ldw	x,#0
3458  001e 89            	pushw	x
3459  001f ae0000        	ldw	x,#L37
3460  0022 cd0000        	call	_assert_failed
3462  0025 5b04          	addw	sp,#4
3463  0027               L664:
3464                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3466  0027 7b02          	ld	a,(OFST+2,sp)
3467  0029 a180          	cp	a,#128
3468  002b 2704          	jreq	L274
3469  002d 0d02          	tnz	(OFST+2,sp)
3470  002f 2603          	jrne	L074
3471  0031               L274:
3472  0031 4f            	clr	a
3473  0032 2010          	jra	L474
3474  0034               L074:
3475  0034 ae02bc        	ldw	x,#700
3476  0037 89            	pushw	x
3477  0038 ae0000        	ldw	x,#0
3478  003b 89            	pushw	x
3479  003c ae0000        	ldw	x,#L37
3480  003f cd0000        	call	_assert_failed
3482  0042 5b04          	addw	sp,#4
3483  0044               L474:
3484                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3486  0044 7b05          	ld	a,(OFST+5,sp)
3487  0046 88            	push	a
3488  0047 7b03          	ld	a,(OFST+3,sp)
3489  0049 97            	ld	xl,a
3490  004a 7b02          	ld	a,(OFST+2,sp)
3491  004c 95            	ld	xh,a
3492  004d cd0000        	call	_TIM1_ETRConfig
3494  0050 84            	pop	a
3495                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3497  0051 721c5253      	bset	21075,#6
3498                     ; 707 }
3501  0055 85            	popw	x
3502  0056 81            	ret
3557                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3557                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3557                     ; 727                     uint8_t ExtTRGFilter)
3557                     ; 728 {
3558                     .text:	section	.text,new
3559  0000               _TIM1_ETRConfig:
3561  0000 89            	pushw	x
3562       00000000      OFST:	set	0
3565                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3567  0001 7b05          	ld	a,(OFST+5,sp)
3568  0003 a110          	cp	a,#16
3569  0005 2403          	jruge	L005
3570  0007 4f            	clr	a
3571  0008 2010          	jra	L205
3572  000a               L005:
3573  000a ae02da        	ldw	x,#730
3574  000d 89            	pushw	x
3575  000e ae0000        	ldw	x,#0
3576  0011 89            	pushw	x
3577  0012 ae0000        	ldw	x,#L37
3578  0015 cd0000        	call	_assert_failed
3580  0018 5b04          	addw	sp,#4
3581  001a               L205:
3582                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3582                     ; 733                          (uint8_t)ExtTRGFilter );
3584  001a 7b01          	ld	a,(OFST+1,sp)
3585  001c 1a02          	or	a,(OFST+2,sp)
3586  001e 1a05          	or	a,(OFST+5,sp)
3587  0020 ca5253        	or	a,21075
3588  0023 c75253        	ld	21075,a
3589                     ; 734 }
3592  0026 85            	popw	x
3593  0027 81            	ret
3681                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3681                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3681                     ; 753                                  uint8_t ICFilter)
3681                     ; 754 {
3682                     .text:	section	.text,new
3683  0000               _TIM1_TIxExternalClockConfig:
3685  0000 89            	pushw	x
3686       00000000      OFST:	set	0
3689                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3691  0001 9e            	ld	a,xh
3692  0002 a140          	cp	a,#64
3693  0004 270a          	jreq	L015
3694  0006 9e            	ld	a,xh
3695  0007 a160          	cp	a,#96
3696  0009 2705          	jreq	L015
3697  000b 9e            	ld	a,xh
3698  000c a150          	cp	a,#80
3699  000e 2603          	jrne	L605
3700  0010               L015:
3701  0010 4f            	clr	a
3702  0011 2010          	jra	L215
3703  0013               L605:
3704  0013 ae02f4        	ldw	x,#756
3705  0016 89            	pushw	x
3706  0017 ae0000        	ldw	x,#0
3707  001a 89            	pushw	x
3708  001b ae0000        	ldw	x,#L37
3709  001e cd0000        	call	_assert_failed
3711  0021 5b04          	addw	sp,#4
3712  0023               L215:
3713                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3715  0023 0d02          	tnz	(OFST+2,sp)
3716  0025 2706          	jreq	L615
3717  0027 7b02          	ld	a,(OFST+2,sp)
3718  0029 a101          	cp	a,#1
3719  002b 2603          	jrne	L415
3720  002d               L615:
3721  002d 4f            	clr	a
3722  002e 2010          	jra	L025
3723  0030               L415:
3724  0030 ae02f5        	ldw	x,#757
3725  0033 89            	pushw	x
3726  0034 ae0000        	ldw	x,#0
3727  0037 89            	pushw	x
3728  0038 ae0000        	ldw	x,#L37
3729  003b cd0000        	call	_assert_failed
3731  003e 5b04          	addw	sp,#4
3732  0040               L025:
3733                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3735  0040 7b05          	ld	a,(OFST+5,sp)
3736  0042 a110          	cp	a,#16
3737  0044 2403          	jruge	L225
3738  0046 4f            	clr	a
3739  0047 2010          	jra	L425
3740  0049               L225:
3741  0049 ae02f6        	ldw	x,#758
3742  004c 89            	pushw	x
3743  004d ae0000        	ldw	x,#0
3744  0050 89            	pushw	x
3745  0051 ae0000        	ldw	x,#L37
3746  0054 cd0000        	call	_assert_failed
3748  0057 5b04          	addw	sp,#4
3749  0059               L425:
3750                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3752  0059 7b01          	ld	a,(OFST+1,sp)
3753  005b a160          	cp	a,#96
3754  005d 260f          	jrne	L3521
3755                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3757  005f 7b05          	ld	a,(OFST+5,sp)
3758  0061 88            	push	a
3759  0062 7b03          	ld	a,(OFST+3,sp)
3760  0064 ae0001        	ldw	x,#1
3761  0067 95            	ld	xh,a
3762  0068 cd0000        	call	L5_TI2_Config
3764  006b 84            	pop	a
3766  006c 200d          	jra	L5521
3767  006e               L3521:
3768                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3770  006e 7b05          	ld	a,(OFST+5,sp)
3771  0070 88            	push	a
3772  0071 7b03          	ld	a,(OFST+3,sp)
3773  0073 ae0001        	ldw	x,#1
3774  0076 95            	ld	xh,a
3775  0077 cd0000        	call	L3_TI1_Config
3777  007a 84            	pop	a
3778  007b               L5521:
3779                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3781  007b 7b01          	ld	a,(OFST+1,sp)
3782  007d cd0000        	call	_TIM1_SelectInputTrigger
3784                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3786  0080 c65252        	ld	a,21074
3787  0083 aa07          	or	a,#7
3788  0085 c75252        	ld	21074,a
3789                     ; 775 }
3792  0088 85            	popw	x
3793  0089 81            	ret
3879                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3879                     ; 788 {
3880                     .text:	section	.text,new
3881  0000               _TIM1_SelectInputTrigger:
3883  0000 88            	push	a
3884       00000000      OFST:	set	0
3887                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3889  0001 a140          	cp	a,#64
3890  0003 2713          	jreq	L235
3891  0005 a150          	cp	a,#80
3892  0007 270f          	jreq	L235
3893  0009 a160          	cp	a,#96
3894  000b 270b          	jreq	L235
3895  000d a170          	cp	a,#112
3896  000f 2707          	jreq	L235
3897  0011 a130          	cp	a,#48
3898  0013 2703          	jreq	L235
3899  0015 4d            	tnz	a
3900  0016 2603          	jrne	L035
3901  0018               L235:
3902  0018 4f            	clr	a
3903  0019 2010          	jra	L435
3904  001b               L035:
3905  001b ae0316        	ldw	x,#790
3906  001e 89            	pushw	x
3907  001f ae0000        	ldw	x,#0
3908  0022 89            	pushw	x
3909  0023 ae0000        	ldw	x,#L37
3910  0026 cd0000        	call	_assert_failed
3912  0029 5b04          	addw	sp,#4
3913  002b               L435:
3914                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3916  002b c65252        	ld	a,21074
3917  002e a48f          	and	a,#143
3918  0030 1a01          	or	a,(OFST+1,sp)
3919  0032 c75252        	ld	21074,a
3920                     ; 794 }
3923  0035 84            	pop	a
3924  0036 81            	ret
3961                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3961                     ; 804 {
3962                     .text:	section	.text,new
3963  0000               _TIM1_UpdateDisableConfig:
3965  0000 88            	push	a
3966       00000000      OFST:	set	0
3969                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3971  0001 4d            	tnz	a
3972  0002 2704          	jreq	L245
3973  0004 a101          	cp	a,#1
3974  0006 2603          	jrne	L045
3975  0008               L245:
3976  0008 4f            	clr	a
3977  0009 2010          	jra	L445
3978  000b               L045:
3979  000b ae0326        	ldw	x,#806
3980  000e 89            	pushw	x
3981  000f ae0000        	ldw	x,#0
3982  0012 89            	pushw	x
3983  0013 ae0000        	ldw	x,#L37
3984  0016 cd0000        	call	_assert_failed
3986  0019 5b04          	addw	sp,#4
3987  001b               L445:
3988                     ; 809   if (NewState != DISABLE)
3990  001b 0d01          	tnz	(OFST+1,sp)
3991  001d 2706          	jreq	L3331
3992                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
3994  001f 72125250      	bset	21072,#1
3996  0023 2004          	jra	L5331
3997  0025               L3331:
3998                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
4000  0025 72135250      	bres	21072,#1
4001  0029               L5331:
4002                     ; 817 }
4005  0029 84            	pop	a
4006  002a 81            	ret
4065                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4065                     ; 828 {
4066                     .text:	section	.text,new
4067  0000               _TIM1_UpdateRequestConfig:
4069  0000 88            	push	a
4070       00000000      OFST:	set	0
4073                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4075  0001 4d            	tnz	a
4076  0002 2704          	jreq	L255
4077  0004 a101          	cp	a,#1
4078  0006 2603          	jrne	L055
4079  0008               L255:
4080  0008 4f            	clr	a
4081  0009 2010          	jra	L455
4082  000b               L055:
4083  000b ae033e        	ldw	x,#830
4084  000e 89            	pushw	x
4085  000f ae0000        	ldw	x,#0
4086  0012 89            	pushw	x
4087  0013 ae0000        	ldw	x,#L37
4088  0016 cd0000        	call	_assert_failed
4090  0019 5b04          	addw	sp,#4
4091  001b               L455:
4092                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4094  001b 0d01          	tnz	(OFST+1,sp)
4095  001d 2706          	jreq	L5631
4096                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
4098  001f 72145250      	bset	21072,#2
4100  0023 2004          	jra	L7631
4101  0025               L5631:
4102                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4104  0025 72155250      	bres	21072,#2
4105  0029               L7631:
4106                     ; 841 }
4109  0029 84            	pop	a
4110  002a 81            	ret
4147                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
4147                     ; 850 {
4148                     .text:	section	.text,new
4149  0000               _TIM1_SelectHallSensor:
4151  0000 88            	push	a
4152       00000000      OFST:	set	0
4155                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4157  0001 4d            	tnz	a
4158  0002 2704          	jreq	L265
4159  0004 a101          	cp	a,#1
4160  0006 2603          	jrne	L065
4161  0008               L265:
4162  0008 4f            	clr	a
4163  0009 2010          	jra	L465
4164  000b               L065:
4165  000b ae0354        	ldw	x,#852
4166  000e 89            	pushw	x
4167  000f ae0000        	ldw	x,#0
4168  0012 89            	pushw	x
4169  0013 ae0000        	ldw	x,#L37
4170  0016 cd0000        	call	_assert_failed
4172  0019 5b04          	addw	sp,#4
4173  001b               L465:
4174                     ; 855   if (NewState != DISABLE)
4176  001b 0d01          	tnz	(OFST+1,sp)
4177  001d 2706          	jreq	L7041
4178                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
4180  001f 721e5251      	bset	21073,#7
4182  0023 2004          	jra	L1141
4183  0025               L7041:
4184                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4186  0025 721f5251      	bres	21073,#7
4187  0029               L1141:
4188                     ; 863 }
4191  0029 84            	pop	a
4192  002a 81            	ret
4250                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4250                     ; 874 {
4251                     .text:	section	.text,new
4252  0000               _TIM1_SelectOnePulseMode:
4254  0000 88            	push	a
4255       00000000      OFST:	set	0
4258                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4260  0001 a101          	cp	a,#1
4261  0003 2703          	jreq	L275
4262  0005 4d            	tnz	a
4263  0006 2603          	jrne	L075
4264  0008               L275:
4265  0008 4f            	clr	a
4266  0009 2010          	jra	L475
4267  000b               L075:
4268  000b ae036c        	ldw	x,#876
4269  000e 89            	pushw	x
4270  000f ae0000        	ldw	x,#0
4271  0012 89            	pushw	x
4272  0013 ae0000        	ldw	x,#L37
4273  0016 cd0000        	call	_assert_failed
4275  0019 5b04          	addw	sp,#4
4276  001b               L475:
4277                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4279  001b 0d01          	tnz	(OFST+1,sp)
4280  001d 2706          	jreq	L1441
4281                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4283  001f 72165250      	bset	21072,#3
4285  0023 2004          	jra	L3441
4286  0025               L1441:
4287                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4289  0025 72175250      	bres	21072,#3
4290  0029               L3441:
4291                     ; 888 }
4294  0029 84            	pop	a
4295  002a 81            	ret
4394                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4394                     ; 904 {
4395                     .text:	section	.text,new
4396  0000               _TIM1_SelectOutputTrigger:
4398  0000 88            	push	a
4399       00000000      OFST:	set	0
4402                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4404  0001 4d            	tnz	a
4405  0002 2718          	jreq	L206
4406  0004 a110          	cp	a,#16
4407  0006 2714          	jreq	L206
4408  0008 a120          	cp	a,#32
4409  000a 2710          	jreq	L206
4410  000c a130          	cp	a,#48
4411  000e 270c          	jreq	L206
4412  0010 a140          	cp	a,#64
4413  0012 2708          	jreq	L206
4414  0014 a150          	cp	a,#80
4415  0016 2704          	jreq	L206
4416  0018 a160          	cp	a,#96
4417  001a 2603          	jrne	L006
4418  001c               L206:
4419  001c 4f            	clr	a
4420  001d 2010          	jra	L406
4421  001f               L006:
4422  001f ae038a        	ldw	x,#906
4423  0022 89            	pushw	x
4424  0023 ae0000        	ldw	x,#0
4425  0026 89            	pushw	x
4426  0027 ae0000        	ldw	x,#L37
4427  002a cd0000        	call	_assert_failed
4429  002d 5b04          	addw	sp,#4
4430  002f               L406:
4431                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4431                     ; 910                         (uint8_t) TIM1_TRGOSource);
4433  002f c65251        	ld	a,21073
4434  0032 a48f          	and	a,#143
4435  0034 1a01          	or	a,(OFST+1,sp)
4436  0036 c75251        	ld	21073,a
4437                     ; 911 }
4440  0039 84            	pop	a
4441  003a 81            	ret
4516                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4516                     ; 924 {
4517                     .text:	section	.text,new
4518  0000               _TIM1_SelectSlaveMode:
4520  0000 88            	push	a
4521       00000000      OFST:	set	0
4524                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4526  0001 a104          	cp	a,#4
4527  0003 270c          	jreq	L216
4528  0005 a105          	cp	a,#5
4529  0007 2708          	jreq	L216
4530  0009 a106          	cp	a,#6
4531  000b 2704          	jreq	L216
4532  000d a107          	cp	a,#7
4533  000f 2603          	jrne	L016
4534  0011               L216:
4535  0011 4f            	clr	a
4536  0012 2010          	jra	L416
4537  0014               L016:
4538  0014 ae039e        	ldw	x,#926
4539  0017 89            	pushw	x
4540  0018 ae0000        	ldw	x,#0
4541  001b 89            	pushw	x
4542  001c ae0000        	ldw	x,#L37
4543  001f cd0000        	call	_assert_failed
4545  0022 5b04          	addw	sp,#4
4546  0024               L416:
4547                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4547                     ; 930                          (uint8_t)TIM1_SlaveMode);
4549  0024 c65252        	ld	a,21074
4550  0027 a4f8          	and	a,#248
4551  0029 1a01          	or	a,(OFST+1,sp)
4552  002b c75252        	ld	21074,a
4553                     ; 931 }
4556  002e 84            	pop	a
4557  002f 81            	ret
4594                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4594                     ; 940 {
4595                     .text:	section	.text,new
4596  0000               _TIM1_SelectMasterSlaveMode:
4598  0000 88            	push	a
4599       00000000      OFST:	set	0
4602                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4604  0001 4d            	tnz	a
4605  0002 2704          	jreq	L226
4606  0004 a101          	cp	a,#1
4607  0006 2603          	jrne	L026
4608  0008               L226:
4609  0008 4f            	clr	a
4610  0009 2010          	jra	L426
4611  000b               L026:
4612  000b ae03ae        	ldw	x,#942
4613  000e 89            	pushw	x
4614  000f ae0000        	ldw	x,#0
4615  0012 89            	pushw	x
4616  0013 ae0000        	ldw	x,#L37
4617  0016 cd0000        	call	_assert_failed
4619  0019 5b04          	addw	sp,#4
4620  001b               L426:
4621                     ; 945   if (NewState != DISABLE)
4623  001b 0d01          	tnz	(OFST+1,sp)
4624  001d 2706          	jreq	L5551
4625                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4627  001f 721e5252      	bset	21074,#7
4629  0023 2004          	jra	L7551
4630  0025               L5551:
4631                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4633  0025 721f5252      	bres	21074,#7
4634  0029               L7551:
4635                     ; 953 }
4638  0029 84            	pop	a
4639  002a 81            	ret
4726                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4726                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4726                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4726                     ; 978 {
4727                     .text:	section	.text,new
4728  0000               _TIM1_EncoderInterfaceConfig:
4730  0000 89            	pushw	x
4731       00000000      OFST:	set	0
4734                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4736  0001 9e            	ld	a,xh
4737  0002 a101          	cp	a,#1
4738  0004 270a          	jreq	L236
4739  0006 9e            	ld	a,xh
4740  0007 a102          	cp	a,#2
4741  0009 2705          	jreq	L236
4742  000b 9e            	ld	a,xh
4743  000c a103          	cp	a,#3
4744  000e 2603          	jrne	L036
4745  0010               L236:
4746  0010 4f            	clr	a
4747  0011 2010          	jra	L436
4748  0013               L036:
4749  0013 ae03d4        	ldw	x,#980
4750  0016 89            	pushw	x
4751  0017 ae0000        	ldw	x,#0
4752  001a 89            	pushw	x
4753  001b ae0000        	ldw	x,#L37
4754  001e cd0000        	call	_assert_failed
4756  0021 5b04          	addw	sp,#4
4757  0023               L436:
4758                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4760  0023 0d02          	tnz	(OFST+2,sp)
4761  0025 2706          	jreq	L046
4762  0027 7b02          	ld	a,(OFST+2,sp)
4763  0029 a101          	cp	a,#1
4764  002b 2603          	jrne	L636
4765  002d               L046:
4766  002d 4f            	clr	a
4767  002e 2010          	jra	L246
4768  0030               L636:
4769  0030 ae03d5        	ldw	x,#981
4770  0033 89            	pushw	x
4771  0034 ae0000        	ldw	x,#0
4772  0037 89            	pushw	x
4773  0038 ae0000        	ldw	x,#L37
4774  003b cd0000        	call	_assert_failed
4776  003e 5b04          	addw	sp,#4
4777  0040               L246:
4778                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4780  0040 0d05          	tnz	(OFST+5,sp)
4781  0042 2706          	jreq	L646
4782  0044 7b05          	ld	a,(OFST+5,sp)
4783  0046 a101          	cp	a,#1
4784  0048 2603          	jrne	L446
4785  004a               L646:
4786  004a 4f            	clr	a
4787  004b 2010          	jra	L056
4788  004d               L446:
4789  004d ae03d6        	ldw	x,#982
4790  0050 89            	pushw	x
4791  0051 ae0000        	ldw	x,#0
4792  0054 89            	pushw	x
4793  0055 ae0000        	ldw	x,#L37
4794  0058 cd0000        	call	_assert_failed
4796  005b 5b04          	addw	sp,#4
4797  005d               L056:
4798                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4800  005d 0d02          	tnz	(OFST+2,sp)
4801  005f 2706          	jreq	L1261
4802                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4804  0061 7212525c      	bset	21084,#1
4806  0065 2004          	jra	L3261
4807  0067               L1261:
4808                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4810  0067 7213525c      	bres	21084,#1
4811  006b               L3261:
4812                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4814  006b 0d05          	tnz	(OFST+5,sp)
4815  006d 2706          	jreq	L5261
4816                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4818  006f 721a525c      	bset	21084,#5
4820  0073 2004          	jra	L7261
4821  0075               L5261:
4822                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4824  0075 721b525c      	bres	21084,#5
4825  0079               L7261:
4826                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4826                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4828  0079 c65252        	ld	a,21074
4829  007c a4f0          	and	a,#240
4830  007e 1a01          	or	a,(OFST+1,sp)
4831  0080 c75252        	ld	21074,a
4832                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4832                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4834  0083 c65258        	ld	a,21080
4835  0086 a4fc          	and	a,#252
4836  0088 aa01          	or	a,#1
4837  008a c75258        	ld	21080,a
4838                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4838                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4840  008d c65259        	ld	a,21081
4841  0090 a4fc          	and	a,#252
4842  0092 aa01          	or	a,#1
4843  0094 c75259        	ld	21081,a
4844                     ; 1011 }
4847  0097 85            	popw	x
4848  0098 81            	ret
4914                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4914                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4914                     ; 1025 {
4915                     .text:	section	.text,new
4916  0000               _TIM1_PrescalerConfig:
4918  0000 89            	pushw	x
4919       00000000      OFST:	set	0
4922                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4924  0001 0d05          	tnz	(OFST+5,sp)
4925  0003 2706          	jreq	L656
4926  0005 7b05          	ld	a,(OFST+5,sp)
4927  0007 a101          	cp	a,#1
4928  0009 2603          	jrne	L456
4929  000b               L656:
4930  000b 4f            	clr	a
4931  000c 2010          	jra	L066
4932  000e               L456:
4933  000e ae0403        	ldw	x,#1027
4934  0011 89            	pushw	x
4935  0012 ae0000        	ldw	x,#0
4936  0015 89            	pushw	x
4937  0016 ae0000        	ldw	x,#L37
4938  0019 cd0000        	call	_assert_failed
4940  001c 5b04          	addw	sp,#4
4941  001e               L066:
4942                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4944  001e 7b01          	ld	a,(OFST+1,sp)
4945  0020 c75260        	ld	21088,a
4946                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4948  0023 7b02          	ld	a,(OFST+2,sp)
4949  0025 c75261        	ld	21089,a
4950                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4952  0028 7b05          	ld	a,(OFST+5,sp)
4953  002a c75257        	ld	21079,a
4954                     ; 1035 }
4957  002d 85            	popw	x
4958  002e 81            	ret
4995                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
4995                     ; 1049 {
4996                     .text:	section	.text,new
4997  0000               _TIM1_CounterModeConfig:
4999  0000 88            	push	a
5000       00000000      OFST:	set	0
5003                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
5005  0001 4d            	tnz	a
5006  0002 2710          	jreq	L666
5007  0004 a110          	cp	a,#16
5008  0006 270c          	jreq	L666
5009  0008 a120          	cp	a,#32
5010  000a 2708          	jreq	L666
5011  000c a140          	cp	a,#64
5012  000e 2704          	jreq	L666
5013  0010 a160          	cp	a,#96
5014  0012 2603          	jrne	L466
5015  0014               L666:
5016  0014 4f            	clr	a
5017  0015 2010          	jra	L076
5018  0017               L466:
5019  0017 ae041b        	ldw	x,#1051
5020  001a 89            	pushw	x
5021  001b ae0000        	ldw	x,#0
5022  001e 89            	pushw	x
5023  001f ae0000        	ldw	x,#L37
5024  0022 cd0000        	call	_assert_failed
5026  0025 5b04          	addw	sp,#4
5027  0027               L076:
5028                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5028                     ; 1056                         | (uint8_t)TIM1_CounterMode);
5030  0027 c65250        	ld	a,21072
5031  002a a48f          	and	a,#143
5032  002c 1a01          	or	a,(OFST+1,sp)
5033  002e c75250        	ld	21072,a
5034                     ; 1057 }
5037  0031 84            	pop	a
5038  0032 81            	ret
5097                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5097                     ; 1068 {
5098                     .text:	section	.text,new
5099  0000               _TIM1_ForcedOC1Config:
5101  0000 88            	push	a
5102       00000000      OFST:	set	0
5105                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5107  0001 a150          	cp	a,#80
5108  0003 2704          	jreq	L676
5109  0005 a140          	cp	a,#64
5110  0007 2603          	jrne	L476
5111  0009               L676:
5112  0009 4f            	clr	a
5113  000a 2010          	jra	L007
5114  000c               L476:
5115  000c ae042e        	ldw	x,#1070
5116  000f 89            	pushw	x
5117  0010 ae0000        	ldw	x,#0
5118  0013 89            	pushw	x
5119  0014 ae0000        	ldw	x,#L37
5120  0017 cd0000        	call	_assert_failed
5122  001a 5b04          	addw	sp,#4
5123  001c               L007:
5124                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5124                     ; 1074                            (uint8_t)TIM1_ForcedAction);
5126  001c c65258        	ld	a,21080
5127  001f a48f          	and	a,#143
5128  0021 1a01          	or	a,(OFST+1,sp)
5129  0023 c75258        	ld	21080,a
5130                     ; 1075 }
5133  0026 84            	pop	a
5134  0027 81            	ret
5171                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5171                     ; 1086 {
5172                     .text:	section	.text,new
5173  0000               _TIM1_ForcedOC2Config:
5175  0000 88            	push	a
5176       00000000      OFST:	set	0
5179                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5181  0001 a150          	cp	a,#80
5182  0003 2704          	jreq	L607
5183  0005 a140          	cp	a,#64
5184  0007 2603          	jrne	L407
5185  0009               L607:
5186  0009 4f            	clr	a
5187  000a 2010          	jra	L017
5188  000c               L407:
5189  000c ae0440        	ldw	x,#1088
5190  000f 89            	pushw	x
5191  0010 ae0000        	ldw	x,#0
5192  0013 89            	pushw	x
5193  0014 ae0000        	ldw	x,#L37
5194  0017 cd0000        	call	_assert_failed
5196  001a 5b04          	addw	sp,#4
5197  001c               L017:
5198                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5198                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
5200  001c c65259        	ld	a,21081
5201  001f a48f          	and	a,#143
5202  0021 1a01          	or	a,(OFST+1,sp)
5203  0023 c75259        	ld	21081,a
5204                     ; 1093 }
5207  0026 84            	pop	a
5208  0027 81            	ret
5245                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5245                     ; 1105 {
5246                     .text:	section	.text,new
5247  0000               _TIM1_ForcedOC3Config:
5249  0000 88            	push	a
5250       00000000      OFST:	set	0
5253                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5255  0001 a150          	cp	a,#80
5256  0003 2704          	jreq	L617
5257  0005 a140          	cp	a,#64
5258  0007 2603          	jrne	L417
5259  0009               L617:
5260  0009 4f            	clr	a
5261  000a 2010          	jra	L027
5262  000c               L417:
5263  000c ae0453        	ldw	x,#1107
5264  000f 89            	pushw	x
5265  0010 ae0000        	ldw	x,#0
5266  0013 89            	pushw	x
5267  0014 ae0000        	ldw	x,#L37
5268  0017 cd0000        	call	_assert_failed
5270  001a 5b04          	addw	sp,#4
5271  001c               L027:
5272                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5272                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
5274  001c c6525a        	ld	a,21082
5275  001f a48f          	and	a,#143
5276  0021 1a01          	or	a,(OFST+1,sp)
5277  0023 c7525a        	ld	21082,a
5278                     ; 1112 }
5281  0026 84            	pop	a
5282  0027 81            	ret
5319                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5319                     ; 1124 {
5320                     .text:	section	.text,new
5321  0000               _TIM1_ForcedOC4Config:
5323  0000 88            	push	a
5324       00000000      OFST:	set	0
5327                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5329  0001 a150          	cp	a,#80
5330  0003 2704          	jreq	L627
5331  0005 a140          	cp	a,#64
5332  0007 2603          	jrne	L427
5333  0009               L627:
5334  0009 4f            	clr	a
5335  000a 2010          	jra	L037
5336  000c               L427:
5337  000c ae0466        	ldw	x,#1126
5338  000f 89            	pushw	x
5339  0010 ae0000        	ldw	x,#0
5340  0013 89            	pushw	x
5341  0014 ae0000        	ldw	x,#L37
5342  0017 cd0000        	call	_assert_failed
5344  001a 5b04          	addw	sp,#4
5345  001c               L037:
5346                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5346                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5348  001c c6525b        	ld	a,21083
5349  001f a48f          	and	a,#143
5350  0021 1a01          	or	a,(OFST+1,sp)
5351  0023 c7525b        	ld	21083,a
5352                     ; 1131 }
5355  0026 84            	pop	a
5356  0027 81            	ret
5393                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5393                     ; 1140 {
5394                     .text:	section	.text,new
5395  0000               _TIM1_ARRPreloadConfig:
5397  0000 88            	push	a
5398       00000000      OFST:	set	0
5401                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5403  0001 4d            	tnz	a
5404  0002 2704          	jreq	L637
5405  0004 a101          	cp	a,#1
5406  0006 2603          	jrne	L437
5407  0008               L637:
5408  0008 4f            	clr	a
5409  0009 2010          	jra	L047
5410  000b               L437:
5411  000b ae0476        	ldw	x,#1142
5412  000e 89            	pushw	x
5413  000f ae0000        	ldw	x,#0
5414  0012 89            	pushw	x
5415  0013 ae0000        	ldw	x,#L37
5416  0016 cd0000        	call	_assert_failed
5418  0019 5b04          	addw	sp,#4
5419  001b               L047:
5420                     ; 1145   if (NewState != DISABLE)
5422  001b 0d01          	tnz	(OFST+1,sp)
5423  001d 2706          	jreq	L5102
5424                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5426  001f 721e5250      	bset	21072,#7
5428  0023 2004          	jra	L7102
5429  0025               L5102:
5430                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5432  0025 721f5250      	bres	21072,#7
5433  0029               L7102:
5434                     ; 1153 }
5437  0029 84            	pop	a
5438  002a 81            	ret
5474                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5474                     ; 1162 {
5475                     .text:	section	.text,new
5476  0000               _TIM1_SelectCOM:
5478  0000 88            	push	a
5479       00000000      OFST:	set	0
5482                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5484  0001 4d            	tnz	a
5485  0002 2704          	jreq	L647
5486  0004 a101          	cp	a,#1
5487  0006 2603          	jrne	L447
5488  0008               L647:
5489  0008 4f            	clr	a
5490  0009 2010          	jra	L057
5491  000b               L447:
5492  000b ae048c        	ldw	x,#1164
5493  000e 89            	pushw	x
5494  000f ae0000        	ldw	x,#0
5495  0012 89            	pushw	x
5496  0013 ae0000        	ldw	x,#L37
5497  0016 cd0000        	call	_assert_failed
5499  0019 5b04          	addw	sp,#4
5500  001b               L057:
5501                     ; 1167   if (NewState != DISABLE)
5503  001b 0d01          	tnz	(OFST+1,sp)
5504  001d 2706          	jreq	L7302
5505                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5507  001f 72145251      	bset	21073,#2
5509  0023 2004          	jra	L1402
5510  0025               L7302:
5511                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5513  0025 72155251      	bres	21073,#2
5514  0029               L1402:
5515                     ; 1175 }
5518  0029 84            	pop	a
5519  002a 81            	ret
5556                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5556                     ; 1184 {
5557                     .text:	section	.text,new
5558  0000               _TIM1_CCPreloadControl:
5560  0000 88            	push	a
5561       00000000      OFST:	set	0
5564                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5566  0001 4d            	tnz	a
5567  0002 2704          	jreq	L657
5568  0004 a101          	cp	a,#1
5569  0006 2603          	jrne	L457
5570  0008               L657:
5571  0008 4f            	clr	a
5572  0009 2010          	jra	L067
5573  000b               L457:
5574  000b ae04a2        	ldw	x,#1186
5575  000e 89            	pushw	x
5576  000f ae0000        	ldw	x,#0
5577  0012 89            	pushw	x
5578  0013 ae0000        	ldw	x,#L37
5579  0016 cd0000        	call	_assert_failed
5581  0019 5b04          	addw	sp,#4
5582  001b               L067:
5583                     ; 1189   if (NewState != DISABLE)
5585  001b 0d01          	tnz	(OFST+1,sp)
5586  001d 2706          	jreq	L1602
5587                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5589  001f 72105251      	bset	21073,#0
5591  0023 2004          	jra	L3602
5592  0025               L1602:
5593                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5595  0025 72115251      	bres	21073,#0
5596  0029               L3602:
5597                     ; 1197 }
5600  0029 84            	pop	a
5601  002a 81            	ret
5638                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5638                     ; 1206 {
5639                     .text:	section	.text,new
5640  0000               _TIM1_OC1PreloadConfig:
5642  0000 88            	push	a
5643       00000000      OFST:	set	0
5646                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5648  0001 4d            	tnz	a
5649  0002 2704          	jreq	L667
5650  0004 a101          	cp	a,#1
5651  0006 2603          	jrne	L467
5652  0008               L667:
5653  0008 4f            	clr	a
5654  0009 2010          	jra	L077
5655  000b               L467:
5656  000b ae04b8        	ldw	x,#1208
5657  000e 89            	pushw	x
5658  000f ae0000        	ldw	x,#0
5659  0012 89            	pushw	x
5660  0013 ae0000        	ldw	x,#L37
5661  0016 cd0000        	call	_assert_failed
5663  0019 5b04          	addw	sp,#4
5664  001b               L077:
5665                     ; 1211   if (NewState != DISABLE)
5667  001b 0d01          	tnz	(OFST+1,sp)
5668  001d 2706          	jreq	L3012
5669                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5671  001f 72165258      	bset	21080,#3
5673  0023 2004          	jra	L5012
5674  0025               L3012:
5675                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5677  0025 72175258      	bres	21080,#3
5678  0029               L5012:
5679                     ; 1219 }
5682  0029 84            	pop	a
5683  002a 81            	ret
5720                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5720                     ; 1228 {
5721                     .text:	section	.text,new
5722  0000               _TIM1_OC2PreloadConfig:
5724  0000 88            	push	a
5725       00000000      OFST:	set	0
5728                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5730  0001 4d            	tnz	a
5731  0002 2704          	jreq	L677
5732  0004 a101          	cp	a,#1
5733  0006 2603          	jrne	L477
5734  0008               L677:
5735  0008 4f            	clr	a
5736  0009 2010          	jra	L0001
5737  000b               L477:
5738  000b ae04ce        	ldw	x,#1230
5739  000e 89            	pushw	x
5740  000f ae0000        	ldw	x,#0
5741  0012 89            	pushw	x
5742  0013 ae0000        	ldw	x,#L37
5743  0016 cd0000        	call	_assert_failed
5745  0019 5b04          	addw	sp,#4
5746  001b               L0001:
5747                     ; 1233   if (NewState != DISABLE)
5749  001b 0d01          	tnz	(OFST+1,sp)
5750  001d 2706          	jreq	L5212
5751                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5753  001f 72165259      	bset	21081,#3
5755  0023 2004          	jra	L7212
5756  0025               L5212:
5757                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5759  0025 72175259      	bres	21081,#3
5760  0029               L7212:
5761                     ; 1241 }
5764  0029 84            	pop	a
5765  002a 81            	ret
5802                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5802                     ; 1250 {
5803                     .text:	section	.text,new
5804  0000               _TIM1_OC3PreloadConfig:
5806  0000 88            	push	a
5807       00000000      OFST:	set	0
5810                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5812  0001 4d            	tnz	a
5813  0002 2704          	jreq	L6001
5814  0004 a101          	cp	a,#1
5815  0006 2603          	jrne	L4001
5816  0008               L6001:
5817  0008 4f            	clr	a
5818  0009 2010          	jra	L0101
5819  000b               L4001:
5820  000b ae04e4        	ldw	x,#1252
5821  000e 89            	pushw	x
5822  000f ae0000        	ldw	x,#0
5823  0012 89            	pushw	x
5824  0013 ae0000        	ldw	x,#L37
5825  0016 cd0000        	call	_assert_failed
5827  0019 5b04          	addw	sp,#4
5828  001b               L0101:
5829                     ; 1255   if (NewState != DISABLE)
5831  001b 0d01          	tnz	(OFST+1,sp)
5832  001d 2706          	jreq	L7412
5833                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5835  001f 7216525a      	bset	21082,#3
5837  0023 2004          	jra	L1512
5838  0025               L7412:
5839                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5841  0025 7217525a      	bres	21082,#3
5842  0029               L1512:
5843                     ; 1263 }
5846  0029 84            	pop	a
5847  002a 81            	ret
5884                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5884                     ; 1272 {
5885                     .text:	section	.text,new
5886  0000               _TIM1_OC4PreloadConfig:
5888  0000 88            	push	a
5889       00000000      OFST:	set	0
5892                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5894  0001 4d            	tnz	a
5895  0002 2704          	jreq	L6101
5896  0004 a101          	cp	a,#1
5897  0006 2603          	jrne	L4101
5898  0008               L6101:
5899  0008 4f            	clr	a
5900  0009 2010          	jra	L0201
5901  000b               L4101:
5902  000b ae04fa        	ldw	x,#1274
5903  000e 89            	pushw	x
5904  000f ae0000        	ldw	x,#0
5905  0012 89            	pushw	x
5906  0013 ae0000        	ldw	x,#L37
5907  0016 cd0000        	call	_assert_failed
5909  0019 5b04          	addw	sp,#4
5910  001b               L0201:
5911                     ; 1277   if (NewState != DISABLE)
5913  001b 0d01          	tnz	(OFST+1,sp)
5914  001d 2706          	jreq	L1712
5915                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5917  001f 7216525b      	bset	21083,#3
5919  0023 2004          	jra	L3712
5920  0025               L1712:
5921                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5923  0025 7217525b      	bres	21083,#3
5924  0029               L3712:
5925                     ; 1285 }
5928  0029 84            	pop	a
5929  002a 81            	ret
5965                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5965                     ; 1294 {
5966                     .text:	section	.text,new
5967  0000               _TIM1_OC1FastConfig:
5969  0000 88            	push	a
5970       00000000      OFST:	set	0
5973                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5975  0001 4d            	tnz	a
5976  0002 2704          	jreq	L6201
5977  0004 a101          	cp	a,#1
5978  0006 2603          	jrne	L4201
5979  0008               L6201:
5980  0008 4f            	clr	a
5981  0009 2010          	jra	L0301
5982  000b               L4201:
5983  000b ae0510        	ldw	x,#1296
5984  000e 89            	pushw	x
5985  000f ae0000        	ldw	x,#0
5986  0012 89            	pushw	x
5987  0013 ae0000        	ldw	x,#L37
5988  0016 cd0000        	call	_assert_failed
5990  0019 5b04          	addw	sp,#4
5991  001b               L0301:
5992                     ; 1299   if (NewState != DISABLE)
5994  001b 0d01          	tnz	(OFST+1,sp)
5995  001d 2706          	jreq	L3122
5996                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
5998  001f 72145258      	bset	21080,#2
6000  0023 2004          	jra	L5122
6001  0025               L3122:
6002                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6004  0025 72155258      	bres	21080,#2
6005  0029               L5122:
6006                     ; 1307 }
6009  0029 84            	pop	a
6010  002a 81            	ret
6046                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
6046                     ; 1316 {
6047                     .text:	section	.text,new
6048  0000               _TIM1_OC2FastConfig:
6050  0000 88            	push	a
6051       00000000      OFST:	set	0
6054                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6056  0001 4d            	tnz	a
6057  0002 2704          	jreq	L6301
6058  0004 a101          	cp	a,#1
6059  0006 2603          	jrne	L4301
6060  0008               L6301:
6061  0008 4f            	clr	a
6062  0009 2010          	jra	L0401
6063  000b               L4301:
6064  000b ae0526        	ldw	x,#1318
6065  000e 89            	pushw	x
6066  000f ae0000        	ldw	x,#0
6067  0012 89            	pushw	x
6068  0013 ae0000        	ldw	x,#L37
6069  0016 cd0000        	call	_assert_failed
6071  0019 5b04          	addw	sp,#4
6072  001b               L0401:
6073                     ; 1321   if (NewState != DISABLE)
6075  001b 0d01          	tnz	(OFST+1,sp)
6076  001d 2706          	jreq	L5322
6077                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6079  001f 72145259      	bset	21081,#2
6081  0023 2004          	jra	L7322
6082  0025               L5322:
6083                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6085  0025 72155259      	bres	21081,#2
6086  0029               L7322:
6087                     ; 1329 }
6090  0029 84            	pop	a
6091  002a 81            	ret
6127                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
6127                     ; 1338 {
6128                     .text:	section	.text,new
6129  0000               _TIM1_OC3FastConfig:
6131  0000 88            	push	a
6132       00000000      OFST:	set	0
6135                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6137  0001 4d            	tnz	a
6138  0002 2704          	jreq	L6401
6139  0004 a101          	cp	a,#1
6140  0006 2603          	jrne	L4401
6141  0008               L6401:
6142  0008 4f            	clr	a
6143  0009 2010          	jra	L0501
6144  000b               L4401:
6145  000b ae053c        	ldw	x,#1340
6146  000e 89            	pushw	x
6147  000f ae0000        	ldw	x,#0
6148  0012 89            	pushw	x
6149  0013 ae0000        	ldw	x,#L37
6150  0016 cd0000        	call	_assert_failed
6152  0019 5b04          	addw	sp,#4
6153  001b               L0501:
6154                     ; 1343   if (NewState != DISABLE)
6156  001b 0d01          	tnz	(OFST+1,sp)
6157  001d 2706          	jreq	L7522
6158                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6160  001f 7214525a      	bset	21082,#2
6162  0023 2004          	jra	L1622
6163  0025               L7522:
6164                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6166  0025 7215525a      	bres	21082,#2
6167  0029               L1622:
6168                     ; 1351 }
6171  0029 84            	pop	a
6172  002a 81            	ret
6208                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
6208                     ; 1360 {
6209                     .text:	section	.text,new
6210  0000               _TIM1_OC4FastConfig:
6212  0000 88            	push	a
6213       00000000      OFST:	set	0
6216                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6218  0001 4d            	tnz	a
6219  0002 2704          	jreq	L6501
6220  0004 a101          	cp	a,#1
6221  0006 2603          	jrne	L4501
6222  0008               L6501:
6223  0008 4f            	clr	a
6224  0009 2010          	jra	L0601
6225  000b               L4501:
6226  000b ae0552        	ldw	x,#1362
6227  000e 89            	pushw	x
6228  000f ae0000        	ldw	x,#0
6229  0012 89            	pushw	x
6230  0013 ae0000        	ldw	x,#L37
6231  0016 cd0000        	call	_assert_failed
6233  0019 5b04          	addw	sp,#4
6234  001b               L0601:
6235                     ; 1365   if (NewState != DISABLE)
6237  001b 0d01          	tnz	(OFST+1,sp)
6238  001d 2706          	jreq	L1032
6239                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6241  001f 7214525b      	bset	21083,#2
6243  0023 2004          	jra	L3032
6244  0025               L1032:
6245                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6247  0025 7215525b      	bres	21083,#2
6248  0029               L3032:
6249                     ; 1373 }
6252  0029 84            	pop	a
6253  002a 81            	ret
6359                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6359                     ; 1390 {
6360                     .text:	section	.text,new
6361  0000               _TIM1_GenerateEvent:
6363  0000 88            	push	a
6364       00000000      OFST:	set	0
6367                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6369  0001 4d            	tnz	a
6370  0002 2703          	jreq	L4601
6371  0004 4f            	clr	a
6372  0005 2010          	jra	L6601
6373  0007               L4601:
6374  0007 ae0570        	ldw	x,#1392
6375  000a 89            	pushw	x
6376  000b ae0000        	ldw	x,#0
6377  000e 89            	pushw	x
6378  000f ae0000        	ldw	x,#L37
6379  0012 cd0000        	call	_assert_failed
6381  0015 5b04          	addw	sp,#4
6382  0017               L6601:
6383                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6385  0017 7b01          	ld	a,(OFST+1,sp)
6386  0019 c75257        	ld	21079,a
6387                     ; 1396 }
6390  001c 84            	pop	a
6391  001d 81            	ret
6428                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6428                     ; 1407 {
6429                     .text:	section	.text,new
6430  0000               _TIM1_OC1PolarityConfig:
6432  0000 88            	push	a
6433       00000000      OFST:	set	0
6436                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6438  0001 4d            	tnz	a
6439  0002 2704          	jreq	L4701
6440  0004 a122          	cp	a,#34
6441  0006 2603          	jrne	L2701
6442  0008               L4701:
6443  0008 4f            	clr	a
6444  0009 2010          	jra	L6701
6445  000b               L2701:
6446  000b ae0581        	ldw	x,#1409
6447  000e 89            	pushw	x
6448  000f ae0000        	ldw	x,#0
6449  0012 89            	pushw	x
6450  0013 ae0000        	ldw	x,#L37
6451  0016 cd0000        	call	_assert_failed
6453  0019 5b04          	addw	sp,#4
6454  001b               L6701:
6455                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6457  001b 0d01          	tnz	(OFST+1,sp)
6458  001d 2706          	jreq	L5632
6459                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6461  001f 7212525c      	bset	21084,#1
6463  0023 2004          	jra	L7632
6464  0025               L5632:
6465                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6467  0025 7213525c      	bres	21084,#1
6468  0029               L7632:
6469                     ; 1420 }
6472  0029 84            	pop	a
6473  002a 81            	ret
6510                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6510                     ; 1431 {
6511                     .text:	section	.text,new
6512  0000               _TIM1_OC1NPolarityConfig:
6514  0000 88            	push	a
6515       00000000      OFST:	set	0
6518                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6520  0001 4d            	tnz	a
6521  0002 2704          	jreq	L4011
6522  0004 a188          	cp	a,#136
6523  0006 2603          	jrne	L2011
6524  0008               L4011:
6525  0008 4f            	clr	a
6526  0009 2010          	jra	L6011
6527  000b               L2011:
6528  000b ae0599        	ldw	x,#1433
6529  000e 89            	pushw	x
6530  000f ae0000        	ldw	x,#0
6531  0012 89            	pushw	x
6532  0013 ae0000        	ldw	x,#L37
6533  0016 cd0000        	call	_assert_failed
6535  0019 5b04          	addw	sp,#4
6536  001b               L6011:
6537                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6539  001b 0d01          	tnz	(OFST+1,sp)
6540  001d 2706          	jreq	L7042
6541                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6543  001f 7216525c      	bset	21084,#3
6545  0023 2004          	jra	L1142
6546  0025               L7042:
6547                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6549  0025 7217525c      	bres	21084,#3
6550  0029               L1142:
6551                     ; 1444 }
6554  0029 84            	pop	a
6555  002a 81            	ret
6592                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6592                     ; 1455 {
6593                     .text:	section	.text,new
6594  0000               _TIM1_OC2PolarityConfig:
6596  0000 88            	push	a
6597       00000000      OFST:	set	0
6600                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6602  0001 4d            	tnz	a
6603  0002 2704          	jreq	L4111
6604  0004 a122          	cp	a,#34
6605  0006 2603          	jrne	L2111
6606  0008               L4111:
6607  0008 4f            	clr	a
6608  0009 2010          	jra	L6111
6609  000b               L2111:
6610  000b ae05b1        	ldw	x,#1457
6611  000e 89            	pushw	x
6612  000f ae0000        	ldw	x,#0
6613  0012 89            	pushw	x
6614  0013 ae0000        	ldw	x,#L37
6615  0016 cd0000        	call	_assert_failed
6617  0019 5b04          	addw	sp,#4
6618  001b               L6111:
6619                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6621  001b 0d01          	tnz	(OFST+1,sp)
6622  001d 2706          	jreq	L1342
6623                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6625  001f 721a525c      	bset	21084,#5
6627  0023 2004          	jra	L3342
6628  0025               L1342:
6629                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6631  0025 721b525c      	bres	21084,#5
6632  0029               L3342:
6633                     ; 1468 }
6636  0029 84            	pop	a
6637  002a 81            	ret
6674                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6674                     ; 1479 {
6675                     .text:	section	.text,new
6676  0000               _TIM1_OC2NPolarityConfig:
6678  0000 88            	push	a
6679       00000000      OFST:	set	0
6682                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6684  0001 4d            	tnz	a
6685  0002 2704          	jreq	L4211
6686  0004 a188          	cp	a,#136
6687  0006 2603          	jrne	L2211
6688  0008               L4211:
6689  0008 4f            	clr	a
6690  0009 2010          	jra	L6211
6691  000b               L2211:
6692  000b ae05c9        	ldw	x,#1481
6693  000e 89            	pushw	x
6694  000f ae0000        	ldw	x,#0
6695  0012 89            	pushw	x
6696  0013 ae0000        	ldw	x,#L37
6697  0016 cd0000        	call	_assert_failed
6699  0019 5b04          	addw	sp,#4
6700  001b               L6211:
6701                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6703  001b 0d01          	tnz	(OFST+1,sp)
6704  001d 2706          	jreq	L3542
6705                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6707  001f 721e525c      	bset	21084,#7
6709  0023 2004          	jra	L5542
6710  0025               L3542:
6711                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6713  0025 721f525c      	bres	21084,#7
6714  0029               L5542:
6715                     ; 1492 }
6718  0029 84            	pop	a
6719  002a 81            	ret
6756                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6756                     ; 1503 {
6757                     .text:	section	.text,new
6758  0000               _TIM1_OC3PolarityConfig:
6760  0000 88            	push	a
6761       00000000      OFST:	set	0
6764                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6766  0001 4d            	tnz	a
6767  0002 2704          	jreq	L4311
6768  0004 a122          	cp	a,#34
6769  0006 2603          	jrne	L2311
6770  0008               L4311:
6771  0008 4f            	clr	a
6772  0009 2010          	jra	L6311
6773  000b               L2311:
6774  000b ae05e1        	ldw	x,#1505
6775  000e 89            	pushw	x
6776  000f ae0000        	ldw	x,#0
6777  0012 89            	pushw	x
6778  0013 ae0000        	ldw	x,#L37
6779  0016 cd0000        	call	_assert_failed
6781  0019 5b04          	addw	sp,#4
6782  001b               L6311:
6783                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6785  001b 0d01          	tnz	(OFST+1,sp)
6786  001d 2706          	jreq	L5742
6787                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6789  001f 7212525d      	bset	21085,#1
6791  0023 2004          	jra	L7742
6792  0025               L5742:
6793                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6795  0025 7213525d      	bres	21085,#1
6796  0029               L7742:
6797                     ; 1516 }
6800  0029 84            	pop	a
6801  002a 81            	ret
6838                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6838                     ; 1528 {
6839                     .text:	section	.text,new
6840  0000               _TIM1_OC3NPolarityConfig:
6842  0000 88            	push	a
6843       00000000      OFST:	set	0
6846                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6848  0001 4d            	tnz	a
6849  0002 2704          	jreq	L4411
6850  0004 a188          	cp	a,#136
6851  0006 2603          	jrne	L2411
6852  0008               L4411:
6853  0008 4f            	clr	a
6854  0009 2010          	jra	L6411
6855  000b               L2411:
6856  000b ae05fa        	ldw	x,#1530
6857  000e 89            	pushw	x
6858  000f ae0000        	ldw	x,#0
6859  0012 89            	pushw	x
6860  0013 ae0000        	ldw	x,#L37
6861  0016 cd0000        	call	_assert_failed
6863  0019 5b04          	addw	sp,#4
6864  001b               L6411:
6865                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6867  001b 0d01          	tnz	(OFST+1,sp)
6868  001d 2706          	jreq	L7152
6869                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6871  001f 7216525d      	bset	21085,#3
6873  0023 2004          	jra	L1252
6874  0025               L7152:
6875                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6877  0025 7217525d      	bres	21085,#3
6878  0029               L1252:
6879                     ; 1541 }
6882  0029 84            	pop	a
6883  002a 81            	ret
6920                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6920                     ; 1552 {
6921                     .text:	section	.text,new
6922  0000               _TIM1_OC4PolarityConfig:
6924  0000 88            	push	a
6925       00000000      OFST:	set	0
6928                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6930  0001 4d            	tnz	a
6931  0002 2704          	jreq	L4511
6932  0004 a122          	cp	a,#34
6933  0006 2603          	jrne	L2511
6934  0008               L4511:
6935  0008 4f            	clr	a
6936  0009 2010          	jra	L6511
6937  000b               L2511:
6938  000b ae0612        	ldw	x,#1554
6939  000e 89            	pushw	x
6940  000f ae0000        	ldw	x,#0
6941  0012 89            	pushw	x
6942  0013 ae0000        	ldw	x,#L37
6943  0016 cd0000        	call	_assert_failed
6945  0019 5b04          	addw	sp,#4
6946  001b               L6511:
6947                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6949  001b 0d01          	tnz	(OFST+1,sp)
6950  001d 2706          	jreq	L1452
6951                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6953  001f 721a525d      	bset	21085,#5
6955  0023 2004          	jra	L3452
6956  0025               L1452:
6957                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6959  0025 721b525d      	bres	21085,#5
6960  0029               L3452:
6961                     ; 1565 }
6964  0029 84            	pop	a
6965  002a 81            	ret
7011                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7011                     ; 1580 {
7012                     .text:	section	.text,new
7013  0000               _TIM1_CCxCmd:
7015  0000 89            	pushw	x
7016       00000000      OFST:	set	0
7019                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7021  0001 9e            	ld	a,xh
7022  0002 4d            	tnz	a
7023  0003 270f          	jreq	L4611
7024  0005 9e            	ld	a,xh
7025  0006 a101          	cp	a,#1
7026  0008 270a          	jreq	L4611
7027  000a 9e            	ld	a,xh
7028  000b a102          	cp	a,#2
7029  000d 2705          	jreq	L4611
7030  000f 9e            	ld	a,xh
7031  0010 a103          	cp	a,#3
7032  0012 2603          	jrne	L2611
7033  0014               L4611:
7034  0014 4f            	clr	a
7035  0015 2010          	jra	L6611
7036  0017               L2611:
7037  0017 ae062e        	ldw	x,#1582
7038  001a 89            	pushw	x
7039  001b ae0000        	ldw	x,#0
7040  001e 89            	pushw	x
7041  001f ae0000        	ldw	x,#L37
7042  0022 cd0000        	call	_assert_failed
7044  0025 5b04          	addw	sp,#4
7045  0027               L6611:
7046                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7048  0027 0d02          	tnz	(OFST+2,sp)
7049  0029 2706          	jreq	L2711
7050  002b 7b02          	ld	a,(OFST+2,sp)
7051  002d a101          	cp	a,#1
7052  002f 2603          	jrne	L0711
7053  0031               L2711:
7054  0031 4f            	clr	a
7055  0032 2010          	jra	L4711
7056  0034               L0711:
7057  0034 ae062f        	ldw	x,#1583
7058  0037 89            	pushw	x
7059  0038 ae0000        	ldw	x,#0
7060  003b 89            	pushw	x
7061  003c ae0000        	ldw	x,#L37
7062  003f cd0000        	call	_assert_failed
7064  0042 5b04          	addw	sp,#4
7065  0044               L4711:
7066                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
7068  0044 0d01          	tnz	(OFST+1,sp)
7069  0046 2610          	jrne	L7652
7070                     ; 1588     if (NewState != DISABLE)
7072  0048 0d02          	tnz	(OFST+2,sp)
7073  004a 2706          	jreq	L1752
7074                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
7076  004c 7210525c      	bset	21084,#0
7078  0050 2040          	jra	L5752
7079  0052               L1752:
7080                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7082  0052 7211525c      	bres	21084,#0
7083  0056 203a          	jra	L5752
7084  0058               L7652:
7085                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
7087  0058 7b01          	ld	a,(OFST+1,sp)
7088  005a a101          	cp	a,#1
7089  005c 2610          	jrne	L7752
7090                     ; 1601     if (NewState != DISABLE)
7092  005e 0d02          	tnz	(OFST+2,sp)
7093  0060 2706          	jreq	L1062
7094                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
7096  0062 7218525c      	bset	21084,#4
7098  0066 202a          	jra	L5752
7099  0068               L1062:
7100                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7102  0068 7219525c      	bres	21084,#4
7103  006c 2024          	jra	L5752
7104  006e               L7752:
7105                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
7107  006e 7b01          	ld	a,(OFST+1,sp)
7108  0070 a102          	cp	a,#2
7109  0072 2610          	jrne	L7062
7110                     ; 1613     if (NewState != DISABLE)
7112  0074 0d02          	tnz	(OFST+2,sp)
7113  0076 2706          	jreq	L1162
7114                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
7116  0078 7210525d      	bset	21085,#0
7118  007c 2014          	jra	L5752
7119  007e               L1162:
7120                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7122  007e 7211525d      	bres	21085,#0
7123  0082 200e          	jra	L5752
7124  0084               L7062:
7125                     ; 1625     if (NewState != DISABLE)
7127  0084 0d02          	tnz	(OFST+2,sp)
7128  0086 2706          	jreq	L7162
7129                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
7131  0088 7218525d      	bset	21085,#4
7133  008c 2004          	jra	L5752
7134  008e               L7162:
7135                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7137  008e 7219525d      	bres	21085,#4
7138  0092               L5752:
7139                     ; 1634 }
7142  0092 85            	popw	x
7143  0093 81            	ret
7189                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7189                     ; 1648 {
7190                     .text:	section	.text,new
7191  0000               _TIM1_CCxNCmd:
7193  0000 89            	pushw	x
7194       00000000      OFST:	set	0
7197                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7199  0001 9e            	ld	a,xh
7200  0002 4d            	tnz	a
7201  0003 270a          	jreq	L2021
7202  0005 9e            	ld	a,xh
7203  0006 a101          	cp	a,#1
7204  0008 2705          	jreq	L2021
7205  000a 9e            	ld	a,xh
7206  000b a102          	cp	a,#2
7207  000d 2603          	jrne	L0021
7208  000f               L2021:
7209  000f 4f            	clr	a
7210  0010 2010          	jra	L4021
7211  0012               L0021:
7212  0012 ae0672        	ldw	x,#1650
7213  0015 89            	pushw	x
7214  0016 ae0000        	ldw	x,#0
7215  0019 89            	pushw	x
7216  001a ae0000        	ldw	x,#L37
7217  001d cd0000        	call	_assert_failed
7219  0020 5b04          	addw	sp,#4
7220  0022               L4021:
7221                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7223  0022 0d02          	tnz	(OFST+2,sp)
7224  0024 2706          	jreq	L0121
7225  0026 7b02          	ld	a,(OFST+2,sp)
7226  0028 a101          	cp	a,#1
7227  002a 2603          	jrne	L6021
7228  002c               L0121:
7229  002c 4f            	clr	a
7230  002d 2010          	jra	L2121
7231  002f               L6021:
7232  002f ae0673        	ldw	x,#1651
7233  0032 89            	pushw	x
7234  0033 ae0000        	ldw	x,#0
7235  0036 89            	pushw	x
7236  0037 ae0000        	ldw	x,#L37
7237  003a cd0000        	call	_assert_failed
7239  003d 5b04          	addw	sp,#4
7240  003f               L2121:
7241                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
7243  003f 0d01          	tnz	(OFST+1,sp)
7244  0041 2610          	jrne	L5462
7245                     ; 1656     if (NewState != DISABLE)
7247  0043 0d02          	tnz	(OFST+2,sp)
7248  0045 2706          	jreq	L7462
7249                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7251  0047 7214525c      	bset	21084,#2
7253  004b 202a          	jra	L3562
7254  004d               L7462:
7255                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7257  004d 7215525c      	bres	21084,#2
7258  0051 2024          	jra	L3562
7259  0053               L5462:
7260                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
7262  0053 7b01          	ld	a,(OFST+1,sp)
7263  0055 a101          	cp	a,#1
7264  0057 2610          	jrne	L5562
7265                     ; 1668     if (NewState != DISABLE)
7267  0059 0d02          	tnz	(OFST+2,sp)
7268  005b 2706          	jreq	L7562
7269                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7271  005d 721c525c      	bset	21084,#6
7273  0061 2014          	jra	L3562
7274  0063               L7562:
7275                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7277  0063 721d525c      	bres	21084,#6
7278  0067 200e          	jra	L3562
7279  0069               L5562:
7280                     ; 1680     if (NewState != DISABLE)
7282  0069 0d02          	tnz	(OFST+2,sp)
7283  006b 2706          	jreq	L5662
7284                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7286  006d 7214525d      	bset	21085,#2
7288  0071 2004          	jra	L3562
7289  0073               L5662:
7290                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7292  0073 7215525d      	bres	21085,#2
7293  0077               L3562:
7294                     ; 1689 }
7297  0077 85            	popw	x
7298  0078 81            	ret
7344                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7344                     ; 1713 {
7345                     .text:	section	.text,new
7346  0000               _TIM1_SelectOCxM:
7348  0000 89            	pushw	x
7349       00000000      OFST:	set	0
7352                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7354  0001 9e            	ld	a,xh
7355  0002 4d            	tnz	a
7356  0003 270f          	jreq	L0221
7357  0005 9e            	ld	a,xh
7358  0006 a101          	cp	a,#1
7359  0008 270a          	jreq	L0221
7360  000a 9e            	ld	a,xh
7361  000b a102          	cp	a,#2
7362  000d 2705          	jreq	L0221
7363  000f 9e            	ld	a,xh
7364  0010 a103          	cp	a,#3
7365  0012 2603          	jrne	L6121
7366  0014               L0221:
7367  0014 4f            	clr	a
7368  0015 2010          	jra	L2221
7369  0017               L6121:
7370  0017 ae06b3        	ldw	x,#1715
7371  001a 89            	pushw	x
7372  001b ae0000        	ldw	x,#0
7373  001e 89            	pushw	x
7374  001f ae0000        	ldw	x,#L37
7375  0022 cd0000        	call	_assert_failed
7377  0025 5b04          	addw	sp,#4
7378  0027               L2221:
7379                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7381  0027 0d02          	tnz	(OFST+2,sp)
7382  0029 272a          	jreq	L6221
7383  002b 7b02          	ld	a,(OFST+2,sp)
7384  002d a110          	cp	a,#16
7385  002f 2724          	jreq	L6221
7386  0031 7b02          	ld	a,(OFST+2,sp)
7387  0033 a120          	cp	a,#32
7388  0035 271e          	jreq	L6221
7389  0037 7b02          	ld	a,(OFST+2,sp)
7390  0039 a130          	cp	a,#48
7391  003b 2718          	jreq	L6221
7392  003d 7b02          	ld	a,(OFST+2,sp)
7393  003f a160          	cp	a,#96
7394  0041 2712          	jreq	L6221
7395  0043 7b02          	ld	a,(OFST+2,sp)
7396  0045 a170          	cp	a,#112
7397  0047 270c          	jreq	L6221
7398  0049 7b02          	ld	a,(OFST+2,sp)
7399  004b a150          	cp	a,#80
7400  004d 2706          	jreq	L6221
7401  004f 7b02          	ld	a,(OFST+2,sp)
7402  0051 a140          	cp	a,#64
7403  0053 2603          	jrne	L4221
7404  0055               L6221:
7405  0055 4f            	clr	a
7406  0056 2010          	jra	L0321
7407  0058               L4221:
7408  0058 ae06b4        	ldw	x,#1716
7409  005b 89            	pushw	x
7410  005c ae0000        	ldw	x,#0
7411  005f 89            	pushw	x
7412  0060 ae0000        	ldw	x,#L37
7413  0063 cd0000        	call	_assert_failed
7415  0066 5b04          	addw	sp,#4
7416  0068               L0321:
7417                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
7419  0068 0d01          	tnz	(OFST+1,sp)
7420  006a 2610          	jrne	L3172
7421                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7423  006c 7211525c      	bres	21084,#0
7424                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7424                     ; 1725                             | (uint8_t)TIM1_OCMode);
7426  0070 c65258        	ld	a,21080
7427  0073 a48f          	and	a,#143
7428  0075 1a02          	or	a,(OFST+2,sp)
7429  0077 c75258        	ld	21080,a
7431  007a 203a          	jra	L5172
7432  007c               L3172:
7433                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7435  007c 7b01          	ld	a,(OFST+1,sp)
7436  007e a101          	cp	a,#1
7437  0080 2610          	jrne	L7172
7438                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7440  0082 7219525c      	bres	21084,#4
7441                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7441                     ; 1734                             | (uint8_t)TIM1_OCMode);
7443  0086 c65259        	ld	a,21081
7444  0089 a48f          	and	a,#143
7445  008b 1a02          	or	a,(OFST+2,sp)
7446  008d c75259        	ld	21081,a
7448  0090 2024          	jra	L5172
7449  0092               L7172:
7450                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7452  0092 7b01          	ld	a,(OFST+1,sp)
7453  0094 a102          	cp	a,#2
7454  0096 2610          	jrne	L3272
7455                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7457  0098 7211525d      	bres	21085,#0
7458                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7458                     ; 1743                             | (uint8_t)TIM1_OCMode);
7460  009c c6525a        	ld	a,21082
7461  009f a48f          	and	a,#143
7462  00a1 1a02          	or	a,(OFST+2,sp)
7463  00a3 c7525a        	ld	21082,a
7465  00a6 200e          	jra	L5172
7466  00a8               L3272:
7467                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7469  00a8 7219525d      	bres	21085,#4
7470                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7470                     ; 1752                             | (uint8_t)TIM1_OCMode);
7472  00ac c6525b        	ld	a,21083
7473  00af a48f          	and	a,#143
7474  00b1 1a02          	or	a,(OFST+2,sp)
7475  00b3 c7525b        	ld	21083,a
7476  00b6               L5172:
7477                     ; 1754 }
7480  00b6 85            	popw	x
7481  00b7 81            	ret
7513                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7513                     ; 1763 {
7514                     .text:	section	.text,new
7515  0000               _TIM1_SetCounter:
7519                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7521  0000 9e            	ld	a,xh
7522  0001 c7525e        	ld	21086,a
7523                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7525  0004 9f            	ld	a,xl
7526  0005 c7525f        	ld	21087,a
7527                     ; 1767 }
7530  0008 81            	ret
7562                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7562                     ; 1776 {
7563                     .text:	section	.text,new
7564  0000               _TIM1_SetAutoreload:
7568                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7570  0000 9e            	ld	a,xh
7571  0001 c75262        	ld	21090,a
7572                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7574  0004 9f            	ld	a,xl
7575  0005 c75263        	ld	21091,a
7576                     ; 1780  }
7579  0008 81            	ret
7611                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7611                     ; 1789 {
7612                     .text:	section	.text,new
7613  0000               _TIM1_SetCompare1:
7617                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7619  0000 9e            	ld	a,xh
7620  0001 c75265        	ld	21093,a
7621                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7623  0004 9f            	ld	a,xl
7624  0005 c75266        	ld	21094,a
7625                     ; 1793 }
7628  0008 81            	ret
7660                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7660                     ; 1802 {
7661                     .text:	section	.text,new
7662  0000               _TIM1_SetCompare2:
7666                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7668  0000 9e            	ld	a,xh
7669  0001 c75267        	ld	21095,a
7670                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7672  0004 9f            	ld	a,xl
7673  0005 c75268        	ld	21096,a
7674                     ; 1806 }
7677  0008 81            	ret
7709                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7709                     ; 1815 {
7710                     .text:	section	.text,new
7711  0000               _TIM1_SetCompare3:
7715                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7717  0000 9e            	ld	a,xh
7718  0001 c75269        	ld	21097,a
7719                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7721  0004 9f            	ld	a,xl
7722  0005 c7526a        	ld	21098,a
7723                     ; 1819 }
7726  0008 81            	ret
7758                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7758                     ; 1828 {
7759                     .text:	section	.text,new
7760  0000               _TIM1_SetCompare4:
7764                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7766  0000 9e            	ld	a,xh
7767  0001 c7526b        	ld	21099,a
7768                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7770  0004 9f            	ld	a,xl
7771  0005 c7526c        	ld	21100,a
7772                     ; 1832 }
7775  0008 81            	ret
7812                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7812                     ; 1845 {
7813                     .text:	section	.text,new
7814  0000               _TIM1_SetIC1Prescaler:
7816  0000 88            	push	a
7817       00000000      OFST:	set	0
7820                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7822  0001 4d            	tnz	a
7823  0002 270c          	jreq	L2521
7824  0004 a104          	cp	a,#4
7825  0006 2708          	jreq	L2521
7826  0008 a108          	cp	a,#8
7827  000a 2704          	jreq	L2521
7828  000c a10c          	cp	a,#12
7829  000e 2603          	jrne	L0521
7830  0010               L2521:
7831  0010 4f            	clr	a
7832  0011 2010          	jra	L4521
7833  0013               L0521:
7834  0013 ae0737        	ldw	x,#1847
7835  0016 89            	pushw	x
7836  0017 ae0000        	ldw	x,#0
7837  001a 89            	pushw	x
7838  001b ae0000        	ldw	x,#L37
7839  001e cd0000        	call	_assert_failed
7841  0021 5b04          	addw	sp,#4
7842  0023               L4521:
7843                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7843                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7845  0023 c65258        	ld	a,21080
7846  0026 a4f3          	and	a,#243
7847  0028 1a01          	or	a,(OFST+1,sp)
7848  002a c75258        	ld	21080,a
7849                     ; 1852 }
7852  002d 84            	pop	a
7853  002e 81            	ret
7890                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7890                     ; 1865 {
7891                     .text:	section	.text,new
7892  0000               _TIM1_SetIC2Prescaler:
7894  0000 88            	push	a
7895       00000000      OFST:	set	0
7898                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7900  0001 4d            	tnz	a
7901  0002 270c          	jreq	L2621
7902  0004 a104          	cp	a,#4
7903  0006 2708          	jreq	L2621
7904  0008 a108          	cp	a,#8
7905  000a 2704          	jreq	L2621
7906  000c a10c          	cp	a,#12
7907  000e 2603          	jrne	L0621
7908  0010               L2621:
7909  0010 4f            	clr	a
7910  0011 2010          	jra	L4621
7911  0013               L0621:
7912  0013 ae074c        	ldw	x,#1868
7913  0016 89            	pushw	x
7914  0017 ae0000        	ldw	x,#0
7915  001a 89            	pushw	x
7916  001b ae0000        	ldw	x,#L37
7917  001e cd0000        	call	_assert_failed
7919  0021 5b04          	addw	sp,#4
7920  0023               L4621:
7921                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7921                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7923  0023 c65259        	ld	a,21081
7924  0026 a4f3          	and	a,#243
7925  0028 1a01          	or	a,(OFST+1,sp)
7926  002a c75259        	ld	21081,a
7927                     ; 1873 }
7930  002d 84            	pop	a
7931  002e 81            	ret
7968                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7968                     ; 1886 {
7969                     .text:	section	.text,new
7970  0000               _TIM1_SetIC3Prescaler:
7972  0000 88            	push	a
7973       00000000      OFST:	set	0
7976                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
7978  0001 4d            	tnz	a
7979  0002 270c          	jreq	L2721
7980  0004 a104          	cp	a,#4
7981  0006 2708          	jreq	L2721
7982  0008 a108          	cp	a,#8
7983  000a 2704          	jreq	L2721
7984  000c a10c          	cp	a,#12
7985  000e 2603          	jrne	L0721
7986  0010               L2721:
7987  0010 4f            	clr	a
7988  0011 2010          	jra	L4721
7989  0013               L0721:
7990  0013 ae0761        	ldw	x,#1889
7991  0016 89            	pushw	x
7992  0017 ae0000        	ldw	x,#0
7993  001a 89            	pushw	x
7994  001b ae0000        	ldw	x,#L37
7995  001e cd0000        	call	_assert_failed
7997  0021 5b04          	addw	sp,#4
7998  0023               L4721:
7999                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
7999                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
8001  0023 c6525a        	ld	a,21082
8002  0026 a4f3          	and	a,#243
8003  0028 1a01          	or	a,(OFST+1,sp)
8004  002a c7525a        	ld	21082,a
8005                     ; 1894 }
8008  002d 84            	pop	a
8009  002e 81            	ret
8046                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8046                     ; 1907 {
8047                     .text:	section	.text,new
8048  0000               _TIM1_SetIC4Prescaler:
8050  0000 88            	push	a
8051       00000000      OFST:	set	0
8054                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8056  0001 4d            	tnz	a
8057  0002 270c          	jreq	L2031
8058  0004 a104          	cp	a,#4
8059  0006 2708          	jreq	L2031
8060  0008 a108          	cp	a,#8
8061  000a 2704          	jreq	L2031
8062  000c a10c          	cp	a,#12
8063  000e 2603          	jrne	L0031
8064  0010               L2031:
8065  0010 4f            	clr	a
8066  0011 2010          	jra	L4031
8067  0013               L0031:
8068  0013 ae0776        	ldw	x,#1910
8069  0016 89            	pushw	x
8070  0017 ae0000        	ldw	x,#0
8071  001a 89            	pushw	x
8072  001b ae0000        	ldw	x,#L37
8073  001e cd0000        	call	_assert_failed
8075  0021 5b04          	addw	sp,#4
8076  0023               L4031:
8077                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8077                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
8079  0023 c6525b        	ld	a,21083
8080  0026 a4f3          	and	a,#243
8081  0028 1a01          	or	a,(OFST+1,sp)
8082  002a c7525b        	ld	21083,a
8083                     ; 1915 }
8086  002d 84            	pop	a
8087  002e 81            	ret
8133                     ; 1922 uint16_t TIM1_GetCapture1(void)
8133                     ; 1923 {
8134                     .text:	section	.text,new
8135  0000               _TIM1_GetCapture1:
8137  0000 5204          	subw	sp,#4
8138       00000004      OFST:	set	4
8141                     ; 1926   uint16_t tmpccr1 = 0;
8143                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
8147                     ; 1929   tmpccr1h = TIM1->CCR1H;
8149  0002 c65265        	ld	a,21093
8150  0005 6b02          	ld	(OFST-2,sp),a
8152                     ; 1930   tmpccr1l = TIM1->CCR1L;
8154  0007 c65266        	ld	a,21094
8155  000a 6b01          	ld	(OFST-3,sp),a
8157                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
8159  000c 7b01          	ld	a,(OFST-3,sp)
8160  000e 5f            	clrw	x
8161  000f 97            	ld	xl,a
8162  0010 1f03          	ldw	(OFST-1,sp),x
8164                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8166  0012 7b02          	ld	a,(OFST-2,sp)
8167  0014 5f            	clrw	x
8168  0015 97            	ld	xl,a
8169  0016 4f            	clr	a
8170  0017 02            	rlwa	x,a
8171  0018 01            	rrwa	x,a
8172  0019 1a04          	or	a,(OFST+0,sp)
8173  001b 01            	rrwa	x,a
8174  001c 1a03          	or	a,(OFST-1,sp)
8175  001e 01            	rrwa	x,a
8176  001f 1f03          	ldw	(OFST-1,sp),x
8178                     ; 1935   return (uint16_t)tmpccr1;
8180  0021 1e03          	ldw	x,(OFST-1,sp)
8183  0023 5b04          	addw	sp,#4
8184  0025 81            	ret
8230                     ; 1943 uint16_t TIM1_GetCapture2(void)
8230                     ; 1944 {
8231                     .text:	section	.text,new
8232  0000               _TIM1_GetCapture2:
8234  0000 5204          	subw	sp,#4
8235       00000004      OFST:	set	4
8238                     ; 1947   uint16_t tmpccr2 = 0;
8240                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
8244                     ; 1950   tmpccr2h = TIM1->CCR2H;
8246  0002 c65267        	ld	a,21095
8247  0005 6b02          	ld	(OFST-2,sp),a
8249                     ; 1951   tmpccr2l = TIM1->CCR2L;
8251  0007 c65268        	ld	a,21096
8252  000a 6b01          	ld	(OFST-3,sp),a
8254                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
8256  000c 7b01          	ld	a,(OFST-3,sp)
8257  000e 5f            	clrw	x
8258  000f 97            	ld	xl,a
8259  0010 1f03          	ldw	(OFST-1,sp),x
8261                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8263  0012 7b02          	ld	a,(OFST-2,sp)
8264  0014 5f            	clrw	x
8265  0015 97            	ld	xl,a
8266  0016 4f            	clr	a
8267  0017 02            	rlwa	x,a
8268  0018 01            	rrwa	x,a
8269  0019 1a04          	or	a,(OFST+0,sp)
8270  001b 01            	rrwa	x,a
8271  001c 1a03          	or	a,(OFST-1,sp)
8272  001e 01            	rrwa	x,a
8273  001f 1f03          	ldw	(OFST-1,sp),x
8275                     ; 1956   return (uint16_t)tmpccr2;
8277  0021 1e03          	ldw	x,(OFST-1,sp)
8280  0023 5b04          	addw	sp,#4
8281  0025 81            	ret
8327                     ; 1964 uint16_t TIM1_GetCapture3(void)
8327                     ; 1965 {
8328                     .text:	section	.text,new
8329  0000               _TIM1_GetCapture3:
8331  0000 5204          	subw	sp,#4
8332       00000004      OFST:	set	4
8335                     ; 1967   uint16_t tmpccr3 = 0;
8337                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
8341                     ; 1970   tmpccr3h = TIM1->CCR3H;
8343  0002 c65269        	ld	a,21097
8344  0005 6b02          	ld	(OFST-2,sp),a
8346                     ; 1971   tmpccr3l = TIM1->CCR3L;
8348  0007 c6526a        	ld	a,21098
8349  000a 6b01          	ld	(OFST-3,sp),a
8351                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
8353  000c 7b01          	ld	a,(OFST-3,sp)
8354  000e 5f            	clrw	x
8355  000f 97            	ld	xl,a
8356  0010 1f03          	ldw	(OFST-1,sp),x
8358                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8360  0012 7b02          	ld	a,(OFST-2,sp)
8361  0014 5f            	clrw	x
8362  0015 97            	ld	xl,a
8363  0016 4f            	clr	a
8364  0017 02            	rlwa	x,a
8365  0018 01            	rrwa	x,a
8366  0019 1a04          	or	a,(OFST+0,sp)
8367  001b 01            	rrwa	x,a
8368  001c 1a03          	or	a,(OFST-1,sp)
8369  001e 01            	rrwa	x,a
8370  001f 1f03          	ldw	(OFST-1,sp),x
8372                     ; 1976   return (uint16_t)tmpccr3;
8374  0021 1e03          	ldw	x,(OFST-1,sp)
8377  0023 5b04          	addw	sp,#4
8378  0025 81            	ret
8424                     ; 1984 uint16_t TIM1_GetCapture4(void)
8424                     ; 1985 {
8425                     .text:	section	.text,new
8426  0000               _TIM1_GetCapture4:
8428  0000 5204          	subw	sp,#4
8429       00000004      OFST:	set	4
8432                     ; 1987   uint16_t tmpccr4 = 0;
8434                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
8438                     ; 1990   tmpccr4h = TIM1->CCR4H;
8440  0002 c6526b        	ld	a,21099
8441  0005 6b02          	ld	(OFST-2,sp),a
8443                     ; 1991   tmpccr4l = TIM1->CCR4L;
8445  0007 c6526c        	ld	a,21100
8446  000a 6b01          	ld	(OFST-3,sp),a
8448                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
8450  000c 7b01          	ld	a,(OFST-3,sp)
8451  000e 5f            	clrw	x
8452  000f 97            	ld	xl,a
8453  0010 1f03          	ldw	(OFST-1,sp),x
8455                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8457  0012 7b02          	ld	a,(OFST-2,sp)
8458  0014 5f            	clrw	x
8459  0015 97            	ld	xl,a
8460  0016 4f            	clr	a
8461  0017 02            	rlwa	x,a
8462  0018 01            	rrwa	x,a
8463  0019 1a04          	or	a,(OFST+0,sp)
8464  001b 01            	rrwa	x,a
8465  001c 1a03          	or	a,(OFST-1,sp)
8466  001e 01            	rrwa	x,a
8467  001f 1f03          	ldw	(OFST-1,sp),x
8469                     ; 1996   return (uint16_t)tmpccr4;
8471  0021 1e03          	ldw	x,(OFST-1,sp)
8474  0023 5b04          	addw	sp,#4
8475  0025 81            	ret
8507                     ; 2004 uint16_t TIM1_GetCounter(void)
8507                     ; 2005 {
8508                     .text:	section	.text,new
8509  0000               _TIM1_GetCounter:
8511  0000 89            	pushw	x
8512       00000002      OFST:	set	2
8515                     ; 2006   uint16_t tmpcntr = 0;
8517                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8519  0001 c6525e        	ld	a,21086
8520  0004 5f            	clrw	x
8521  0005 97            	ld	xl,a
8522  0006 4f            	clr	a
8523  0007 02            	rlwa	x,a
8524  0008 1f01          	ldw	(OFST-1,sp),x
8526                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8528  000a c6525f        	ld	a,21087
8529  000d 5f            	clrw	x
8530  000e 97            	ld	xl,a
8531  000f 01            	rrwa	x,a
8532  0010 1a02          	or	a,(OFST+0,sp)
8533  0012 01            	rrwa	x,a
8534  0013 1a01          	or	a,(OFST-1,sp)
8535  0015 01            	rrwa	x,a
8538  0016 5b02          	addw	sp,#2
8539  0018 81            	ret
8571                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8571                     ; 2020 {
8572                     .text:	section	.text,new
8573  0000               _TIM1_GetPrescaler:
8575  0000 89            	pushw	x
8576       00000002      OFST:	set	2
8579                     ; 2021   uint16_t temp = 0;
8581                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8583  0001 c65260        	ld	a,21088
8584  0004 5f            	clrw	x
8585  0005 97            	ld	xl,a
8586  0006 4f            	clr	a
8587  0007 02            	rlwa	x,a
8588  0008 1f01          	ldw	(OFST-1,sp),x
8590                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8592  000a c65261        	ld	a,21089
8593  000d 5f            	clrw	x
8594  000e 97            	ld	xl,a
8595  000f 01            	rrwa	x,a
8596  0010 1a02          	or	a,(OFST+0,sp)
8597  0012 01            	rrwa	x,a
8598  0013 1a01          	or	a,(OFST-1,sp)
8599  0015 01            	rrwa	x,a
8602  0016 5b02          	addw	sp,#2
8603  0018 81            	ret
8774                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8774                     ; 2048 {
8775                     .text:	section	.text,new
8776  0000               _TIM1_GetFlagStatus:
8778  0000 89            	pushw	x
8779  0001 89            	pushw	x
8780       00000002      OFST:	set	2
8783                     ; 2049   FlagStatus bitstatus = RESET;
8785                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8789                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8791  0002 a30001        	cpw	x,#1
8792  0005 2737          	jreq	L6231
8793  0007 a30002        	cpw	x,#2
8794  000a 2732          	jreq	L6231
8795  000c a30004        	cpw	x,#4
8796  000f 272d          	jreq	L6231
8797  0011 a30008        	cpw	x,#8
8798  0014 2728          	jreq	L6231
8799  0016 a30010        	cpw	x,#16
8800  0019 2723          	jreq	L6231
8801  001b a30020        	cpw	x,#32
8802  001e 271e          	jreq	L6231
8803  0020 a30040        	cpw	x,#64
8804  0023 2719          	jreq	L6231
8805  0025 a30080        	cpw	x,#128
8806  0028 2714          	jreq	L6231
8807  002a a30200        	cpw	x,#512
8808  002d 270f          	jreq	L6231
8809  002f a30400        	cpw	x,#1024
8810  0032 270a          	jreq	L6231
8811  0034 a30800        	cpw	x,#2048
8812  0037 2705          	jreq	L6231
8813  0039 a31000        	cpw	x,#4096
8814  003c 2603          	jrne	L4231
8815  003e               L6231:
8816  003e 4f            	clr	a
8817  003f 2010          	jra	L0331
8818  0041               L4231:
8819  0041 ae0805        	ldw	x,#2053
8820  0044 89            	pushw	x
8821  0045 ae0000        	ldw	x,#0
8822  0048 89            	pushw	x
8823  0049 ae0000        	ldw	x,#L37
8824  004c cd0000        	call	_assert_failed
8826  004f 5b04          	addw	sp,#4
8827  0051               L0331:
8828                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8830  0051 c65255        	ld	a,21077
8831  0054 1404          	and	a,(OFST+2,sp)
8832  0056 6b01          	ld	(OFST-1,sp),a
8834                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8836  0058 7b03          	ld	a,(OFST+1,sp)
8837  005a 6b02          	ld	(OFST+0,sp),a
8839                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8841  005c c65256        	ld	a,21078
8842  005f 1402          	and	a,(OFST+0,sp)
8843  0061 1a01          	or	a,(OFST-1,sp)
8844  0063 2706          	jreq	L1533
8845                     ; 2060     bitstatus = SET;
8847  0065 a601          	ld	a,#1
8848  0067 6b02          	ld	(OFST+0,sp),a
8851  0069 2002          	jra	L3533
8852  006b               L1533:
8853                     ; 2064     bitstatus = RESET;
8855  006b 0f02          	clr	(OFST+0,sp)
8857  006d               L3533:
8858                     ; 2066   return (FlagStatus)(bitstatus);
8860  006d 7b02          	ld	a,(OFST+0,sp)
8863  006f 5b04          	addw	sp,#4
8864  0071 81            	ret
8900                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8900                     ; 2088 {
8901                     .text:	section	.text,new
8902  0000               _TIM1_ClearFlag:
8904  0000 89            	pushw	x
8905       00000000      OFST:	set	0
8908                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8910  0001 01            	rrwa	x,a
8911  0002 9f            	ld	a,xl
8912  0003 a4e1          	and	a,#225
8913  0005 97            	ld	xl,a
8914  0006 4f            	clr	a
8915  0007 02            	rlwa	x,a
8916  0008 5d            	tnzw	x
8917  0009 2607          	jrne	L4331
8918  000b 1e01          	ldw	x,(OFST+1,sp)
8919  000d 2703          	jreq	L4331
8920  000f 4f            	clr	a
8921  0010 2010          	jra	L6331
8922  0012               L4331:
8923  0012 ae082a        	ldw	x,#2090
8924  0015 89            	pushw	x
8925  0016 ae0000        	ldw	x,#0
8926  0019 89            	pushw	x
8927  001a ae0000        	ldw	x,#L37
8928  001d cd0000        	call	_assert_failed
8930  0020 5b04          	addw	sp,#4
8931  0022               L6331:
8932                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8934  0022 7b02          	ld	a,(OFST+2,sp)
8935  0024 43            	cpl	a
8936  0025 c75255        	ld	21077,a
8937                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8937                     ; 2095                         (uint8_t)0x1E);
8939  0028 7b01          	ld	a,(OFST+1,sp)
8940  002a 43            	cpl	a
8941  002b a41e          	and	a,#30
8942  002d c75256        	ld	21078,a
8943                     ; 2096 }
8946  0030 85            	popw	x
8947  0031 81            	ret
9008                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
9008                     ; 2113 {
9009                     .text:	section	.text,new
9010  0000               _TIM1_GetITStatus:
9012  0000 88            	push	a
9013  0001 89            	pushw	x
9014       00000002      OFST:	set	2
9017                     ; 2114   ITStatus bitstatus = RESET;
9019                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
9023                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
9025  0002 a101          	cp	a,#1
9026  0004 271c          	jreq	L4431
9027  0006 a102          	cp	a,#2
9028  0008 2718          	jreq	L4431
9029  000a a104          	cp	a,#4
9030  000c 2714          	jreq	L4431
9031  000e a108          	cp	a,#8
9032  0010 2710          	jreq	L4431
9033  0012 a110          	cp	a,#16
9034  0014 270c          	jreq	L4431
9035  0016 a120          	cp	a,#32
9036  0018 2708          	jreq	L4431
9037  001a a140          	cp	a,#64
9038  001c 2704          	jreq	L4431
9039  001e a180          	cp	a,#128
9040  0020 2603          	jrne	L2431
9041  0022               L4431:
9042  0022 4f            	clr	a
9043  0023 2010          	jra	L6431
9044  0025               L2431:
9045  0025 ae0846        	ldw	x,#2118
9046  0028 89            	pushw	x
9047  0029 ae0000        	ldw	x,#0
9048  002c 89            	pushw	x
9049  002d ae0000        	ldw	x,#L37
9050  0030 cd0000        	call	_assert_failed
9052  0033 5b04          	addw	sp,#4
9053  0035               L6431:
9054                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9056  0035 c65255        	ld	a,21077
9057  0038 1403          	and	a,(OFST+1,sp)
9058  003a 6b01          	ld	(OFST-1,sp),a
9060                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9062  003c c65254        	ld	a,21076
9063  003f 1403          	and	a,(OFST+1,sp)
9064  0041 6b02          	ld	(OFST+0,sp),a
9066                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9068  0043 0d01          	tnz	(OFST-1,sp)
9069  0045 270a          	jreq	L1243
9071  0047 0d02          	tnz	(OFST+0,sp)
9072  0049 2706          	jreq	L1243
9073                     ; 2126     bitstatus = SET;
9075  004b a601          	ld	a,#1
9076  004d 6b02          	ld	(OFST+0,sp),a
9079  004f 2002          	jra	L3243
9080  0051               L1243:
9081                     ; 2130     bitstatus = RESET;
9083  0051 0f02          	clr	(OFST+0,sp)
9085  0053               L3243:
9086                     ; 2132   return (ITStatus)(bitstatus);
9088  0053 7b02          	ld	a,(OFST+0,sp)
9091  0055 5b03          	addw	sp,#3
9092  0057 81            	ret
9129                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9129                     ; 2150 {
9130                     .text:	section	.text,new
9131  0000               _TIM1_ClearITPendingBit:
9133  0000 88            	push	a
9134       00000000      OFST:	set	0
9137                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
9139  0001 4d            	tnz	a
9140  0002 2703          	jreq	L2531
9141  0004 4f            	clr	a
9142  0005 2010          	jra	L4531
9143  0007               L2531:
9144  0007 ae0868        	ldw	x,#2152
9145  000a 89            	pushw	x
9146  000b ae0000        	ldw	x,#0
9147  000e 89            	pushw	x
9148  000f ae0000        	ldw	x,#L37
9149  0012 cd0000        	call	_assert_failed
9151  0015 5b04          	addw	sp,#4
9152  0017               L4531:
9153                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9155  0017 7b01          	ld	a,(OFST+1,sp)
9156  0019 43            	cpl	a
9157  001a c75255        	ld	21077,a
9158                     ; 2156 }
9161  001d 84            	pop	a
9162  001e 81            	ret
9208                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
9208                     ; 2175                        uint8_t TIM1_ICSelection,
9208                     ; 2176                        uint8_t TIM1_ICFilter)
9208                     ; 2177 {
9209                     .text:	section	.text,new
9210  0000               L3_TI1_Config:
9212  0000 89            	pushw	x
9213  0001 88            	push	a
9214       00000001      OFST:	set	1
9217                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9219  0002 7211525c      	bres	21084,#0
9220                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9220                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9222  0006 7b06          	ld	a,(OFST+5,sp)
9223  0008 97            	ld	xl,a
9224  0009 a610          	ld	a,#16
9225  000b 42            	mul	x,a
9226  000c 9f            	ld	a,xl
9227  000d 1a03          	or	a,(OFST+2,sp)
9228  000f 6b01          	ld	(OFST+0,sp),a
9230  0011 c65258        	ld	a,21080
9231  0014 a40c          	and	a,#12
9232  0016 1a01          	or	a,(OFST+0,sp)
9233  0018 c75258        	ld	21080,a
9234                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9236  001b 0d02          	tnz	(OFST+1,sp)
9237  001d 2706          	jreq	L3643
9238                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
9240  001f 7212525c      	bset	21084,#1
9242  0023 2004          	jra	L5643
9243  0025               L3643:
9244                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9246  0025 7213525c      	bres	21084,#1
9247  0029               L5643:
9248                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9250  0029 7210525c      	bset	21084,#0
9251                     ; 2197 }
9254  002d 5b03          	addw	sp,#3
9255  002f 81            	ret
9301                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
9301                     ; 2216                        uint8_t TIM1_ICSelection,
9301                     ; 2217                        uint8_t TIM1_ICFilter)
9301                     ; 2218 {
9302                     .text:	section	.text,new
9303  0000               L5_TI2_Config:
9305  0000 89            	pushw	x
9306  0001 88            	push	a
9307       00000001      OFST:	set	1
9310                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9312  0002 7219525c      	bres	21084,#4
9313                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9313                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9315  0006 7b06          	ld	a,(OFST+5,sp)
9316  0008 97            	ld	xl,a
9317  0009 a610          	ld	a,#16
9318  000b 42            	mul	x,a
9319  000c 9f            	ld	a,xl
9320  000d 1a03          	or	a,(OFST+2,sp)
9321  000f 6b01          	ld	(OFST+0,sp),a
9323  0011 c65259        	ld	a,21081
9324  0014 a40c          	and	a,#12
9325  0016 1a01          	or	a,(OFST+0,sp)
9326  0018 c75259        	ld	21081,a
9327                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9329  001b 0d02          	tnz	(OFST+1,sp)
9330  001d 2706          	jreq	L7053
9331                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
9333  001f 721a525c      	bset	21084,#5
9335  0023 2004          	jra	L1153
9336  0025               L7053:
9337                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9339  0025 721b525c      	bres	21084,#5
9340  0029               L1153:
9341                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9343  0029 7218525c      	bset	21084,#4
9344                     ; 2236 }
9347  002d 5b03          	addw	sp,#3
9348  002f 81            	ret
9394                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
9394                     ; 2255                        uint8_t TIM1_ICSelection,
9394                     ; 2256                        uint8_t TIM1_ICFilter)
9394                     ; 2257 {
9395                     .text:	section	.text,new
9396  0000               L7_TI3_Config:
9398  0000 89            	pushw	x
9399  0001 88            	push	a
9400       00000001      OFST:	set	1
9403                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9405  0002 7211525d      	bres	21085,#0
9406                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9406                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9408  0006 7b06          	ld	a,(OFST+5,sp)
9409  0008 97            	ld	xl,a
9410  0009 a610          	ld	a,#16
9411  000b 42            	mul	x,a
9412  000c 9f            	ld	a,xl
9413  000d 1a03          	or	a,(OFST+2,sp)
9414  000f 6b01          	ld	(OFST+0,sp),a
9416  0011 c6525a        	ld	a,21082
9417  0014 a40c          	and	a,#12
9418  0016 1a01          	or	a,(OFST+0,sp)
9419  0018 c7525a        	ld	21082,a
9420                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9422  001b 0d02          	tnz	(OFST+1,sp)
9423  001d 2706          	jreq	L3353
9424                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
9426  001f 7212525d      	bset	21085,#1
9428  0023 2004          	jra	L5353
9429  0025               L3353:
9430                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9432  0025 7213525d      	bres	21085,#1
9433  0029               L5353:
9434                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9436  0029 7210525d      	bset	21085,#0
9437                     ; 2276 }
9440  002d 5b03          	addw	sp,#3
9441  002f 81            	ret
9487                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
9487                     ; 2295                        uint8_t TIM1_ICSelection,
9487                     ; 2296                        uint8_t TIM1_ICFilter)
9487                     ; 2297 {
9488                     .text:	section	.text,new
9489  0000               L11_TI4_Config:
9491  0000 89            	pushw	x
9492  0001 88            	push	a
9493       00000001      OFST:	set	1
9496                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9498  0002 7219525d      	bres	21085,#4
9499                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9499                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9501  0006 7b06          	ld	a,(OFST+5,sp)
9502  0008 97            	ld	xl,a
9503  0009 a610          	ld	a,#16
9504  000b 42            	mul	x,a
9505  000c 9f            	ld	a,xl
9506  000d 1a03          	or	a,(OFST+2,sp)
9507  000f 6b01          	ld	(OFST+0,sp),a
9509  0011 c6525b        	ld	a,21083
9510  0014 a40c          	and	a,#12
9511  0016 1a01          	or	a,(OFST+0,sp)
9512  0018 c7525b        	ld	21083,a
9513                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9515  001b 0d02          	tnz	(OFST+1,sp)
9516  001d 2706          	jreq	L7553
9517                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9519  001f 721a525d      	bset	21085,#5
9521  0023 2004          	jra	L1653
9522  0025               L7553:
9523                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9525  0025 721b525d      	bres	21085,#5
9526  0029               L1653:
9527                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9529  0029 7218525d      	bset	21085,#4
9530                     ; 2317 }
9533  002d 5b03          	addw	sp,#3
9534  002f 81            	ret
9547                     	xdef	_TIM1_ClearITPendingBit
9548                     	xdef	_TIM1_GetITStatus
9549                     	xdef	_TIM1_ClearFlag
9550                     	xdef	_TIM1_GetFlagStatus
9551                     	xdef	_TIM1_GetPrescaler
9552                     	xdef	_TIM1_GetCounter
9553                     	xdef	_TIM1_GetCapture4
9554                     	xdef	_TIM1_GetCapture3
9555                     	xdef	_TIM1_GetCapture2
9556                     	xdef	_TIM1_GetCapture1
9557                     	xdef	_TIM1_SetIC4Prescaler
9558                     	xdef	_TIM1_SetIC3Prescaler
9559                     	xdef	_TIM1_SetIC2Prescaler
9560                     	xdef	_TIM1_SetIC1Prescaler
9561                     	xdef	_TIM1_SetCompare4
9562                     	xdef	_TIM1_SetCompare3
9563                     	xdef	_TIM1_SetCompare2
9564                     	xdef	_TIM1_SetCompare1
9565                     	xdef	_TIM1_SetAutoreload
9566                     	xdef	_TIM1_SetCounter
9567                     	xdef	_TIM1_SelectOCxM
9568                     	xdef	_TIM1_CCxNCmd
9569                     	xdef	_TIM1_CCxCmd
9570                     	xdef	_TIM1_OC4PolarityConfig
9571                     	xdef	_TIM1_OC3NPolarityConfig
9572                     	xdef	_TIM1_OC3PolarityConfig
9573                     	xdef	_TIM1_OC2NPolarityConfig
9574                     	xdef	_TIM1_OC2PolarityConfig
9575                     	xdef	_TIM1_OC1NPolarityConfig
9576                     	xdef	_TIM1_OC1PolarityConfig
9577                     	xdef	_TIM1_GenerateEvent
9578                     	xdef	_TIM1_OC4FastConfig
9579                     	xdef	_TIM1_OC3FastConfig
9580                     	xdef	_TIM1_OC2FastConfig
9581                     	xdef	_TIM1_OC1FastConfig
9582                     	xdef	_TIM1_OC4PreloadConfig
9583                     	xdef	_TIM1_OC3PreloadConfig
9584                     	xdef	_TIM1_OC2PreloadConfig
9585                     	xdef	_TIM1_OC1PreloadConfig
9586                     	xdef	_TIM1_CCPreloadControl
9587                     	xdef	_TIM1_SelectCOM
9588                     	xdef	_TIM1_ARRPreloadConfig
9589                     	xdef	_TIM1_ForcedOC4Config
9590                     	xdef	_TIM1_ForcedOC3Config
9591                     	xdef	_TIM1_ForcedOC2Config
9592                     	xdef	_TIM1_ForcedOC1Config
9593                     	xdef	_TIM1_CounterModeConfig
9594                     	xdef	_TIM1_PrescalerConfig
9595                     	xdef	_TIM1_EncoderInterfaceConfig
9596                     	xdef	_TIM1_SelectMasterSlaveMode
9597                     	xdef	_TIM1_SelectSlaveMode
9598                     	xdef	_TIM1_SelectOutputTrigger
9599                     	xdef	_TIM1_SelectOnePulseMode
9600                     	xdef	_TIM1_SelectHallSensor
9601                     	xdef	_TIM1_UpdateRequestConfig
9602                     	xdef	_TIM1_UpdateDisableConfig
9603                     	xdef	_TIM1_SelectInputTrigger
9604                     	xdef	_TIM1_TIxExternalClockConfig
9605                     	xdef	_TIM1_ETRConfig
9606                     	xdef	_TIM1_ETRClockMode2Config
9607                     	xdef	_TIM1_ETRClockMode1Config
9608                     	xdef	_TIM1_InternalClockConfig
9609                     	xdef	_TIM1_ITConfig
9610                     	xdef	_TIM1_CtrlPWMOutputs
9611                     	xdef	_TIM1_Cmd
9612                     	xdef	_TIM1_PWMIConfig
9613                     	xdef	_TIM1_ICInit
9614                     	xdef	_TIM1_BDTRConfig
9615                     	xdef	_TIM1_OC4Init
9616                     	xdef	_TIM1_OC3Init
9617                     	xdef	_TIM1_OC2Init
9618                     	xdef	_TIM1_OC1Init
9619                     	xdef	_TIM1_TimeBaseInit
9620                     	xdef	_TIM1_DeInit
9621                     	xref	_assert_failed
9622                     .const:	section	.text
9623  0000               L37:
9624  0000 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
9625  0012 74696d312e63  	dc.b	"tim1.c",0
9645                     	end
