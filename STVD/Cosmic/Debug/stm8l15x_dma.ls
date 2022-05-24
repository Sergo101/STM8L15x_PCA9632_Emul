   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 140 void DMA_GlobalDeInit(void)
  50                     ; 141 {
  52                     .text:	section	.text,new
  53  0000               _DMA_GlobalDeInit:
  57                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  59  0000 72115070      	bres	20592,#0
  60                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  62  0004 35fc5070      	mov	20592,#252
  63                     ; 147 }
  66  0008 81            	ret	
 182                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 182                     ; 156 {
 183                     .text:	section	.text,new
 184  0000               _DMA_DeInit:
 186  0000 89            	pushw	x
 187       00000000      OFST:	set	0
 190                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 192                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 194  0001 f6            	ld	a,(x)
 195  0002 a4fe          	and	a,#254
 196  0004 f7            	ld	(x),a
 197                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 199  0005 7f            	clr	(x)
 200                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 202  0006 6f02          	clr	(2,x)
 203                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 205  0008 a35093        	cpw	x,#20627
 206  000b 2608          	jrne	L501
 207                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 209  000d a640          	ld	a,#64
 210  000f e703          	ld	(3,x),a
 211                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 213  0011 6f05          	clr	(5,x)
 215  0013 2004          	jra	L701
 216  0015               L501:
 217                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 219  0015 a652          	ld	a,#82
 220  0017 e703          	ld	(3,x),a
 221  0019               L701:
 222                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 224  0019 1e01          	ldw	x,(OFST+1,sp)
 225  001b 6f04          	clr	(4,x)
 226                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 228  001d 6f06          	clr	(6,x)
 229                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 231  001f 6f07          	clr	(7,x)
 232                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 234  0021 6f01          	clr	(1,x)
 235                     ; 187 }
 238  0023 85            	popw	x
 239  0024 81            	ret	
 479                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 479                     ; 225               uint32_t DMA_Memory0BaseAddr,
 479                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 479                     ; 227               uint8_t DMA_BufferSize,
 479                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 479                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 479                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 479                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 479                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 479                     ; 233 {
 480                     .text:	section	.text,new
 481  0000               _DMA_Init:
 483       fffffffe      OFST: set -2
 486                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 488                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 490                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 492                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 494                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 496                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 498                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 500  0000 f6            	ld	a,(x)
 501  0001 a4fe          	and	a,#254
 502  0003 f7            	ld	(x),a
 503                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 505  0004 7f            	clr	(x)
 506                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 506                     ; 251                                            (uint8_t)DMA_Mode) | \
 506                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 508  0005 7b0a          	ld	a,(OFST+12,sp)
 509  0007 1a0b          	or	a,(OFST+13,sp)
 510  0009 1a0c          	or	a,(OFST+14,sp)
 511  000b fa            	or	a,(x)
 512  000c f7            	ld	(x),a
 513                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 515  000d e601          	ld	a,(1,x)
 516  000f a4c7          	and	a,#199
 517  0011 e701          	ld	(1,x),a
 518                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 518                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 520  0013 7b0d          	ld	a,(OFST+15,sp)
 521  0015 1a0e          	or	a,(OFST+16,sp)
 522  0017 ea01          	or	a,(1,x)
 523  0019 e701          	ld	(1,x),a
 524                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 526  001b 7b09          	ld	a,(OFST+11,sp)
 527  001d e702          	ld	(2,x),a
 528                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 530  001f 7b07          	ld	a,(OFST+9,sp)
 531  0021 e703          	ld	(3,x),a
 532                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 534  0023 7b08          	ld	a,(OFST+10,sp)
 535  0025 e704          	ld	(4,x),a
 536                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 538  0027 a35093        	cpw	x,#20627
 539  002a 2604          	jrne	L142
 540                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 542  002c 7b04          	ld	a,(OFST+6,sp)
 543  002e e705          	ld	(5,x),a
 544  0030               L142:
 545                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 547  0030 7b05          	ld	a,(OFST+7,sp)
 548  0032 e706          	ld	(6,x),a
 549                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 551  0034 7b06          	ld	a,(OFST+8,sp)
 552  0036 e707          	ld	(7,x),a
 553                     ; 280 }
 556  0038 81            	ret	
 611                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 611                     ; 289 {
 612                     .text:	section	.text,new
 613  0000               _DMA_GlobalCmd:
 617                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 619                     ; 293   if (NewState != DISABLE)
 621  0000 4d            	tnz	a
 622  0001 2705          	jreq	L172
 623                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 625  0003 72105070      	bset	20592,#0
 628  0007 81            	ret	
 629  0008               L172:
 630                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 632  0008 72115070      	bres	20592,#0
 633                     ; 303 }
 636  000c 81            	ret	
 683                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 683                     ; 315 {
 684                     .text:	section	.text,new
 685  0000               _DMA_Cmd:
 687       fffffffe      OFST: set -2
 690                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 692                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 694                     ; 320   if (NewState != DISABLE)
 696  0000 7b03          	ld	a,(OFST+5,sp)
 697  0002 2705          	jreq	L123
 698                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 700  0004 f6            	ld	a,(x)
 701  0005 aa01          	or	a,#1
 703  0007 2003          	jra	L323
 704  0009               L123:
 705                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 707  0009 f6            	ld	a,(x)
 708  000a a4fe          	and	a,#254
 709  000c               L323:
 710  000c f7            	ld	(x),a
 711                     ; 330 }
 714  000d 81            	ret	
 746                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 746                     ; 343 {
 747                     .text:	section	.text,new
 748  0000               _DMA_SetTimeOut:
 752                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 754                     ; 348   DMA1->GCSR = 0;
 756  0000 725f5070      	clr	20592
 757                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 759  0004 48            	sll	a
 760  0005 48            	sll	a
 761  0006 c75070        	ld	20592,a
 762                     ; 351 }
 765  0009 81            	ret	
 810                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 810                     ; 402 {
 811                     .text:	section	.text,new
 812  0000               _DMA_SetCurrDataCounter:
 814       fffffffe      OFST: set -2
 817                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 819                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 821  0000 7b03          	ld	a,(OFST+5,sp)
 822  0002 e702          	ld	(2,x),a
 823                     ; 408 }
 826  0004 81            	ret	
 864                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 864                     ; 416 {
 865                     .text:	section	.text,new
 866  0000               _DMA_GetCurrDataCounter:
 870                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 872                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 874  0000 e602          	ld	a,(2,x)
 877  0002 81            	ret	
 954                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 954                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 954                     ; 484                   FunctionalState NewState)
 954                     ; 485 {
 955                     .text:	section	.text,new
 956  0000               _DMA_ITConfig:
 958       fffffffe      OFST: set -2
 961                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 963                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 965                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 967                     ; 491   if (NewState != DISABLE)
 969  0000 7b04          	ld	a,(OFST+6,sp)
 970  0002 2705          	jreq	L344
 971                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 973  0004 f6            	ld	a,(x)
 974  0005 1a03          	or	a,(OFST+5,sp)
 976  0007 2004          	jra	L544
 977  0009               L344:
 978                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 980  0009 7b03          	ld	a,(OFST+5,sp)
 981  000b 43            	cpl	a
 982  000c f4            	and	a,(x)
 983  000d               L544:
 984  000d f7            	ld	(x),a
 985                     ; 501 }
 988  000e 81            	ret	
