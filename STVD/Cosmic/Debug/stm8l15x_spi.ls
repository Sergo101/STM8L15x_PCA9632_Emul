   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
 143                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 143                     ; 129 {
 145                     .text:	section	.text,new
 146  0000               _SPI_DeInit:
 150                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 152  0000 7f            	clr	(x)
 153                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 155  0001 6f01          	clr	(1,x)
 156                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 158  0003 6f02          	clr	(2,x)
 159                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 161  0005 a602          	ld	a,#2
 162  0007 e703          	ld	(3,x),a
 163                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 165  0009 a607          	ld	a,#7
 166  000b e705          	ld	(5,x),a
 167                     ; 135 }
 170  000d 81            	ret	
 494                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 494                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 494                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 494                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 494                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 494                     ; 182 {
 495                     .text:	section	.text,new
 496  0000               _SPI_Init:
 498  0000 89            	pushw	x
 499  0001 88            	push	a
 500       00000001      OFST:	set	1
 503                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 505                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 507                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 509                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 511                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 513                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 515                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 517                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 519                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 519                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 519                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 519                     ; 197                                   SPI_CPHA));
 521  0002 7b09          	ld	a,(OFST+8,sp)
 522  0004 1a0a          	or	a,(OFST+9,sp)
 523  0006 6b01          	ld	(OFST+0,sp),a
 525  0008 7b06          	ld	a,(OFST+5,sp)
 526  000a 1a07          	or	a,(OFST+6,sp)
 527  000c 1a01          	or	a,(OFST+0,sp)
 528  000e 1e02          	ldw	x,(OFST+1,sp)
 529  0010 f7            	ld	(x),a
 530                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 532  0011 7b0b          	ld	a,(OFST+10,sp)
 533  0013 1a0c          	or	a,(OFST+11,sp)
 534  0015 e701          	ld	(1,x),a
 535                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 537  0017 7b08          	ld	a,(OFST+7,sp)
 538  0019 a104          	cp	a,#4
 539  001b 2606          	jrne	L362
 540                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 542  001d e601          	ld	a,(1,x)
 543  001f aa01          	or	a,#1
 545  0021 2004          	jra	L562
 546  0023               L362:
 547                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 549  0023 e601          	ld	a,(1,x)
 550  0025 a4fe          	and	a,#254
 551  0027               L562:
 552  0027 e701          	ld	(1,x),a
 553                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 555  0029 f6            	ld	a,(x)
 556  002a 1a08          	or	a,(OFST+7,sp)
 557  002c f7            	ld	(x),a
 558                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 560  002d 7b0d          	ld	a,(OFST+12,sp)
 561  002f e705          	ld	(5,x),a
 562                     ; 216 }
 565  0031 5b03          	addw	sp,#3
 566  0033 81            	ret	
 633                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 633                     ; 226 {
 634                     .text:	section	.text,new
 635  0000               _SPI_Cmd:
 637       fffffffe      OFST: set -2
 640                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 642                     ; 230   if (NewState != DISABLE)
 644  0000 7b03          	ld	a,(OFST+5,sp)
 645  0002 2705          	jreq	L323
 646                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 648  0004 f6            	ld	a,(x)
 649  0005 aa40          	or	a,#64
 651  0007 2003          	jra	L523
 652  0009               L323:
 653                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 655  0009 f6            	ld	a,(x)
 656  000a a4bf          	and	a,#191
 657  000c               L523:
 658  000c f7            	ld	(x),a
 659                     ; 238 }
 662  000d 81            	ret	
 710                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 710                     ; 248 {
 711                     .text:	section	.text,new
 712  0000               _SPI_NSSInternalSoftwareCmd:
 714       fffffffe      OFST: set -2
 717                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 719                     ; 252   if (NewState != DISABLE)
 721  0000 7b03          	ld	a,(OFST+5,sp)
 722  0002 2706          	jreq	L353
 723                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 725  0004 e601          	ld	a,(1,x)
 726  0006 aa01          	or	a,#1
 728  0008 2004          	jra	L553
 729  000a               L353:
 730                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 732  000a e601          	ld	a,(1,x)
 733  000c a4fe          	and	a,#254
 734  000e               L553:
 735  000e e701          	ld	(1,x),a
 736                     ; 260 }
 739  0010 81            	ret	
 807                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 807                     ; 272 {
 808                     .text:	section	.text,new
 809  0000               _SPI_BiDirectionalLineConfig:
 811       fffffffe      OFST: set -2
 814                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 816                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 818  0000 7b03          	ld	a,(OFST+5,sp)
 819  0002 2706          	jreq	L314
 820                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 822  0004 e601          	ld	a,(1,x)
 823  0006 aa40          	or	a,#64
 825  0008 2004          	jra	L514
 826  000a               L314:
 827                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 829  000a e601          	ld	a,(1,x)
 830  000c a4bf          	and	a,#191
 831  000e               L514:
 832  000e e701          	ld	(1,x),a
 833                     ; 284 }
 836  0010 81            	ret	
 880                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 880                     ; 320 {
 881                     .text:	section	.text,new
 882  0000               _SPI_SendData:
 884       fffffffe      OFST: set -2
 887                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 889  0000 7b03          	ld	a,(OFST+5,sp)
 890  0002 e704          	ld	(4,x),a
 891                     ; 322 }
 894  0004 81            	ret	
 931                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 931                     ; 330 {
 932                     .text:	section	.text,new
 933  0000               _SPI_ReceiveData:
 937                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 939  0000 e604          	ld	a,(4,x)
 942  0002 81            	ret	
 979                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 979                     ; 415 {
 980                     .text:	section	.text,new
 981  0000               _SPI_TransmitCRC:
 985                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 987  0000 e601          	ld	a,(1,x)
 988  0002 aa10          	or	a,#16
 989  0004 e701          	ld	(1,x),a
 990                     ; 417 }
 993  0006 81            	ret	
1042                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1042                     ; 427 {
1043                     .text:	section	.text,new
1044  0000               _SPI_CalculateCRCCmd:
1046  0000 89            	pushw	x
1047       00000000      OFST:	set	0
1050                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1052                     ; 432   SPI_Cmd(SPI1, DISABLE);
1054  0001 4b00          	push	#0
1055  0003 ae5200        	ldw	x,#20992
1056  0006 cd0000        	call	_SPI_Cmd
1058  0009 84            	pop	a
1059                     ; 434   if (NewState != DISABLE)
1061  000a 7b05          	ld	a,(OFST+5,sp)
1062  000c 2708          	jreq	L525
1063                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1065  000e 1e01          	ldw	x,(OFST+1,sp)
1066  0010 e601          	ld	a,(1,x)
1067  0012 aa20          	or	a,#32
1069  0014 2006          	jra	L725
1070  0016               L525:
1071                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1073  0016 1e01          	ldw	x,(OFST+1,sp)
1074  0018 e601          	ld	a,(1,x)
1075  001a a4df          	and	a,#223
1076  001c               L725:
1077  001c e701          	ld	(1,x),a
1078                     ; 442 }
1081  001e 85            	popw	x
1082  001f 81            	ret	
1156                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1156                     ; 454 {
1157                     .text:	section	.text,new
1158  0000               _SPI_GetCRC:
1160       fffffffe      OFST: set -2
1163                     ; 455   uint8_t crcreg = 0;
1165                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1167                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1169  0000 7b03          	ld	a,(OFST+5,sp)
1170  0002 2703          	jreq	L765
1171                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1173  0004 e607          	ld	a,(7,x)
1177  0006 81            	ret	
1178  0007               L765:
1179                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1181  0007 e606          	ld	a,(6,x)
1183                     ; 470   return crcreg;
1187  0009 81            	ret	
1226                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1226                     ; 479 {
1227                     .text:	section	.text,new
1228  0000               _SPI_ResetCRC:
1230  0000 89            	pushw	x
1231       00000000      OFST:	set	0
1234                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1236  0001 4b01          	push	#1
1237  0003 cd0000        	call	_SPI_CalculateCRCCmd
1239  0006 84            	pop	a
1240                     ; 485   SPI_Cmd(SPIx, ENABLE);
1242  0007 4b01          	push	#1
1243  0009 1e02          	ldw	x,(OFST+2,sp)
1244  000b cd0000        	call	_SPI_Cmd
1246                     ; 486 }
1249  000e 5b03          	addw	sp,#3
1250  0010 81            	ret	
1288                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1288                     ; 494 {
1289                     .text:	section	.text,new
1290  0000               _SPI_GetCRCPolynomial:
1294                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1296  0000 e605          	ld	a,(5,x)
1299  0002 81            	ret	
1376                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1376                     ; 526 {
1377                     .text:	section	.text,new
1378  0000               _SPI_DMACmd:
1380       fffffffe      OFST: set -2
1383                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1385                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1387                     ; 531   if (NewState != DISABLE)
1389  0000 7b04          	ld	a,(OFST+6,sp)
1390  0002 2706          	jreq	L376
1391                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1393  0004 e602          	ld	a,(2,x)
1394  0006 1a03          	or	a,(OFST+5,sp)
1396  0008 2005          	jra	L576
1397  000a               L376:
1398                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1400  000a 7b03          	ld	a,(OFST+5,sp)
1401  000c 43            	cpl	a
1402  000d e402          	and	a,(2,x)
1403  000f               L576:
1404  000f e702          	ld	(2,x),a
1405                     ; 541 }
1408  0011 81            	ret	
1527                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1527                     ; 627 {
1528                     .text:	section	.text,new
1529  0000               _SPI_ITConfig:
1531  0000 89            	pushw	x
1532  0001 88            	push	a
1533       00000001      OFST:	set	1
1536                     ; 628   uint8_t itpos = 0;
1538                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1540                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1542                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1544  0002 7b06          	ld	a,(OFST+5,sp)
1545  0004 a40f          	and	a,#15
1546  0006 5f            	clrw	x
1547  0007 97            	ld	xl,a
1548  0008 a601          	ld	a,#1
1549  000a 5d            	tnzw	x
1550  000b 2704          	jreq	L64
1551  000d               L05:
1552  000d 48            	sll	a
1553  000e 5a            	decw	x
1554  000f 26fc          	jrne	L05
1555  0011               L64:
1556  0011 6b01          	ld	(OFST+0,sp),a
1558                     ; 636   if (NewState != DISABLE)
1560  0013 0d07          	tnz	(OFST+6,sp)
1561  0015 2708          	jreq	L357
1562                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1564  0017 1e02          	ldw	x,(OFST+1,sp)
1565  0019 e602          	ld	a,(2,x)
1566  001b 1a01          	or	a,(OFST+0,sp)
1568  001d 2005          	jra	L557
1569  001f               L357:
1570                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1572  001f 1e02          	ldw	x,(OFST+1,sp)
1573  0021 43            	cpl	a
1574  0022 e402          	and	a,(2,x)
1575  0024               L557:
1576  0024 e702          	ld	(2,x),a
1577                     ; 644 }
1580  0026 5b03          	addw	sp,#3
1581  0028 81            	ret	
1714                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1714                     ; 662 {
1715                     .text:	section	.text,new
1716  0000               _SPI_GetFlagStatus:
1718       fffffffe      OFST: set -2
1721                     ; 663   FlagStatus status = RESET;
1723                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1725                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1727  0000 e603          	ld	a,(3,x)
1728  0002 1503          	bcp	a,(OFST+5,sp)
1729  0004 2703          	jreq	L1401
1730                     ; 670     status = SET; /* SPI_FLAG is set */
1732  0006 a601          	ld	a,#1
1736  0008 81            	ret	
1737  0009               L1401:
1738                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1740  0009 4f            	clr	a
1742                     ; 678   return status;
1746  000a 81            	ret	
1793                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1793                     ; 697 {
1794                     .text:	section	.text,new
1795  0000               _SPI_ClearFlag:
1797       fffffffe      OFST: set -2
1800                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1802                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1804  0000 7b03          	ld	a,(OFST+5,sp)
1805  0002 43            	cpl	a
1806  0003 e703          	ld	(3,x),a
1807                     ; 701 }
1810  0005 81            	ret	
1898                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1898                     ; 718 {
1899                     .text:	section	.text,new
1900  0000               _SPI_GetITStatus:
1902  0000 89            	pushw	x
1903  0001 5203          	subw	sp,#3
1904       00000003      OFST:	set	3
1907                     ; 719   ITStatus pendingbitstatus = RESET;
1909                     ; 720   uint8_t itpos = 0;
1911                     ; 721   uint8_t itmask1 = 0;
1913                     ; 722   uint8_t itmask2 = 0;
1915                     ; 723   __IO uint8_t enablestatus = 0;
1917  0003 0f02          	clr	(OFST-1,sp)
1919                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1921                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1923  0005 7b08          	ld	a,(OFST+5,sp)
1924  0007 a40f          	and	a,#15
1925  0009 5f            	clrw	x
1926  000a 97            	ld	xl,a
1927  000b a601          	ld	a,#1
1928  000d 5d            	tnzw	x
1929  000e 2704          	jreq	L06
1930  0010               L26:
1931  0010 48            	sll	a
1932  0011 5a            	decw	x
1933  0012 26fc          	jrne	L26
1934  0014               L06:
1935  0014 6b01          	ld	(OFST-2,sp),a
1937                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1939  0016 7b08          	ld	a,(OFST+5,sp)
1940  0018 4e            	swap	a
1941  0019 a40f          	and	a,#15
1942  001b 6b03          	ld	(OFST+0,sp),a
1944                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1946  001d 5f            	clrw	x
1947  001e 97            	ld	xl,a
1948  001f a601          	ld	a,#1
1949  0021 5d            	tnzw	x
1950  0022 2704          	jreq	L46
1951  0024               L66:
1952  0024 48            	sll	a
1953  0025 5a            	decw	x
1954  0026 26fc          	jrne	L66
1955  0028               L46:
1956  0028 6b03          	ld	(OFST+0,sp),a
1958                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1960  002a 1e04          	ldw	x,(OFST+1,sp)
1961  002c e603          	ld	a,(3,x)
1962  002e 1403          	and	a,(OFST+0,sp)
1963  0030 6b02          	ld	(OFST-1,sp),a
1965                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1967  0032 e602          	ld	a,(2,x)
1968  0034 1501          	bcp	a,(OFST-2,sp)
1969  0036 2708          	jreq	L3311
1971  0038 0d02          	tnz	(OFST-1,sp)
1972  003a 2704          	jreq	L3311
1973                     ; 738     pendingbitstatus = SET;
1975  003c a601          	ld	a,#1
1978  003e 2001          	jra	L5311
1979  0040               L3311:
1980                     ; 743     pendingbitstatus = RESET;
1982  0040 4f            	clr	a
1984  0041               L5311:
1985                     ; 746   return  pendingbitstatus;
1989  0041 5b05          	addw	sp,#5
1990  0043 81            	ret	
2045                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2045                     ; 765 {
2046                     .text:	section	.text,new
2047  0000               _SPI_ClearITPendingBit:
2049  0000 89            	pushw	x
2050  0001 88            	push	a
2051       00000001      OFST:	set	1
2054                     ; 766   uint8_t itpos = 0;
2056                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2058                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2060  0002 7b06          	ld	a,(OFST+5,sp)
2061  0004 4e            	swap	a
2062  0005 a40f          	and	a,#15
2063  0007 5f            	clrw	x
2064  0008 97            	ld	xl,a
2065  0009 a601          	ld	a,#1
2066  000b 5d            	tnzw	x
2067  000c 2704          	jreq	L27
2068  000e               L47:
2069  000e 48            	sll	a
2070  000f 5a            	decw	x
2071  0010 26fc          	jrne	L47
2072  0012               L27:
2073  0012 6b01          	ld	(OFST+0,sp),a
2075                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2077  0014 43            	cpl	a
2078  0015 1e02          	ldw	x,(OFST+1,sp)
2079  0017 e703          	ld	(3,x),a
2080                     ; 776 }
2083  0019 5b03          	addw	sp,#3
2084  001b 81            	ret	
2097                     	xdef	_SPI_ClearITPendingBit
2098                     	xdef	_SPI_GetITStatus
2099                     	xdef	_SPI_ClearFlag
2100                     	xdef	_SPI_GetFlagStatus
2101                     	xdef	_SPI_ITConfig
2102                     	xdef	_SPI_DMACmd
2103                     	xdef	_SPI_GetCRCPolynomial
2104                     	xdef	_SPI_ResetCRC
2105                     	xdef	_SPI_GetCRC
2106                     	xdef	_SPI_CalculateCRCCmd
2107                     	xdef	_SPI_TransmitCRC
2108                     	xdef	_SPI_ReceiveData
2109                     	xdef	_SPI_SendData
2110                     	xdef	_SPI_BiDirectionalLineConfig
2111                     	xdef	_SPI_NSSInternalSoftwareCmd
2112                     	xdef	_SPI_Cmd
2113                     	xdef	_SPI_Init
2114                     	xdef	_SPI_DeInit
2133                     	end
