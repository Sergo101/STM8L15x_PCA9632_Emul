   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 168 void TIM5_DeInit(void)
  50                     ; 169 {
  52                     .text:	section	.text,new
  53  0000               _TIM5_DeInit:
  57                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  59  0000 725f5300      	clr	21248
  60                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  62  0004 725f5301      	clr	21249
  63                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  65  0008 725f5302      	clr	21250
  66                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  68  000c 725f5303      	clr	21251
  69                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  71  0010 725f5305      	clr	21253
  72                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  74  0014 725f5307      	clr	21255
  75                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  77  0018 725f530b      	clr	21259
  78                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  80  001c 35015309      	mov	21257,#1
  81                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  83  0020 3501530a      	mov	21258,#1
  84                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  86  0024 725f530b      	clr	21259
  87                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  89  0028 725f5309      	clr	21257
  90                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  92  002c 725f530a      	clr	21258
  93                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  95  0030 725f530c      	clr	21260
  96                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  98  0034 725f530d      	clr	21261
  99                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
 101  0038 725f530e      	clr	21262
 102                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
 104  003c 35ff530f      	mov	21263,#255
 105                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
 107  0040 35ff5310      	mov	21264,#255
 108                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 110  0044 725f5311      	clr	21265
 111                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 113  0048 725f5312      	clr	21266
 114                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 116  004c 725f5313      	clr	21267
 117                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 119  0050 725f5314      	clr	21268
 120                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 122  0054 725f5316      	clr	21270
 123                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 125  0058 35015308      	mov	21256,#1
 126                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 128  005c 725f5315      	clr	21269
 129                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 131  0060 725f5306      	clr	21254
 132                     ; 206 }
 135  0064 81            	ret	
 295                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 295                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 295                     ; 233                        uint16_t TIM5_Period)
 295                     ; 234 {
 296                     .text:	section	.text,new
 297  0000               _TIM5_TimeBaseInit:
 299       fffffffe      OFST: set -2
 302                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 304                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 306                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 308  0000 7b03          	ld	a,(OFST+5,sp)
 309  0002 c7530f        	ld	21263,a
 310                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 312  0005 7b04          	ld	a,(OFST+6,sp)
 313  0007 c75310        	ld	21264,a
 314                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 316  000a 9e            	ld	a,xh
 317  000b c7530e        	ld	21262,a
 318                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 320  000e c65300        	ld	a,21248
 321  0011 a48f          	and	a,#143
 322  0013 c75300        	ld	21248,a
 323                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 325  0016 9f            	ld	a,xl
 326  0017 ca5300        	or	a,21248
 327  001a c75300        	ld	21248,a
 328                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 330  001d 35015308      	mov	21256,#1
 331                     ; 254 }
 334  0021 81            	ret	
 402                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 402                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 402                     ; 276 {
 403                     .text:	section	.text,new
 404  0000               _TIM5_PrescalerConfig:
 408                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 410                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 412                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 414  0000 9e            	ld	a,xh
 415  0001 c7530e        	ld	21262,a
 416                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 418  0004 9f            	ld	a,xl
 419  0005 4a            	dec	a
 420  0006 2605          	jrne	L541
 421                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 423  0008 72105308      	bset	21256,#0
 426  000c 81            	ret	
 427  000d               L541:
 428                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 430  000d 72115308      	bres	21256,#0
 431                     ; 293 }
 434  0011 81            	ret	
 477                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 477                     ; 307 {
 478                     .text:	section	.text,new
 479  0000               _TIM5_CounterModeConfig:
 481  0000 88            	push	a
 482  0001 88            	push	a
 483       00000001      OFST:	set	1
 486                     ; 308   uint8_t tmpcr1 = 0;
 488                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 490                     ; 313   tmpcr1 = TIM5->CR1;
 492  0002 c65300        	ld	a,21248
 494                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 496  0005 a48f          	and	a,#143
 498                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 500  0007 1a02          	or	a,(OFST+1,sp)
 502                     ; 321   TIM5->CR1 = tmpcr1;
 504  0009 c75300        	ld	21248,a
 505                     ; 322 }
 508  000c 85            	popw	x
 509  000d 81            	ret	
 541                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 541                     ; 331 {
 542                     .text:	section	.text,new
 543  0000               _TIM5_SetCounter:
 547                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 549  0000 9e            	ld	a,xh
 550  0001 c7530c        	ld	21260,a
 551                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 553  0004 9f            	ld	a,xl
 554  0005 c7530d        	ld	21261,a
 555                     ; 336 }
 558  0008 81            	ret	
 590                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 590                     ; 345 {
 591                     .text:	section	.text,new
 592  0000               _TIM5_SetAutoreload:
 596                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 598  0000 9e            	ld	a,xh
 599  0001 c7530f        	ld	21263,a
 600                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 602  0004 9f            	ld	a,xl
 603  0005 c75310        	ld	21264,a
 604                     ; 349 }
 607  0008 81            	ret	
 653                     ; 356 uint16_t TIM5_GetCounter(void)
 653                     ; 357 {
 654                     .text:	section	.text,new
 655  0000               _TIM5_GetCounter:
 657  0000 5204          	subw	sp,#4
 658       00000004      OFST:	set	4
 661                     ; 358   uint16_t tmpcnt = 0;
 663                     ; 361   tmpcntrh = TIM5->CNTRH;
 665  0002 c6530c        	ld	a,21260
 666  0005 6b02          	ld	(OFST-2,sp),a
 668                     ; 362   tmpcntrl = TIM5->CNTRL;
 670  0007 c6530d        	ld	a,21261
 671  000a 6b01          	ld	(OFST-3,sp),a
 673                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 675  000c 5f            	clrw	x
 676  000d 97            	ld	xl,a
 677  000e 1f03          	ldw	(OFST-1,sp),x
 679                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 681  0010 5f            	clrw	x
 682  0011 7b02          	ld	a,(OFST-2,sp)
 683  0013 97            	ld	xl,a
 684  0014 7b04          	ld	a,(OFST+0,sp)
 685  0016 01            	rrwa	x,a
 686  0017 1a03          	or	a,(OFST-1,sp)
 687  0019 01            	rrwa	x,a
 689                     ; 367   return ((uint16_t)tmpcnt);
 693  001a 5b04          	addw	sp,#4
 694  001c 81            	ret	
 718                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 718                     ; 384 {
 719                     .text:	section	.text,new
 720  0000               _TIM5_GetPrescaler:
 724                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 726  0000 c6530e        	ld	a,21262
 729  0003 81            	ret	
 785                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 785                     ; 397 {
 786                     .text:	section	.text,new
 787  0000               _TIM5_UpdateDisableConfig:
 791                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 793                     ; 402   if (NewState != DISABLE)
 795  0000 4d            	tnz	a
 796  0001 2705          	jreq	L772
 797                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 799  0003 72125300      	bset	21248,#1
 802  0007 81            	ret	
 803  0008               L772:
 804                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 806  0008 72135300      	bres	21248,#1
 807                     ; 410 }
 810  000c 81            	ret	
 868                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 868                     ; 421 {
 869                     .text:	section	.text,new
 870  0000               _TIM5_UpdateRequestConfig:
 874                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 876                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 878  0000 4a            	dec	a
 879  0001 2605          	jrne	L133
 880                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 882  0003 72145300      	bset	21248,#2
 885  0007 81            	ret	
 886  0008               L133:
 887                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 889  0008 72155300      	bres	21248,#2
 890                     ; 434 }
 893  000c 81            	ret	
 929                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 929                     ; 443 {
 930                     .text:	section	.text,new
 931  0000               _TIM5_ARRPreloadConfig:
 935                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 937                     ; 448   if (NewState != DISABLE)
 939  0000 4d            	tnz	a
 940  0001 2705          	jreq	L353
 941                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 943  0003 721e5300      	bset	21248,#7
 946  0007 81            	ret	
 947  0008               L353:
 948                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 950  0008 721f5300      	bres	21248,#7
 951                     ; 456 }
 954  000c 81            	ret	
1011                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1011                     ; 467 {
1012                     .text:	section	.text,new
1013  0000               _TIM5_SelectOnePulseMode:
1017                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1019                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1021  0000 4a            	dec	a
1022  0001 2605          	jrne	L504
1023                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1025  0003 72165300      	bset	21248,#3
1028  0007 81            	ret	
1029  0008               L504:
1030                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1032  0008 72175300      	bres	21248,#3
1033                     ; 480 }
1036  000c 81            	ret	
1071                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1071                     ; 489 {
1072                     .text:	section	.text,new
1073  0000               _TIM5_Cmd:
1077                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1079                     ; 494   if (NewState != DISABLE)
1081  0000 4d            	tnz	a
1082  0001 2705          	jreq	L724
1083                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1085  0003 72105300      	bset	21248,#0
1088  0007 81            	ret	
1089  0008               L724:
1090                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1092  0008 72115300      	bres	21248,#0
1093                     ; 502 }
1096  000c 81            	ret	
1290                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1290                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1290                     ; 580                   uint16_t TIM5_Pulse,
1290                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1290                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1290                     ; 583 {
1291                     .text:	section	.text,new
1292  0000               _TIM5_OC1Init:
1294  0000 89            	pushw	x
1295  0001 88            	push	a
1296       00000001      OFST:	set	1
1299                     ; 584   uint8_t tmpccmr1 = 0;
1301                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1303                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1305                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1307                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1309                     ; 592   tmpccmr1 = TIM5->CCMR1;
1311  0002 c65309        	ld	a,21257
1312  0005 6b01          	ld	(OFST+0,sp),a
1314                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1316  0007 7211530b      	bres	21259,#0
1317                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1319  000b a48f          	and	a,#143
1320  000d 6b01          	ld	(OFST+0,sp),a
1322                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1324  000f 9e            	ld	a,xh
1325  0010 1a01          	or	a,(OFST+0,sp)
1326  0012 6b01          	ld	(OFST+0,sp),a
1328                     ; 602   TIM5->CCMR1 = tmpccmr1;
1330  0014 c75309        	ld	21257,a
1331                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1333  0017 9f            	ld	a,xl
1334  0018 4a            	dec	a
1335  0019 2606          	jrne	L145
1336                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1338  001b 7210530b      	bset	21259,#0
1340  001f 2004          	jra	L345
1341  0021               L145:
1342                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1344  0021 7211530b      	bres	21259,#0
1345  0025               L345:
1346                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1348  0025 7b08          	ld	a,(OFST+7,sp)
1349  0027 4a            	dec	a
1350  0028 2606          	jrne	L545
1351                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1353  002a 7212530b      	bset	21259,#1
1355  002e 2004          	jra	L745
1356  0030               L545:
1357                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1359  0030 7213530b      	bres	21259,#1
1360  0034               L745:
1361                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1363  0034 7b09          	ld	a,(OFST+8,sp)
1364  0036 4a            	dec	a
1365  0037 2606          	jrne	L155
1366                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1368  0039 72105316      	bset	21270,#0
1370  003d 2004          	jra	L355
1371  003f               L155:
1372                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1374  003f 72115316      	bres	21270,#0
1375  0043               L355:
1376                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1378  0043 7b06          	ld	a,(OFST+5,sp)
1379  0045 c75311        	ld	21265,a
1380                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1382  0048 7b07          	ld	a,(OFST+6,sp)
1383  004a c75312        	ld	21266,a
1384                     ; 637 }
1387  004d 5b03          	addw	sp,#3
1388  004f 81            	ret	
1467                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1467                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1467                     ; 666                   uint16_t TIM5_Pulse,
1467                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1467                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1467                     ; 669 {
1468                     .text:	section	.text,new
1469  0000               _TIM5_OC2Init:
1471  0000 89            	pushw	x
1472  0001 88            	push	a
1473       00000001      OFST:	set	1
1476                     ; 670   uint8_t tmpccmr2 = 0;
1478                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1480                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1482                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1484                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1486                     ; 678   tmpccmr2 = TIM5->CCMR2;
1488  0002 c6530a        	ld	a,21258
1489  0005 6b01          	ld	(OFST+0,sp),a
1491                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1493  0007 7219530b      	bres	21259,#4
1494                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1496  000b a48f          	and	a,#143
1497  000d 6b01          	ld	(OFST+0,sp),a
1499                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1501  000f 9e            	ld	a,xh
1502  0010 1a01          	or	a,(OFST+0,sp)
1503  0012 6b01          	ld	(OFST+0,sp),a
1505                     ; 689   TIM5->CCMR2 = tmpccmr2;
1507  0014 c7530a        	ld	21258,a
1508                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1510  0017 9f            	ld	a,xl
1511  0018 4a            	dec	a
1512  0019 2606          	jrne	L316
1513                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1515  001b 7218530b      	bset	21259,#4
1517  001f 2004          	jra	L516
1518  0021               L316:
1519                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1521  0021 7219530b      	bres	21259,#4
1522  0025               L516:
1523                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1525  0025 7b08          	ld	a,(OFST+7,sp)
1526  0027 4a            	dec	a
1527  0028 2606          	jrne	L716
1528                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1530  002a 721a530b      	bset	21259,#5
1532  002e 2004          	jra	L126
1533  0030               L716:
1534                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1536  0030 721b530b      	bres	21259,#5
1537  0034               L126:
1538                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1540  0034 7b09          	ld	a,(OFST+8,sp)
1541  0036 4a            	dec	a
1542  0037 2606          	jrne	L326
1543                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1545  0039 72145316      	bset	21270,#2
1547  003d 2004          	jra	L526
1548  003f               L326:
1549                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1551  003f 72155316      	bres	21270,#2
1552  0043               L526:
1553                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1555  0043 7b06          	ld	a,(OFST+5,sp)
1556  0045 c75313        	ld	21267,a
1557                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1559  0048 7b07          	ld	a,(OFST+6,sp)
1560  004a c75314        	ld	21268,a
1561                     ; 725 }
1564  004d 5b03          	addw	sp,#3
1565  004f 81            	ret	
1763                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1763                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1763                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1763                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1763                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1763                     ; 759 
1763                     ; 760 {
1764                     .text:	section	.text,new
1765  0000               _TIM5_BKRConfig:
1767  0000 89            	pushw	x
1768  0001 88            	push	a
1769       00000001      OFST:	set	1
1772                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1774                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1776                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1778                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1780                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1782                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1782                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1782                     ; 774                                   TIM5_AutomaticOutput));
1784  0002 7b06          	ld	a,(OFST+5,sp)
1785  0004 1a07          	or	a,(OFST+6,sp)
1786  0006 6b01          	ld	(OFST+0,sp),a
1788  0008 9f            	ld	a,xl
1789  0009 1a02          	or	a,(OFST+1,sp)
1790  000b 1a01          	or	a,(OFST+0,sp)
1791  000d 1a08          	or	a,(OFST+7,sp)
1792  000f c75315        	ld	21269,a
1793                     ; 775 }
1796  0012 5b03          	addw	sp,#3
1797  0014 81            	ret	
1833                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1833                     ; 784 {
1834                     .text:	section	.text,new
1835  0000               _TIM5_CtrlPWMOutputs:
1839                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1841                     ; 790   if (NewState != DISABLE)
1843  0000 4d            	tnz	a
1844  0001 2705          	jreq	L757
1845                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1847  0003 721e5315      	bset	21269,#7
1850  0007 81            	ret	
1851  0008               L757:
1852                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1854  0008 721f5315      	bres	21269,#7
1855                     ; 798 }
1858  000c 81            	ret	
1923                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1923                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1923                     ; 820 {
1924                     .text:	section	.text,new
1925  0000               _TIM5_SelectOCxM:
1927  0000 89            	pushw	x
1928       00000000      OFST:	set	0
1931                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1933                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1935                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1937  0001 9e            	ld	a,xh
1938  0002 4d            	tnz	a
1939  0003 2615          	jrne	L5101
1940                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1942  0005 7211530b      	bres	21259,#0
1943                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1945  0009 c65309        	ld	a,21257
1946  000c a48f          	and	a,#143
1947  000e c75309        	ld	21257,a
1948                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1950  0011 9f            	ld	a,xl
1951  0012 ca5309        	or	a,21257
1952  0015 c75309        	ld	21257,a
1954  0018 2014          	jra	L7101
1955  001a               L5101:
1956                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1958  001a 7219530b      	bres	21259,#4
1959                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1961  001e c6530a        	ld	a,21258
1962  0021 a48f          	and	a,#143
1963  0023 c7530a        	ld	21258,a
1964                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1966  0026 c6530a        	ld	a,21258
1967  0029 1a02          	or	a,(OFST+2,sp)
1968  002b c7530a        	ld	21258,a
1969  002e               L7101:
1970                     ; 847 }
1973  002e 85            	popw	x
1974  002f 81            	ret	
2006                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
2006                     ; 856 {
2007                     .text:	section	.text,new
2008  0000               _TIM5_SetCompare1:
2012                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2014  0000 9e            	ld	a,xh
2015  0001 c75311        	ld	21265,a
2016                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2018  0004 9f            	ld	a,xl
2019  0005 c75312        	ld	21266,a
2020                     ; 860 }
2023  0008 81            	ret	
2055                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2055                     ; 869 {
2056                     .text:	section	.text,new
2057  0000               _TIM5_SetCompare2:
2061                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2063  0000 9e            	ld	a,xh
2064  0001 c75313        	ld	21267,a
2065                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2067  0004 9f            	ld	a,xl
2068  0005 c75314        	ld	21268,a
2069                     ; 873 }
2072  0008 81            	ret	
2137                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2137                     ; 884 {
2138                     .text:	section	.text,new
2139  0000               _TIM5_ForcedOC1Config:
2141  0000 88            	push	a
2142  0001 88            	push	a
2143       00000001      OFST:	set	1
2146                     ; 885   uint8_t tmpccmr1 = 0;
2148                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2150                     ; 890   tmpccmr1 = TIM5->CCMR1;
2152  0002 c65309        	ld	a,21257
2154                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2156  0005 a48f          	and	a,#143
2158                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2160  0007 1a02          	or	a,(OFST+1,sp)
2162                     ; 898   TIM5->CCMR1 = tmpccmr1;
2164  0009 c75309        	ld	21257,a
2165                     ; 899 }
2168  000c 85            	popw	x
2169  000d 81            	ret	
2212                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2212                     ; 910 {
2213                     .text:	section	.text,new
2214  0000               _TIM5_ForcedOC2Config:
2216  0000 88            	push	a
2217  0001 88            	push	a
2218       00000001      OFST:	set	1
2221                     ; 911   uint8_t tmpccmr2 = 0;
2223                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2225                     ; 916   tmpccmr2 = TIM5->CCMR2;
2227  0002 c6530a        	ld	a,21258
2229                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2231  0005 a48f          	and	a,#143
2233                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2235  0007 1a02          	or	a,(OFST+1,sp)
2237                     ; 924   TIM5->CCMR2 = tmpccmr2;
2239  0009 c7530a        	ld	21258,a
2240                     ; 925 }
2243  000c 85            	popw	x
2244  000d 81            	ret	
2280                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2280                     ; 934 {
2281                     .text:	section	.text,new
2282  0000               _TIM5_OC1PreloadConfig:
2286                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2288                     ; 939   if (NewState != DISABLE)
2290  0000 4d            	tnz	a
2291  0001 2705          	jreq	L7311
2292                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2294  0003 72165309      	bset	21257,#3
2297  0007 81            	ret	
2298  0008               L7311:
2299                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2301  0008 72175309      	bres	21257,#3
2302                     ; 947 }
2305  000c 81            	ret	
2341                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2341                     ; 956 {
2342                     .text:	section	.text,new
2343  0000               _TIM5_OC2PreloadConfig:
2347                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2349                     ; 961   if (NewState != DISABLE)
2351  0000 4d            	tnz	a
2352  0001 2705          	jreq	L1611
2353                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2355  0003 7216530a      	bset	21258,#3
2358  0007 81            	ret	
2359  0008               L1611:
2360                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2362  0008 7217530a      	bres	21258,#3
2363                     ; 969 }
2366  000c 81            	ret	
2401                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2401                     ; 978 {
2402                     .text:	section	.text,new
2403  0000               _TIM5_OC1FastConfig:
2407                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2409                     ; 983   if (NewState != DISABLE)
2411  0000 4d            	tnz	a
2412  0001 2705          	jreq	L3021
2413                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2415  0003 72145309      	bset	21257,#2
2418  0007 81            	ret	
2419  0008               L3021:
2420                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2422  0008 72155309      	bres	21257,#2
2423                     ; 991 }
2426  000c 81            	ret	
2461                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2461                     ; 1001 {
2462                     .text:	section	.text,new
2463  0000               _TIM5_OC2FastConfig:
2467                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2469                     ; 1006   if (NewState != DISABLE)
2471  0000 4d            	tnz	a
2472  0001 2705          	jreq	L5221
2473                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2475  0003 7214530a      	bset	21258,#2
2478  0007 81            	ret	
2479  0008               L5221:
2480                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2482  0008 7215530a      	bres	21258,#2
2483                     ; 1014 }
2486  000c 81            	ret	
2522                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2522                     ; 1025 {
2523                     .text:	section	.text,new
2524  0000               _TIM5_OC1PolarityConfig:
2528                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2530                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2532  0000 4a            	dec	a
2533  0001 2605          	jrne	L7421
2534                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2536  0003 7212530b      	bset	21259,#1
2539  0007 81            	ret	
2540  0008               L7421:
2541                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2543  0008 7213530b      	bres	21259,#1
2544                     ; 1038 }
2547  000c 81            	ret	
2583                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2583                     ; 1049 {
2584                     .text:	section	.text,new
2585  0000               _TIM5_OC2PolarityConfig:
2589                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2591                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2593  0000 4a            	dec	a
2594  0001 2605          	jrne	L1721
2595                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2597  0003 721a530b      	bset	21259,#5
2600  0007 81            	ret	
2601  0008               L1721:
2602                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2604  0008 721b530b      	bres	21259,#5
2605                     ; 1062 }
2608  000c 81            	ret	
2653                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2653                     ; 1075                  FunctionalState NewState)
2653                     ; 1076 {
2654                     .text:	section	.text,new
2655  0000               _TIM5_CCxCmd:
2657  0000 89            	pushw	x
2658       00000000      OFST:	set	0
2661                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2663                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2665                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2667  0001 9e            	ld	a,xh
2668  0002 4d            	tnz	a
2669  0003 2610          	jrne	L7131
2670                     ; 1084     if (NewState != DISABLE)
2672  0005 9f            	ld	a,xl
2673  0006 4d            	tnz	a
2674  0007 2706          	jreq	L1231
2675                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2677  0009 7210530b      	bset	21259,#0
2679  000d 2014          	jra	L5231
2680  000f               L1231:
2681                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2683  000f 7211530b      	bres	21259,#0
2684  0013 200e          	jra	L5231
2685  0015               L7131:
2686                     ; 1097     if (NewState != DISABLE)
2688  0015 7b02          	ld	a,(OFST+2,sp)
2689  0017 2706          	jreq	L7231
2690                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2692  0019 7218530b      	bset	21259,#4
2694  001d 2004          	jra	L5231
2695  001f               L7231:
2696                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2698  001f 7219530b      	bres	21259,#4
2699  0023               L5231:
2700                     ; 1106 }
2703  0023 85            	popw	x
2704  0024 81            	ret	
2866                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2866                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2866                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2866                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2866                     ; 1188                  uint8_t TIM5_ICFilter)
2866                     ; 1189 {
2867                     .text:	section	.text,new
2868  0000               _TIM5_ICInit:
2870  0000 89            	pushw	x
2871       00000000      OFST:	set	0
2874                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2876                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2878  0001 9e            	ld	a,xh
2879  0002 4d            	tnz	a
2880  0003 2614          	jrne	L5241
2881                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2883  0005 7b07          	ld	a,(OFST+7,sp)
2884  0007 88            	push	a
2885  0008 7b06          	ld	a,(OFST+6,sp)
2886  000a 97            	ld	xl,a
2887  000b 7b03          	ld	a,(OFST+3,sp)
2888  000d 95            	ld	xh,a
2889  000e cd0000        	call	L3_TI1_Config
2891  0011 84            	pop	a
2892                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2894  0012 7b06          	ld	a,(OFST+6,sp)
2895  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2898  0017 2012          	jra	L7241
2899  0019               L5241:
2900                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2902  0019 7b07          	ld	a,(OFST+7,sp)
2903  001b 88            	push	a
2904  001c 7b06          	ld	a,(OFST+6,sp)
2905  001e 97            	ld	xl,a
2906  001f 7b03          	ld	a,(OFST+3,sp)
2907  0021 95            	ld	xh,a
2908  0022 cd0000        	call	L5_TI2_Config
2910  0025 84            	pop	a
2911                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2913  0026 7b06          	ld	a,(OFST+6,sp)
2914  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2916  002b               L7241:
2917                     ; 1209 }
2920  002b 85            	popw	x
2921  002c 81            	ret	
3011                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3011                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3011                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3011                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3011                     ; 1239                      uint8_t TIM5_ICFilter)
3011                     ; 1240 {
3012                     .text:	section	.text,new
3013  0000               _TIM5_PWMIConfig:
3015  0000 89            	pushw	x
3016  0001 89            	pushw	x
3017       00000002      OFST:	set	2
3020                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3022                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3024                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3026                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3028  0002 9f            	ld	a,xl
3029  0003 4d            	tnz	a
3030  0004 2605          	jrne	L1741
3031                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3033  0006 4c            	inc	a
3034  0007 6b01          	ld	(OFST-1,sp),a
3037  0009 2002          	jra	L3741
3038  000b               L1741:
3039                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3041  000b 0f01          	clr	(OFST-1,sp)
3043  000d               L3741:
3044                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3046  000d 7b07          	ld	a,(OFST+5,sp)
3047  000f 4a            	dec	a
3048  0010 2604          	jrne	L5741
3049                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3051  0012 a602          	ld	a,#2
3053  0014 2002          	jra	L7741
3054  0016               L5741:
3055                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3057  0016 a601          	ld	a,#1
3058  0018               L7741:
3059  0018 6b02          	ld	(OFST+0,sp),a
3061                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3063  001a 7b03          	ld	a,(OFST+1,sp)
3064  001c 2626          	jrne	L1051
3065                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3065                     ; 1271                TIM5_ICFilter);
3067  001e 7b09          	ld	a,(OFST+7,sp)
3068  0020 88            	push	a
3069  0021 7b08          	ld	a,(OFST+6,sp)
3070  0023 97            	ld	xl,a
3071  0024 7b05          	ld	a,(OFST+3,sp)
3072  0026 95            	ld	xh,a
3073  0027 cd0000        	call	L3_TI1_Config
3075  002a 84            	pop	a
3076                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3078  002b 7b08          	ld	a,(OFST+6,sp)
3079  002d cd0000        	call	_TIM5_SetIC1Prescaler
3081                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3083  0030 7b09          	ld	a,(OFST+7,sp)
3084  0032 88            	push	a
3085  0033 7b03          	ld	a,(OFST+1,sp)
3086  0035 97            	ld	xl,a
3087  0036 7b02          	ld	a,(OFST+0,sp)
3088  0038 95            	ld	xh,a
3089  0039 cd0000        	call	L5_TI2_Config
3091  003c 84            	pop	a
3092                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3094  003d 7b08          	ld	a,(OFST+6,sp)
3095  003f cd0000        	call	_TIM5_SetIC2Prescaler
3098  0042 2024          	jra	L3051
3099  0044               L1051:
3100                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3100                     ; 1286                TIM5_ICFilter);
3102  0044 7b09          	ld	a,(OFST+7,sp)
3103  0046 88            	push	a
3104  0047 7b08          	ld	a,(OFST+6,sp)
3105  0049 97            	ld	xl,a
3106  004a 7b05          	ld	a,(OFST+3,sp)
3107  004c 95            	ld	xh,a
3108  004d cd0000        	call	L5_TI2_Config
3110  0050 84            	pop	a
3111                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3113  0051 7b08          	ld	a,(OFST+6,sp)
3114  0053 cd0000        	call	_TIM5_SetIC2Prescaler
3116                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3118  0056 7b09          	ld	a,(OFST+7,sp)
3119  0058 88            	push	a
3120  0059 7b03          	ld	a,(OFST+1,sp)
3121  005b 97            	ld	xl,a
3122  005c 7b02          	ld	a,(OFST+0,sp)
3123  005e 95            	ld	xh,a
3124  005f cd0000        	call	L3_TI1_Config
3126  0062 84            	pop	a
3127                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3129  0063 7b08          	ld	a,(OFST+6,sp)
3130  0065 cd0000        	call	_TIM5_SetIC1Prescaler
3132  0068               L3051:
3133                     ; 1297 }
3136  0068 5b04          	addw	sp,#4
3137  006a 81            	ret	
3183                     ; 1304 uint16_t TIM5_GetCapture1(void)
3183                     ; 1305 {
3184                     .text:	section	.text,new
3185  0000               _TIM5_GetCapture1:
3187  0000 5204          	subw	sp,#4
3188       00000004      OFST:	set	4
3191                     ; 1306   uint16_t tmpccr1 = 0;
3193                     ; 1309   tmpccr1h = TIM5->CCR1H;
3195  0002 c65311        	ld	a,21265
3196  0005 6b02          	ld	(OFST-2,sp),a
3198                     ; 1310   tmpccr1l = TIM5->CCR1L;
3200  0007 c65312        	ld	a,21266
3201  000a 6b01          	ld	(OFST-3,sp),a
3203                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3205  000c 5f            	clrw	x
3206  000d 97            	ld	xl,a
3207  000e 1f03          	ldw	(OFST-1,sp),x
3209                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3211  0010 5f            	clrw	x
3212  0011 7b02          	ld	a,(OFST-2,sp)
3213  0013 97            	ld	xl,a
3214  0014 7b04          	ld	a,(OFST+0,sp)
3215  0016 01            	rrwa	x,a
3216  0017 1a03          	or	a,(OFST-1,sp)
3217  0019 01            	rrwa	x,a
3219                     ; 1315   return ((uint16_t)tmpccr1);
3223  001a 5b04          	addw	sp,#4
3224  001c 81            	ret	
3270                     ; 1323 uint16_t TIM5_GetCapture2(void)
3270                     ; 1324 {
3271                     .text:	section	.text,new
3272  0000               _TIM5_GetCapture2:
3274  0000 5204          	subw	sp,#4
3275       00000004      OFST:	set	4
3278                     ; 1325   uint16_t tmpccr2 = 0;
3280                     ; 1328   tmpccr2h = TIM5->CCR2H;
3282  0002 c65313        	ld	a,21267
3283  0005 6b02          	ld	(OFST-2,sp),a
3285                     ; 1329   tmpccr2l = TIM5->CCR2L;
3287  0007 c65314        	ld	a,21268
3288  000a 6b01          	ld	(OFST-3,sp),a
3290                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3292  000c 5f            	clrw	x
3293  000d 97            	ld	xl,a
3294  000e 1f03          	ldw	(OFST-1,sp),x
3296                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3298  0010 5f            	clrw	x
3299  0011 7b02          	ld	a,(OFST-2,sp)
3300  0013 97            	ld	xl,a
3301  0014 7b04          	ld	a,(OFST+0,sp)
3302  0016 01            	rrwa	x,a
3303  0017 1a03          	or	a,(OFST-1,sp)
3304  0019 01            	rrwa	x,a
3306                     ; 1334   return ((uint16_t)tmpccr2);
3310  001a 5b04          	addw	sp,#4
3311  001c 81            	ret	
3354                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3354                     ; 1348 {
3355                     .text:	section	.text,new
3356  0000               _TIM5_SetIC1Prescaler:
3358  0000 88            	push	a
3359  0001 88            	push	a
3360       00000001      OFST:	set	1
3363                     ; 1349   uint8_t tmpccmr1 = 0;
3365                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3367                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3369  0002 c65309        	ld	a,21257
3371                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3373  0005 a4f3          	and	a,#243
3375                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3377  0007 1a02          	or	a,(OFST+1,sp)
3379                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3381  0009 c75309        	ld	21257,a
3382                     ; 1363 }
3385  000c 85            	popw	x
3386  000d 81            	ret	
3429                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3429                     ; 1376 {
3430                     .text:	section	.text,new
3431  0000               _TIM5_SetIC2Prescaler:
3433  0000 88            	push	a
3434  0001 88            	push	a
3435       00000001      OFST:	set	1
3438                     ; 1377   uint8_t tmpccmr2 = 0;
3440                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3442                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3444  0002 c6530a        	ld	a,21258
3446                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3448  0005 a4f3          	and	a,#243
3450                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3452  0007 1a02          	or	a,(OFST+1,sp)
3454                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3456  0009 c7530a        	ld	21258,a
3457                     ; 1391 }
3460  000c 85            	popw	x
3461  000d 81            	ret	
3547                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3547                     ; 1423 {
3548                     .text:	section	.text,new
3549  0000               _TIM5_ITConfig:
3551  0000 89            	pushw	x
3552       00000000      OFST:	set	0
3555                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3557                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3559                     ; 1428   if (NewState != DISABLE)
3561  0001 9f            	ld	a,xl
3562  0002 4d            	tnz	a
3563  0003 2706          	jreq	L5461
3564                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3566  0005 9e            	ld	a,xh
3567  0006 ca5305        	or	a,21253
3569  0009 2006          	jra	L7461
3570  000b               L5461:
3571                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3573  000b 7b01          	ld	a,(OFST+1,sp)
3574  000d 43            	cpl	a
3575  000e c45305        	and	a,21253
3576  0011               L7461:
3577  0011 c75305        	ld	21253,a
3578                     ; 1438 }
3581  0014 85            	popw	x
3582  0015 81            	ret	
3663                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3663                     ; 1452 {
3664                     .text:	section	.text,new
3665  0000               _TIM5_GenerateEvent:
3669                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3671                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3673  0000 ca5308        	or	a,21256
3674  0003 c75308        	ld	21256,a
3675                     ; 1458 }
3678  0006 81            	ret	
3813                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3813                     ; 1474 {
3814                     .text:	section	.text,new
3815  0000               _TIM5_GetFlagStatus:
3817  0000 89            	pushw	x
3818  0001 89            	pushw	x
3819       00000002      OFST:	set	2
3822                     ; 1475   FlagStatus bitstatus = RESET;
3824                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3828                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3830                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3832  0002 9f            	ld	a,xl
3833  0003 c45306        	and	a,21254
3834  0006 6b01          	ld	(OFST-1,sp),a
3836                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3838  0008 c65307        	ld	a,21255
3839  000b 1403          	and	a,(OFST+1,sp)
3840  000d 6b02          	ld	(OFST+0,sp),a
3842                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3844  000f 1a01          	or	a,(OFST-1,sp)
3845  0011 2702          	jreq	L5671
3846                     ; 1486     bitstatus = SET;
3848  0013 a601          	ld	a,#1
3851  0015               L5671:
3852                     ; 1490     bitstatus = RESET;
3855                     ; 1492   return ((FlagStatus)bitstatus);
3859  0015 5b04          	addw	sp,#4
3860  0017 81            	ret	
3895                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3895                     ; 1507 {
3896                     .text:	section	.text,new
3897  0000               _TIM5_ClearFlag:
3899  0000 89            	pushw	x
3900       00000000      OFST:	set	0
3903                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3905                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3907  0001 9f            	ld	a,xl
3908  0002 43            	cpl	a
3909  0003 c75306        	ld	21254,a
3910                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3912  0006 7b01          	ld	a,(OFST+1,sp)
3913  0008 43            	cpl	a
3914  0009 c75307        	ld	21255,a
3915                     ; 1513 }
3918  000c 85            	popw	x
3919  000d 81            	ret	
3979                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
3979                     ; 1527 {
3980                     .text:	section	.text,new
3981  0000               _TIM5_GetITStatus:
3983  0000 88            	push	a
3984  0001 89            	pushw	x
3985       00000002      OFST:	set	2
3988                     ; 1528   ITStatus bitstatus = RESET;
3990                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
3994                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
3996                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
3998  0002 c45306        	and	a,21254
3999  0005 6b01          	ld	(OFST-1,sp),a
4001                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4003  0007 c65305        	ld	a,21253
4004  000a 1403          	and	a,(OFST+1,sp)
4005  000c 6b02          	ld	(OFST+0,sp),a
4007                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4009  000e 7b01          	ld	a,(OFST-1,sp)
4010  0010 2708          	jreq	L5302
4012  0012 7b02          	ld	a,(OFST+0,sp)
4013  0014 2704          	jreq	L5302
4014                     ; 1541     bitstatus = (ITStatus)SET;
4016  0016 a601          	ld	a,#1
4019  0018 2001          	jra	L7302
4020  001a               L5302:
4021                     ; 1545     bitstatus = (ITStatus)RESET;
4023  001a 4f            	clr	a
4025  001b               L7302:
4026                     ; 1547   return ((ITStatus)bitstatus);
4030  001b 5b03          	addw	sp,#3
4031  001d 81            	ret	
4067                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4067                     ; 1562 {
4068                     .text:	section	.text,new
4069  0000               _TIM5_ClearITPendingBit:
4073                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4075                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4077  0000 43            	cpl	a
4078  0001 c75306        	ld	21254,a
4079                     ; 1568 }
4082  0004 81            	ret	
4155                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4155                     ; 1582 {
4156                     .text:	section	.text,new
4157  0000               _TIM5_DMACmd:
4159  0000 89            	pushw	x
4160       00000000      OFST:	set	0
4163                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4165                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4167                     ; 1587   if (NewState != DISABLE)
4169  0001 9f            	ld	a,xl
4170  0002 4d            	tnz	a
4171  0003 2706          	jreq	L3112
4172                     ; 1590     TIM5->DER |= TIM5_DMASource;
4174  0005 9e            	ld	a,xh
4175  0006 ca5304        	or	a,21252
4177  0009 2006          	jra	L5112
4178  000b               L3112:
4179                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4181  000b 7b01          	ld	a,(OFST+1,sp)
4182  000d 43            	cpl	a
4183  000e c45304        	and	a,21252
4184  0011               L5112:
4185  0011 c75304        	ld	21252,a
4186                     ; 1597 }
4189  0014 85            	popw	x
4190  0015 81            	ret	
4225                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4225                     ; 1606 {
4226                     .text:	section	.text,new
4227  0000               _TIM5_SelectCCDMA:
4231                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4233                     ; 1610   if (NewState != DISABLE)
4235  0000 4d            	tnz	a
4236  0001 2705          	jreq	L5312
4237                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4239  0003 72165301      	bset	21249,#3
4242  0007 81            	ret	
4243  0008               L5312:
4244                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4246  0008 72175301      	bres	21249,#3
4247                     ; 1620 }
4250  000c 81            	ret	
4274                     ; 1644 void TIM5_InternalClockConfig(void)
4274                     ; 1645 {
4275                     .text:	section	.text,new
4276  0000               _TIM5_InternalClockConfig:
4280                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4282  0000 c65302        	ld	a,21250
4283  0003 a4f8          	and	a,#248
4284  0005 c75302        	ld	21250,a
4285                     ; 1648 }
4288  0008 81            	ret	
4375                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4375                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4375                     ; 1667                                  uint8_t ICFilter)
4375                     ; 1668 {
4376                     .text:	section	.text,new
4377  0000               _TIM5_TIxExternalClockConfig:
4379  0000 89            	pushw	x
4380       00000000      OFST:	set	0
4383                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4385                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4387                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4389                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4391  0001 9e            	ld	a,xh
4392  0002 a160          	cp	a,#96
4393  0004 260d          	jrne	L7022
4394                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4396  0006 7b05          	ld	a,(OFST+5,sp)
4397  0008 88            	push	a
4398  0009 9f            	ld	a,xl
4399  000a ae0001        	ldw	x,#1
4400  000d 95            	ld	xh,a
4401  000e cd0000        	call	L5_TI2_Config
4404  0011 200c          	jra	L1122
4405  0013               L7022:
4406                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4408  0013 7b05          	ld	a,(OFST+5,sp)
4409  0015 88            	push	a
4410  0016 7b03          	ld	a,(OFST+3,sp)
4411  0018 ae0001        	ldw	x,#1
4412  001b 95            	ld	xh,a
4413  001c cd0000        	call	L3_TI1_Config
4415  001f               L1122:
4416  001f 84            	pop	a
4417                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4419  0020 7b01          	ld	a,(OFST+1,sp)
4420  0022 cd0000        	call	_TIM5_SelectInputTrigger
4422                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4424  0025 c65302        	ld	a,21250
4425  0028 aa07          	or	a,#7
4426  002a c75302        	ld	21250,a
4427                     ; 1689 }
4430  002d 85            	popw	x
4431  002e 81            	ret	
4546                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4546                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4546                     ; 1709                               uint8_t ExtTRGFilter)
4546                     ; 1710 {
4547                     .text:	section	.text,new
4548  0000               _TIM5_ETRClockMode1Config:
4550  0000 89            	pushw	x
4551       00000000      OFST:	set	0
4554                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4556  0001 7b05          	ld	a,(OFST+5,sp)
4557  0003 88            	push	a
4558  0004 7b02          	ld	a,(OFST+2,sp)
4559  0006 95            	ld	xh,a
4560  0007 cd0000        	call	_TIM5_ETRConfig
4562  000a 84            	pop	a
4563                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4565  000b c65302        	ld	a,21250
4566  000e a4f8          	and	a,#248
4567  0010 c75302        	ld	21250,a
4568                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4570  0013 c65302        	ld	a,21250
4571  0016 aa07          	or	a,#7
4572  0018 c75302        	ld	21250,a
4573                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4575  001b c65302        	ld	a,21250
4576  001e a48f          	and	a,#143
4577  0020 c75302        	ld	21250,a
4578                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4580  0023 c65302        	ld	a,21250
4581  0026 aa70          	or	a,#112
4582  0028 c75302        	ld	21250,a
4583                     ; 1721 }
4586  002b 85            	popw	x
4587  002c 81            	ret	
4643                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4643                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4643                     ; 1741                               uint8_t ExtTRGFilter)
4643                     ; 1742 {
4644                     .text:	section	.text,new
4645  0000               _TIM5_ETRClockMode2Config:
4647  0000 89            	pushw	x
4648       00000000      OFST:	set	0
4651                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4653  0001 7b05          	ld	a,(OFST+5,sp)
4654  0003 88            	push	a
4655  0004 7b02          	ld	a,(OFST+2,sp)
4656  0006 95            	ld	xh,a
4657  0007 cd0000        	call	_TIM5_ETRConfig
4659  000a 721c5303      	bset	21251,#6
4660                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4662                     ; 1748 }
4665  000e 5b03          	addw	sp,#3
4666  0010 81            	ret	
4780                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4780                     ; 1800 {
4781                     .text:	section	.text,new
4782  0000               _TIM5_SelectInputTrigger:
4784  0000 88            	push	a
4785  0001 88            	push	a
4786       00000001      OFST:	set	1
4789                     ; 1801   uint8_t tmpsmcr = 0;
4791                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4793                     ; 1806   tmpsmcr = TIM5->SMCR;
4795  0002 c65302        	ld	a,21250
4797                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4799  0005 a48f          	and	a,#143
4801                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4803  0007 1a02          	or	a,(OFST+1,sp)
4805                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4807  0009 c75302        	ld	21250,a
4808                     ; 1813 }
4811  000c 85            	popw	x
4812  000d 81            	ret	
4909                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4909                     ; 1828 {
4910                     .text:	section	.text,new
4911  0000               _TIM5_SelectOutputTrigger:
4913  0000 88            	push	a
4914  0001 88            	push	a
4915       00000001      OFST:	set	1
4918                     ; 1829   uint8_t tmpcr2 = 0;
4920                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
4922                     ; 1834   tmpcr2 = TIM5->CR2;
4924  0002 c65301        	ld	a,21249
4926                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4928  0005 a48f          	and	a,#143
4930                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4932  0007 1a02          	or	a,(OFST+1,sp)
4934                     ; 1842   TIM5->CR2 = tmpcr2;
4936  0009 c75301        	ld	21249,a
4937                     ; 1843 }
4940  000c 85            	popw	x
4941  000d 81            	ret	
5022                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5022                     ; 1856 {
5023                     .text:	section	.text,new
5024  0000               _TIM5_SelectSlaveMode:
5026  0000 88            	push	a
5027  0001 88            	push	a
5028       00000001      OFST:	set	1
5031                     ; 1857   uint8_t tmpsmcr = 0;
5033                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5035                     ; 1862   tmpsmcr = TIM5->SMCR;
5037  0002 c65302        	ld	a,21250
5039                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5041  0005 a4f8          	and	a,#248
5043                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5045  0007 1a02          	or	a,(OFST+1,sp)
5047                     ; 1870   TIM5->SMCR = tmpsmcr;
5049  0009 c75302        	ld	21250,a
5050                     ; 1871 }
5053  000c 85            	popw	x
5054  000d 81            	ret	
5090                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5090                     ; 1880 {
5091                     .text:	section	.text,new
5092  0000               _TIM5_SelectMasterSlaveMode:
5096                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5098                     ; 1885   if (NewState != DISABLE)
5100  0000 4d            	tnz	a
5101  0001 2705          	jreq	L5642
5102                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5104  0003 721e5302      	bset	21250,#7
5107  0007 81            	ret	
5108  0008               L5642:
5109                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5111  0008 721f5302      	bres	21250,#7
5112                     ; 1893 }
5115  000c 81            	ret	
5169                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5169                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5169                     ; 1913                     uint8_t ExtTRGFilter)
5169                     ; 1914 {
5170                     .text:	section	.text,new
5171  0000               _TIM5_ETRConfig:
5173  0000 89            	pushw	x
5174       00000000      OFST:	set	0
5177                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5179                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5181                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5183                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5183                     ; 1922                          | (uint8_t)ExtTRGFilter);
5185  0001 9f            	ld	a,xl
5186  0002 1a01          	or	a,(OFST+1,sp)
5187  0004 1a05          	or	a,(OFST+5,sp)
5188  0006 ca5303        	or	a,21251
5189  0009 c75303        	ld	21251,a
5190                     ; 1923 }
5193  000c 85            	popw	x
5194  000d 81            	ret	
5301                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5301                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5301                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5301                     ; 1961 {
5302                     .text:	section	.text,new
5303  0000               _TIM5_EncoderInterfaceConfig:
5305  0000 89            	pushw	x
5306  0001 5203          	subw	sp,#3
5307       00000003      OFST:	set	3
5310                     ; 1962   uint8_t tmpsmcr = 0;
5312                     ; 1963   uint8_t tmpccmr1 = 0;
5314                     ; 1964   uint8_t tmpccmr2 = 0;
5316                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5318                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5320                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5322                     ; 1971   tmpsmcr = TIM5->SMCR;
5324  0003 c65302        	ld	a,21250
5325  0006 6b01          	ld	(OFST-2,sp),a
5327                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5329  0008 c65309        	ld	a,21257
5330  000b 6b02          	ld	(OFST-1,sp),a
5332                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5334  000d c6530a        	ld	a,21258
5335  0010 6b03          	ld	(OFST+0,sp),a
5337                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5339  0012 7b01          	ld	a,(OFST-2,sp)
5340  0014 a4f0          	and	a,#240
5341  0016 6b01          	ld	(OFST-2,sp),a
5343                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5345  0018 9e            	ld	a,xh
5346  0019 1a01          	or	a,(OFST-2,sp)
5347  001b 6b01          	ld	(OFST-2,sp),a
5349                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5351  001d 7b02          	ld	a,(OFST-1,sp)
5352  001f a4fc          	and	a,#252
5353  0021 6b02          	ld	(OFST-1,sp),a
5355                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5357  0023 7b03          	ld	a,(OFST+0,sp)
5358  0025 a4fc          	and	a,#252
5359  0027 6b03          	ld	(OFST+0,sp),a
5361                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5363  0029 7b02          	ld	a,(OFST-1,sp)
5364  002b aa01          	or	a,#1
5365  002d 6b02          	ld	(OFST-1,sp),a
5367                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5369  002f 7b03          	ld	a,(OFST+0,sp)
5370  0031 aa01          	or	a,#1
5371  0033 6b03          	ld	(OFST+0,sp),a
5373                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5375  0035 9f            	ld	a,xl
5376  0036 4a            	dec	a
5377  0037 2606          	jrne	L3652
5378                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5380  0039 7212530b      	bset	21259,#1
5382  003d 2004          	jra	L5652
5383  003f               L3652:
5384                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5386  003f 7213530b      	bres	21259,#1
5387  0043               L5652:
5388                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5390  0043 7b08          	ld	a,(OFST+5,sp)
5391  0045 4a            	dec	a
5392  0046 2606          	jrne	L7652
5393                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5395  0048 721a530b      	bset	21259,#5
5397  004c 2004          	jra	L1752
5398  004e               L7652:
5399                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5401  004e 721b530b      	bres	21259,#5
5402  0052               L1752:
5403                     ; 2004   TIM5->SMCR = tmpsmcr;
5405  0052 7b01          	ld	a,(OFST-2,sp)
5406  0054 c75302        	ld	21250,a
5407                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5409  0057 7b02          	ld	a,(OFST-1,sp)
5410  0059 c75309        	ld	21257,a
5411                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5413  005c 7b03          	ld	a,(OFST+0,sp)
5414  005e c7530a        	ld	21258,a
5415                     ; 2007 }
5418  0061 5b05          	addw	sp,#5
5419  0063 81            	ret	
5455                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5455                     ; 2016 {
5456                     .text:	section	.text,new
5457  0000               _TIM5_SelectHallSensor:
5461                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5463                     ; 2021   if (NewState != DISABLE)
5465  0000 4d            	tnz	a
5466  0001 2705          	jreq	L1162
5467                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5469  0003 721e5301      	bset	21249,#7
5472  0007 81            	ret	
5473  0008               L1162:
5474                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5476  0008 721f5301      	bres	21249,#7
5477                     ; 2029 }
5480  000c 81            	ret	
5546                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5546                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5546                     ; 2052                        uint8_t TIM5_ICFilter)
5546                     ; 2053 {
5547                     .text:	section	.text,new
5548  0000               L3_TI1_Config:
5550  0000 89            	pushw	x
5551  0001 89            	pushw	x
5552       00000002      OFST:	set	2
5555                     ; 2054   uint8_t tmpccmr1 = 0;
5557                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5559  0002 9e            	ld	a,xh
5560  0003 6b01          	ld	(OFST-1,sp),a
5562                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5564  0005 c65309        	ld	a,21257
5565  0008 6b02          	ld	(OFST+0,sp),a
5567                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5569                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5571                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5573                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5575  000a 7211530b      	bres	21259,#0
5576                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5578  000e a40c          	and	a,#12
5579  0010 6b02          	ld	(OFST+0,sp),a
5581                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5583  0012 7b07          	ld	a,(OFST+5,sp)
5584  0014 97            	ld	xl,a
5585  0015 a610          	ld	a,#16
5586  0017 42            	mul	x,a
5587  0018 9f            	ld	a,xl
5588  0019 1a04          	or	a,(OFST+2,sp)
5589  001b 1a02          	or	a,(OFST+0,sp)
5590  001d 6b02          	ld	(OFST+0,sp),a
5592                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5594  001f c75309        	ld	21257,a
5595                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5597  0022 7b01          	ld	a,(OFST-1,sp)
5598  0024 4a            	dec	a
5599  0025 2606          	jrne	L5462
5600                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5602  0027 7212530b      	bset	21259,#1
5604  002b 2004          	jra	L7462
5605  002d               L5462:
5606                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5608  002d 7213530b      	bres	21259,#1
5609  0031               L7462:
5610                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5612  0031 7210530b      	bset	21259,#0
5613                     ; 2084 }
5616  0035 5b04          	addw	sp,#4
5617  0037 81            	ret	
5683                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5683                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5683                     ; 2103                        uint8_t TIM5_ICFilter)
5683                     ; 2104 {
5684                     .text:	section	.text,new
5685  0000               L5_TI2_Config:
5687  0000 89            	pushw	x
5688  0001 89            	pushw	x
5689       00000002      OFST:	set	2
5692                     ; 2105   uint8_t tmpccmr2 = 0;
5694                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5696  0002 9e            	ld	a,xh
5697  0003 6b01          	ld	(OFST-1,sp),a
5699                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5701                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5703                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5705                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5707  0005 c6530a        	ld	a,21258
5708  0008 6b02          	ld	(OFST+0,sp),a
5710                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5712  000a 7219530b      	bres	21259,#4
5713                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5715  000e a40c          	and	a,#12
5716  0010 6b02          	ld	(OFST+0,sp),a
5718                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5720  0012 7b07          	ld	a,(OFST+5,sp)
5721  0014 97            	ld	xl,a
5722  0015 a610          	ld	a,#16
5723  0017 42            	mul	x,a
5724  0018 9f            	ld	a,xl
5725  0019 1a04          	or	a,(OFST+2,sp)
5726  001b 1a02          	or	a,(OFST+0,sp)
5727  001d 6b02          	ld	(OFST+0,sp),a
5729                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5731  001f c7530a        	ld	21258,a
5732                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5734  0022 7b01          	ld	a,(OFST-1,sp)
5735  0024 4a            	dec	a
5736  0025 2606          	jrne	L1072
5737                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5739  0027 721a530b      	bset	21259,#5
5741  002b 2004          	jra	L3072
5742  002d               L1072:
5743                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5745  002d 721b530b      	bres	21259,#5
5746  0031               L3072:
5747                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5749  0031 7218530b      	bset	21259,#4
5750                     ; 2136 }
5753  0035 5b04          	addw	sp,#4
5754  0037 81            	ret	
5767                     	xdef	_TIM5_SelectHallSensor
5768                     	xdef	_TIM5_EncoderInterfaceConfig
5769                     	xdef	_TIM5_ETRConfig
5770                     	xdef	_TIM5_SelectMasterSlaveMode
5771                     	xdef	_TIM5_SelectSlaveMode
5772                     	xdef	_TIM5_SelectOutputTrigger
5773                     	xdef	_TIM5_SelectInputTrigger
5774                     	xdef	_TIM5_ETRClockMode2Config
5775                     	xdef	_TIM5_ETRClockMode1Config
5776                     	xdef	_TIM5_TIxExternalClockConfig
5777                     	xdef	_TIM5_InternalClockConfig
5778                     	xdef	_TIM5_SelectCCDMA
5779                     	xdef	_TIM5_DMACmd
5780                     	xdef	_TIM5_ClearITPendingBit
5781                     	xdef	_TIM5_GetITStatus
5782                     	xdef	_TIM5_ClearFlag
5783                     	xdef	_TIM5_GetFlagStatus
5784                     	xdef	_TIM5_GenerateEvent
5785                     	xdef	_TIM5_ITConfig
5786                     	xdef	_TIM5_SetIC2Prescaler
5787                     	xdef	_TIM5_SetIC1Prescaler
5788                     	xdef	_TIM5_GetCapture2
5789                     	xdef	_TIM5_GetCapture1
5790                     	xdef	_TIM5_PWMIConfig
5791                     	xdef	_TIM5_ICInit
5792                     	xdef	_TIM5_CCxCmd
5793                     	xdef	_TIM5_OC2PolarityConfig
5794                     	xdef	_TIM5_OC1PolarityConfig
5795                     	xdef	_TIM5_OC2FastConfig
5796                     	xdef	_TIM5_OC1FastConfig
5797                     	xdef	_TIM5_OC2PreloadConfig
5798                     	xdef	_TIM5_OC1PreloadConfig
5799                     	xdef	_TIM5_ForcedOC2Config
5800                     	xdef	_TIM5_ForcedOC1Config
5801                     	xdef	_TIM5_SetCompare2
5802                     	xdef	_TIM5_SetCompare1
5803                     	xdef	_TIM5_SelectOCxM
5804                     	xdef	_TIM5_CtrlPWMOutputs
5805                     	xdef	_TIM5_BKRConfig
5806                     	xdef	_TIM5_OC2Init
5807                     	xdef	_TIM5_OC1Init
5808                     	xdef	_TIM5_Cmd
5809                     	xdef	_TIM5_SelectOnePulseMode
5810                     	xdef	_TIM5_ARRPreloadConfig
5811                     	xdef	_TIM5_UpdateRequestConfig
5812                     	xdef	_TIM5_UpdateDisableConfig
5813                     	xdef	_TIM5_GetPrescaler
5814                     	xdef	_TIM5_GetCounter
5815                     	xdef	_TIM5_SetAutoreload
5816                     	xdef	_TIM5_SetCounter
5817                     	xdef	_TIM5_CounterModeConfig
5818                     	xdef	_TIM5_PrescalerConfig
5819                     	xdef	_TIM5_TimeBaseInit
5820                     	xdef	_TIM5_DeInit
5839                     	end
