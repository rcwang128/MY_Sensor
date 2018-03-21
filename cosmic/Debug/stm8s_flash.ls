   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  78                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  78                     ; 88 {
  80                     .text:	section	.text,new
  81  0000               _FLASH_Unlock:
  83  0000 88            	push	a
  84       00000000      OFST:	set	0
  87                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  89  0001 a1fd          	cp	a,#253
  90  0003 2704          	jreq	L01
  91  0005 a1f7          	cp	a,#247
  92  0007 2603          	jrne	L6
  93  0009               L01:
  94  0009 4f            	clr	a
  95  000a 2010          	jra	L21
  96  000c               L6:
  97  000c ae005a        	ldw	x,#90
  98  000f 89            	pushw	x
  99  0010 ae0000        	ldw	x,#0
 100  0013 89            	pushw	x
 101  0014 ae0010        	ldw	x,#L73
 102  0017 cd0000        	call	_assert_failed
 104  001a 5b04          	addw	sp,#4
 105  001c               L21:
 106                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 108  001c 7b01          	ld	a,(OFST+1,sp)
 109  001e a1fd          	cp	a,#253
 110  0020 260a          	jrne	L14
 111                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 113  0022 35565062      	mov	20578,#86
 114                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 116  0026 35ae5062      	mov	20578,#174
 118  002a 2008          	jra	L34
 119  002c               L14:
 120                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 122  002c 35ae5064      	mov	20580,#174
 123                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 125  0030 35565064      	mov	20580,#86
 126  0034               L34:
 127                     ; 104 }
 130  0034 84            	pop	a
 131  0035 81            	ret
 167                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 167                     ; 113 {
 168                     .text:	section	.text,new
 169  0000               _FLASH_Lock:
 171  0000 88            	push	a
 172       00000000      OFST:	set	0
 175                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 177  0001 a1fd          	cp	a,#253
 178  0003 2704          	jreq	L02
 179  0005 a1f7          	cp	a,#247
 180  0007 2603          	jrne	L61
 181  0009               L02:
 182  0009 4f            	clr	a
 183  000a 2010          	jra	L22
 184  000c               L61:
 185  000c ae0073        	ldw	x,#115
 186  000f 89            	pushw	x
 187  0010 ae0000        	ldw	x,#0
 188  0013 89            	pushw	x
 189  0014 ae0010        	ldw	x,#L73
 190  0017 cd0000        	call	_assert_failed
 192  001a 5b04          	addw	sp,#4
 193  001c               L22:
 194                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 196  001c c6505f        	ld	a,20575
 197  001f 1401          	and	a,(OFST+1,sp)
 198  0021 c7505f        	ld	20575,a
 199                     ; 119 }
 202  0024 84            	pop	a
 203  0025 81            	ret
 226                     ; 126 void FLASH_DeInit(void)
 226                     ; 127 {
 227                     .text:	section	.text,new
 228  0000               _FLASH_DeInit:
 232                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 234  0000 725f505a      	clr	20570
 235                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 237  0004 725f505b      	clr	20571
 238                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 240  0008 35ff505c      	mov	20572,#255
 241                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 243  000c 7217505f      	bres	20575,#3
 244                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 246  0010 7213505f      	bres	20575,#1
 247                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 249  0014 c6505f        	ld	a,20575
 250                     ; 134 }
 253  0017 81            	ret
 309                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 309                     ; 143 {
 310                     .text:	section	.text,new
 311  0000               _FLASH_ITConfig:
 313  0000 88            	push	a
 314       00000000      OFST:	set	0
 317                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 319  0001 4d            	tnz	a
 320  0002 2704          	jreq	L23
 321  0004 a101          	cp	a,#1
 322  0006 2603          	jrne	L03
 323  0008               L23:
 324  0008 4f            	clr	a
 325  0009 2010          	jra	L43
 326  000b               L03:
 327  000b ae0091        	ldw	x,#145
 328  000e 89            	pushw	x
 329  000f ae0000        	ldw	x,#0
 330  0012 89            	pushw	x
 331  0013 ae0010        	ldw	x,#L73
 332  0016 cd0000        	call	_assert_failed
 334  0019 5b04          	addw	sp,#4
 335  001b               L43:
 336                     ; 147   if(NewState != DISABLE)
 338  001b 0d01          	tnz	(OFST+1,sp)
 339  001d 2706          	jreq	L121
 340                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 342  001f 7212505a      	bset	20570,#1
 344  0023 2004          	jra	L321
 345  0025               L121:
 346                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 348  0025 7213505a      	bres	20570,#1
 349  0029               L321:
 350                     ; 155 }
 353  0029 84            	pop	a
 354  002a 81            	ret
 387                     .const:	section	.text
 388  0000               L64:
 389  0000 00008000      	dc.l	32768
 390  0004               L05:
 391  0004 0000a000      	dc.l	40960
 392  0008               L25:
 393  0008 00004000      	dc.l	16384
 394  000c               L45:
 395  000c 00004280      	dc.l	17024
 396                     ; 164 void FLASH_EraseByte(uint32_t Address)
 396                     ; 165 {
 397                     .text:	section	.text,new
 398  0000               _FLASH_EraseByte:
 400       00000000      OFST:	set	0
 403                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 405  0000 96            	ldw	x,sp
 406  0001 1c0003        	addw	x,#OFST+3
 407  0004 cd0000        	call	c_ltor
 409  0007 ae0000        	ldw	x,#L64
 410  000a cd0000        	call	c_lcmp
 412  000d 250f          	jrult	L44
 413  000f 96            	ldw	x,sp
 414  0010 1c0003        	addw	x,#OFST+3
 415  0013 cd0000        	call	c_ltor
 417  0016 ae0004        	ldw	x,#L05
 418  0019 cd0000        	call	c_lcmp
 420  001c 251e          	jrult	L24
 421  001e               L44:
 422  001e 96            	ldw	x,sp
 423  001f 1c0003        	addw	x,#OFST+3
 424  0022 cd0000        	call	c_ltor
 426  0025 ae0008        	ldw	x,#L25
 427  0028 cd0000        	call	c_lcmp
 429  002b 2512          	jrult	L04
 430  002d 96            	ldw	x,sp
 431  002e 1c0003        	addw	x,#OFST+3
 432  0031 cd0000        	call	c_ltor
 434  0034 ae000c        	ldw	x,#L45
 435  0037 cd0000        	call	c_lcmp
 437  003a 2403          	jruge	L04
 438  003c               L24:
 439  003c 4f            	clr	a
 440  003d 2010          	jra	L65
 441  003f               L04:
 442  003f ae00a7        	ldw	x,#167
 443  0042 89            	pushw	x
 444  0043 ae0000        	ldw	x,#0
 445  0046 89            	pushw	x
 446  0047 ae0010        	ldw	x,#L73
 447  004a cd0000        	call	_assert_failed
 449  004d 5b04          	addw	sp,#4
 450  004f               L65:
 451                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 453  004f 1e05          	ldw	x,(OFST+5,sp)
 454  0051 7f            	clr	(x)
 455                     ; 171 }
 458  0052 81            	ret
 498                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 498                     ; 182 {
 499                     .text:	section	.text,new
 500  0000               _FLASH_ProgramByte:
 502       00000000      OFST:	set	0
 505                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 507  0000 96            	ldw	x,sp
 508  0001 1c0003        	addw	x,#OFST+3
 509  0004 cd0000        	call	c_ltor
 511  0007 ae0000        	ldw	x,#L64
 512  000a cd0000        	call	c_lcmp
 514  000d 250f          	jrult	L66
 515  000f 96            	ldw	x,sp
 516  0010 1c0003        	addw	x,#OFST+3
 517  0013 cd0000        	call	c_ltor
 519  0016 ae0004        	ldw	x,#L05
 520  0019 cd0000        	call	c_lcmp
 522  001c 251e          	jrult	L46
 523  001e               L66:
 524  001e 96            	ldw	x,sp
 525  001f 1c0003        	addw	x,#OFST+3
 526  0022 cd0000        	call	c_ltor
 528  0025 ae0008        	ldw	x,#L25
 529  0028 cd0000        	call	c_lcmp
 531  002b 2512          	jrult	L26
 532  002d 96            	ldw	x,sp
 533  002e 1c0003        	addw	x,#OFST+3
 534  0031 cd0000        	call	c_ltor
 536  0034 ae000c        	ldw	x,#L45
 537  0037 cd0000        	call	c_lcmp
 539  003a 2403          	jruge	L26
 540  003c               L46:
 541  003c 4f            	clr	a
 542  003d 2010          	jra	L07
 543  003f               L26:
 544  003f ae00b8        	ldw	x,#184
 545  0042 89            	pushw	x
 546  0043 ae0000        	ldw	x,#0
 547  0046 89            	pushw	x
 548  0047 ae0010        	ldw	x,#L73
 549  004a cd0000        	call	_assert_failed
 551  004d 5b04          	addw	sp,#4
 552  004f               L07:
 553                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 555  004f 7b07          	ld	a,(OFST+7,sp)
 556  0051 1e05          	ldw	x,(OFST+5,sp)
 557  0053 f7            	ld	(x),a
 558                     ; 186 }
 561  0054 81            	ret
 594                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 594                     ; 196 {
 595                     .text:	section	.text,new
 596  0000               _FLASH_ReadByte:
 598       00000000      OFST:	set	0
 601                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 603  0000 96            	ldw	x,sp
 604  0001 1c0003        	addw	x,#OFST+3
 605  0004 cd0000        	call	c_ltor
 607  0007 ae0000        	ldw	x,#L64
 608  000a cd0000        	call	c_lcmp
 610  000d 250f          	jrult	L001
 611  000f 96            	ldw	x,sp
 612  0010 1c0003        	addw	x,#OFST+3
 613  0013 cd0000        	call	c_ltor
 615  0016 ae0004        	ldw	x,#L05
 616  0019 cd0000        	call	c_lcmp
 618  001c 251e          	jrult	L67
 619  001e               L001:
 620  001e 96            	ldw	x,sp
 621  001f 1c0003        	addw	x,#OFST+3
 622  0022 cd0000        	call	c_ltor
 624  0025 ae0008        	ldw	x,#L25
 625  0028 cd0000        	call	c_lcmp
 627  002b 2512          	jrult	L47
 628  002d 96            	ldw	x,sp
 629  002e 1c0003        	addw	x,#OFST+3
 630  0031 cd0000        	call	c_ltor
 632  0034 ae000c        	ldw	x,#L45
 633  0037 cd0000        	call	c_lcmp
 635  003a 2403          	jruge	L47
 636  003c               L67:
 637  003c 4f            	clr	a
 638  003d 2010          	jra	L201
 639  003f               L47:
 640  003f ae00c6        	ldw	x,#198
 641  0042 89            	pushw	x
 642  0043 ae0000        	ldw	x,#0
 643  0046 89            	pushw	x
 644  0047 ae0010        	ldw	x,#L73
 645  004a cd0000        	call	_assert_failed
 647  004d 5b04          	addw	sp,#4
 648  004f               L201:
 649                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 651  004f 1e05          	ldw	x,(OFST+5,sp)
 652  0051 f6            	ld	a,(x)
 655  0052 81            	ret
 695                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 695                     ; 213 {
 696                     .text:	section	.text,new
 697  0000               _FLASH_ProgramWord:
 699       00000000      OFST:	set	0
 702                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 704  0000 96            	ldw	x,sp
 705  0001 1c0003        	addw	x,#OFST+3
 706  0004 cd0000        	call	c_ltor
 708  0007 ae0000        	ldw	x,#L64
 709  000a cd0000        	call	c_lcmp
 711  000d 250f          	jrult	L211
 712  000f 96            	ldw	x,sp
 713  0010 1c0003        	addw	x,#OFST+3
 714  0013 cd0000        	call	c_ltor
 716  0016 ae0004        	ldw	x,#L05
 717  0019 cd0000        	call	c_lcmp
 719  001c 251e          	jrult	L011
 720  001e               L211:
 721  001e 96            	ldw	x,sp
 722  001f 1c0003        	addw	x,#OFST+3
 723  0022 cd0000        	call	c_ltor
 725  0025 ae0008        	ldw	x,#L25
 726  0028 cd0000        	call	c_lcmp
 728  002b 2512          	jrult	L601
 729  002d 96            	ldw	x,sp
 730  002e 1c0003        	addw	x,#OFST+3
 731  0031 cd0000        	call	c_ltor
 733  0034 ae000c        	ldw	x,#L45
 734  0037 cd0000        	call	c_lcmp
 736  003a 2403          	jruge	L601
 737  003c               L011:
 738  003c 4f            	clr	a
 739  003d 2010          	jra	L411
 740  003f               L601:
 741  003f ae00d7        	ldw	x,#215
 742  0042 89            	pushw	x
 743  0043 ae0000        	ldw	x,#0
 744  0046 89            	pushw	x
 745  0047 ae0010        	ldw	x,#L73
 746  004a cd0000        	call	_assert_failed
 748  004d 5b04          	addw	sp,#4
 749  004f               L411:
 750                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 752  004f 721c505b      	bset	20571,#6
 753                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 755  0053 721d505c      	bres	20572,#6
 756                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 758  0057 7b07          	ld	a,(OFST+7,sp)
 759  0059 1e05          	ldw	x,(OFST+5,sp)
 760  005b f7            	ld	(x),a
 761                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 763  005c 7b08          	ld	a,(OFST+8,sp)
 764  005e 1e05          	ldw	x,(OFST+5,sp)
 765  0060 e701          	ld	(1,x),a
 766                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 768  0062 7b09          	ld	a,(OFST+9,sp)
 769  0064 1e05          	ldw	x,(OFST+5,sp)
 770  0066 e702          	ld	(2,x),a
 771                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 773  0068 7b0a          	ld	a,(OFST+10,sp)
 774  006a 1e05          	ldw	x,(OFST+5,sp)
 775  006c e703          	ld	(3,x),a
 776                     ; 229 }
 779  006e 81            	ret
 821                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 821                     ; 238 {
 822                     .text:	section	.text,new
 823  0000               _FLASH_ProgramOptionByte:
 825  0000 89            	pushw	x
 826       00000000      OFST:	set	0
 829                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 831  0001 a34800        	cpw	x,#18432
 832  0004 2508          	jrult	L021
 833  0006 a34880        	cpw	x,#18560
 834  0009 2403          	jruge	L021
 835  000b 4f            	clr	a
 836  000c 2010          	jra	L221
 837  000e               L021:
 838  000e ae00f0        	ldw	x,#240
 839  0011 89            	pushw	x
 840  0012 ae0000        	ldw	x,#0
 841  0015 89            	pushw	x
 842  0016 ae0010        	ldw	x,#L73
 843  0019 cd0000        	call	_assert_failed
 845  001c 5b04          	addw	sp,#4
 846  001e               L221:
 847                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 849  001e 721e505b      	bset	20571,#7
 850                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 852  0022 721f505c      	bres	20572,#7
 853                     ; 247   if(Address == 0x4800)
 855  0026 1e01          	ldw	x,(OFST+1,sp)
 856  0028 a34800        	cpw	x,#18432
 857  002b 2607          	jrne	L722
 858                     ; 250     *((NEAR uint8_t*)Address) = Data;
 860  002d 7b05          	ld	a,(OFST+5,sp)
 861  002f 1e01          	ldw	x,(OFST+1,sp)
 862  0031 f7            	ld	(x),a
 864  0032 200c          	jra	L132
 865  0034               L722:
 866                     ; 255     *((NEAR uint8_t*)Address) = Data;
 868  0034 7b05          	ld	a,(OFST+5,sp)
 869  0036 1e01          	ldw	x,(OFST+1,sp)
 870  0038 f7            	ld	(x),a
 871                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 873  0039 7b05          	ld	a,(OFST+5,sp)
 874  003b 43            	cpl	a
 875  003c 1e01          	ldw	x,(OFST+1,sp)
 876  003e e701          	ld	(1,x),a
 877  0040               L132:
 878                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 880  0040 a6fd          	ld	a,#253
 881  0042 cd0000        	call	_FLASH_WaitForLastOperation
 883                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 885  0045 721f505b      	bres	20571,#7
 886                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 888  0049 721e505c      	bset	20572,#7
 889                     ; 263 }
 892  004d 85            	popw	x
 893  004e 81            	ret
 928                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 928                     ; 271 {
 929                     .text:	section	.text,new
 930  0000               _FLASH_EraseOptionByte:
 932  0000 89            	pushw	x
 933       00000000      OFST:	set	0
 936                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 938  0001 a34800        	cpw	x,#18432
 939  0004 2508          	jrult	L621
 940  0006 a34880        	cpw	x,#18560
 941  0009 2403          	jruge	L621
 942  000b 4f            	clr	a
 943  000c 2010          	jra	L031
 944  000e               L621:
 945  000e ae0111        	ldw	x,#273
 946  0011 89            	pushw	x
 947  0012 ae0000        	ldw	x,#0
 948  0015 89            	pushw	x
 949  0016 ae0010        	ldw	x,#L73
 950  0019 cd0000        	call	_assert_failed
 952  001c 5b04          	addw	sp,#4
 953  001e               L031:
 954                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 956  001e 721e505b      	bset	20571,#7
 957                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 959  0022 721f505c      	bres	20572,#7
 960                     ; 280   if(Address == 0x4800)
 962  0026 1e01          	ldw	x,(OFST+1,sp)
 963  0028 a34800        	cpw	x,#18432
 964  002b 2605          	jrne	L742
 965                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 967  002d 1e01          	ldw	x,(OFST+1,sp)
 968  002f 7f            	clr	(x)
 970  0030 2009          	jra	L152
 971  0032               L742:
 972                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 974  0032 1e01          	ldw	x,(OFST+1,sp)
 975  0034 7f            	clr	(x)
 976                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 978  0035 1e01          	ldw	x,(OFST+1,sp)
 979  0037 a6ff          	ld	a,#255
 980  0039 e701          	ld	(1,x),a
 981  003b               L152:
 982                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 984  003b a6fd          	ld	a,#253
 985  003d cd0000        	call	_FLASH_WaitForLastOperation
 987                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 989  0040 721f505b      	bres	20571,#7
 990                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 992  0044 721e505c      	bset	20572,#7
 993                     ; 296 }
 996  0048 85            	popw	x
 997  0049 81            	ret
1053                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1053                     ; 304 {
1054                     .text:	section	.text,new
1055  0000               _FLASH_ReadOptionByte:
1057  0000 89            	pushw	x
1058  0001 5204          	subw	sp,#4
1059       00000004      OFST:	set	4
1062                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1064                     ; 306   uint16_t res_value = 0;
1066                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1068  0003 a34800        	cpw	x,#18432
1069  0006 2508          	jrult	L431
1070  0008 a34880        	cpw	x,#18560
1071  000b 2403          	jruge	L431
1072  000d 4f            	clr	a
1073  000e 2010          	jra	L631
1074  0010               L431:
1075  0010 ae0135        	ldw	x,#309
1076  0013 89            	pushw	x
1077  0014 ae0000        	ldw	x,#0
1078  0017 89            	pushw	x
1079  0018 ae0010        	ldw	x,#L73
1080  001b cd0000        	call	_assert_failed
1082  001e 5b04          	addw	sp,#4
1083  0020               L631:
1084                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1086  0020 1e05          	ldw	x,(OFST+1,sp)
1087  0022 f6            	ld	a,(x)
1088  0023 6b01          	ld	(OFST-3,sp),a
1090                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1092  0025 1e05          	ldw	x,(OFST+1,sp)
1093  0027 e601          	ld	a,(1,x)
1094  0029 6b02          	ld	(OFST-2,sp),a
1096                     ; 315   if(Address == 0x4800)	 
1098  002b 1e05          	ldw	x,(OFST+1,sp)
1099  002d a34800        	cpw	x,#18432
1100  0030 2608          	jrne	L572
1101                     ; 317     res_value =	 value_optbyte;
1103  0032 7b01          	ld	a,(OFST-3,sp)
1104  0034 5f            	clrw	x
1105  0035 97            	ld	xl,a
1106  0036 1f03          	ldw	(OFST-1,sp),x
1109  0038 2023          	jra	L772
1110  003a               L572:
1111                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1113  003a 7b02          	ld	a,(OFST-2,sp)
1114  003c 43            	cpl	a
1115  003d 1101          	cp	a,(OFST-3,sp)
1116  003f 2617          	jrne	L103
1117                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1119  0041 7b01          	ld	a,(OFST-3,sp)
1120  0043 5f            	clrw	x
1121  0044 97            	ld	xl,a
1122  0045 4f            	clr	a
1123  0046 02            	rlwa	x,a
1124  0047 1f03          	ldw	(OFST-1,sp),x
1126                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1128  0049 7b02          	ld	a,(OFST-2,sp)
1129  004b 5f            	clrw	x
1130  004c 97            	ld	xl,a
1131  004d 01            	rrwa	x,a
1132  004e 1a04          	or	a,(OFST+0,sp)
1133  0050 01            	rrwa	x,a
1134  0051 1a03          	or	a,(OFST-1,sp)
1135  0053 01            	rrwa	x,a
1136  0054 1f03          	ldw	(OFST-1,sp),x
1139  0056 2005          	jra	L772
1140  0058               L103:
1141                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1143  0058 ae5555        	ldw	x,#21845
1144  005b 1f03          	ldw	(OFST-1,sp),x
1146  005d               L772:
1147                     ; 331   return(res_value);
1149  005d 1e03          	ldw	x,(OFST-1,sp)
1152  005f 5b06          	addw	sp,#6
1153  0061 81            	ret
1228                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1228                     ; 341 {
1229                     .text:	section	.text,new
1230  0000               _FLASH_SetLowPowerMode:
1232  0000 88            	push	a
1233       00000000      OFST:	set	0
1236                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1238  0001 a104          	cp	a,#4
1239  0003 270b          	jreq	L441
1240  0005 a108          	cp	a,#8
1241  0007 2707          	jreq	L441
1242  0009 4d            	tnz	a
1243  000a 2704          	jreq	L441
1244  000c a10c          	cp	a,#12
1245  000e 2603          	jrne	L241
1246  0010               L441:
1247  0010 4f            	clr	a
1248  0011 2010          	jra	L641
1249  0013               L241:
1250  0013 ae0157        	ldw	x,#343
1251  0016 89            	pushw	x
1252  0017 ae0000        	ldw	x,#0
1253  001a 89            	pushw	x
1254  001b ae0010        	ldw	x,#L73
1255  001e cd0000        	call	_assert_failed
1257  0021 5b04          	addw	sp,#4
1258  0023               L641:
1259                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1261  0023 c6505a        	ld	a,20570
1262  0026 a4f3          	and	a,#243
1263  0028 c7505a        	ld	20570,a
1264                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1266  002b c6505a        	ld	a,20570
1267  002e 1a01          	or	a,(OFST+1,sp)
1268  0030 c7505a        	ld	20570,a
1269                     ; 350 }
1272  0033 84            	pop	a
1273  0034 81            	ret
1332                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1332                     ; 359 {
1333                     .text:	section	.text,new
1334  0000               _FLASH_SetProgrammingTime:
1336  0000 88            	push	a
1337       00000000      OFST:	set	0
1340                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1342  0001 4d            	tnz	a
1343  0002 2704          	jreq	L451
1344  0004 a101          	cp	a,#1
1345  0006 2603          	jrne	L251
1346  0008               L451:
1347  0008 4f            	clr	a
1348  0009 2010          	jra	L651
1349  000b               L251:
1350  000b ae0169        	ldw	x,#361
1351  000e 89            	pushw	x
1352  000f ae0000        	ldw	x,#0
1353  0012 89            	pushw	x
1354  0013 ae0010        	ldw	x,#L73
1355  0016 cd0000        	call	_assert_failed
1357  0019 5b04          	addw	sp,#4
1358  001b               L651:
1359                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1361  001b 7211505a      	bres	20570,#0
1362                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1364  001f c6505a        	ld	a,20570
1365  0022 1a01          	or	a,(OFST+1,sp)
1366  0024 c7505a        	ld	20570,a
1367                     ; 365 }
1370  0027 84            	pop	a
1371  0028 81            	ret
1396                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1396                     ; 373 {
1397                     .text:	section	.text,new
1398  0000               _FLASH_GetLowPowerMode:
1402                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1404  0000 c6505a        	ld	a,20570
1405  0003 a40c          	and	a,#12
1408  0005 81            	ret
1433                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1433                     ; 383 {
1434                     .text:	section	.text,new
1435  0000               _FLASH_GetProgrammingTime:
1439                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1441  0000 c6505a        	ld	a,20570
1442  0003 a401          	and	a,#1
1445  0005 81            	ret
1477                     ; 392 uint32_t FLASH_GetBootSize(void)
1477                     ; 393 {
1478                     .text:	section	.text,new
1479  0000               _FLASH_GetBootSize:
1481  0000 5204          	subw	sp,#4
1482       00000004      OFST:	set	4
1485                     ; 394   uint32_t temp = 0;
1487                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1489  0002 c6505d        	ld	a,20573
1490  0005 5f            	clrw	x
1491  0006 97            	ld	xl,a
1492  0007 90ae0200      	ldw	y,#512
1493  000b cd0000        	call	c_umul
1495  000e 96            	ldw	x,sp
1496  000f 1c0001        	addw	x,#OFST-3
1497  0012 cd0000        	call	c_rtol
1500                     ; 400   if(FLASH->FPR == 0xFF)
1502  0015 c6505d        	ld	a,20573
1503  0018 a1ff          	cp	a,#255
1504  001a 2611          	jrne	L124
1505                     ; 402     temp += 512;
1507  001c ae0200        	ldw	x,#512
1508  001f bf02          	ldw	c_lreg+2,x
1509  0021 ae0000        	ldw	x,#0
1510  0024 bf00          	ldw	c_lreg,x
1511  0026 96            	ldw	x,sp
1512  0027 1c0001        	addw	x,#OFST-3
1513  002a cd0000        	call	c_lgadd
1516  002d               L124:
1517                     ; 406   return(temp);
1519  002d 96            	ldw	x,sp
1520  002e 1c0001        	addw	x,#OFST-3
1521  0031 cd0000        	call	c_ltor
1525  0034 5b04          	addw	sp,#4
1526  0036 81            	ret
1629                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1629                     ; 418 {
1630                     .text:	section	.text,new
1631  0000               _FLASH_GetFlagStatus:
1633  0000 88            	push	a
1634  0001 88            	push	a
1635       00000001      OFST:	set	1
1638                     ; 419   FlagStatus status = RESET;
1640                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1642  0002 a108          	cp	a,#8
1643  0004 270c          	jreq	L271
1644  0006 a104          	cp	a,#4
1645  0008 2708          	jreq	L271
1646  000a a102          	cp	a,#2
1647  000c 2704          	jreq	L271
1648  000e a101          	cp	a,#1
1649  0010 2603          	jrne	L071
1650  0012               L271:
1651  0012 4f            	clr	a
1652  0013 2010          	jra	L471
1653  0015               L071:
1654  0015 ae01a5        	ldw	x,#421
1655  0018 89            	pushw	x
1656  0019 ae0000        	ldw	x,#0
1657  001c 89            	pushw	x
1658  001d ae0010        	ldw	x,#L73
1659  0020 cd0000        	call	_assert_failed
1661  0023 5b04          	addw	sp,#4
1662  0025               L471:
1663                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1665  0025 c6505f        	ld	a,20575
1666  0028 1502          	bcp	a,(OFST+1,sp)
1667  002a 2706          	jreq	L174
1668                     ; 426     status = SET; /* FLASH_FLAG is set */
1670  002c a601          	ld	a,#1
1671  002e 6b01          	ld	(OFST+0,sp),a
1674  0030 2002          	jra	L374
1675  0032               L174:
1676                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1678  0032 0f01          	clr	(OFST+0,sp)
1680  0034               L374:
1681                     ; 434   return status;
1683  0034 7b01          	ld	a,(OFST+0,sp)
1686  0036 85            	popw	x
1687  0037 81            	ret
1768                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1768                     ; 550 {
1769                     .text:	section	.text,new
1770  0000               _FLASH_WaitForLastOperation:
1772  0000 5203          	subw	sp,#3
1773       00000003      OFST:	set	3
1776                     ; 551   uint8_t flagstatus = 0x00;
1778  0002 0f03          	clr	(OFST+0,sp)
1780                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1782  0004 aeffff        	ldw	x,#65535
1783  0007 1f01          	ldw	(OFST-2,sp),x
1786  0009 200e          	jra	L535
1787  000b               L135:
1788                     ; 578     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1790  000b c6505f        	ld	a,20575
1791  000e a405          	and	a,#5
1792  0010 6b03          	ld	(OFST+0,sp),a
1794                     ; 579     timeout--;
1796  0012 1e01          	ldw	x,(OFST-2,sp)
1797  0014 1d0001        	subw	x,#1
1798  0017 1f01          	ldw	(OFST-2,sp),x
1800  0019               L535:
1801                     ; 576   while((flagstatus == 0x00) && (timeout != 0x00))
1803  0019 0d03          	tnz	(OFST+0,sp)
1804  001b 2604          	jrne	L145
1806  001d 1e01          	ldw	x,(OFST-2,sp)
1807  001f 26ea          	jrne	L135
1808  0021               L145:
1809                     ; 583   if(timeout == 0x00 )
1811  0021 1e01          	ldw	x,(OFST-2,sp)
1812  0023 2604          	jrne	L345
1813                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1815  0025 a602          	ld	a,#2
1816  0027 6b03          	ld	(OFST+0,sp),a
1818  0029               L345:
1819                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1821  0029 7b03          	ld	a,(OFST+0,sp)
1824  002b 5b03          	addw	sp,#3
1825  002d 81            	ret
1885                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1885                     ; 599 {
1886                     .text:	section	.text,new
1887  0000               _FLASH_EraseBlock:
1889  0000 89            	pushw	x
1890  0001 5206          	subw	sp,#6
1891       00000006      OFST:	set	6
1894                     ; 600   uint32_t startaddress = 0;
1896                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1898  0003 7b0b          	ld	a,(OFST+5,sp)
1899  0005 a1fd          	cp	a,#253
1900  0007 2706          	jreq	L402
1901  0009 7b0b          	ld	a,(OFST+5,sp)
1902  000b a1f7          	cp	a,#247
1903  000d 2603          	jrne	L202
1904  000f               L402:
1905  000f 4f            	clr	a
1906  0010 2010          	jra	L602
1907  0012               L202:
1908  0012 ae0262        	ldw	x,#610
1909  0015 89            	pushw	x
1910  0016 ae0000        	ldw	x,#0
1911  0019 89            	pushw	x
1912  001a ae0010        	ldw	x,#L73
1913  001d cd0000        	call	_assert_failed
1915  0020 5b04          	addw	sp,#4
1916  0022               L602:
1917                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1919  0022 7b0b          	ld	a,(OFST+5,sp)
1920  0024 a1fd          	cp	a,#253
1921  0026 2626          	jrne	L375
1922                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1924  0028 1e07          	ldw	x,(OFST+1,sp)
1925  002a a30080        	cpw	x,#128
1926  002d 2403          	jruge	L012
1927  002f 4f            	clr	a
1928  0030 2010          	jra	L212
1929  0032               L012:
1930  0032 ae0265        	ldw	x,#613
1931  0035 89            	pushw	x
1932  0036 ae0000        	ldw	x,#0
1933  0039 89            	pushw	x
1934  003a ae0010        	ldw	x,#L73
1935  003d cd0000        	call	_assert_failed
1937  0040 5b04          	addw	sp,#4
1938  0042               L212:
1939                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1941  0042 ae8000        	ldw	x,#32768
1942  0045 1f05          	ldw	(OFST-1,sp),x
1943  0047 ae0000        	ldw	x,#0
1944  004a 1f03          	ldw	(OFST-3,sp),x
1947  004c 2024          	jra	L575
1948  004e               L375:
1949                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1951  004e 1e07          	ldw	x,(OFST+1,sp)
1952  0050 a3000a        	cpw	x,#10
1953  0053 2403          	jruge	L412
1954  0055 4f            	clr	a
1955  0056 2010          	jra	L612
1956  0058               L412:
1957  0058 ae026a        	ldw	x,#618
1958  005b 89            	pushw	x
1959  005c ae0000        	ldw	x,#0
1960  005f 89            	pushw	x
1961  0060 ae0010        	ldw	x,#L73
1962  0063 cd0000        	call	_assert_failed
1964  0066 5b04          	addw	sp,#4
1965  0068               L612:
1966                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1968  0068 ae4000        	ldw	x,#16384
1969  006b 1f05          	ldw	(OFST-1,sp),x
1970  006d ae0000        	ldw	x,#0
1971  0070 1f03          	ldw	(OFST-3,sp),x
1973  0072               L575:
1974                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1976  0072 1e07          	ldw	x,(OFST+1,sp)
1977  0074 a640          	ld	a,#64
1978  0076 cd0000        	call	c_cmulx
1980  0079 96            	ldw	x,sp
1981  007a 1c0003        	addw	x,#OFST-3
1982  007d cd0000        	call	c_ladd
1984  0080 be02          	ldw	x,c_lreg+2
1985  0082 1f01          	ldw	(OFST-5,sp),x
1987                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1989  0084 721a505b      	bset	20571,#5
1990                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1992  0088 721b505c      	bres	20572,#5
1993                     ; 636     *pwFlash = (uint32_t)0;
1995  008c 1e01          	ldw	x,(OFST-5,sp)
1996  008e a600          	ld	a,#0
1997  0090 e703          	ld	(3,x),a
1998  0092 a600          	ld	a,#0
1999  0094 e702          	ld	(2,x),a
2000  0096 a600          	ld	a,#0
2001  0098 e701          	ld	(1,x),a
2002  009a a600          	ld	a,#0
2003  009c f7            	ld	(x),a
2004                     ; 644 }
2007  009d 5b08          	addw	sp,#8
2008  009f 81            	ret
2107                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2107                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2107                     ; 657 {
2108                     .text:	section	.text,new
2109  0000               _FLASH_ProgramBlock:
2111  0000 89            	pushw	x
2112  0001 5206          	subw	sp,#6
2113       00000006      OFST:	set	6
2116                     ; 658   uint16_t Count = 0;
2118                     ; 659   uint32_t startaddress = 0;
2120                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2122  0003 7b0b          	ld	a,(OFST+5,sp)
2123  0005 a1fd          	cp	a,#253
2124  0007 2706          	jreq	L422
2125  0009 7b0b          	ld	a,(OFST+5,sp)
2126  000b a1f7          	cp	a,#247
2127  000d 2603          	jrne	L222
2128  000f               L422:
2129  000f 4f            	clr	a
2130  0010 2010          	jra	L622
2131  0012               L222:
2132  0012 ae0296        	ldw	x,#662
2133  0015 89            	pushw	x
2134  0016 ae0000        	ldw	x,#0
2135  0019 89            	pushw	x
2136  001a ae0010        	ldw	x,#L73
2137  001d cd0000        	call	_assert_failed
2139  0020 5b04          	addw	sp,#4
2140  0022               L622:
2141                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2143  0022 0d0c          	tnz	(OFST+6,sp)
2144  0024 2706          	jreq	L232
2145  0026 7b0c          	ld	a,(OFST+6,sp)
2146  0028 a110          	cp	a,#16
2147  002a 2603          	jrne	L032
2148  002c               L232:
2149  002c 4f            	clr	a
2150  002d 2010          	jra	L432
2151  002f               L032:
2152  002f ae0297        	ldw	x,#663
2153  0032 89            	pushw	x
2154  0033 ae0000        	ldw	x,#0
2155  0036 89            	pushw	x
2156  0037 ae0010        	ldw	x,#L73
2157  003a cd0000        	call	_assert_failed
2159  003d 5b04          	addw	sp,#4
2160  003f               L432:
2161                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2163  003f 7b0b          	ld	a,(OFST+5,sp)
2164  0041 a1fd          	cp	a,#253
2165  0043 2626          	jrne	L346
2166                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2168  0045 1e07          	ldw	x,(OFST+1,sp)
2169  0047 a30080        	cpw	x,#128
2170  004a 2403          	jruge	L632
2171  004c 4f            	clr	a
2172  004d 2010          	jra	L042
2173  004f               L632:
2174  004f ae029a        	ldw	x,#666
2175  0052 89            	pushw	x
2176  0053 ae0000        	ldw	x,#0
2177  0056 89            	pushw	x
2178  0057 ae0010        	ldw	x,#L73
2179  005a cd0000        	call	_assert_failed
2181  005d 5b04          	addw	sp,#4
2182  005f               L042:
2183                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2185  005f ae8000        	ldw	x,#32768
2186  0062 1f03          	ldw	(OFST-3,sp),x
2187  0064 ae0000        	ldw	x,#0
2188  0067 1f01          	ldw	(OFST-5,sp),x
2191  0069 2024          	jra	L546
2192  006b               L346:
2193                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2195  006b 1e07          	ldw	x,(OFST+1,sp)
2196  006d a3000a        	cpw	x,#10
2197  0070 2403          	jruge	L242
2198  0072 4f            	clr	a
2199  0073 2010          	jra	L442
2200  0075               L242:
2201  0075 ae029f        	ldw	x,#671
2202  0078 89            	pushw	x
2203  0079 ae0000        	ldw	x,#0
2204  007c 89            	pushw	x
2205  007d ae0010        	ldw	x,#L73
2206  0080 cd0000        	call	_assert_failed
2208  0083 5b04          	addw	sp,#4
2209  0085               L442:
2210                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2212  0085 ae4000        	ldw	x,#16384
2213  0088 1f03          	ldw	(OFST-3,sp),x
2214  008a ae0000        	ldw	x,#0
2215  008d 1f01          	ldw	(OFST-5,sp),x
2217  008f               L546:
2218                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2220  008f 1e07          	ldw	x,(OFST+1,sp)
2221  0091 a640          	ld	a,#64
2222  0093 cd0000        	call	c_cmulx
2224  0096 96            	ldw	x,sp
2225  0097 1c0001        	addw	x,#OFST-5
2226  009a cd0000        	call	c_lgadd
2229                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2231  009d 0d0c          	tnz	(OFST+6,sp)
2232  009f 260a          	jrne	L746
2233                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
2235  00a1 7210505b      	bset	20571,#0
2236                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2238  00a5 7211505c      	bres	20572,#0
2240  00a9 2008          	jra	L156
2241  00ab               L746:
2242                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
2244  00ab 7218505b      	bset	20571,#4
2245                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2247  00af 7219505c      	bres	20572,#4
2248  00b3               L156:
2249                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2251  00b3 5f            	clrw	x
2252  00b4 1f05          	ldw	(OFST-1,sp),x
2254  00b6               L356:
2255                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2257  00b6 1e0d          	ldw	x,(OFST+7,sp)
2258  00b8 72fb05        	addw	x,(OFST-1,sp)
2259  00bb f6            	ld	a,(x)
2260  00bc 1e03          	ldw	x,(OFST-3,sp)
2261  00be 72fb05        	addw	x,(OFST-1,sp)
2262  00c1 f7            	ld	(x),a
2263                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2265  00c2 1e05          	ldw	x,(OFST-1,sp)
2266  00c4 1c0001        	addw	x,#1
2267  00c7 1f05          	ldw	(OFST-1,sp),x
2271  00c9 1e05          	ldw	x,(OFST-1,sp)
2272  00cb a30040        	cpw	x,#64
2273  00ce 25e6          	jrult	L356
2274                     ; 697 }
2277  00d0 5b08          	addw	sp,#8
2278  00d2 81            	ret
2291                     	xdef	_FLASH_WaitForLastOperation
2292                     	xdef	_FLASH_ProgramBlock
2293                     	xdef	_FLASH_EraseBlock
2294                     	xdef	_FLASH_GetFlagStatus
2295                     	xdef	_FLASH_GetBootSize
2296                     	xdef	_FLASH_GetProgrammingTime
2297                     	xdef	_FLASH_GetLowPowerMode
2298                     	xdef	_FLASH_SetProgrammingTime
2299                     	xdef	_FLASH_SetLowPowerMode
2300                     	xdef	_FLASH_EraseOptionByte
2301                     	xdef	_FLASH_ProgramOptionByte
2302                     	xdef	_FLASH_ReadOptionByte
2303                     	xdef	_FLASH_ProgramWord
2304                     	xdef	_FLASH_ReadByte
2305                     	xdef	_FLASH_ProgramByte
2306                     	xdef	_FLASH_EraseByte
2307                     	xdef	_FLASH_ITConfig
2308                     	xdef	_FLASH_DeInit
2309                     	xdef	_FLASH_Lock
2310                     	xdef	_FLASH_Unlock
2311                     	xref	_assert_failed
2312                     	switch	.const
2313  0010               L73:
2314  0010 2e2e5c6c6962  	dc.b	"..\libs\src\stm8s_"
2315  0022 666c6173682e  	dc.b	"flash.c",0
2316                     	xref.b	c_lreg
2317                     	xref.b	c_x
2318                     	xref.b	c_y
2338                     	xref	c_ladd
2339                     	xref	c_cmulx
2340                     	xref	c_lgadd
2341                     	xref	c_rtol
2342                     	xref	c_umul
2343                     	xref	c_lcmp
2344                     	xref	c_ltor
2345                     	end
