   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 130 void TIM4_DeInit(void)
  50                     ; 131 {
  52                     .text:	section	.text,new
  53  0000               _TIM4_DeInit:
  57                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  59  0000 725f52e0      	clr	21216
  60                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  62  0004 725f52e1      	clr	21217
  63                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  65  0008 725f52e2      	clr	21218
  66                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  68  000c 725f52e4      	clr	21220
  69                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  71  0010 725f52e7      	clr	21223
  72                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  74  0014 725f52e8      	clr	21224
  75                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  77  0018 35ff52e9      	mov	21225,#255
  78                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  80  001c 725f52e5      	clr	21221
  81                     ; 140 }
  84  0020 81            	ret	
 250                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 250                     ; 166                        uint8_t TIM4_Period)
 250                     ; 167 {
 251                     .text:	section	.text,new
 252  0000               _TIM4_TimeBaseInit:
 256                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 258                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 260  0000 9f            	ld	a,xl
 261  0001 c752e9        	ld	21225,a
 262                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 264  0004 9e            	ld	a,xh
 265  0005 c752e8        	ld	21224,a
 266                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 268  0008 350152e6      	mov	21222,#1
 269                     ; 177 }
 272  000c 81            	ret	
 340                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 340                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 340                     ; 207 {
 341                     .text:	section	.text,new
 342  0000               _TIM4_PrescalerConfig:
 346                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 348                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 350                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 352  0000 9e            	ld	a,xh
 353  0001 c752e8        	ld	21224,a
 354                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 356  0004 9f            	ld	a,xl
 357  0005 4a            	dec	a
 358  0006 2605          	jrne	L731
 359                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 361  0008 721052e6      	bset	21222,#0
 364  000c 81            	ret	
 365  000d               L731:
 366                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 368  000d 721152e6      	bres	21222,#0
 369                     ; 224 }
 372  0011 81            	ret	
 404                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 404                     ; 233 {
 405                     .text:	section	.text,new
 406  0000               _TIM4_SetCounter:
 410                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 412  0000 c752e7        	ld	21223,a
 413                     ; 236 }
 416  0003 81            	ret	
 448                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 448                     ; 245 {
 449                     .text:	section	.text,new
 450  0000               _TIM4_SetAutoreload:
 454                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 456  0000 c752e9        	ld	21225,a
 457                     ; 248 }
 460  0003 81            	ret	
 492                     ; 255 uint8_t TIM4_GetCounter(void)
 492                     ; 256 {
 493                     .text:	section	.text,new
 494  0000               _TIM4_GetCounter:
 496       00000001      OFST:	set	1
 499                     ; 257   uint8_t tmpcntr = 0;
 501                     ; 258   tmpcntr = TIM4->CNTR;
 503  0000 c652e7        	ld	a,21223
 505                     ; 260   return ((uint8_t)tmpcntr);
 509  0003 81            	ret	
 533                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 533                     ; 285 {
 534                     .text:	section	.text,new
 535  0000               _TIM4_GetPrescaler:
 539                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 541  0000 c652e8        	ld	a,21224
 544  0003 81            	ret	
 600                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 600                     ; 297 {
 601                     .text:	section	.text,new
 602  0000               _TIM4_UpdateDisableConfig:
 606                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 608                     ; 302   if (NewState != DISABLE)
 610  0000 4d            	tnz	a
 611  0001 2705          	jreq	L542
 612                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 614  0003 721252e0      	bset	21216,#1
 617  0007 81            	ret	
 618  0008               L542:
 619                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 621  0008 721352e0      	bres	21216,#1
 622                     ; 310 }
 625  000c 81            	ret	
 683                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 683                     ; 321 {
 684                     .text:	section	.text,new
 685  0000               _TIM4_UpdateRequestConfig:
 689                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 691                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 693  0000 4a            	dec	a
 694  0001 2605          	jrne	L772
 695                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 697  0003 721452e0      	bset	21216,#2
 700  0007 81            	ret	
 701  0008               L772:
 702                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 704  0008 721552e0      	bres	21216,#2
 705                     ; 334 }
 708  000c 81            	ret	
 744                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 744                     ; 343 {
 745                     .text:	section	.text,new
 746  0000               _TIM4_ARRPreloadConfig:
 750                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 752                     ; 348   if (NewState != DISABLE)
 754  0000 4d            	tnz	a
 755  0001 2705          	jreq	L123
 756                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 758  0003 721e52e0      	bset	21216,#7
 761  0007 81            	ret	
 762  0008               L123:
 763                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 765  0008 721f52e0      	bres	21216,#7
 766                     ; 356 }
 769  000c 81            	ret	
 826                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 826                     ; 367 {
 827                     .text:	section	.text,new
 828  0000               _TIM4_SelectOnePulseMode:
 832                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 834                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 836  0000 4a            	dec	a
 837  0001 2605          	jrne	L353
 838                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 840  0003 721652e0      	bset	21216,#3
 843  0007 81            	ret	
 844  0008               L353:
 845                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 847  0008 721752e0      	bres	21216,#3
 848                     ; 380 }
 851  000c 81            	ret	
 886                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 886                     ; 389 {
 887                     .text:	section	.text,new
 888  0000               _TIM4_Cmd:
 892                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 894                     ; 394   if (NewState != DISABLE)
 896  0000 4d            	tnz	a
 897  0001 2705          	jreq	L573
 898                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 900  0003 721052e0      	bset	21216,#0
 903  0007 81            	ret	
 904  0008               L573:
 905                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 907  0008 721152e0      	bres	21216,#0
 908                     ; 402 }
 911  000c 81            	ret	
 976                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 976                     ; 431 {
 977                     .text:	section	.text,new
 978  0000               _TIM4_ITConfig:
 980  0000 89            	pushw	x
 981       00000000      OFST:	set	0
 984                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 986                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 988                     ; 436   if (NewState != DISABLE)
 990  0001 9f            	ld	a,xl
 991  0002 4d            	tnz	a
 992  0003 2706          	jreq	L334
 993                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 995  0005 9e            	ld	a,xh
 996  0006 ca52e4        	or	a,21220
 998  0009 2006          	jra	L534
 999  000b               L334:
1000                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1002  000b 7b01          	ld	a,(OFST+1,sp)
1003  000d 43            	cpl	a
1004  000e c452e4        	and	a,21220
1005  0011               L534:
1006  0011 c752e4        	ld	21220,a
1007                     ; 446 }
1010  0014 85            	popw	x
1011  0015 81            	ret	
1068                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1068                     ; 457 {
1069                     .text:	section	.text,new
1070  0000               _TIM4_GenerateEvent:
1074                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1076                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1078  0000 ca52e6        	or	a,21222
1079  0003 c752e6        	ld	21222,a
1080                     ; 463 }
1083  0006 81            	ret	
1169                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1169                     ; 475 {
1170                     .text:	section	.text,new
1171  0000               _TIM4_GetFlagStatus:
1173       00000001      OFST:	set	1
1176                     ; 476   FlagStatus bitstatus = RESET;
1178                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1180                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1182  0000 c452e5        	and	a,21221
1183  0003 2702          	jreq	L725
1184                     ; 483     bitstatus = SET;
1186  0005 a601          	ld	a,#1
1189  0007               L725:
1190                     ; 487     bitstatus = RESET;
1193                     ; 489   return ((FlagStatus)bitstatus);
1197  0007 81            	ret	
1232                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1232                     ; 501 {
1233                     .text:	section	.text,new
1234  0000               _TIM4_ClearFlag:
1238                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1240                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1242  0000 43            	cpl	a
1243  0001 c752e5        	ld	21221,a
1244                     ; 506 }
1247  0004 81            	ret	
1307                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1307                     ; 519 {
1308                     .text:	section	.text,new
1309  0000               _TIM4_GetITStatus:
1311  0000 88            	push	a
1312  0001 89            	pushw	x
1313       00000002      OFST:	set	2
1316                     ; 520   ITStatus bitstatus = RESET;
1318                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1322                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1324                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1326  0002 c452e5        	and	a,21221
1327  0005 6b01          	ld	(OFST-1,sp),a
1329                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1331  0007 c652e4        	ld	a,21220
1332  000a 1403          	and	a,(OFST+1,sp)
1333  000c 6b02          	ld	(OFST+0,sp),a
1335                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1337  000e 7b01          	ld	a,(OFST-1,sp)
1338  0010 2708          	jreq	L775
1340  0012 7b02          	ld	a,(OFST+0,sp)
1341  0014 2704          	jreq	L775
1342                     ; 533     bitstatus = (ITStatus)SET;
1344  0016 a601          	ld	a,#1
1347  0018 2001          	jra	L106
1348  001a               L775:
1349                     ; 537     bitstatus = (ITStatus)RESET;
1351  001a 4f            	clr	a
1353  001b               L106:
1354                     ; 539   return ((ITStatus)bitstatus);
1358  001b 5b03          	addw	sp,#3
1359  001d 81            	ret	
1395                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1395                     ; 551 {
1396                     .text:	section	.text,new
1397  0000               _TIM4_ClearITPendingBit:
1401                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1403                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1405  0000 43            	cpl	a
1406  0001 c752e5        	ld	21221,a
1407                     ; 557 }
1410  0004 81            	ret	
1469                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1469                     ; 569 {
1470                     .text:	section	.text,new
1471  0000               _TIM4_DMACmd:
1473  0000 89            	pushw	x
1474       00000000      OFST:	set	0
1477                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1479                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1481                     ; 574   if (NewState != DISABLE)
1483  0001 9f            	ld	a,xl
1484  0002 4d            	tnz	a
1485  0003 2706          	jreq	L156
1486                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1488  0005 9e            	ld	a,xh
1489  0006 ca52e3        	or	a,21219
1491  0009 2006          	jra	L356
1492  000b               L156:
1493                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1495  000b 7b01          	ld	a,(OFST+1,sp)
1496  000d 43            	cpl	a
1497  000e c452e3        	and	a,21219
1498  0011               L356:
1499  0011 c752e3        	ld	21219,a
1500                     ; 584 }
1503  0014 85            	popw	x
1504  0015 81            	ret	
1528                     ; 607 void TIM4_InternalClockConfig(void)
1528                     ; 608 {
1529                     .text:	section	.text,new
1530  0000               _TIM4_InternalClockConfig:
1534                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1536  0000 c652e2        	ld	a,21218
1537  0003 a4f8          	and	a,#248
1538  0005 c752e2        	ld	21218,a
1539                     ; 611 }
1542  0008 81            	ret	
1624                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1624                     ; 652 {
1625                     .text:	section	.text,new
1626  0000               _TIM4_SelectInputTrigger:
1628  0000 88            	push	a
1629  0001 88            	push	a
1630       00000001      OFST:	set	1
1633                     ; 653   uint8_t tmpsmcr = 0;
1635                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1637                     ; 658   tmpsmcr = TIM4->SMCR;
1639  0002 c652e2        	ld	a,21218
1641                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1643  0005 a48f          	and	a,#143
1645                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1647  0007 1a02          	or	a,(OFST+1,sp)
1649                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1651  0009 c752e2        	ld	21218,a
1652                     ; 665 }
1655  000c 85            	popw	x
1656  000d 81            	ret	
1729                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1729                     ; 677 {
1730                     .text:	section	.text,new
1731  0000               _TIM4_SelectOutputTrigger:
1733  0000 88            	push	a
1734  0001 88            	push	a
1735       00000001      OFST:	set	1
1738                     ; 678   uint8_t tmpcr2 = 0;
1740                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1742                     ; 683   tmpcr2 = TIM4->CR2;
1744  0002 c652e1        	ld	a,21217
1746                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1748  0005 a48f          	and	a,#143
1750                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1752  0007 1a02          	or	a,(OFST+1,sp)
1754                     ; 691   TIM4->CR2 = tmpcr2;
1756  0009 c752e1        	ld	21217,a
1757                     ; 692 }
1760  000c 85            	popw	x
1761  000d 81            	ret	
1850                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1850                     ; 707 {
1851                     .text:	section	.text,new
1852  0000               _TIM4_SelectSlaveMode:
1854  0000 88            	push	a
1855  0001 88            	push	a
1856       00000001      OFST:	set	1
1859                     ; 708   uint8_t tmpsmcr = 0;
1861                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1863                     ; 713   tmpsmcr = TIM4->SMCR;
1865  0002 c652e2        	ld	a,21218
1867                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1869  0005 a4f8          	and	a,#248
1871                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1873  0007 1a02          	or	a,(OFST+1,sp)
1875                     ; 721   TIM4->SMCR = tmpsmcr;
1877  0009 c752e2        	ld	21218,a
1878                     ; 722 }
1881  000c 85            	popw	x
1882  000d 81            	ret	
1918                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1918                     ; 731 {
1919                     .text:	section	.text,new
1920  0000               _TIM4_SelectMasterSlaveMode:
1924                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1926                     ; 736   if (NewState != DISABLE)
1928  0000 4d            	tnz	a
1929  0001 2705          	jreq	L7201
1930                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1932  0003 721e52e2      	bset	21218,#7
1935  0007 81            	ret	
1936  0008               L7201:
1937                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1939  0008 721f52e2      	bres	21218,#7
1940                     ; 744 }
1943  000c 81            	ret	
1956                     	xdef	_TIM4_SelectMasterSlaveMode
1957                     	xdef	_TIM4_SelectSlaveMode
1958                     	xdef	_TIM4_SelectOutputTrigger
1959                     	xdef	_TIM4_SelectInputTrigger
1960                     	xdef	_TIM4_InternalClockConfig
1961                     	xdef	_TIM4_DMACmd
1962                     	xdef	_TIM4_ClearITPendingBit
1963                     	xdef	_TIM4_GetITStatus
1964                     	xdef	_TIM4_ClearFlag
1965                     	xdef	_TIM4_GetFlagStatus
1966                     	xdef	_TIM4_GenerateEvent
1967                     	xdef	_TIM4_ITConfig
1968                     	xdef	_TIM4_Cmd
1969                     	xdef	_TIM4_SelectOnePulseMode
1970                     	xdef	_TIM4_ARRPreloadConfig
1971                     	xdef	_TIM4_UpdateRequestConfig
1972                     	xdef	_TIM4_UpdateDisableConfig
1973                     	xdef	_TIM4_GetPrescaler
1974                     	xdef	_TIM4_GetCounter
1975                     	xdef	_TIM4_SetAutoreload
1976                     	xdef	_TIM4_SetCounter
1977                     	xdef	_TIM4_PrescalerConfig
1978                     	xdef	_TIM4_TimeBaseInit
1979                     	xdef	_TIM4_DeInit
1998                     	end
