   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  54                     ; 21 unsigned char AD7747_Init(void)
  54                     ; 22 {
  56                     .text:	section	.text,new
  57  0000               _AD7747_Init:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 23     unsigned char status = 0;
  65                     ; 27     return status;
  67  0001 4f            	clr	a
  70  0002 5b01          	addw	sp,#1
  71  0004 81            	ret
  74                     .const:	section	.text
  75  0000               L52_sendBuffer:
  76  0000 00            	dc.b	0
  77  0001 000000000000  	ds.b	9
 141                     ; 40 void AD7747_Write(unsigned char subAddr,
 141                     ; 41                   unsigned char* dataBuffer,
 141                     ; 42                   unsigned char bytesNumber)
 141                     ; 43 {
 142                     .text:	section	.text,new
 143  0000               _AD7747_Write:
 145  0000 88            	push	a
 146  0001 520b          	subw	sp,#11
 147       0000000b      OFST:	set	11
 150                     ; 44     unsigned char sendBuffer[10] = {0, };
 152  0003 96            	ldw	x,sp
 153  0004 1c0001        	addw	x,#OFST-10
 154  0007 90ae0000      	ldw	y,#L52_sendBuffer
 155  000b a60a          	ld	a,#10
 156  000d cd0000        	call	c_xymvx
 158                     ; 45     unsigned char byte = 0;
 160                     ; 47     sendBuffer[0] = subAddr;
 162  0010 7b0c          	ld	a,(OFST+1,sp)
 163  0012 6b01          	ld	(OFST-10,sp),a
 165                     ; 48     for(byte = 1; byte <= bytesNumber; byte++)
 167  0014 a601          	ld	a,#1
 168  0016 6b0b          	ld	(OFST+0,sp),a
 171  0018 201c          	jra	L36
 172  001a               L75:
 173                     ; 50         sendBuffer[byte] = dataBuffer[byte - 1];
 175  001a 96            	ldw	x,sp
 176  001b 1c0001        	addw	x,#OFST-10
 177  001e 9f            	ld	a,xl
 178  001f 5e            	swapw	x
 179  0020 1b0b          	add	a,(OFST+0,sp)
 180  0022 2401          	jrnc	L01
 181  0024 5c            	incw	x
 182  0025               L01:
 183  0025 02            	rlwa	x,a
 184  0026 7b0b          	ld	a,(OFST+0,sp)
 185  0028 905f          	clrw	y
 186  002a 9097          	ld	yl,a
 187  002c 905a          	decw	y
 188  002e 72f90f        	addw	y,(OFST+4,sp)
 189  0031 90f6          	ld	a,(y)
 190  0033 f7            	ld	(x),a
 191                     ; 48     for(byte = 1; byte <= bytesNumber; byte++)
 193  0034 0c0b          	inc	(OFST+0,sp)
 195  0036               L36:
 198  0036 7b0b          	ld	a,(OFST+0,sp)
 199  0038 1111          	cp	a,(OFST+6,sp)
 200  003a 23de          	jrule	L75
 201                     ; 56 }
 204  003c 5b0c          	addw	sp,#12
 205  003e 81            	ret
 237                     ; 68 void AD7747_Read(unsigned char subAddr,
 237                     ; 69                  unsigned char* dataBuffer,
 237                     ; 70                  unsigned char bytesNumber)
 237                     ; 71 {
 238                     .text:	section	.text,new
 239  0000               _AD7747_Read:
 243                     ; 80 }
 246  0000 81            	ret
 278                     ; 87 void AD7747_Reset(void)
 278                     ; 88 {
 279                     .text:	section	.text,new
 280  0000               _AD7747_Reset:
 282  0000 88            	push	a
 283       00000001      OFST:	set	1
 286                     ; 89     unsigned char cmd = 0;
 288                     ; 91     cmd = AD7747_RESET_CMD;
 290                     ; 96 }
 293  0001 84            	pop	a
 294  0002 81            	ret
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
 366  0013 200d          	jra	L541
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
 378  0022               L541:
 379                     ; 110     while(!(receiveBuffer[0] & AD7747_STATUS_RDYVT))
 381  0022 7b09          	ld	a,(OFST-2,sp)
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
 397  0038 5f            	clrw	x
 398  0039 97            	ld	xl,a
 399  003a 4f            	clr	a
 400  003b 02            	rlwa	x,a
 401  003c cd0000        	call	c_uitolx
 403  003f 96            	ldw	x,sp
 404  0040 1c0001        	addw	x,#OFST-10
 405  0043 cd0000        	call	c_rtol
 408  0046 7b09          	ld	a,(OFST-2,sp)
 409  0048 b703          	ld	c_lreg+3,a
 410  004a 3f02          	clr	c_lreg+2
 411  004c 3f01          	clr	c_lreg+1
 412  004e 3f00          	clr	c_lreg
 413  0050 a610          	ld	a,#16
 414  0052 cd0000        	call	c_llsh
 416  0055 96            	ldw	x,sp
 417  0056 1c0001        	addw	x,#OFST-10
 418  0059 cd0000        	call	c_ladd
 420  005c 7b09          	ld	a,(OFST-2,sp)
 421  005e cd0000        	call	c_ladc
 423  0061 96            	ldw	x,sp
 424  0062 1c0005        	addw	x,#OFST-6
 425  0065 cd0000        	call	c_rtol
 428                     ; 123     return vtData;
 430  0068 96            	ldw	x,sp
 431  0069 1c0005        	addw	x,#OFST-6
 432  006c cd0000        	call	c_ltor
 436  006f 5b0b          	addw	sp,#11
 437  0071 81            	ret
 440                     	switch	.const
 441  000d               L151_receiveBuffer:
 442  000d 00            	dc.b	0
 443  000e 00            	dc.b	0
 444  000f 00            	dc.b	0
 485                     ; 132 unsigned long AD7747_GetCapData(void)
 485                     ; 133 {
 486                     .text:	section	.text,new
 487  0000               _AD7747_GetCapData:
 489  0000 520b          	subw	sp,#11
 490       0000000b      OFST:	set	11
 493                     ; 134     unsigned char receiveBuffer[3] = {0, 0, 0};
 495  0002 96            	ldw	x,sp
 496  0003 1c0009        	addw	x,#OFST-2
 497  0006 90ae000d      	ldw	y,#L151_receiveBuffer
 498  000a a603          	ld	a,#3
 499  000c cd0000        	call	c_xymvx
 501                     ; 135     unsigned long capData = 0;
 503                     ; 137     receiveBuffer[0] = AD7747_STATUS_RDYCAP;
 505  000f a601          	ld	a,#1
 506  0011 6b09          	ld	(OFST-2,sp),a
 509  0013 200d          	jra	L771
 510  0015               L371:
 511                     ; 140         AD7747_Read(AD7747_REG_STATUS,
 511                     ; 141                     receiveBuffer,
 511                     ; 142                     1);
 513  0015 4b01          	push	#1
 514  0017 96            	ldw	x,sp
 515  0018 1c000a        	addw	x,#OFST-1
 516  001b 89            	pushw	x
 517  001c 4f            	clr	a
 518  001d cd0000        	call	_AD7747_Read
 520  0020 5b03          	addw	sp,#3
 521  0022               L771:
 522                     ; 138     while(!(receiveBuffer[0] & AD7747_STATUS_RDYCAP))
 524  0022 7b09          	ld	a,(OFST-2,sp)
 525  0024 a501          	bcp	a,#1
 526  0026 27ed          	jreq	L371
 527                     ; 144     AD7747_Read(AD7747_REG_CAP_DATA_HIGH,
 527                     ; 145                 receiveBuffer,
 527                     ; 146                 3);
 529  0028 4b03          	push	#3
 530  002a 96            	ldw	x,sp
 531  002b 1c000a        	addw	x,#OFST-1
 532  002e 89            	pushw	x
 533  002f a601          	ld	a,#1
 534  0031 cd0000        	call	_AD7747_Read
 536  0034 5b03          	addw	sp,#3
 537                     ; 147     capData = ((unsigned long)receiveBuffer[0] << 16) +
 537                     ; 148               ((unsigned short)receiveBuffer[1] << 8) +
 537                     ; 149               receiveBuffer[0];
 539  0036 7b0a          	ld	a,(OFST-1,sp)
 540  0038 5f            	clrw	x
 541  0039 97            	ld	xl,a
 542  003a 4f            	clr	a
 543  003b 02            	rlwa	x,a
 544  003c cd0000        	call	c_uitolx
 546  003f 96            	ldw	x,sp
 547  0040 1c0001        	addw	x,#OFST-10
 548  0043 cd0000        	call	c_rtol
 551  0046 7b09          	ld	a,(OFST-2,sp)
 552  0048 b703          	ld	c_lreg+3,a
 553  004a 3f02          	clr	c_lreg+2
 554  004c 3f01          	clr	c_lreg+1
 555  004e 3f00          	clr	c_lreg
 556  0050 a610          	ld	a,#16
 557  0052 cd0000        	call	c_llsh
 559  0055 96            	ldw	x,sp
 560  0056 1c0001        	addw	x,#OFST-10
 561  0059 cd0000        	call	c_ladd
 563  005c 7b09          	ld	a,(OFST-2,sp)
 564  005e cd0000        	call	c_ladc
 566  0061 96            	ldw	x,sp
 567  0062 1c0005        	addw	x,#OFST-6
 568  0065 cd0000        	call	c_rtol
 571                     ; 151     return capData;
 573  0068 96            	ldw	x,sp
 574  0069 1c0005        	addw	x,#OFST-6
 575  006c cd0000        	call	c_ltor
 579  006f 5b0b          	addw	sp,#11
 580  0071 81            	ret
 593                     	xdef	_AD7747_GetCapData
 594                     	xdef	_AD7747_GetVTData
 595                     	xdef	_AD7747_Reset
 596                     	xdef	_AD7747_Read
 597                     	xdef	_AD7747_Write
 598                     	xdef	_AD7747_Init
 599                     	xref.b	c_lreg
 600                     	xref.b	c_x
 619                     	xref	c_ltor
 620                     	xref	c_ladc
 621                     	xref	c_ladd
 622                     	xref	c_rtol
 623                     	xref	c_uitolx
 624                     	xref	c_llsh
 625                     	xref	c_xymvx
 626                     	end
