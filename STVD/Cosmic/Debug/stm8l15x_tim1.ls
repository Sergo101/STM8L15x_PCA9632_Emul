   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 181 void TIM1_DeInit(void)
  50                     ; 182 {
  52                     .text:	section	.text,new
  53  0000               _TIM1_DeInit:
  57                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  59  0000 725f52b0      	clr	21168
  60                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  62  0004 725f52b1      	clr	21169
  63                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  65  0008 725f52b2      	clr	21170
  66                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  68  000c 725f52b3      	clr	21171
  69                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  71  0010 725f52b5      	clr	21173
  72                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  74  0014 725f52bd      	clr	21181
  75                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  77  0018 725f52be      	clr	21182
  78                     ; 193   TIM1->CCMR1 = 0x01;
  80  001c 350152b9      	mov	21177,#1
  81                     ; 194   TIM1->CCMR2 = 0x01;
  83  0020 350152ba      	mov	21178,#1
  84                     ; 195   TIM1->CCMR3 = 0x01;
  86  0024 350152bb      	mov	21179,#1
  87                     ; 196   TIM1->CCMR4 = 0x01;
  89  0028 350152bc      	mov	21180,#1
  90                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  92  002c 725f52bd      	clr	21181
  93                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  95  0030 725f52be      	clr	21182
  96                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  98  0034 725f52b9      	clr	21177
  99                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 101  0038 725f52ba      	clr	21178
 102                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 104  003c 725f52bb      	clr	21179
 105                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 107  0040 725f52bc      	clr	21180
 108                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 110  0044 725f52bf      	clr	21183
 111                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 113  0048 725f52c0      	clr	21184
 114                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 116  004c 725f52c1      	clr	21185
 117                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 119  0050 725f52c2      	clr	21186
 120                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 122  0054 35ff52c3      	mov	21187,#255
 123                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 125  0058 35ff52c4      	mov	21188,#255
 126                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 128  005c 725f52c6      	clr	21190
 129                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 131  0060 725f52c7      	clr	21191
 132                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 134  0064 725f52c8      	clr	21192
 135                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 137  0068 725f52c9      	clr	21193
 138                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 140  006c 725f52ca      	clr	21194
 141                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 143  0070 725f52cb      	clr	21195
 144                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 146  0074 725f52cc      	clr	21196
 147                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 149  0078 725f52cd      	clr	21197
 150                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 152  007c 725f52d0      	clr	21200
 153                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 155  0080 350152b8      	mov	21176,#1
 156                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 158  0084 725f52cf      	clr	21199
 159                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 161  0088 725f52ce      	clr	21198
 162                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 164  008c 725f52c5      	clr	21189
 165                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 167  0090 725f52b6      	clr	21174
 168                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 170  0094 725f52b7      	clr	21175
 171                     ; 225 }
 174  0098 81            	ret	
 277                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 277                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 277                     ; 243                        uint16_t TIM1_Period,
 277                     ; 244                        uint8_t TIM1_RepetitionCounter)
 277                     ; 245 {
 278                     .text:	section	.text,new
 279  0000               _TIM1_TimeBaseInit:
 281       fffffffe      OFST: set -2
 284                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 286                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  0000 7b04          	ld	a,(OFST+6,sp)
 289  0002 c752c3        	ld	21187,a
 290                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  0005 7b05          	ld	a,(OFST+7,sp)
 293  0007 c752c4        	ld	21188,a
 294                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  000a 9e            	ld	a,xh
 297  000b c752c1        	ld	21185,a
 298                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  000e 9f            	ld	a,xl
 301  000f c752c2        	ld	21186,a
 302                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 304  0012 c652b0        	ld	a,21168
 305  0015 a48f          	and	a,#143
 306  0017 1a03          	or	a,(OFST+5,sp)
 307  0019 c752b0        	ld	21168,a
 308                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 310  001c 7b06          	ld	a,(OFST+8,sp)
 311  001e c752c5        	ld	21189,a
 312                     ; 265 }
 315  0021 81            	ret	
 380                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 380                     ; 280 {
 381                     .text:	section	.text,new
 382  0000               _TIM1_PrescalerConfig:
 384       fffffffe      OFST: set -2
 387                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 389                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 391  0000 9e            	ld	a,xh
 392  0001 c752c1        	ld	21185,a
 393                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 395  0004 9f            	ld	a,xl
 396  0005 c752c2        	ld	21186,a
 397                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 399  0008 7b03          	ld	a,(OFST+5,sp)
 400  000a c752b8        	ld	21176,a
 401                     ; 290 }
 404  000d 81            	ret	
 440                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 440                     ; 304 {
 441                     .text:	section	.text,new
 442  0000               _TIM1_CounterModeConfig:
 444  0000 88            	push	a
 445       00000000      OFST:	set	0
 448                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 450                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 450                     ; 311                         | (uint8_t)TIM1_CounterMode);
 452  0001 c652b0        	ld	a,21168
 453  0004 a48f          	and	a,#143
 454  0006 1a01          	or	a,(OFST+1,sp)
 455  0008 c752b0        	ld	21168,a
 456                     ; 312 }
 459  000b 84            	pop	a
 460  000c 81            	ret	
 492                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 492                     ; 321 {
 493                     .text:	section	.text,new
 494  0000               _TIM1_SetCounter:
 498                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 500  0000 9e            	ld	a,xh
 501  0001 c752bf        	ld	21183,a
 502                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 504  0004 9f            	ld	a,xl
 505  0005 c752c0        	ld	21184,a
 506                     ; 325 }
 509  0008 81            	ret	
 541                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 541                     ; 334 {
 542                     .text:	section	.text,new
 543  0000               _TIM1_SetAutoreload:
 547                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 549  0000 9e            	ld	a,xh
 550  0001 c752c3        	ld	21187,a
 551                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 553  0004 9f            	ld	a,xl
 554  0005 c752c4        	ld	21188,a
 555                     ; 338 }
 558  0008 81            	ret	
 604                     ; 345 uint16_t TIM1_GetCounter(void)
 604                     ; 346 {
 605                     .text:	section	.text,new
 606  0000               _TIM1_GetCounter:
 608  0000 5204          	subw	sp,#4
 609       00000004      OFST:	set	4
 612                     ; 348   uint16_t tmpcntr = 0;
 614                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 618                     ; 351   tmpcntrh = TIM1->CNTRH;
 620  0002 c652bf        	ld	a,21183
 621  0005 6b02          	ld	(OFST-2,sp),a
 623                     ; 352   tmpcntrl = TIM1->CNTRL;
 625  0007 c652c0        	ld	a,21184
 626  000a 6b01          	ld	(OFST-3,sp),a
 628                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 630  000c 5f            	clrw	x
 631  000d 97            	ld	xl,a
 632  000e 1f03          	ldw	(OFST-1,sp),x
 634                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 636  0010 5f            	clrw	x
 637  0011 7b02          	ld	a,(OFST-2,sp)
 638  0013 97            	ld	xl,a
 639  0014 7b04          	ld	a,(OFST+0,sp)
 640  0016 01            	rrwa	x,a
 641  0017 1a03          	or	a,(OFST-1,sp)
 642  0019 01            	rrwa	x,a
 644                     ; 358   return (uint16_t)tmpcntr;
 648  001a 5b04          	addw	sp,#4
 649  001c 81            	ret	
 681                     ; 366 uint16_t TIM1_GetPrescaler(void)
 681                     ; 367 {
 682                     .text:	section	.text,new
 683  0000               _TIM1_GetPrescaler:
 685  0000 89            	pushw	x
 686       00000002      OFST:	set	2
 689                     ; 368   uint16_t tmpreg = 0;
 691                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 693  0001 c652c1        	ld	a,21185
 694  0004 97            	ld	xl,a
 695  0005 4f            	clr	a
 696  0006 02            	rlwa	x,a
 697  0007 1f01          	ldw	(OFST-1,sp),x
 699                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 701  0009 c652c2        	ld	a,21186
 702  000c 5f            	clrw	x
 703  000d 97            	ld	xl,a
 704  000e 01            	rrwa	x,a
 705  000f 1a02          	or	a,(OFST+0,sp)
 706  0011 01            	rrwa	x,a
 707  0012 1a01          	or	a,(OFST-1,sp)
 708  0014 01            	rrwa	x,a
 711  0015 5b02          	addw	sp,#2
 712  0017 81            	ret	
 768                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 768                     ; 381 {
 769                     .text:	section	.text,new
 770  0000               _TIM1_UpdateDisableConfig:
 774                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 776                     ; 386   if (NewState != DISABLE)
 778  0000 4d            	tnz	a
 779  0001 2705          	jreq	L352
 780                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 782  0003 721252b0      	bset	21168,#1
 785  0007 81            	ret	
 786  0008               L352:
 787                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 789  0008 721352b0      	bres	21168,#1
 790                     ; 394 }
 793  000c 81            	ret	
 851                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 851                     ; 405 {
 852                     .text:	section	.text,new
 853  0000               _TIM1_UpdateRequestConfig:
 857                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 859                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 861  0000 4d            	tnz	a
 862  0001 2705          	jreq	L503
 863                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 865  0003 721452b0      	bset	21168,#2
 868  0007 81            	ret	
 869  0008               L503:
 870                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 872  0008 721552b0      	bres	21168,#2
 873                     ; 418 }
 876  000c 81            	ret	
 912                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 912                     ; 427 {
 913                     .text:	section	.text,new
 914  0000               _TIM1_ARRPreloadConfig:
 918                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 920                     ; 432   if (NewState != DISABLE)
 922  0000 4d            	tnz	a
 923  0001 2705          	jreq	L723
 924                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 926  0003 721e52b0      	bset	21168,#7
 929  0007 81            	ret	
 930  0008               L723:
 931                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 933  0008 721f52b0      	bres	21168,#7
 934                     ; 440 }
 937  000c 81            	ret	
 994                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 994                     ; 451 {
 995                     .text:	section	.text,new
 996  0000               _TIM1_SelectOnePulseMode:
1000                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1002                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1004  0000 4d            	tnz	a
1005  0001 2705          	jreq	L163
1006                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1008  0003 721652b0      	bset	21168,#3
1011  0007 81            	ret	
1012  0008               L163:
1013                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1015  0008 721752b0      	bres	21168,#3
1016                     ; 464 }
1019  000c 81            	ret	
1054                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1054                     ; 473 {
1055                     .text:	section	.text,new
1056  0000               _TIM1_Cmd:
1060                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1062                     ; 478   if (NewState != DISABLE)
1064  0000 4d            	tnz	a
1065  0001 2705          	jreq	L304
1066                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1068  0003 721052b0      	bset	21168,#0
1071  0007 81            	ret	
1072  0008               L304:
1073                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1075  0008 721152b0      	bres	21168,#0
1076                     ; 486 }
1079  000c 81            	ret	
1362                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1362                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1362                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1362                     ; 580                   uint16_t TIM1_Pulse,
1362                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1362                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1362                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1362                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1362                     ; 585 {
1363                     .text:	section	.text,new
1364  0000               _TIM1_OC1Init:
1366  0000 89            	pushw	x
1367  0001 5203          	subw	sp,#3
1368       00000003      OFST:	set	3
1371                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1373                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1375                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1377                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1379                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1381                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1383                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1385                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1385                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1387  0003 c652bd        	ld	a,21181
1388  0006 a4f0          	and	a,#240
1389  0008 c752bd        	ld	21181,a
1390                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1390                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1390                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1390                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1392  000b 7b0c          	ld	a,(OFST+9,sp)
1393  000d a408          	and	a,#8
1394  000f 6b03          	ld	(OFST+0,sp),a
1396  0011 7b0b          	ld	a,(OFST+8,sp)
1397  0013 a402          	and	a,#2
1398  0015 1a03          	or	a,(OFST+0,sp)
1399  0017 6b02          	ld	(OFST-1,sp),a
1401  0019 7b08          	ld	a,(OFST+5,sp)
1402  001b a404          	and	a,#4
1403  001d 6b01          	ld	(OFST-2,sp),a
1405  001f 9f            	ld	a,xl
1406  0020 a401          	and	a,#1
1407  0022 1a01          	or	a,(OFST-2,sp)
1408  0024 1a02          	or	a,(OFST-1,sp)
1409  0026 ca52bd        	or	a,21181
1410  0029 c752bd        	ld	21181,a
1411                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1411                     ; 608                           | (uint8_t)TIM1_OCMode);
1413  002c c652b9        	ld	a,21177
1414  002f a48f          	and	a,#143
1415  0031 1a04          	or	a,(OFST+1,sp)
1416  0033 c752b9        	ld	21177,a
1417                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1419  0036 c652d0        	ld	a,21200
1420  0039 a4fc          	and	a,#252
1421  003b c752d0        	ld	21200,a
1422                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1422                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1424  003e 7b0e          	ld	a,(OFST+11,sp)
1425  0040 a402          	and	a,#2
1426  0042 6b03          	ld	(OFST+0,sp),a
1428  0044 7b0d          	ld	a,(OFST+10,sp)
1429  0046 a401          	and	a,#1
1430  0048 1a03          	or	a,(OFST+0,sp)
1431  004a ca52d0        	or	a,21200
1432  004d c752d0        	ld	21200,a
1433                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1435  0050 7b09          	ld	a,(OFST+6,sp)
1436  0052 c752c6        	ld	21190,a
1437                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1439  0055 7b0a          	ld	a,(OFST+7,sp)
1440  0057 c752c7        	ld	21191,a
1441                     ; 619 }
1444  005a 5b05          	addw	sp,#5
1445  005c 81            	ret	
1547                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1547                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1547                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1547                     ; 661                   uint16_t TIM1_Pulse,
1547                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1547                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1547                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1547                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1547                     ; 666 {
1548                     .text:	section	.text,new
1549  0000               _TIM1_OC2Init:
1551  0000 89            	pushw	x
1552  0001 5203          	subw	sp,#3
1553       00000003      OFST:	set	3
1556                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1558                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1560                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1562                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1564                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1566                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1568                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1570                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1572  0003 c652bd        	ld	a,21181
1573  0006 a40f          	and	a,#15
1574  0008 c752bd        	ld	21181,a
1575                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1575                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1577  000b 7b0c          	ld	a,(OFST+9,sp)
1578  000d a480          	and	a,#128
1579  000f 6b03          	ld	(OFST+0,sp),a
1581  0011 7b0b          	ld	a,(OFST+8,sp)
1582  0013 a420          	and	a,#32
1583  0015 1a03          	or	a,(OFST+0,sp)
1584  0017 6b02          	ld	(OFST-1,sp),a
1586  0019 7b08          	ld	a,(OFST+5,sp)
1587  001b a440          	and	a,#64
1588  001d 6b01          	ld	(OFST-2,sp),a
1590  001f 9f            	ld	a,xl
1591  0020 a410          	and	a,#16
1592  0022 1a01          	or	a,(OFST-2,sp)
1593  0024 1a02          	or	a,(OFST-1,sp)
1594  0026 ca52bd        	or	a,21181
1595  0029 c752bd        	ld	21181,a
1596                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1598  002c c652ba        	ld	a,21178
1599  002f a48f          	and	a,#143
1600  0031 1a04          	or	a,(OFST+1,sp)
1601  0033 c752ba        	ld	21178,a
1602                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1604  0036 c652d0        	ld	a,21200
1605  0039 a4f3          	and	a,#243
1606  003b c752d0        	ld	21200,a
1607                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1609  003e 7b0e          	ld	a,(OFST+11,sp)
1610  0040 a408          	and	a,#8
1611  0042 6b03          	ld	(OFST+0,sp),a
1613  0044 7b0d          	ld	a,(OFST+10,sp)
1614  0046 a404          	and	a,#4
1615  0048 1a03          	or	a,(OFST+0,sp)
1616  004a ca52d0        	or	a,21200
1617  004d c752d0        	ld	21200,a
1618                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1620  0050 7b09          	ld	a,(OFST+6,sp)
1621  0052 c752c8        	ld	21192,a
1622                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1624  0055 7b0a          	ld	a,(OFST+7,sp)
1625  0057 c752c9        	ld	21193,a
1626                     ; 696 }
1629  005a 5b05          	addw	sp,#5
1630  005c 81            	ret	
1732                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1732                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1732                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1732                     ; 738                   uint16_t TIM1_Pulse,
1732                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1732                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1732                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1732                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1732                     ; 743 {
1733                     .text:	section	.text,new
1734  0000               _TIM1_OC3Init:
1736  0000 89            	pushw	x
1737  0001 5203          	subw	sp,#3
1738       00000003      OFST:	set	3
1741                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1743                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1745                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1747                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1749                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1751                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1753                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1755                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1757  0003 c652be        	ld	a,21182
1758  0006 a4f0          	and	a,#240
1759  0008 c752be        	ld	21182,a
1760                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1760                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1762  000b 7b0c          	ld	a,(OFST+9,sp)
1763  000d a408          	and	a,#8
1764  000f 6b03          	ld	(OFST+0,sp),a
1766  0011 7b0b          	ld	a,(OFST+8,sp)
1767  0013 a402          	and	a,#2
1768  0015 1a03          	or	a,(OFST+0,sp)
1769  0017 6b02          	ld	(OFST-1,sp),a
1771  0019 7b08          	ld	a,(OFST+5,sp)
1772  001b a404          	and	a,#4
1773  001d 6b01          	ld	(OFST-2,sp),a
1775  001f 9f            	ld	a,xl
1776  0020 a401          	and	a,#1
1777  0022 1a01          	or	a,(OFST-2,sp)
1778  0024 1a02          	or	a,(OFST-1,sp)
1779  0026 ca52be        	or	a,21182
1780  0029 c752be        	ld	21182,a
1781                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1783  002c c652bb        	ld	a,21179
1784  002f a48f          	and	a,#143
1785  0031 1a04          	or	a,(OFST+1,sp)
1786  0033 c752bb        	ld	21179,a
1787                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1789  0036 c652d0        	ld	a,21200
1790  0039 a4cf          	and	a,#207
1791  003b c752d0        	ld	21200,a
1792                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1794  003e 7b0e          	ld	a,(OFST+11,sp)
1795  0040 a420          	and	a,#32
1796  0042 6b03          	ld	(OFST+0,sp),a
1798  0044 7b0d          	ld	a,(OFST+10,sp)
1799  0046 a410          	and	a,#16
1800  0048 1a03          	or	a,(OFST+0,sp)
1801  004a ca52d0        	or	a,21200
1802  004d c752d0        	ld	21200,a
1803                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1805  0050 7b09          	ld	a,(OFST+6,sp)
1806  0052 c752ca        	ld	21194,a
1807                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1809  0055 7b0a          	ld	a,(OFST+7,sp)
1810  0057 c752cb        	ld	21195,a
1811                     ; 773 }
1814  005a 5b05          	addw	sp,#5
1815  005c 81            	ret	
2020                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2020                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2020                     ; 805                      uint8_t TIM1_DeadTime,
2020                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2020                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2020                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2020                     ; 809 {
2021                     .text:	section	.text,new
2022  0000               _TIM1_BDTRConfig:
2024  0000 89            	pushw	x
2025  0001 88            	push	a
2026       00000001      OFST:	set	1
2029                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2031                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2033                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2035                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2037                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2039                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2041  0002 7b06          	ld	a,(OFST+5,sp)
2042  0004 c752cf        	ld	21199,a
2043                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2043                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2043                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2045  0007 7b07          	ld	a,(OFST+6,sp)
2046  0009 1a08          	or	a,(OFST+7,sp)
2047  000b 1a09          	or	a,(OFST+8,sp)
2048  000d 6b01          	ld	(OFST+0,sp),a
2050  000f 9f            	ld	a,xl
2051  0010 1a02          	or	a,(OFST+1,sp)
2052  0012 1a01          	or	a,(OFST+0,sp)
2053  0014 c752ce        	ld	21198,a
2054                     ; 826 }
2057  0017 5b03          	addw	sp,#3
2058  0019 81            	ret	
2094                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2094                     ; 835 {
2095                     .text:	section	.text,new
2096  0000               _TIM1_CtrlPWMOutputs:
2100                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2102                     ; 841   if (NewState != DISABLE)
2104  0000 4d            	tnz	a
2105  0001 2705          	jreq	L1301
2106                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2108  0003 721e52ce      	bset	21198,#7
2111  0007 81            	ret	
2112  0008               L1301:
2113                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2115  0008 721f52ce      	bres	21198,#7
2116                     ; 849 }
2119  000c 81            	ret	
2198                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2198                     ; 872 {
2199                     .text:	section	.text,new
2200  0000               _TIM1_SelectOCxM:
2202  0000 89            	pushw	x
2203       00000000      OFST:	set	0
2206                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2208                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2210                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2212  0001 9e            	ld	a,xh
2213  0002 4d            	tnz	a
2214  0003 2610          	jrne	L3701
2215                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2217  0005 721152bd      	bres	21181,#0
2218                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2220  0009 c652b9        	ld	a,21177
2221  000c a48f          	and	a,#143
2222  000e 1a02          	or	a,(OFST+2,sp)
2223  0010 c752b9        	ld	21177,a
2225  0013 2023          	jra	L5701
2226  0015               L3701:
2227                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2229  0015 7b01          	ld	a,(OFST+1,sp)
2230  0017 4a            	dec	a
2231  0018 2610          	jrne	L7701
2232                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2234  001a 721952bd      	bres	21181,#4
2235                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2237  001e c652ba        	ld	a,21178
2238  0021 a48f          	and	a,#143
2239  0023 1a02          	or	a,(OFST+2,sp)
2240  0025 c752ba        	ld	21178,a
2242  0028 200e          	jra	L5701
2243  002a               L7701:
2244                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2246  002a 721152be      	bres	21182,#0
2247                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2249  002e c652bb        	ld	a,21179
2250  0031 a48f          	and	a,#143
2251  0033 1a02          	or	a,(OFST+2,sp)
2252  0035 c752bb        	ld	21179,a
2253  0038               L5701:
2254                     ; 902 }
2257  0038 85            	popw	x
2258  0039 81            	ret	
2290                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2290                     ; 911 {
2291                     .text:	section	.text,new
2292  0000               _TIM1_SetCompare1:
2296                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2298  0000 9e            	ld	a,xh
2299  0001 c752c6        	ld	21190,a
2300                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2302  0004 9f            	ld	a,xl
2303  0005 c752c7        	ld	21191,a
2304                     ; 916 }
2307  0008 81            	ret	
2339                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2339                     ; 925 {
2340                     .text:	section	.text,new
2341  0000               _TIM1_SetCompare2:
2345                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2347  0000 9e            	ld	a,xh
2348  0001 c752c8        	ld	21192,a
2349                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2351  0004 9f            	ld	a,xl
2352  0005 c752c9        	ld	21193,a
2353                     ; 929 }
2356  0008 81            	ret	
2388                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2388                     ; 938 {
2389                     .text:	section	.text,new
2390  0000               _TIM1_SetCompare3:
2394                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2396  0000 9e            	ld	a,xh
2397  0001 c752ca        	ld	21194,a
2398                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2400  0004 9f            	ld	a,xl
2401  0005 c752cb        	ld	21195,a
2402                     ; 942 }
2405  0008 81            	ret	
2437                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2437                     ; 951 {
2438                     .text:	section	.text,new
2439  0000               _TIM1_SetCompare4:
2443                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2445  0000 9e            	ld	a,xh
2446  0001 c752cc        	ld	21196,a
2447                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2449  0004 9f            	ld	a,xl
2450  0005 c752cd        	ld	21197,a
2451                     ; 955 }
2454  0008 81            	ret	
2490                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2490                     ; 964 {
2491                     .text:	section	.text,new
2492  0000               _TIM1_CCPreloadControl:
2496                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2498                     ; 969   if (NewState != DISABLE)
2500  0000 4d            	tnz	a
2501  0001 2705          	jreq	L1021
2502                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2504  0003 721052b1      	bset	21169,#0
2507  0007 81            	ret	
2508  0008               L1021:
2509                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2511  0008 721152b1      	bres	21169,#0
2512                     ; 977 }
2515  000c 81            	ret	
2573                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2573                     ; 988 {
2574                     .text:	section	.text,new
2575  0000               _TIM1_ForcedOC1Config:
2577  0000 88            	push	a
2578       00000000      OFST:	set	0
2581                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2583                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2585  0001 c652b9        	ld	a,21177
2586  0004 a48f          	and	a,#143
2587  0006 1a01          	or	a,(OFST+1,sp)
2588  0008 c752b9        	ld	21177,a
2589                     ; 994 }
2592  000b 84            	pop	a
2593  000c 81            	ret	
2629                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2629                     ; 1005 {
2630                     .text:	section	.text,new
2631  0000               _TIM1_ForcedOC2Config:
2633  0000 88            	push	a
2634       00000000      OFST:	set	0
2637                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2639                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2641  0001 c652ba        	ld	a,21178
2642  0004 a48f          	and	a,#143
2643  0006 1a01          	or	a,(OFST+1,sp)
2644  0008 c752ba        	ld	21178,a
2645                     ; 1011 }
2648  000b 84            	pop	a
2649  000c 81            	ret	
2685                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2685                     ; 1022 {
2686                     .text:	section	.text,new
2687  0000               _TIM1_ForcedOC3Config:
2689  0000 88            	push	a
2690       00000000      OFST:	set	0
2693                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2695                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2697  0001 c652bb        	ld	a,21179
2698  0004 a48f          	and	a,#143
2699  0006 1a01          	or	a,(OFST+1,sp)
2700  0008 c752bb        	ld	21179,a
2701                     ; 1028 }
2704  000b 84            	pop	a
2705  000c 81            	ret	
2741                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2741                     ; 1037 {
2742                     .text:	section	.text,new
2743  0000               _TIM1_OC1PreloadConfig:
2747                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2749                     ; 1042   if (NewState != DISABLE)
2751  0000 4d            	tnz	a
2752  0001 2705          	jreq	L5031
2753                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2755  0003 721652b9      	bset	21177,#3
2758  0007 81            	ret	
2759  0008               L5031:
2760                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2762  0008 721752b9      	bres	21177,#3
2763                     ; 1050 }
2766  000c 81            	ret	
2802                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2802                     ; 1059 {
2803                     .text:	section	.text,new
2804  0000               _TIM1_OC2PreloadConfig:
2808                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2810                     ; 1064   if (NewState != DISABLE)
2812  0000 4d            	tnz	a
2813  0001 2705          	jreq	L7231
2814                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2816  0003 721652ba      	bset	21178,#3
2819  0007 81            	ret	
2820  0008               L7231:
2821                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2823  0008 721752ba      	bres	21178,#3
2824                     ; 1072 }
2827  000c 81            	ret	
2863                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2863                     ; 1081 {
2864                     .text:	section	.text,new
2865  0000               _TIM1_OC3PreloadConfig:
2869                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2871                     ; 1086   if (NewState != DISABLE)
2873  0000 4d            	tnz	a
2874  0001 2705          	jreq	L1531
2875                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2877  0003 721652bb      	bset	21179,#3
2880  0007 81            	ret	
2881  0008               L1531:
2882                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2884  0008 721752bb      	bres	21179,#3
2885                     ; 1094 }
2888  000c 81            	ret	
2924                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2924                     ; 1103 {
2925                     .text:	section	.text,new
2926  0000               _TIM1_OC4PreloadConfig:
2930                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2932                     ; 1108   if (NewState != DISABLE)
2934  0000 4d            	tnz	a
2935  0001 2705          	jreq	L3731
2936                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2938  0003 721652bc      	bset	21180,#3
2941  0007 81            	ret	
2942  0008               L3731:
2943                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2945  0008 721752bc      	bres	21180,#3
2946                     ; 1116 }
2949  000c 81            	ret	
2984                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
2984                     ; 1125 {
2985                     .text:	section	.text,new
2986  0000               _TIM1_OC1FastConfig:
2990                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
2992                     ; 1130   if (NewState != DISABLE)
2994  0000 4d            	tnz	a
2995  0001 2705          	jreq	L5141
2996                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2998  0003 721452b9      	bset	21177,#2
3001  0007 81            	ret	
3002  0008               L5141:
3003                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3005  0008 721552b9      	bres	21177,#2
3006                     ; 1138 }
3009  000c 81            	ret	
3044                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3044                     ; 1147 {
3045                     .text:	section	.text,new
3046  0000               _TIM1_OC2FastConfig:
3050                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3052                     ; 1152   if (NewState != DISABLE)
3054  0000 4d            	tnz	a
3055  0001 2705          	jreq	L7341
3056                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3058  0003 721452ba      	bset	21178,#2
3061  0007 81            	ret	
3062  0008               L7341:
3063                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3065  0008 721552ba      	bres	21178,#2
3066                     ; 1160 }
3069  000c 81            	ret	
3104                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3104                     ; 1169 {
3105                     .text:	section	.text,new
3106  0000               _TIM1_OC3FastConfig:
3110                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3112                     ; 1174   if (NewState != DISABLE)
3114  0000 4d            	tnz	a
3115  0001 2705          	jreq	L1641
3116                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3118  0003 721452bb      	bset	21179,#2
3121  0007 81            	ret	
3122  0008               L1641:
3123                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3125  0008 721552bb      	bres	21179,#2
3126                     ; 1182 }
3129  000c 81            	ret	
3164                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3164                     ; 1191 {
3165                     .text:	section	.text,new
3166  0000               _TIM1_ClearOC1Ref:
3170                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3172                     ; 1196   if (NewState != DISABLE)
3174  0000 4d            	tnz	a
3175  0001 2705          	jreq	L3051
3176                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3178  0003 721e52b9      	bset	21177,#7
3181  0007 81            	ret	
3182  0008               L3051:
3183                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3185  0008 721f52b9      	bres	21177,#7
3186                     ; 1204 }
3189  000c 81            	ret	
3224                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3224                     ; 1213 {
3225                     .text:	section	.text,new
3226  0000               _TIM1_ClearOC2Ref:
3230                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3232                     ; 1218   if (NewState != DISABLE)
3234  0000 4d            	tnz	a
3235  0001 2705          	jreq	L5251
3236                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3238  0003 721e52ba      	bset	21178,#7
3241  0007 81            	ret	
3242  0008               L5251:
3243                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3245  0008 721f52ba      	bres	21178,#7
3246                     ; 1226 }
3249  000c 81            	ret	
3284                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3284                     ; 1235 {
3285                     .text:	section	.text,new
3286  0000               _TIM1_ClearOC3Ref:
3290                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3292                     ; 1240   if (NewState != DISABLE)
3294  0000 4d            	tnz	a
3295  0001 2705          	jreq	L7451
3296                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3298  0003 721e52bb      	bset	21179,#7
3301  0007 81            	ret	
3302  0008               L7451:
3303                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3305  0008 721f52bb      	bres	21179,#7
3306                     ; 1248 }
3309  000c 81            	ret	
3344                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3344                     ; 1257 {
3345                     .text:	section	.text,new
3346  0000               _TIM1_ClearOC4Ref:
3350                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3352                     ; 1262   if (NewState != DISABLE)
3354  0000 4d            	tnz	a
3355  0001 2705          	jreq	L1751
3356                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3358  0003 721e52bc      	bset	21180,#7
3361  0007 81            	ret	
3362  0008               L1751:
3363                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3365  0008 721f52bc      	bres	21180,#7
3366                     ; 1270 }
3369  000c 81            	ret	
3405                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3405                     ; 1281 {
3406                     .text:	section	.text,new
3407  0000               _TIM1_OC1PolarityConfig:
3411                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3413                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3415  0000 4d            	tnz	a
3416  0001 2705          	jreq	L3161
3417                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3419  0003 721252bd      	bset	21181,#1
3422  0007 81            	ret	
3423  0008               L3161:
3424                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3426  0008 721352bd      	bres	21181,#1
3427                     ; 1294 }
3430  000c 81            	ret	
3466                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3466                     ; 1305 {
3467                     .text:	section	.text,new
3468  0000               _TIM1_OC1NPolarityConfig:
3472                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3474                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3476  0000 4d            	tnz	a
3477  0001 2705          	jreq	L5361
3478                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3480  0003 721652bd      	bset	21181,#3
3483  0007 81            	ret	
3484  0008               L5361:
3485                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3487  0008 721752bd      	bres	21181,#3
3488                     ; 1318 }
3491  000c 81            	ret	
3527                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3527                     ; 1329 {
3528                     .text:	section	.text,new
3529  0000               _TIM1_OC2PolarityConfig:
3533                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3535                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3537  0000 4d            	tnz	a
3538  0001 2705          	jreq	L7561
3539                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3541  0003 721a52bd      	bset	21181,#5
3544  0007 81            	ret	
3545  0008               L7561:
3546                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3548  0008 721b52bd      	bres	21181,#5
3549                     ; 1342 }
3552  000c 81            	ret	
3588                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3588                     ; 1353 {
3589                     .text:	section	.text,new
3590  0000               _TIM1_OC2NPolarityConfig:
3594                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3596                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3598  0000 4d            	tnz	a
3599  0001 2705          	jreq	L1071
3600                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3602  0003 721e52bd      	bset	21181,#7
3605  0007 81            	ret	
3606  0008               L1071:
3607                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3609  0008 721f52bd      	bres	21181,#7
3610                     ; 1366 }
3613  000c 81            	ret	
3649                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3649                     ; 1377 {
3650                     .text:	section	.text,new
3651  0000               _TIM1_OC3PolarityConfig:
3655                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3657                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3659  0000 4d            	tnz	a
3660  0001 2705          	jreq	L3271
3661                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3663  0003 721252be      	bset	21182,#1
3666  0007 81            	ret	
3667  0008               L3271:
3668                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3670  0008 721352be      	bres	21182,#1
3671                     ; 1390 }
3674  000c 81            	ret	
3710                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3710                     ; 1401 {
3711                     .text:	section	.text,new
3712  0000               _TIM1_OC3NPolarityConfig:
3716                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3718                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3720  0000 4d            	tnz	a
3721  0001 2705          	jreq	L5471
3722                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3724  0003 721652be      	bset	21182,#3
3727  0007 81            	ret	
3728  0008               L5471:
3729                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3731  0008 721752be      	bres	21182,#3
3732                     ; 1414 }
3735  000c 81            	ret	
3794                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3794                     ; 1425 {
3795                     .text:	section	.text,new
3796  0000               _TIM1_SelectOCREFClear:
3800                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3802                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3804  0000 721752b2      	bres	21170,#3
3805                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3807  0004 ca52b2        	or	a,21170
3808  0007 c752b2        	ld	21170,a
3809                     ; 1432 }
3812  000a 81            	ret	
3847                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3847                     ; 1441 {
3848                     .text:	section	.text,new
3849  0000               _TIM1_SelectCOM:
3853                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3855                     ; 1446   if (NewState != DISABLE)
3857  0000 4d            	tnz	a
3858  0001 2705          	jreq	L5102
3859                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3861  0003 721452b1      	bset	21169,#2
3864  0007 81            	ret	
3865  0008               L5102:
3866                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3868  0008 721552b1      	bres	21169,#2
3869                     ; 1454 }
3872  000c 81            	ret	
3917                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3917                     ; 1469 {
3918                     .text:	section	.text,new
3919  0000               _TIM1_CCxCmd:
3921  0000 89            	pushw	x
3922       00000000      OFST:	set	0
3925                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3927                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3929                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3931  0001 9e            	ld	a,xh
3932  0002 4d            	tnz	a
3933  0003 2610          	jrne	L3402
3934                     ; 1477     if (NewState != DISABLE)
3936  0005 9f            	ld	a,xl
3937  0006 4d            	tnz	a
3938  0007 2706          	jreq	L5402
3939                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3941  0009 721052bd      	bset	21181,#0
3943  000d 203e          	jra	L1502
3944  000f               L5402:
3945                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3947  000f 721152bd      	bres	21181,#0
3948  0013 2038          	jra	L1502
3949  0015               L3402:
3950                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3952  0015 7b01          	ld	a,(OFST+1,sp)
3953  0017 a101          	cp	a,#1
3954  0019 2610          	jrne	L3502
3955                     ; 1489     if (NewState != DISABLE)
3957  001b 7b02          	ld	a,(OFST+2,sp)
3958  001d 2706          	jreq	L5502
3959                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3961  001f 721852bd      	bset	21181,#4
3963  0023 2028          	jra	L1502
3964  0025               L5502:
3965                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3967  0025 721952bd      	bres	21181,#4
3968  0029 2022          	jra	L1502
3969  002b               L3502:
3970                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3972  002b a102          	cp	a,#2
3973  002d 2610          	jrne	L3602
3974                     ; 1501     if (NewState != DISABLE)
3976  002f 7b02          	ld	a,(OFST+2,sp)
3977  0031 2706          	jreq	L5602
3978                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3980  0033 721052be      	bset	21182,#0
3982  0037 2014          	jra	L1502
3983  0039               L5602:
3984                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3986  0039 721152be      	bres	21182,#0
3987  003d 200e          	jra	L1502
3988  003f               L3602:
3989                     ; 1513     if (NewState != DISABLE)
3991  003f 7b02          	ld	a,(OFST+2,sp)
3992  0041 2706          	jreq	L3702
3993                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3995  0043 721852be      	bset	21182,#4
3997  0047 2004          	jra	L1502
3998  0049               L3702:
3999                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4001  0049 721952be      	bres	21182,#4
4002  004d               L1502:
4003                     ; 1522 }
4006  004d 85            	popw	x
4007  004e 81            	ret	
4052                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4052                     ; 1536 {
4053                     .text:	section	.text,new
4054  0000               _TIM1_CCxNCmd:
4056  0000 89            	pushw	x
4057       00000000      OFST:	set	0
4060                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4062                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4064                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4066  0001 9e            	ld	a,xh
4067  0002 4d            	tnz	a
4068  0003 2610          	jrne	L1212
4069                     ; 1544     if (NewState != DISABLE)
4071  0005 9f            	ld	a,xl
4072  0006 4d            	tnz	a
4073  0007 2706          	jreq	L3212
4074                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4076  0009 721452bd      	bset	21181,#2
4078  000d 2029          	jra	L7212
4079  000f               L3212:
4080                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4082  000f 721552bd      	bres	21181,#2
4083  0013 2023          	jra	L7212
4084  0015               L1212:
4085                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4087  0015 7b01          	ld	a,(OFST+1,sp)
4088  0017 4a            	dec	a
4089  0018 2610          	jrne	L1312
4090                     ; 1556     if (NewState != DISABLE)
4092  001a 7b02          	ld	a,(OFST+2,sp)
4093  001c 2706          	jreq	L3312
4094                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4096  001e 721c52bd      	bset	21181,#6
4098  0022 2014          	jra	L7212
4099  0024               L3312:
4100                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4102  0024 721d52bd      	bres	21181,#6
4103  0028 200e          	jra	L7212
4104  002a               L1312:
4105                     ; 1568     if (NewState != DISABLE)
4107  002a 7b02          	ld	a,(OFST+2,sp)
4108  002c 2706          	jreq	L1412
4109                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4111  002e 721452be      	bset	21182,#2
4113  0032 2004          	jra	L7212
4114  0034               L1412:
4115                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4117  0034 721552be      	bres	21182,#2
4118  0038               L7212:
4119                     ; 1577 }
4122  0038 85            	popw	x
4123  0039 81            	ret	
4289                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4289                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4289                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4289                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4289                     ; 1668                  uint8_t TIM1_ICFilter)
4289                     ; 1669 {
4290                     .text:	section	.text,new
4291  0000               _TIM1_ICInit:
4293  0000 89            	pushw	x
4294       00000000      OFST:	set	0
4297                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4299                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4301                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4303                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4305                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4307                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4309  0001 9e            	ld	a,xh
4310  0002 4d            	tnz	a
4311  0003 2614          	jrne	L7322
4312                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4314  0005 7b07          	ld	a,(OFST+7,sp)
4315  0007 88            	push	a
4316  0008 7b06          	ld	a,(OFST+6,sp)
4317  000a 97            	ld	xl,a
4318  000b 7b03          	ld	a,(OFST+3,sp)
4319  000d 95            	ld	xh,a
4320  000e cd0000        	call	L3_TI1_Config
4322  0011 84            	pop	a
4323                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4325  0012 7b06          	ld	a,(OFST+6,sp)
4326  0014 cd0000        	call	_TIM1_SetIC1Prescaler
4329  0017 2044          	jra	L1422
4330  0019               L7322:
4331                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4333  0019 7b01          	ld	a,(OFST+1,sp)
4334  001b a101          	cp	a,#1
4335  001d 2614          	jrne	L3422
4336                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4338  001f 7b07          	ld	a,(OFST+7,sp)
4339  0021 88            	push	a
4340  0022 7b06          	ld	a,(OFST+6,sp)
4341  0024 97            	ld	xl,a
4342  0025 7b03          	ld	a,(OFST+3,sp)
4343  0027 95            	ld	xh,a
4344  0028 cd0000        	call	L5_TI2_Config
4346  002b 84            	pop	a
4347                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4349  002c 7b06          	ld	a,(OFST+6,sp)
4350  002e cd0000        	call	_TIM1_SetIC2Prescaler
4353  0031 202a          	jra	L1422
4354  0033               L3422:
4355                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4357  0033 a102          	cp	a,#2
4358  0035 2614          	jrne	L7422
4359                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4361  0037 7b07          	ld	a,(OFST+7,sp)
4362  0039 88            	push	a
4363  003a 7b06          	ld	a,(OFST+6,sp)
4364  003c 97            	ld	xl,a
4365  003d 7b03          	ld	a,(OFST+3,sp)
4366  003f 95            	ld	xh,a
4367  0040 cd0000        	call	L7_TI3_Config
4369  0043 84            	pop	a
4370                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4372  0044 7b06          	ld	a,(OFST+6,sp)
4373  0046 cd0000        	call	_TIM1_SetIC3Prescaler
4376  0049 2012          	jra	L1422
4377  004b               L7422:
4378                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4380  004b 7b07          	ld	a,(OFST+7,sp)
4381  004d 88            	push	a
4382  004e 7b06          	ld	a,(OFST+6,sp)
4383  0050 97            	ld	xl,a
4384  0051 7b03          	ld	a,(OFST+3,sp)
4385  0053 95            	ld	xh,a
4386  0054 cd0000        	call	L11_TI4_Config
4388  0057 84            	pop	a
4389                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4391  0058 7b06          	ld	a,(OFST+6,sp)
4392  005a cd0000        	call	_TIM1_SetIC4Prescaler
4394  005d               L1422:
4395                     ; 1706 }
4398  005d 85            	popw	x
4399  005e 81            	ret	
4495                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4495                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4495                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4495                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4495                     ; 1737                      uint8_t TIM1_ICFilter)
4495                     ; 1738 {
4496                     .text:	section	.text,new
4497  0000               _TIM1_PWMIConfig:
4499  0000 89            	pushw	x
4500  0001 89            	pushw	x
4501       00000002      OFST:	set	2
4504                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4506                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4508                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4510                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4512                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4514                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4516                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4518  0002 9f            	ld	a,xl
4519  0003 4a            	dec	a
4520  0004 2702          	jreq	L7132
4521                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4523  0006 a601          	ld	a,#1
4525  0008               L7132:
4526                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4528  0008 6b01          	ld	(OFST-1,sp),a
4530                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4532  000a 7b07          	ld	a,(OFST+5,sp)
4533  000c 4a            	dec	a
4534  000d 2604          	jrne	L3232
4535                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4537  000f a602          	ld	a,#2
4539  0011 2002          	jra	L5232
4540  0013               L3232:
4541                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4543  0013 a601          	ld	a,#1
4544  0015               L5232:
4545  0015 6b02          	ld	(OFST+0,sp),a
4547                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4549  0017 7b03          	ld	a,(OFST+1,sp)
4550  0019 2626          	jrne	L7232
4551                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4553  001b 7b09          	ld	a,(OFST+7,sp)
4554  001d 88            	push	a
4555  001e 7b08          	ld	a,(OFST+6,sp)
4556  0020 97            	ld	xl,a
4557  0021 7b05          	ld	a,(OFST+3,sp)
4558  0023 95            	ld	xh,a
4559  0024 cd0000        	call	L3_TI1_Config
4561  0027 84            	pop	a
4562                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4564  0028 7b08          	ld	a,(OFST+6,sp)
4565  002a cd0000        	call	_TIM1_SetIC1Prescaler
4567                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4569  002d 7b09          	ld	a,(OFST+7,sp)
4570  002f 88            	push	a
4571  0030 7b03          	ld	a,(OFST+1,sp)
4572  0032 97            	ld	xl,a
4573  0033 7b02          	ld	a,(OFST+0,sp)
4574  0035 95            	ld	xh,a
4575  0036 cd0000        	call	L5_TI2_Config
4577  0039 84            	pop	a
4578                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4580  003a 7b08          	ld	a,(OFST+6,sp)
4581  003c cd0000        	call	_TIM1_SetIC2Prescaler
4584  003f 2024          	jra	L1332
4585  0041               L7232:
4586                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4588  0041 7b09          	ld	a,(OFST+7,sp)
4589  0043 88            	push	a
4590  0044 7b08          	ld	a,(OFST+6,sp)
4591  0046 97            	ld	xl,a
4592  0047 7b05          	ld	a,(OFST+3,sp)
4593  0049 95            	ld	xh,a
4594  004a cd0000        	call	L5_TI2_Config
4596  004d 84            	pop	a
4597                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4599  004e 7b08          	ld	a,(OFST+6,sp)
4600  0050 cd0000        	call	_TIM1_SetIC2Prescaler
4602                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4604  0053 7b09          	ld	a,(OFST+7,sp)
4605  0055 88            	push	a
4606  0056 7b03          	ld	a,(OFST+1,sp)
4607  0058 97            	ld	xl,a
4608  0059 7b02          	ld	a,(OFST+0,sp)
4609  005b 95            	ld	xh,a
4610  005c cd0000        	call	L3_TI1_Config
4612  005f 84            	pop	a
4613                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4615  0060 7b08          	ld	a,(OFST+6,sp)
4616  0062 cd0000        	call	_TIM1_SetIC1Prescaler
4618  0065               L1332:
4619                     ; 1796 }
4622  0065 5b04          	addw	sp,#4
4623  0067 81            	ret	
4669                     ; 1803 uint16_t TIM1_GetCapture1(void)
4669                     ; 1804 {
4670                     .text:	section	.text,new
4671  0000               _TIM1_GetCapture1:
4673  0000 5204          	subw	sp,#4
4674       00000004      OFST:	set	4
4677                     ; 1807   uint16_t tmpccr1 = 0;
4679                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4683                     ; 1810   tmpccr1h = TIM1->CCR1H;
4685  0002 c652c6        	ld	a,21190
4686  0005 6b02          	ld	(OFST-2,sp),a
4688                     ; 1811   tmpccr1l = TIM1->CCR1L;
4690  0007 c652c7        	ld	a,21191
4691  000a 6b01          	ld	(OFST-3,sp),a
4693                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4695  000c 5f            	clrw	x
4696  000d 97            	ld	xl,a
4697  000e 1f03          	ldw	(OFST-1,sp),x
4699                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4701  0010 5f            	clrw	x
4702  0011 7b02          	ld	a,(OFST-2,sp)
4703  0013 97            	ld	xl,a
4704  0014 7b04          	ld	a,(OFST+0,sp)
4705  0016 01            	rrwa	x,a
4706  0017 1a03          	or	a,(OFST-1,sp)
4707  0019 01            	rrwa	x,a
4709                     ; 1816   return (uint16_t)tmpccr1;
4713  001a 5b04          	addw	sp,#4
4714  001c 81            	ret	
4760                     ; 1824 uint16_t TIM1_GetCapture2(void)
4760                     ; 1825 {
4761                     .text:	section	.text,new
4762  0000               _TIM1_GetCapture2:
4764  0000 5204          	subw	sp,#4
4765       00000004      OFST:	set	4
4768                     ; 1828   uint16_t tmpccr2 = 0;
4770                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4774                     ; 1831   tmpccr2h = TIM1->CCR2H;
4776  0002 c652c8        	ld	a,21192
4777  0005 6b02          	ld	(OFST-2,sp),a
4779                     ; 1832   tmpccr2l = TIM1->CCR2L;
4781  0007 c652c9        	ld	a,21193
4782  000a 6b01          	ld	(OFST-3,sp),a
4784                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4786  000c 5f            	clrw	x
4787  000d 97            	ld	xl,a
4788  000e 1f03          	ldw	(OFST-1,sp),x
4790                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4792  0010 5f            	clrw	x
4793  0011 7b02          	ld	a,(OFST-2,sp)
4794  0013 97            	ld	xl,a
4795  0014 7b04          	ld	a,(OFST+0,sp)
4796  0016 01            	rrwa	x,a
4797  0017 1a03          	or	a,(OFST-1,sp)
4798  0019 01            	rrwa	x,a
4800                     ; 1837   return (uint16_t)tmpccr2;
4804  001a 5b04          	addw	sp,#4
4805  001c 81            	ret	
4851                     ; 1845 uint16_t TIM1_GetCapture3(void)
4851                     ; 1846 {
4852                     .text:	section	.text,new
4853  0000               _TIM1_GetCapture3:
4855  0000 5204          	subw	sp,#4
4856       00000004      OFST:	set	4
4859                     ; 1848   uint16_t tmpccr3 = 0;
4861                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4865                     ; 1851   tmpccr3h = TIM1->CCR3H;
4867  0002 c652ca        	ld	a,21194
4868  0005 6b02          	ld	(OFST-2,sp),a
4870                     ; 1852   tmpccr3l = TIM1->CCR3L;
4872  0007 c652cb        	ld	a,21195
4873  000a 6b01          	ld	(OFST-3,sp),a
4875                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4877  000c 5f            	clrw	x
4878  000d 97            	ld	xl,a
4879  000e 1f03          	ldw	(OFST-1,sp),x
4881                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4883  0010 5f            	clrw	x
4884  0011 7b02          	ld	a,(OFST-2,sp)
4885  0013 97            	ld	xl,a
4886  0014 7b04          	ld	a,(OFST+0,sp)
4887  0016 01            	rrwa	x,a
4888  0017 1a03          	or	a,(OFST-1,sp)
4889  0019 01            	rrwa	x,a
4891                     ; 1857   return (uint16_t)tmpccr3;
4895  001a 5b04          	addw	sp,#4
4896  001c 81            	ret	
4942                     ; 1865 uint16_t TIM1_GetCapture4(void)
4942                     ; 1866 {
4943                     .text:	section	.text,new
4944  0000               _TIM1_GetCapture4:
4946  0000 5204          	subw	sp,#4
4947       00000004      OFST:	set	4
4950                     ; 1868   uint16_t tmpccr4 = 0;
4952                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4956                     ; 1871   tmpccr4h = TIM1->CCR4H;
4958  0002 c652cc        	ld	a,21196
4959  0005 6b02          	ld	(OFST-2,sp),a
4961                     ; 1872   tmpccr4l = TIM1->CCR4L;
4963  0007 c652cd        	ld	a,21197
4964  000a 6b01          	ld	(OFST-3,sp),a
4966                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
4968  000c 5f            	clrw	x
4969  000d 97            	ld	xl,a
4970  000e 1f03          	ldw	(OFST-1,sp),x
4972                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4974  0010 5f            	clrw	x
4975  0011 7b02          	ld	a,(OFST-2,sp)
4976  0013 97            	ld	xl,a
4977  0014 7b04          	ld	a,(OFST+0,sp)
4978  0016 01            	rrwa	x,a
4979  0017 1a03          	or	a,(OFST-1,sp)
4980  0019 01            	rrwa	x,a
4982                     ; 1877   return (uint16_t)tmpccr4;
4986  001a 5b04          	addw	sp,#4
4987  001c 81            	ret	
5023                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5023                     ; 1891 {
5024                     .text:	section	.text,new
5025  0000               _TIM1_SetIC1Prescaler:
5027  0000 88            	push	a
5028       00000000      OFST:	set	0
5031                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5033                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5035  0001 c652b9        	ld	a,21177
5036  0004 a4f3          	and	a,#243
5037  0006 1a01          	or	a,(OFST+1,sp)
5038  0008 c752b9        	ld	21177,a
5039                     ; 1897 }
5042  000b 84            	pop	a
5043  000c 81            	ret	
5079                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5079                     ; 1910 {
5080                     .text:	section	.text,new
5081  0000               _TIM1_SetIC2Prescaler:
5083  0000 88            	push	a
5084       00000000      OFST:	set	0
5087                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5089                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5091  0001 c652ba        	ld	a,21178
5092  0004 a4f3          	and	a,#243
5093  0006 1a01          	or	a,(OFST+1,sp)
5094  0008 c752ba        	ld	21178,a
5095                     ; 1916 }
5098  000b 84            	pop	a
5099  000c 81            	ret	
5135                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5135                     ; 1929 {
5136                     .text:	section	.text,new
5137  0000               _TIM1_SetIC3Prescaler:
5139  0000 88            	push	a
5140       00000000      OFST:	set	0
5143                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5145                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5147  0001 c652bb        	ld	a,21179
5148  0004 a4f3          	and	a,#243
5149  0006 1a01          	or	a,(OFST+1,sp)
5150  0008 c752bb        	ld	21179,a
5151                     ; 1936 }
5154  000b 84            	pop	a
5155  000c 81            	ret	
5191                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5191                     ; 1949 {
5192                     .text:	section	.text,new
5193  0000               _TIM1_SetIC4Prescaler:
5195  0000 88            	push	a
5196       00000000      OFST:	set	0
5199                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5201                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5203  0001 c652bc        	ld	a,21180
5204  0004 a4f3          	and	a,#243
5205  0006 1a01          	or	a,(OFST+1,sp)
5206  0008 c752bc        	ld	21180,a
5207                     ; 1956 }
5210  000b 84            	pop	a
5211  000c 81            	ret	
5318                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5318                     ; 1992 {
5319                     .text:	section	.text,new
5320  0000               _TIM1_ITConfig:
5322  0000 89            	pushw	x
5323       00000000      OFST:	set	0
5326                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5328                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5330                     ; 1997   if (NewState != DISABLE)
5332  0001 9f            	ld	a,xl
5333  0002 4d            	tnz	a
5334  0003 2706          	jreq	L1752
5335                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5337  0005 9e            	ld	a,xh
5338  0006 ca52b5        	or	a,21173
5340  0009 2006          	jra	L3752
5341  000b               L1752:
5342                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5344  000b 7b01          	ld	a,(OFST+1,sp)
5345  000d 43            	cpl	a
5346  000e c452b5        	and	a,21173
5347  0011               L3752:
5348  0011 c752b5        	ld	21173,a
5349                     ; 2007 }
5352  0014 85            	popw	x
5353  0015 81            	ret	
5458                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5458                     ; 2024 {
5459                     .text:	section	.text,new
5460  0000               _TIM1_GenerateEvent:
5464                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5466                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5468  0000 c752b8        	ld	21176,a
5469                     ; 2030 }
5472  0003 81            	ret	
5642                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5642                     ; 2050 {
5643                     .text:	section	.text,new
5644  0000               _TIM1_GetFlagStatus:
5646  0000 89            	pushw	x
5647  0001 89            	pushw	x
5648       00000002      OFST:	set	2
5651                     ; 2051   FlagStatus bitstatus = RESET;
5653                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5657                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5659                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5661  0002 9f            	ld	a,xl
5662  0003 c452b6        	and	a,21174
5663  0006 6b01          	ld	(OFST-1,sp),a
5665                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5667  0008 c652b7        	ld	a,21175
5668  000b 1403          	and	a,(OFST+1,sp)
5669  000d 6b02          	ld	(OFST+0,sp),a
5671                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5673  000f 1a01          	or	a,(OFST-1,sp)
5674  0011 2702          	jreq	L1372
5675                     ; 2062     bitstatus = SET;
5677  0013 a601          	ld	a,#1
5680  0015               L1372:
5681                     ; 2066     bitstatus = RESET;
5684                     ; 2068   return (FlagStatus)(bitstatus);
5688  0015 5b04          	addw	sp,#4
5689  0017 81            	ret	
5724                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5724                     ; 2090 {
5725                     .text:	section	.text,new
5726  0000               _TIM1_ClearFlag:
5728  0000 89            	pushw	x
5729       00000000      OFST:	set	0
5732                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5734                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5736  0001 9f            	ld	a,xl
5737  0002 43            	cpl	a
5738  0003 c752b6        	ld	21174,a
5739                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5741  0006 7b01          	ld	a,(OFST+1,sp)
5742  0008 43            	cpl	a
5743  0009 a41e          	and	a,#30
5744  000b c752b7        	ld	21175,a
5745                     ; 2097 }
5748  000e 85            	popw	x
5749  000f 81            	ret	
5809                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5809                     ; 2115 {
5810                     .text:	section	.text,new
5811  0000               _TIM1_GetITStatus:
5813  0000 88            	push	a
5814  0001 89            	pushw	x
5815       00000002      OFST:	set	2
5818                     ; 2116   ITStatus bitstatus = RESET;
5820                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5824                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5826                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5828  0002 c452b6        	and	a,21174
5829  0005 6b01          	ld	(OFST-1,sp),a
5831                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5833  0007 c652b5        	ld	a,21173
5834  000a 1403          	and	a,(OFST+1,sp)
5835  000c 6b02          	ld	(OFST+0,sp),a
5837                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5839  000e 7b01          	ld	a,(OFST-1,sp)
5840  0010 2708          	jreq	L1003
5842  0012 7b02          	ld	a,(OFST+0,sp)
5843  0014 2704          	jreq	L1003
5844                     ; 2129     bitstatus = SET;
5846  0016 a601          	ld	a,#1
5849  0018 2001          	jra	L3003
5850  001a               L1003:
5851                     ; 2133     bitstatus = RESET;
5853  001a 4f            	clr	a
5855  001b               L3003:
5856                     ; 2135   return (ITStatus)(bitstatus);
5860  001b 5b03          	addw	sp,#3
5861  001d 81            	ret	
5897                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5897                     ; 2153 {
5898                     .text:	section	.text,new
5899  0000               _TIM1_ClearITPendingBit:
5903                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5905                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5907  0000 43            	cpl	a
5908  0001 c752b6        	ld	21174,a
5909                     ; 2159 }
5912  0004 81            	ret	
6450                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6450                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6450                     ; 2169 {
6451                     .text:	section	.text,new
6452  0000               _TIM1_DMAConfig:
6456                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6458                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6460                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6462  0000 9e            	ld	a,xh
6463  0001 c752d1        	ld	21201,a
6464                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6466  0004 9f            	ld	a,xl
6467  0005 c752d2        	ld	21202,a
6468                     ; 2177 }
6471  0008 81            	ret	
6565                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6565                     ; 2190 {
6566                     .text:	section	.text,new
6567  0000               _TIM1_DMACmd:
6569  0000 89            	pushw	x
6570       00000000      OFST:	set	0
6573                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6575                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6577                     ; 2195   if (NewState != DISABLE)
6579  0001 9f            	ld	a,xl
6580  0002 4d            	tnz	a
6581  0003 2706          	jreq	L7133
6582                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6584  0005 9e            	ld	a,xh
6585  0006 ca52b4        	or	a,21172
6587  0009 2006          	jra	L1233
6588  000b               L7133:
6589                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6591  000b 7b01          	ld	a,(OFST+1,sp)
6592  000d 43            	cpl	a
6593  000e c452b4        	and	a,21172
6594  0011               L1233:
6595  0011 c752b4        	ld	21172,a
6596                     ; 2205 }
6599  0014 85            	popw	x
6600  0015 81            	ret	
6635                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6635                     ; 2214 {
6636                     .text:	section	.text,new
6637  0000               _TIM1_SelectCCDMA:
6641                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6643                     ; 2218   if (NewState != DISABLE)
6645  0000 4d            	tnz	a
6646  0001 2705          	jreq	L1433
6647                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6649  0003 721652b1      	bset	21169,#3
6652  0007 81            	ret	
6653  0008               L1433:
6654                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6656  0008 721752b1      	bres	21169,#3
6657                     ; 2228 }
6660  000c 81            	ret	
6684                     ; 2251 void TIM1_InternalClockConfig(void)
6684                     ; 2252 {
6685                     .text:	section	.text,new
6686  0000               _TIM1_InternalClockConfig:
6690                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6692  0000 c652b2        	ld	a,21170
6693  0003 a4f8          	and	a,#248
6694  0005 c752b2        	ld	21170,a
6695                     ; 2255 }
6698  0008 81            	ret	
6785                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6785                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6785                     ; 2274                                  uint8_t ICFilter)
6785                     ; 2275 {
6786                     .text:	section	.text,new
6787  0000               _TIM1_TIxExternalClockConfig:
6789  0000 89            	pushw	x
6790       00000000      OFST:	set	0
6793                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6795                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6797                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6799                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6801  0001 9e            	ld	a,xh
6802  0002 a160          	cp	a,#96
6803  0004 260d          	jrne	L3143
6804                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6806  0006 7b05          	ld	a,(OFST+5,sp)
6807  0008 88            	push	a
6808  0009 9f            	ld	a,xl
6809  000a ae0001        	ldw	x,#1
6810  000d 95            	ld	xh,a
6811  000e cd0000        	call	L5_TI2_Config
6814  0011 200c          	jra	L5143
6815  0013               L3143:
6816                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6818  0013 7b05          	ld	a,(OFST+5,sp)
6819  0015 88            	push	a
6820  0016 7b03          	ld	a,(OFST+3,sp)
6821  0018 ae0001        	ldw	x,#1
6822  001b 95            	ld	xh,a
6823  001c cd0000        	call	L3_TI1_Config
6825  001f               L5143:
6826  001f 84            	pop	a
6827                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6829  0020 7b01          	ld	a,(OFST+1,sp)
6830  0022 cd0000        	call	_TIM1_SelectInputTrigger
6832                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6834  0025 c652b2        	ld	a,21170
6835  0028 aa07          	or	a,#7
6836  002a c752b2        	ld	21170,a
6837                     ; 2296 }
6840  002d 85            	popw	x
6841  002e 81            	ret	
6956                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6956                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6956                     ; 2316                               uint8_t ExtTRGFilter)
6956                     ; 2317 {
6957                     .text:	section	.text,new
6958  0000               _TIM1_ETRClockMode1Config:
6960  0000 89            	pushw	x
6961       00000000      OFST:	set	0
6964                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6966                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6968                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
6970                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6972  0001 7b05          	ld	a,(OFST+5,sp)
6973  0003 88            	push	a
6974  0004 7b02          	ld	a,(OFST+2,sp)
6975  0006 95            	ld	xh,a
6976  0007 cd0000        	call	_TIM1_ETRConfig
6978  000a 84            	pop	a
6979                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
6979                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
6981  000b c652b2        	ld	a,21170
6982  000e aa77          	or	a,#119
6983  0010 c752b2        	ld	21170,a
6984                     ; 2329 }
6987  0013 85            	popw	x
6988  0014 81            	ret	
7044                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7044                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7044                     ; 2349                               uint8_t ExtTRGFilter)
7044                     ; 2350 {
7045                     .text:	section	.text,new
7046  0000               _TIM1_ETRClockMode2Config:
7048  0000 89            	pushw	x
7049       00000000      OFST:	set	0
7052                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7054                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7056                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7058  0001 7b05          	ld	a,(OFST+5,sp)
7059  0003 88            	push	a
7060  0004 7b02          	ld	a,(OFST+2,sp)
7061  0006 95            	ld	xh,a
7062  0007 cd0000        	call	_TIM1_ETRConfig
7064  000a 721c52b3      	bset	21171,#6
7065                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7067                     ; 2360 }
7070  000e 5b03          	addw	sp,#3
7071  0010 81            	ret	
7178                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7178                     ; 2411 {
7179                     .text:	section	.text,new
7180  0000               _TIM1_SelectInputTrigger:
7182  0000 88            	push	a
7183       00000000      OFST:	set	0
7186                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7188                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7190  0001 c652b2        	ld	a,21170
7191  0004 a48f          	and	a,#143
7192  0006 1a01          	or	a,(OFST+1,sp)
7193  0008 c752b2        	ld	21170,a
7194                     ; 2417 }
7197  000b 84            	pop	a
7198  000c 81            	ret	
7304                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7304                     ; 2434 {
7305                     .text:	section	.text,new
7306  0000               _TIM1_SelectOutputTrigger:
7308  0000 88            	push	a
7309       00000000      OFST:	set	0
7312                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7314                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7316  0001 c652b1        	ld	a,21169
7317  0004 a48f          	and	a,#143
7318  0006 1a01          	or	a,(OFST+1,sp)
7319  0008 c752b1        	ld	21169,a
7320                     ; 2439 }
7323  000b 84            	pop	a
7324  000c 81            	ret	
7398                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7398                     ; 2452 {
7399                     .text:	section	.text,new
7400  0000               _TIM1_SelectSlaveMode:
7402  0000 88            	push	a
7403       00000000      OFST:	set	0
7406                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7408                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7410  0001 c652b2        	ld	a,21170
7411  0004 a4f8          	and	a,#248
7412  0006 1a01          	or	a,(OFST+1,sp)
7413  0008 c752b2        	ld	21170,a
7414                     ; 2459 }
7417  000b 84            	pop	a
7418  000c 81            	ret	
7454                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7454                     ; 2468 {
7455                     .text:	section	.text,new
7456  0000               _TIM1_SelectMasterSlaveMode:
7460                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7462                     ; 2473   if (NewState != DISABLE)
7464  0000 4d            	tnz	a
7465  0001 2705          	jreq	L7663
7466                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7468  0003 721e52b2      	bset	21170,#7
7471  0007 81            	ret	
7472  0008               L7663:
7473                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7475  0008 721f52b2      	bres	21170,#7
7476                     ; 2481 }
7479  000c 81            	ret	
7533                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7533                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7533                     ; 2501                     uint8_t ExtTRGFilter)
7533                     ; 2502 {
7534                     .text:	section	.text,new
7535  0000               _TIM1_ETRConfig:
7537  0000 89            	pushw	x
7538       00000000      OFST:	set	0
7541                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7543                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7543                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7543                     ; 2508                          | (uint8_t) ExtTRGFilter);
7545  0001 9f            	ld	a,xl
7546  0002 1a01          	or	a,(OFST+1,sp)
7547  0004 1a05          	or	a,(OFST+5,sp)
7548  0006 ca52b3        	or	a,21171
7549  0009 c752b3        	ld	21171,a
7550                     ; 2509 }
7553  000c 85            	popw	x
7554  000d 81            	ret	
7640                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7640                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7640                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7640                     ; 2550 {
7641                     .text:	section	.text,new
7642  0000               _TIM1_EncoderInterfaceConfig:
7644  0000 89            	pushw	x
7645       00000000      OFST:	set	0
7648                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7650                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7652                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7654                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7656  0001 9f            	ld	a,xl
7657  0002 4d            	tnz	a
7658  0003 2706          	jreq	L7573
7659                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7661  0005 721252bd      	bset	21181,#1
7663  0009 2004          	jra	L1673
7664  000b               L7573:
7665                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7667  000b 721352bd      	bres	21181,#1
7668  000f               L1673:
7669                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7671  000f 7b05          	ld	a,(OFST+5,sp)
7672  0011 2706          	jreq	L3673
7673                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7675  0013 721a52bd      	bset	21181,#5
7677  0017 2004          	jra	L5673
7678  0019               L3673:
7679                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7681  0019 721b52bd      	bres	21181,#5
7682  001d               L5673:
7683                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7685  001d c652b2        	ld	a,21170
7686  0020 a4f0          	and	a,#240
7687  0022 1a01          	or	a,(OFST+1,sp)
7688  0024 c752b2        	ld	21170,a
7689                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7691  0027 c652b9        	ld	a,21177
7692  002a a4fc          	and	a,#252
7693  002c aa01          	or	a,#1
7694  002e c752b9        	ld	21177,a
7695                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7697  0031 c652ba        	ld	a,21178
7698  0034 a4fc          	and	a,#252
7699  0036 aa01          	or	a,#1
7700  0038 c752ba        	ld	21178,a
7701                     ; 2581 }
7704  003b 85            	popw	x
7705  003c 81            	ret	
7741                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7741                     ; 2590 {
7742                     .text:	section	.text,new
7743  0000               _TIM1_SelectHallSensor:
7747                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7749                     ; 2595   if (NewState != DISABLE)
7751  0000 4d            	tnz	a
7752  0001 2705          	jreq	L5004
7753                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7755  0003 721e52b1      	bset	21169,#7
7758  0007 81            	ret	
7759  0008               L5004:
7760                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7762  0008 721f52b1      	bres	21169,#7
7763                     ; 2603 }
7766  000c 81            	ret	
7812                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7812                     ; 2624 {
7813                     .text:	section	.text,new
7814  0000               L3_TI1_Config:
7816  0000 89            	pushw	x
7817  0001 88            	push	a
7818       00000001      OFST:	set	1
7821                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7823  0002 721152bd      	bres	21181,#0
7824                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7824                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7826  0006 7b06          	ld	a,(OFST+5,sp)
7827  0008 97            	ld	xl,a
7828  0009 a610          	ld	a,#16
7829  000b 42            	mul	x,a
7830  000c 9f            	ld	a,xl
7831  000d 1a03          	or	a,(OFST+2,sp)
7832  000f 6b01          	ld	(OFST+0,sp),a
7834  0011 c652b9        	ld	a,21177
7835  0014 a40c          	and	a,#12
7836  0016 1a01          	or	a,(OFST+0,sp)
7837  0018 c752b9        	ld	21177,a
7838                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7840  001b 7b02          	ld	a,(OFST+1,sp)
7841  001d 2706          	jreq	L1304
7842                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7844  001f 721252bd      	bset	21181,#1
7846  0023 2004          	jra	L3304
7847  0025               L1304:
7848                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7850  0025 721352bd      	bres	21181,#1
7851  0029               L3304:
7852                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7854  0029 721052bd      	bset	21181,#0
7855                     ; 2647 }
7858  002d 5b03          	addw	sp,#3
7859  002f 81            	ret	
7905                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7905                     ; 2664 {
7906                     .text:	section	.text,new
7907  0000               L5_TI2_Config:
7909  0000 89            	pushw	x
7910  0001 88            	push	a
7911       00000001      OFST:	set	1
7914                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7916  0002 721952bd      	bres	21181,#4
7917                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7917                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7919  0006 7b06          	ld	a,(OFST+5,sp)
7920  0008 97            	ld	xl,a
7921  0009 a610          	ld	a,#16
7922  000b 42            	mul	x,a
7923  000c 9f            	ld	a,xl
7924  000d 1a03          	or	a,(OFST+2,sp)
7925  000f 6b01          	ld	(OFST+0,sp),a
7927  0011 c652ba        	ld	a,21178
7928  0014 a40c          	and	a,#12
7929  0016 1a01          	or	a,(OFST+0,sp)
7930  0018 c752ba        	ld	21178,a
7931                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7933  001b 7b02          	ld	a,(OFST+1,sp)
7934  001d 2706          	jreq	L5504
7935                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7937  001f 721a52bd      	bset	21181,#5
7939  0023 2004          	jra	L7504
7940  0025               L5504:
7941                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7943  0025 721b52bd      	bres	21181,#5
7944  0029               L7504:
7945                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7947  0029 721852bd      	bset	21181,#4
7948                     ; 2682 }
7951  002d 5b03          	addw	sp,#3
7952  002f 81            	ret	
7998                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7998                     ; 2699 {
7999                     .text:	section	.text,new
8000  0000               L7_TI3_Config:
8002  0000 89            	pushw	x
8003  0001 88            	push	a
8004       00000001      OFST:	set	1
8007                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8009  0002 721152be      	bres	21182,#0
8010                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8010                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8012  0006 7b06          	ld	a,(OFST+5,sp)
8013  0008 97            	ld	xl,a
8014  0009 a610          	ld	a,#16
8015  000b 42            	mul	x,a
8016  000c 9f            	ld	a,xl
8017  000d 1a03          	or	a,(OFST+2,sp)
8018  000f 6b01          	ld	(OFST+0,sp),a
8020  0011 c652bb        	ld	a,21179
8021  0014 a40c          	and	a,#12
8022  0016 1a01          	or	a,(OFST+0,sp)
8023  0018 c752bb        	ld	21179,a
8024                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8026  001b 7b02          	ld	a,(OFST+1,sp)
8027  001d 2706          	jreq	L1014
8028                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8030  001f 721252be      	bset	21182,#1
8032  0023 2004          	jra	L3014
8033  0025               L1014:
8034                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8036  0025 721352be      	bres	21182,#1
8037  0029               L3014:
8038                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8040  0029 721052be      	bset	21182,#0
8041                     ; 2718 }
8044  002d 5b03          	addw	sp,#3
8045  002f 81            	ret	
8091                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8091                     ; 2734 {
8092                     .text:	section	.text,new
8093  0000               L11_TI4_Config:
8095  0000 89            	pushw	x
8096  0001 88            	push	a
8097       00000001      OFST:	set	1
8100                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8102  0002 721952be      	bres	21182,#4
8103                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8103                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8105  0006 7b06          	ld	a,(OFST+5,sp)
8106  0008 97            	ld	xl,a
8107  0009 a610          	ld	a,#16
8108  000b 42            	mul	x,a
8109  000c 9f            	ld	a,xl
8110  000d 1a03          	or	a,(OFST+2,sp)
8111  000f 6b01          	ld	(OFST+0,sp),a
8113  0011 c652bc        	ld	a,21180
8114  0014 a40c          	and	a,#12
8115  0016 1a01          	or	a,(OFST+0,sp)
8116  0018 c752bc        	ld	21180,a
8117                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8119  001b 7b02          	ld	a,(OFST+1,sp)
8120  001d 2706          	jreq	L5214
8121                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8123  001f 721a52be      	bset	21182,#5
8125  0023 2004          	jra	L7214
8126  0025               L5214:
8127                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8129  0025 721b52be      	bres	21182,#5
8130  0029               L7214:
8131                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8133  0029 721852be      	bset	21182,#4
8134                     ; 2755 }
8137  002d 5b03          	addw	sp,#3
8138  002f 81            	ret	
8151                     	xdef	_TIM1_SelectHallSensor
8152                     	xdef	_TIM1_EncoderInterfaceConfig
8153                     	xdef	_TIM1_ETRConfig
8154                     	xdef	_TIM1_SelectMasterSlaveMode
8155                     	xdef	_TIM1_SelectSlaveMode
8156                     	xdef	_TIM1_SelectOutputTrigger
8157                     	xdef	_TIM1_SelectInputTrigger
8158                     	xdef	_TIM1_ETRClockMode2Config
8159                     	xdef	_TIM1_ETRClockMode1Config
8160                     	xdef	_TIM1_TIxExternalClockConfig
8161                     	xdef	_TIM1_InternalClockConfig
8162                     	xdef	_TIM1_SelectCCDMA
8163                     	xdef	_TIM1_DMACmd
8164                     	xdef	_TIM1_DMAConfig
8165                     	xdef	_TIM1_ClearITPendingBit
8166                     	xdef	_TIM1_GetITStatus
8167                     	xdef	_TIM1_ClearFlag
8168                     	xdef	_TIM1_GetFlagStatus
8169                     	xdef	_TIM1_GenerateEvent
8170                     	xdef	_TIM1_ITConfig
8171                     	xdef	_TIM1_SetIC4Prescaler
8172                     	xdef	_TIM1_SetIC3Prescaler
8173                     	xdef	_TIM1_SetIC2Prescaler
8174                     	xdef	_TIM1_SetIC1Prescaler
8175                     	xdef	_TIM1_GetCapture4
8176                     	xdef	_TIM1_GetCapture3
8177                     	xdef	_TIM1_GetCapture2
8178                     	xdef	_TIM1_GetCapture1
8179                     	xdef	_TIM1_PWMIConfig
8180                     	xdef	_TIM1_ICInit
8181                     	xdef	_TIM1_CCxNCmd
8182                     	xdef	_TIM1_CCxCmd
8183                     	xdef	_TIM1_SelectCOM
8184                     	xdef	_TIM1_SelectOCREFClear
8185                     	xdef	_TIM1_OC3NPolarityConfig
8186                     	xdef	_TIM1_OC3PolarityConfig
8187                     	xdef	_TIM1_OC2NPolarityConfig
8188                     	xdef	_TIM1_OC2PolarityConfig
8189                     	xdef	_TIM1_OC1NPolarityConfig
8190                     	xdef	_TIM1_OC1PolarityConfig
8191                     	xdef	_TIM1_ClearOC4Ref
8192                     	xdef	_TIM1_ClearOC3Ref
8193                     	xdef	_TIM1_ClearOC2Ref
8194                     	xdef	_TIM1_ClearOC1Ref
8195                     	xdef	_TIM1_OC3FastConfig
8196                     	xdef	_TIM1_OC2FastConfig
8197                     	xdef	_TIM1_OC1FastConfig
8198                     	xdef	_TIM1_OC4PreloadConfig
8199                     	xdef	_TIM1_OC3PreloadConfig
8200                     	xdef	_TIM1_OC2PreloadConfig
8201                     	xdef	_TIM1_OC1PreloadConfig
8202                     	xdef	_TIM1_ForcedOC3Config
8203                     	xdef	_TIM1_ForcedOC2Config
8204                     	xdef	_TIM1_ForcedOC1Config
8205                     	xdef	_TIM1_CCPreloadControl
8206                     	xdef	_TIM1_SetCompare4
8207                     	xdef	_TIM1_SetCompare3
8208                     	xdef	_TIM1_SetCompare2
8209                     	xdef	_TIM1_SetCompare1
8210                     	xdef	_TIM1_SelectOCxM
8211                     	xdef	_TIM1_CtrlPWMOutputs
8212                     	xdef	_TIM1_BDTRConfig
8213                     	xdef	_TIM1_OC3Init
8214                     	xdef	_TIM1_OC2Init
8215                     	xdef	_TIM1_OC1Init
8216                     	xdef	_TIM1_Cmd
8217                     	xdef	_TIM1_SelectOnePulseMode
8218                     	xdef	_TIM1_ARRPreloadConfig
8219                     	xdef	_TIM1_UpdateRequestConfig
8220                     	xdef	_TIM1_UpdateDisableConfig
8221                     	xdef	_TIM1_GetPrescaler
8222                     	xdef	_TIM1_GetCounter
8223                     	xdef	_TIM1_SetAutoreload
8224                     	xdef	_TIM1_SetCounter
8225                     	xdef	_TIM1_CounterModeConfig
8226                     	xdef	_TIM1_PrescalerConfig
8227                     	xdef	_TIM1_TimeBaseInit
8228                     	xdef	_TIM1_DeInit
8247                     	end
