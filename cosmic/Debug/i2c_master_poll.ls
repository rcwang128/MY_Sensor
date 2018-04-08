   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 30 void I2C_Master_Init(void) {
  47                     .text:	section	.text,new
  48  0000               _I2C_Master_Init:
  52                     ; 36   I2C->FREQR = 16;               // input clock to I2C - 16MHz 
  54  0000 35105212      	mov	21010,#16
  55                     ; 37   I2C->CCRL = 15;                // 900/62.5= 15, (SCLhi must be at least 600+300=900ns!)
  57  0004 350f521b      	mov	21019,#15
  58                     ; 38   I2C->CCRH = 0x80;              // fast mode, duty 2/1 (bus speed 62.5*3*15~356kHz)
  60  0008 3580521c      	mov	21020,#128
  61                     ; 39   I2C->TRISER = 5;               // 300/62.5 + 1= 5  (maximum 300ns)
  63  000c 3505521d      	mov	21021,#5
  64                     ; 46   I2C->OARL = 0xA0;              // own address A0;
  66  0010 35a05213      	mov	21011,#160
  67                     ; 47   I2C->OARH |= 0x40;
  69  0014 721c5214      	bset	21012,#6
  70                     ; 48   I2C->ITR = 1;                  // enable error interrupts
  72  0018 3501521a      	mov	21018,#1
  73                     ; 49   I2C->CR2 |= 0x04;              // ACK=1, Ack enable
  75  001c 72145211      	bset	21009,#2
  76                     ; 50   I2C->CR1 |= 0x01;              // PE=1
  78  0020 72105210      	bset	21008,#0
  79                     ; 51 }
  82  0024 81            	ret
 140                     ; 60 void I2C_ReadRegister(u8 u8_regAddr, u8 u8_NumByteToRead, u8 *u8_DataBuffer)
 140                     ; 61 {
 141                     .text:	section	.text,new
 142  0000               _I2C_ReadRegister:
 144  0000 89            	pushw	x
 145       00000000      OFST:	set	0
 148  0001 2010          	jra	L54
 149  0003               L34:
 150                     ; 65 		I2C->CR2 |= I2C_CR2_STOP;                   				// Generate stop here (STOP=1)
 152  0003 72125211      	bset	21009,#1
 154  0007               L35:
 155                     ; 66     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// Wait until stop is performed
 157  0007 c65211        	ld	a,21009
 158  000a a502          	bcp	a,#2
 159  000c 2705          	jreq	L54
 161  000e ce0000        	ldw	x,_TIM4_tout
 162  0011 26f4          	jrne	L35
 163  0013               L54:
 164                     ; 63 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 166  0013 c65219        	ld	a,21017
 167  0016 a502          	bcp	a,#2
 168  0018 2705          	jreq	L16
 170  001a ce0000        	ldw	x,_TIM4_tout
 171  001d 26e4          	jrne	L34
 172  001f               L16:
 173                     ; 68   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 175  001f 72145211      	bset	21009,#2
 176                     ; 70   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 178  0023 72105211      	bset	21009,#0
 180  0027               L56:
 181                     ; 71   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// Wait for start bit detection (SB)
 183  0027 c65217        	ld	a,21015
 184  002a a501          	bcp	a,#1
 185  002c 2605          	jrne	L17
 187  002e ce0000        	ldw	x,_TIM4_tout
 188  0031 26f4          	jrne	L56
 189  0033               L17:
 190                     ; 73   if(tout())
 192  0033 ce0000        	ldw	x,_TIM4_tout
 193  0036 2704          	jreq	L77
 194                     ; 83       I2C->DR = (u8)(SLAVE_ADDRESS << 1);   						// Send 7-bit device address & Write (R/W = 0)
 196  0038 35905216      	mov	21014,#144
 197  003c               L77:
 198                     ; 86   while(!(I2C->SR1 & I2C_SR1_ADDR) &&  tout()); 				// test EV6 - wait for address ack (ADDR)
 200  003c c65217        	ld	a,21015
 201  003f a502          	bcp	a,#2
 202  0041 2605          	jrne	L301
 204  0043 ce0000        	ldw	x,_TIM4_tout
 205  0046 26f4          	jrne	L77
 206  0048               L301:
 207                     ; 88   I2C->SR3;
 210  0048 c65219        	ld	a,21017
 212  004b               L701:
 213                     ; 90   while(!(I2C->SR1 & I2C_SR1_TXE) &&  tout());  				// Wait for TxE
 215  004b c65217        	ld	a,21015
 216  004e a580          	bcp	a,#128
 217  0050 2605          	jrne	L311
 219  0052 ce0000        	ldw	x,_TIM4_tout
 220  0055 26f4          	jrne	L701
 221  0057               L311:
 222                     ; 91   if(tout())
 224  0057 ce0000        	ldw	x,_TIM4_tout
 225  005a 2705          	jreq	L121
 226                     ; 93     I2C->DR = u8_regAddr;                         			// Send register address
 228  005c 7b01          	ld	a,(OFST+1,sp)
 229  005e c75216        	ld	21014,a
 230  0061               L121:
 231                     ; 95   while((I2C->SR1 & (I2C_SR1_TXE | I2C_SR1_BTF)) != (I2C_SR1_TXE | I2C_SR1_BTF)  &&  tout()); 
 233  0061 c65217        	ld	a,21015
 234  0064 a484          	and	a,#132
 235  0066 a184          	cp	a,#132
 236  0068 2705          	jreq	L521
 238  006a ce0000        	ldw	x,_TIM4_tout
 239  006d 26f2          	jrne	L121
 240  006f               L521:
 241                     ; 105   I2C->CR2 |= I2C_CR2_START;                     				// START=1, generate re-start
 244  006f 72105211      	bset	21009,#0
 246  0073               L131:
 247                     ; 106   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout()); 				// Wait for start bit detection (SB)
 249  0073 c65217        	ld	a,21015
 250  0076 a501          	bcp	a,#1
 251  0078 2605          	jrne	L531
 253  007a ce0000        	ldw	x,_TIM4_tout
 254  007d 26f4          	jrne	L131
 255  007f               L531:
 256                     ; 108   if(tout())
 258  007f ce0000        	ldw	x,_TIM4_tout
 259  0082 2704          	jreq	L341
 260                     ; 120       I2C->DR = (u8)(SLAVE_ADDRESS << 1) | 1;         	// Send 7-bit device address & Write (R/W = 1)
 262  0084 35915216      	mov	21014,#145
 263  0088               L341:
 264                     ; 123   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());  			// Wait for address ack (ADDR)
 266  0088 c65217        	ld	a,21015
 267  008b a502          	bcp	a,#2
 268  008d 2605          	jrne	L741
 270  008f ce0000        	ldw	x,_TIM4_tout
 271  0092 26f4          	jrne	L341
 272  0094               L741:
 273                     ; 125   if (u8_NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
 275  0094 7b02          	ld	a,(OFST+2,sp)
 276  0096 a103          	cp	a,#3
 277  0098 257a          	jrult	L151
 278                     ; 127     I2C->SR3;                                     			// ADDR clearing sequence    
 280  009a c65219        	ld	a,21017
 282  009d 201c          	jra	L551
 283  009f               L361:
 284                     ; 130       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
 286  009f c65217        	ld	a,21015
 287  00a2 a504          	bcp	a,#4
 288  00a4 2605          	jrne	L761
 290  00a6 ce0000        	ldw	x,_TIM4_tout
 291  00a9 26f4          	jrne	L361
 292  00ab               L761:
 293                     ; 131 			*u8_DataBuffer++ = I2C->DR;                   				// Reading next data byte
 295  00ab 1e05          	ldw	x,(OFST+5,sp)
 296  00ad 1c0001        	addw	x,#1
 297  00b0 1f05          	ldw	(OFST+5,sp),x
 298  00b2 1d0001        	subw	x,#1
 299  00b5 c65216        	ld	a,21014
 300  00b8 f7            	ld	(x),a
 301                     ; 132       --u8_NumByteToRead;																		// Decrease Numbyte to reade by 1
 303  00b9 0a02          	dec	(OFST+2,sp)
 304  00bb               L551:
 305                     ; 128     while(u8_NumByteToRead > 3  &&  tout())       			// not last three bytes?
 307  00bb 7b02          	ld	a,(OFST+2,sp)
 308  00bd a104          	cp	a,#4
 309  00bf 2505          	jrult	L571
 311  00c1 ce0000        	ldw	x,_TIM4_tout
 312  00c4 26d9          	jrne	L361
 313  00c6               L571:
 314                     ; 135     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
 316  00c6 c65217        	ld	a,21015
 317  00c9 a504          	bcp	a,#4
 318  00cb 2605          	jrne	L102
 320  00cd ce0000        	ldw	x,_TIM4_tout
 321  00d0 26f4          	jrne	L571
 322  00d2               L102:
 323                     ; 136     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
 325  00d2 72155211      	bres	21009,#2
 326                     ; 137     disableInterrupts();                          			// Errata workaround (Disable interrupt)
 329  00d6 9b            sim
 331                     ; 138     *u8_DataBuffer++ = I2C->DR;                     		// Read 1st byte
 334  00d7 1e05          	ldw	x,(OFST+5,sp)
 335  00d9 1c0001        	addw	x,#1
 336  00dc 1f05          	ldw	(OFST+5,sp),x
 337  00de 1d0001        	subw	x,#1
 338  00e1 c65216        	ld	a,21014
 339  00e4 f7            	ld	(x),a
 340                     ; 139     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
 342  00e5 72125211      	bset	21009,#1
 343                     ; 140     *u8_DataBuffer++ = I2C->DR;                     		// Read 2nd byte
 345  00e9 1e05          	ldw	x,(OFST+5,sp)
 346  00eb 1c0001        	addw	x,#1
 347  00ee 1f05          	ldw	(OFST+5,sp),x
 348  00f0 1d0001        	subw	x,#1
 349  00f3 c65216        	ld	a,21014
 350  00f6 f7            	ld	(x),a
 351                     ; 141     enableInterrupts();																	// Errata workaround (Enable interrupt)
 354  00f7 9a            rim
 358  00f8               L502:
 359                     ; 142     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
 361  00f8 c65217        	ld	a,21015
 362  00fb a540          	bcp	a,#64
 363  00fd 2605          	jrne	L112
 365  00ff ce0000        	ldw	x,_TIM4_tout
 366  0102 26f4          	jrne	L502
 367  0104               L112:
 368                     ; 143     *u8_DataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
 370  0104 1e05          	ldw	x,(OFST+5,sp)
 371  0106 1c0001        	addw	x,#1
 372  0109 1f05          	ldw	(OFST+5,sp),x
 373  010b 1d0001        	subw	x,#1
 374  010e c65216        	ld	a,21014
 375  0111 f7            	ld	(x),a
 377  0112 205a          	jra	L342
 378  0114               L151:
 379                     ; 147    if(u8_NumByteToRead == 2)                						// *** just two bytes are received? ***
 381  0114 7b02          	ld	a,(OFST+2,sp)
 382  0116 a102          	cp	a,#2
 383  0118 2635          	jrne	L512
 384                     ; 149       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
 386  011a 72165211      	bset	21009,#3
 387                     ; 150       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 390  011e 9b            sim
 392                     ; 151       I2C->SR3;                                       	// Clear ADDR Flag
 395  011f c65219        	ld	a,21017
 396                     ; 152       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
 398  0122 72155211      	bres	21009,#2
 399                     ; 153       enableInterrupts();																// Errata workaround (Enable interrupt)
 402  0126 9a            rim
 406  0127               L122:
 407                     ; 154       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
 409  0127 c65217        	ld	a,21015
 410  012a a504          	bcp	a,#4
 411  012c 2605          	jrne	L522
 413  012e ce0000        	ldw	x,_TIM4_tout
 414  0131 26f4          	jrne	L122
 415  0133               L522:
 416                     ; 155       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 419  0133 9b            sim
 421                     ; 156       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
 424  0134 72125211      	bset	21009,#1
 425                     ; 157       *u8_DataBuffer++ = I2C->DR;                     	// Read 1st Data byte
 427  0138 1e05          	ldw	x,(OFST+5,sp)
 428  013a 1c0001        	addw	x,#1
 429  013d 1f05          	ldw	(OFST+5,sp),x
 430  013f 1d0001        	subw	x,#1
 431  0142 c65216        	ld	a,21014
 432  0145 f7            	ld	(x),a
 433                     ; 158       enableInterrupts();																// Errata workaround (Enable interrupt)
 436  0146 9a            rim
 438                     ; 159 			*u8_DataBuffer = I2C->DR;													// Read 2nd Data byte
 441  0147 1e05          	ldw	x,(OFST+5,sp)
 442  0149 c65216        	ld	a,21014
 443  014c f7            	ld	(x),a
 445  014d 201f          	jra	L342
 446  014f               L512:
 447                     ; 163       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
 449  014f 72155211      	bres	21009,#2
 450                     ; 164       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 454  0153 9b            sim
 456                     ; 165       I2C->SR3;                                       	// Clear ADDR Flag   
 459  0154 c65219        	ld	a,21017
 460                     ; 166       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
 462  0157 72125211      	bset	21009,#1
 463                     ; 167       enableInterrupts();																// Errata workaround (Enable interrupt)
 466  015b 9a            rim
 470  015c               L332:
 471                     ; 168       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
 473  015c c65217        	ld	a,21015
 474  015f a540          	bcp	a,#64
 475  0161 2605          	jrne	L732
 477  0163 ce0000        	ldw	x,_TIM4_tout
 478  0166 26f4          	jrne	L332
 479  0168               L732:
 480                     ; 169       *u8_DataBuffer = I2C->DR;                     		// Read Data byte
 482  0168 1e05          	ldw	x,(OFST+5,sp)
 483  016a c65216        	ld	a,21014
 484  016d f7            	ld	(x),a
 485  016e               L342:
 486                     ; 173   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
 488  016e c65211        	ld	a,21009
 489  0171 a502          	bcp	a,#2
 490  0173 2705          	jreq	L742
 492  0175 ce0000        	ldw	x,_TIM4_tout
 493  0178 26f4          	jrne	L342
 494  017a               L742:
 495                     ; 174   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
 497  017a 72175211      	bres	21009,#3
 498                     ; 175 }
 501  017e 85            	popw	x
 502  017f 81            	ret
 552                     ; 184 void I2C_WriteRegister(u8 u8_regAddr, u8 u8_NumByteToWrite, u8 *u8_DataBuffer)
 552                     ; 185 {
 553                     .text:	section	.text,new
 554  0000               _I2C_WriteRegister:
 556  0000 89            	pushw	x
 557       00000000      OFST:	set	0
 560  0001 2010          	jra	L572
 561  0003               L372:
 562                     ; 188     I2C->CR2 |= 2;                        								// STOP=1, generate stop
 564  0003 72125211      	bset	21009,#1
 566  0007               L303:
 567                     ; 189     while((I2C->CR2 & 2) && tout());      								// wait until stop is performed
 569  0007 c65211        	ld	a,21009
 570  000a a502          	bcp	a,#2
 571  000c 2705          	jreq	L572
 573  000e ce0000        	ldw	x,_TIM4_tout
 574  0011 26f4          	jrne	L303
 575  0013               L572:
 576                     ; 186   while((I2C->SR3 & 2) && tout())       									// Wait while the bus is busy
 578  0013 c65219        	ld	a,21017
 579  0016 a502          	bcp	a,#2
 580  0018 2705          	jreq	L113
 582  001a ce0000        	ldw	x,_TIM4_tout
 583  001d 26e4          	jrne	L372
 584  001f               L113:
 585                     ; 192   I2C->CR2 |= 1;                        									// START=1, generate start
 587  001f 72105211      	bset	21009,#0
 589  0023               L513:
 590                     ; 193   while(((I2C->SR1 & 1)==0) && tout()); 									// Wait for start bit detection (SB)
 592  0023 c65217        	ld	a,21015
 593  0026 a501          	bcp	a,#1
 594  0028 2605          	jrne	L123
 596  002a ce0000        	ldw	x,_TIM4_tout
 597  002d 26f4          	jrne	L513
 598  002f               L123:
 599                     ; 195   if(tout())
 602  002f ce0000        	ldw	x,_TIM4_tout
 603  0032 2704          	jreq	L723
 604                     ; 205       I2C->DR = (u8)(SLAVE_ADDRESS << 1);   							// Send 7-bit device address & Write (R/W = 0)
 606  0034 35905216      	mov	21014,#144
 607  0038               L723:
 608                     ; 208   while(!(I2C->SR1 & 2) && tout());     									// Wait for address ack (ADDR)
 610  0038 c65217        	ld	a,21015
 611  003b a502          	bcp	a,#2
 612  003d 2605          	jrne	L333
 614  003f ce0000        	ldw	x,_TIM4_tout
 615  0042 26f4          	jrne	L723
 616  0044               L333:
 617                     ; 210   I2C->SR3;
 620  0044 c65219        	ld	a,21017
 622  0047               L733:
 623                     ; 211   while(!(I2C->SR1 & 0x80) && tout());  									// Wait for TxE
 625  0047 c65217        	ld	a,21015
 626  004a a580          	bcp	a,#128
 627  004c 2605          	jrne	L343
 629  004e ce0000        	ldw	x,_TIM4_tout
 630  0051 26f4          	jrne	L733
 631  0053               L343:
 632                     ; 212   if(tout())
 634  0053 ce0000        	ldw	x,_TIM4_tout
 635  0056 2705          	jreq	L543
 636                     ; 214     I2C->DR = u8_regAddr;                 								// send Offset command
 638  0058 7b01          	ld	a,(OFST+1,sp)
 639  005a c75216        	ld	21014,a
 640  005d               L543:
 641                     ; 216   if(u8_NumByteToWrite)
 643  005d 0d02          	tnz	(OFST+2,sp)
 644  005f 2723          	jreq	L173
 646  0061 201a          	jra	L353
 647  0063               L163:
 648                     ; 220       while(!(I2C->SR1 & 0x80) && tout());  								// test EV8 - wait for TxE
 650  0063 c65217        	ld	a,21015
 651  0066 a580          	bcp	a,#128
 652  0068 2605          	jrne	L563
 654  006a ce0000        	ldw	x,_TIM4_tout
 655  006d 26f4          	jrne	L163
 656  006f               L563:
 657                     ; 221       I2C->DR = *u8_DataBuffer++;           								// send next data byte
 659  006f 1e05          	ldw	x,(OFST+5,sp)
 660  0071 1c0001        	addw	x,#1
 661  0074 1f05          	ldw	(OFST+5,sp),x
 662  0076 1d0001        	subw	x,#1
 663  0079 f6            	ld	a,(x)
 664  007a c75216        	ld	21014,a
 665  007d               L353:
 666                     ; 218     while(u8_NumByteToWrite--)          									
 668  007d 7b02          	ld	a,(OFST+2,sp)
 669  007f 0a02          	dec	(OFST+2,sp)
 670  0081 4d            	tnz	a
 671  0082 26df          	jrne	L163
 672  0084               L173:
 673                     ; 224   while(((I2C->SR1 & 0x84) != 0x84) && tout()); 					// Wait for TxE & BTF
 675  0084 c65217        	ld	a,21015
 676  0087 a484          	and	a,#132
 677  0089 a184          	cp	a,#132
 678  008b 2705          	jreq	L573
 680  008d ce0000        	ldw	x,_TIM4_tout
 681  0090 26f2          	jrne	L173
 682  0092               L573:
 683                     ; 227   I2C->CR2 |= 2;                        									// generate stop here (STOP=1)
 686  0092 72125211      	bset	21009,#1
 688  0096               L104:
 689                     ; 228   while((I2C->CR2 & 2) && tout());      									// wait until stop is performed  
 691  0096 c65211        	ld	a,21009
 692  0099 a502          	bcp	a,#2
 693  009b 2705          	jreq	L504
 695  009d ce0000        	ldw	x,_TIM4_tout
 696  00a0 26f4          	jrne	L104
 697  00a2               L504:
 698                     ; 229 }
 701  00a2 85            	popw	x
 702  00a3 81            	ret
 726                     ; 238 void ErrProc(void)
 726                     ; 239 {
 727                     .text:	section	.text,new
 728  0000               _ErrProc:
 732                     ; 241     I2C->SR2= 0;
 734  0000 725f5218      	clr	21016
 735                     ; 243 	  I2C->CR2 |= 2;  
 737  0004 72125211      	bset	21009,#1
 738                     ; 245     TIM4_tout= 0;
 740  0008 5f            	clrw	x
 741  0009 cf0000        	ldw	_TIM4_tout,x
 742                     ; 246 }
 745  000c 81            	ret
 768                     ; 255 void TIM4_Init (void) 
 768                     ; 256 {
 769                     .text:	section	.text,new
 770  0000               _TIM4_Init:
 774                     ; 257   TIM4->ARR = 0x80;                // init timer 4 1ms inetrrupts
 776  0000 35805348      	mov	21320,#128
 777                     ; 258   TIM4->PSCR= 7;
 779  0004 35075347      	mov	21319,#7
 780                     ; 259   TIM4->IER = 1;
 782  0008 35015343      	mov	21315,#1
 783                     ; 260   TIM4->CR1 |= 1;
 785  000c 72105340      	bset	21312,#0
 786                     ; 261 }
 789  0010 81            	ret
 802                     	xref	_TIM4_tout
 803                     	xdef	_ErrProc
 804                     	xdef	_I2C_WriteRegister
 805                     	xdef	_I2C_ReadRegister
 806                     	xdef	_TIM4_Init
 807                     	xdef	_I2C_Master_Init
 826                     	end