1233                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1233                     ; 531 {
1234                     .text:	section	.text,new
1235  0000               _DMA_GetFlagStatus:
1237  0000 89            	pushw	x
1238  0001 5204          	subw	sp,#4
1239       00000004      OFST:	set	4
1242                     ; 532   FlagStatus flagstatus = RESET;
1244                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1246                     ; 534   uint8_t tmpgir1 = 0;
1248                     ; 535   uint8_t tmpgcsr = 0;
1250                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1252                     ; 541   tmpgcsr = DMA1->GCSR;
1254  0003 c65070        	ld	a,20592
1255  0006 6b04          	ld	(OFST+0,sp),a
1257                     ; 542   tmpgir1 = DMA1->GIR1;
1259  0008 c65071        	ld	a,20593
1260  000b 6b01          	ld	(OFST-3,sp),a
1262                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1264  000d 01            	rrwa	x,a
1265  000e 9f            	ld	a,xl
1266  000f a40f          	and	a,#15
1267  0011 97            	ld	xl,a
1268  0012 4f            	clr	a
1269  0013 02            	rlwa	x,a
1270  0014 5d            	tnzw	x
1271  0015 2728          	jreq	L175
1272                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1274  0017 7b05          	ld	a,(OFST+1,sp)
1275  0019 a501          	bcp	a,#1
1276  001b 2705          	jreq	L375
1277                     ; 549       DMA_Channelx = DMA1_Channel0;
1279  001d ae5075        	ldw	x,#20597
1281  0020 2015          	jra	L575
1282  0022               L375:
1283                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1285  0022 a502          	bcp	a,#2
1286  0024 2705          	jreq	L775
1287                     ; 553       DMA_Channelx = DMA1_Channel1;
1289  0026 ae507f        	ldw	x,#20607
1291  0029 200c          	jra	L575
1292  002b               L775:
1293                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1295  002b a504          	bcp	a,#4
1296  002d 2705          	jreq	L306
1297                     ; 557       DMA_Channelx = DMA1_Channel2;
1299  002f ae5089        	ldw	x,#20617
1301  0032 2003          	jra	L575
1302  0034               L306:
1303                     ; 561       DMA_Channelx = DMA1_Channel3;
1305  0034 ae5093        	ldw	x,#20627
1306  0037               L575:
1307  0037 1f02          	ldw	(OFST-2,sp),x
1309                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1311  0039 e601          	ld	a,(1,x)
1312  003b 1406          	and	a,(OFST+2,sp)
1315  003d 2010          	jra	L706
1316  003f               L175:
1317                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1319  003f 7b05          	ld	a,(OFST+1,sp)
1320  0041 a510          	bcp	a,#16
1321  0043 2706          	jreq	L116
1322                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1324  0045 7b06          	ld	a,(OFST+2,sp)
1325  0047 1401          	and	a,(OFST-3,sp)
1328  0049 2004          	jra	L706
1329  004b               L116:
1330                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1332  004b 7b04          	ld	a,(OFST+0,sp)
1333  004d a402          	and	a,#2
1335  004f               L706:
1336                     ; 579   return (flagstatus);
1340  004f 5b06          	addw	sp,#6
1341  0051 81            	ret	
1388                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1388                     ; 598 {
1389                     .text:	section	.text,new
1390  0000               _DMA_ClearFlag:
1392  0000 89            	pushw	x
1393  0001 89            	pushw	x
1394       00000002      OFST:	set	2
1397                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1399                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1401                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1403  0002 01            	rrwa	x,a
1404  0003 9f            	ld	a,xl
1405  0004 a401          	and	a,#1
1406  0006 97            	ld	xl,a
1407  0007 4f            	clr	a
1408  0008 02            	rlwa	x,a
1409  0009 5d            	tnzw	x
1410  000a 2705          	jreq	L146
1411                     ; 607     DMA_Channelx = DMA1_Channel0;
1413  000c ae5075        	ldw	x,#20597
1415  000f 2017          	jra	L346
1416  0011               L146:
1417                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1419  0011 7b03          	ld	a,(OFST+1,sp)
1420  0013 a502          	bcp	a,#2
1421  0015 2705          	jreq	L546
1422                     ; 613       DMA_Channelx = DMA1_Channel1;
1424  0017 ae507f        	ldw	x,#20607
1426  001a 200c          	jra	L346
1427  001c               L546:
1428                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1430  001c a504          	bcp	a,#4
1431  001e 2705          	jreq	L156
1432                     ; 619         DMA_Channelx = DMA1_Channel2;
1434  0020 ae5089        	ldw	x,#20617
1436  0023 2003          	jra	L346
1437  0025               L156:
1438                     ; 623         DMA_Channelx = DMA1_Channel3;
1440  0025 ae5093        	ldw	x,#20627
1441  0028               L346:
1442  0028 1f01          	ldw	(OFST-1,sp),x
1444                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1446  002a 7b04          	ld	a,(OFST+2,sp)
1447  002c a406          	and	a,#6
1448  002e 43            	cpl	a
1449  002f e401          	and	a,(1,x)
1450  0031 e701          	ld	(1,x),a
1451                     ; 630 }
1454  0033 5b04          	addw	sp,#4
1455  0035 81            	ret	
1589                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1589                     ; 647 {
1590                     .text:	section	.text,new
1591  0000               _DMA_GetITStatus:
1593  0000 88            	push	a
1594  0001 5204          	subw	sp,#4
1595       00000004      OFST:	set	4
1598                     ; 648   ITStatus itstatus = RESET;
1600                     ; 649   uint8_t tmpreg = 0;
1602                     ; 650   uint8_t tmp2 = 0;
1604                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1606                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1608                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1610  0003 a510          	bcp	a,#16
1611  0005 2705          	jreq	L537
1612                     ; 659     DMA_Channelx = DMA1_Channel0;
1614  0007 ae5075        	ldw	x,#20597
1616  000a 2015          	jra	L737
1617  000c               L537:
1618                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1620  000c a520          	bcp	a,#32
1621  000e 2705          	jreq	L147
1622                     ; 665       DMA_Channelx = DMA1_Channel1;
1624  0010 ae507f        	ldw	x,#20607
1626  0013 200c          	jra	L737
1627  0015               L147:
1628                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1630  0015 a540          	bcp	a,#64
1631  0017 2705          	jreq	L547
1632                     ; 671         DMA_Channelx = DMA1_Channel2;
1634  0019 ae5089        	ldw	x,#20617
1636  001c 2003          	jra	L737
1637  001e               L547:
1638                     ; 675         DMA_Channelx = DMA1_Channel3;
1640  001e ae5093        	ldw	x,#20627
1641  0021               L737:
1642  0021 1f03          	ldw	(OFST-1,sp),x
1644                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1646  0023 e601          	ld	a,(1,x)
1648                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1650  0025 f4            	and	a,(x)
1651  0026 6b01          	ld	(OFST-3,sp),a
1653                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1655  0028 7b05          	ld	a,(OFST+1,sp)
1656  002a a406          	and	a,#6
1658                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1660  002c 1401          	and	a,(OFST-3,sp)
1662                     ; 686   return (itstatus);
1666  002e 5b05          	addw	sp,#5
1667  0030 81            	ret	
1715                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1715                     ; 705 {
1716                     .text:	section	.text,new
1717  0000               _DMA_ClearITPendingBit:
1719  0000 88            	push	a
1720  0001 89            	pushw	x
1721       00000002      OFST:	set	2
1724                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1726                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1728                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1730  0002 a510          	bcp	a,#16
1731  0004 2705          	jreq	L577
1732                     ; 713     DMA_Channelx = DMA1_Channel0;
1734  0006 ae5075        	ldw	x,#20597
1736  0009 2015          	jra	L777
1737  000b               L577:
1738                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1740  000b a520          	bcp	a,#32
1741  000d 2705          	jreq	L1001
1742                     ; 719       DMA_Channelx = DMA1_Channel1;
1744  000f ae507f        	ldw	x,#20607
1746  0012 200c          	jra	L777
1747  0014               L1001:
1748                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1750  0014 a540          	bcp	a,#64
1751  0016 2705          	jreq	L5001
1752                     ; 725         DMA_Channelx = DMA1_Channel2;
1754  0018 ae5089        	ldw	x,#20617
1756  001b 2003          	jra	L777
1757  001d               L5001:
1758                     ; 729         DMA_Channelx = DMA1_Channel3;
1760  001d ae5093        	ldw	x,#20627
1761  0020               L777:
1762  0020 1f01          	ldw	(OFST-1,sp),x
1764                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1766  0022 7b03          	ld	a,(OFST+1,sp)
1767  0024 a406          	and	a,#6
1768  0026 43            	cpl	a
1769  0027 e401          	and	a,(1,x)
1770  0029 e701          	ld	(1,x),a
1771                     ; 735 }
1774  002b 5b03          	addw	sp,#3
1775  002d 81            	ret	
1788                     	xdef	_DMA_ClearITPendingBit
1789                     	xdef	_DMA_GetITStatus
1790                     	xdef	_DMA_ClearFlag
1791                     	xdef	_DMA_GetFlagStatus
1792                     	xdef	_DMA_ITConfig
1793                     	xdef	_DMA_GetCurrDataCounter
1794                     	xdef	_DMA_SetCurrDataCounter
1795                     	xdef	_DMA_SetTimeOut
1796                     	xdef	_DMA_Cmd
1797                     	xdef	_DMA_GlobalCmd
1798                     	xdef	_DMA_Init
1799                     	xdef	_DMA_DeInit
1800                     	xdef	_DMA_GlobalDeInit
1819                     	end
