   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 232 ErrorStatus RTC_DeInit(void)
  17                     ; 233 {
  18                     	scross	off
  19  0000               _RTC_DeInit:
  20  0000 5205          	subw	sp,#5
  21       00000005      OFST:	set	5
  23                     ; 234   ErrorStatus status = ERROR;
  24                     ; 235   uint16_t wutwfcount = 0;
  25  0002 5f            	clrw	x
  26  0003 1f02          	ldw	(OFST-3,sp),x
  27                     ; 236   uint16_t recalpfcount = 0;
  28  0005 1f04          	ldw	(OFST-1,sp),x
  29                     ; 239   RTC->WPR = 0xCA;
  30  0007 35ca5159      	mov	20825,#202
  31                     ; 240   RTC->WPR = 0x53;
  32  000b 35535159      	mov	20825,#83
  33                     ; 243   if (RTC_EnterInitMode() == ERROR)
  34  000f cd0134        	call	_RTC_EnterInitMode
  36  0012 4d            	tnz	a
  37  0013 260b          	jrne	L7
  38                     ; 245     status = ERROR;
  39  0015               LC002:
  40  0015 6b01          	ld	(OFST-4,sp),a
  41                     ; 247     RTC->WPR = 0xFF; 
  43  0017               L11:
  44  0017 35ff5159      	mov	20825,#255
  45                     ; 343   return (ErrorStatus)status;
  46  001b 7b01          	ld	a,(OFST-4,sp)
  48  001d 5b05          	addw	sp,#5
  49  001f 81            	ret	
  50  0020               L7:
  51                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
  52  0020 725f5140      	clr	20800
  53                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
  54  0024 725f5141      	clr	20801
  55                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
  56  0028 725f5142      	clr	20802
  57                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
  58  002c 35015144      	mov	20804,#1
  59                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
  60  0030 35215145      	mov	20805,#33
  61                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
  62  0034 725f5146      	clr	20806
  63                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
  64  0038 725f5150      	clr	20816
  65                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
  66  003c 35ff5151      	mov	20817,#255
  67                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
  68  0040 357f5152      	mov	20818,#127
  69                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
  70  0044 725f516c      	clr	20844
  71                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
  72  0048 725f516d      	clr	20845
  73                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
  74  004c 725f5148      	clr	20808
  75                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
  76  0050 725f5149      	clr	20809
  77                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
  78  0054 725f514a      	clr	20810
  80  0058 2007          	jra	L71
  81  005a               L31:
  82                     ; 278       wutwfcount++;
  83  005a 5c            	incw	x
  84  005b 1f02          	ldw	(OFST-3,sp),x
  85                     ; 279       RTC->ISR1 = 0;
  86  005d 725f514c      	clr	20812
  87  0061               L71:
  88                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
  89  0061 7204514c07    	btjt	20812,#2,L32
  91  0066 1e02          	ldw	x,(OFST-3,sp)
  92  0068 a3ffff        	cpw	x,#65535
  93  006b 26ed          	jrne	L31
  94  006d               L32:
  95                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
  96  006d 7204514c02    	btjt	20812,#2,L52
  97                     ; 284       status = ERROR;
  98                     ; 286       RTC->WPR = 0xFF; 
 100  0072 2061          	jp	L34
 101  0074               L52:
 102                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 103  0074 725f5148      	clr	20808
 104                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 105  0078 35ff5154      	mov	20820,#255
 106                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 107  007c 35ff5155      	mov	20821,#255
 108                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 109  0080 725f515c      	clr	20828
 110                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 111  0084 725f515d      	clr	20829
 112                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 113  0088 725f515e      	clr	20830
 114                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 115  008c 725f515f      	clr	20831
 116                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 117  0090 725f5164      	clr	20836
 118                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 119  0094 725f5165      	clr	20837
 120                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 121  0098 725f5166      	clr	20838
 122                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 123  009c 725f514c      	clr	20812
 124                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 125  00a0 725f514d      	clr	20813
 126                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 127  00a4 7203514c11    	btjf	20812,#1,L13
 129  00a9 2003          	jra	L53
 130  00ab               L33:
 131                     ; 315           recalpfcount++;
 132  00ab 5c            	incw	x
 133  00ac 1f04          	ldw	(OFST-1,sp),x
 134  00ae               L53:
 135                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 136  00ae 7203514c07    	btjf	20812,#1,L13
 138  00b3 1e04          	ldw	x,(OFST-1,sp)
 139  00b5 a3ffff        	cpw	x,#65535
 140  00b8 26f1          	jrne	L33
 141  00ba               L13:
 142                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 143  00ba 7202514c16    	btjt	20812,#1,L34
 144                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 145  00bf 725f516a      	clr	20842
 146                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 147  00c3 725f516b      	clr	20843
 148                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 149  00c7 cd015a        	call	_RTC_WaitForSynchro
 151  00ca 4d            	tnz	a
 152                     ; 325           status = ERROR;
 154  00cb 2603cc0015    	jreq	LC002
 155                     ; 329           status = SUCCESS;
 156  00d0 a601          	ld	a,#1
 157  00d2 cc0015        	jp	LC002
 158  00d5               L34:
 159                     ; 334         status = ERROR;
 160  00d5 0f01          	clr	(OFST-4,sp)
 161                     ; 338       RTC->WPR = 0xFF; 
 162  00d7 cc0017        	jra	L11
 164                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 164                     ; 360 {
 165  00da               _RTC_Init:
 166  00da 89            	pushw	x
 167  00db 88            	push	a
 168       00000001      OFST:	set	1
 170                     ; 361   ErrorStatus status = ERROR;
 171                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 172                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 173                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 174                     ; 369   RTC->WPR = 0xCA;
 175  00dc 35ca5159      	mov	20825,#202
 176                     ; 370   RTC->WPR = 0x53;
 177  00e0 35535159      	mov	20825,#83
 178                     ; 373   if (RTC_EnterInitMode() == ERROR)
 179  00e4 ad4e          	call	_RTC_EnterInitMode
 181  00e6 4d            	tnz	a
 182                     ; 375     status = ERROR;
 184  00e7 2727          	jreq	L55
 185                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 186  00e9 721d5148      	bres	20808,#6
 187                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 188  00ed 1e02          	ldw	x,(OFST+1,sp)
 189  00ef c65148        	ld	a,20808
 190  00f2 fa            	or	a,(x)
 191  00f3 c75148        	ld	20808,a
 192                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 193  00f6 ee02          	ldw	x,(2,x)
 194  00f8 4f            	clr	a
 195  00f9 01            	rrwa	x,a
 196  00fa 9f            	ld	a,xl
 197  00fb c75150        	ld	20816,a
 198                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 199  00fe 1e02          	ldw	x,(OFST+1,sp)
 200  0100 e603          	ld	a,(3,x)
 201  0102 c75151        	ld	20817,a
 202                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 203  0105 e601          	ld	a,(1,x)
 204  0107 c75152        	ld	20818,a
 205                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 206  010a 721f514c      	bres	20812,#7
 207                     ; 393     status = SUCCESS;
 208  010e a601          	ld	a,#1
 209  0110               L55:
 210                     ; 397   RTC->WPR = 0xFF; 
 211  0110 35ff5159      	mov	20825,#255
 212                     ; 400   return (ErrorStatus)(status);
 214  0114 5b03          	addw	sp,#3
 215  0116 81            	ret	
 217                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 217                     ; 411 {
 218  0117               _RTC_StructInit:
 220                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 221  0117 7f            	clr	(x)
 222                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 223  0118 a67f          	ld	a,#127
 224  011a e701          	ld	(1,x),a
 225                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 226  011c 90ae00ff      	ldw	y,#255
 227  0120 ef02          	ldw	(2,x),y
 228                     ; 420 }
 229  0122 81            	ret	
 231                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 231                     ; 431 {
 232  0123               _RTC_WriteProtectionCmd:
 234                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 235                     ; 435   if (NewState != DISABLE)
 236  0123 4d            	tnz	a
 237  0124 2705          	jreq	L75
 238                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 239  0126 35ff5159      	mov	20825,#255
 241  012a 81            	ret	
 242  012b               L75:
 243                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 244  012b 35ca5159      	mov	20825,#202
 245                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 246  012f 35535159      	mov	20825,#83
 247                     ; 446 }
 248  0133 81            	ret	
 250                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 250                     ; 459 {
 251  0134               _RTC_EnterInitMode:
 252       00000003      OFST:	set	3
 254                     ; 460   ErrorStatus status = ERROR;
 255                     ; 461   uint16_t initfcount = 0;
 256  0134 5f            	clrw	x
 257                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 258  0135 720c514c11    	btjt	20812,#6,L36
 259                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 260  013a 3580514c      	mov	20812,#128
 262  013e 2001          	jra	L17
 263  0140               L56:
 264                     ; 472       initfcount++;
 265  0140 5c            	incw	x
 266  0141               L17:
 267                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 268  0141 720c514c05    	btjt	20812,#6,L36
 270  0146 a3ffff        	cpw	x,#65535
 271  0149 26f5          	jrne	L56
 272  014b               L36:
 273                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 274  014b 720c514c02    	btjt	20812,#6,L77
 275                     ; 478     status = ERROR;
 276  0150 4f            	clr	a
 278  0151 81            	ret	
 279  0152               L77:
 280                     ; 482     status = SUCCESS;
 281  0152 a601          	ld	a,#1
 282                     ; 485   return (ErrorStatus)status;
 284  0154 81            	ret	
 286                     ; 498 void RTC_ExitInitMode(void)
 286                     ; 499 {
 287  0155               _RTC_ExitInitMode:
 289                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 290  0155 721f514c      	bres	20812,#7
 291                     ; 502 }
 292  0159 81            	ret	
 294                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 294                     ; 528 {
 295  015a               _RTC_WaitForSynchro:
 296  015a 5203          	subw	sp,#3
 297       00000003      OFST:	set	3
 299                     ; 529   uint16_t rsfcount = 0;
 300  015c 5f            	clrw	x
 301  015d 1f02          	ldw	(OFST-1,sp),x
 302                     ; 530   ErrorStatus status = ERROR;
 303                     ; 533   RTC->WPR = 0xCA;
 304  015f 35ca5159      	mov	20825,#202
 305                     ; 534   RTC->WPR = 0x53;
 306  0163 35535159      	mov	20825,#83
 307                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 308  0167 c6514c        	ld	a,20812
 309  016a a45f          	and	a,#95
 310  016c c7514c        	ld	20812,a
 312  016f 2003          	jra	L501
 313  0171               L301:
 314                     ; 542     rsfcount++;
 315  0171 5c            	incw	x
 316  0172 1f02          	ldw	(OFST-1,sp),x
 317  0174               L501:
 318                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 319  0174 720a514c05    	btjt	20812,#5,L111
 321  0179 a3ffff        	cpw	x,#65535
 322  017c 26f3          	jrne	L301
 323  017e               L111:
 324                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 325  017e 720b514c06    	btjf	20812,#5,L311
 326                     ; 548     status = SUCCESS;
 327  0183 a601          	ld	a,#1
 328  0185 6b01          	ld	(OFST-2,sp),a
 330  0187 2002          	jra	L511
 331  0189               L311:
 332                     ; 552     status = ERROR;
 333  0189 0f01          	clr	(OFST-2,sp)
 334  018b               L511:
 335                     ; 556   RTC->WPR = 0xFF; 
 336  018b 35ff5159      	mov	20825,#255
 337                     ; 558   return (ErrorStatus)status;
 338  018f 7b01          	ld	a,(OFST-2,sp)
 340  0191 5b03          	addw	sp,#3
 341  0193 81            	ret	
 343                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 343                     ; 569 {
 344  0194               _RTC_RatioCmd:
 346                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 347                     ; 574   RTC->WPR = 0xCA;
 348  0194 35ca5159      	mov	20825,#202
 349                     ; 575   RTC->WPR = 0x53;
 350  0198 35535159      	mov	20825,#83
 351                     ; 577   if (NewState != DISABLE)
 352  019c 4d            	tnz	a
 353  019d 2706          	jreq	L711
 354                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 355  019f 721a5148      	bset	20808,#5
 357  01a3 2004          	jra	L121
 358  01a5               L711:
 359                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 360  01a5 721b5148      	bres	20808,#5
 361  01a9               L121:
 362                     ; 589   RTC->WPR = 0xFF; 
 363  01a9 35ff5159      	mov	20825,#255
 364                     ; 590 }
 365  01ad 81            	ret	
 367                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 367                     ; 599 {
 368  01ae               _RTC_BypassShadowCmd:
 370                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
 371                     ; 604   RTC->WPR = 0xCA;
 372  01ae 35ca5159      	mov	20825,#202
 373                     ; 605   RTC->WPR = 0x53;
 374  01b2 35535159      	mov	20825,#83
 375                     ; 607   if (NewState != DISABLE)
 376  01b6 4d            	tnz	a
 377  01b7 2706          	jreq	L321
 378                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 379  01b9 72185148      	bset	20808,#4
 381  01bd 2004          	jra	L521
 382  01bf               L321:
 383                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 384  01bf 72195148      	bres	20808,#4
 385  01c3               L521:
 386                     ; 619   RTC->WPR = 0xFF; 
 387  01c3 35ff5159      	mov	20825,#255
 388                     ; 620 }
 389  01c7 81            	ret	
 391                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
 391                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
 391                     ; 661 {
 392  01c8               _RTC_SetTime:
 393  01c8 88            	push	a
 394  01c9 88            	push	a
 395       00000001      OFST:	set	1
 397                     ; 662   ErrorStatus status = ERROR;
 398                     ; 663   uint8_t temp = 0;
 399                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
 400                     ; 668   if (RTC_Format == RTC_Format_BIN)
 401                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 402                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
 403                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
 405                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
 406                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
 407                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
 409                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 410                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
 411                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
 413  01ca c65148        	ld	a,20808
 414                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
 415                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
 416                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
 417                     ; 701   RTC->WPR = 0xCA;
 418  01cd 35ca5159      	mov	20825,#202
 419                     ; 702   RTC->WPR = 0x53;
 420  01d1 35535159      	mov	20825,#83
 421                     ; 705   if (RTC_EnterInitMode() == ERROR)
 422  01d5 cd0134        	call	_RTC_EnterInitMode
 424  01d8 4d            	tnz	a
 425  01d9 2606          	jrne	L341
 426                     ; 707     status = ERROR;
 427                     ; 709     RTC->WPR = 0xFF; 
 428  01db 35ff5159      	mov	20825,#255
 430  01df 2059          	jra	L541
 431  01e1               L341:
 432                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 433  01e1 720d514808    	btjf	20808,#6,L741
 434                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
 435                     ; 717       temp = RTC_TimeStruct->RTC_H12;
 436  01e6 1e05          	ldw	x,(OFST+4,sp)
 437  01e8 e603          	ld	a,(3,x)
 438  01ea 6b01          	ld	(OFST+0,sp),a
 440  01ec 2002          	jra	L151
 441  01ee               L741:
 442                     ; 721       temp = 0;
 443  01ee 0f01          	clr	(OFST+0,sp)
 444  01f0               L151:
 445                     ; 724     if (RTC_Format != RTC_Format_BIN)
 446  01f0 7b02          	ld	a,(OFST+1,sp)
 447  01f2 270f          	jreq	L351
 448                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
 449  01f4 1e05          	ldw	x,(OFST+4,sp)
 450  01f6 e602          	ld	a,(2,x)
 451  01f8 c75140        	ld	20800,a
 452                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
 453  01fb e601          	ld	a,(1,x)
 454  01fd c75141        	ld	20801,a
 455                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
 456  0200 f6            	ld	a,(x)
 458  0201 201a          	jra	L551
 459  0203               L351:
 460                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
 461  0203 1e05          	ldw	x,(OFST+4,sp)
 462  0205 e602          	ld	a,(2,x)
 463  0207 cd0825        	call	L3_ByteToBcd2
 465  020a c75140        	ld	20800,a
 466                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
 467  020d 1e05          	ldw	x,(OFST+4,sp)
 468  020f e601          	ld	a,(1,x)
 469  0211 cd0825        	call	L3_ByteToBcd2
 471  0214 c75141        	ld	20801,a
 472                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
 473  0217 1e05          	ldw	x,(OFST+4,sp)
 474  0219 f6            	ld	a,(x)
 475  021a cd0825        	call	L3_ByteToBcd2
 477  021d               L551:
 478  021d 1a01          	or	a,(OFST+0,sp)
 479  021f c75142        	ld	20802,a
 480                     ; 737     (void)(RTC->DR3);
 481  0222 c65146        	ld	a,20806
 482                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 483  0225 721f514c      	bres	20812,#7
 484                     ; 743     RTC->WPR = 0xFF; 
 485  0229 35ff5159      	mov	20825,#255
 486                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
 487  022d 7208514806    	btjt	20808,#4,L751
 488                     ; 748       if (RTC_WaitForSynchro() == ERROR)
 489  0232 cd015a        	call	_RTC_WaitForSynchro
 491  0235 4d            	tnz	a
 492                     ; 750         status = ERROR;
 494  0236 2702          	jreq	L541
 495                     ; 754         status = SUCCESS;
 496  0238               L751:
 497                     ; 759       status = SUCCESS;
 498  0238 a601          	ld	a,#1
 499  023a               L541:
 500                     ; 763   return (ErrorStatus)status;
 502  023a 85            	popw	x
 503  023b 81            	ret	
 505                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
 505                     ; 776 {
 506  023c               _RTC_TimeStructInit:
 508                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
 509  023c 6f03          	clr	(3,x)
 510                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
 511  023e 7f            	clr	(x)
 512                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
 513  023f 6f01          	clr	(1,x)
 514                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
 515  0241 6f02          	clr	(2,x)
 516                     ; 782 }
 517  0243 81            	ret	
 519                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
 519                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
 519                     ; 800 {
 520  0244               _RTC_GetTime:
 521  0244 88            	push	a
 522  0245 88            	push	a
 523       00000001      OFST:	set	1
 525                     ; 801   uint8_t  tmpreg = 0;
 526                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
 527                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
 528  0246 1e05          	ldw	x,(OFST+4,sp)
 529  0248 c65140        	ld	a,20800
 530  024b e702          	ld	(2,x),a
 531                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
 532  024d c65141        	ld	a,20801
 533  0250 e701          	ld	(1,x),a
 534                     ; 814   tmpreg = (uint8_t)RTC->TR3;
 535  0252 c65142        	ld	a,20802
 536  0255 6b01          	ld	(OFST+0,sp),a
 537                     ; 817   (void) (RTC->DR3) ;
 538  0257 c65146        	ld	a,20806
 539                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
 540  025a 7b01          	ld	a,(OFST+0,sp)
 541  025c a4bf          	and	a,#191
 542  025e f7            	ld	(x),a
 543                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
 544  025f 7b01          	ld	a,(OFST+0,sp)
 545  0261 a440          	and	a,#64
 546  0263 e703          	ld	(3,x),a
 547                     ; 827   if (RTC_Format == RTC_Format_BIN)
 548  0265 7b02          	ld	a,(OFST+1,sp)
 549  0267 2619          	jrne	L761
 550                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
 551  0269 f6            	ld	a,(x)
 552  026a cd0842        	call	L5_Bcd2ToByte
 554  026d 1e05          	ldw	x,(OFST+4,sp)
 555  026f f7            	ld	(x),a
 556                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
 557  0270 e601          	ld	a,(1,x)
 558  0272 cd0842        	call	L5_Bcd2ToByte
 560  0275 1e05          	ldw	x,(OFST+4,sp)
 561  0277 e701          	ld	(1,x),a
 562                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
 563  0279 e602          	ld	a,(2,x)
 564  027b cd0842        	call	L5_Bcd2ToByte
 566  027e 1e05          	ldw	x,(OFST+4,sp)
 567  0280 e702          	ld	(2,x),a
 568  0282               L761:
 569                     ; 834 }
 570  0282 85            	popw	x
 571  0283 81            	ret	
 573                     ; 845 uint16_t RTC_GetSubSecond(void)
 573                     ; 846 {
 574  0284               _RTC_GetSubSecond:
 575  0284 5206          	subw	sp,#6
 576       00000006      OFST:	set	6
 578                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
 580                     ; 848   uint16_t ssrreg = 0;
 581                     ; 851   ssrhreg = RTC->SSRH;
 582  0286 c65157        	ld	a,20823
 583  0289 6b03          	ld	(OFST-3,sp),a
 584                     ; 852   ssrlreg = RTC->SSRL;
 585  028b c65158        	ld	a,20824
 586  028e 6b04          	ld	(OFST-2,sp),a
 587                     ; 855   (void) (RTC->DR3);
 588  0290 c65146        	ld	a,20806
 589                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
 590  0293 7b04          	ld	a,(OFST-2,sp)
 591  0295 5f            	clrw	x
 592  0296 97            	ld	xl,a
 593  0297 1f01          	ldw	(OFST-5,sp),x
 594  0299 5f            	clrw	x
 595  029a 7b03          	ld	a,(OFST-3,sp)
 596  029c 97            	ld	xl,a
 597  029d 7b02          	ld	a,(OFST-4,sp)
 598  029f 01            	rrwa	x,a
 599  02a0 1a01          	or	a,(OFST-5,sp)
 600  02a2 01            	rrwa	x,a
 601                     ; 859   return (uint16_t)(ssrreg);
 603  02a3 5b06          	addw	sp,#6
 604  02a5 81            	ret	
 606                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
 606                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
 606                     ; 878 {
 607  02a6               _RTC_SetDate:
 608  02a6 88            	push	a
 609  02a7 89            	pushw	x
 610       00000002      OFST:	set	2
 612                     ; 879   ErrorStatus status = ERROR;
 613                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
 614  02a8 4d            	tnz	a
 615  02a9 2610          	jrne	L171
 617  02ab 1e06          	ldw	x,(OFST+4,sp)
 618  02ad e601          	ld	a,(1,x)
 619  02af a410          	and	a,#16
 620  02b1 2708          	jreq	L171
 621                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
 622  02b3 e601          	ld	a,(1,x)
 623  02b5 a4ef          	and	a,#239
 624  02b7 ab0a          	add	a,#10
 625  02b9 e701          	ld	(1,x),a
 626  02bb               L171:
 627                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
 628                     ; 888   if (RTC_Format == RTC_Format_BIN)
 629                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
 630                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
 631                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
 632                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
 633                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
 635                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
 636                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
 637                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
 638                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
 639                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
 640                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
 641                     ; 907   RTC->WPR = 0xCA;
 642  02bb 35ca5159      	mov	20825,#202
 643                     ; 908   RTC->WPR = 0x53;
 644  02bf 35535159      	mov	20825,#83
 645                     ; 911   if (RTC_EnterInitMode() == ERROR)
 646  02c3 cd0134        	call	_RTC_EnterInitMode
 648  02c6 4d            	tnz	a
 649  02c7 2606          	jrne	L771
 650                     ; 913     status = ERROR;
 651                     ; 915     RTC->WPR = 0xFF; 
 652  02c9 35ff5159      	mov	20825,#255
 654  02cd 205e          	jra	L102
 655  02cf               L771:
 656                     ; 919     (void)(RTC->TR1);
 657  02cf c65140        	ld	a,20800
 658                     ; 922     if (RTC_Format != RTC_Format_BIN)
 659  02d2 7b03          	ld	a,(OFST+1,sp)
 660  02d4 2718          	jreq	L302
 661                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
 662  02d6 1e06          	ldw	x,(OFST+4,sp)
 663  02d8 e602          	ld	a,(2,x)
 664  02da c75144        	ld	20804,a
 665                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
 666  02dd f6            	ld	a,(x)
 667  02de 97            	ld	xl,a
 668  02df a620          	ld	a,#32
 669  02e1 42            	mul	x,a
 670  02e2 9f            	ld	a,xl
 671  02e3 1e06          	ldw	x,(OFST+4,sp)
 672  02e5 ea01          	or	a,(1,x)
 673  02e7 c75145        	ld	20805,a
 674                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
 675  02ea e603          	ld	a,(3,x)
 677  02ec 2027          	jra	L502
 678  02ee               L302:
 679                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
 680  02ee 1e06          	ldw	x,(OFST+4,sp)
 681  02f0 e602          	ld	a,(2,x)
 682  02f2 cd0825        	call	L3_ByteToBcd2
 684  02f5 c75144        	ld	20804,a
 685                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
 686  02f8 1e06          	ldw	x,(OFST+4,sp)
 687  02fa f6            	ld	a,(x)
 688  02fb 97            	ld	xl,a
 689  02fc a620          	ld	a,#32
 690  02fe 42            	mul	x,a
 691  02ff 9f            	ld	a,xl
 692  0300 6b01          	ld	(OFST-1,sp),a
 693  0302 1e06          	ldw	x,(OFST+4,sp)
 694  0304 e601          	ld	a,(1,x)
 695  0306 cd0825        	call	L3_ByteToBcd2
 697  0309 1a01          	or	a,(OFST-1,sp)
 698  030b c75145        	ld	20805,a
 699                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
 700  030e 1e06          	ldw	x,(OFST+4,sp)
 701  0310 e603          	ld	a,(3,x)
 702  0312 cd0825        	call	L3_ByteToBcd2
 704  0315               L502:
 705  0315 c75146        	ld	20806,a
 706                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 707  0318 721f514c      	bres	20812,#7
 708                     ; 939     RTC->WPR = 0xFF; 
 709  031c 35ff5159      	mov	20825,#255
 710                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
 711  0320 7208514806    	btjt	20808,#4,L702
 712                     ; 944       if (RTC_WaitForSynchro() == ERROR)
 713  0325 cd015a        	call	_RTC_WaitForSynchro
 715  0328 4d            	tnz	a
 716                     ; 946         status = ERROR;
 718  0329 2702          	jreq	L102
 719                     ; 950         status = SUCCESS;
 720  032b               L702:
 721                     ; 955       status = SUCCESS;
 722  032b a601          	ld	a,#1
 723  032d               L102:
 724                     ; 959   return (ErrorStatus)status;
 726  032d 5b03          	addw	sp,#3
 727  032f 81            	ret	
 729                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
 729                     ; 969 {
 730  0330               _RTC_DateStructInit:
 732                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
 733  0330 a601          	ld	a,#1
 734  0332 f7            	ld	(x),a
 735                     ; 972   RTC_DateStruct->RTC_Date = 1;
 736  0333 e702          	ld	(2,x),a
 737                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
 738  0335 e701          	ld	(1,x),a
 739                     ; 974   RTC_DateStruct->RTC_Year = 0;
 740  0337 6f03          	clr	(3,x)
 741                     ; 975 }
 742  0339 81            	ret	
 744                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
 744                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
 744                     ; 990 {
 745  033a               _RTC_GetDate:
 746  033a 88            	push	a
 747  033b 88            	push	a
 748       00000001      OFST:	set	1
 750                     ; 991   uint8_t tmpreg = 0;
 751                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
 752                     ; 997   (void) (RTC->TR1) ;
 753  033c c65140        	ld	a,20800
 754                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
 755  033f 1e05          	ldw	x,(OFST+4,sp)
 756  0341 c65144        	ld	a,20804
 757  0344 e702          	ld	(2,x),a
 758                     ; 999   tmpreg = (uint8_t)RTC->DR2;
 759  0346 c65145        	ld	a,20805
 760  0349 6b01          	ld	(OFST+0,sp),a
 761                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
 762  034b c65146        	ld	a,20806
 763  034e e703          	ld	(3,x),a
 764                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
 765  0350 7b01          	ld	a,(OFST+0,sp)
 766  0352 a41f          	and	a,#31
 767  0354 e701          	ld	(1,x),a
 768                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
 769  0356 7b01          	ld	a,(OFST+0,sp)
 770  0358 4e            	swap	a
 771  0359 a40e          	and	a,#14
 772  035b 44            	srl	a
 773  035c f7            	ld	(x),a
 774                     ; 1007   if (RTC_Format == RTC_Format_BIN)
 775  035d 7b02          	ld	a,(OFST+1,sp)
 776  035f 261b          	jrne	L712
 777                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
 778  0361 e603          	ld	a,(3,x)
 779  0363 cd0842        	call	L5_Bcd2ToByte
 781  0366 1e05          	ldw	x,(OFST+4,sp)
 782  0368 e703          	ld	(3,x),a
 783                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
 784  036a e601          	ld	a,(1,x)
 785  036c cd0842        	call	L5_Bcd2ToByte
 787  036f 1e05          	ldw	x,(OFST+4,sp)
 788  0371 e701          	ld	(1,x),a
 789                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
 790  0373 e602          	ld	a,(2,x)
 791  0375 cd0842        	call	L5_Bcd2ToByte
 793  0378 1e05          	ldw	x,(OFST+4,sp)
 794  037a e702          	ld	(2,x),a
 795  037c               L712:
 796                     ; 1014 }
 797  037c 85            	popw	x
 798  037d 81            	ret	
 800                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
 800                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
 800                     ; 1046 {
 801  037e               _RTC_SetAlarm:
 802  037e 88            	push	a
 803  037f 5205          	subw	sp,#5
 804       00000005      OFST:	set	5
 806                     ; 1047   uint8_t tmpreg1 = 0;
 807                     ; 1048   uint8_t tmpreg2 = 0;
 808                     ; 1049   uint8_t tmpreg3 = 0;
 809                     ; 1050   uint8_t tmpreg4 = 0;
 810                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
 811                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
 812                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
 813                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
 814                     ; 1059   if (RTC_Format == RTC_Format_BIN)
 815                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 816                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
 817                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
 819                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
 820                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
 821                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
 823                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 824                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
 825                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
 827  0381 c65148        	ld	a,20808
 828                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
 829                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
 830                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
 831                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
 832                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
 833                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
 835                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
 836                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
 837                     ; 1108   RTC->WPR = 0xCA;
 838  0384 35ca5159      	mov	20825,#202
 839                     ; 1109   RTC->WPR = 0x53;
 840  0388 35535159      	mov	20825,#83
 841                     ; 1113   if (RTC_Format != RTC_Format_BIN)
 842  038c 7b06          	ld	a,(OFST+1,sp)
 843  038e 2731          	jreq	L342
 844                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
 844                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
 845  0390 1e09          	ldw	x,(OFST+4,sp)
 846  0392 e604          	ld	a,(4,x)
 847  0394 a480          	and	a,#128
 848  0396 ea02          	or	a,(2,x)
 849  0398 6b02          	ld	(OFST-3,sp),a
 850                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
 850                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
 851  039a e604          	ld	a,(4,x)
 852  039c 48            	sll	a
 853  039d a480          	and	a,#128
 854  039f ea01          	or	a,(1,x)
 855  03a1 6b03          	ld	(OFST-2,sp),a
 856                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
 856                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
 856                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
 857  03a3 e604          	ld	a,(4,x)
 858  03a5 48            	sll	a
 859  03a6 48            	sll	a
 860  03a7 a480          	and	a,#128
 861  03a9 6b01          	ld	(OFST-4,sp),a
 862  03ab e603          	ld	a,(3,x)
 863  03ad fa            	or	a,(x)
 864  03ae 1a01          	or	a,(OFST-4,sp)
 865  03b0 6b04          	ld	(OFST-1,sp),a
 866                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
 866                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
 866                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
 867  03b2 e604          	ld	a,(4,x)
 868  03b4 48            	sll	a
 869  03b5 48            	sll	a
 870  03b6 48            	sll	a
 871  03b7 a480          	and	a,#128
 872  03b9 6b01          	ld	(OFST-4,sp),a
 873  03bb e605          	ld	a,(5,x)
 874  03bd ea06          	or	a,(6,x)
 876  03bf 204b          	jra	L542
 877  03c1               L342:
 878                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
 878                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
 879  03c1 1e09          	ldw	x,(OFST+4,sp)
 880  03c3 e604          	ld	a,(4,x)
 881  03c5 a480          	and	a,#128
 882  03c7 6b01          	ld	(OFST-4,sp),a
 883  03c9 e602          	ld	a,(2,x)
 884  03cb cd0825        	call	L3_ByteToBcd2
 886  03ce 1a01          	or	a,(OFST-4,sp)
 887  03d0 6b02          	ld	(OFST-3,sp),a
 888                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
 888                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
 889  03d2 1e09          	ldw	x,(OFST+4,sp)
 890  03d4 e604          	ld	a,(4,x)
 891  03d6 48            	sll	a
 892  03d7 a480          	and	a,#128
 893  03d9 6b01          	ld	(OFST-4,sp),a
 894  03db e601          	ld	a,(1,x)
 895  03dd cd0825        	call	L3_ByteToBcd2
 897  03e0 1a01          	or	a,(OFST-4,sp)
 898  03e2 6b03          	ld	(OFST-2,sp),a
 899                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
 899                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
 899                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
 900  03e4 1e09          	ldw	x,(OFST+4,sp)
 901  03e6 e604          	ld	a,(4,x)
 902  03e8 48            	sll	a
 903  03e9 48            	sll	a
 904  03ea a480          	and	a,#128
 905  03ec 6b01          	ld	(OFST-4,sp),a
 906  03ee f6            	ld	a,(x)
 907  03ef cd0825        	call	L3_ByteToBcd2
 909  03f2 1e09          	ldw	x,(OFST+4,sp)
 910  03f4 ea03          	or	a,(3,x)
 911  03f6 1a01          	or	a,(OFST-4,sp)
 912  03f8 6b04          	ld	(OFST-1,sp),a
 913                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
 913                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
 913                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
 914  03fa e604          	ld	a,(4,x)
 915  03fc 48            	sll	a
 916  03fd 48            	sll	a
 917  03fe 48            	sll	a
 918  03ff a480          	and	a,#128
 919  0401 6b01          	ld	(OFST-4,sp),a
 920  0403 e606          	ld	a,(6,x)
 921  0405 cd0825        	call	L3_ByteToBcd2
 923  0408 1e09          	ldw	x,(OFST+4,sp)
 924  040a ea05          	or	a,(5,x)
 925  040c               L542:
 926  040c 1a01          	or	a,(OFST-4,sp)
 927  040e 6b05          	ld	(OFST+0,sp),a
 928                     ; 1148   RTC->ALRMAR1 = tmpreg1;
 929  0410 7b02          	ld	a,(OFST-3,sp)
 930  0412 c7515c        	ld	20828,a
 931                     ; 1149   RTC->ALRMAR2 = tmpreg2;
 932  0415 7b03          	ld	a,(OFST-2,sp)
 933  0417 c7515d        	ld	20829,a
 934                     ; 1150   RTC->ALRMAR3 = tmpreg3;
 935  041a 7b04          	ld	a,(OFST-1,sp)
 936  041c c7515e        	ld	20830,a
 937                     ; 1151   RTC->ALRMAR4 = tmpreg4;
 938  041f 7b05          	ld	a,(OFST+0,sp)
 939  0421 c7515f        	ld	20831,a
 940                     ; 1154   RTC->WPR = 0xFF; 
 941  0424 35ff5159      	mov	20825,#255
 942                     ; 1155 }
 943  0428 5b06          	addw	sp,#6
 944  042a 81            	ret	
 946                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
 946                     ; 1166 {
 947  042b               _RTC_AlarmStructInit:
 949                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
 950  042b 6f03          	clr	(3,x)
 951                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
 952  042d 7f            	clr	(x)
 953                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
 954  042e 6f01          	clr	(1,x)
 955                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
 956  0430 6f02          	clr	(2,x)
 957                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
 958  0432 6f05          	clr	(5,x)
 959                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
 960  0434 a601          	ld	a,#1
 961  0436 e706          	ld	(6,x),a
 962                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
 963  0438 a6f0          	ld	a,#240
 964  043a e704          	ld	(4,x),a
 965                     ; 1179 }
 966  043c 81            	ret	
 968                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
 968                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
 968                     ; 1190 {
 969  043d               _RTC_GetAlarm:
 970  043d 88            	push	a
 971  043e 5204          	subw	sp,#4
 972       00000004      OFST:	set	4
 974                     ; 1191   uint8_t tmpreg1 = 0;
 975                     ; 1192   uint8_t tmpreg2 = 0;
 976                     ; 1193   uint8_t tmpreg3 = 0;
 977                     ; 1194   uint8_t tmpreg4 = 0;
 978                     ; 1195   uint8_t alarmmask = 0;
 979                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
 980                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
 981  0440 c6515c        	ld	a,20828
 982  0443 6b04          	ld	(OFST+0,sp),a
 983                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
 984  0445 c6515d        	ld	a,20829
 985  0448 6b01          	ld	(OFST-3,sp),a
 986                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
 987  044a c6515e        	ld	a,20830
 988  044d 6b02          	ld	(OFST-2,sp),a
 989                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
 990  044f c6515f        	ld	a,20831
 991  0452 6b03          	ld	(OFST-1,sp),a
 992                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
 993  0454 7b04          	ld	a,(OFST+0,sp)
 994  0456 1e08          	ldw	x,(OFST+4,sp)
 995  0458 a47f          	and	a,#127
 996  045a e702          	ld	(2,x),a
 997                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
 998  045c 7b04          	ld	a,(OFST+0,sp)
 999  045e a480          	and	a,#128
1000  0460 6b04          	ld	(OFST+0,sp),a
1001                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
1002  0462 7b01          	ld	a,(OFST-3,sp)
1003  0464 a47f          	and	a,#127
1004  0466 e701          	ld	(1,x),a
1005                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
1006  0468 7b01          	ld	a,(OFST-3,sp)
1007  046a a480          	and	a,#128
1008  046c 44            	srl	a
1009  046d 1a04          	or	a,(OFST+0,sp)
1010  046f 6b04          	ld	(OFST+0,sp),a
1011                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
1012  0471 7b02          	ld	a,(OFST-2,sp)
1013  0473 a43f          	and	a,#63
1014  0475 f7            	ld	(x),a
1015                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
1016  0476 7b02          	ld	a,(OFST-2,sp)
1017  0478 a440          	and	a,#64
1018  047a e703          	ld	(3,x),a
1019                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
1020  047c 7b02          	ld	a,(OFST-2,sp)
1021  047e a480          	and	a,#128
1022  0480 44            	srl	a
1023  0481 44            	srl	a
1024  0482 1a04          	or	a,(OFST+0,sp)
1025  0484 6b04          	ld	(OFST+0,sp),a
1026                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
1027  0486 7b03          	ld	a,(OFST-1,sp)
1028  0488 a43f          	and	a,#63
1029  048a e706          	ld	(6,x),a
1030                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
1031  048c 7b03          	ld	a,(OFST-1,sp)
1032  048e a440          	and	a,#64
1033  0490 e705          	ld	(5,x),a
1034                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
1035  0492 7b03          	ld	a,(OFST-1,sp)
1036  0494 a480          	and	a,#128
1037  0496 44            	srl	a
1038  0497 44            	srl	a
1039  0498 44            	srl	a
1040  0499 1a04          	or	a,(OFST+0,sp)
1041  049b 6b04          	ld	(OFST+0,sp),a
1042                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
1043  049d e704          	ld	(4,x),a
1044                     ; 1226   if (RTC_Format == RTC_Format_BIN)
1045  049f 7b05          	ld	a,(OFST+1,sp)
1046  04a1 2622          	jrne	L742
1047                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
1048  04a3 f6            	ld	a,(x)
1049  04a4 cd0842        	call	L5_Bcd2ToByte
1051  04a7 1e08          	ldw	x,(OFST+4,sp)
1052  04a9 f7            	ld	(x),a
1053                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
1054  04aa e601          	ld	a,(1,x)
1055  04ac cd0842        	call	L5_Bcd2ToByte
1057  04af 1e08          	ldw	x,(OFST+4,sp)
1058  04b1 e701          	ld	(1,x),a
1059                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
1060  04b3 e602          	ld	a,(2,x)
1061  04b5 cd0842        	call	L5_Bcd2ToByte
1063  04b8 1e08          	ldw	x,(OFST+4,sp)
1064  04ba e702          	ld	(2,x),a
1065                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
1066  04bc e606          	ld	a,(6,x)
1067  04be cd0842        	call	L5_Bcd2ToByte
1069  04c1 1e08          	ldw	x,(OFST+4,sp)
1070  04c3 e706          	ld	(6,x),a
1071  04c5               L742:
1072                     ; 1233 }
1073  04c5 5b05          	addw	sp,#5
1074  04c7 81            	ret	
1076                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
1076                     ; 1243 {
1077  04c8               _RTC_AlarmCmd:
1078  04c8 5203          	subw	sp,#3
1079       00000003      OFST:	set	3
1081                     ; 1244   __IO uint16_t alrawfcount = 0;
1082  04ca 5f            	clrw	x
1083  04cb 1f01          	ldw	(OFST-2,sp),x
1084                     ; 1245   ErrorStatus status = ERROR;
1085                     ; 1246   uint8_t temp1 = 0;
1086                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
1087                     ; 1252   RTC->WPR = 0xCA;
1088  04cd 35ca5159      	mov	20825,#202
1089                     ; 1253   RTC->WPR = 0x53;
1090  04d1 35535159      	mov	20825,#83
1091                     ; 1256   if (NewState != DISABLE)
1092  04d5 4d            	tnz	a
1093  04d6 2711          	jreq	L152
1094                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
1095  04d8 72105149      	bset	20809,#0
1096                     ; 1259     status = SUCCESS;
1097  04dc               LC006:
1098  04dc a601          	ld	a,#1
1099  04de 6b03          	ld	(OFST+0,sp),a
1101  04e0               L352:
1102                     ; 1283   RTC->WPR = 0xFF; 
1103  04e0 35ff5159      	mov	20825,#255
1104                     ; 1286   return (ErrorStatus)status;
1105  04e4 7b03          	ld	a,(OFST+0,sp)
1107  04e6 5b03          	addw	sp,#3
1108  04e8 81            	ret	
1109  04e9               L152:
1110                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
1111  04e9 72115149      	bres	20809,#0
1112                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
1113  04ed c6514c        	ld	a,20812
1114  04f0 a401          	and	a,#1
1115  04f2 6b03          	ld	(OFST+0,sp),a
1117  04f4 2005          	jra	L162
1118  04f6               L552:
1119                     ; 1269       alrawfcount++;
1120  04f6 1e01          	ldw	x,(OFST-2,sp)
1121  04f8 5c            	incw	x
1122  04f9 1f01          	ldw	(OFST-2,sp),x
1123  04fb               L162:
1124                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
1125  04fb 1e01          	ldw	x,(OFST-2,sp)
1126  04fd 5c            	incw	x
1127  04fe 2704          	jreq	L562
1129  0500 7b03          	ld	a,(OFST+0,sp)
1130  0502 27f2          	jreq	L552
1131  0504               L562:
1132                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
1133  0504 7200514c04    	btjt	20812,#0,L762
1134                     ; 1274       status = ERROR;
1135  0509 0f03          	clr	(OFST+0,sp)
1137  050b 20d3          	jra	L352
1138  050d               L762:
1139                     ; 1278       status = SUCCESS;
1140  050d 20cd          	jp	LC006
1142                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
1142                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
1142                     ; 1300 {
1143  050f               _RTC_AlarmSubSecondConfig:
1144  050f 89            	pushw	x
1145  0510 88            	push	a
1146       00000001      OFST:	set	1
1148                     ; 1301   uint8_t alarmstatus = 0;
1149                     ; 1302   ErrorStatus status = ERROR;
1150                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
1151                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
1152                     ; 1309   RTC->WPR = 0xCA;
1153  0511 35ca5159      	mov	20825,#202
1154                     ; 1310   RTC->WPR = 0x53;
1155  0515 35535159      	mov	20825,#83
1156                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
1157  0519 720c514c26    	btjt	20812,#6,L372
1158                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
1159  051e c65149        	ld	a,20809
1160  0521 aa01          	or	a,#1
1161  0523 6b01          	ld	(OFST+0,sp),a
1162                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
1163  0525 72115149      	bres	20809,#0
1164                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
1165  0529 9e            	ld	a,xh
1166  052a c75164        	ld	20836,a
1167                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
1168  052d 9f            	ld	a,xl
1169  052e c75165        	ld	20837,a
1170                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
1171  0531 7b06          	ld	a,(OFST+5,sp)
1172  0533 c75166        	ld	20838,a
1173                     ; 1327     RTC->CR2 |= alarmstatus;
1174  0536 c65149        	ld	a,20809
1175  0539 1a01          	or	a,(OFST+0,sp)
1176  053b c75149        	ld	20809,a
1177                     ; 1329     status = SUCCESS;
1178  053e a601          	ld	a,#1
1179  0540 6b01          	ld	(OFST+0,sp),a
1181  0542 2002          	jra	L572
1182  0544               L372:
1183                     ; 1333     status = ERROR;
1184  0544 0f01          	clr	(OFST+0,sp)
1185  0546               L572:
1186                     ; 1337   RTC->WPR = 0xFF; 
1187  0546 35ff5159      	mov	20825,#255
1188                     ; 1339   return (ErrorStatus)status;
1189  054a 7b01          	ld	a,(OFST+0,sp)
1191  054c 5b03          	addw	sp,#3
1192  054e 81            	ret	
1194                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
1194                     ; 1370 {
1195  054f               _RTC_WakeUpClockConfig:
1196  054f 88            	push	a
1197       00000000      OFST:	set	0
1199                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
1200                     ; 1376   RTC->WPR = 0xCA;
1201  0550 35ca5159      	mov	20825,#202
1202                     ; 1377   RTC->WPR = 0x53;
1203  0554 35535159      	mov	20825,#83
1204                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
1205  0558 72155149      	bres	20809,#2
1206                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
1207  055c c65148        	ld	a,20808
1208  055f a4f8          	and	a,#248
1209  0561 c75148        	ld	20808,a
1210                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
1211  0564 c65148        	ld	a,20808
1212  0567 1a01          	or	a,(OFST+1,sp)
1213  0569 c75148        	ld	20808,a
1214                     ; 1389   RTC->WPR = 0xFF; 
1215  056c 35ff5159      	mov	20825,#255
1216                     ; 1390 }
1217  0570 84            	pop	a
1218  0571 81            	ret	
1220                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
1220                     ; 1401 {
1221  0572               _RTC_SetWakeUpCounter:
1223                     ; 1403   RTC->WPR = 0xCA;
1224  0572 35ca5159      	mov	20825,#202
1225                     ; 1404   RTC->WPR = 0x53;
1226  0576 35535159      	mov	20825,#83
1227                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
1228  057a 9e            	ld	a,xh
1229  057b c75154        	ld	20820,a
1230                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
1231  057e 9f            	ld	a,xl
1232  057f c75155        	ld	20821,a
1233                     ; 1412   RTC->WPR = 0xFF; 
1234  0582 35ff5159      	mov	20825,#255
1235                     ; 1413 }
1236  0586 81            	ret	
1238                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
1238                     ; 1421 {
1239  0587               _RTC_GetWakeUpCounter:
1240  0587 89            	pushw	x
1241       00000002      OFST:	set	2
1243                     ; 1422   uint16_t tmpreg = 0;
1244                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
1245  0588 c65154        	ld	a,20820
1246  058b 97            	ld	xl,a
1247  058c 4f            	clr	a
1248  058d 02            	rlwa	x,a
1249  058e 1f01          	ldw	(OFST-1,sp),x
1250                     ; 1426   tmpreg |= RTC->WUTRL;
1251  0590 c65155        	ld	a,20821
1252  0593 5f            	clrw	x
1253  0594 97            	ld	xl,a
1254  0595 01            	rrwa	x,a
1255  0596 1a02          	or	a,(OFST+0,sp)
1256  0598 01            	rrwa	x,a
1257  0599 1a01          	or	a,(OFST-1,sp)
1258  059b 01            	rrwa	x,a
1259                     ; 1429   return (uint16_t)tmpreg;
1261  059c 5b02          	addw	sp,#2
1262  059e 81            	ret	
1264                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
1264                     ; 1441 {
1265  059f               _RTC_WakeUpCmd:
1266  059f 5203          	subw	sp,#3
1267       00000003      OFST:	set	3
1269                     ; 1442   ErrorStatus status = ERROR;
1270                     ; 1443   uint16_t wutwfcount = 0;
1271  05a1 5f            	clrw	x
1272  05a2 1f02          	ldw	(OFST-1,sp),x
1273                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1274                     ; 1449   RTC->WPR = 0xCA;
1275  05a4 35ca5159      	mov	20825,#202
1276                     ; 1450   RTC->WPR = 0x53;
1277  05a8 35535159      	mov	20825,#83
1278                     ; 1452   if (NewState != DISABLE)
1279  05ac 4d            	tnz	a
1280  05ad 2711          	jreq	L772
1281                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
1282  05af 72145149      	bset	20809,#2
1283                     ; 1457     status = SUCCESS;
1284  05b3               LC007:
1285  05b3 a601          	ld	a,#1
1286  05b5 6b01          	ld	(OFST-2,sp),a
1288  05b7               L103:
1289                     ; 1482   RTC->WPR = 0xFF; 
1290  05b7 35ff5159      	mov	20825,#255
1291                     ; 1485   return (ErrorStatus)status;
1292  05bb 7b01          	ld	a,(OFST-2,sp)
1294  05bd 5b03          	addw	sp,#3
1295  05bf 81            	ret	
1296  05c0               L772:
1297                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
1298  05c0 72155149      	bres	20809,#2
1300  05c4 2003          	jra	L503
1301  05c6               L303:
1302                     ; 1467       wutwfcount++;
1303  05c6 5c            	incw	x
1304  05c7 1f02          	ldw	(OFST-1,sp),x
1305  05c9               L503:
1306                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
1307  05c9 7204514c05    	btjt	20812,#2,L113
1309  05ce a3ffff        	cpw	x,#65535
1310  05d1 26f3          	jrne	L303
1311  05d3               L113:
1312                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
1313  05d3 7204514c04    	btjt	20812,#2,L313
1314                     ; 1473       status = ERROR;
1315  05d8 0f01          	clr	(OFST-2,sp)
1317  05da 20db          	jra	L103
1318  05dc               L313:
1319                     ; 1477       status = SUCCESS;
1320  05dc 20d5          	jp	LC007
1322                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
1322                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
1322                     ; 1524 {
1323  05de               _RTC_DayLightSavingConfig:
1324  05de 89            	pushw	x
1325       00000000      OFST:	set	0
1327                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
1328                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
1329                     ; 1530   RTC->WPR = 0xCA;
1330  05df 35ca5159      	mov	20825,#202
1331                     ; 1531   RTC->WPR = 0x53;
1332  05e3 35535159      	mov	20825,#83
1333                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
1334  05e7 7215514a      	bres	20810,#2
1335                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
1336  05eb 9f            	ld	a,xl
1337  05ec 1a01          	or	a,(OFST+1,sp)
1338  05ee ca514a        	or	a,20810
1339  05f1 c7514a        	ld	20810,a
1340                     ; 1540   RTC->WPR = 0xFF; 
1341  05f4 35ff5159      	mov	20825,#255
1342                     ; 1541 }
1343  05f8 85            	popw	x
1344  05f9 81            	ret	
1346                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
1346                     ; 1550 {
1347  05fa               _RTC_GetStoreOperation:
1349                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
1350  05fa c6514a        	ld	a,20810
1351  05fd a404          	and	a,#4
1353  05ff 81            	ret	
1355                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
1355                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
1355                     ; 1589 {
1356  0600               _RTC_OutputConfig:
1357  0600 89            	pushw	x
1358       00000000      OFST:	set	0
1360                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
1361                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
1362                     ; 1595   RTC->WPR = 0xCA;
1363  0601 35ca5159      	mov	20825,#202
1364                     ; 1596   RTC->WPR = 0x53;
1365  0605 35535159      	mov	20825,#83
1366                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
1367  0609 c6514a        	ld	a,20810
1368  060c a48f          	and	a,#143
1369  060e c7514a        	ld	20810,a
1370                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
1371  0611 9f            	ld	a,xl
1372  0612 1a01          	or	a,(OFST+1,sp)
1373  0614 ca514a        	or	a,20810
1374  0617 c7514a        	ld	20810,a
1375                     ; 1605   RTC->WPR = 0xFF; 
1376  061a 35ff5159      	mov	20825,#255
1377                     ; 1606 }
1378  061e 85            	popw	x
1379  061f 81            	ret	
1381                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
1381                     ; 1640                                    uint16_t RTC_ShiftSubFS)
1381                     ; 1641 {
1382  0620               _RTC_SynchroShiftConfig:
1383  0620 88            	push	a
1384  0621 5203          	subw	sp,#3
1385       00000003      OFST:	set	3
1387                     ; 1642   uint8_t shiftrhreg = 0;
1388                     ; 1643   ErrorStatus status = ERROR;
1389                     ; 1644   uint16_t shpfcount = 0;
1390  0623 5f            	clrw	x
1391  0624 1f02          	ldw	(OFST-1,sp),x
1392                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
1393                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
1394                     ; 1651   RTC->WPR = 0xCA;
1395  0626 35ca5159      	mov	20825,#202
1396                     ; 1652   RTC->WPR = 0x53;
1397  062a 35535159      	mov	20825,#83
1398                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
1399  062e 7207514c0f    	btjf	20812,#3,L713
1401  0633 2003          	jra	L323
1402  0635               L123:
1403                     ; 1660       shpfcount++;
1404  0635 5c            	incw	x
1405  0636 1f02          	ldw	(OFST-1,sp),x
1406  0638               L323:
1407                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
1408  0638 7207514c05    	btjf	20812,#3,L713
1410  063d a3ffff        	cpw	x,#65535
1411  0640 26f3          	jrne	L123
1412  0642               L713:
1413                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
1414  0642 7206514c12    	btjt	20812,#3,L133
1415                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
1416  0647 7b07          	ld	a,(OFST+4,sp)
1417  0649 1a04          	or	a,(OFST+1,sp)
1418                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
1419  064b c7515a        	ld	20826,a
1420                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
1421  064e 7b08          	ld	a,(OFST+5,sp)
1422  0650 c7515b        	ld	20827,a
1423                     ; 1672     status = SUCCESS;
1424  0653 a601          	ld	a,#1
1425  0655 6b01          	ld	(OFST-2,sp),a
1427  0657 2002          	jra	L333
1428  0659               L133:
1429                     ; 1676     status = ERROR;
1430  0659 0f01          	clr	(OFST-2,sp)
1431  065b               L333:
1432                     ; 1680   RTC->WPR = 0xFF; 
1433  065b 35ff5159      	mov	20825,#255
1434                     ; 1682   return (ErrorStatus)(status);
1435  065f 7b01          	ld	a,(OFST-2,sp)
1437  0661 5b04          	addw	sp,#4
1438  0663 81            	ret	
1440                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
1440                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
1440                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
1440                     ; 1721 {
1441  0664               _RTC_SmoothCalibConfig:
1442  0664 89            	pushw	x
1443  0665 5203          	subw	sp,#3
1444       00000003      OFST:	set	3
1446                     ; 1722   ErrorStatus status = ERROR;
1447                     ; 1723   uint16_t recalpfcount = 0;
1448  0667 5f            	clrw	x
1449  0668 1f02          	ldw	(OFST-1,sp),x
1450                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
1451                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
1452                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
1453                     ; 1731   RTC->WPR = 0xCA;
1454  066a 35ca5159      	mov	20825,#202
1455                     ; 1732   RTC->WPR = 0x53;
1456  066e 35535159      	mov	20825,#83
1457                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
1458  0672 7203514c0f    	btjf	20812,#1,L533
1460  0677 2003          	jra	L143
1461  0679               L733:
1462                     ; 1740       recalpfcount++;
1463  0679 5c            	incw	x
1464  067a 1f02          	ldw	(OFST-1,sp),x
1465  067c               L143:
1466                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
1467  067c 7203514c05    	btjf	20812,#1,L533
1469  0681 a3ffff        	cpw	x,#65535
1470  0684 26f3          	jrne	L733
1471  0686               L533:
1472                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
1473  0686 7202514c14    	btjt	20812,#1,L743
1474                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
1474                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
1474                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
1475  068b 7b04          	ld	a,(OFST+1,sp)
1476  068d 1a05          	or	a,(OFST+2,sp)
1477  068f 1a08          	or	a,(OFST+5,sp)
1478  0691 c7516a        	ld	20842,a
1479                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
1480  0694 7b09          	ld	a,(OFST+6,sp)
1481  0696 c7516b        	ld	20843,a
1482                     ; 1754     status = SUCCESS;
1483  0699 a601          	ld	a,#1
1484  069b 6b01          	ld	(OFST-2,sp),a
1486  069d 2002          	jra	L153
1487  069f               L743:
1488                     ; 1758     status = ERROR;
1489  069f 0f01          	clr	(OFST-2,sp)
1490  06a1               L153:
1491                     ; 1762   RTC->WPR = 0xFF; 
1492  06a1 35ff5159      	mov	20825,#255
1493                     ; 1764   return (ErrorStatus)(status);
1494  06a5 7b01          	ld	a,(OFST-2,sp)
1496  06a7 5b05          	addw	sp,#5
1497  06a9 81            	ret	
1499                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
1499                     ; 1791 {
1500  06aa               _RTC_CalibOutputConfig:
1502                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
1503                     ; 1796   RTC->WPR = 0xCA;
1504  06aa 35ca5159      	mov	20825,#202
1505                     ; 1797   RTC->WPR = 0x53;
1506  06ae 35535159      	mov	20825,#83
1507                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
1508  06b2 4d            	tnz	a
1509  06b3 2706          	jreq	L353
1510                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
1511  06b5 7216514a      	bset	20810,#3
1513  06b9 2004          	jra	L553
1514  06bb               L353:
1515                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
1516  06bb 7217514a      	bres	20810,#3
1517  06bf               L553:
1518                     ; 1811   RTC->WPR = 0xFF; 
1519  06bf 35ff5159      	mov	20825,#255
1520                     ; 1812 }
1521  06c3 81            	ret	
1523                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
1523                     ; 1821 {
1524  06c4               _RTC_CalibOutputCmd:
1526                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
1527                     ; 1826   RTC->WPR = 0xCA;
1528  06c4 35ca5159      	mov	20825,#202
1529                     ; 1827   RTC->WPR = 0x53;
1530  06c8 35535159      	mov	20825,#83
1531                     ; 1829   if (NewState != DISABLE)
1532  06cc 4d            	tnz	a
1533  06cd 2706          	jreq	L753
1534                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
1535  06cf 721e514a      	bset	20810,#7
1537  06d3 2004          	jra	L163
1538  06d5               L753:
1539                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
1540  06d5 721f514a      	bres	20810,#7
1541  06d9               L163:
1542                     ; 1841   RTC->WPR = 0xFF; 
1543  06d9 35ff5159      	mov	20825,#255
1544                     ; 1842 }
1545  06dd 81            	ret	
1547                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
1547                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
1547                     ; 1873 {
1548  06de               _RTC_TamperLevelConfig:
1549  06de 89            	pushw	x
1550       00000000      OFST:	set	0
1552                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
1553                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
1554                     ; 1879   RTC->WPR = 0xCA;
1555  06df 35ca5159      	mov	20825,#202
1556                     ; 1880   RTC->WPR = 0x53;
1557  06e3 35535159      	mov	20825,#83
1558                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
1559  06e7 9f            	ld	a,xl
1560  06e8 4d            	tnz	a
1561  06e9 2707          	jreq	L363
1562                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
1563  06eb 9e            	ld	a,xh
1564  06ec 48            	sll	a
1565  06ed ca516c        	or	a,20844
1567  06f0 2007          	jra	L563
1568  06f2               L363:
1569                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
1570  06f2 7b01          	ld	a,(OFST+1,sp)
1571  06f4 48            	sll	a
1572  06f5 43            	cpl	a
1573  06f6 c4516c        	and	a,20844
1574  06f9               L563:
1575  06f9 c7516c        	ld	20844,a
1576                     ; 1894   RTC->WPR = 0xFF; 
1577  06fc 35ff5159      	mov	20825,#255
1578                     ; 1895 }
1579  0700 85            	popw	x
1580  0701 81            	ret	
1582                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
1582                     ; 1904 {
1583  0702               _RTC_TamperFilterConfig:
1584  0702 88            	push	a
1585       00000000      OFST:	set	0
1587                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
1588                     ; 1910   RTC->WPR = 0xCA;
1589  0703 35ca5159      	mov	20825,#202
1590                     ; 1911   RTC->WPR = 0x53;
1591  0707 35535159      	mov	20825,#83
1592                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
1593  070b c6516d        	ld	a,20845
1594  070e a4e7          	and	a,#231
1595  0710 c7516d        	ld	20845,a
1596                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
1597  0713 c6516d        	ld	a,20845
1598  0716 1a01          	or	a,(OFST+1,sp)
1599  0718 c7516d        	ld	20845,a
1600                     ; 1920   RTC->WPR = 0xFF; 
1601  071b 35ff5159      	mov	20825,#255
1602                     ; 1922 }
1603  071f 84            	pop	a
1604  0720 81            	ret	
1606                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
1606                     ; 1932 {
1607  0721               _RTC_TamperSamplingFreqConfig:
1608  0721 88            	push	a
1609       00000000      OFST:	set	0
1611                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
1612                     ; 1937   RTC->WPR = 0xCA;
1613  0722 35ca5159      	mov	20825,#202
1614                     ; 1938   RTC->WPR = 0x53;
1615  0726 35535159      	mov	20825,#83
1616                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
1617  072a c6516d        	ld	a,20845
1618  072d a4f8          	and	a,#248
1619  072f c7516d        	ld	20845,a
1620                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
1621  0732 c6516d        	ld	a,20845
1622  0735 1a01          	or	a,(OFST+1,sp)
1623  0737 c7516d        	ld	20845,a
1624                     ; 1947   RTC->WPR = 0xFF; 
1625  073a 35ff5159      	mov	20825,#255
1626                     ; 1948 }
1627  073e 84            	pop	a
1628  073f 81            	ret	
1630                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
1630                     ; 1959 {
1631  0740               _RTC_TamperPinsPrechargeDuration:
1632  0740 88            	push	a
1633       00000000      OFST:	set	0
1635                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
1636                     ; 1964   RTC->WPR = 0xCA;
1637  0741 35ca5159      	mov	20825,#202
1638                     ; 1965   RTC->WPR = 0x53;
1639  0745 35535159      	mov	20825,#83
1640                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
1641  0749 c6516d        	ld	a,20845
1642  074c a41f          	and	a,#31
1643  074e c7516d        	ld	20845,a
1644                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
1645  0751 c6516d        	ld	a,20845
1646  0754 1a01          	or	a,(OFST+1,sp)
1647  0756 c7516d        	ld	20845,a
1648                     ; 1974   RTC->WPR = 0xFF; 
1649  0759 35ff5159      	mov	20825,#255
1650                     ; 1975 }
1651  075d 84            	pop	a
1652  075e 81            	ret	
1654                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
1654                     ; 1988                    FunctionalState NewState)
1654                     ; 1989 {
1655  075f               _RTC_TamperCmd:
1656  075f 89            	pushw	x
1657       00000000      OFST:	set	0
1659                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
1660                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
1661                     ; 1996   RTC->WPR = 0xCA;
1662  0760 35ca5159      	mov	20825,#202
1663                     ; 1997   RTC->WPR = 0x53;
1664  0764 35535159      	mov	20825,#83
1665                     ; 2000   if (NewState != DISABLE)
1666  0768 9f            	ld	a,xl
1667  0769 4d            	tnz	a
1668  076a 2706          	jreq	L763
1669                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
1670  076c 9e            	ld	a,xh
1671  076d ca516c        	or	a,20844
1673  0770 2006          	jra	L173
1674  0772               L763:
1675                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
1676  0772 7b01          	ld	a,(OFST+1,sp)
1677  0774 43            	cpl	a
1678  0775 c4516c        	and	a,20844
1679  0778               L173:
1680  0778 c7516c        	ld	20844,a
1681                     ; 2013   RTC->WPR = 0xFF; 
1682  077b 35ff5159      	mov	20825,#255
1683                     ; 2014 }
1684  077f 85            	popw	x
1685  0780 81            	ret	
1687                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
1687                     ; 2059 {
1688  0781               _RTC_ITConfig:
1689  0781 89            	pushw	x
1690       00000000      OFST:	set	0
1692                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
1693                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
1694                     ; 2065   RTC->WPR = 0xCA;
1695  0782 35ca5159      	mov	20825,#202
1696                     ; 2066   RTC->WPR = 0x53;
1697  0786 35535159      	mov	20825,#83
1698                     ; 2068   if (NewState != DISABLE)
1699  078a 7b05          	ld	a,(OFST+5,sp)
1700  078c 2712          	jreq	L373
1701                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
1702  078e 9f            	ld	a,xl
1703  078f a4f0          	and	a,#240
1704  0791 ca5149        	or	a,20809
1705  0794 c75149        	ld	20809,a
1706                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
1707  0797 7b02          	ld	a,(OFST+2,sp)
1708  0799 a401          	and	a,#1
1709  079b ca516c        	or	a,20844
1711  079e 2013          	jra	L573
1712  07a0               L373:
1713                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
1714  07a0 7b02          	ld	a,(OFST+2,sp)
1715  07a2 a4f0          	and	a,#240
1716  07a4 43            	cpl	a
1717  07a5 c45149        	and	a,20809
1718  07a8 c75149        	ld	20809,a
1719                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
1720  07ab 7b02          	ld	a,(OFST+2,sp)
1721  07ad a401          	and	a,#1
1722  07af 43            	cpl	a
1723  07b0 c4516c        	and	a,20844
1724  07b3               L573:
1725  07b3 c7516c        	ld	20844,a
1726                     ; 2082   RTC->WPR = 0xFF; 
1727  07b6 35ff5159      	mov	20825,#255
1728                     ; 2083 }
1729  07ba 85            	popw	x
1730  07bb 81            	ret	
1732                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
1732                     ; 2091 {
1733  07bc               _RTC_GetFlagStatus:
1734  07bc 89            	pushw	x
1735  07bd 5203          	subw	sp,#3
1736       00000003      OFST:	set	3
1738                     ; 2092   FlagStatus flagstatus = RESET;
1739                     ; 2093   uint16_t tmpreg1 = 0;
1740                     ; 2094   uint16_t tmpreg2 = 0;
1741                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
1742                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
1743  07bf c6514c        	ld	a,20812
1744  07c2 97            	ld	xl,a
1745  07c3 4f            	clr	a
1746  07c4 02            	rlwa	x,a
1747  07c5 1f02          	ldw	(OFST-1,sp),x
1748                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
1749  07c7 c6514d        	ld	a,20813
1750  07ca 5f            	clrw	x
1751  07cb 97            	ld	xl,a
1752  07cc 01            	rrwa	x,a
1753  07cd 1a03          	or	a,(OFST+0,sp)
1754  07cf 01            	rrwa	x,a
1755  07d0 1a02          	or	a,(OFST-1,sp)
1756  07d2 01            	rrwa	x,a
1757  07d3 1f02          	ldw	(OFST-1,sp),x
1758                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
1759  07d5 01            	rrwa	x,a
1760  07d6 1405          	and	a,(OFST+2,sp)
1761  07d8 01            	rrwa	x,a
1762  07d9 1404          	and	a,(OFST+1,sp)
1763  07db 01            	rrwa	x,a
1764  07dc 5d            	tnzw	x
1765  07dd 2704          	jreq	L773
1766                     ; 2106     flagstatus = SET;
1767  07df a601          	ld	a,#1
1769  07e1 2001          	jra	L104
1770  07e3               L773:
1771                     ; 2110     flagstatus = RESET;
1772  07e3 4f            	clr	a
1773  07e4               L104:
1774                     ; 2112   return (FlagStatus)flagstatus;
1776  07e4 5b05          	addw	sp,#5
1777  07e6 81            	ret	
1779                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
1779                     ; 2123 {
1780  07e7               _RTC_ClearFlag:
1781  07e7 89            	pushw	x
1782       00000000      OFST:	set	0
1784                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
1785                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
1786  07e8 9f            	ld	a,xl
1787  07e9 43            	cpl	a
1788  07ea c7514d        	ld	20813,a
1789                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
1790  07ed 7b01          	ld	a,(OFST+1,sp)
1791  07ef 43            	cpl	a
1792  07f0 a47f          	and	a,#127
1793  07f2 c7514c        	ld	20812,a
1794                     ; 2130 }
1795  07f5 85            	popw	x
1796  07f6 81            	ret	
1798                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
1798                     ; 2139 {
1799  07f7               _RTC_GetITStatus:
1800  07f7 89            	pushw	x
1801  07f8 89            	pushw	x
1802       00000002      OFST:	set	2
1804                     ; 2140   ITStatus itstatus = RESET;
1805                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
1807                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
1808                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
1809  07f9 9f            	ld	a,xl
1810  07fa c45149        	and	a,20809
1811  07fd 6b01          	ld	(OFST-1,sp),a
1812                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
1813  07ff 1e03          	ldw	x,(OFST+1,sp)
1814  0801 54            	srlw	x
1815  0802 54            	srlw	x
1816  0803 54            	srlw	x
1817  0804 54            	srlw	x
1818  0805 9f            	ld	a,xl
1819  0806 c4514d        	and	a,20813
1820  0809 6b02          	ld	(OFST+0,sp),a
1821                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
1822  080b 7b01          	ld	a,(OFST-1,sp)
1823  080d 2708          	jreq	L304
1825  080f 7b02          	ld	a,(OFST+0,sp)
1826  0811 2704          	jreq	L304
1827                     ; 2155     itstatus = SET;
1828  0813 a601          	ld	a,#1
1830  0815 2001          	jra	L504
1831  0817               L304:
1832                     ; 2159     itstatus = RESET;
1833  0817 4f            	clr	a
1834  0818               L504:
1835                     ; 2162   return (ITStatus)itstatus;
1837  0818 5b04          	addw	sp,#4
1838  081a 81            	ret	
1840                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
1840                     ; 2173 {
1841  081b               _RTC_ClearITPendingBit:
1843                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
1844                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
1845  081b 54            	srlw	x
1846  081c 54            	srlw	x
1847  081d 54            	srlw	x
1848  081e 54            	srlw	x
1849  081f 9f            	ld	a,xl
1850  0820 43            	cpl	a
1851  0821 c7514d        	ld	20813,a
1852                     ; 2179 }
1853  0824 81            	ret	
1855                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
1855                     ; 2203 {
1856  0825               L3_ByteToBcd2:
1857  0825 88            	push	a
1858  0826 88            	push	a
1859       00000001      OFST:	set	1
1861                     ; 2204   uint8_t bcdhigh = 0;
1862  0827 0f01          	clr	(OFST+0,sp)
1864  0829 7b02          	ld	a,(OFST+1,sp)
1865  082b 2006          	jra	L314
1866  082d               L704:
1867                     ; 2208     bcdhigh++;
1868  082d 0c01          	inc	(OFST+0,sp)
1869                     ; 2209     Value -= 10;
1870  082f a00a          	sub	a,#10
1871  0831 6b02          	ld	(OFST+1,sp),a
1872  0833               L314:
1873                     ; 2206   while (Value >= 10)
1874  0833 a10a          	cp	a,#10
1875  0835 24f6          	jruge	L704
1876                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
1877  0837 7b01          	ld	a,(OFST+0,sp)
1878  0839 97            	ld	xl,a
1879  083a a610          	ld	a,#16
1880  083c 42            	mul	x,a
1881  083d 9f            	ld	a,xl
1882  083e 1a02          	or	a,(OFST+1,sp)
1884  0840 85            	popw	x
1885  0841 81            	ret	
1887                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
1887                     ; 2221 {
1888  0842               L5_Bcd2ToByte:
1889  0842 88            	push	a
1890  0843 88            	push	a
1891       00000001      OFST:	set	1
1893                     ; 2222   uint8_t tmp = 0;
1894                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
1895  0844 4e            	swap	a
1896  0845 a40f          	and	a,#15
1897  0847 97            	ld	xl,a
1898  0848 a60a          	ld	a,#10
1899  084a 42            	mul	x,a
1900  084b 9f            	ld	a,xl
1901  084c 6b01          	ld	(OFST+0,sp),a
1902                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
1903  084e 7b02          	ld	a,(OFST+1,sp)
1904  0850 a40f          	and	a,#15
1905  0852 1b01          	add	a,(OFST+0,sp)
1907  0854 85            	popw	x
1908  0855 81            	ret	
1910                     	xdef	_RTC_ClearITPendingBit
1911                     	xdef	_RTC_GetITStatus
1912                     	xdef	_RTC_ClearFlag
1913                     	xdef	_RTC_GetFlagStatus
1914                     	xdef	_RTC_ITConfig
1915                     	xdef	_RTC_TamperCmd
1916                     	xdef	_RTC_TamperPinsPrechargeDuration
1917                     	xdef	_RTC_TamperSamplingFreqConfig
1918                     	xdef	_RTC_TamperFilterConfig
1919                     	xdef	_RTC_TamperLevelConfig
1920                     	xdef	_RTC_CalibOutputCmd
1921                     	xdef	_RTC_CalibOutputConfig
1922                     	xdef	_RTC_SmoothCalibConfig
1923                     	xdef	_RTC_SynchroShiftConfig
1924                     	xdef	_RTC_OutputConfig
1925                     	xdef	_RTC_GetStoreOperation
1926                     	xdef	_RTC_DayLightSavingConfig
1927                     	xdef	_RTC_WakeUpCmd
1928                     	xdef	_RTC_GetWakeUpCounter
1929                     	xdef	_RTC_SetWakeUpCounter
1930                     	xdef	_RTC_WakeUpClockConfig
1931                     	xdef	_RTC_AlarmSubSecondConfig
1932                     	xdef	_RTC_AlarmCmd
1933                     	xdef	_RTC_GetAlarm
1934                     	xdef	_RTC_AlarmStructInit
1935                     	xdef	_RTC_SetAlarm
1936                     	xdef	_RTC_GetDate
1937                     	xdef	_RTC_DateStructInit
1938                     	xdef	_RTC_SetDate
1939                     	xdef	_RTC_GetSubSecond
1940                     	xdef	_RTC_GetTime
1941                     	xdef	_RTC_TimeStructInit
1942                     	xdef	_RTC_SetTime
1943                     	xdef	_RTC_BypassShadowCmd
1944                     	xdef	_RTC_RatioCmd
1945                     	xdef	_RTC_WaitForSynchro
1946                     	xdef	_RTC_ExitInitMode
1947                     	xdef	_RTC_EnterInitMode
1948                     	xdef	_RTC_WriteProtectionCmd
1949                     	xdef	_RTC_StructInit
1950                     	xdef	_RTC_Init
1951                     	xdef	_RTC_DeInit
1952                     	end
