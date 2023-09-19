   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  17                     ; 175 {
  18                     	scross	off
  19  0000               _FLASH_SetProgrammingTime:
  21                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  22                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  23  0000 72115050      	bres	20560,#0
  24                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  25  0004 ca5050        	or	a,20560
  26  0007 c75050        	ld	20560,a
  27                     ; 181 }
  28  000a 81            	ret	
  30                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
  30                     ; 189 {
  31  000b               _FLASH_GetProgrammingTime:
  33                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
  34  000b c65050        	ld	a,20560
  35  000e a401          	and	a,#1
  37  0010 81            	ret	
  39                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
  39                     ; 204 {
  40  0011               _FLASH_PowerWaitModeConfig:
  42                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
  43                     ; 209   if(FLASH_Power != FLASH_Power_On)
  44  0011 4a            	dec	a
  45  0012 2705          	jreq	L3
  46                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
  47  0014 72145050      	bset	20560,#2
  49  0018 81            	ret	
  50  0019               L3:
  51                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
  52  0019 72155050      	bres	20560,#2
  53                     ; 218 }
  54  001d 81            	ret	
  56                     ; 259 void FLASH_DeInit(void)
  56                     ; 260 {
  57  001e               _FLASH_DeInit:
  59                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
  60  001e 725f5050      	clr	20560
  61                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
  62  0022 725f5051      	clr	20561
  63                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
  64  0026 35405054      	mov	20564,#64
  65                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
  66  002a c65054        	ld	a,20564
  67                     ; 265 }
  68  002d 81            	ret	
  70                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  70                     ; 276 {
  71  002e               _FLASH_Unlock:
  72       00000000      OFST:	set	0
  74                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
  75                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
  76  002e a1fd          	cp	a,#253
  77  0030 2608          	jrne	L7
  78                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
  79  0032 35565052      	mov	20562,#86
  80                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
  81  0036 35ae5052      	mov	20562,#174
  82  003a               L7:
  83                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
  84  003a a1f7          	cp	a,#247
  85  003c 2608          	jrne	L11
  86                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  87  003e 35ae5053      	mov	20563,#174
  88                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
  89  0042 35565053      	mov	20563,#86
  90  0046               L11:
  91                     ; 293 }
  92  0046 81            	ret	
  94                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
  94                     ; 304 {
  95  0047               _FLASH_Lock:
  97                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
  98                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
  99  0047 c45054        	and	a,20564
 100  004a c75054        	ld	20564,a
 101                     ; 310 }
 102  004d 81            	ret	
 104                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 104                     ; 319 {
 105  004e               _FLASH_ProgramByte:
 106       00000000      OFST:	set	0
 108                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 109                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 110  004e 1e05          	ldw	x,(OFST+5,sp)
 111  0050 7b07          	ld	a,(OFST+7,sp)
 112  0052 f7            	ld	(x),a
 113                     ; 324 }
 114  0053 81            	ret	
 116                     ; 331 void FLASH_EraseByte(uint32_t Address)
 116                     ; 332 {
 117  0054               _FLASH_EraseByte:
 118       00000000      OFST:	set	0
 120                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 121                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 122  0054 1e05          	ldw	x,(OFST+5,sp)
 123  0056 7f            	clr	(x)
 124                     ; 337 }
 125  0057 81            	ret	
 127                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 127                     ; 346 {
 128  0058               _FLASH_ProgramWord:
 129       00000000      OFST:	set	0
 131                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 132                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 133  0058 721c5051      	bset	20561,#6
 134                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 135  005c 1e05          	ldw	x,(OFST+5,sp)
 136  005e 7b07          	ld	a,(OFST+7,sp)
 137  0060 f7            	ld	(x),a
 138                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 139  0061 7b08          	ld	a,(OFST+8,sp)
 140  0063 e701          	ld	(1,x),a
 141                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 142  0065 7b09          	ld	a,(OFST+9,sp)
 143  0067 e702          	ld	(2,x),a
 144                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 145  0069 7b0a          	ld	a,(OFST+10,sp)
 146  006b e703          	ld	(3,x),a
 147                     ; 360 }
 148  006d 81            	ret	
 150                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 150                     ; 368 {
 151  006e               _FLASH_ReadByte:
 152       00000000      OFST:	set	0
 154                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 155  006e 1e05          	ldw	x,(OFST+5,sp)
 156  0070 f6            	ld	a,(x)
 158  0071 81            	ret	
 160                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 160                     ; 418 {
 161  0072               _FLASH_ProgramOptionByte:
 162  0072 89            	pushw	x
 163       00000000      OFST:	set	0
 165                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 166                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 167  0073 721e5051      	bset	20561,#7
 168                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 169  0077 7b05          	ld	a,(OFST+5,sp)
 170  0079 f7            	ld	(x),a
 171                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 172  007a a6fd          	ld	a,#253
 173  007c cd0173        	call	_FLASH_WaitForLastOperation
 175                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 176  007f 721f5051      	bres	20561,#7
 177                     ; 432 }
 178  0083 85            	popw	x
 179  0084 81            	ret	
 181                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 181                     ; 440 {
 182  0085               _FLASH_EraseOptionByte:
 184                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 185                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 186  0085 721e5051      	bset	20561,#7
 187                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 188  0089 7f            	clr	(x)
 189                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 190  008a a6fd          	ld	a,#253
 191  008c cd0173        	call	_FLASH_WaitForLastOperation
 193                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 194  008f 721f5051      	bres	20561,#7
 195                     ; 454 }
 196  0093 81            	ret	
 198                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 198                     ; 463 {
 199  0094               _FLASH_GetReadOutProtectionStatus:
 200       00000001      OFST:	set	1
 202                     ; 464   FunctionalState state = DISABLE;
 203                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 204  0094 c64800        	ld	a,18432
 205  0097 a1aa          	cp	a,#170
 206  0099 2603          	jrne	L31
 207                     ; 469     state =  ENABLE;
 208  009b a601          	ld	a,#1
 210  009d 81            	ret	
 211  009e               L31:
 212                     ; 474     state =  DISABLE;
 213  009e 4f            	clr	a
 214                     ; 477   return state;
 216  009f 81            	ret	
 218                     ; 485 uint16_t FLASH_GetBootSize(void)
 218                     ; 486 {
 219  00a0               _FLASH_GetBootSize:
 220       00000002      OFST:	set	2
 222                     ; 487   uint16_t temp = 0;
 223                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 224  00a0 c64802        	ld	a,18434
 225  00a3 5f            	clrw	x
 226  00a4 97            	ld	xl,a
 227  00a5 4f            	clr	a
 228  00a6 02            	rlwa	x,a
 229  00a7 44            	srl	a
 230  00a8 56            	rrcw	x
 231                     ; 493   if(OPT->UBC > 0x7F)
 232  00a9 c64802        	ld	a,18434
 233  00ac a180          	cp	a,#128
 234  00ae 2503          	jrult	L71
 235                     ; 495     temp = 8192;
 236  00b0 ae2000        	ldw	x,#8192
 237  00b3               L71:
 238                     ; 499   return(temp);
 240  00b3 81            	ret	
 242                     ; 508 uint16_t FLASH_GetCodeSize(void)
 242                     ; 509 {
 243  00b4               _FLASH_GetCodeSize:
 244       00000002      OFST:	set	2
 246                     ; 510   uint16_t temp = 0;
 247                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 248  00b4 c64807        	ld	a,18439
 249  00b7 5f            	clrw	x
 250  00b8 97            	ld	xl,a
 251  00b9 4f            	clr	a
 252  00ba 02            	rlwa	x,a
 253  00bb 44            	srl	a
 254  00bc 56            	rrcw	x
 255                     ; 516   if(OPT->PCODESIZE > 0x7F)
 256  00bd c64807        	ld	a,18439
 257  00c0 a180          	cp	a,#128
 258  00c2 2503          	jrult	L12
 259                     ; 518     temp = 8192;
 260  00c4 ae2000        	ldw	x,#8192
 261  00c7               L12:
 262                     ; 522   return(temp);
 264  00c7 81            	ret	
 266                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
 266                     ; 548 {
 267  00c8               _FLASH_ITConfig:
 269                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
 270                     ; 552   if(NewState != DISABLE)
 271  00c8 4d            	tnz	a
 272  00c9 2705          	jreq	L32
 273                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
 274  00cb 72125050      	bset	20560,#1
 276  00cf 81            	ret	
 277  00d0               L32:
 278                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
 279  00d0 72135050      	bres	20560,#1
 280                     ; 562 }
 281  00d4 81            	ret	
 283                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 283                     ; 577 {
 284  00d5               _FLASH_GetFlagStatus:
 285       00000001      OFST:	set	1
 287                     ; 578   FlagStatus status = RESET;
 288                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 289                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 290  00d5 c45054        	and	a,20564
 291  00d8 2702          	jreq	L72
 292                     ; 584     status = SET; /* Flash_FLAG is set*/
 293  00da a601          	ld	a,#1
 295  00dc               L72:
 296                     ; 588     status = RESET; /* Flash_FLAG is reset*/
 297                     ; 592   return status;
 299  00dc 81            	ret	
 301                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
 301                     ; 720 {
 302  00dd               _FLASH_PowerRunModeConfig:
 304                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
 305                     ; 724   if(FLASH_Power != FLASH_Power_On)
 306  00dd 4a            	dec	a
 307  00de 2705          	jreq	L33
 308                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
 309  00e0 72165050      	bset	20560,#3
 311  00e4 81            	ret	
 312  00e5               L33:
 313                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
 314  00e5 72175050      	bres	20560,#3
 315                     ; 732 }
 316  00e9 81            	ret	
 318                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
 318                     ; 746 {
 319  00ea               _FLASH_GetPowerStatus:
 321                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
 322  00ea c65050        	ld	a,20560
 323  00ed a40c          	and	a,#12
 325  00ef 81            	ret	
 327                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
 327                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
 327                     ; 767 {
 328  00f0               _FLASH_ProgramBlock:
 329  00f0 89            	pushw	x
 330  00f1 5206          	subw	sp,#6
 331       00000006      OFST:	set	6
 333                     ; 768   uint16_t Count = 0;
 334                     ; 769   uint32_t startaddress = 0;
 335                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 336                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
 337                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
 338  00f3 7b0b          	ld	a,(OFST+5,sp)
 339  00f5 a1fd          	cp	a,#253
 340  00f7 2605          	jrne	L73
 341                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
 342                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
 343  00f9 ae8000        	ldw	x,#32768
 345  00fc 2003          	jra	L14
 346  00fe               L73:
 347                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
 348                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
 349  00fe ae1000        	ldw	x,#4096
 350  0101               L14:
 351  0101 1f03          	ldw	(OFST-3,sp),x
 352  0103 5f            	clrw	x
 353  0104 1f01          	ldw	(OFST-5,sp),x
 354                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
 355  0106 a680          	ld	a,#128
 356  0108 1e07          	ldw	x,(OFST+1,sp)
 357  010a cd0000        	call	c_cmulx
 359  010d 96            	ldw	x,sp
 360  010e 5c            	incw	x
 361  010f cd0000        	call	c_lgadd
 363                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
 364  0112 7b0c          	ld	a,(OFST+6,sp)
 365  0114 2606          	jrne	L34
 366                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
 367  0116 72105051      	bset	20561,#0
 369  011a 2004          	jra	L54
 370  011c               L34:
 371                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
 372  011c 72185051      	bset	20561,#4
 373  0120               L54:
 374                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 375  0120 5f            	clrw	x
 376  0121 1f05          	ldw	(OFST-1,sp),x
 377  0123               L74:
 378                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
 379  0123 1e0d          	ldw	x,(OFST+7,sp)
 380  0125 72fb05        	addw	x,(OFST-1,sp)
 381  0128 f6            	ld	a,(x)
 382  0129 1e03          	ldw	x,(OFST-3,sp)
 383  012b 72fb05        	addw	x,(OFST-1,sp)
 384  012e f7            	ld	(x),a
 385                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 386  012f 1e05          	ldw	x,(OFST-1,sp)
 387  0131 5c            	incw	x
 388  0132 1f05          	ldw	(OFST-1,sp),x
 390  0134 a30080        	cpw	x,#128
 391  0137 25ea          	jrult	L74
 392                     ; 805 }
 393  0139 5b08          	addw	sp,#8
 394  013b 81            	ret	
 396                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
 396                     ; 818 {
 397  013c               _FLASH_EraseBlock:
 398  013c 89            	pushw	x
 399  013d 5206          	subw	sp,#6
 400       00000006      OFST:	set	6
 402                     ; 819   uint32_t startaddress = 0;
 403                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 404                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
 405  013f 7b0b          	ld	a,(OFST+5,sp)
 406  0141 a1fd          	cp	a,#253
 407  0143 2605          	jrne	L55
 408                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
 409                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
 410  0145 ae8000        	ldw	x,#32768
 412  0148 2003          	jra	L75
 413  014a               L55:
 414                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
 415                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
 416  014a ae1000        	ldw	x,#4096
 417  014d               L75:
 418  014d 1f05          	ldw	(OFST-1,sp),x
 419  014f 5f            	clrw	x
 420  0150 1f03          	ldw	(OFST-3,sp),x
 421                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
 422  0152 a680          	ld	a,#128
 423  0154 1e07          	ldw	x,(OFST+1,sp)
 424  0156 cd0000        	call	c_cmulx
 426  0159 96            	ldw	x,sp
 427  015a 1c0003        	addw	x,#OFST-3
 428  015d cd0000        	call	c_ladd
 430  0160 be02          	ldw	x,c_lreg+2
 431  0162 1f01          	ldw	(OFST-5,sp),x
 432                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
 433  0164 721a5051      	bset	20561,#5
 434                     ; 855     *pwFlash = (uint32_t)0;  
 435  0168 4f            	clr	a
 436  0169 e703          	ld	(3,x),a
 437  016b e702          	ld	(2,x),a
 438  016d e701          	ld	(1,x),a
 439  016f f7            	ld	(x),a
 440                     ; 863 }
 441  0170 5b08          	addw	sp,#8
 442  0172 81            	ret	
 444                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
 444                     ; 876 {
 445  0173               _FLASH_WaitForLastOperation:
 446  0173 5203          	subw	sp,#3
 447       00000003      OFST:	set	3
 449                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
 450  0175 aeffff        	ldw	x,#65535
 451  0178 1f01          	ldw	(OFST-2,sp),x
 452                     ; 878   uint8_t flagstatus = 0x00;
 453  017a 0f03          	clr	(OFST+0,sp)
 454                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
 455  017c a1fd          	cp	a,#253
 456  017e 2620          	jrne	L77
 458  0180 200a          	jra	L56
 459  0182               L36:
 460                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
 460                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
 461  0182 c65054        	ld	a,20564
 462  0185 a405          	and	a,#5
 463  0187 6b03          	ld	(OFST+0,sp),a
 464                     ; 887       timeout--;
 465  0189 5a            	decw	x
 466  018a 1f01          	ldw	(OFST-2,sp),x
 467  018c               L56:
 468                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
 469  018c 7b03          	ld	a,(OFST+0,sp)
 470  018e 2618          	jrne	L37
 472  0190 1e01          	ldw	x,(OFST-2,sp)
 473  0192 26ee          	jrne	L36
 474  0194 2012          	jra	L37
 475  0196               L57:
 476                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
 476                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
 477  0196 c65054        	ld	a,20564
 478  0199 a441          	and	a,#65
 479  019b 6b03          	ld	(OFST+0,sp),a
 480                     ; 896       timeout--;
 481  019d 5a            	decw	x
 482  019e 1f01          	ldw	(OFST-2,sp),x
 483  01a0               L77:
 484                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
 485  01a0 7b03          	ld	a,(OFST+0,sp)
 486  01a2 2604          	jrne	L37
 488  01a4 1e01          	ldw	x,(OFST-2,sp)
 489  01a6 26ee          	jrne	L57
 490  01a8               L37:
 491                     ; 900   if(timeout == 0x00)
 492  01a8 1e01          	ldw	x,(OFST-2,sp)
 493  01aa 2602          	jrne	L501
 494                     ; 902     flagstatus = FLASH_Status_TimeOut;
 495  01ac a602          	ld	a,#2
 496  01ae               L501:
 497                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
 499  01ae 5b03          	addw	sp,#3
 500  01b0 81            	ret	
 502                     	xdef	_FLASH_WaitForLastOperation
 503                     	xdef	_FLASH_EraseBlock
 504                     	xdef	_FLASH_ProgramBlock
 505                     	xdef	_FLASH_GetPowerStatus
 506                     	xdef	_FLASH_PowerRunModeConfig
 507                     	xdef	_FLASH_GetFlagStatus
 508                     	xdef	_FLASH_ITConfig
 509                     	xdef	_FLASH_EraseOptionByte
 510                     	xdef	_FLASH_ProgramOptionByte
 511                     	xdef	_FLASH_GetReadOutProtectionStatus
 512                     	xdef	_FLASH_GetCodeSize
 513                     	xdef	_FLASH_GetBootSize
 514                     	xdef	_FLASH_ReadByte
 515                     	xdef	_FLASH_ProgramWord
 516                     	xdef	_FLASH_EraseByte
 517                     	xdef	_FLASH_ProgramByte
 518                     	xdef	_FLASH_Lock
 519                     	xdef	_FLASH_Unlock
 520                     	xdef	_FLASH_DeInit
 521                     	xdef	_FLASH_PowerWaitModeConfig
 522                     	xdef	_FLASH_SetProgrammingTime
 523                     	xdef	_FLASH_GetProgrammingTime
 524                     	xref.b	c_lreg
 525                     	xref	c_ladd
 526                     	xref	c_lgadd
 527                     	xref	c_cmulx
 528                     	end
