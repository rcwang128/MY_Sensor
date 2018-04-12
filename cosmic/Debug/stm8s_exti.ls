   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 53 void EXTI_DeInit(void)
  45                     ; 54 {
  47                     .text:	section	.text,new
  48  0000               _EXTI_DeInit:
  52                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  54  0000 725f50a0      	clr	20640
  55                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  57  0004 725f50a1      	clr	20641
  58                     ; 57 }
  61  0008 81            	ret
 187                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 187                     ; 71 {
 188                     .text:	section	.text,new
 189  0000               _EXTI_SetExtIntSensitivity:
 191  0000 89            	pushw	x
 192       00000000      OFST:	set	0
 195                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 197  0001 9e            	ld	a,xh
 198  0002 4d            	tnz	a
 199  0003 2714          	jreq	L21
 200  0005 9e            	ld	a,xh
 201  0006 a101          	cp	a,#1
 202  0008 270f          	jreq	L21
 203  000a 9e            	ld	a,xh
 204  000b a102          	cp	a,#2
 205  000d 270a          	jreq	L21
 206  000f 9e            	ld	a,xh
 207  0010 a103          	cp	a,#3
 208  0012 2705          	jreq	L21
 209  0014 9e            	ld	a,xh
 210  0015 a104          	cp	a,#4
 211  0017 2603          	jrne	L01
 212  0019               L21:
 213  0019 4f            	clr	a
 214  001a 2010          	jra	L41
 215  001c               L01:
 216  001c ae0049        	ldw	x,#73
 217  001f 89            	pushw	x
 218  0020 ae0000        	ldw	x,#0
 219  0023 89            	pushw	x
 220  0024 ae0000        	ldw	x,#L111
 221  0027 cd0000        	call	_assert_failed
 223  002a 5b04          	addw	sp,#4
 224  002c               L41:
 225                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 227  002c 0d02          	tnz	(OFST+2,sp)
 228  002e 2712          	jreq	L02
 229  0030 7b02          	ld	a,(OFST+2,sp)
 230  0032 a101          	cp	a,#1
 231  0034 270c          	jreq	L02
 232  0036 7b02          	ld	a,(OFST+2,sp)
 233  0038 a102          	cp	a,#2
 234  003a 2706          	jreq	L02
 235  003c 7b02          	ld	a,(OFST+2,sp)
 236  003e a103          	cp	a,#3
 237  0040 2603          	jrne	L61
 238  0042               L02:
 239  0042 4f            	clr	a
 240  0043 2010          	jra	L22
 241  0045               L61:
 242  0045 ae004a        	ldw	x,#74
 243  0048 89            	pushw	x
 244  0049 ae0000        	ldw	x,#0
 245  004c 89            	pushw	x
 246  004d ae0000        	ldw	x,#L111
 247  0050 cd0000        	call	_assert_failed
 249  0053 5b04          	addw	sp,#4
 250  0055               L22:
 251                     ; 77   switch (Port)
 253  0055 7b01          	ld	a,(OFST+1,sp)
 255                     ; 99   default:
 255                     ; 100     break;
 256  0057 4d            	tnz	a
 257  0058 270e          	jreq	L12
 258  005a 4a            	dec	a
 259  005b 271d          	jreq	L32
 260  005d 4a            	dec	a
 261  005e 272e          	jreq	L52
 262  0060 4a            	dec	a
 263  0061 2742          	jreq	L72
 264  0063 4a            	dec	a
 265  0064 2756          	jreq	L13
 266  0066 2064          	jra	L511
 267  0068               L12:
 268                     ; 79   case EXTI_PORT_GPIOA:
 268                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 270  0068 c650a0        	ld	a,20640
 271  006b a4fc          	and	a,#252
 272  006d c750a0        	ld	20640,a
 273                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 275  0070 c650a0        	ld	a,20640
 276  0073 1a02          	or	a,(OFST+2,sp)
 277  0075 c750a0        	ld	20640,a
 278                     ; 82     break;
 280  0078 2052          	jra	L511
 281  007a               L32:
 282                     ; 83   case EXTI_PORT_GPIOB:
 282                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 284  007a c650a0        	ld	a,20640
 285  007d a4f3          	and	a,#243
 286  007f c750a0        	ld	20640,a
 287                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 289  0082 7b02          	ld	a,(OFST+2,sp)
 290  0084 48            	sll	a
 291  0085 48            	sll	a
 292  0086 ca50a0        	or	a,20640
 293  0089 c750a0        	ld	20640,a
 294                     ; 86     break;
 296  008c 203e          	jra	L511
 297  008e               L52:
 298                     ; 87   case EXTI_PORT_GPIOC:
 298                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 300  008e c650a0        	ld	a,20640
 301  0091 a4cf          	and	a,#207
 302  0093 c750a0        	ld	20640,a
 303                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 305  0096 7b02          	ld	a,(OFST+2,sp)
 306  0098 97            	ld	xl,a
 307  0099 a610          	ld	a,#16
 308  009b 42            	mul	x,a
 309  009c 9f            	ld	a,xl
 310  009d ca50a0        	or	a,20640
 311  00a0 c750a0        	ld	20640,a
 312                     ; 90     break;
 314  00a3 2027          	jra	L511
 315  00a5               L72:
 316                     ; 91   case EXTI_PORT_GPIOD:
 316                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 318  00a5 c650a0        	ld	a,20640
 319  00a8 a43f          	and	a,#63
 320  00aa c750a0        	ld	20640,a
 321                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 323  00ad 7b02          	ld	a,(OFST+2,sp)
 324  00af 97            	ld	xl,a
 325  00b0 a640          	ld	a,#64
 326  00b2 42            	mul	x,a
 327  00b3 9f            	ld	a,xl
 328  00b4 ca50a0        	or	a,20640
 329  00b7 c750a0        	ld	20640,a
 330                     ; 94     break;
 332  00ba 2010          	jra	L511
 333  00bc               L13:
 334                     ; 95   case EXTI_PORT_GPIOE:
 334                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 336  00bc c650a1        	ld	a,20641
 337  00bf a4fc          	and	a,#252
 338  00c1 c750a1        	ld	20641,a
 339                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 341  00c4 c650a1        	ld	a,20641
 342  00c7 1a02          	or	a,(OFST+2,sp)
 343  00c9 c750a1        	ld	20641,a
 344                     ; 98     break;
 346  00cc               L33:
 347                     ; 99   default:
 347                     ; 100     break;
 349  00cc               L511:
 350                     ; 102 }
 353  00cc 85            	popw	x
 354  00cd 81            	ret
 413                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 413                     ; 112 {
 414                     .text:	section	.text,new
 415  0000               _EXTI_SetTLISensitivity:
 417  0000 88            	push	a
 418       00000000      OFST:	set	0
 421                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 423  0001 4d            	tnz	a
 424  0002 2704          	jreq	L03
 425  0004 a104          	cp	a,#4
 426  0006 2603          	jrne	L62
 427  0008               L03:
 428  0008 4f            	clr	a
 429  0009 2010          	jra	L23
 430  000b               L62:
 431  000b ae0072        	ldw	x,#114
 432  000e 89            	pushw	x
 433  000f ae0000        	ldw	x,#0
 434  0012 89            	pushw	x
 435  0013 ae0000        	ldw	x,#L111
 436  0016 cd0000        	call	_assert_failed
 438  0019 5b04          	addw	sp,#4
 439  001b               L23:
 440                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 442  001b 721550a1      	bres	20641,#2
 443                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 445  001f c650a1        	ld	a,20641
 446  0022 1a01          	or	a,(OFST+1,sp)
 447  0024 c750a1        	ld	20641,a
 448                     ; 119 }
 451  0027 84            	pop	a
 452  0028 81            	ret
 497                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 497                     ; 127 {
 498                     .text:	section	.text,new
 499  0000               _EXTI_GetExtIntSensitivity:
 501  0000 88            	push	a
 502  0001 88            	push	a
 503       00000001      OFST:	set	1
 506                     ; 128   uint8_t value = 0;
 508  0002 0f01          	clr	(OFST+0,sp)
 510                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 512  0004 4d            	tnz	a
 513  0005 2710          	jreq	L04
 514  0007 a101          	cp	a,#1
 515  0009 270c          	jreq	L04
 516  000b a102          	cp	a,#2
 517  000d 2708          	jreq	L04
 518  000f a103          	cp	a,#3
 519  0011 2704          	jreq	L04
 520  0013 a104          	cp	a,#4
 521  0015 2603          	jrne	L63
 522  0017               L04:
 523  0017 4f            	clr	a
 524  0018 2010          	jra	L24
 525  001a               L63:
 526  001a ae0083        	ldw	x,#131
 527  001d 89            	pushw	x
 528  001e ae0000        	ldw	x,#0
 529  0021 89            	pushw	x
 530  0022 ae0000        	ldw	x,#L111
 531  0025 cd0000        	call	_assert_failed
 533  0028 5b04          	addw	sp,#4
 534  002a               L24:
 535                     ; 133   switch (Port)
 537  002a 7b02          	ld	a,(OFST+1,sp)
 539                     ; 150   default:
 539                     ; 151     break;
 540  002c 4d            	tnz	a
 541  002d 270e          	jreq	L541
 542  002f 4a            	dec	a
 543  0030 2714          	jreq	L741
 544  0032 4a            	dec	a
 545  0033 271c          	jreq	L151
 546  0035 4a            	dec	a
 547  0036 2725          	jreq	L351
 548  0038 4a            	dec	a
 549  0039 2730          	jreq	L551
 550  003b 2035          	jra	L302
 551  003d               L541:
 552                     ; 135   case EXTI_PORT_GPIOA:
 552                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 554  003d c650a0        	ld	a,20640
 555  0040 a403          	and	a,#3
 556  0042 6b01          	ld	(OFST+0,sp),a
 558                     ; 137     break;
 560  0044 202c          	jra	L302
 561  0046               L741:
 562                     ; 138   case EXTI_PORT_GPIOB:
 562                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 564  0046 c650a0        	ld	a,20640
 565  0049 a40c          	and	a,#12
 566  004b 44            	srl	a
 567  004c 44            	srl	a
 568  004d 6b01          	ld	(OFST+0,sp),a
 570                     ; 140     break;
 572  004f 2021          	jra	L302
 573  0051               L151:
 574                     ; 141   case EXTI_PORT_GPIOC:
 574                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 576  0051 c650a0        	ld	a,20640
 577  0054 a430          	and	a,#48
 578  0056 4e            	swap	a
 579  0057 a40f          	and	a,#15
 580  0059 6b01          	ld	(OFST+0,sp),a
 582                     ; 143     break;
 584  005b 2015          	jra	L302
 585  005d               L351:
 586                     ; 144   case EXTI_PORT_GPIOD:
 586                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 588  005d c650a0        	ld	a,20640
 589  0060 a4c0          	and	a,#192
 590  0062 4e            	swap	a
 591  0063 44            	srl	a
 592  0064 44            	srl	a
 593  0065 a403          	and	a,#3
 594  0067 6b01          	ld	(OFST+0,sp),a
 596                     ; 146     break;
 598  0069 2007          	jra	L302
 599  006b               L551:
 600                     ; 147   case EXTI_PORT_GPIOE:
 600                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 602  006b c650a1        	ld	a,20641
 603  006e a403          	and	a,#3
 604  0070 6b01          	ld	(OFST+0,sp),a
 606                     ; 149     break;
 608  0072               L751:
 609                     ; 150   default:
 609                     ; 151     break;
 611  0072               L302:
 612                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 614  0072 7b01          	ld	a,(OFST+0,sp)
 617  0074 85            	popw	x
 618  0075 81            	ret
 652                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 652                     ; 163 {
 653                     .text:	section	.text,new
 654  0000               _EXTI_GetTLISensitivity:
 656  0000 88            	push	a
 657       00000001      OFST:	set	1
 660                     ; 164   uint8_t value = 0;
 662                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 664  0001 c650a1        	ld	a,20641
 665  0004 a404          	and	a,#4
 666  0006 6b01          	ld	(OFST+0,sp),a
 668                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 670  0008 7b01          	ld	a,(OFST+0,sp)
 673  000a 5b01          	addw	sp,#1
 674  000c 81            	ret
 687                     	xdef	_EXTI_GetTLISensitivity
 688                     	xdef	_EXTI_GetExtIntSensitivity
 689                     	xdef	_EXTI_SetTLISensitivity
 690                     	xdef	_EXTI_SetExtIntSensitivity
 691                     	xdef	_EXTI_DeInit
 692                     	xref	_assert_failed
 693                     .const:	section	.text
 694  0000               L111:
 695  0000 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
 696  0012 657874692e63  	dc.b	"exti.c",0
 716                     	end
