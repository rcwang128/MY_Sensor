   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  58                     ; 21 unsigned char AD7747_Init(void)
  58                     ; 22 {
  60                     .text:	section	.text,new
  61  0000               _AD7747_Init:
  63       00000001      OFST:	set	1
  66                     ; 23     unsigned char status = 0;
  68                     ; 27     return status;
  70  0000 4f            	clr	a
  73  0001 81            	ret	
  76                     .const:	section	.text
  77  0000               L52_sendBuffer:
  78  0000 00            	dc.b	0
  79  0001 000000000000  	ds.b	9
 143                     ; 40 void AD7747_Write(unsigned char subAddr,
 143                     ; 41                   unsigned char* dataBuffer,
 143                     ; 42                   unsigned char bytesNumber)
 143                     ; 43 {
 144                     .text:	section	.text,new
 145  0000               _AD7747_Write:
 147  0000 88            	push	a
 148  0001 520b          	subw	sp,#11
 149       0000000b      OFST:	set	11
 152                     ; 44     unsigned char sendBuffer[10] = {0, };
 154  0003 96            	ldw	x,sp
 155  0004 5c            	incw	x
 156  0005 90ae0000      	ldw	y,#L52_sendBuffer
 157  0009 a60a          	ld	a,#10
 158  000b cd0000        	call	c_xymvx
 160                     ; 45     unsigned char byte = 0;
 162                     ; 47     sendBuffer[0] = subAddr;
 164  000e 7b0c          	ld	a,(OFST+1,sp)
 165  0010 6b01          	ld	(OFST-10,sp),a
 167                     ; 48     for(byte = 1; byte <= bytesNumber; byte++)
 169  0012 a601          	ld	a,#1
 170  0014 6b0b          	ld	(OFST+0,sp),a
 173  0016 201c          	jra	L36
 174  0018               L75:
 175                     ; 50         sendBuffer[byte] = dataBuffer[byte - 1];
 177  0018 96            	ldw	x,sp
 178  0019 5c            	incw	x
 179  001a 9f            	ld	a,xl
 180  001b 5e            	swapw	x
 181  001c 1b0b          	add	a,(OFST+0,sp)
 182  001e 2401          	jrnc	L01
 183  0020 5c            	incw	x
 184  0021               L01:
 185  0021 02            	rlwa	x,a
 186  0022 7b0b          	ld	a,(OFST+0,sp)
 187  0024 905f          	clrw	y
 188  0026 9097          	ld	yl,a
 189  0028 905a          	decw	y
 190  002a 72f90f        	addw	y,(OFST+4,sp)
 191  002d 90f6          	ld	a,(y)
 192  002f f7            	ld	(x),a
 193                     ; 48     for(byte = 1; byte <= bytesNumber; byte++)
 195  0030 0c0b          	inc	(OFST+0,sp)
 197  0032 7b0b          	ld	a,(OFST+0,sp)
 198  0034               L36:
 201  0034 1111          	cp	a,(OFST+6,sp)
 202  0036 23e0          	jrule	L75
 203                     ; 56 }
 206  0038 5b0c          	addw	sp,#12
 207  003a 81            	ret	
 239                     ; 68 void AD7747_Read(unsigned char subAddr,
 239                     ; 69                  unsigned char* dataBuffer,
 239                     ; 70                  unsigned char bytesNumber)
 239                     ; 71 {
 240                     .text:	section	.text,new
 241  0000               _AD7747_Read:
 245                     ; 80 }
 248  0000 81            	ret	
 280                     ; 87 void AD7747_Reset(void)
 280                     ; 88 {
 281                     .text:	section	.text,new
 282  0000               _AD7747_Reset:
 284       00000001      OFST:	set	1
 287                     ; 89     unsigned char cmd = 0;
 289                     ; 91     cmd = AD7747_RESET_CMD;
 291                     ; 96 }
 294  0000 81            	ret	
 297                     	switch	.const
 298  000a               L711_receiveBuffer:
 299  000a 00            	dc.b	0
 300  000b 00            	dc.b	0
 301  000c 00            	dc.b	0
 342                     ; 104 unsigned long AD7747_GetVTData(void)
 342                     ; 105 {
 343                     .text:	section	.text,new
 344  0000               _AD7747_GetVTData:
 346  0000 520b          	subw	sp,#11
 347       0000000b      OFST:	set	11
 350                     ; 106     unsigned char receiveBuffer[3] = {0, 0, 0};
 352  0002 96            	ldw	x,sp
 353  0003 1c0009        	addw	x,#OFST-2
 354  0006 90ae000a      	ldw	y,#L711_receiveBuffer
 355  000a a603          	ld	a,#3
 356  000c cd0000        	call	c_xymvx
 358                     ; 107     unsigned long vtData = 0;
 360                     ; 109     receiveBuffer[0] = AD7747_STATUS_RDYVT;
 362  000f a602          	ld	a,#2
 363  0011 6b09          	ld	(OFST-2,sp),a
 366  0013 200f          	jra	L541
 367  0015               L141:
 368                     ; 112         AD7747_Read(AD7747_REG_STATUS,
 368                     ; 113                     receiveBuffer,
 368                     ; 114                     1);
 370  0015 4b01          	push	#1
 371  0017 96            	ldw	x,sp
 372  0018 1c000a        	addw	x,#OFST-1
 373  001b 89            	pushw	x
 374  001c 4f            	clr	a
 375  001d cd0000        	call	_AD7747_Read
 377  0020 5b03          	addw	sp,#3
 378  0022 7b09          	ld	a,(OFST-2,sp)
 379  0024               L541:
 380                     ; 110     while(!(receiveBuffer[0] & AD7747_STATUS_RDYVT))
 382  0024 a502          	bcp	a,#2
 383  0026 27ed          	jreq	L141
 384                     ; 116     AD7747_Read(AD7747_REG_VT_DATA_HIGH,
 384                     ; 117                 receiveBuffer,
 384                     ; 118                 3);
 386  0028 4b03          	push	#3
 387  002a 96            	ldw	x,sp
 388  002b 1c000a        	addw	x,#OFST-1
 389  002e 89            	pushw	x
 390  002f a604          	ld	a,#4
 391  0031 cd0000        	call	_AD7747_Read
 393  0034 5b03          	addw	sp,#3
 394                     ; 119     vtData = ((unsigned long)receiveBuffer[0] << 16) +
 394                     ; 120              ((unsigned short)receiveBuffer[1] << 8) +
 394                     ; 121              receiveBuffer[0];
 396  0036 7b0a          	ld	a,(OFST-1,sp)
 397  0038 97            	ld	xl,a
 398  0039 4f            	clr	a
 399  003a 02            	rlwa	x,a
 400  003b cd0000        	call	c_uitolx
 402  003e 96            	ldw	x,sp
 403  003f 5c            	incw	x
 404  0040 cd0000        	call	c_rtol
 407  0043 7b09          	ld	a,(OFST-2,sp)
 408  0045 b703          	ld	c_lreg+3,a
 409  0047 3f02          	clr	c_lreg+2
 410  0049 3f01          	clr	c_lreg+1
 411  004b 3f00          	clr	c_lreg
 412  004d a610          	ld	a,#16
 413  004f cd0000        	call	c_llsh
 415  0052 96            	ldw	x,sp
 416  0053 5c            	incw	x
 417  0054 cd0000        	call	c_ladd
 419  0057 7b09          	ld	a,(OFST-2,sp)
 420  0059 cd0000        	call	c_ladc
 422  005c 96            	ldw	x,sp
 423  005d 1c0005        	addw	x,#OFST-6
 424  0060 cd0000        	call	c_rtol
 427                     ; 123     return vtData;
 429  0063 96            	ldw	x,sp
 430  0064 1c0005        	addw	x,#OFST-6
 431  0067 cd0000        	call	c_ltor
 435  006a 5b0b          	addw	sp,#11
 436  006c 81            	ret	
 439                     	switch	.const
 440  000d               L151_receiveBuffer:
 441  000d 00            	dc.b	0
 442  000e 00            	dc.b	0
 443  000f 00            	dc.b	0
 484                     ; 132 unsigned long AD7747_GetCapData(void)
 484                     ; 133 {
 485                     .text:	section	.text,new
 486  0000               _AD7747_GetCapData:
 488  0000 520b          	subw	sp,#11
 489       0000000b      OFST:	set	11
 492                     ; 134     unsigned char receiveBuffer[3] = {0, 0, 0};
 494  0002 96            	ldw	x,sp
 495  0003 1c0009        	addw	x,#OFST-2
 496  0006 90ae000d      	ldw	y,#L151_receiveBuffer
 497  000a a603          	ld	a,#3
 498  000c cd0000        	call	c_xymvx
 500                     ; 135     unsigned long capData = 0;
 502                     ; 137     receiveBuffer[0] = AD7747_STATUS_RDYCAP;
 504  000f a601          	ld	a,#1
 505  0011 6b09          	ld	(OFST-2,sp),a
 508  0013 200f          	jra	L771
 509  0015               L371:
 510                     ; 140         AD7747_Read(AD7747_REG_STATUS,
 510                     ; 141                     receiveBuffer,
 510                     ; 142                     1);
 512  0015 4b01          	push	#1
 513  0017 96            	ldw	x,sp
 514  0018 1c000a        	addw	x,#OFST-1
 515  001b 89            	pushw	x
 516  001c 4f            	clr	a
 517  001d cd0000        	call	_AD7747_Read
 519  0020 5b03          	addw	sp,#3
 520  0022 7b09          	ld	a,(OFST-2,sp)
 521  0024               L771:
 522                     ; 138     while(!(receiveBuffer[0] & AD7747_STATUS_RDYCAP))
 524  0024 a501          	bcp	a,#1
 525  0026 27ed          	jreq	L371
 526                     ; 144     AD7747_Read(AD7747_REG_CAP_DATA_HIGH,
 526                     ; 145                 receiveBuffer,
 526                     ; 146                 3);
 528  0028 4b03          	push	#3
 529  002a 96            	ldw	x,sp
 530  002b 1c000a        	addw	x,#OFST-1
 531  002e 89            	pushw	x
 532  002f a601          	ld	a,#1
 533  0031 cd0000        	call	_AD7747_Read
 535  0034 5b03          	addw	sp,#3
 536                     ; 147     capData = ((unsigned long)receiveBuffer[0] << 16) +
 536                     ; 148               ((unsigned short)receiveBuffer[1] << 8) +
 536                     ; 149               receiveBuffer[0];
 538  0036 7b0a          	ld	a,(OFST-1,sp)
 539  0038 97            	ld	xl,a
 540  0039 4f            	clr	a
 541  003a 02            	rlwa	x,a
 542  003b cd0000        	call	c_uitolx
 544  003e 96            	ldw	x,sp
 545  003f 5c            	incw	x
 546  0040 cd0000        	call	c_rtol
 549  0043 7b09          	ld	a,(OFST-2,sp)
 550  0045 b703          	ld	c_lreg+3,a
 551  0047 3f02          	clr	c_lreg+2
 552  0049 3f01          	clr	c_lreg+1
 553  004b 3f00          	clr	c_lreg
 554  004d a610          	ld	a,#16
 555  004f cd0000        	call	c_llsh
 557  0052 96            	ldw	x,sp
 558  0053 5c            	incw	x
 559  0054 cd0000        	call	c_ladd
 561  0057 7b09          	ld	a,(OFST-2,sp)
 562  0059 cd0000        	call	c_ladc
 564  005c 96            	ldw	x,sp
 565  005d 1c0005        	addw	x,#OFST-6
 566  0060 cd0000        	call	c_rtol
 569                     ; 151     return capData;
 571  0063 96            	ldw	x,sp
 572  0064 1c0005        	addw	x,#OFST-6
 573  0067 cd0000        	call	c_ltor
 577  006a 5b0b          	addw	sp,#11
 578  006c 81            	ret	
 591                     	xdef	_AD7747_GetCapData
 592                     	xdef	_AD7747_GetVTData
 593                     	xdef	_AD7747_Reset
 594                     	xdef	_AD7747_Read
 595                     	xdef	_AD7747_Write
 596                     	xdef	_AD7747_Init
 597                     	xref.b	c_lreg
 598                     	xref.b	c_x
 617                     	xref	c_ltor
 618                     	xref	c_ladc
 619                     	xref	c_ladd
 620                     	xref	c_rtol
 621                     	xref	c_uitolx
 622                     	xref	c_llsh
 623                     	xref	c_xymvx
 624                     	end
