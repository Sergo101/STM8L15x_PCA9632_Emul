   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 168 void TIM5_DeInit(void)
  17                     ; 169 {
  18                     	scross	off
  19  0000               _TIM5_DeInit:
  21                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  22  0000 725f5300      	clr	21248
  23                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  24  0004 725f5301      	clr	21249
  25                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  26  0008 725f5302      	clr	21250
  27                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  28  000c 725f5303      	clr	21251
  29                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  30  0010 725f5305      	clr	21253
  31                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  32  0014 725f5307      	clr	21255
  33                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  34  0018 725f530b      	clr	21259
  35                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  36  001c 35015309      	mov	21257,#1
  37                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  38  0020 3501530a      	mov	21258,#1
  39                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  40  0024 725f530b      	clr	21259
  41                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  42  0028 725f5309      	clr	21257
  43                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  44  002c 725f530a      	clr	21258
  45                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  46  0030 725f530c      	clr	21260
  47                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  48  0034 725f530d      	clr	21261
  49                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  50  0038 725f530e      	clr	21262
  51                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  52  003c 35ff530f      	mov	21263,#255
  53                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
  54  0040 35ff5310      	mov	21264,#255
  55                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
  56  0044 725f5311      	clr	21265
  57                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
  58  0048 725f5312      	clr	21266
  59                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
  60  004c 725f5313      	clr	21267
  61                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
  62  0050 725f5314      	clr	21268
  63                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
  64  0054 725f5316      	clr	21270
  65                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
  66  0058 35015308      	mov	21256,#1
  67                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
  68  005c 725f5315      	clr	21269
  69                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
  70  0060 725f5306      	clr	21254
  71                     ; 206 }
  72  0064 81            	ret	
  74                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
  74                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
  74                     ; 233                        uint16_t TIM5_Period)
  74                     ; 234 {
  75  0065               _TIM5_TimeBaseInit:
  76       fffffffe      OFST: set -2
  78                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
  79                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
  80                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
  81  0065 7b03          	ld	a,(OFST+5,sp)
  82  0067 c7530f        	ld	21263,a
  83                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
  84  006a 7b04          	ld	a,(OFST+6,sp)
  85  006c c75310        	ld	21264,a
  86                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
  87  006f 9e            	ld	a,xh
  88  0070 c7530e        	ld	21262,a
  89                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
  90  0073 c65300        	ld	a,21248
  91  0076 a48f          	and	a,#143
  92  0078 c75300        	ld	21248,a
  93                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
  94  007b 9f            	ld	a,xl
  95  007c ca5300        	or	a,21248
  96  007f c75300        	ld	21248,a
  97                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
  98  0082 35015308      	mov	21256,#1
  99                     ; 254 }
 100  0086 81            	ret	
 102                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 102                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 102                     ; 276 {
 103  0087               _TIM5_PrescalerConfig:
 105                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 106                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 107                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 108  0087 9e            	ld	a,xh
 109  0088 c7530e        	ld	21262,a
 110                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 111  008b 9f            	ld	a,xl
 112  008c 4a            	dec	a
 113  008d 2605          	jrne	L7
 114                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 115  008f 72105308      	bset	21256,#0
 117  0093 81            	ret	
 118  0094               L7:
 119                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 120  0094 72115308      	bres	21256,#0
 121                     ; 293 }
 122  0098 81            	ret	
 124                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 124                     ; 307 {
 125  0099               _TIM5_CounterModeConfig:
 126  0099 88            	push	a
 127  009a 88            	push	a
 128       00000001      OFST:	set	1
 130                     ; 308   uint8_t tmpcr1 = 0;
 131                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 132                     ; 313   tmpcr1 = TIM5->CR1;
 133  009b c65300        	ld	a,21248
 134                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 135  009e a48f          	and	a,#143
 136                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 137  00a0 1a02          	or	a,(OFST+1,sp)
 138                     ; 321   TIM5->CR1 = tmpcr1;
 139  00a2 c75300        	ld	21248,a
 140                     ; 322 }
 141  00a5 85            	popw	x
 142  00a6 81            	ret	
 144                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 144                     ; 331 {
 145  00a7               _TIM5_SetCounter:
 147                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 148  00a7 9e            	ld	a,xh
 149  00a8 c7530c        	ld	21260,a
 150                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 151  00ab 9f            	ld	a,xl
 152  00ac c7530d        	ld	21261,a
 153                     ; 336 }
 154  00af 81            	ret	
 156                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 156                     ; 345 {
 157  00b0               _TIM5_SetAutoreload:
 159                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 160  00b0 9e            	ld	a,xh
 161  00b1 c7530f        	ld	21263,a
 162                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 163  00b4 9f            	ld	a,xl
 164  00b5 c75310        	ld	21264,a
 165                     ; 349 }
 166  00b8 81            	ret	
 168                     ; 356 uint16_t TIM5_GetCounter(void)
 168                     ; 357 {
 169  00b9               _TIM5_GetCounter:
 170  00b9 5204          	subw	sp,#4
 171       00000004      OFST:	set	4
 173                     ; 358   uint16_t tmpcnt = 0;
 174                     ; 361   tmpcntrh = TIM5->CNTRH;
 175  00bb c6530c        	ld	a,21260
 176  00be 6b02          	ld	(OFST-2,sp),a
 177                     ; 362   tmpcntrl = TIM5->CNTRL;
 178  00c0 c6530d        	ld	a,21261
 179  00c3 6b01          	ld	(OFST-3,sp),a
 180                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 181  00c5 5f            	clrw	x
 182  00c6 97            	ld	xl,a
 183  00c7 1f03          	ldw	(OFST-1,sp),x
 184                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 185  00c9 5f            	clrw	x
 186  00ca 7b02          	ld	a,(OFST-2,sp)
 187  00cc 97            	ld	xl,a
 188  00cd 7b04          	ld	a,(OFST+0,sp)
 189  00cf 01            	rrwa	x,a
 190  00d0 1a03          	or	a,(OFST-1,sp)
 191  00d2 01            	rrwa	x,a
 192                     ; 367   return ((uint16_t)tmpcnt);
 194  00d3 5b04          	addw	sp,#4
 195  00d5 81            	ret	
 197                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 197                     ; 384 {
 198  00d6               _TIM5_GetPrescaler:
 200                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 201  00d6 c6530e        	ld	a,21262
 203  00d9 81            	ret	
 205                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 205                     ; 397 {
 206  00da               _TIM5_UpdateDisableConfig:
 208                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 209                     ; 402   if (NewState != DISABLE)
 210  00da 4d            	tnz	a
 211  00db 2705          	jreq	L31
 212                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 213  00dd 72125300      	bset	21248,#1
 215  00e1 81            	ret	
 216  00e2               L31:
 217                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 218  00e2 72135300      	bres	21248,#1
 219                     ; 410 }
 220  00e6 81            	ret	
 222                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 222                     ; 421 {
 223  00e7               _TIM5_UpdateRequestConfig:
 225                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 226                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 227  00e7 4a            	dec	a
 228  00e8 2605          	jrne	L71
 229                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 230  00ea 72145300      	bset	21248,#2
 232  00ee 81            	ret	
 233  00ef               L71:
 234                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 235  00ef 72155300      	bres	21248,#2
 236                     ; 434 }
 237  00f3 81            	ret	
 239                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 239                     ; 443 {
 240  00f4               _TIM5_ARRPreloadConfig:
 242                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 243                     ; 448   if (NewState != DISABLE)
 244  00f4 4d            	tnz	a
 245  00f5 2705          	jreq	L32
 246                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 247  00f7 721e5300      	bset	21248,#7
 249  00fb 81            	ret	
 250  00fc               L32:
 251                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 252  00fc 721f5300      	bres	21248,#7
 253                     ; 456 }
 254  0100 81            	ret	
 256                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
 256                     ; 467 {
 257  0101               _TIM5_SelectOnePulseMode:
 259                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
 260                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
 261  0101 4a            	dec	a
 262  0102 2605          	jrne	L72
 263                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
 264  0104 72165300      	bset	21248,#3
 266  0108 81            	ret	
 267  0109               L72:
 268                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
 269  0109 72175300      	bres	21248,#3
 270                     ; 480 }
 271  010d 81            	ret	
 273                     ; 488 void TIM5_Cmd(FunctionalState NewState)
 273                     ; 489 {
 274  010e               _TIM5_Cmd:
 276                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
 277                     ; 494   if (NewState != DISABLE)
 278  010e 4d            	tnz	a
 279  010f 2705          	jreq	L33
 280                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
 281  0111 72105300      	bset	21248,#0
 283  0115 81            	ret	
 284  0116               L33:
 285                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
 286  0116 72115300      	bres	21248,#0
 287                     ; 502 }
 288  011a 81            	ret	
 290                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 290                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
 290                     ; 580                   uint16_t TIM5_Pulse,
 290                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
 290                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
 290                     ; 583 {
 291  011b               _TIM5_OC1Init:
 292  011b 89            	pushw	x
 293  011c 88            	push	a
 294       00000001      OFST:	set	1
 296                     ; 584   uint8_t tmpccmr1 = 0;
 297                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
 298                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
 299                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
 300                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
 301                     ; 592   tmpccmr1 = TIM5->CCMR1;
 302  011d c65309        	ld	a,21257
 303  0120 6b01          	ld	(OFST+0,sp),a
 304                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 305  0122 7211530b      	bres	21259,#0
 306                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 307  0126 a48f          	and	a,#143
 308  0128 6b01          	ld	(OFST+0,sp),a
 309                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
 310  012a 9e            	ld	a,xh
 311  012b 1a01          	or	a,(OFST+0,sp)
 312  012d 6b01          	ld	(OFST+0,sp),a
 313                     ; 602   TIM5->CCMR1 = tmpccmr1;
 314  012f c75309        	ld	21257,a
 315                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
 316  0132 9f            	ld	a,xl
 317  0133 4a            	dec	a
 318  0134 2606          	jrne	L73
 319                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
 320  0136 7210530b      	bset	21259,#0
 322  013a 2004          	jra	L14
 323  013c               L73:
 324                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 325  013c 7211530b      	bres	21259,#0
 326  0140               L14:
 327                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
 328  0140 7b08          	ld	a,(OFST+7,sp)
 329  0142 4a            	dec	a
 330  0143 2606          	jrne	L34
 331                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
 332  0145 7212530b      	bset	21259,#1
 334  0149 2004          	jra	L54
 335  014b               L34:
 336                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 337  014b 7213530b      	bres	21259,#1
 338  014f               L54:
 339                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
 340  014f 7b09          	ld	a,(OFST+8,sp)
 341  0151 4a            	dec	a
 342  0152 2606          	jrne	L74
 343                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
 344  0154 72105316      	bset	21270,#0
 346  0158 2004          	jra	L15
 347  015a               L74:
 348                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 349  015a 72115316      	bres	21270,#0
 350  015e               L15:
 351                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
 352  015e 7b06          	ld	a,(OFST+5,sp)
 353  0160 c75311        	ld	21265,a
 354                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
 355  0163 7b07          	ld	a,(OFST+6,sp)
 356  0165 c75312        	ld	21266,a
 357                     ; 637 }
 358  0168 5b03          	addw	sp,#3
 359  016a 81            	ret	
 361                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 361                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
 361                     ; 666                   uint16_t TIM5_Pulse,
 361                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
 361                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
 361                     ; 669 {
 362  016b               _TIM5_OC2Init:
 363  016b 89            	pushw	x
 364  016c 88            	push	a
 365       00000001      OFST:	set	1
 367                     ; 670   uint8_t tmpccmr2 = 0;
 368                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
 369                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
 370                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
 371                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
 372                     ; 678   tmpccmr2 = TIM5->CCMR2;
 373  016d c6530a        	ld	a,21258
 374  0170 6b01          	ld	(OFST+0,sp),a
 375                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 376  0172 7219530b      	bres	21259,#4
 377                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 378  0176 a48f          	and	a,#143
 379  0178 6b01          	ld	(OFST+0,sp),a
 380                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
 381  017a 9e            	ld	a,xh
 382  017b 1a01          	or	a,(OFST+0,sp)
 383  017d 6b01          	ld	(OFST+0,sp),a
 384                     ; 689   TIM5->CCMR2 = tmpccmr2;
 385  017f c7530a        	ld	21258,a
 386                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
 387  0182 9f            	ld	a,xl
 388  0183 4a            	dec	a
 389  0184 2606          	jrne	L35
 390                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
 391  0186 7218530b      	bset	21259,#4
 393  018a 2004          	jra	L55
 394  018c               L35:
 395                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 396  018c 7219530b      	bres	21259,#4
 397  0190               L55:
 398                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
 399  0190 7b08          	ld	a,(OFST+7,sp)
 400  0192 4a            	dec	a
 401  0193 2606          	jrne	L75
 402                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
 403  0195 721a530b      	bset	21259,#5
 405  0199 2004          	jra	L16
 406  019b               L75:
 407                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 408  019b 721b530b      	bres	21259,#5
 409  019f               L16:
 410                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
 411  019f 7b09          	ld	a,(OFST+8,sp)
 412  01a1 4a            	dec	a
 413  01a2 2606          	jrne	L36
 414                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
 415  01a4 72145316      	bset	21270,#2
 417  01a8 2004          	jra	L56
 418  01aa               L36:
 419                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 420  01aa 72155316      	bres	21270,#2
 421  01ae               L56:
 422                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
 423  01ae 7b06          	ld	a,(OFST+5,sp)
 424  01b0 c75313        	ld	21267,a
 425                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
 426  01b3 7b07          	ld	a,(OFST+6,sp)
 427  01b5 c75314        	ld	21268,a
 428                     ; 725 }
 429  01b8 5b03          	addw	sp,#3
 430  01ba 81            	ret	
 432                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
 432                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
 432                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
 432                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
 432                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
 432                     ; 759 
 432                     ; 760 {
 433  01bb               _TIM5_BKRConfig:
 434  01bb 89            	pushw	x
 435  01bc 88            	push	a
 436       00000001      OFST:	set	1
 438                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
 439                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
 440                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
 441                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
 442                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
 443                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
 443                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
 443                     ; 774                                   TIM5_AutomaticOutput));
 444  01bd 7b06          	ld	a,(OFST+5,sp)
 445  01bf 1a07          	or	a,(OFST+6,sp)
 446  01c1 6b01          	ld	(OFST+0,sp),a
 447  01c3 9f            	ld	a,xl
 448  01c4 1a02          	or	a,(OFST+1,sp)
 449  01c6 1a01          	or	a,(OFST+0,sp)
 450  01c8 1a08          	or	a,(OFST+7,sp)
 451  01ca c75315        	ld	21269,a
 452                     ; 775 }
 453  01cd 5b03          	addw	sp,#3
 454  01cf 81            	ret	
 456                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
 456                     ; 784 {
 457  01d0               _TIM5_CtrlPWMOutputs:
 459                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
 460                     ; 790   if (NewState != DISABLE)
 461  01d0 4d            	tnz	a
 462  01d1 2705          	jreq	L76
 463                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
 464  01d3 721e5315      	bset	21269,#7
 466  01d7 81            	ret	
 467  01d8               L76:
 468                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
 469  01d8 721f5315      	bres	21269,#7
 470                     ; 798 }
 471  01dc 81            	ret	
 473                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
 473                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
 473                     ; 820 {
 474  01dd               _TIM5_SelectOCxM:
 475  01dd 89            	pushw	x
 476       00000000      OFST:	set	0
 478                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
 479                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
 480                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
 481  01de 9e            	ld	a,xh
 482  01df 4d            	tnz	a
 483  01e0 2615          	jrne	L37
 484                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 485  01e2 7211530b      	bres	21259,#0
 486                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
 487  01e6 c65309        	ld	a,21257
 488  01e9 a48f          	and	a,#143
 489  01eb c75309        	ld	21257,a
 490                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
 491  01ee 9f            	ld	a,xl
 492  01ef ca5309        	or	a,21257
 493  01f2 c75309        	ld	21257,a
 495  01f5 2014          	jra	L57
 496  01f7               L37:
 497                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 498  01f7 7219530b      	bres	21259,#4
 499                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
 500  01fb c6530a        	ld	a,21258
 501  01fe a48f          	and	a,#143
 502  0200 c7530a        	ld	21258,a
 503                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
 504  0203 c6530a        	ld	a,21258
 505  0206 1a02          	or	a,(OFST+2,sp)
 506  0208 c7530a        	ld	21258,a
 507  020b               L57:
 508                     ; 847 }
 509  020b 85            	popw	x
 510  020c 81            	ret	
 512                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
 512                     ; 856 {
 513  020d               _TIM5_SetCompare1:
 515                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
 516  020d 9e            	ld	a,xh
 517  020e c75311        	ld	21265,a
 518                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
 519  0211 9f            	ld	a,xl
 520  0212 c75312        	ld	21266,a
 521                     ; 860 }
 522  0215 81            	ret	
 524                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
 524                     ; 869 {
 525  0216               _TIM5_SetCompare2:
 527                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
 528  0216 9e            	ld	a,xh
 529  0217 c75313        	ld	21267,a
 530                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
 531  021a 9f            	ld	a,xl
 532  021b c75314        	ld	21268,a
 533                     ; 873 }
 534  021e 81            	ret	
 536                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
 536                     ; 884 {
 537  021f               _TIM5_ForcedOC1Config:
 538  021f 88            	push	a
 539  0220 88            	push	a
 540       00000001      OFST:	set	1
 542                     ; 885   uint8_t tmpccmr1 = 0;
 543                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
 544                     ; 890   tmpccmr1 = TIM5->CCMR1;
 545  0221 c65309        	ld	a,21257
 546                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 547  0224 a48f          	and	a,#143
 548                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
 549  0226 1a02          	or	a,(OFST+1,sp)
 550                     ; 898   TIM5->CCMR1 = tmpccmr1;
 551  0228 c75309        	ld	21257,a
 552                     ; 899 }
 553  022b 85            	popw	x
 554  022c 81            	ret	
 556                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
 556                     ; 910 {
 557  022d               _TIM5_ForcedOC2Config:
 558  022d 88            	push	a
 559  022e 88            	push	a
 560       00000001      OFST:	set	1
 562                     ; 911   uint8_t tmpccmr2 = 0;
 563                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
 564                     ; 916   tmpccmr2 = TIM5->CCMR2;
 565  022f c6530a        	ld	a,21258
 566                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 567  0232 a48f          	and	a,#143
 568                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
 569  0234 1a02          	or	a,(OFST+1,sp)
 570                     ; 924   TIM5->CCMR2 = tmpccmr2;
 571  0236 c7530a        	ld	21258,a
 572                     ; 925 }
 573  0239 85            	popw	x
 574  023a 81            	ret	
 576                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
 576                     ; 934 {
 577  023b               _TIM5_OC1PreloadConfig:
 579                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
 580                     ; 939   if (NewState != DISABLE)
 581  023b 4d            	tnz	a
 582  023c 2705          	jreq	L77
 583                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
 584  023e 72165309      	bset	21257,#3
 586  0242 81            	ret	
 587  0243               L77:
 588                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
 589  0243 72175309      	bres	21257,#3
 590                     ; 947 }
 591  0247 81            	ret	
 593                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
 593                     ; 956 {
 594  0248               _TIM5_OC2PreloadConfig:
 596                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
 597                     ; 961   if (NewState != DISABLE)
 598  0248 4d            	tnz	a
 599  0249 2705          	jreq	L301
 600                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
 601  024b 7216530a      	bset	21258,#3
 603  024f 81            	ret	
 604  0250               L301:
 605                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
 606  0250 7217530a      	bres	21258,#3
 607                     ; 969 }
 608  0254 81            	ret	
 610                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
 610                     ; 978 {
 611  0255               _TIM5_OC1FastConfig:
 613                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
 614                     ; 983   if (NewState != DISABLE)
 615  0255 4d            	tnz	a
 616  0256 2705          	jreq	L701
 617                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
 618  0258 72145309      	bset	21257,#2
 620  025c 81            	ret	
 621  025d               L701:
 622                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
 623  025d 72155309      	bres	21257,#2
 624                     ; 991 }
 625  0261 81            	ret	
 627                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
 627                     ; 1001 {
 628  0262               _TIM5_OC2FastConfig:
 630                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
 631                     ; 1006   if (NewState != DISABLE)
 632  0262 4d            	tnz	a
 633  0263 2705          	jreq	L311
 634                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
 635  0265 7214530a      	bset	21258,#2
 637  0269 81            	ret	
 638  026a               L311:
 639                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
 640  026a 7215530a      	bres	21258,#2
 641                     ; 1014 }
 642  026e 81            	ret	
 644                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 644                     ; 1025 {
 645  026f               _TIM5_OC1PolarityConfig:
 647                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
 648                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
 649  026f 4a            	dec	a
 650  0270 2605          	jrne	L711
 651                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
 652  0272 7212530b      	bset	21259,#1
 654  0276 81            	ret	
 655  0277               L711:
 656                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
 657  0277 7213530b      	bres	21259,#1
 658                     ; 1038 }
 659  027b 81            	ret	
 661                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 661                     ; 1049 {
 662  027c               _TIM5_OC2PolarityConfig:
 664                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
 665                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
 666  027c 4a            	dec	a
 667  027d 2605          	jrne	L321
 668                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
 669  027f 721a530b      	bset	21259,#5
 671  0283 81            	ret	
 672  0284               L321:
 673                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
 674  0284 721b530b      	bres	21259,#5
 675                     ; 1062 }
 676  0288 81            	ret	
 678                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
 678                     ; 1075                  FunctionalState NewState)
 678                     ; 1076 {
 679  0289               _TIM5_CCxCmd:
 680  0289 89            	pushw	x
 681       00000000      OFST:	set	0
 683                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
 684                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
 685                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
 686  028a 9e            	ld	a,xh
 687  028b 4d            	tnz	a
 688  028c 2610          	jrne	L721
 689                     ; 1084     if (NewState != DISABLE)
 690  028e 9f            	ld	a,xl
 691  028f 4d            	tnz	a
 692  0290 2706          	jreq	L131
 693                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
 694  0292 7210530b      	bset	21259,#0
 696  0296 2014          	jra	L531
 697  0298               L131:
 698                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
 699  0298 7211530b      	bres	21259,#0
 700  029c 200e          	jra	L531
 701  029e               L721:
 702                     ; 1097     if (NewState != DISABLE)
 703  029e 7b02          	ld	a,(OFST+2,sp)
 704  02a0 2706          	jreq	L731
 705                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
 706  02a2 7218530b      	bset	21259,#4
 708  02a6 2004          	jra	L531
 709  02a8               L731:
 710                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
 711  02a8 7219530b      	bres	21259,#4
 712  02ac               L531:
 713                     ; 1106 }
 714  02ac 85            	popw	x
 715  02ad 81            	ret	
 717                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
 717                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
 717                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
 717                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
 717                     ; 1188                  uint8_t TIM5_ICFilter)
 717                     ; 1189 {
 718  02ae               _TIM5_ICInit:
 719  02ae 89            	pushw	x
 720       00000000      OFST:	set	0
 722                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
 723                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
 724  02af 9e            	ld	a,xh
 725  02b0 4d            	tnz	a
 726  02b1 2614          	jrne	L341
 727                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
 728  02b3 7b07          	ld	a,(OFST+7,sp)
 729  02b5 88            	push	a
 730  02b6 7b06          	ld	a,(OFST+6,sp)
 731  02b8 97            	ld	xl,a
 732  02b9 7b03          	ld	a,(OFST+3,sp)
 733  02bb 95            	ld	xh,a
 734  02bc cd054a        	call	L3_TI1_Config
 736  02bf 84            	pop	a
 737                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
 738  02c0 7b06          	ld	a,(OFST+6,sp)
 739  02c2 cd037c        	call	_TIM5_SetIC1Prescaler
 742  02c5 2012          	jra	L541
 743  02c7               L341:
 744                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
 745  02c7 7b07          	ld	a,(OFST+7,sp)
 746  02c9 88            	push	a
 747  02ca 7b06          	ld	a,(OFST+6,sp)
 748  02cc 97            	ld	xl,a
 749  02cd 7b03          	ld	a,(OFST+3,sp)
 750  02cf 95            	ld	xh,a
 751  02d0 cd0582        	call	L5_TI2_Config
 753  02d3 84            	pop	a
 754                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
 755  02d4 7b06          	ld	a,(OFST+6,sp)
 756  02d6 cd038a        	call	_TIM5_SetIC2Prescaler
 758  02d9               L541:
 759                     ; 1209 }
 760  02d9 85            	popw	x
 761  02da 81            	ret	
 763                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
 763                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
 763                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
 763                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
 763                     ; 1239                      uint8_t TIM5_ICFilter)
 763                     ; 1240 {
 764  02db               _TIM5_PWMIConfig:
 765  02db 89            	pushw	x
 766  02dc 89            	pushw	x
 767       00000002      OFST:	set	2
 769                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
 770                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
 771                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
 772                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
 773  02dd 9f            	ld	a,xl
 774  02de 4d            	tnz	a
 775  02df 2605          	jrne	L741
 776                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
 777  02e1 4c            	inc	a
 778  02e2 6b01          	ld	(OFST-1,sp),a
 780  02e4 2002          	jra	L151
 781  02e6               L741:
 782                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
 783  02e6 0f01          	clr	(OFST-1,sp)
 784  02e8               L151:
 785                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
 786  02e8 7b07          	ld	a,(OFST+5,sp)
 787  02ea 4a            	dec	a
 788  02eb 2604          	jrne	L351
 789                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
 790  02ed a602          	ld	a,#2
 792  02ef 2002          	jra	L551
 793  02f1               L351:
 794                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
 795  02f1 a601          	ld	a,#1
 796  02f3               L551:
 797  02f3 6b02          	ld	(OFST+0,sp),a
 798                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
 799  02f5 7b03          	ld	a,(OFST+1,sp)
 800  02f7 2624          	jrne	L751
 801                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
 801                     ; 1271                TIM5_ICFilter);
 802  02f9 7b09          	ld	a,(OFST+7,sp)
 803  02fb 88            	push	a
 804  02fc 7b08          	ld	a,(OFST+6,sp)
 805  02fe 97            	ld	xl,a
 806  02ff 7b05          	ld	a,(OFST+3,sp)
 807  0301 95            	ld	xh,a
 808  0302 cd054a        	call	L3_TI1_Config
 810  0305 84            	pop	a
 811                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
 812  0306 7b08          	ld	a,(OFST+6,sp)
 813  0308 ad72          	call	_TIM5_SetIC1Prescaler
 815                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
 816  030a 7b09          	ld	a,(OFST+7,sp)
 817  030c 88            	push	a
 818  030d 7b03          	ld	a,(OFST+1,sp)
 819  030f 97            	ld	xl,a
 820  0310 7b02          	ld	a,(OFST+0,sp)
 821  0312 95            	ld	xh,a
 822  0313 cd0582        	call	L5_TI2_Config
 824  0316 84            	pop	a
 825                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
 826  0317 7b08          	ld	a,(OFST+6,sp)
 827  0319 ad6f          	call	_TIM5_SetIC2Prescaler
 830  031b 2022          	jra	L161
 831  031d               L751:
 832                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
 832                     ; 1286                TIM5_ICFilter);
 833  031d 7b09          	ld	a,(OFST+7,sp)
 834  031f 88            	push	a
 835  0320 7b08          	ld	a,(OFST+6,sp)
 836  0322 97            	ld	xl,a
 837  0323 7b05          	ld	a,(OFST+3,sp)
 838  0325 95            	ld	xh,a
 839  0326 cd0582        	call	L5_TI2_Config
 841  0329 84            	pop	a
 842                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
 843  032a 7b08          	ld	a,(OFST+6,sp)
 844  032c ad5c          	call	_TIM5_SetIC2Prescaler
 846                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
 847  032e 7b09          	ld	a,(OFST+7,sp)
 848  0330 88            	push	a
 849  0331 7b03          	ld	a,(OFST+1,sp)
 850  0333 97            	ld	xl,a
 851  0334 7b02          	ld	a,(OFST+0,sp)
 852  0336 95            	ld	xh,a
 853  0337 cd054a        	call	L3_TI1_Config
 855  033a 84            	pop	a
 856                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
 857  033b 7b08          	ld	a,(OFST+6,sp)
 858  033d ad3d          	call	_TIM5_SetIC1Prescaler
 860  033f               L161:
 861                     ; 1297 }
 862  033f 5b04          	addw	sp,#4
 863  0341 81            	ret	
 865                     ; 1304 uint16_t TIM5_GetCapture1(void)
 865                     ; 1305 {
 866  0342               _TIM5_GetCapture1:
 867  0342 5204          	subw	sp,#4
 868       00000004      OFST:	set	4
 870                     ; 1306   uint16_t tmpccr1 = 0;
 871                     ; 1309   tmpccr1h = TIM5->CCR1H;
 872  0344 c65311        	ld	a,21265
 873  0347 6b02          	ld	(OFST-2,sp),a
 874                     ; 1310   tmpccr1l = TIM5->CCR1L;
 875  0349 c65312        	ld	a,21266
 876  034c 6b01          	ld	(OFST-3,sp),a
 877                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
 878  034e 5f            	clrw	x
 879  034f 97            	ld	xl,a
 880  0350 1f03          	ldw	(OFST-1,sp),x
 881                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
 882  0352 5f            	clrw	x
 883  0353 7b02          	ld	a,(OFST-2,sp)
 884  0355 97            	ld	xl,a
 885  0356 7b04          	ld	a,(OFST+0,sp)
 886  0358 01            	rrwa	x,a
 887  0359 1a03          	or	a,(OFST-1,sp)
 888  035b 01            	rrwa	x,a
 889                     ; 1315   return ((uint16_t)tmpccr1);
 891  035c 5b04          	addw	sp,#4
 892  035e 81            	ret	
 894                     ; 1323 uint16_t TIM5_GetCapture2(void)
 894                     ; 1324 {
 895  035f               _TIM5_GetCapture2:
 896  035f 5204          	subw	sp,#4
 897       00000004      OFST:	set	4
 899                     ; 1325   uint16_t tmpccr2 = 0;
 900                     ; 1328   tmpccr2h = TIM5->CCR2H;
 901  0361 c65313        	ld	a,21267
 902  0364 6b02          	ld	(OFST-2,sp),a
 903                     ; 1329   tmpccr2l = TIM5->CCR2L;
 904  0366 c65314        	ld	a,21268
 905  0369 6b01          	ld	(OFST-3,sp),a
 906                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
 907  036b 5f            	clrw	x
 908  036c 97            	ld	xl,a
 909  036d 1f03          	ldw	(OFST-1,sp),x
 910                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
 911  036f 5f            	clrw	x
 912  0370 7b02          	ld	a,(OFST-2,sp)
 913  0372 97            	ld	xl,a
 914  0373 7b04          	ld	a,(OFST+0,sp)
 915  0375 01            	rrwa	x,a
 916  0376 1a03          	or	a,(OFST-1,sp)
 917  0378 01            	rrwa	x,a
 918                     ; 1334   return ((uint16_t)tmpccr2);
 920  0379 5b04          	addw	sp,#4
 921  037b 81            	ret	
 923                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
 923                     ; 1348 {
 924  037c               _TIM5_SetIC1Prescaler:
 925  037c 88            	push	a
 926  037d 88            	push	a
 927       00000001      OFST:	set	1
 929                     ; 1349   uint8_t tmpccmr1 = 0;
 930                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
 931                     ; 1354   tmpccmr1 = TIM5->CCMR1;
 932  037e c65309        	ld	a,21257
 933                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
 934  0381 a4f3          	and	a,#243
 935                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
 936  0383 1a02          	or	a,(OFST+1,sp)
 937                     ; 1362   TIM5->CCMR1 = tmpccmr1;
 938  0385 c75309        	ld	21257,a
 939                     ; 1363 }
 940  0388 85            	popw	x
 941  0389 81            	ret	
 943                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
 943                     ; 1376 {
 944  038a               _TIM5_SetIC2Prescaler:
 945  038a 88            	push	a
 946  038b 88            	push	a
 947       00000001      OFST:	set	1
 949                     ; 1377   uint8_t tmpccmr2 = 0;
 950                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
 951                     ; 1382   tmpccmr2 = TIM5->CCMR2;
 952  038c c6530a        	ld	a,21258
 953                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
 954  038f a4f3          	and	a,#243
 955                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
 956  0391 1a02          	or	a,(OFST+1,sp)
 957                     ; 1390   TIM5->CCMR2 = tmpccmr2;
 958  0393 c7530a        	ld	21258,a
 959                     ; 1391 }
 960  0396 85            	popw	x
 961  0397 81            	ret	
 963                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
 963                     ; 1423 {
 964  0398               _TIM5_ITConfig:
 965  0398 89            	pushw	x
 966       00000000      OFST:	set	0
 968                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
 969                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
 970                     ; 1428   if (NewState != DISABLE)
 971  0399 9f            	ld	a,xl
 972  039a 4d            	tnz	a
 973  039b 2706          	jreq	L361
 974                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
 975  039d 9e            	ld	a,xh
 976  039e ca5305        	or	a,21253
 978  03a1 2006          	jra	L561
 979  03a3               L361:
 980                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
 981  03a3 7b01          	ld	a,(OFST+1,sp)
 982  03a5 43            	cpl	a
 983  03a6 c45305        	and	a,21253
 984  03a9               L561:
 985  03a9 c75305        	ld	21253,a
 986                     ; 1438 }
 987  03ac 85            	popw	x
 988  03ad 81            	ret	
 990                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
 990                     ; 1452 {
 991  03ae               _TIM5_GenerateEvent:
 993                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
 994                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
 995  03ae ca5308        	or	a,21256
 996  03b1 c75308        	ld	21256,a
 997                     ; 1458 }
 998  03b4 81            	ret	
1000                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
1000                     ; 1474 {
1001  03b5               _TIM5_GetFlagStatus:
1002  03b5 89            	pushw	x
1003  03b6 89            	pushw	x
1004       00000002      OFST:	set	2
1006                     ; 1475   FlagStatus bitstatus = RESET;
1007                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
1009                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
1010                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
1011  03b7 9f            	ld	a,xl
1012  03b8 c45306        	and	a,21254
1013  03bb 6b01          	ld	(OFST-1,sp),a
1014                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
1015  03bd c65307        	ld	a,21255
1016  03c0 1403          	and	a,(OFST+1,sp)
1017  03c2 6b02          	ld	(OFST+0,sp),a
1018                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
1019  03c4 1a01          	or	a,(OFST-1,sp)
1020  03c6 2702          	jreq	L761
1021                     ; 1486     bitstatus = SET;
1022  03c8 a601          	ld	a,#1
1024  03ca               L761:
1025                     ; 1490     bitstatus = RESET;
1026                     ; 1492   return ((FlagStatus)bitstatus);
1028  03ca 5b04          	addw	sp,#4
1029  03cc 81            	ret	
1031                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
1031                     ; 1507 {
1032  03cd               _TIM5_ClearFlag:
1033  03cd 89            	pushw	x
1034       00000000      OFST:	set	0
1036                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
1037                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
1038  03ce 9f            	ld	a,xl
1039  03cf 43            	cpl	a
1040  03d0 c75306        	ld	21254,a
1041                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
1042  03d3 7b01          	ld	a,(OFST+1,sp)
1043  03d5 43            	cpl	a
1044  03d6 c75307        	ld	21255,a
1045                     ; 1513 }
1046  03d9 85            	popw	x
1047  03da 81            	ret	
1049                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
1049                     ; 1527 {
1050  03db               _TIM5_GetITStatus:
1051  03db 88            	push	a
1052  03dc 89            	pushw	x
1053       00000002      OFST:	set	2
1055                     ; 1528   ITStatus bitstatus = RESET;
1056                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
1058                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
1059                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
1060  03dd c45306        	and	a,21254
1061  03e0 6b01          	ld	(OFST-1,sp),a
1062                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
1063  03e2 c65305        	ld	a,21253
1064  03e5 1403          	and	a,(OFST+1,sp)
1065  03e7 6b02          	ld	(OFST+0,sp),a
1066                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
1067  03e9 7b01          	ld	a,(OFST-1,sp)
1068  03eb 2708          	jreq	L371
1070  03ed 7b02          	ld	a,(OFST+0,sp)
1071  03ef 2704          	jreq	L371
1072                     ; 1541     bitstatus = (ITStatus)SET;
1073  03f1 a601          	ld	a,#1
1075  03f3 2001          	jra	L571
1076  03f5               L371:
1077                     ; 1545     bitstatus = (ITStatus)RESET;
1078  03f5 4f            	clr	a
1079  03f6               L571:
1080                     ; 1547   return ((ITStatus)bitstatus);
1082  03f6 5b03          	addw	sp,#3
1083  03f8 81            	ret	
1085                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
1085                     ; 1562 {
1086  03f9               _TIM5_ClearITPendingBit:
1088                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
1089                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
1090  03f9 43            	cpl	a
1091  03fa c75306        	ld	21254,a
1092                     ; 1568 }
1093  03fd 81            	ret	
1095                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
1095                     ; 1582 {
1096  03fe               _TIM5_DMACmd:
1097  03fe 89            	pushw	x
1098       00000000      OFST:	set	0
1100                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1101                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
1102                     ; 1587   if (NewState != DISABLE)
1103  03ff 9f            	ld	a,xl
1104  0400 4d            	tnz	a
1105  0401 2706          	jreq	L771
1106                     ; 1590     TIM5->DER |= TIM5_DMASource;
1107  0403 9e            	ld	a,xh
1108  0404 ca5304        	or	a,21252
1110  0407 2006          	jra	L102
1111  0409               L771:
1112                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
1113  0409 7b01          	ld	a,(OFST+1,sp)
1114  040b 43            	cpl	a
1115  040c c45304        	and	a,21252
1116  040f               L102:
1117  040f c75304        	ld	21252,a
1118                     ; 1597 }
1119  0412 85            	popw	x
1120  0413 81            	ret	
1122                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
1122                     ; 1606 {
1123  0414               _TIM5_SelectCCDMA:
1125                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
1126                     ; 1610   if (NewState != DISABLE)
1127  0414 4d            	tnz	a
1128  0415 2705          	jreq	L302
1129                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
1130  0417 72165301      	bset	21249,#3
1132  041b 81            	ret	
1133  041c               L302:
1134                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
1135  041c 72175301      	bres	21249,#3
1136                     ; 1620 }
1137  0420 81            	ret	
1139                     ; 1644 void TIM5_InternalClockConfig(void)
1139                     ; 1645 {
1140  0421               _TIM5_InternalClockConfig:
1142                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
1143  0421 c65302        	ld	a,21250
1144  0424 a4f8          	and	a,#248
1145  0426 c75302        	ld	21250,a
1146                     ; 1648 }
1147  0429 81            	ret	
1149                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
1149                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
1149                     ; 1667                                  uint8_t ICFilter)
1149                     ; 1668 {
1150  042a               _TIM5_TIxExternalClockConfig:
1151  042a 89            	pushw	x
1152       00000000      OFST:	set	0
1154                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
1155                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
1156                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
1157                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
1158  042b 9e            	ld	a,xh
1159  042c a160          	cp	a,#96
1160  042e 260d          	jrne	L702
1161                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
1162  0430 7b05          	ld	a,(OFST+5,sp)
1163  0432 88            	push	a
1164  0433 9f            	ld	a,xl
1165  0434 ae0001        	ldw	x,#1
1166  0437 95            	ld	xh,a
1167  0438 cd0582        	call	L5_TI2_Config
1170  043b 200c          	jra	L112
1171  043d               L702:
1172                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
1173  043d 7b05          	ld	a,(OFST+5,sp)
1174  043f 88            	push	a
1175  0440 7b03          	ld	a,(OFST+3,sp)
1176  0442 ae0001        	ldw	x,#1
1177  0445 95            	ld	xh,a
1178  0446 cd054a        	call	L3_TI1_Config
1180  0449               L112:
1181  0449 84            	pop	a
1182                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
1183  044a 7b01          	ld	a,(OFST+1,sp)
1184  044c ad46          	call	_TIM5_SelectInputTrigger
1186                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
1187  044e c65302        	ld	a,21250
1188  0451 aa07          	or	a,#7
1189  0453 c75302        	ld	21250,a
1190                     ; 1689 }
1191  0456 85            	popw	x
1192  0457 81            	ret	
1194                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
1194                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
1194                     ; 1709                               uint8_t ExtTRGFilter)
1194                     ; 1710 {
1195  0458               _TIM5_ETRClockMode1Config:
1196  0458 89            	pushw	x
1197       00000000      OFST:	set	0
1199                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
1200  0459 7b05          	ld	a,(OFST+5,sp)
1201  045b 88            	push	a
1202  045c 7b02          	ld	a,(OFST+2,sp)
1203  045e 95            	ld	xh,a
1204  045f ad6a          	call	_TIM5_ETRConfig
1206  0461 84            	pop	a
1207                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1208  0462 c65302        	ld	a,21250
1209  0465 a4f8          	and	a,#248
1210  0467 c75302        	ld	21250,a
1211                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
1212  046a c65302        	ld	a,21250
1213  046d aa07          	or	a,#7
1214  046f c75302        	ld	21250,a
1215                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1216  0472 c65302        	ld	a,21250
1217  0475 a48f          	and	a,#143
1218  0477 c75302        	ld	21250,a
1219                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
1220  047a c65302        	ld	a,21250
1221  047d aa70          	or	a,#112
1222  047f c75302        	ld	21250,a
1223                     ; 1721 }
1224  0482 85            	popw	x
1225  0483 81            	ret	
1227                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
1227                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
1227                     ; 1741                               uint8_t ExtTRGFilter)
1227                     ; 1742 {
1228  0484               _TIM5_ETRClockMode2Config:
1229  0484 89            	pushw	x
1230       00000000      OFST:	set	0
1232                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
1233  0485 7b05          	ld	a,(OFST+5,sp)
1234  0487 88            	push	a
1235  0488 7b02          	ld	a,(OFST+2,sp)
1236  048a 95            	ld	xh,a
1237  048b ad3e          	call	_TIM5_ETRConfig
1239  048d 721c5303      	bset	21251,#6
1240                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
1241                     ; 1748 }
1242  0491 5b03          	addw	sp,#3
1243  0493 81            	ret	
1245                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
1245                     ; 1800 {
1246  0494               _TIM5_SelectInputTrigger:
1247  0494 88            	push	a
1248  0495 88            	push	a
1249       00000001      OFST:	set	1
1251                     ; 1801   uint8_t tmpsmcr = 0;
1252                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
1253                     ; 1806   tmpsmcr = TIM5->SMCR;
1254  0496 c65302        	ld	a,21250
1255                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
1256  0499 a48f          	and	a,#143
1257                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
1258  049b 1a02          	or	a,(OFST+1,sp)
1259                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
1260  049d c75302        	ld	21250,a
1261                     ; 1813 }
1262  04a0 85            	popw	x
1263  04a1 81            	ret	
1265                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
1265                     ; 1828 {
1266  04a2               _TIM5_SelectOutputTrigger:
1267  04a2 88            	push	a
1268  04a3 88            	push	a
1269       00000001      OFST:	set	1
1271                     ; 1829   uint8_t tmpcr2 = 0;
1272                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
1273                     ; 1834   tmpcr2 = TIM5->CR2;
1274  04a4 c65301        	ld	a,21249
1275                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
1276  04a7 a48f          	and	a,#143
1277                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
1278  04a9 1a02          	or	a,(OFST+1,sp)
1279                     ; 1842   TIM5->CR2 = tmpcr2;
1280  04ab c75301        	ld	21249,a
1281                     ; 1843 }
1282  04ae 85            	popw	x
1283  04af 81            	ret	
1285                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
1285                     ; 1856 {
1286  04b0               _TIM5_SelectSlaveMode:
1287  04b0 88            	push	a
1288  04b1 88            	push	a
1289       00000001      OFST:	set	1
1291                     ; 1857   uint8_t tmpsmcr = 0;
1292                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
1293                     ; 1862   tmpsmcr = TIM5->SMCR;
1294  04b2 c65302        	ld	a,21250
1295                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
1296  04b5 a4f8          	and	a,#248
1297                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
1298  04b7 1a02          	or	a,(OFST+1,sp)
1299                     ; 1870   TIM5->SMCR = tmpsmcr;
1300  04b9 c75302        	ld	21250,a
1301                     ; 1871 }
1302  04bc 85            	popw	x
1303  04bd 81            	ret	
1305                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
1305                     ; 1880 {
1306  04be               _TIM5_SelectMasterSlaveMode:
1308                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
1309                     ; 1885   if (NewState != DISABLE)
1310  04be 4d            	tnz	a
1311  04bf 2705          	jreq	L312
1312                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
1313  04c1 721e5302      	bset	21250,#7
1315  04c5 81            	ret	
1316  04c6               L312:
1317                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
1318  04c6 721f5302      	bres	21250,#7
1319                     ; 1893 }
1320  04ca 81            	ret	
1322                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
1322                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
1322                     ; 1913                     uint8_t ExtTRGFilter)
1322                     ; 1914 {
1323  04cb               _TIM5_ETRConfig:
1324  04cb 89            	pushw	x
1325       00000000      OFST:	set	0
1327                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
1328                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
1329                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
1330                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
1330                     ; 1922                          | (uint8_t)ExtTRGFilter);
1331  04cc 9f            	ld	a,xl
1332  04cd 1a01          	or	a,(OFST+1,sp)
1333  04cf 1a05          	or	a,(OFST+5,sp)
1334  04d1 ca5303        	or	a,21251
1335  04d4 c75303        	ld	21251,a
1336                     ; 1923 }
1337  04d7 85            	popw	x
1338  04d8 81            	ret	
1340                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
1340                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
1340                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
1340                     ; 1961 {
1341  04d9               _TIM5_EncoderInterfaceConfig:
1342  04d9 89            	pushw	x
1343  04da 5203          	subw	sp,#3
1344       00000003      OFST:	set	3
1346                     ; 1962   uint8_t tmpsmcr = 0;
1347                     ; 1963   uint8_t tmpccmr1 = 0;
1348                     ; 1964   uint8_t tmpccmr2 = 0;
1349                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
1350                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
1351                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
1352                     ; 1971   tmpsmcr = TIM5->SMCR;
1353  04dc c65302        	ld	a,21250
1354  04df 6b01          	ld	(OFST-2,sp),a
1355                     ; 1972   tmpccmr1 = TIM5->CCMR1;
1356  04e1 c65309        	ld	a,21257
1357  04e4 6b02          	ld	(OFST-1,sp),a
1358                     ; 1973   tmpccmr2 = TIM5->CCMR2;
1359  04e6 c6530a        	ld	a,21258
1360  04e9 6b03          	ld	(OFST+0,sp),a
1361                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
1362  04eb 7b01          	ld	a,(OFST-2,sp)
1363  04ed a4f0          	and	a,#240
1364  04ef 6b01          	ld	(OFST-2,sp),a
1365                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
1366  04f1 9e            	ld	a,xh
1367  04f2 1a01          	or	a,(OFST-2,sp)
1368  04f4 6b01          	ld	(OFST-2,sp),a
1369                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
1370  04f6 7b02          	ld	a,(OFST-1,sp)
1371  04f8 a4fc          	and	a,#252
1372  04fa 6b02          	ld	(OFST-1,sp),a
1373                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
1374  04fc 7b03          	ld	a,(OFST+0,sp)
1375  04fe a4fc          	and	a,#252
1376  0500 6b03          	ld	(OFST+0,sp),a
1377                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
1378  0502 7b02          	ld	a,(OFST-1,sp)
1379  0504 aa01          	or	a,#1
1380  0506 6b02          	ld	(OFST-1,sp),a
1381                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
1382  0508 7b03          	ld	a,(OFST+0,sp)
1383  050a aa01          	or	a,#1
1384  050c 6b03          	ld	(OFST+0,sp),a
1385                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
1386  050e 9f            	ld	a,xl
1387  050f 4a            	dec	a
1388  0510 2606          	jrne	L712
1389                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
1390  0512 7212530b      	bset	21259,#1
1392  0516 2004          	jra	L122
1393  0518               L712:
1394                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
1395  0518 7213530b      	bres	21259,#1
1396  051c               L122:
1397                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
1398  051c 7b08          	ld	a,(OFST+5,sp)
1399  051e 4a            	dec	a
1400  051f 2606          	jrne	L322
1401                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
1402  0521 721a530b      	bset	21259,#5
1404  0525 2004          	jra	L522
1405  0527               L322:
1406                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
1407  0527 721b530b      	bres	21259,#5
1408  052b               L522:
1409                     ; 2004   TIM5->SMCR = tmpsmcr;
1410  052b 7b01          	ld	a,(OFST-2,sp)
1411  052d c75302        	ld	21250,a
1412                     ; 2005   TIM5->CCMR1 = tmpccmr1;
1413  0530 7b02          	ld	a,(OFST-1,sp)
1414  0532 c75309        	ld	21257,a
1415                     ; 2006   TIM5->CCMR2 = tmpccmr2;
1416  0535 7b03          	ld	a,(OFST+0,sp)
1417  0537 c7530a        	ld	21258,a
1418                     ; 2007 }
1419  053a 5b05          	addw	sp,#5
1420  053c 81            	ret	
1422                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
1422                     ; 2016 {
1423  053d               _TIM5_SelectHallSensor:
1425                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
1426                     ; 2021   if (NewState != DISABLE)
1427  053d 4d            	tnz	a
1428  053e 2705          	jreq	L722
1429                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
1430  0540 721e5301      	bset	21249,#7
1432  0544 81            	ret	
1433  0545               L722:
1434                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
1435  0545 721f5301      	bres	21249,#7
1436                     ; 2029 }
1437  0549 81            	ret	
1439                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
1439                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
1439                     ; 2052                        uint8_t TIM5_ICFilter)
1439                     ; 2053 {
1440  054a               L3_TI1_Config:
1441  054a 89            	pushw	x
1442  054b 89            	pushw	x
1443       00000002      OFST:	set	2
1445                     ; 2054   uint8_t tmpccmr1 = 0;
1446                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
1447  054c 9e            	ld	a,xh
1448  054d 6b01          	ld	(OFST-1,sp),a
1449                     ; 2056   tmpccmr1 = TIM5->CCMR1;
1450  054f c65309        	ld	a,21257
1451  0552 6b02          	ld	(OFST+0,sp),a
1452                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
1453                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
1454                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
1455                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
1456  0554 7211530b      	bres	21259,#0
1457                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
1458  0558 a40c          	and	a,#12
1459  055a 6b02          	ld	(OFST+0,sp),a
1460                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
1461  055c 7b07          	ld	a,(OFST+5,sp)
1462  055e 97            	ld	xl,a
1463  055f a610          	ld	a,#16
1464  0561 42            	mul	x,a
1465  0562 9f            	ld	a,xl
1466  0563 1a04          	or	a,(OFST+2,sp)
1467  0565 1a02          	or	a,(OFST+0,sp)
1468  0567 6b02          	ld	(OFST+0,sp),a
1469                     ; 2070   TIM5->CCMR1 = tmpccmr1;
1470  0569 c75309        	ld	21257,a
1471                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
1472  056c 7b01          	ld	a,(OFST-1,sp)
1473  056e 4a            	dec	a
1474  056f 2606          	jrne	L332
1475                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
1476  0571 7212530b      	bset	21259,#1
1478  0575 2004          	jra	L532
1479  0577               L332:
1480                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1481  0577 7213530b      	bres	21259,#1
1482  057b               L532:
1483                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
1484  057b 7210530b      	bset	21259,#0
1485                     ; 2084 }
1486  057f 5b04          	addw	sp,#4
1487  0581 81            	ret	
1489                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
1489                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
1489                     ; 2103                        uint8_t TIM5_ICFilter)
1489                     ; 2104 {
1490  0582               L5_TI2_Config:
1491  0582 89            	pushw	x
1492  0583 89            	pushw	x
1493       00000002      OFST:	set	2
1495                     ; 2105   uint8_t tmpccmr2 = 0;
1496                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
1497  0584 9e            	ld	a,xh
1498  0585 6b01          	ld	(OFST-1,sp),a
1499                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
1500                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
1501                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
1502                     ; 2113   tmpccmr2 = TIM5->CCMR2;
1503  0587 c6530a        	ld	a,21258
1504  058a 6b02          	ld	(OFST+0,sp),a
1505                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
1506  058c 7219530b      	bres	21259,#4
1507                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
1508  0590 a40c          	and	a,#12
1509  0592 6b02          	ld	(OFST+0,sp),a
1510                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
1511  0594 7b07          	ld	a,(OFST+5,sp)
1512  0596 97            	ld	xl,a
1513  0597 a610          	ld	a,#16
1514  0599 42            	mul	x,a
1515  059a 9f            	ld	a,xl
1516  059b 1a04          	or	a,(OFST+2,sp)
1517  059d 1a02          	or	a,(OFST+0,sp)
1518  059f 6b02          	ld	(OFST+0,sp),a
1519                     ; 2122   TIM5->CCMR2 = tmpccmr2;
1520  05a1 c7530a        	ld	21258,a
1521                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
1522  05a4 7b01          	ld	a,(OFST-1,sp)
1523  05a6 4a            	dec	a
1524  05a7 2606          	jrne	L732
1525                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
1526  05a9 721a530b      	bset	21259,#5
1528  05ad 2004          	jra	L142
1529  05af               L732:
1530                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
1531  05af 721b530b      	bres	21259,#5
1532  05b3               L142:
1533                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
1534  05b3 7218530b      	bset	21259,#4
1535                     ; 2136 }
1536  05b7 5b04          	addw	sp,#4
1537  05b9 81            	ret	
1539                     	xdef	_TIM5_SelectHallSensor
1540                     	xdef	_TIM5_EncoderInterfaceConfig
1541                     	xdef	_TIM5_ETRConfig
1542                     	xdef	_TIM5_SelectMasterSlaveMode
1543                     	xdef	_TIM5_SelectSlaveMode
1544                     	xdef	_TIM5_SelectOutputTrigger
1545                     	xdef	_TIM5_SelectInputTrigger
1546                     	xdef	_TIM5_ETRClockMode2Config
1547                     	xdef	_TIM5_ETRClockMode1Config
1548                     	xdef	_TIM5_TIxExternalClockConfig
1549                     	xdef	_TIM5_InternalClockConfig
1550                     	xdef	_TIM5_SelectCCDMA
1551                     	xdef	_TIM5_DMACmd
1552                     	xdef	_TIM5_ClearITPendingBit
1553                     	xdef	_TIM5_GetITStatus
1554                     	xdef	_TIM5_ClearFlag
1555                     	xdef	_TIM5_GetFlagStatus
1556                     	xdef	_TIM5_GenerateEvent
1557                     	xdef	_TIM5_ITConfig
1558                     	xdef	_TIM5_SetIC2Prescaler
1559                     	xdef	_TIM5_SetIC1Prescaler
1560                     	xdef	_TIM5_GetCapture2
1561                     	xdef	_TIM5_GetCapture1
1562                     	xdef	_TIM5_PWMIConfig
1563                     	xdef	_TIM5_ICInit
1564                     	xdef	_TIM5_CCxCmd
1565                     	xdef	_TIM5_OC2PolarityConfig
1566                     	xdef	_TIM5_OC1PolarityConfig
1567                     	xdef	_TIM5_OC2FastConfig
1568                     	xdef	_TIM5_OC1FastConfig
1569                     	xdef	_TIM5_OC2PreloadConfig
1570                     	xdef	_TIM5_OC1PreloadConfig
1571                     	xdef	_TIM5_ForcedOC2Config
1572                     	xdef	_TIM5_ForcedOC1Config
1573                     	xdef	_TIM5_SetCompare2
1574                     	xdef	_TIM5_SetCompare1
1575                     	xdef	_TIM5_SelectOCxM
1576                     	xdef	_TIM5_CtrlPWMOutputs
1577                     	xdef	_TIM5_BKRConfig
1578                     	xdef	_TIM5_OC2Init
1579                     	xdef	_TIM5_OC1Init
1580                     	xdef	_TIM5_Cmd
1581                     	xdef	_TIM5_SelectOnePulseMode
1582                     	xdef	_TIM5_ARRPreloadConfig
1583                     	xdef	_TIM5_UpdateRequestConfig
1584                     	xdef	_TIM5_UpdateDisableConfig
1585                     	xdef	_TIM5_GetPrescaler
1586                     	xdef	_TIM5_GetCounter
1587                     	xdef	_TIM5_SetAutoreload
1588                     	xdef	_TIM5_SetCounter
1589                     	xdef	_TIM5_CounterModeConfig
1590                     	xdef	_TIM5_PrescalerConfig
1591                     	xdef	_TIM5_TimeBaseInit
1592                     	xdef	_TIM5_DeInit
1593                     	end
