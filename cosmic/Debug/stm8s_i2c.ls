   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 67 void I2C_DeInit(void)
  45                     ; 68 {
  47                     .text:	section	.text,new
  48  0000               _I2C_DeInit:
  52                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  54  0000 725f5210      	clr	21008
  55                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  57  0004 725f5211      	clr	21009
  58                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  60  0008 725f5212      	clr	21010
  61                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  63  000c 725f5213      	clr	21011
  64                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  66  0010 725f5214      	clr	21012
  67                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  69  0014 725f521a      	clr	21018
  70                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  72  0018 725f521b      	clr	21019
  73                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  75  001c 725f521c      	clr	21020
  76                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  78  0020 3502521d      	mov	21021,#2
  79                     ; 78 }
  82  0024 81            	ret
 250                     .const:	section	.text
 251  0000               L44:
 252  0000 00061a81      	dc.l	400001
 253  0004               L05:
 254  0004 000186a1      	dc.l	100001
 255  0008               L25:
 256  0008 000f4240      	dc.l	1000000
 257                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 257                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 257                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 257                     ; 99 {
 258                     .text:	section	.text,new
 259  0000               _I2C_Init:
 261  0000 5209          	subw	sp,#9
 262       00000009      OFST:	set	9
 265                     ; 100   uint16_t result = 0x0004;
 267                     ; 101   uint16_t tmpval = 0;
 269                     ; 102   uint8_t tmpccrh = 0;
 271  0002 0f07          	clr	(OFST-2,sp)
 273                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 275  0004 0d13          	tnz	(OFST+10,sp)
 276  0006 270c          	jreq	L21
 277  0008 7b13          	ld	a,(OFST+10,sp)
 278  000a a101          	cp	a,#1
 279  000c 2706          	jreq	L21
 280  000e 7b13          	ld	a,(OFST+10,sp)
 281  0010 a102          	cp	a,#2
 282  0012 2603          	jrne	L01
 283  0014               L21:
 284  0014 4f            	clr	a
 285  0015 2010          	jra	L41
 286  0017               L01:
 287  0017 ae0069        	ldw	x,#105
 288  001a 89            	pushw	x
 289  001b ae0000        	ldw	x,#0
 290  001e 89            	pushw	x
 291  001f ae000c        	ldw	x,#L511
 292  0022 cd0000        	call	_assert_failed
 294  0025 5b04          	addw	sp,#4
 295  0027               L41:
 296                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 298  0027 0d14          	tnz	(OFST+11,sp)
 299  0029 2706          	jreq	L02
 300  002b 7b14          	ld	a,(OFST+11,sp)
 301  002d a180          	cp	a,#128
 302  002f 2603          	jrne	L61
 303  0031               L02:
 304  0031 4f            	clr	a
 305  0032 2010          	jra	L22
 306  0034               L61:
 307  0034 ae006a        	ldw	x,#106
 308  0037 89            	pushw	x
 309  0038 ae0000        	ldw	x,#0
 310  003b 89            	pushw	x
 311  003c ae000c        	ldw	x,#L511
 312  003f cd0000        	call	_assert_failed
 314  0042 5b04          	addw	sp,#4
 315  0044               L22:
 316                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 318  0044 1e10          	ldw	x,(OFST+7,sp)
 319  0046 a30400        	cpw	x,#1024
 320  0049 2403          	jruge	L42
 321  004b 4f            	clr	a
 322  004c 2010          	jra	L62
 323  004e               L42:
 324  004e ae006b        	ldw	x,#107
 325  0051 89            	pushw	x
 326  0052 ae0000        	ldw	x,#0
 327  0055 89            	pushw	x
 328  0056 ae000c        	ldw	x,#L511
 329  0059 cd0000        	call	_assert_failed
 331  005c 5b04          	addw	sp,#4
 332  005e               L62:
 333                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 335  005e 0d12          	tnz	(OFST+9,sp)
 336  0060 2706          	jreq	L23
 337  0062 7b12          	ld	a,(OFST+9,sp)
 338  0064 a140          	cp	a,#64
 339  0066 2603          	jrne	L03
 340  0068               L23:
 341  0068 4f            	clr	a
 342  0069 2010          	jra	L43
 343  006b               L03:
 344  006b ae006c        	ldw	x,#108
 345  006e 89            	pushw	x
 346  006f ae0000        	ldw	x,#0
 347  0072 89            	pushw	x
 348  0073 ae000c        	ldw	x,#L511
 349  0076 cd0000        	call	_assert_failed
 351  0079 5b04          	addw	sp,#4
 352  007b               L43:
 353                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 355  007b 0d15          	tnz	(OFST+12,sp)
 356  007d 2709          	jreq	L63
 357  007f 7b15          	ld	a,(OFST+12,sp)
 358  0081 a111          	cp	a,#17
 359  0083 2403          	jruge	L63
 360  0085 4f            	clr	a
 361  0086 2010          	jra	L04
 362  0088               L63:
 363  0088 ae006d        	ldw	x,#109
 364  008b 89            	pushw	x
 365  008c ae0000        	ldw	x,#0
 366  008f 89            	pushw	x
 367  0090 ae000c        	ldw	x,#L511
 368  0093 cd0000        	call	_assert_failed
 370  0096 5b04          	addw	sp,#4
 371  0098               L04:
 372                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 374  0098 96            	ldw	x,sp
 375  0099 1c000c        	addw	x,#OFST+3
 376  009c cd0000        	call	c_lzmp
 378  009f 2712          	jreq	L24
 379  00a1 96            	ldw	x,sp
 380  00a2 1c000c        	addw	x,#OFST+3
 381  00a5 cd0000        	call	c_ltor
 383  00a8 ae0000        	ldw	x,#L44
 384  00ab cd0000        	call	c_lcmp
 386  00ae 2403          	jruge	L24
 387  00b0 4f            	clr	a
 388  00b1 2010          	jra	L64
 389  00b3               L24:
 390  00b3 ae006e        	ldw	x,#110
 391  00b6 89            	pushw	x
 392  00b7 ae0000        	ldw	x,#0
 393  00ba 89            	pushw	x
 394  00bb ae000c        	ldw	x,#L511
 395  00be cd0000        	call	_assert_failed
 397  00c1 5b04          	addw	sp,#4
 398  00c3               L64:
 399                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 401  00c3 c65212        	ld	a,21010
 402  00c6 a4c0          	and	a,#192
 403  00c8 c75212        	ld	21010,a
 404                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 406  00cb c65212        	ld	a,21010
 407  00ce 1a15          	or	a,(OFST+12,sp)
 408  00d0 c75212        	ld	21010,a
 409                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 411  00d3 72115210      	bres	21008,#0
 412                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 414  00d7 c6521c        	ld	a,21020
 415  00da a430          	and	a,#48
 416  00dc c7521c        	ld	21020,a
 417                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 419  00df 725f521b      	clr	21019
 420                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 422  00e3 96            	ldw	x,sp
 423  00e4 1c000c        	addw	x,#OFST+3
 424  00e7 cd0000        	call	c_ltor
 426  00ea ae0004        	ldw	x,#L05
 427  00ed cd0000        	call	c_lcmp
 429  00f0 2403          	jruge	L45
 430  00f2 cc017f        	jp	L711
 431  00f5               L45:
 432                     ; 131     tmpccrh = I2C_CCRH_FS;
 434  00f5 a680          	ld	a,#128
 435  00f7 6b07          	ld	(OFST-2,sp),a
 437                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 439  00f9 0d12          	tnz	(OFST+9,sp)
 440  00fb 2630          	jrne	L121
 441                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 443  00fd 96            	ldw	x,sp
 444  00fe 1c000c        	addw	x,#OFST+3
 445  0101 cd0000        	call	c_ltor
 447  0104 a603          	ld	a,#3
 448  0106 cd0000        	call	c_smul
 450  0109 96            	ldw	x,sp
 451  010a 1c0001        	addw	x,#OFST-8
 452  010d cd0000        	call	c_rtol
 455  0110 7b15          	ld	a,(OFST+12,sp)
 456  0112 b703          	ld	c_lreg+3,a
 457  0114 3f02          	clr	c_lreg+2
 458  0116 3f01          	clr	c_lreg+1
 459  0118 3f00          	clr	c_lreg
 460  011a ae0008        	ldw	x,#L25
 461  011d cd0000        	call	c_lmul
 463  0120 96            	ldw	x,sp
 464  0121 1c0001        	addw	x,#OFST-8
 465  0124 cd0000        	call	c_ludv
 467  0127 be02          	ldw	x,c_lreg+2
 468  0129 1f08          	ldw	(OFST-1,sp),x
 471  012b 2034          	jra	L321
 472  012d               L121:
 473                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 475  012d 96            	ldw	x,sp
 476  012e 1c000c        	addw	x,#OFST+3
 477  0131 cd0000        	call	c_ltor
 479  0134 a619          	ld	a,#25
 480  0136 cd0000        	call	c_smul
 482  0139 96            	ldw	x,sp
 483  013a 1c0001        	addw	x,#OFST-8
 484  013d cd0000        	call	c_rtol
 487  0140 7b15          	ld	a,(OFST+12,sp)
 488  0142 b703          	ld	c_lreg+3,a
 489  0144 3f02          	clr	c_lreg+2
 490  0146 3f01          	clr	c_lreg+1
 491  0148 3f00          	clr	c_lreg
 492  014a ae0008        	ldw	x,#L25
 493  014d cd0000        	call	c_lmul
 495  0150 96            	ldw	x,sp
 496  0151 1c0001        	addw	x,#OFST-8
 497  0154 cd0000        	call	c_ludv
 499  0157 be02          	ldw	x,c_lreg+2
 500  0159 1f08          	ldw	(OFST-1,sp),x
 502                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 504  015b 7b07          	ld	a,(OFST-2,sp)
 505  015d aa40          	or	a,#64
 506  015f 6b07          	ld	(OFST-2,sp),a
 508  0161               L321:
 509                     ; 147     if (result < (uint16_t)0x01)
 511  0161 1e08          	ldw	x,(OFST-1,sp)
 512  0163 2605          	jrne	L521
 513                     ; 150       result = (uint16_t)0x0001;
 515  0165 ae0001        	ldw	x,#1
 516  0168 1f08          	ldw	(OFST-1,sp),x
 518  016a               L521:
 519                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 521  016a 7b15          	ld	a,(OFST+12,sp)
 522  016c 97            	ld	xl,a
 523  016d a603          	ld	a,#3
 524  016f 42            	mul	x,a
 525  0170 a60a          	ld	a,#10
 526  0172 cd0000        	call	c_sdivx
 528  0175 5c            	incw	x
 529  0176 1f05          	ldw	(OFST-4,sp),x
 531                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 533  0178 7b06          	ld	a,(OFST-3,sp)
 534  017a c7521d        	ld	21021,a
 536  017d 2043          	jra	L721
 537  017f               L711:
 538                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 540  017f 96            	ldw	x,sp
 541  0180 1c000c        	addw	x,#OFST+3
 542  0183 cd0000        	call	c_ltor
 544  0186 3803          	sll	c_lreg+3
 545  0188 3902          	rlc	c_lreg+2
 546  018a 3901          	rlc	c_lreg+1
 547  018c 3900          	rlc	c_lreg
 548  018e 96            	ldw	x,sp
 549  018f 1c0001        	addw	x,#OFST-8
 550  0192 cd0000        	call	c_rtol
 553  0195 7b15          	ld	a,(OFST+12,sp)
 554  0197 b703          	ld	c_lreg+3,a
 555  0199 3f02          	clr	c_lreg+2
 556  019b 3f01          	clr	c_lreg+1
 557  019d 3f00          	clr	c_lreg
 558  019f ae0008        	ldw	x,#L25
 559  01a2 cd0000        	call	c_lmul
 561  01a5 96            	ldw	x,sp
 562  01a6 1c0001        	addw	x,#OFST-8
 563  01a9 cd0000        	call	c_ludv
 565  01ac be02          	ldw	x,c_lreg+2
 566  01ae 1f08          	ldw	(OFST-1,sp),x
 568                     ; 167     if (result < (uint16_t)0x0004)
 570  01b0 1e08          	ldw	x,(OFST-1,sp)
 571  01b2 a30004        	cpw	x,#4
 572  01b5 2405          	jruge	L131
 573                     ; 170       result = (uint16_t)0x0004;
 575  01b7 ae0004        	ldw	x,#4
 576  01ba 1f08          	ldw	(OFST-1,sp),x
 578  01bc               L131:
 579                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 581  01bc 7b15          	ld	a,(OFST+12,sp)
 582  01be 4c            	inc	a
 583  01bf c7521d        	ld	21021,a
 584  01c2               L721:
 585                     ; 181   I2C->CCRL = (uint8_t)result;
 587  01c2 7b09          	ld	a,(OFST+0,sp)
 588  01c4 c7521b        	ld	21019,a
 589                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 591  01c7 7b08          	ld	a,(OFST-1,sp)
 592  01c9 a40f          	and	a,#15
 593  01cb 1a07          	or	a,(OFST-2,sp)
 594  01cd c7521c        	ld	21020,a
 595                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 597  01d0 72105210      	bset	21008,#0
 598                     ; 188   I2C_AcknowledgeConfig(Ack);
 600  01d4 7b13          	ld	a,(OFST+10,sp)
 601  01d6 cd0000        	call	_I2C_AcknowledgeConfig
 603                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 605  01d9 7b11          	ld	a,(OFST+8,sp)
 606  01db c75213        	ld	21011,a
 607                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 607                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 609  01de 1e10          	ldw	x,(OFST+7,sp)
 610  01e0 4f            	clr	a
 611  01e1 01            	rrwa	x,a
 612  01e2 48            	sll	a
 613  01e3 59            	rlcw	x
 614  01e4 01            	rrwa	x,a
 615  01e5 a406          	and	a,#6
 616  01e7 5f            	clrw	x
 617  01e8 6b04          	ld	(OFST-5,sp),a
 619  01ea 7b14          	ld	a,(OFST+11,sp)
 620  01ec aa40          	or	a,#64
 621  01ee 1a04          	or	a,(OFST-5,sp)
 622  01f0 c75214        	ld	21012,a
 623                     ; 194 }
 626  01f3 5b09          	addw	sp,#9
 627  01f5 81            	ret
 683                     ; 202 void I2C_Cmd(FunctionalState NewState)
 683                     ; 203 {
 684                     .text:	section	.text,new
 685  0000               _I2C_Cmd:
 687  0000 88            	push	a
 688       00000000      OFST:	set	0
 691                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 693  0001 4d            	tnz	a
 694  0002 2704          	jreq	L26
 695  0004 a101          	cp	a,#1
 696  0006 2603          	jrne	L06
 697  0008               L26:
 698  0008 4f            	clr	a
 699  0009 2010          	jra	L46
 700  000b               L06:
 701  000b ae00cd        	ldw	x,#205
 702  000e 89            	pushw	x
 703  000f ae0000        	ldw	x,#0
 704  0012 89            	pushw	x
 705  0013 ae000c        	ldw	x,#L511
 706  0016 cd0000        	call	_assert_failed
 708  0019 5b04          	addw	sp,#4
 709  001b               L46:
 710                     ; 207   if (NewState != DISABLE)
 712  001b 0d01          	tnz	(OFST+1,sp)
 713  001d 2706          	jreq	L161
 714                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 716  001f 72105210      	bset	21008,#0
 718  0023 2004          	jra	L361
 719  0025               L161:
 720                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 722  0025 72115210      	bres	21008,#0
 723  0029               L361:
 724                     ; 217 }
 727  0029 84            	pop	a
 728  002a 81            	ret
 764                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 764                     ; 226 {
 765                     .text:	section	.text,new
 766  0000               _I2C_GeneralCallCmd:
 768  0000 88            	push	a
 769       00000000      OFST:	set	0
 772                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 774  0001 4d            	tnz	a
 775  0002 2704          	jreq	L27
 776  0004 a101          	cp	a,#1
 777  0006 2603          	jrne	L07
 778  0008               L27:
 779  0008 4f            	clr	a
 780  0009 2010          	jra	L47
 781  000b               L07:
 782  000b ae00e4        	ldw	x,#228
 783  000e 89            	pushw	x
 784  000f ae0000        	ldw	x,#0
 785  0012 89            	pushw	x
 786  0013 ae000c        	ldw	x,#L511
 787  0016 cd0000        	call	_assert_failed
 789  0019 5b04          	addw	sp,#4
 790  001b               L47:
 791                     ; 230   if (NewState != DISABLE)
 793  001b 0d01          	tnz	(OFST+1,sp)
 794  001d 2706          	jreq	L302
 795                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 797  001f 721c5210      	bset	21008,#6
 799  0023 2004          	jra	L502
 800  0025               L302:
 801                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 803  0025 721d5210      	bres	21008,#6
 804  0029               L502:
 805                     ; 240 }
 808  0029 84            	pop	a
 809  002a 81            	ret
 845                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 845                     ; 251 {
 846                     .text:	section	.text,new
 847  0000               _I2C_GenerateSTART:
 849  0000 88            	push	a
 850       00000000      OFST:	set	0
 853                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 855  0001 4d            	tnz	a
 856  0002 2704          	jreq	L201
 857  0004 a101          	cp	a,#1
 858  0006 2603          	jrne	L001
 859  0008               L201:
 860  0008 4f            	clr	a
 861  0009 2010          	jra	L401
 862  000b               L001:
 863  000b ae00fd        	ldw	x,#253
 864  000e 89            	pushw	x
 865  000f ae0000        	ldw	x,#0
 866  0012 89            	pushw	x
 867  0013 ae000c        	ldw	x,#L511
 868  0016 cd0000        	call	_assert_failed
 870  0019 5b04          	addw	sp,#4
 871  001b               L401:
 872                     ; 255   if (NewState != DISABLE)
 874  001b 0d01          	tnz	(OFST+1,sp)
 875  001d 2706          	jreq	L522
 876                     ; 258     I2C->CR2 |= I2C_CR2_START;
 878  001f 72105211      	bset	21009,#0
 880  0023 2004          	jra	L722
 881  0025               L522:
 882                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 884  0025 72115211      	bres	21009,#0
 885  0029               L722:
 886                     ; 265 }
 889  0029 84            	pop	a
 890  002a 81            	ret
 926                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 926                     ; 274 {
 927                     .text:	section	.text,new
 928  0000               _I2C_GenerateSTOP:
 930  0000 88            	push	a
 931       00000000      OFST:	set	0
 934                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 936  0001 4d            	tnz	a
 937  0002 2704          	jreq	L211
 938  0004 a101          	cp	a,#1
 939  0006 2603          	jrne	L011
 940  0008               L211:
 941  0008 4f            	clr	a
 942  0009 2010          	jra	L411
 943  000b               L011:
 944  000b ae0114        	ldw	x,#276
 945  000e 89            	pushw	x
 946  000f ae0000        	ldw	x,#0
 947  0012 89            	pushw	x
 948  0013 ae000c        	ldw	x,#L511
 949  0016 cd0000        	call	_assert_failed
 951  0019 5b04          	addw	sp,#4
 952  001b               L411:
 953                     ; 278   if (NewState != DISABLE)
 955  001b 0d01          	tnz	(OFST+1,sp)
 956  001d 2706          	jreq	L742
 957                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 959  001f 72125211      	bset	21009,#1
 961  0023 2004          	jra	L152
 962  0025               L742:
 963                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 965  0025 72135211      	bres	21009,#1
 966  0029               L152:
 967                     ; 288 }
 970  0029 84            	pop	a
 971  002a 81            	ret
