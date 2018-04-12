   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  45                     ; 30 void I2C_Master_Init(void) {
  47                     .text:	section	.text,new
  48  0000               _I2C_Master_Init:
  52                     ; 31   GPIOE->ODR |= 6;                //define SDA, SCL outputs, HiZ, Open drain, Fast
  54  0000 c65014        	ld	a,20500
  55  0003 aa06          	or	a,#6
  56  0005 c75014        	ld	20500,a
  57                     ; 32   GPIOE->DDR |= 6;
  59  0008 c65016        	ld	a,20502
  60  000b aa06          	or	a,#6
  61  000d c75016        	ld	20502,a
  62                     ; 33   GPIOE->CR2 |= 6;
  64  0010 c65018        	ld	a,20504
  65  0013 aa06          	or	a,#6
  66  0015 c75018        	ld	20504,a
  67                     ; 41   I2C->FREQR = 8;                // input clock to I2C - 8MHz
  69  0018 35085212      	mov	21010,#8
  70                     ; 42   I2C->CCRL = 40;                // CCR= 40 - (SCLhi must be at least 4000+1000=5000ns!)
  72  001c 3528521b      	mov	21019,#40
  73                     ; 43   I2C->CCRH = 0;                 // standard mode, duty 1/1 bus speed 100kHz
  75  0020 725f521c      	clr	21020
  76                     ; 44   I2C->TRISER = 9;               // 1000ns/(125ns) + 1  (maximum 1000ns)
  78  0024 3509521d      	mov	21021,#9
  79                     ; 46   I2C->OARL = 0xA0;              // own address A0;
  81  0028 35a05213      	mov	21011,#160
  82                     ; 47   I2C->OARH |= 0x40;
  84  002c 721c5214      	bset	21012,#6
  85                     ; 48   I2C->ITR = 1;                  // enable error interrupts
  87  0030 3501521a      	mov	21018,#1
  88                     ; 49   I2C->CR2 |= 0x04;              // ACK=1, Ack enable
  90  0034 72145211      	bset	21009,#2
  91                     ; 50   I2C->CR1 |= 0x01;              // PE=1
  93  0038 72105210      	bset	21008,#0
  94                     ; 51 }
  97  003c 81            	ret
 155                     ; 60 void I2C_ReadRegister(u8 u8_regAddr, u8 u8_NumByteToRead, u8 *u8_DataBuffer)
 155                     ; 61 {
 156                     .text:	section	.text,new
 157  0000               _I2C_ReadRegister:
 159  0000 89            	pushw	x
 160       00000000      OFST:	set	0
 163  0001 2010          	jra	L54
 164  0003               L34:
 165                     ; 65 		I2C->CR2 |= I2C_CR2_STOP;                   				// Generate stop here (STOP=1)
 167  0003 72125211      	bset	21009,#1
 169  0007               L35:
 170                     ; 66     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// Wait until stop is performed
 172  0007 c65211        	ld	a,21009
 173  000a a502          	bcp	a,#2
 174  000c 2705          	jreq	L54
 176  000e ce0000        	ldw	x,_TIM4_tout
 177  0011 26f4          	jrne	L35
 178  0013               L54:
 179                     ; 63 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 181  0013 c65219        	ld	a,21017
 182  0016 a502          	bcp	a,#2
 183  0018 2705          	jreq	L16
 185  001a ce0000        	ldw	x,_TIM4_tout
 186  001d 26e4          	jrne	L34
 187  001f               L16:
 188                     ; 68   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 190  001f 72145211      	bset	21009,#2
 191                     ; 70   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 193  0023 72105211      	bset	21009,#0
 195  0027               L56:
 196                     ; 71   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// Wait for start bit detection (SB)
 198  0027 c65217        	ld	a,21015
 199  002a a501          	bcp	a,#1
 200  002c 2605          	jrne	L17
 202  002e ce0000        	ldw	x,_TIM4_tout
 203  0031 26f4          	jrne	L56
 204  0033               L17:
 205                     ; 73   if(tout())
 207  0033 ce0000        	ldw	x,_TIM4_tout
 208  0036 2704          	jreq	L77
 209                     ; 83       I2C->DR = (u8)(SLAVE_ADDRESS << 1);   						// Send 7-bit device address & Write (R/W = 0)
 211  0038 35905216      	mov	21014,#144
 212  003c               L77:
 213                     ; 86   while(!(I2C->SR1 & I2C_SR1_ADDR) &&  tout()); 				// test EV6 - wait for address ack (ADDR)
 215  003c c65217        	ld	a,21015
 216  003f a502          	bcp	a,#2
 217  0041 2605          	jrne	L301
 219  0043 ce0000        	ldw	x,_TIM4_tout
 220  0046 26f4          	jrne	L77
 221  0048               L301:
 222                     ; 88   I2C->SR3;
 225  0048 c65219        	ld	a,21017
 227  004b               L701:
 228                     ; 90   while(!(I2C->SR1 & I2C_SR1_TXE) &&  tout());  				// Wait for TxE
 230  004b c65217        	ld	a,21015
 231  004e a580          	bcp	a,#128
 232  0050 2605          	jrne	L311
 234  0052 ce0000        	ldw	x,_TIM4_tout
 235  0055 26f4          	jrne	L701
 236  0057               L311:
 237                     ; 91   if(tout())
 239  0057 ce0000        	ldw	x,_TIM4_tout
 240  005a 2705          	jreq	L121
 241                     ; 93     I2C->DR = u8_regAddr;                         			// Send register address
 243  005c 7b01          	ld	a,(OFST+1,sp)
 244  005e c75216        	ld	21014,a
 245  0061               L121:
 246                     ; 95   while((I2C->SR1 & (I2C_SR1_TXE | I2C_SR1_BTF)) != (I2C_SR1_TXE | I2C_SR1_BTF)  &&  tout()); 
 248  0061 c65217        	ld	a,21015
 249  0064 a484          	and	a,#132
 250  0066 a184          	cp	a,#132
 251  0068 2705          	jreq	L521
 253  006a ce0000        	ldw	x,_TIM4_tout
 254  006d 26f2          	jrne	L121
 255  006f               L521:
 256                     ; 105   I2C->CR2 |= I2C_CR2_START;                     				// START=1, generate re-start
 259  006f 72105211      	bset	21009,#0
 261  0073               L131:
 262                     ; 106   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout()); 				// Wait for start bit detection (SB)
 264  0073 c65217        	ld	a,21015
 265  0076 a501          	bcp	a,#1
 266  0078 2605          	jrne	L531
 268  007a ce0000        	ldw	x,_TIM4_tout
 269  007d 26f4          	jrne	L131
 270  007f               L531:
 271                     ; 108   if(tout())
 273  007f ce0000        	ldw	x,_TIM4_tout
 274  0082 2704          	jreq	L341
 275                     ; 120       I2C->DR = (u8)(SLAVE_ADDRESS << 1) | 1;         	// Send 7-bit device address & Write (R/W = 1)
 277  0084 35915216      	mov	21014,#145
 278  0088               L341:
 279                     ; 123   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());  			// Wait for address ack (ADDR)
 281  0088 c65217        	ld	a,21015
 282  008b a502          	bcp	a,#2
 283  008d 2605          	jrne	L741
 285  008f ce0000        	ldw	x,_TIM4_tout
 286  0092 26f4          	jrne	L341
 287  0094               L741:
 288                     ; 125   if (u8_NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
 290  0094 7b02          	ld	a,(OFST+2,sp)
 291  0096 a103          	cp	a,#3
 292  0098 257a          	jrult	L151
 293                     ; 127     I2C->SR3;                                     			// ADDR clearing sequence    
 295  009a c65219        	ld	a,21017
 297  009d 201c          	jra	L551
 298  009f               L361:
 299                     ; 130       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
 301  009f c65217        	ld	a,21015
 302  00a2 a504          	bcp	a,#4
 303  00a4 2605          	jrne	L761
 305  00a6 ce0000        	ldw	x,_TIM4_tout
 306  00a9 26f4          	jrne	L361
 307  00ab               L761:
 308                     ; 131 			*u8_DataBuffer++ = I2C->DR;                   				// Reading next data byte
 310  00ab 1e05          	ldw	x,(OFST+5,sp)
 311  00ad 1c0001        	addw	x,#1
 312  00b0 1f05          	ldw	(OFST+5,sp),x
 313  00b2 1d0001        	subw	x,#1
 314  00b5 c65216        	ld	a,21014
 315  00b8 f7            	ld	(x),a
 316                     ; 132       --u8_NumByteToRead;																		// Decrease Numbyte to reade by 1
 318  00b9 0a02          	dec	(OFST+2,sp)
 319  00bb               L551:
 320                     ; 128     while(u8_NumByteToRead > 3  &&  tout())       			// not last three bytes?
 322  00bb 7b02          	ld	a,(OFST+2,sp)
 323  00bd a104          	cp	a,#4
 324  00bf 2505          	jrult	L571
 326  00c1 ce0000        	ldw	x,_TIM4_tout
 327  00c4 26d9          	jrne	L361
 328  00c6               L571:
 329                     ; 135     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
 331  00c6 c65217        	ld	a,21015
 332  00c9 a504          	bcp	a,#4
 333  00cb 2605          	jrne	L102
 335  00cd ce0000        	ldw	x,_TIM4_tout
 336  00d0 26f4          	jrne	L571
 337  00d2               L102:
 338                     ; 136     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
 340  00d2 72155211      	bres	21009,#2
 341                     ; 137     disableInterrupts();                          			// Errata workaround (Disable interrupt)
 344  00d6 9b            sim
 346                     ; 138     *u8_DataBuffer++ = I2C->DR;                     		// Read 1st byte
 349  00d7 1e05          	ldw	x,(OFST+5,sp)
 350  00d9 1c0001        	addw	x,#1
 351  00dc 1f05          	ldw	(OFST+5,sp),x
 352  00de 1d0001        	subw	x,#1
 353  00e1 c65216        	ld	a,21014
 354  00e4 f7            	ld	(x),a
 355                     ; 139     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
 357  00e5 72125211      	bset	21009,#1
 358                     ; 140     *u8_DataBuffer++ = I2C->DR;                     		// Read 2nd byte
 360  00e9 1e05          	ldw	x,(OFST+5,sp)
 361  00eb 1c0001        	addw	x,#1
 362  00ee 1f05          	ldw	(OFST+5,sp),x
 363  00f0 1d0001        	subw	x,#1
 364  00f3 c65216        	ld	a,21014
 365  00f6 f7            	ld	(x),a
 366                     ; 141     enableInterrupts();																	// Errata workaround (Enable interrupt)
 369  00f7 9a            rim
 373  00f8               L502:
 374                     ; 142     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
 376  00f8 c65217        	ld	a,21015
 377  00fb a540          	bcp	a,#64
 378  00fd 2605          	jrne	L112
 380  00ff ce0000        	ldw	x,_TIM4_tout
 381  0102 26f4          	jrne	L502
 382  0104               L112:
 383                     ; 143     *u8_DataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
 385  0104 1e05          	ldw	x,(OFST+5,sp)
 386  0106 1c0001        	addw	x,#1
 387  0109 1f05          	ldw	(OFST+5,sp),x
 388  010b 1d0001        	subw	x,#1
 389  010e c65216        	ld	a,21014
 390  0111 f7            	ld	(x),a
 392  0112 205a          	jra	L342
 393  0114               L151:
 394                     ; 147    if(u8_NumByteToRead == 2)                						// *** just two bytes are received? ***
 396  0114 7b02          	ld	a,(OFST+2,sp)
 397  0116 a102          	cp	a,#2
 398  0118 2635          	jrne	L512
 399                     ; 149       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
 401  011a 72165211      	bset	21009,#3
 402                     ; 150       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 405  011e 9b            sim
 407                     ; 151       I2C->SR3;                                       	// Clear ADDR Flag
 410  011f c65219        	ld	a,21017
 411                     ; 152       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
 413  0122 72155211      	bres	21009,#2
 414                     ; 153       enableInterrupts();																// Errata workaround (Enable interrupt)
 417  0126 9a            rim
 421  0127               L122:
 422                     ; 154       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
 424  0127 c65217        	ld	a,21015
 425  012a a504          	bcp	a,#4
 426  012c 2605          	jrne	L522
 428  012e ce0000        	ldw	x,_TIM4_tout
 429  0131 26f4          	jrne	L122
 430  0133               L522:
 431                     ; 155       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 434  0133 9b            sim
 436                     ; 156       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
 439  0134 72125211      	bset	21009,#1
 440                     ; 157       *u8_DataBuffer++ = I2C->DR;                     	// Read 1st Data byte
 442  0138 1e05          	ldw	x,(OFST+5,sp)
 443  013a 1c0001        	addw	x,#1
 444  013d 1f05          	ldw	(OFST+5,sp),x
 445  013f 1d0001        	subw	x,#1
 446  0142 c65216        	ld	a,21014
 447  0145 f7            	ld	(x),a
 448                     ; 158       enableInterrupts();																// Errata workaround (Enable interrupt)
 451  0146 9a            rim
 453                     ; 159 			*u8_DataBuffer = I2C->DR;													// Read 2nd Data byte
 456  0147 1e05          	ldw	x,(OFST+5,sp)
 457  0149 c65216        	ld	a,21014
 458  014c f7            	ld	(x),a
 460  014d 201f          	jra	L342
 461  014f               L512:
 462                     ; 163       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
 464  014f 72155211      	bres	21009,#2
 465                     ; 164       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 469  0153 9b            sim
 471                     ; 165       I2C->SR3;                                       	// Clear ADDR Flag   
 474  0154 c65219        	ld	a,21017
 475                     ; 166       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
 477  0157 72125211      	bset	21009,#1
 478                     ; 167       enableInterrupts();																// Errata workaround (Enable interrupt)
 481  015b 9a            rim
 485  015c               L332:
 486                     ; 168       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
 488  015c c65217        	ld	a,21015
 489  015f a540          	bcp	a,#64
 490  0161 2605          	jrne	L732
 492  0163 ce0000        	ldw	x,_TIM4_tout
 493  0166 26f4          	jrne	L332
 494  0168               L732:
 495                     ; 169       *u8_DataBuffer = I2C->DR;                     		// Read Data byte
 497  0168 1e05          	ldw	x,(OFST+5,sp)
 498  016a c65216        	ld	a,21014
 499  016d f7            	ld	(x),a
 500  016e               L342:
 501                     ; 173   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
 503  016e c65211        	ld	a,21009
 504  0171 a502          	bcp	a,#2
 505  0173 2705          	jreq	L742
 507  0175 ce0000        	ldw	x,_TIM4_tout
 508  0178 26f4          	jrne	L342
 509  017a               L742:
 510                     ; 174   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
 512  017a 72175211      	bres	21009,#3
 513                     ; 175 }
 516  017e 85            	popw	x
 517  017f 81            	ret
 567                     ; 184 void I2C_WriteRegister(u8 u8_regAddr, u8 u8_NumByteToWrite, u8 *u8_DataBuffer)
 567                     ; 185 {
 568                     .text:	section	.text,new
 569  0000               _I2C_WriteRegister:
 571  0000 89            	pushw	x
 572       00000000      OFST:	set	0
 575  0001 2010          	jra	L572
 576  0003               L372:
 577                     ; 188     I2C->CR2 |= 2;                        								// STOP=1, generate stop
 579  0003 72125211      	bset	21009,#1
 581  0007               L303:
 582                     ; 189     while((I2C->CR2 & 2) && tout());      								// wait until stop is performed
 584  0007 c65211        	ld	a,21009
 585  000a a502          	bcp	a,#2
 586  000c 2705          	jreq	L572
 588  000e ce0000        	ldw	x,_TIM4_tout
 589  0011 26f4          	jrne	L303
 590  0013               L572:
 591                     ; 186   while((I2C->SR3 & 2) && tout())       									// Wait while the bus is busy
 593  0013 c65219        	ld	a,21017
 594  0016 a502          	bcp	a,#2
 595  0018 2705          	jreq	L113
 597  001a ce0000        	ldw	x,_TIM4_tout
 598  001d 26e4          	jrne	L372
 599  001f               L113:
 600                     ; 192   I2C->CR2 |= 1;                        									// START=1, generate start
 602  001f 72105211      	bset	21009,#0
 604  0023               L513:
 605                     ; 193   while(((I2C->SR1 & 1)==0) && tout()); 									// Wait for start bit detection (SB)
 607  0023 c65217        	ld	a,21015
 608  0026 a501          	bcp	a,#1
 609  0028 2605          	jrne	L123
 611  002a ce0000        	ldw	x,_TIM4_tout
 612  002d 26f4          	jrne	L513
 613  002f               L123:
 614                     ; 195   if(tout())
 617  002f ce0000        	ldw	x,_TIM4_tout
 618  0032 2704          	jreq	L723
 619                     ; 205       I2C->DR = (u8)(SLAVE_ADDRESS << 1);   							// Send 7-bit device address & Write (R/W = 0)
 621  0034 35905216      	mov	21014,#144
 622  0038               L723:
 623                     ; 208   while(!(I2C->SR1 & 2) && tout());     									// Wait for address ack (ADDR)
 625  0038 c65217        	ld	a,21015
 626  003b a502          	bcp	a,#2
 627  003d 2605          	jrne	L333
 629  003f ce0000        	ldw	x,_TIM4_tout
 630  0042 26f4          	jrne	L723
 631  0044               L333:
 632                     ; 210   I2C->SR3;
 635  0044 c65219        	ld	a,21017
 637  0047               L733:
 638                     ; 211   while(!(I2C->SR1 & 0x80) && tout());  									// Wait for TxE
 640  0047 c65217        	ld	a,21015
 641  004a a580          	bcp	a,#128
 642  004c 2605          	jrne	L343
 644  004e ce0000        	ldw	x,_TIM4_tout
 645  0051 26f4          	jrne	L733
 646  0053               L343:
 647                     ; 212   if(tout())
 649  0053 ce0000        	ldw	x,_TIM4_tout
 650  0056 2705          	jreq	L543
 651                     ; 214     I2C->DR = u8_regAddr;                 								// send Offset command
 653  0058 7b01          	ld	a,(OFST+1,sp)
 654  005a c75216        	ld	21014,a
 655  005d               L543:
 656                     ; 216   if(u8_NumByteToWrite)
 658  005d 0d02          	tnz	(OFST+2,sp)
 659  005f 2723          	jreq	L173
 661  0061 201a          	jra	L353
 662  0063               L163:
 663                     ; 220       while(!(I2C->SR1 & 0x80) && tout());  								// test EV8 - wait for TxE
 665  0063 c65217        	ld	a,21015
 666  0066 a580          	bcp	a,#128
 667  0068 2605          	jrne	L563
 669  006a ce0000        	ldw	x,_TIM4_tout
 670  006d 26f4          	jrne	L163
 671  006f               L563:
 672                     ; 221       I2C->DR = *u8_DataBuffer++;           								// send next data byte
 674  006f 1e05          	ldw	x,(OFST+5,sp)
 675  0071 1c0001        	addw	x,#1
 676  0074 1f05          	ldw	(OFST+5,sp),x
 677  0076 1d0001        	subw	x,#1
 678  0079 f6            	ld	a,(x)
 679  007a c75216        	ld	21014,a
 680  007d               L353:
 681                     ; 218     while(u8_NumByteToWrite--)          									
 683  007d 7b02          	ld	a,(OFST+2,sp)
 684  007f 0a02          	dec	(OFST+2,sp)
 685  0081 4d            	tnz	a
 686  0082 26df          	jrne	L163
 687  0084               L173:
 688                     ; 224   while(((I2C->SR1 & 0x84) != 0x84) && tout()); 					// Wait for TxE & BTF
 690  0084 c65217        	ld	a,21015
 691  0087 a484          	and	a,#132
 692  0089 a184          	cp	a,#132
 693  008b 2705          	jreq	L573
 695  008d ce0000        	ldw	x,_TIM4_tout
 696  0090 26f2          	jrne	L173
 697  0092               L573:
 698                     ; 227   I2C->CR2 |= 2;                        									// generate stop here (STOP=1)
 701  0092 72125211      	bset	21009,#1
 703  0096               L104:
 704                     ; 228   while((I2C->CR2 & 2) && tout());      									// wait until stop is performed  
 706  0096 c65211        	ld	a,21009
 707  0099 a502          	bcp	a,#2
 708  009b 2705          	jreq	L504
 710  009d ce0000        	ldw	x,_TIM4_tout
 711  00a0 26f4          	jrne	L104
 712  00a2               L504:
 713                     ; 229 }
 716  00a2 85            	popw	x
 717  00a3 81            	ret
 741                     ; 238 void ErrProc(void)
 741                     ; 239 {
 742                     .text:	section	.text,new
 743  0000               _ErrProc:
 747                     ; 241     I2C->SR2= 0;
 749  0000 725f5218      	clr	21016
 750                     ; 243 	  I2C->CR2 |= 2;  
 752  0004 72125211      	bset	21009,#1
 753                     ; 245     TIM4_tout= 0;
 755  0008 5f            	clrw	x
 756  0009 cf0000        	ldw	_TIM4_tout,x
 757                     ; 246 }
 760  000c 81            	ret
 783                     ; 255 void TIM4_Init (void) 
 783                     ; 256 {
 784                     .text:	section	.text,new
 785  0000               _TIM4_Init:
 789                     ; 257   TIM4->ARR = 0x80;                // init timer 4 1ms inetrrupts
 791  0000 35805348      	mov	21320,#128
 792                     ; 258   TIM4->PSCR= 7;
 794  0004 35075347      	mov	21319,#7
 795                     ; 259   TIM4->IER = 1;
 797  0008 35015343      	mov	21315,#1
 798                     ; 260   TIM4->CR1 |= 1;
 800  000c 72105340      	bset	21312,#0
 801                     ; 261 }
 804  0010 81            	ret
 817                     	xref	_TIM4_tout
 818                     	xdef	_ErrProc
 819                     	xdef	_I2C_WriteRegister
 820                     	xdef	_I2C_ReadRegister
 821                     	xdef	_TIM4_Init
 822                     	xdef	_I2C_Master_Init
 841                     	end
