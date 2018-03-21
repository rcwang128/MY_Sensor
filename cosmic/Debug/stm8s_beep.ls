   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 54 void BEEP_DeInit(void)
  45                     ; 55 {
  47                     .text:	section	.text,new
  48  0000               _BEEP_DeInit:
  52                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  54  0000 351f50f3      	mov	20723,#31
  55                     ; 57 }
  58  0004 81            	ret
 124                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 124                     ; 68 {
 125                     .text:	section	.text,new
 126  0000               _BEEP_Init:
 128  0000 88            	push	a
 129       00000000      OFST:	set	0
 132                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 134  0001 4d            	tnz	a
 135  0002 2708          	jreq	L21
 136  0004 a140          	cp	a,#64
 137  0006 2704          	jreq	L21
 138  0008 a180          	cp	a,#128
 139  000a 2603          	jrne	L01
 140  000c               L21:
 141  000c 4f            	clr	a
 142  000d 2010          	jra	L41
 143  000f               L01:
 144  000f ae0046        	ldw	x,#70
 145  0012 89            	pushw	x
 146  0013 ae0000        	ldw	x,#0
 147  0016 89            	pushw	x
 148  0017 ae000c        	ldw	x,#L15
 149  001a cd0000        	call	_assert_failed
 151  001d 5b04          	addw	sp,#4
 152  001f               L41:
 153                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 155  001f c650f3        	ld	a,20723
 156  0022 a41f          	and	a,#31
 157  0024 a11f          	cp	a,#31
 158  0026 2610          	jrne	L35
 159                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 161  0028 c650f3        	ld	a,20723
 162  002b a4e0          	and	a,#224
 163  002d c750f3        	ld	20723,a
 164                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 166  0030 c650f3        	ld	a,20723
 167  0033 aa0b          	or	a,#11
 168  0035 c750f3        	ld	20723,a
 169  0038               L35:
 170                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 172  0038 c650f3        	ld	a,20723
 173  003b a43f          	and	a,#63
 174  003d c750f3        	ld	20723,a
 175                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 177  0040 c650f3        	ld	a,20723
 178  0043 1a01          	or	a,(OFST+1,sp)
 179  0045 c750f3        	ld	20723,a
 180                     ; 82 }
 183  0048 84            	pop	a
 184  0049 81            	ret
 239                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 239                     ; 92 {
 240                     .text:	section	.text,new
 241  0000               _BEEP_Cmd:
 245                     ; 93   if (NewState != DISABLE)
 247  0000 4d            	tnz	a
 248  0001 2706          	jreq	L301
 249                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 251  0003 721a50f3      	bset	20723,#5
 253  0007 2004          	jra	L501
 254  0009               L301:
 255                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 257  0009 721b50f3      	bres	20723,#5
 258  000d               L501:
 259                     ; 103 }
 262  000d 81            	ret
 310                     .const:	section	.text
 311  0000               L42:
 312  0000 0001adb0      	dc.l	110000
 313  0004               L62:
 314  0004 000249f1      	dc.l	150001
 315  0008               L23:
 316  0008 000003e8      	dc.l	1000
 317                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 317                     ; 119 {
 318                     .text:	section	.text,new
 319  0000               _BEEP_LSICalibrationConfig:
 321  0000 5206          	subw	sp,#6
 322       00000006      OFST:	set	6
 325                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 327  0002 96            	ldw	x,sp
 328  0003 1c0009        	addw	x,#OFST+3
 329  0006 cd0000        	call	c_ltor
 331  0009 ae0000        	ldw	x,#L42
 332  000c cd0000        	call	c_lcmp
 334  000f 2512          	jrult	L22
 335  0011 96            	ldw	x,sp
 336  0012 1c0009        	addw	x,#OFST+3
 337  0015 cd0000        	call	c_ltor
 339  0018 ae0004        	ldw	x,#L62
 340  001b cd0000        	call	c_lcmp
 342  001e 2403          	jruge	L22
 343  0020 4f            	clr	a
 344  0021 2010          	jra	L03
 345  0023               L22:
 346  0023 ae007c        	ldw	x,#124
 347  0026 89            	pushw	x
 348  0027 ae0000        	ldw	x,#0
 349  002a 89            	pushw	x
 350  002b ae000c        	ldw	x,#L15
 351  002e cd0000        	call	_assert_failed
 353  0031 5b04          	addw	sp,#4
 354  0033               L03:
 355                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 357  0033 96            	ldw	x,sp
 358  0034 1c0009        	addw	x,#OFST+3
 359  0037 cd0000        	call	c_ltor
 361  003a ae0008        	ldw	x,#L23
 362  003d cd0000        	call	c_ludv
 364  0040 be02          	ldw	x,c_lreg+2
 365  0042 1f03          	ldw	(OFST-3,sp),x
 367                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 369  0044 c650f3        	ld	a,20723
 370  0047 a4e0          	and	a,#224
 371  0049 c750f3        	ld	20723,a
 372                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 374  004c 1e03          	ldw	x,(OFST-3,sp)
 375  004e 54            	srlw	x
 376  004f 54            	srlw	x
 377  0050 54            	srlw	x
 378  0051 1f05          	ldw	(OFST-1,sp),x
 380                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 382  0053 1e05          	ldw	x,(OFST-1,sp)
 383  0055 58            	sllw	x
 384  0056 58            	sllw	x
 385  0057 58            	sllw	x
 386  0058 1f01          	ldw	(OFST-5,sp),x
 388  005a 1e03          	ldw	x,(OFST-3,sp)
 389  005c 72f001        	subw	x,(OFST-5,sp)
 390  005f 1605          	ldw	y,(OFST-1,sp)
 391  0061 9058          	sllw	y
 392  0063 905c          	incw	y
 393  0065 cd0000        	call	c_imul
 395  0068 1605          	ldw	y,(OFST-1,sp)
 396  006a 9058          	sllw	y
 397  006c 9058          	sllw	y
 398  006e 9058          	sllw	y
 399  0070 bf00          	ldw	c_x,x
 400  0072 90b300        	cpw	y,c_x
 401  0075 250c          	jrult	L721
 402                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 404  0077 7b06          	ld	a,(OFST+0,sp)
 405  0079 a002          	sub	a,#2
 406  007b ca50f3        	or	a,20723
 407  007e c750f3        	ld	20723,a
 409  0081 2009          	jra	L131
 410  0083               L721:
 411                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 413  0083 7b06          	ld	a,(OFST+0,sp)
 414  0085 4a            	dec	a
 415  0086 ca50f3        	or	a,20723
 416  0089 c750f3        	ld	20723,a
 417  008c               L131:
 418                     ; 142 }
 421  008c 5b06          	addw	sp,#6
 422  008e 81            	ret
 435                     	xdef	_BEEP_LSICalibrationConfig
 436                     	xdef	_BEEP_Cmd
 437                     	xdef	_BEEP_Init
 438                     	xdef	_BEEP_DeInit
 439                     	xref	_assert_failed
 440                     	switch	.const
 441  000c               L15:
 442  000c 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
 443  001e 626565702e63  	dc.b	"beep.c",0
 444                     	xref.b	c_lreg
 445                     	xref.b	c_x
 465                     	xref	c_imul
 466                     	xref	c_ludv
 467                     	xref	c_lcmp
 468                     	xref	c_ltor
 469                     	end