1008                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
1008                     ; 297 {
1009                     .text:	section	.text,new
1010  0000               _I2C_SoftwareResetCmd:
1012  0000 88            	push	a
1013       00000000      OFST:	set	0
1016                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1018  0001 4d            	tnz	a
1019  0002 2704          	jreq	L221
1020  0004 a101          	cp	a,#1
1021  0006 2603          	jrne	L021
1022  0008               L221:
1023  0008 4f            	clr	a
1024  0009 2010          	jra	L421
1025  000b               L021:
1026  000b ae012b        	ldw	x,#299
1027  000e 89            	pushw	x
1028  000f ae0000        	ldw	x,#0
1029  0012 89            	pushw	x
1030  0013 ae000c        	ldw	x,#L511
1031  0016 cd0000        	call	_assert_failed
1033  0019 5b04          	addw	sp,#4
1034  001b               L421:
1035                     ; 301   if (NewState != DISABLE)
1037  001b 0d01          	tnz	(OFST+1,sp)
1038  001d 2706          	jreq	L172
1039                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
1041  001f 721e5211      	bset	21009,#7
1043  0023 2004          	jra	L372
1044  0025               L172:
1045                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1047  0025 721f5211      	bres	21009,#7
1048  0029               L372:
1049                     ; 311 }
1052  0029 84            	pop	a
1053  002a 81            	ret
1090                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
1090                     ; 321 {
1091                     .text:	section	.text,new
1092  0000               _I2C_StretchClockCmd:
1094  0000 88            	push	a
1095       00000000      OFST:	set	0
1098                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1100  0001 4d            	tnz	a
1101  0002 2704          	jreq	L231
1102  0004 a101          	cp	a,#1
1103  0006 2603          	jrne	L031
1104  0008               L231:
1105  0008 4f            	clr	a
1106  0009 2010          	jra	L431
1107  000b               L031:
1108  000b ae0143        	ldw	x,#323
1109  000e 89            	pushw	x
1110  000f ae0000        	ldw	x,#0
1111  0012 89            	pushw	x
1112  0013 ae000c        	ldw	x,#L511
1113  0016 cd0000        	call	_assert_failed
1115  0019 5b04          	addw	sp,#4
1116  001b               L431:
1117                     ; 325   if (NewState != DISABLE)
1119  001b 0d01          	tnz	(OFST+1,sp)
1120  001d 2706          	jreq	L313
1121                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1123  001f 721f5210      	bres	21008,#7
1125  0023 2004          	jra	L513
1126  0025               L313:
1127                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1129  0025 721e5210      	bset	21008,#7
1130  0029               L513:
1131                     ; 336 }
1134  0029 84            	pop	a
1135  002a 81            	ret
1172                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1172                     ; 346 {
1173                     .text:	section	.text,new
1174  0000               _I2C_AcknowledgeConfig:
1176  0000 88            	push	a
1177       00000000      OFST:	set	0
1180                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
1182  0001 4d            	tnz	a
1183  0002 2708          	jreq	L241
1184  0004 a101          	cp	a,#1
1185  0006 2704          	jreq	L241
1186  0008 a102          	cp	a,#2
1187  000a 2603          	jrne	L041
1188  000c               L241:
1189  000c 4f            	clr	a
1190  000d 2010          	jra	L441
1191  000f               L041:
1192  000f ae015c        	ldw	x,#348
1193  0012 89            	pushw	x
1194  0013 ae0000        	ldw	x,#0
1195  0016 89            	pushw	x
1196  0017 ae000c        	ldw	x,#L511
1197  001a cd0000        	call	_assert_failed
1199  001d 5b04          	addw	sp,#4
1200  001f               L441:
1201                     ; 350   if (Ack == I2C_ACK_NONE)
1203  001f 0d01          	tnz	(OFST+1,sp)
1204  0021 2606          	jrne	L533
1205                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1207  0023 72155211      	bres	21009,#2
1209  0027 2014          	jra	L733
1210  0029               L533:
1211                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
1213  0029 72145211      	bset	21009,#2
1214                     ; 360     if (Ack == I2C_ACK_CURR)
1216  002d 7b01          	ld	a,(OFST+1,sp)
1217  002f a101          	cp	a,#1
1218  0031 2606          	jrne	L143
1219                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1221  0033 72175211      	bres	21009,#3
1223  0037 2004          	jra	L733
1224  0039               L143:
1225                     ; 368       I2C->CR2 |= I2C_CR2_POS;
1227  0039 72165211      	bset	21009,#3
1228  003d               L733:
1229                     ; 371 }
1232  003d 84            	pop	a
1233  003e 81            	ret
1306                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1306                     ; 382 {
1307                     .text:	section	.text,new
1308  0000               _I2C_ITConfig:
1310  0000 89            	pushw	x
1311       00000000      OFST:	set	0
1314                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1316  0001 9e            	ld	a,xh
1317  0002 a101          	cp	a,#1
1318  0004 271e          	jreq	L251
1319  0006 9e            	ld	a,xh
1320  0007 a102          	cp	a,#2
1321  0009 2719          	jreq	L251
1322  000b 9e            	ld	a,xh
1323  000c a104          	cp	a,#4
1324  000e 2714          	jreq	L251
1325  0010 9e            	ld	a,xh
1326  0011 a103          	cp	a,#3
1327  0013 270f          	jreq	L251
1328  0015 9e            	ld	a,xh
1329  0016 a105          	cp	a,#5
1330  0018 270a          	jreq	L251
1331  001a 9e            	ld	a,xh
1332  001b a106          	cp	a,#6
1333  001d 2705          	jreq	L251
1334  001f 9e            	ld	a,xh
1335  0020 a107          	cp	a,#7
1336  0022 2603          	jrne	L051
1337  0024               L251:
1338  0024 4f            	clr	a
1339  0025 2010          	jra	L451
1340  0027               L051:
1341  0027 ae0180        	ldw	x,#384
1342  002a 89            	pushw	x
1343  002b ae0000        	ldw	x,#0
1344  002e 89            	pushw	x
1345  002f ae000c        	ldw	x,#L511
1346  0032 cd0000        	call	_assert_failed
1348  0035 5b04          	addw	sp,#4
1349  0037               L451:
1350                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1352  0037 0d02          	tnz	(OFST+2,sp)
1353  0039 2706          	jreq	L061
1354  003b 7b02          	ld	a,(OFST+2,sp)
1355  003d a101          	cp	a,#1
1356  003f 2603          	jrne	L651
1357  0041               L061:
1358  0041 4f            	clr	a
1359  0042 2010          	jra	L261
1360  0044               L651:
1361  0044 ae0181        	ldw	x,#385
1362  0047 89            	pushw	x
1363  0048 ae0000        	ldw	x,#0
1364  004b 89            	pushw	x
1365  004c ae000c        	ldw	x,#L511
1366  004f cd0000        	call	_assert_failed
1368  0052 5b04          	addw	sp,#4
1369  0054               L261:
1370                     ; 387   if (NewState != DISABLE)
1372  0054 0d02          	tnz	(OFST+2,sp)
1373  0056 270a          	jreq	L104
1374                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1376  0058 c6521a        	ld	a,21018
1377  005b 1a01          	or	a,(OFST+1,sp)
1378  005d c7521a        	ld	21018,a
1380  0060 2009          	jra	L304
1381  0062               L104:
1382                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1384  0062 7b01          	ld	a,(OFST+1,sp)
1385  0064 43            	cpl	a
1386  0065 c4521a        	and	a,21018
1387  0068 c7521a        	ld	21018,a
1388  006b               L304:
1389                     ; 397 }
1392  006b 85            	popw	x
1393  006c 81            	ret
1430                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1430                     ; 406 {
1431                     .text:	section	.text,new
1432  0000               _I2C_FastModeDutyCycleConfig:
1434  0000 88            	push	a
1435       00000000      OFST:	set	0
1438                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1440  0001 4d            	tnz	a
1441  0002 2704          	jreq	L071
1442  0004 a140          	cp	a,#64
1443  0006 2603          	jrne	L661
1444  0008               L071:
1445  0008 4f            	clr	a
1446  0009 2010          	jra	L271
1447  000b               L661:
1448  000b ae0198        	ldw	x,#408
1449  000e 89            	pushw	x
1450  000f ae0000        	ldw	x,#0
1451  0012 89            	pushw	x
1452  0013 ae000c        	ldw	x,#L511
1453  0016 cd0000        	call	_assert_failed
1455  0019 5b04          	addw	sp,#4
1456  001b               L271:
1457                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1459  001b 7b01          	ld	a,(OFST+1,sp)
1460  001d a140          	cp	a,#64
1461  001f 2606          	jrne	L324
1462                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1464  0021 721c521c      	bset	21020,#6
1466  0025 2004          	jra	L524
1467  0027               L324:
1468                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1470  0027 721d521c      	bres	21020,#6
1471  002b               L524:
1472                     ; 420 }
1475  002b 84            	pop	a
1476  002c 81            	ret
1499                     ; 427 uint8_t I2C_ReceiveData(void)
1499                     ; 428 {
1500                     .text:	section	.text,new
1501  0000               _I2C_ReceiveData:
1505                     ; 430   return ((uint8_t)I2C->DR);
1507  0000 c65216        	ld	a,21014
1510  0003 81            	ret
1574                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1574                     ; 441 {
1575                     .text:	section	.text,new
1576  0000               _I2C_Send7bitAddress:
1578  0000 89            	pushw	x
1579       00000000      OFST:	set	0
1582                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1584  0001 9e            	ld	a,xh
1585  0002 a501          	bcp	a,#1
1586  0004 2603          	jrne	L002
1587  0006 4f            	clr	a
1588  0007 2010          	jra	L202
1589  0009               L002:
1590  0009 ae01bb        	ldw	x,#443
1591  000c 89            	pushw	x
1592  000d ae0000        	ldw	x,#0
1593  0010 89            	pushw	x
1594  0011 ae000c        	ldw	x,#L511
1595  0014 cd0000        	call	_assert_failed
1597  0017 5b04          	addw	sp,#4
1598  0019               L202:
1599                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1601  0019 0d02          	tnz	(OFST+2,sp)
1602  001b 2706          	jreq	L602
1603  001d 7b02          	ld	a,(OFST+2,sp)
1604  001f a101          	cp	a,#1
1605  0021 2603          	jrne	L402
1606  0023               L602:
1607  0023 4f            	clr	a
1608  0024 2010          	jra	L012
1609  0026               L402:
1610  0026 ae01bc        	ldw	x,#444
1611  0029 89            	pushw	x
1612  002a ae0000        	ldw	x,#0
1613  002d 89            	pushw	x
1614  002e ae000c        	ldw	x,#L511
1615  0031 cd0000        	call	_assert_failed
1617  0034 5b04          	addw	sp,#4
1618  0036               L012:
1619                     ; 447   Address &= (uint8_t)0xFE;
1621  0036 7b01          	ld	a,(OFST+1,sp)
1622  0038 a4fe          	and	a,#254
1623  003a 6b01          	ld	(OFST+1,sp),a
1624                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1626  003c 7b01          	ld	a,(OFST+1,sp)
1627  003e 1a02          	or	a,(OFST+2,sp)
1628  0040 c75216        	ld	21014,a
1629                     ; 451 }
1632  0043 85            	popw	x
1633  0044 81            	ret
1665                     ; 458 void I2C_SendData(uint8_t Data)
1665                     ; 459 {
1666                     .text:	section	.text,new
1667  0000               _I2C_SendData:
1671                     ; 461   I2C->DR = Data;
1673  0000 c75216        	ld	21014,a
1674                     ; 462 }
1677  0003 81            	ret
1898                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1898                     ; 579 {
1899                     .text:	section	.text,new
1900  0000               _I2C_CheckEvent:
1902  0000 89            	pushw	x
1903  0001 5206          	subw	sp,#6
1904       00000006      OFST:	set	6
1907                     ; 580   __IO uint16_t lastevent = 0x00;
1909  0003 5f            	clrw	x
1910  0004 1f04          	ldw	(OFST-2,sp),x
1912                     ; 581   uint8_t flag1 = 0x00 ;
1914                     ; 582   uint8_t flag2 = 0x00;
1916                     ; 583   ErrorStatus status = ERROR;
1918                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1920  0006 1e07          	ldw	x,(OFST+1,sp)
1921  0008 a30682        	cpw	x,#1666
1922  000b 2769          	jreq	L022
1923  000d 1e07          	ldw	x,(OFST+1,sp)
1924  000f a30202        	cpw	x,#514
1925  0012 2762          	jreq	L022
1926  0014 1e07          	ldw	x,(OFST+1,sp)
1927  0016 a31200        	cpw	x,#4608
1928  0019 275b          	jreq	L022
1929  001b 1e07          	ldw	x,(OFST+1,sp)
1930  001d a30240        	cpw	x,#576
1931  0020 2754          	jreq	L022
1932  0022 1e07          	ldw	x,(OFST+1,sp)
1933  0024 a30350        	cpw	x,#848
1934  0027 274d          	jreq	L022
1935  0029 1e07          	ldw	x,(OFST+1,sp)
1936  002b a30684        	cpw	x,#1668
1937  002e 2746          	jreq	L022
1938  0030 1e07          	ldw	x,(OFST+1,sp)
1939  0032 a30794        	cpw	x,#1940
1940  0035 273f          	jreq	L022
1941  0037 1e07          	ldw	x,(OFST+1,sp)
1942  0039 a30004        	cpw	x,#4
1943  003c 2738          	jreq	L022
1944  003e 1e07          	ldw	x,(OFST+1,sp)
1945  0040 a30010        	cpw	x,#16
1946  0043 2731          	jreq	L022
1947  0045 1e07          	ldw	x,(OFST+1,sp)
1948  0047 a30301        	cpw	x,#769
1949  004a 272a          	jreq	L022
1950  004c 1e07          	ldw	x,(OFST+1,sp)
1951  004e a30782        	cpw	x,#1922
1952  0051 2723          	jreq	L022
1953  0053 1e07          	ldw	x,(OFST+1,sp)
1954  0055 a30302        	cpw	x,#770
1955  0058 271c          	jreq	L022
1956  005a 1e07          	ldw	x,(OFST+1,sp)
1957  005c a30340        	cpw	x,#832
1958  005f 2715          	jreq	L022
1959  0061 1e07          	ldw	x,(OFST+1,sp)
1960  0063 a30784        	cpw	x,#1924
1961  0066 270e          	jreq	L022
1962  0068 1e07          	ldw	x,(OFST+1,sp)
1963  006a a30780        	cpw	x,#1920
1964  006d 2707          	jreq	L022
1965  006f 1e07          	ldw	x,(OFST+1,sp)
1966  0071 a30308        	cpw	x,#776
1967  0074 2603          	jrne	L612
1968  0076               L022:
1969  0076 4f            	clr	a
1970  0077 2010          	jra	L222
1971  0079               L612:
1972  0079 ae024a        	ldw	x,#586
1973  007c 89            	pushw	x
1974  007d ae0000        	ldw	x,#0
1975  0080 89            	pushw	x
1976  0081 ae000c        	ldw	x,#L511
1977  0084 cd0000        	call	_assert_failed
1979  0087 5b04          	addw	sp,#4
1980  0089               L222:
1981                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1983  0089 1e07          	ldw	x,(OFST+1,sp)
1984  008b a30004        	cpw	x,#4
1985  008e 260b          	jrne	L706
1986                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1988  0090 c65218        	ld	a,21016
1989  0093 a404          	and	a,#4
1990  0095 5f            	clrw	x
1991  0096 97            	ld	xl,a
1992  0097 1f04          	ldw	(OFST-2,sp),x
1995  0099 201f          	jra	L116
1996  009b               L706:
1997                     ; 594     flag1 = I2C->SR1;
1999  009b c65217        	ld	a,21015
2000  009e 6b03          	ld	(OFST-3,sp),a
2002                     ; 595     flag2 = I2C->SR3;
2004  00a0 c65219        	ld	a,21017
2005  00a3 6b06          	ld	(OFST+0,sp),a
2007                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
2009  00a5 7b03          	ld	a,(OFST-3,sp)
2010  00a7 5f            	clrw	x
2011  00a8 97            	ld	xl,a
2012  00a9 1f01          	ldw	(OFST-5,sp),x
2014  00ab 7b06          	ld	a,(OFST+0,sp)
2015  00ad 5f            	clrw	x
2016  00ae 97            	ld	xl,a
2017  00af 4f            	clr	a
2018  00b0 02            	rlwa	x,a
2019  00b1 01            	rrwa	x,a
2020  00b2 1a02          	or	a,(OFST-4,sp)
2021  00b4 01            	rrwa	x,a
2022  00b5 1a01          	or	a,(OFST-5,sp)
2023  00b7 01            	rrwa	x,a
2024  00b8 1f04          	ldw	(OFST-2,sp),x
2026  00ba               L116:
2027                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2029  00ba 1e04          	ldw	x,(OFST-2,sp)
2030  00bc 01            	rrwa	x,a
2031  00bd 1408          	and	a,(OFST+2,sp)
2032  00bf 01            	rrwa	x,a
2033  00c0 1407          	and	a,(OFST+1,sp)
2034  00c2 01            	rrwa	x,a
2035  00c3 1307          	cpw	x,(OFST+1,sp)
2036  00c5 2606          	jrne	L316
2037                     ; 602     status = SUCCESS;
2039  00c7 a601          	ld	a,#1
2040  00c9 6b06          	ld	(OFST+0,sp),a
2043  00cb 2002          	jra	L516
2044  00cd               L316:
2045                     ; 607     status = ERROR;
2047  00cd 0f06          	clr	(OFST+0,sp)
2049  00cf               L516:
2050                     ; 611   return status;
2052  00cf 7b06          	ld	a,(OFST+0,sp)
2055  00d1 5b08          	addw	sp,#8
2056  00d3 81            	ret
2105                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
2105                     ; 629 {
2106                     .text:	section	.text,new
2107  0000               _I2C_GetLastEvent:
2109  0000 5206          	subw	sp,#6
2110       00000006      OFST:	set	6
2113                     ; 630   __IO uint16_t lastevent = 0;
2115  0002 5f            	clrw	x
2116  0003 1f05          	ldw	(OFST-1,sp),x
2118                     ; 631   uint16_t flag1 = 0;
2120                     ; 632   uint16_t flag2 = 0;
2122                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2124  0005 c65218        	ld	a,21016
2125  0008 a504          	bcp	a,#4
2126  000a 2707          	jreq	L146
2127                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2129  000c ae0004        	ldw	x,#4
2130  000f 1f05          	ldw	(OFST-1,sp),x
2133  0011 201b          	jra	L346
2134  0013               L146:
2135                     ; 641     flag1 = I2C->SR1;
2137  0013 c65217        	ld	a,21015
2138  0016 5f            	clrw	x
2139  0017 97            	ld	xl,a
2140  0018 1f01          	ldw	(OFST-5,sp),x
2142                     ; 642     flag2 = I2C->SR3;
2144  001a c65219        	ld	a,21017
2145  001d 5f            	clrw	x
2146  001e 97            	ld	xl,a
2147  001f 1f03          	ldw	(OFST-3,sp),x
2149                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2151  0021 1e03          	ldw	x,(OFST-3,sp)
2152  0023 4f            	clr	a
2153  0024 02            	rlwa	x,a
2154  0025 01            	rrwa	x,a
2155  0026 1a02          	or	a,(OFST-4,sp)
2156  0028 01            	rrwa	x,a
2157  0029 1a01          	or	a,(OFST-5,sp)
2158  002b 01            	rrwa	x,a
2159  002c 1f05          	ldw	(OFST-1,sp),x
2161  002e               L346:
2162                     ; 648   return (I2C_Event_TypeDef)lastevent;
2164  002e 1e05          	ldw	x,(OFST-1,sp)
2167  0030 5b06          	addw	sp,#6
2168  0032 81            	ret
2380                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2380                     ; 680 {
2381                     .text:	section	.text,new
2382  0000               _I2C_GetFlagStatus:
2384  0000 89            	pushw	x
2385  0001 89            	pushw	x
2386       00000002      OFST:	set	2
2389                     ; 681   uint8_t tempreg = 0;
2391  0002 0f02          	clr	(OFST+0,sp)
2393                     ; 682   uint8_t regindex = 0;
2395                     ; 683   FlagStatus bitstatus = RESET;
2397                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2399  0004 a30180        	cpw	x,#384
2400  0007 274b          	jreq	L232
2401  0009 a30140        	cpw	x,#320
2402  000c 2746          	jreq	L232
2403  000e a30110        	cpw	x,#272
2404  0011 2741          	jreq	L232
2405  0013 a30108        	cpw	x,#264
2406  0016 273c          	jreq	L232
2407  0018 a30104        	cpw	x,#260
2408  001b 2737          	jreq	L232
2409  001d a30102        	cpw	x,#258
2410  0020 2732          	jreq	L232
2411  0022 a30101        	cpw	x,#257
2412  0025 272d          	jreq	L232
2413  0027 a30220        	cpw	x,#544
2414  002a 2728          	jreq	L232
2415  002c a30208        	cpw	x,#520
2416  002f 2723          	jreq	L232
2417  0031 a30204        	cpw	x,#516
2418  0034 271e          	jreq	L232
2419  0036 a30202        	cpw	x,#514
2420  0039 2719          	jreq	L232
2421  003b a30201        	cpw	x,#513
2422  003e 2714          	jreq	L232
2423  0040 a30310        	cpw	x,#784
2424  0043 270f          	jreq	L232
2425  0045 a30304        	cpw	x,#772
2426  0048 270a          	jreq	L232
2427  004a a30302        	cpw	x,#770
2428  004d 2705          	jreq	L232
2429  004f a30301        	cpw	x,#769
2430  0052 2603          	jrne	L032
2431  0054               L232:
2432  0054 4f            	clr	a
2433  0055 2010          	jra	L432
2434  0057               L032:
2435  0057 ae02ae        	ldw	x,#686
2436  005a 89            	pushw	x
2437  005b ae0000        	ldw	x,#0
2438  005e 89            	pushw	x
2439  005f ae000c        	ldw	x,#L511
2440  0062 cd0000        	call	_assert_failed
2442  0065 5b04          	addw	sp,#4
2443  0067               L432:
2444                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2446  0067 7b03          	ld	a,(OFST+1,sp)
2447  0069 6b01          	ld	(OFST-1,sp),a
2449                     ; 691   switch (regindex)
2451  006b 7b01          	ld	a,(OFST-1,sp)
2453                     ; 708     default:
2453                     ; 709       break;
2454  006d 4a            	dec	a
2455  006e 2708          	jreq	L546
2456  0070 4a            	dec	a
2457  0071 270c          	jreq	L746
2458  0073 4a            	dec	a
2459  0074 2710          	jreq	L156
2460  0076 2013          	jra	L167
2461  0078               L546:
2462                     ; 694     case 0x01:
2462                     ; 695       tempreg = (uint8_t)I2C->SR1;
2464  0078 c65217        	ld	a,21015
2465  007b 6b02          	ld	(OFST+0,sp),a
2467                     ; 696       break;
2469  007d 200c          	jra	L167
2470  007f               L746:
2471                     ; 699     case 0x02:
2471                     ; 700       tempreg = (uint8_t)I2C->SR2;
2473  007f c65218        	ld	a,21016
2474  0082 6b02          	ld	(OFST+0,sp),a
2476                     ; 701       break;
2478  0084 2005          	jra	L167
2479  0086               L156:
2480                     ; 704     case 0x03:
2480                     ; 705       tempreg = (uint8_t)I2C->SR3;
2482  0086 c65219        	ld	a,21017
2483  0089 6b02          	ld	(OFST+0,sp),a
2485                     ; 706       break;
2487  008b               L356:
2488                     ; 708     default:
2488                     ; 709       break;
2490  008b               L167:
2491                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2493  008b 7b04          	ld	a,(OFST+2,sp)
2494  008d 1502          	bcp	a,(OFST+0,sp)
2495  008f 2706          	jreq	L367
2496                     ; 716     bitstatus = SET;
2498  0091 a601          	ld	a,#1
2499  0093 6b02          	ld	(OFST+0,sp),a
2502  0095 2002          	jra	L567
2503  0097               L367:
2504                     ; 721     bitstatus = RESET;
2506  0097 0f02          	clr	(OFST+0,sp)
2508  0099               L567:
2509                     ; 724   return bitstatus;
2511  0099 7b02          	ld	a,(OFST+0,sp)
2514  009b 5b04          	addw	sp,#4
2515  009d 81            	ret
2558                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2558                     ; 760 {
2559                     .text:	section	.text,new
2560  0000               _I2C_ClearFlag:
2562  0000 89            	pushw	x
2563  0001 89            	pushw	x
2564       00000002      OFST:	set	2
2567                     ; 761   uint16_t flagpos = 0;
2569                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2571  0002 01            	rrwa	x,a
2572  0003 9f            	ld	a,xl
2573  0004 a4fd          	and	a,#253
2574  0006 97            	ld	xl,a
2575  0007 4f            	clr	a
2576  0008 02            	rlwa	x,a
2577  0009 5d            	tnzw	x
2578  000a 2607          	jrne	L042
2579  000c 1e03          	ldw	x,(OFST+1,sp)
2580  000e 2703          	jreq	L042
2581  0010 4f            	clr	a
2582  0011 2010          	jra	L242
2583  0013               L042:
2584  0013 ae02fb        	ldw	x,#763
2585  0016 89            	pushw	x
2586  0017 ae0000        	ldw	x,#0
2587  001a 89            	pushw	x
2588  001b ae000c        	ldw	x,#L511
2589  001e cd0000        	call	_assert_failed
2591  0021 5b04          	addw	sp,#4
2592  0023               L242:
2593                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2595  0023 7b03          	ld	a,(OFST+1,sp)
2596  0025 97            	ld	xl,a
2597  0026 7b04          	ld	a,(OFST+2,sp)
2598  0028 a4ff          	and	a,#255
2599  002a 5f            	clrw	x
2600  002b 02            	rlwa	x,a
2601  002c 1f01          	ldw	(OFST-1,sp),x
2602  002e 01            	rrwa	x,a
2604                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2606  002f 7b02          	ld	a,(OFST+0,sp)
2607  0031 43            	cpl	a
2608  0032 c75218        	ld	21016,a
2609                     ; 769 }
2612  0035 5b04          	addw	sp,#4
2613  0037 81            	ret
2778                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2778                     ; 792 {
2779                     .text:	section	.text,new
2780  0000               _I2C_GetITStatus:
2782  0000 89            	pushw	x
2783  0001 5204          	subw	sp,#4
2784       00000004      OFST:	set	4
2787                     ; 793   ITStatus bitstatus = RESET;
2789                     ; 794   __IO uint8_t enablestatus = 0;
2791  0003 0f03          	clr	(OFST-1,sp)
2793                     ; 795   uint16_t tempregister = 0;
2795                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2797  0005 a31680        	cpw	x,#5760
2798  0008 2737          	jreq	L052
2799  000a a31640        	cpw	x,#5696
2800  000d 2732          	jreq	L052
2801  000f a31210        	cpw	x,#4624
2802  0012 272d          	jreq	L052
2803  0014 a31208        	cpw	x,#4616
2804  0017 2728          	jreq	L052
2805  0019 a31204        	cpw	x,#4612
2806  001c 2723          	jreq	L052
2807  001e a31202        	cpw	x,#4610
2808  0021 271e          	jreq	L052
2809  0023 a31201        	cpw	x,#4609
2810  0026 2719          	jreq	L052
2811  0028 a32220        	cpw	x,#8736
2812  002b 2714          	jreq	L052
2813  002d a32108        	cpw	x,#8456
2814  0030 270f          	jreq	L052
2815  0032 a32104        	cpw	x,#8452
2816  0035 270a          	jreq	L052
2817  0037 a32102        	cpw	x,#8450
2818  003a 2705          	jreq	L052
2819  003c a32101        	cpw	x,#8449
2820  003f 2603          	jrne	L642
2821  0041               L052:
2822  0041 4f            	clr	a
2823  0042 2010          	jra	L252
2824  0044               L642:
2825  0044 ae031e        	ldw	x,#798
2826  0047 89            	pushw	x
2827  0048 ae0000        	ldw	x,#0
2828  004b 89            	pushw	x
2829  004c ae000c        	ldw	x,#L511
2830  004f cd0000        	call	_assert_failed
2832  0052 5b04          	addw	sp,#4
2833  0054               L252:
2834                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2836  0054 7b05          	ld	a,(OFST+1,sp)
2837  0056 a407          	and	a,#7
2838  0058 5f            	clrw	x
2839  0059 97            	ld	xl,a
2840  005a 1f01          	ldw	(OFST-3,sp),x
2842                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2844  005c c6521a        	ld	a,21018
2845  005f 1402          	and	a,(OFST-2,sp)
2846  0061 6b03          	ld	(OFST-1,sp),a
2848                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2850  0063 7b05          	ld	a,(OFST+1,sp)
2851  0065 97            	ld	xl,a
2852  0066 7b06          	ld	a,(OFST+2,sp)
2853  0068 9f            	ld	a,xl
2854  0069 a430          	and	a,#48
2855  006b 97            	ld	xl,a
2856  006c 4f            	clr	a
2857  006d 02            	rlwa	x,a
2858  006e a30100        	cpw	x,#256
2859  0071 2615          	jrne	L3701
2860                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2862  0073 c65217        	ld	a,21015
2863  0076 1506          	bcp	a,(OFST+2,sp)
2864  0078 270a          	jreq	L5701
2866  007a 0d03          	tnz	(OFST-1,sp)
2867  007c 2706          	jreq	L5701
2868                     ; 811       bitstatus = SET;
2870  007e a601          	ld	a,#1
2871  0080 6b04          	ld	(OFST+0,sp),a
2874  0082 2017          	jra	L1011
2875  0084               L5701:
2876                     ; 816       bitstatus = RESET;
2878  0084 0f04          	clr	(OFST+0,sp)
2880  0086 2013          	jra	L1011
2881  0088               L3701:
2882                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2884  0088 c65218        	ld	a,21016
2885  008b 1506          	bcp	a,(OFST+2,sp)
2886  008d 270a          	jreq	L3011
2888  008f 0d03          	tnz	(OFST-1,sp)
2889  0091 2706          	jreq	L3011
2890                     ; 825       bitstatus = SET;
2892  0093 a601          	ld	a,#1
2893  0095 6b04          	ld	(OFST+0,sp),a
2896  0097 2002          	jra	L1011
2897  0099               L3011:
2898                     ; 830       bitstatus = RESET;
2900  0099 0f04          	clr	(OFST+0,sp)
2902  009b               L1011:
2903                     ; 834   return  bitstatus;
2905  009b 7b04          	ld	a,(OFST+0,sp)
2908  009d 5b06          	addw	sp,#6
2909  009f 81            	ret
2953                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2953                     ; 872 {
2954                     .text:	section	.text,new
2955  0000               _I2C_ClearITPendingBit:
2957  0000 89            	pushw	x
2958  0001 89            	pushw	x
2959       00000002      OFST:	set	2
2962                     ; 873   uint16_t flagpos = 0;
2964                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2966  0002 a32220        	cpw	x,#8736
2967  0005 2714          	jreq	L062
2968  0007 a32108        	cpw	x,#8456
2969  000a 270f          	jreq	L062
2970  000c a32104        	cpw	x,#8452
2971  000f 270a          	jreq	L062
2972  0011 a32102        	cpw	x,#8450
2973  0014 2705          	jreq	L062
2974  0016 a32101        	cpw	x,#8449
2975  0019 2603          	jrne	L652
2976  001b               L062:
2977  001b 4f            	clr	a
2978  001c 2010          	jra	L262
2979  001e               L652:
2980  001e ae036c        	ldw	x,#876
2981  0021 89            	pushw	x
2982  0022 ae0000        	ldw	x,#0
2983  0025 89            	pushw	x
2984  0026 ae000c        	ldw	x,#L511
2985  0029 cd0000        	call	_assert_failed
2987  002c 5b04          	addw	sp,#4
2988  002e               L262:
2989                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2991  002e 7b03          	ld	a,(OFST+1,sp)
2992  0030 97            	ld	xl,a
2993  0031 7b04          	ld	a,(OFST+2,sp)
2994  0033 a4ff          	and	a,#255
2995  0035 5f            	clrw	x
2996  0036 02            	rlwa	x,a
2997  0037 1f01          	ldw	(OFST-1,sp),x
2998  0039 01            	rrwa	x,a
3000                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
3002  003a 7b02          	ld	a,(OFST+0,sp)
3003  003c 43            	cpl	a
3004  003d c75218        	ld	21016,a
3005                     ; 883 }
3008  0040 5b04          	addw	sp,#4
3009  0042 81            	ret
3022                     	xdef	_I2C_ClearITPendingBit
3023                     	xdef	_I2C_GetITStatus
3024                     	xdef	_I2C_ClearFlag
3025                     	xdef	_I2C_GetFlagStatus
3026                     	xdef	_I2C_GetLastEvent
3027                     	xdef	_I2C_CheckEvent
3028                     	xdef	_I2C_SendData
3029                     	xdef	_I2C_Send7bitAddress
3030                     	xdef	_I2C_ReceiveData
3031                     	xdef	_I2C_ITConfig
3032                     	xdef	_I2C_FastModeDutyCycleConfig
3033                     	xdef	_I2C_AcknowledgeConfig
3034                     	xdef	_I2C_StretchClockCmd
3035                     	xdef	_I2C_SoftwareResetCmd
3036                     	xdef	_I2C_GenerateSTOP
3037                     	xdef	_I2C_GenerateSTART
3038                     	xdef	_I2C_GeneralCallCmd
3039                     	xdef	_I2C_Cmd
3040                     	xdef	_I2C_Init
3041                     	xdef	_I2C_DeInit
3042                     	xref	_assert_failed
3043                     	switch	.const
3044  000c               L511:
3045  000c 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
3046  001e 6932632e6300  	dc.b	"i2c.c",0
3047                     	xref.b	c_lreg
3048                     	xref.b	c_x
3068                     	xref	c_sdivx
3069                     	xref	c_ludv
3070                     	xref	c_rtol
3071                     	xref	c_smul
3072                     	xref	c_lmul
3073                     	xref	c_lcmp
3074                     	xref	c_ltor
3075                     	xref	c_lzmp
3076                     	end
