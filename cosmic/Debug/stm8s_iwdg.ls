   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  85                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  85                     ; 49 {
  87                     .text:	section	.text,new
  88  0000               _IWDG_WriteAccessCmd:
  90  0000 88            	push	a
  91       00000000      OFST:	set	0
  94                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  96  0001 a155          	cp	a,#85
  97  0003 2711          	jreq	L21
  98  0005 4d            	tnz	a
  99  0006 270e          	jreq	L21
 100  0008 ae0033        	ldw	x,#51
 101  000b 89            	pushw	x
 102  000c 5f            	clrw	x
 103  000d 89            	pushw	x
 104  000e ae0000        	ldw	x,#L73
 105  0011 cd0000        	call	_assert_failed
 107  0014 5b04          	addw	sp,#4
 108  0016               L21:
 109                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
 111  0016 7b01          	ld	a,(OFST+1,sp)
 112  0018 c750e0        	ld	20704,a
 113                     ; 54 }
 116  001b 84            	pop	a
 117  001c 81            	ret	
 208                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 208                     ; 64 {
 209                     .text:	section	.text,new
 210  0000               _IWDG_SetPrescaler:
 212  0000 88            	push	a
 213       00000000      OFST:	set	0
 216                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 218  0001 4d            	tnz	a
 219  0002 2726          	jreq	L42
 220  0004 a101          	cp	a,#1
 221  0006 2722          	jreq	L42
 222  0008 a102          	cp	a,#2
 223  000a 271e          	jreq	L42
 224  000c a103          	cp	a,#3
 225  000e 271a          	jreq	L42
 226  0010 a104          	cp	a,#4
 227  0012 2716          	jreq	L42
 228  0014 a105          	cp	a,#5
 229  0016 2712          	jreq	L42
 230  0018 a106          	cp	a,#6
 231  001a 270e          	jreq	L42
 232  001c ae0042        	ldw	x,#66
 233  001f 89            	pushw	x
 234  0020 5f            	clrw	x
 235  0021 89            	pushw	x
 236  0022 ae0000        	ldw	x,#L73
 237  0025 cd0000        	call	_assert_failed
 239  0028 5b04          	addw	sp,#4
 240  002a               L42:
 241                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 243  002a 7b01          	ld	a,(OFST+1,sp)
 244  002c c750e1        	ld	20705,a
 245                     ; 69 }
 248  002f 84            	pop	a
 249  0030 81            	ret	
 281                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 281                     ; 79 {
 282                     .text:	section	.text,new
 283  0000               _IWDG_SetReload:
 287                     ; 80   IWDG->RLR = IWDG_Reload;
 289  0000 c750e2        	ld	20706,a
 290                     ; 81 }
 293  0003 81            	ret	
 316                     ; 89 void IWDG_ReloadCounter(void)
 316                     ; 90 {
 317                     .text:	section	.text,new
 318  0000               _IWDG_ReloadCounter:
 322                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 324  0000 35aa50e0      	mov	20704,#170
 325                     ; 92 }
 328  0004 81            	ret	
 351                     ; 99 void IWDG_Enable(void)
 351                     ; 100 {
 352                     .text:	section	.text,new
 353  0000               _IWDG_Enable:
 357                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 359  0000 35cc50e0      	mov	20704,#204
 360                     ; 102 }
 363  0004 81            	ret	
 376                     	xdef	_IWDG_Enable
 377                     	xdef	_IWDG_ReloadCounter
 378                     	xdef	_IWDG_SetReload
 379                     	xdef	_IWDG_SetPrescaler
 380                     	xdef	_IWDG_WriteAccessCmd
 381                     	xref	_assert_failed
 382                     .const:	section	.text
 383  0000               L73:
 384  0000 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
 385  0012 697764672e63  	dc.b	"iwdg.c",0
 405                     	end
