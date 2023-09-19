   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 130 void TIM4_DeInit(void)
  17                     ; 131 {
  18                     	scross	off
  19  0000               _TIM4_DeInit:
  21                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  22  0000 725f52e0      	clr	21216
  23                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  24  0004 725f52e1      	clr	21217
  25                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  26  0008 725f52e2      	clr	21218
  27                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  28  000c 725f52e4      	clr	21220
  29                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  30  0010 725f52e7      	clr	21223
  31                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  32  0014 725f52e8      	clr	21224
  33                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  34  0018 35ff52e9      	mov	21225,#255
  35                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  36  001c 725f52e5      	clr	21221
  37                     ; 140 }
  38  0020 81            	ret	
  40                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
  40                     ; 166                        uint8_t TIM4_Period)
  40                     ; 167 {
  41  0021               _TIM4_TimeBaseInit:
  43                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
  44                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
  45  0021 9f            	ld	a,xl
  46  0022 c752e9        	ld	21225,a
  47                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
  48  0025 9e            	ld	a,xh
  49  0026 c752e8        	ld	21224,a
  50                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
  51  0029 350152e6      	mov	21222,#1
  52                     ; 177 }
  53  002d 81            	ret	
  55                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
  55                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
  55                     ; 207 {
  56  002e               _TIM4_PrescalerConfig:
  58                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
  59                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
  60                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
  61  002e 9e            	ld	a,xh
  62  002f c752e8        	ld	21224,a
  63                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
  64  0032 9f            	ld	a,xl
  65  0033 4a            	dec	a
  66  0034 2605          	jrne	L3
  67                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
  68  0036 721052e6      	bset	21222,#0
  70  003a 81            	ret	
  71  003b               L3:
  72                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
  73  003b 721152e6      	bres	21222,#0
  74                     ; 224 }
  75  003f 81            	ret	
  77                     ; 232 void TIM4_SetCounter(uint8_t Counter)
  77                     ; 233 {
  78  0040               _TIM4_SetCounter:
  80                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
  81  0040 c752e7        	ld	21223,a
  82                     ; 236 }
  83  0043 81            	ret	
  85                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
  85                     ; 245 {
  86  0044               _TIM4_SetAutoreload:
  88                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
  89  0044 c752e9        	ld	21225,a
  90                     ; 248 }
  91  0047 81            	ret	
  93                     ; 255 uint8_t TIM4_GetCounter(void)
  93                     ; 256 {
  94  0048               _TIM4_GetCounter:
  95       00000001      OFST:	set	1
  97                     ; 257   uint8_t tmpcntr = 0;
  98                     ; 258   tmpcntr = TIM4->CNTR;
  99  0048 c652e7        	ld	a,21223
 100                     ; 260   return ((uint8_t)tmpcntr);
 102  004b 81            	ret	
 104                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 104                     ; 285 {
 105  004c               _TIM4_GetPrescaler:
 107                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 108  004c c652e8        	ld	a,21224
 110  004f 81            	ret	
 112                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 112                     ; 297 {
 113  0050               _TIM4_UpdateDisableConfig:
 115                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 116                     ; 302   if (NewState != DISABLE)
 117  0050 4d            	tnz	a
 118  0051 2705          	jreq	L7
 119                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 120  0053 721252e0      	bset	21216,#1
 122  0057 81            	ret	
 123  0058               L7:
 124                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 125  0058 721352e0      	bres	21216,#1
 126                     ; 310 }
 127  005c 81            	ret	
 129                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 129                     ; 321 {
 130  005d               _TIM4_UpdateRequestConfig:
 132                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 133                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 134  005d 4a            	dec	a
 135  005e 2605          	jrne	L31
 136                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 137  0060 721452e0      	bset	21216,#2
 139  0064 81            	ret	
 140  0065               L31:
 141                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 142  0065 721552e0      	bres	21216,#2
 143                     ; 334 }
 144  0069 81            	ret	
 146                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 146                     ; 343 {
 147  006a               _TIM4_ARRPreloadConfig:
 149                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 150                     ; 348   if (NewState != DISABLE)
 151  006a 4d            	tnz	a
 152  006b 2705          	jreq	L71
 153                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 154  006d 721e52e0      	bset	21216,#7
 156  0071 81            	ret	
 157  0072               L71:
 158                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 159  0072 721f52e0      	bres	21216,#7
 160                     ; 356 }
 161  0076 81            	ret	
 163                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 163                     ; 367 {
 164  0077               _TIM4_SelectOnePulseMode:
 166                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 167                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 168  0077 4a            	dec	a
 169  0078 2605          	jrne	L32
 170                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 171  007a 721652e0      	bset	21216,#3
 173  007e 81            	ret	
 174  007f               L32:
 175                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 176  007f 721752e0      	bres	21216,#3
 177                     ; 380 }
 178  0083 81            	ret	
 180                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 180                     ; 389 {
 181  0084               _TIM4_Cmd:
 183                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 184                     ; 394   if (NewState != DISABLE)
 185  0084 4d            	tnz	a
 186  0085 2705          	jreq	L72
 187                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 188  0087 721052e0      	bset	21216,#0
 190  008b 81            	ret	
 191  008c               L72:
 192                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 193  008c 721152e0      	bres	21216,#0
 194                     ; 402 }
 195  0090 81            	ret	
 197                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 197                     ; 431 {
 198  0091               _TIM4_ITConfig:
 199  0091 89            	pushw	x
 200       00000000      OFST:	set	0
 202                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 203                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 204                     ; 436   if (NewState != DISABLE)
 205  0092 9f            	ld	a,xl
 206  0093 4d            	tnz	a
 207  0094 2706          	jreq	L33
 208                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 209  0096 9e            	ld	a,xh
 210  0097 ca52e4        	or	a,21220
 212  009a 2006          	jra	L53
 213  009c               L33:
 214                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 215  009c 7b01          	ld	a,(OFST+1,sp)
 216  009e 43            	cpl	a
 217  009f c452e4        	and	a,21220
 218  00a2               L53:
 219  00a2 c752e4        	ld	21220,a
 220                     ; 446 }
 221  00a5 85            	popw	x
 222  00a6 81            	ret	
 224                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 224                     ; 457 {
 225  00a7               _TIM4_GenerateEvent:
 227                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
 228                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
 229  00a7 ca52e6        	or	a,21222
 230  00aa c752e6        	ld	21222,a
 231                     ; 463 }
 232  00ad 81            	ret	
 234                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
 234                     ; 475 {
 235  00ae               _TIM4_GetFlagStatus:
 236       00000001      OFST:	set	1
 238                     ; 476   FlagStatus bitstatus = RESET;
 239                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
 240                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
 241  00ae c452e5        	and	a,21221
 242  00b1 2702          	jreq	L73
 243                     ; 483     bitstatus = SET;
 244  00b3 a601          	ld	a,#1
 246  00b5               L73:
 247                     ; 487     bitstatus = RESET;
 248                     ; 489   return ((FlagStatus)bitstatus);
 250  00b5 81            	ret	
 252                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
 252                     ; 501 {
 253  00b6               _TIM4_ClearFlag:
 255                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
 256                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
 257  00b6 43            	cpl	a
 258  00b7 c752e5        	ld	21221,a
 259                     ; 506 }
 260  00ba 81            	ret	
 262                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
 262                     ; 519 {
 263  00bb               _TIM4_GetITStatus:
 264  00bb 88            	push	a
 265  00bc 89            	pushw	x
 266       00000002      OFST:	set	2
 268                     ; 520   ITStatus bitstatus = RESET;
 269                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
 271                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
 272                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
 273  00bd c452e5        	and	a,21221
 274  00c0 6b01          	ld	(OFST-1,sp),a
 275                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
 276  00c2 c652e4        	ld	a,21220
 277  00c5 1403          	and	a,(OFST+1,sp)
 278  00c7 6b02          	ld	(OFST+0,sp),a
 279                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
 280  00c9 7b01          	ld	a,(OFST-1,sp)
 281  00cb 2708          	jreq	L34
 283  00cd 7b02          	ld	a,(OFST+0,sp)
 284  00cf 2704          	jreq	L34
 285                     ; 533     bitstatus = (ITStatus)SET;
 286  00d1 a601          	ld	a,#1
 288  00d3 2001          	jra	L54
 289  00d5               L34:
 290                     ; 537     bitstatus = (ITStatus)RESET;
 291  00d5 4f            	clr	a
 292  00d6               L54:
 293                     ; 539   return ((ITStatus)bitstatus);
 295  00d6 5b03          	addw	sp,#3
 296  00d8 81            	ret	
 298                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
 298                     ; 551 {
 299  00d9               _TIM4_ClearITPendingBit:
 301                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
 302                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
 303  00d9 43            	cpl	a
 304  00da c752e5        	ld	21221,a
 305                     ; 557 }
 306  00dd 81            	ret	
 308                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
 308                     ; 569 {
 309  00de               _TIM4_DMACmd:
 310  00de 89            	pushw	x
 311       00000000      OFST:	set	0
 313                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 314                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
 315                     ; 574   if (NewState != DISABLE)
 316  00df 9f            	ld	a,xl
 317  00e0 4d            	tnz	a
 318  00e1 2706          	jreq	L74
 319                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
 320  00e3 9e            	ld	a,xh
 321  00e4 ca52e3        	or	a,21219
 323  00e7 2006          	jra	L15
 324  00e9               L74:
 325                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
 326  00e9 7b01          	ld	a,(OFST+1,sp)
 327  00eb 43            	cpl	a
 328  00ec c452e3        	and	a,21219
 329  00ef               L15:
 330  00ef c752e3        	ld	21219,a
 331                     ; 584 }
 332  00f2 85            	popw	x
 333  00f3 81            	ret	
 335                     ; 607 void TIM4_InternalClockConfig(void)
 335                     ; 608 {
 336  00f4               _TIM4_InternalClockConfig:
 338                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
 339  00f4 c652e2        	ld	a,21218
 340  00f7 a4f8          	and	a,#248
 341  00f9 c752e2        	ld	21218,a
 342                     ; 611 }
 343  00fc 81            	ret	
 345                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 345                     ; 652 {
 346  00fd               _TIM4_SelectInputTrigger:
 347  00fd 88            	push	a
 348  00fe 88            	push	a
 349       00000001      OFST:	set	1
 351                     ; 653   uint8_t tmpsmcr = 0;
 352                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 353                     ; 658   tmpsmcr = TIM4->SMCR;
 354  00ff c652e2        	ld	a,21218
 355                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 356  0102 a48f          	and	a,#143
 357                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 358  0104 1a02          	or	a,(OFST+1,sp)
 359                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
 360  0106 c752e2        	ld	21218,a
 361                     ; 665 }
 362  0109 85            	popw	x
 363  010a 81            	ret	
 365                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 365                     ; 677 {
 366  010b               _TIM4_SelectOutputTrigger:
 367  010b 88            	push	a
 368  010c 88            	push	a
 369       00000001      OFST:	set	1
 371                     ; 678   uint8_t tmpcr2 = 0;
 372                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 373                     ; 683   tmpcr2 = TIM4->CR2;
 374  010d c652e1        	ld	a,21217
 375                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 376  0110 a48f          	and	a,#143
 377                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
 378  0112 1a02          	or	a,(OFST+1,sp)
 379                     ; 691   TIM4->CR2 = tmpcr2;
 380  0114 c752e1        	ld	21217,a
 381                     ; 692 }
 382  0117 85            	popw	x
 383  0118 81            	ret	
 385                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
 385                     ; 707 {
 386  0119               _TIM4_SelectSlaveMode:
 387  0119 88            	push	a
 388  011a 88            	push	a
 389       00000001      OFST:	set	1
 391                     ; 708   uint8_t tmpsmcr = 0;
 392                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
 393                     ; 713   tmpsmcr = TIM4->SMCR;
 394  011b c652e2        	ld	a,21218
 395                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
 396  011e a4f8          	and	a,#248
 397                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
 398  0120 1a02          	or	a,(OFST+1,sp)
 399                     ; 721   TIM4->SMCR = tmpsmcr;
 400  0122 c752e2        	ld	21218,a
 401                     ; 722 }
 402  0125 85            	popw	x
 403  0126 81            	ret	
 405                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
 405                     ; 731 {
 406  0127               _TIM4_SelectMasterSlaveMode:
 408                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
 409                     ; 736   if (NewState != DISABLE)
 410  0127 4d            	tnz	a
 411  0128 2705          	jreq	L35
 412                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
 413  012a 721e52e2      	bset	21218,#7
 415  012e 81            	ret	
 416  012f               L35:
 417                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
 418  012f 721f52e2      	bres	21218,#7
 419                     ; 744 }
 420  0133 81            	ret	
 422                     	xdef	_TIM4_SelectMasterSlaveMode
 423                     	xdef	_TIM4_SelectSlaveMode
 424                     	xdef	_TIM4_SelectOutputTrigger
 425                     	xdef	_TIM4_SelectInputTrigger
 426                     	xdef	_TIM4_InternalClockConfig
 427                     	xdef	_TIM4_DMACmd
 428                     	xdef	_TIM4_ClearITPendingBit
 429                     	xdef	_TIM4_GetITStatus
 430                     	xdef	_TIM4_ClearFlag
 431                     	xdef	_TIM4_GetFlagStatus
 432                     	xdef	_TIM4_GenerateEvent
 433                     	xdef	_TIM4_ITConfig
 434                     	xdef	_TIM4_Cmd
 435                     	xdef	_TIM4_SelectOnePulseMode
 436                     	xdef	_TIM4_ARRPreloadConfig
 437                     	xdef	_TIM4_UpdateRequestConfig
 438                     	xdef	_TIM4_UpdateDisableConfig
 439                     	xdef	_TIM4_GetPrescaler
 440                     	xdef	_TIM4_GetCounter
 441                     	xdef	_TIM4_SetAutoreload
 442                     	xdef	_TIM4_SetCounter
 443                     	xdef	_TIM4_PrescalerConfig
 444                     	xdef	_TIM4_TimeBaseInit
 445                     	xdef	_TIM4_DeInit
 446                     	end
