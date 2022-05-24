   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  85                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  85                     ; 175 {
  87                     .text:	section	.text,new
  88  0000               _FLASH_SetProgrammingTime:
  92                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  94                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  96  0000 72115050      	bres	20560,#0
  97                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  99  0004 ca5050        	or	a,20560
 100  0007 c75050        	ld	20560,a
 101                     ; 181 }
 104  000a 81            	ret	
 129                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 129                     ; 189 {
 130                     .text:	section	.text,new
 131  0000               _FLASH_GetProgrammingTime:
 135                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 137  0000 c65050        	ld	a,20560
 138  0003 a401          	and	a,#1
 141  0005 81            	ret	
 197                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 197                     ; 204 {
 198                     .text:	section	.text,new
 199  0000               _FLASH_PowerWaitModeConfig:
 203                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 205                     ; 209   if(FLASH_Power != FLASH_Power_On)
 207  0000 4a            	dec	a
 208  0001 2705          	jreq	L57
 209                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 211  0003 72145050      	bset	20560,#2
 214  0007 81            	ret	
 215  0008               L57:
 216                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 218  0008 72155050      	bres	20560,#2
 219                     ; 218 }
 222  000c 81            	ret	
 245                     ; 259 void FLASH_DeInit(void)
 245                     ; 260 {
 246                     .text:	section	.text,new
 247  0000               _FLASH_DeInit:
 251                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 253  0000 725f5050      	clr	20560
 254                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 256  0004 725f5051      	clr	20561
 257                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 259  0008 35405054      	mov	20564,#64
 260                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 262  000c c65054        	ld	a,20564
 263                     ; 265 }
 266  000f 81            	ret	
 322                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 322                     ; 276 {
 323                     .text:	section	.text,new
 324  0000               _FLASH_Unlock:
 326       00000000      OFST:	set	0
 329                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 331                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 333  0000 a1fd          	cp	a,#253
 334  0002 2608          	jrne	L731
 335                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 337  0004 35565052      	mov	20562,#86
 338                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 340  0008 35ae5052      	mov	20562,#174
 341  000c               L731:
 342                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 344  000c a1f7          	cp	a,#247
 345  000e 2608          	jrne	L141
 346                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 348  0010 35ae5053      	mov	20563,#174
 349                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 351  0014 35565053      	mov	20563,#86
 352  0018               L141:
 353                     ; 293 }
 356  0018 81            	ret	
 391                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 391                     ; 304 {
 392                     .text:	section	.text,new
 393  0000               _FLASH_Lock:
 397                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 399                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 401  0000 c45054        	and	a,20564
 402  0003 c75054        	ld	20564,a
 403                     ; 310 }
 406  0006 81            	ret	
 445                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 445                     ; 319 {
 446                     .text:	section	.text,new
 447  0000               _FLASH_ProgramByte:
 449       00000000      OFST:	set	0
 452                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 454                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 456  0000 1e05          	ldw	x,(OFST+5,sp)
 457  0002 7b07          	ld	a,(OFST+7,sp)
 458  0004 f7            	ld	(x),a
 459                     ; 324 }
 462  0005 81            	ret	
 494                     ; 331 void FLASH_EraseByte(uint32_t Address)
 494                     ; 332 {
 495                     .text:	section	.text,new
 496  0000               _FLASH_EraseByte:
 498       00000000      OFST:	set	0
 501                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 503                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 505  0000 1e05          	ldw	x,(OFST+5,sp)
 506  0002 7f            	clr	(x)
 507                     ; 337 }
 510  0003 81            	ret	
 549                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 549                     ; 346 {
 550                     .text:	section	.text,new
 551  0000               _FLASH_ProgramWord:
 553       00000000      OFST:	set	0
 556                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 558                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 560  0000 721c5051      	bset	20561,#6
 561                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 563  0004 1e05          	ldw	x,(OFST+5,sp)
 564  0006 7b07          	ld	a,(OFST+7,sp)
 565  0008 f7            	ld	(x),a
 566                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 568  0009 7b08          	ld	a,(OFST+8,sp)
 569  000b e701          	ld	(1,x),a
 570                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 572  000d 7b09          	ld	a,(OFST+9,sp)
 573  000f e702          	ld	(2,x),a
 574                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 576  0011 7b0a          	ld	a,(OFST+10,sp)
 577  0013 e703          	ld	(3,x),a
 578                     ; 360 }
 581  0015 81            	ret	
 613                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 613                     ; 368 {
 614                     .text:	section	.text,new
 615  0000               _FLASH_ReadByte:
 617       00000000      OFST:	set	0
 620                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 622  0000 1e05          	ldw	x,(OFST+5,sp)
 623  0002 f6            	ld	a,(x)
 626  0003 81            	ret	
 667                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 667                     ; 418 {
 668                     .text:	section	.text,new
 669  0000               _FLASH_ProgramOptionByte:
 671  0000 89            	pushw	x
 672       00000000      OFST:	set	0
 675                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 677                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 679  0001 721e5051      	bset	20561,#7
 680                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 682  0005 7b05          	ld	a,(OFST+5,sp)
 683  0007 f7            	ld	(x),a
 684                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 686  0008 a6fd          	ld	a,#253
 687  000a cd0000        	call	_FLASH_WaitForLastOperation
 689                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 691  000d 721f5051      	bres	20561,#7
 692                     ; 432 }
 695  0011 85            	popw	x
 696  0012 81            	ret	
 730                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 730                     ; 440 {
 731                     .text:	section	.text,new
 732  0000               _FLASH_EraseOptionByte:
 736                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 738                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 740  0000 721e5051      	bset	20561,#7
 741                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 743  0004 7f            	clr	(x)
 744                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 746  0005 a6fd          	ld	a,#253
 747  0007 cd0000        	call	_FLASH_WaitForLastOperation
 749                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 751  000a 721f5051      	bres	20561,#7
 752                     ; 454 }
 755  000e 81            	ret	
 812                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 812                     ; 463 {
 813                     .text:	section	.text,new
 814  0000               _FLASH_GetReadOutProtectionStatus:
 816       00000001      OFST:	set	1
 819                     ; 464   FunctionalState state = DISABLE;
 821                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 823  0000 c64800        	ld	a,18432
 824  0003 a1aa          	cp	a,#170
 825  0005 2603          	jrne	L523
 826                     ; 469     state =  ENABLE;
 828  0007 a601          	ld	a,#1
 832  0009 81            	ret	
 833  000a               L523:
 834                     ; 474     state =  DISABLE;
 836  000a 4f            	clr	a
 838                     ; 477   return state;
 842  000b 81            	ret	
 874                     ; 485 uint16_t FLASH_GetBootSize(void)
 874                     ; 486 {
 875                     .text:	section	.text,new
 876  0000               _FLASH_GetBootSize:
 878       00000002      OFST:	set	2
 881                     ; 487   uint16_t temp = 0;
 883                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 885  0000 c64802        	ld	a,18434
 886  0003 5f            	clrw	x
 887  0004 97            	ld	xl,a
 888  0005 4f            	clr	a
 889  0006 02            	rlwa	x,a
 890  0007 44            	srl	a
 891  0008 56            	rrcw	x
 893                     ; 493   if(OPT->UBC > 0x7F)
 895  0009 c64802        	ld	a,18434
 896  000c a180          	cp	a,#128
 897  000e 2503          	jrult	L543
 898                     ; 495     temp = 8192;
 900  0010 ae2000        	ldw	x,#8192
 902  0013               L543:
 903                     ; 499   return(temp);
 907  0013 81            	ret	
 939                     ; 508 uint16_t FLASH_GetCodeSize(void)
 939                     ; 509 {
 940                     .text:	section	.text,new
 941  0000               _FLASH_GetCodeSize:
 943       00000002      OFST:	set	2
 946                     ; 510   uint16_t temp = 0;
 948                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 950  0000 c64807        	ld	a,18439
 951  0003 5f            	clrw	x
 952  0004 97            	ld	xl,a
 953  0005 4f            	clr	a
 954  0006 02            	rlwa	x,a
 955  0007 44            	srl	a
 956  0008 56            	rrcw	x
 958                     ; 516   if(OPT->PCODESIZE > 0x7F)
 960  0009 c64807        	ld	a,18439
 961  000c a180          	cp	a,#128
 962  000e 2503          	jrult	L363
 963                     ; 518     temp = 8192;
 965  0010 ae2000        	ldw	x,#8192
 967  0013               L363:
 968                     ; 522   return(temp);
 972  0013 81            	ret	
1007                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1007                     ; 548 {
1008                     .text:	section	.text,new
1009  0000               _FLASH_ITConfig:
1013                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1015                     ; 552   if(NewState != DISABLE)
1017  0000 4d            	tnz	a
1018  0001 2705          	jreq	L304
1019                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1021  0003 72125050      	bset	20560,#1
1024  0007 81            	ret	
1025  0008               L304:
1026                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1028  0008 72135050      	bres	20560,#1
1029                     ; 562 }
1032  000c 81            	ret	
1141                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1141                     ; 577 {
1142                     .text:	section	.text,new
1143  0000               _FLASH_GetFlagStatus:
1145       00000001      OFST:	set	1
1148                     ; 578   FlagStatus status = RESET;
1150                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1152                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1154  0000 c45054        	and	a,20564
1155  0003 2702          	jreq	L754
1156                     ; 584     status = SET; /* Flash_FLAG is set*/
1158  0005 a601          	ld	a,#1
1161  0007               L754:
1162                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1165                     ; 592   return status;
1169  0007 81            	ret	
1205                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1205                     ; 720 {
1206                     .text:	section	.text,new
1207  0000               _FLASH_PowerRunModeConfig:
1211                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1213                     ; 724   if(FLASH_Power != FLASH_Power_On)
1215  0000 4a            	dec	a
1216  0001 2705          	jreq	L105
1217                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1219  0003 72165050      	bset	20560,#3
1222  0007 81            	ret	
1223  0008               L105:
1224                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1226  0008 72175050      	bres	20560,#3
1227                     ; 732 }
1230  000c 81            	ret	
1294                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1294                     ; 746 {
1295                     .text:	section	.text,new
1296  0000               _FLASH_GetPowerStatus:
1300                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1302  0000 c65050        	ld	a,20560
1303  0003 a40c          	and	a,#12
1306  0005 81            	ret	
1404                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1404                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1404                     ; 767 {
1405                     .text:	section	.text,new
1406  0000               _FLASH_ProgramBlock:
1408  0000 89            	pushw	x
1409  0001 5206          	subw	sp,#6
1410       00000006      OFST:	set	6
1413                     ; 768   uint16_t Count = 0;
1415                     ; 769   uint32_t startaddress = 0;
1417                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1419                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1421                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1423  0003 7b0b          	ld	a,(OFST+5,sp)
1424  0005 a1fd          	cp	a,#253
1425  0007 2605          	jrne	L575
1426                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1428                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1430  0009 ae8000        	ldw	x,#32768
1432  000c 2003          	jra	L775
1433  000e               L575:
1434                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1436                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1438  000e ae1000        	ldw	x,#4096
1439  0011               L775:
1440  0011 1f03          	ldw	(OFST-3,sp),x
1441  0013 5f            	clrw	x
1442  0014 1f01          	ldw	(OFST-5,sp),x
1444                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1446  0016 a680          	ld	a,#128
1447  0018 1e07          	ldw	x,(OFST+1,sp)
1448  001a cd0000        	call	c_cmulx
1450  001d 96            	ldw	x,sp
1451  001e 5c            	incw	x
1452  001f cd0000        	call	c_lgadd
1455                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1457  0022 7b0c          	ld	a,(OFST+6,sp)
1458  0024 2606          	jrne	L106
1459                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1461  0026 72105051      	bset	20561,#0
1463  002a 2004          	jra	L306
1464  002c               L106:
1465                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1467  002c 72185051      	bset	20561,#4
1468  0030               L306:
1469                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1471  0030 5f            	clrw	x
1472  0031 1f05          	ldw	(OFST-1,sp),x
1474  0033               L506:
1475                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1477  0033 1e0d          	ldw	x,(OFST+7,sp)
1478  0035 72fb05        	addw	x,(OFST-1,sp)
1479  0038 f6            	ld	a,(x)
1480  0039 1e03          	ldw	x,(OFST-3,sp)
1481  003b 72fb05        	addw	x,(OFST-1,sp)
1482  003e f7            	ld	(x),a
1483                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1485  003f 1e05          	ldw	x,(OFST-1,sp)
1486  0041 5c            	incw	x
1487  0042 1f05          	ldw	(OFST-1,sp),x
1491  0044 a30080        	cpw	x,#128
1492  0047 25ea          	jrult	L506
1493                     ; 805 }
1496  0049 5b08          	addw	sp,#8
1497  004b 81            	ret	
1556                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1556                     ; 818 {
1557                     .text:	section	.text,new
1558  0000               _FLASH_EraseBlock:
1560  0000 89            	pushw	x
1561  0001 5206          	subw	sp,#6
1562       00000006      OFST:	set	6
1565                     ; 819   uint32_t startaddress = 0;
1567                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1569                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1571  0003 7b0b          	ld	a,(OFST+5,sp)
1572  0005 a1fd          	cp	a,#253
1573  0007 2605          	jrne	L146
1574                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1576                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1578  0009 ae8000        	ldw	x,#32768
1580  000c 2003          	jra	L346
1581  000e               L146:
1582                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1584                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1586  000e ae1000        	ldw	x,#4096
1587  0011               L346:
1588  0011 1f05          	ldw	(OFST-1,sp),x
1589  0013 5f            	clrw	x
1590  0014 1f03          	ldw	(OFST-3,sp),x
1592                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1594  0016 a680          	ld	a,#128
1595  0018 1e07          	ldw	x,(OFST+1,sp)
1596  001a cd0000        	call	c_cmulx
1598  001d 96            	ldw	x,sp
1599  001e 1c0003        	addw	x,#OFST-3
1600  0021 cd0000        	call	c_ladd
1602  0024 be02          	ldw	x,c_lreg+2
1603  0026 1f01          	ldw	(OFST-5,sp),x
1605                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1607  0028 721a5051      	bset	20561,#5
1608                     ; 855     *pwFlash = (uint32_t)0;  
1610  002c 4f            	clr	a
1611  002d e703          	ld	(3,x),a
1612  002f e702          	ld	(2,x),a
1613  0031 e701          	ld	(1,x),a
1614  0033 f7            	ld	(x),a
1615                     ; 863 }
1618  0034 5b08          	addw	sp,#8
1619  0036 81            	ret	
1700                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1700                     ; 876 {
1701                     .text:	section	.text,new
1702  0000               _FLASH_WaitForLastOperation:
1704  0000 5203          	subw	sp,#3
1705       00000003      OFST:	set	3
1708                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1710  0002 aeffff        	ldw	x,#65535
1711  0005 1f01          	ldw	(OFST-2,sp),x
1713                     ; 878   uint8_t flagstatus = 0x00;
1715  0007 0f03          	clr	(OFST+0,sp)
1717                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1719  0009 a1fd          	cp	a,#253
1720  000b 2620          	jrne	L717
1722  000d 200a          	jra	L507
1723  000f               L307:
1724                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1724                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1726  000f c65054        	ld	a,20564
1727  0012 a405          	and	a,#5
1728  0014 6b03          	ld	(OFST+0,sp),a
1730                     ; 887       timeout--;
1732  0016 5a            	decw	x
1733  0017 1f01          	ldw	(OFST-2,sp),x
1735  0019               L507:
1736                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1738  0019 7b03          	ld	a,(OFST+0,sp)
1739  001b 2618          	jrne	L317
1741  001d 1e01          	ldw	x,(OFST-2,sp)
1742  001f 26ee          	jrne	L307
1743  0021 2012          	jra	L317
1744  0023               L517:
1745                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1745                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1747  0023 c65054        	ld	a,20564
1748  0026 a441          	and	a,#65
1749  0028 6b03          	ld	(OFST+0,sp),a
1751                     ; 896       timeout--;
1753  002a 5a            	decw	x
1754  002b 1f01          	ldw	(OFST-2,sp),x
1756  002d               L717:
1757                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1759  002d 7b03          	ld	a,(OFST+0,sp)
1760  002f 2604          	jrne	L317
1762  0031 1e01          	ldw	x,(OFST-2,sp)
1763  0033 26ee          	jrne	L517
1764  0035               L317:
1765                     ; 900   if(timeout == 0x00)
1767  0035 1e01          	ldw	x,(OFST-2,sp)
1768  0037 2602          	jrne	L527
1769                     ; 902     flagstatus = FLASH_Status_TimeOut;
1771  0039 a602          	ld	a,#2
1773  003b               L527:
1774                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1778  003b 5b03          	addw	sp,#3
1779  003d 81            	ret	
1792                     	xdef	_FLASH_WaitForLastOperation
1793                     	xdef	_FLASH_EraseBlock
1794                     	xdef	_FLASH_ProgramBlock
1795                     	xdef	_FLASH_GetPowerStatus
1796                     	xdef	_FLASH_PowerRunModeConfig
1797                     	xdef	_FLASH_GetFlagStatus
1798                     	xdef	_FLASH_ITConfig
1799                     	xdef	_FLASH_EraseOptionByte
1800                     	xdef	_FLASH_ProgramOptionByte
1801                     	xdef	_FLASH_GetReadOutProtectionStatus
1802                     	xdef	_FLASH_GetCodeSize
1803                     	xdef	_FLASH_GetBootSize
1804                     	xdef	_FLASH_ReadByte
1805                     	xdef	_FLASH_ProgramWord
1806                     	xdef	_FLASH_EraseByte
1807                     	xdef	_FLASH_ProgramByte
1808                     	xdef	_FLASH_Lock
1809                     	xdef	_FLASH_Unlock
1810                     	xdef	_FLASH_DeInit
1811                     	xdef	_FLASH_PowerWaitModeConfig
1812                     	xdef	_FLASH_SetProgrammingTime
1813                     	xdef	_FLASH_GetProgrammingTime
1814                     	xref.b	c_lreg
1833                     	xref	c_ladd
1834                     	xref	c_lgadd
1835                     	xref	c_cmulx
1836                     	end
