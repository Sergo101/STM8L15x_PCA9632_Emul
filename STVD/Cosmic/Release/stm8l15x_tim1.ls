   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 181 void TIM1_DeInit(void)
  17                     ; 182 {
  18                     	scross	off
  19  0000               _TIM1_DeInit:
  21                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  22  0000 725f52b0      	clr	21168
  23                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  24  0004 725f52b1      	clr	21169
  25                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  26  0008 725f52b2      	clr	21170
  27                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  28  000c 725f52b3      	clr	21171
  29                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  30  0010 725f52b5      	clr	21173
  31                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  32  0014 725f52bd      	clr	21181
  33                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  34  0018 725f52be      	clr	21182
  35                     ; 193   TIM1->CCMR1 = 0x01;
  36  001c 350152b9      	mov	21177,#1
  37                     ; 194   TIM1->CCMR2 = 0x01;
  38  0020 350152ba      	mov	21178,#1
  39                     ; 195   TIM1->CCMR3 = 0x01;
  40  0024 350152bb      	mov	21179,#1
  41                     ; 196   TIM1->CCMR4 = 0x01;
  42  0028 350152bc      	mov	21180,#1
  43                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  44  002c 725f52bd      	clr	21181
  45                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  46  0030 725f52be      	clr	21182
  47                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  48  0034 725f52b9      	clr	21177
  49                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  50  0038 725f52ba      	clr	21178
  51                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  52  003c 725f52bb      	clr	21179
  53                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  54  0040 725f52bc      	clr	21180
  55                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  56  0044 725f52bf      	clr	21183
  57                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  58  0048 725f52c0      	clr	21184
  59                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  60  004c 725f52c1      	clr	21185
  61                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
  62  0050 725f52c2      	clr	21186
  63                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
  64  0054 35ff52c3      	mov	21187,#255
  65                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
  66  0058 35ff52c4      	mov	21188,#255
  67                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
  68  005c 725f52c6      	clr	21190
  69                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
  70  0060 725f52c7      	clr	21191
  71                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
  72  0064 725f52c8      	clr	21192
  73                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
  74  0068 725f52c9      	clr	21193
  75                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
  76  006c 725f52ca      	clr	21194
  77                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
  78  0070 725f52cb      	clr	21195
  79                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
  80  0074 725f52cc      	clr	21196
  81                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
  82  0078 725f52cd      	clr	21197
  83                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
  84  007c 725f52d0      	clr	21200
  85                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
  86  0080 350152b8      	mov	21176,#1
  87                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
  88  0084 725f52cf      	clr	21199
  89                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
  90  0088 725f52ce      	clr	21198
  91                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
  92  008c 725f52c5      	clr	21189
  93                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
  94  0090 725f52b6      	clr	21174
  95                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
  96  0094 725f52b7      	clr	21175
  97                     ; 225 }
  98  0098 81            	ret	
 100                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 100                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 100                     ; 243                        uint16_t TIM1_Period,
 100                     ; 244                        uint8_t TIM1_RepetitionCounter)
 100                     ; 245 {
 101  0099               _TIM1_TimeBaseInit:
 102       fffffffe      OFST: set -2
 104                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 105                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 106  0099 7b04          	ld	a,(OFST+6,sp)
 107  009b c752c3        	ld	21187,a
 108                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 109  009e 7b05          	ld	a,(OFST+7,sp)
 110  00a0 c752c4        	ld	21188,a
 111                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 112  00a3 9e            	ld	a,xh
 113  00a4 c752c1        	ld	21185,a
 114                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 115  00a7 9f            	ld	a,xl
 116  00a8 c752c2        	ld	21186,a
 117                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 117                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 118  00ab c652b0        	ld	a,21168
 119  00ae a48f          	and	a,#143
 120  00b0 1a03          	or	a,(OFST+5,sp)
 121  00b2 c752b0        	ld	21168,a
 122                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 123  00b5 7b06          	ld	a,(OFST+8,sp)
 124  00b7 c752c5        	ld	21189,a
 125                     ; 265 }
 126  00ba 81            	ret	
 128                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 128                     ; 280 {
 129  00bb               _TIM1_PrescalerConfig:
 130       fffffffe      OFST: set -2
 132                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 133                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 134  00bb 9e            	ld	a,xh
 135  00bc c752c1        	ld	21185,a
 136                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 137  00bf 9f            	ld	a,xl
 138  00c0 c752c2        	ld	21186,a
 139                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 140  00c3 7b03          	ld	a,(OFST+5,sp)
 141  00c5 c752b8        	ld	21176,a
 142                     ; 290 }
 143  00c8 81            	ret	
 145                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 145                     ; 304 {
 146  00c9               _TIM1_CounterModeConfig:
 147  00c9 88            	push	a
 148       00000000      OFST:	set	0
 150                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 151                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 151                     ; 311                         | (uint8_t)TIM1_CounterMode);
 152  00ca c652b0        	ld	a,21168
 153  00cd a48f          	and	a,#143
 154  00cf 1a01          	or	a,(OFST+1,sp)
 155  00d1 c752b0        	ld	21168,a
 156                     ; 312 }
 157  00d4 84            	pop	a
 158  00d5 81            	ret	
 160                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 160                     ; 321 {
 161  00d6               _TIM1_SetCounter:
 163                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 164  00d6 9e            	ld	a,xh
 165  00d7 c752bf        	ld	21183,a
 166                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 167  00da 9f            	ld	a,xl
 168  00db c752c0        	ld	21184,a
 169                     ; 325 }
 170  00de 81            	ret	
 172                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 172                     ; 334 {
 173  00df               _TIM1_SetAutoreload:
 175                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 176  00df 9e            	ld	a,xh
 177  00e0 c752c3        	ld	21187,a
 178                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 179  00e3 9f            	ld	a,xl
 180  00e4 c752c4        	ld	21188,a
 181                     ; 338 }
 182  00e7 81            	ret	
 184                     ; 345 uint16_t TIM1_GetCounter(void)
 184                     ; 346 {
 185  00e8               _TIM1_GetCounter:
 186  00e8 5204          	subw	sp,#4
 187       00000004      OFST:	set	4
 189                     ; 348   uint16_t tmpcntr = 0;
 190                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 192                     ; 351   tmpcntrh = TIM1->CNTRH;
 193  00ea c652bf        	ld	a,21183
 194  00ed 6b02          	ld	(OFST-2,sp),a
 195                     ; 352   tmpcntrl = TIM1->CNTRL;
 196  00ef c652c0        	ld	a,21184
 197  00f2 6b01          	ld	(OFST-3,sp),a
 198                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 199  00f4 5f            	clrw	x
 200  00f5 97            	ld	xl,a
 201  00f6 1f03          	ldw	(OFST-1,sp),x
 202                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 203  00f8 5f            	clrw	x
 204  00f9 7b02          	ld	a,(OFST-2,sp)
 205  00fb 97            	ld	xl,a
 206  00fc 7b04          	ld	a,(OFST+0,sp)
 207  00fe 01            	rrwa	x,a
 208  00ff 1a03          	or	a,(OFST-1,sp)
 209  0101 01            	rrwa	x,a
 210                     ; 358   return (uint16_t)tmpcntr;
 212  0102 5b04          	addw	sp,#4
 213  0104 81            	ret	
 215                     ; 366 uint16_t TIM1_GetPrescaler(void)
 215                     ; 367 {
 216  0105               _TIM1_GetPrescaler:
 217  0105 89            	pushw	x
 218       00000002      OFST:	set	2
 220                     ; 368   uint16_t tmpreg = 0;
 221                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 222  0106 c652c1        	ld	a,21185
 223  0109 97            	ld	xl,a
 224  010a 4f            	clr	a
 225  010b 02            	rlwa	x,a
 226  010c 1f01          	ldw	(OFST-1,sp),x
 227                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 228  010e c652c2        	ld	a,21186
 229  0111 5f            	clrw	x
 230  0112 97            	ld	xl,a
 231  0113 01            	rrwa	x,a
 232  0114 1a02          	or	a,(OFST+0,sp)
 233  0116 01            	rrwa	x,a
 234  0117 1a01          	or	a,(OFST-1,sp)
 235  0119 01            	rrwa	x,a
 237  011a 5b02          	addw	sp,#2
 238  011c 81            	ret	
 240                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 240                     ; 381 {
 241  011d               _TIM1_UpdateDisableConfig:
 243                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 244                     ; 386   if (NewState != DISABLE)
 245  011d 4d            	tnz	a
 246  011e 2705          	jreq	L31
 247                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 248  0120 721252b0      	bset	21168,#1
 250  0124 81            	ret	
 251  0125               L31:
 252                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 253  0125 721352b0      	bres	21168,#1
 254                     ; 394 }
 255  0129 81            	ret	
 257                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 257                     ; 405 {
 258  012a               _TIM1_UpdateRequestConfig:
 260                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 261                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 262  012a 4d            	tnz	a
 263  012b 2705          	jreq	L71
 264                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 265  012d 721452b0      	bset	21168,#2
 267  0131 81            	ret	
 268  0132               L71:
 269                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 270  0132 721552b0      	bres	21168,#2
 271                     ; 418 }
 272  0136 81            	ret	
 274                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 274                     ; 427 {
 275  0137               _TIM1_ARRPreloadConfig:
 277                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 278                     ; 432   if (NewState != DISABLE)
 279  0137 4d            	tnz	a
 280  0138 2705          	jreq	L32
 281                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 282  013a 721e52b0      	bset	21168,#7
 284  013e 81            	ret	
 285  013f               L32:
 286                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 287  013f 721f52b0      	bres	21168,#7
 288                     ; 440 }
 289  0143 81            	ret	
 291                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 291                     ; 451 {
 292  0144               _TIM1_SelectOnePulseMode:
 294                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
 295                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
 296  0144 4d            	tnz	a
 297  0145 2705          	jreq	L72
 298                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
 299  0147 721652b0      	bset	21168,#3
 301  014b 81            	ret	
 302  014c               L72:
 303                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
 304  014c 721752b0      	bres	21168,#3
 305                     ; 464 }
 306  0150 81            	ret	
 308                     ; 472 void TIM1_Cmd(FunctionalState NewState)
 308                     ; 473 {
 309  0151               _TIM1_Cmd:
 311                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
 312                     ; 478   if (NewState != DISABLE)
 313  0151 4d            	tnz	a
 314  0152 2705          	jreq	L33
 315                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
 316  0154 721052b0      	bset	21168,#0
 318  0158 81            	ret	
 319  0159               L33:
 320                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
 321  0159 721152b0      	bres	21168,#0
 322                     ; 486 }
 323  015d 81            	ret	
 325                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 325                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
 325                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 325                     ; 580                   uint16_t TIM1_Pulse,
 325                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 325                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 325                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 325                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 325                     ; 585 {
 326  015e               _TIM1_OC1Init:
 327  015e 89            	pushw	x
 328  015f 5203          	subw	sp,#3
 329       00000003      OFST:	set	3
 331                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 332                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 333                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 334                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 335                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 336                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 337                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 338                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
 338                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 339  0161 c652bd        	ld	a,21181
 340  0164 a4f0          	and	a,#240
 341  0166 c752bd        	ld	21181,a
 342                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 342                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 342                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 342                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 343  0169 7b0c          	ld	a,(OFST+9,sp)
 344  016b a408          	and	a,#8
 345  016d 6b03          	ld	(OFST+0,sp),a
 346  016f 7b0b          	ld	a,(OFST+8,sp)
 347  0171 a402          	and	a,#2
 348  0173 1a03          	or	a,(OFST+0,sp)
 349  0175 6b02          	ld	(OFST-1,sp),a
 350  0177 7b08          	ld	a,(OFST+5,sp)
 351  0179 a404          	and	a,#4
 352  017b 6b01          	ld	(OFST-2,sp),a
 353  017d 9f            	ld	a,xl
 354  017e a401          	and	a,#1
 355  0180 1a01          	or	a,(OFST-2,sp)
 356  0182 1a02          	or	a,(OFST-1,sp)
 357  0184 ca52bd        	or	a,21181
 358  0187 c752bd        	ld	21181,a
 359                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
 359                     ; 608                           | (uint8_t)TIM1_OCMode);
 360  018a c652b9        	ld	a,21177
 361  018d a48f          	and	a,#143
 362  018f 1a04          	or	a,(OFST+1,sp)
 363  0191 c752b9        	ld	21177,a
 364                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 365  0194 c652d0        	ld	a,21200
 366  0197 a4fc          	and	a,#252
 367  0199 c752d0        	ld	21200,a
 368                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
 368                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
 369  019c 7b0e          	ld	a,(OFST+11,sp)
 370  019e a402          	and	a,#2
 371  01a0 6b03          	ld	(OFST+0,sp),a
 372  01a2 7b0d          	ld	a,(OFST+10,sp)
 373  01a4 a401          	and	a,#1
 374  01a6 1a03          	or	a,(OFST+0,sp)
 375  01a8 ca52d0        	or	a,21200
 376  01ab c752d0        	ld	21200,a
 377                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 378  01ae 7b09          	ld	a,(OFST+6,sp)
 379  01b0 c752c6        	ld	21190,a
 380                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 381  01b3 7b0a          	ld	a,(OFST+7,sp)
 382  01b5 c752c7        	ld	21191,a
 383                     ; 619 }
 384  01b8 5b05          	addw	sp,#5
 385  01ba 81            	ret	
 387                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 387                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
 387                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 387                     ; 661                   uint16_t TIM1_Pulse,
 387                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 387                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 387                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 387                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 387                     ; 666 {
 388  01bb               _TIM1_OC2Init:
 389  01bb 89            	pushw	x
 390  01bc 5203          	subw	sp,#3
 391       00000003      OFST:	set	3
 393                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 394                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 395                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 396                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 397                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 398                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 399                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 400                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 401  01be c652bd        	ld	a,21181
 402  01c1 a40f          	and	a,#15
 403  01c3 c752bd        	ld	21181,a
 404                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
 404                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
 405  01c6 7b0c          	ld	a,(OFST+9,sp)
 406  01c8 a480          	and	a,#128
 407  01ca 6b03          	ld	(OFST+0,sp),a
 408  01cc 7b0b          	ld	a,(OFST+8,sp)
 409  01ce a420          	and	a,#32
 410  01d0 1a03          	or	a,(OFST+0,sp)
 411  01d2 6b02          	ld	(OFST-1,sp),a
 412  01d4 7b08          	ld	a,(OFST+5,sp)
 413  01d6 a440          	and	a,#64
 414  01d8 6b01          	ld	(OFST-2,sp),a
 415  01da 9f            	ld	a,xl
 416  01db a410          	and	a,#16
 417  01dd 1a01          	or	a,(OFST-2,sp)
 418  01df 1a02          	or	a,(OFST-1,sp)
 419  01e1 ca52bd        	or	a,21181
 420  01e4 c752bd        	ld	21181,a
 421                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 422  01e7 c652ba        	ld	a,21178
 423  01ea a48f          	and	a,#143
 424  01ec 1a04          	or	a,(OFST+1,sp)
 425  01ee c752ba        	ld	21178,a
 426                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 427  01f1 c652d0        	ld	a,21200
 428  01f4 a4f3          	and	a,#243
 429  01f6 c752d0        	ld	21200,a
 430                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 431  01f9 7b0e          	ld	a,(OFST+11,sp)
 432  01fb a408          	and	a,#8
 433  01fd 6b03          	ld	(OFST+0,sp),a
 434  01ff 7b0d          	ld	a,(OFST+10,sp)
 435  0201 a404          	and	a,#4
 436  0203 1a03          	or	a,(OFST+0,sp)
 437  0205 ca52d0        	or	a,21200
 438  0208 c752d0        	ld	21200,a
 439                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 440  020b 7b09          	ld	a,(OFST+6,sp)
 441  020d c752c8        	ld	21192,a
 442                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 443  0210 7b0a          	ld	a,(OFST+7,sp)
 444  0212 c752c9        	ld	21193,a
 445                     ; 696 }
 446  0215 5b05          	addw	sp,#5
 447  0217 81            	ret	
 449                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 449                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
 449                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 449                     ; 738                   uint16_t TIM1_Pulse,
 449                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 449                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 449                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 449                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 449                     ; 743 {
 450  0218               _TIM1_OC3Init:
 451  0218 89            	pushw	x
 452  0219 5203          	subw	sp,#3
 453       00000003      OFST:	set	3
 455                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 456                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 457                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 458                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 459                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 460                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 461                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 462                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 463  021b c652be        	ld	a,21182
 464  021e a4f0          	and	a,#240
 465  0220 c752be        	ld	21182,a
 466                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
 466                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
 467  0223 7b0c          	ld	a,(OFST+9,sp)
 468  0225 a408          	and	a,#8
 469  0227 6b03          	ld	(OFST+0,sp),a
 470  0229 7b0b          	ld	a,(OFST+8,sp)
 471  022b a402          	and	a,#2
 472  022d 1a03          	or	a,(OFST+0,sp)
 473  022f 6b02          	ld	(OFST-1,sp),a
 474  0231 7b08          	ld	a,(OFST+5,sp)
 475  0233 a404          	and	a,#4
 476  0235 6b01          	ld	(OFST-2,sp),a
 477  0237 9f            	ld	a,xl
 478  0238 a401          	and	a,#1
 479  023a 1a01          	or	a,(OFST-2,sp)
 480  023c 1a02          	or	a,(OFST-1,sp)
 481  023e ca52be        	or	a,21182
 482  0241 c752be        	ld	21182,a
 483                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 484  0244 c652bb        	ld	a,21179
 485  0247 a48f          	and	a,#143
 486  0249 1a04          	or	a,(OFST+1,sp)
 487  024b c752bb        	ld	21179,a
 488                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
 489  024e c652d0        	ld	a,21200
 490  0251 a4cf          	and	a,#207
 491  0253 c752d0        	ld	21200,a
 492                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
 493  0256 7b0e          	ld	a,(OFST+11,sp)
 494  0258 a420          	and	a,#32
 495  025a 6b03          	ld	(OFST+0,sp),a
 496  025c 7b0d          	ld	a,(OFST+10,sp)
 497  025e a410          	and	a,#16
 498  0260 1a03          	or	a,(OFST+0,sp)
 499  0262 ca52d0        	or	a,21200
 500  0265 c752d0        	ld	21200,a
 501                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
 502  0268 7b09          	ld	a,(OFST+6,sp)
 503  026a c752ca        	ld	21194,a
 504                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
 505  026d 7b0a          	ld	a,(OFST+7,sp)
 506  026f c752cb        	ld	21195,a
 507                     ; 773 }
 508  0272 5b05          	addw	sp,#5
 509  0274 81            	ret	
 511                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
 511                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
 511                     ; 805                      uint8_t TIM1_DeadTime,
 511                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
 511                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
 511                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
 511                     ; 809 {
 512  0275               _TIM1_BDTRConfig:
 513  0275 89            	pushw	x
 514  0276 88            	push	a
 515       00000001      OFST:	set	1
 517                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
 518                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
 519                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
 520                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
 521                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
 522                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
 523  0277 7b06          	ld	a,(OFST+5,sp)
 524  0279 c752cf        	ld	21199,a
 525                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
 525                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
 525                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
 526  027c 7b07          	ld	a,(OFST+6,sp)
 527  027e 1a08          	or	a,(OFST+7,sp)
 528  0280 1a09          	or	a,(OFST+8,sp)
 529  0282 6b01          	ld	(OFST+0,sp),a
 530  0284 9f            	ld	a,xl
 531  0285 1a02          	or	a,(OFST+1,sp)
 532  0287 1a01          	or	a,(OFST+0,sp)
 533  0289 c752ce        	ld	21198,a
 534                     ; 826 }
 535  028c 5b03          	addw	sp,#3
 536  028e 81            	ret	
 538                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
 538                     ; 835 {
 539  028f               _TIM1_CtrlPWMOutputs:
 541                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
 542                     ; 841   if (NewState != DISABLE)
 543  028f 4d            	tnz	a
 544  0290 2705          	jreq	L73
 545                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
 546  0292 721e52ce      	bset	21198,#7
 548  0296 81            	ret	
 549  0297               L73:
 550                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
 551  0297 721f52ce      	bres	21198,#7
 552                     ; 849 }
 553  029b 81            	ret	
 555                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
 555                     ; 872 {
 556  029c               _TIM1_SelectOCxM:
 557  029c 89            	pushw	x
 558       00000000      OFST:	set	0
 560                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
 561                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
 562                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
 563  029d 9e            	ld	a,xh
 564  029e 4d            	tnz	a
 565  029f 2610          	jrne	L34
 566                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
 567  02a1 721152bd      	bres	21181,#0
 568                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 569  02a5 c652b9        	ld	a,21177
 570  02a8 a48f          	and	a,#143
 571  02aa 1a02          	or	a,(OFST+2,sp)
 572  02ac c752b9        	ld	21177,a
 574  02af 2023          	jra	L54
 575  02b1               L34:
 576                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
 577  02b1 7b01          	ld	a,(OFST+1,sp)
 578  02b3 4a            	dec	a
 579  02b4 2610          	jrne	L74
 580                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
 581  02b6 721952bd      	bres	21181,#4
 582                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 583  02ba c652ba        	ld	a,21178
 584  02bd a48f          	and	a,#143
 585  02bf 1a02          	or	a,(OFST+2,sp)
 586  02c1 c752ba        	ld	21178,a
 588  02c4 200e          	jra	L54
 589  02c6               L74:
 590                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
 591  02c6 721152be      	bres	21182,#0
 592                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 593  02ca c652bb        	ld	a,21179
 594  02cd a48f          	and	a,#143
 595  02cf 1a02          	or	a,(OFST+2,sp)
 596  02d1 c752bb        	ld	21179,a
 597  02d4               L54:
 598                     ; 902 }
 599  02d4 85            	popw	x
 600  02d5 81            	ret	
 602                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
 602                     ; 911 {
 603  02d6               _TIM1_SetCompare1:
 605                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
 606  02d6 9e            	ld	a,xh
 607  02d7 c752c6        	ld	21190,a
 608                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
 609  02da 9f            	ld	a,xl
 610  02db c752c7        	ld	21191,a
 611                     ; 916 }
 612  02de 81            	ret	
 614                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
 614                     ; 925 {
 615  02df               _TIM1_SetCompare2:
 617                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
 618  02df 9e            	ld	a,xh
 619  02e0 c752c8        	ld	21192,a
 620                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
 621  02e3 9f            	ld	a,xl
 622  02e4 c752c9        	ld	21193,a
 623                     ; 929 }
 624  02e7 81            	ret	
 626                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
 626                     ; 938 {
 627  02e8               _TIM1_SetCompare3:
 629                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
 630  02e8 9e            	ld	a,xh
 631  02e9 c752ca        	ld	21194,a
 632                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
 633  02ec 9f            	ld	a,xl
 634  02ed c752cb        	ld	21195,a
 635                     ; 942 }
 636  02f0 81            	ret	
 638                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
 638                     ; 951 {
 639  02f1               _TIM1_SetCompare4:
 641                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
 642  02f1 9e            	ld	a,xh
 643  02f2 c752cc        	ld	21196,a
 644                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
 645  02f5 9f            	ld	a,xl
 646  02f6 c752cd        	ld	21197,a
 647                     ; 955 }
 648  02f9 81            	ret	
 650                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
 650                     ; 964 {
 651  02fa               _TIM1_CCPreloadControl:
 653                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
 654                     ; 969   if (NewState != DISABLE)
 655  02fa 4d            	tnz	a
 656  02fb 2705          	jreq	L35
 657                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
 658  02fd 721052b1      	bset	21169,#0
 660  0301 81            	ret	
 661  0302               L35:
 662                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
 663  0302 721152b1      	bres	21169,#0
 664                     ; 977 }
 665  0306 81            	ret	
 667                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 667                     ; 988 {
 668  0307               _TIM1_ForcedOC1Config:
 669  0307 88            	push	a
 670       00000000      OFST:	set	0
 672                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
 673                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
 674  0308 c652b9        	ld	a,21177
 675  030b a48f          	and	a,#143
 676  030d 1a01          	or	a,(OFST+1,sp)
 677  030f c752b9        	ld	21177,a
 678                     ; 994 }
 679  0312 84            	pop	a
 680  0313 81            	ret	
 682                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 682                     ; 1005 {
 683  0314               _TIM1_ForcedOC2Config:
 684  0314 88            	push	a
 685       00000000      OFST:	set	0
 687                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
 688                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
 689  0315 c652ba        	ld	a,21178
 690  0318 a48f          	and	a,#143
 691  031a 1a01          	or	a,(OFST+1,sp)
 692  031c c752ba        	ld	21178,a
 693                     ; 1011 }
 694  031f 84            	pop	a
 695  0320 81            	ret	
 697                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 697                     ; 1022 {
 698  0321               _TIM1_ForcedOC3Config:
 699  0321 88            	push	a
 700       00000000      OFST:	set	0
 702                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
 703                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
 704  0322 c652bb        	ld	a,21179
 705  0325 a48f          	and	a,#143
 706  0327 1a01          	or	a,(OFST+1,sp)
 707  0329 c752bb        	ld	21179,a
 708                     ; 1028 }
 709  032c 84            	pop	a
 710  032d 81            	ret	
 712                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
 712                     ; 1037 {
 713  032e               _TIM1_OC1PreloadConfig:
 715                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
 716                     ; 1042   if (NewState != DISABLE)
 717  032e 4d            	tnz	a
 718  032f 2705          	jreq	L75
 719                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
 720  0331 721652b9      	bset	21177,#3
 722  0335 81            	ret	
 723  0336               L75:
 724                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 725  0336 721752b9      	bres	21177,#3
 726                     ; 1050 }
 727  033a 81            	ret	
 729                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
 729                     ; 1059 {
 730  033b               _TIM1_OC2PreloadConfig:
 732                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
 733                     ; 1064   if (NewState != DISABLE)
 734  033b 4d            	tnz	a
 735  033c 2705          	jreq	L36
 736                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
 737  033e 721652ba      	bset	21178,#3
 739  0342 81            	ret	
 740  0343               L36:
 741                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 742  0343 721752ba      	bres	21178,#3
 743                     ; 1072 }
 744  0347 81            	ret	
 746                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
 746                     ; 1081 {
 747  0348               _TIM1_OC3PreloadConfig:
 749                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
 750                     ; 1086   if (NewState != DISABLE)
 751  0348 4d            	tnz	a
 752  0349 2705          	jreq	L76
 753                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
 754  034b 721652bb      	bset	21179,#3
 756  034f 81            	ret	
 757  0350               L76:
 758                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 759  0350 721752bb      	bres	21179,#3
 760                     ; 1094 }
 761  0354 81            	ret	
 763                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
 763                     ; 1103 {
 764  0355               _TIM1_OC4PreloadConfig:
 766                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
 767                     ; 1108   if (NewState != DISABLE)
 768  0355 4d            	tnz	a
 769  0356 2705          	jreq	L37
 770                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
 771  0358 721652bc      	bset	21180,#3
 773  035c 81            	ret	
 774  035d               L37:
 775                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 776  035d 721752bc      	bres	21180,#3
 777                     ; 1116 }
 778  0361 81            	ret	
 780                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
 780                     ; 1125 {
 781  0362               _TIM1_OC1FastConfig:
 783                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
 784                     ; 1130   if (NewState != DISABLE)
 785  0362 4d            	tnz	a
 786  0363 2705          	jreq	L77
 787                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
 788  0365 721452b9      	bset	21177,#2
 790  0369 81            	ret	
 791  036a               L77:
 792                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
 793  036a 721552b9      	bres	21177,#2
 794                     ; 1138 }
 795  036e 81            	ret	
 797                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
 797                     ; 1147 {
 798  036f               _TIM1_OC2FastConfig:
 800                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
 801                     ; 1152   if (NewState != DISABLE)
 802  036f 4d            	tnz	a
 803  0370 2705          	jreq	L301
 804                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
 805  0372 721452ba      	bset	21178,#2
 807  0376 81            	ret	
 808  0377               L301:
 809                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
 810  0377 721552ba      	bres	21178,#2
 811                     ; 1160 }
 812  037b 81            	ret	
 814                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
 814                     ; 1169 {
 815  037c               _TIM1_OC3FastConfig:
 817                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
 818                     ; 1174   if (NewState != DISABLE)
 819  037c 4d            	tnz	a
 820  037d 2705          	jreq	L701
 821                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
 822  037f 721452bb      	bset	21179,#2
 824  0383 81            	ret	
 825  0384               L701:
 826                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
 827  0384 721552bb      	bres	21179,#2
 828                     ; 1182 }
 829  0388 81            	ret	
 831                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
 831                     ; 1191 {
 832  0389               _TIM1_ClearOC1Ref:
 834                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
 835                     ; 1196   if (NewState != DISABLE)
 836  0389 4d            	tnz	a
 837  038a 2705          	jreq	L311
 838                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
 839  038c 721e52b9      	bset	21177,#7
 841  0390 81            	ret	
 842  0391               L311:
 843                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 844  0391 721f52b9      	bres	21177,#7
 845                     ; 1204 }
 846  0395 81            	ret	
 848                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
 848                     ; 1213 {
 849  0396               _TIM1_ClearOC2Ref:
 851                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
 852                     ; 1218   if (NewState != DISABLE)
 853  0396 4d            	tnz	a
 854  0397 2705          	jreq	L711
 855                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
 856  0399 721e52ba      	bset	21178,#7
 858  039d 81            	ret	
 859  039e               L711:
 860                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 861  039e 721f52ba      	bres	21178,#7
 862                     ; 1226 }
 863  03a2 81            	ret	
 865                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
 865                     ; 1235 {
 866  03a3               _TIM1_ClearOC3Ref:
 868                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
 869                     ; 1240   if (NewState != DISABLE)
 870  03a3 4d            	tnz	a
 871  03a4 2705          	jreq	L321
 872                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
 873  03a6 721e52bb      	bset	21179,#7
 875  03aa 81            	ret	
 876  03ab               L321:
 877                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 878  03ab 721f52bb      	bres	21179,#7
 879                     ; 1248 }
 880  03af 81            	ret	
 882                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
 882                     ; 1257 {
 883  03b0               _TIM1_ClearOC4Ref:
 885                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 886                     ; 1262   if (NewState != DISABLE)
 887  03b0 4d            	tnz	a
 888  03b1 2705          	jreq	L721
 889                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
 890  03b3 721e52bc      	bset	21180,#7
 892  03b7 81            	ret	
 893  03b8               L721:
 894                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 895  03b8 721f52bc      	bres	21180,#7
 896                     ; 1270 }
 897  03bc 81            	ret	
 899                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
 899                     ; 1281 {
 900  03bd               _TIM1_OC1PolarityConfig:
 902                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 903                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
 904  03bd 4d            	tnz	a
 905  03be 2705          	jreq	L331
 906                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
 907  03c0 721252bd      	bset	21181,#1
 909  03c4 81            	ret	
 910  03c5               L331:
 911                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
 912  03c5 721352bd      	bres	21181,#1
 913                     ; 1294 }
 914  03c9 81            	ret	
 916                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
 916                     ; 1305 {
 917  03ca               _TIM1_OC1NPolarityConfig:
 919                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 920                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
 921  03ca 4d            	tnz	a
 922  03cb 2705          	jreq	L731
 923                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
 924  03cd 721652bd      	bset	21181,#3
 926  03d1 81            	ret	
 927  03d2               L731:
 928                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
 929  03d2 721752bd      	bres	21181,#3
 930                     ; 1318 }
 931  03d6 81            	ret	
 933                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
 933                     ; 1329 {
 934  03d7               _TIM1_OC2PolarityConfig:
 936                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 937                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
 938  03d7 4d            	tnz	a
 939  03d8 2705          	jreq	L341
 940                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
 941  03da 721a52bd      	bset	21181,#5
 943  03de 81            	ret	
 944  03df               L341:
 945                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
 946  03df 721b52bd      	bres	21181,#5
 947                     ; 1342 }
 948  03e3 81            	ret	
 950                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
 950                     ; 1353 {
 951  03e4               _TIM1_OC2NPolarityConfig:
 953                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 954                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
 955  03e4 4d            	tnz	a
 956  03e5 2705          	jreq	L741
 957                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
 958  03e7 721e52bd      	bset	21181,#7
 960  03eb 81            	ret	
 961  03ec               L741:
 962                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
 963  03ec 721f52bd      	bres	21181,#7
 964                     ; 1366 }
 965  03f0 81            	ret	
 967                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
 967                     ; 1377 {
 968  03f1               _TIM1_OC3PolarityConfig:
 970                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 971                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
 972  03f1 4d            	tnz	a
 973  03f2 2705          	jreq	L351
 974                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
 975  03f4 721252be      	bset	21182,#1
 977  03f8 81            	ret	
 978  03f9               L351:
 979                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
 980  03f9 721352be      	bres	21182,#1
 981                     ; 1390 }
 982  03fd 81            	ret	
 984                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
 984                     ; 1401 {
 985  03fe               _TIM1_OC3NPolarityConfig:
 987                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 988                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
 989  03fe 4d            	tnz	a
 990  03ff 2705          	jreq	L751
 991                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
 992  0401 721652be      	bset	21182,#3
 994  0405 81            	ret	
 995  0406               L751:
 996                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
 997  0406 721752be      	bres	21182,#3
 998                     ; 1414 }
 999  040a 81            	ret	
1001                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
1001                     ; 1425 {
1002  040b               _TIM1_SelectOCREFClear:
1004                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
1005                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
1006  040b 721752b2      	bres	21170,#3
1007                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
1008  040f ca52b2        	or	a,21170
1009  0412 c752b2        	ld	21170,a
1010                     ; 1432 }
1011  0415 81            	ret	
1013                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
1013                     ; 1441 {
1014  0416               _TIM1_SelectCOM:
1016                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
1017                     ; 1446   if (NewState != DISABLE)
1018  0416 4d            	tnz	a
1019  0417 2705          	jreq	L361
1020                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
1021  0419 721452b1      	bset	21169,#2
1023  041d 81            	ret	
1024  041e               L361:
1025                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
1026  041e 721552b1      	bres	21169,#2
1027                     ; 1454 }
1028  0422 81            	ret	
1030                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
1030                     ; 1469 {
1031  0423               _TIM1_CCxCmd:
1032  0423 89            	pushw	x
1033       00000000      OFST:	set	0
1035                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
1036                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1037                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
1038  0424 9e            	ld	a,xh
1039  0425 4d            	tnz	a
1040  0426 2610          	jrne	L761
1041                     ; 1477     if (NewState != DISABLE)
1042  0428 9f            	ld	a,xl
1043  0429 4d            	tnz	a
1044  042a 2706          	jreq	L171
1045                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
1046  042c 721052bd      	bset	21181,#0
1048  0430 203e          	jra	L571
1049  0432               L171:
1050                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
1051  0432 721152bd      	bres	21181,#0
1052  0436 2038          	jra	L571
1053  0438               L761:
1054                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
1055  0438 7b01          	ld	a,(OFST+1,sp)
1056  043a a101          	cp	a,#1
1057  043c 2610          	jrne	L771
1058                     ; 1489     if (NewState != DISABLE)
1059  043e 7b02          	ld	a,(OFST+2,sp)
1060  0440 2706          	jreq	L102
1061                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
1062  0442 721852bd      	bset	21181,#4
1064  0446 2028          	jra	L571
1065  0448               L102:
1066                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
1067  0448 721952bd      	bres	21181,#4
1068  044c 2022          	jra	L571
1069  044e               L771:
1070                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
1071  044e a102          	cp	a,#2
1072  0450 2610          	jrne	L702
1073                     ; 1501     if (NewState != DISABLE)
1074  0452 7b02          	ld	a,(OFST+2,sp)
1075  0454 2706          	jreq	L112
1076                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
1077  0456 721052be      	bset	21182,#0
1079  045a 2014          	jra	L571
1080  045c               L112:
1081                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
1082  045c 721152be      	bres	21182,#0
1083  0460 200e          	jra	L571
1084  0462               L702:
1085                     ; 1513     if (NewState != DISABLE)
1086  0462 7b02          	ld	a,(OFST+2,sp)
1087  0464 2706          	jreq	L712
1088                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
1089  0466 721852be      	bset	21182,#4
1091  046a 2004          	jra	L571
1092  046c               L712:
1093                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
1094  046c 721952be      	bres	21182,#4
1095  0470               L571:
1096                     ; 1522 }
1097  0470 85            	popw	x
1098  0471 81            	ret	
1100                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
1100                     ; 1536 {
1101  0472               _TIM1_CCxNCmd:
1102  0472 89            	pushw	x
1103       00000000      OFST:	set	0
1105                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
1106                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1107                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
1108  0473 9e            	ld	a,xh
1109  0474 4d            	tnz	a
1110  0475 2610          	jrne	L322
1111                     ; 1544     if (NewState != DISABLE)
1112  0477 9f            	ld	a,xl
1113  0478 4d            	tnz	a
1114  0479 2706          	jreq	L522
1115                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
1116  047b 721452bd      	bset	21181,#2
1118  047f 2029          	jra	L132
1119  0481               L522:
1120                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
1121  0481 721552bd      	bres	21181,#2
1122  0485 2023          	jra	L132
1123  0487               L322:
1124                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
1125  0487 7b01          	ld	a,(OFST+1,sp)
1126  0489 4a            	dec	a
1127  048a 2610          	jrne	L332
1128                     ; 1556     if (NewState != DISABLE)
1129  048c 7b02          	ld	a,(OFST+2,sp)
1130  048e 2706          	jreq	L532
1131                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
1132  0490 721c52bd      	bset	21181,#6
1134  0494 2014          	jra	L132
1135  0496               L532:
1136                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
1137  0496 721d52bd      	bres	21181,#6
1138  049a 200e          	jra	L132
1139  049c               L332:
1140                     ; 1568     if (NewState != DISABLE)
1141  049c 7b02          	ld	a,(OFST+2,sp)
1142  049e 2706          	jreq	L342
1143                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
1144  04a0 721452be      	bset	21182,#2
1146  04a4 2004          	jra	L132
1147  04a6               L342:
1148                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
1149  04a6 721552be      	bres	21182,#2
1150  04aa               L132:
1151                     ; 1577 }
1152  04aa 85            	popw	x
1153  04ab 81            	ret	
1155                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1155                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1155                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1155                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1155                     ; 1668                  uint8_t TIM1_ICFilter)
1155                     ; 1669 {
1156  04ac               _TIM1_ICInit:
1157  04ac 89            	pushw	x
1158       00000000      OFST:	set	0
1160                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
1161                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1162                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
1163                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
1164                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
1165                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
1166  04ad 9e            	ld	a,xh
1167  04ae 4d            	tnz	a
1168  04af 2614          	jrne	L742
1169                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1170  04b1 7b07          	ld	a,(OFST+7,sp)
1171  04b3 88            	push	a
1172  04b4 7b06          	ld	a,(OFST+6,sp)
1173  04b6 97            	ld	xl,a
1174  04b7 7b03          	ld	a,(OFST+3,sp)
1175  04b9 95            	ld	xh,a
1176  04ba cd0792        	call	L3_TI1_Config
1178  04bd 84            	pop	a
1179                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1180  04be 7b06          	ld	a,(OFST+6,sp)
1181  04c0 cd05e6        	call	_TIM1_SetIC1Prescaler
1184  04c3 2044          	jra	L152
1185  04c5               L742:
1186                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
1187  04c5 7b01          	ld	a,(OFST+1,sp)
1188  04c7 a101          	cp	a,#1
1189  04c9 2614          	jrne	L352
1190                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1191  04cb 7b07          	ld	a,(OFST+7,sp)
1192  04cd 88            	push	a
1193  04ce 7b06          	ld	a,(OFST+6,sp)
1194  04d0 97            	ld	xl,a
1195  04d1 7b03          	ld	a,(OFST+3,sp)
1196  04d3 95            	ld	xh,a
1197  04d4 cd07c2        	call	L5_TI2_Config
1199  04d7 84            	pop	a
1200                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1201  04d8 7b06          	ld	a,(OFST+6,sp)
1202  04da cd05f3        	call	_TIM1_SetIC2Prescaler
1205  04dd 202a          	jra	L152
1206  04df               L352:
1207                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
1208  04df a102          	cp	a,#2
1209  04e1 2614          	jrne	L752
1210                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1211  04e3 7b07          	ld	a,(OFST+7,sp)
1212  04e5 88            	push	a
1213  04e6 7b06          	ld	a,(OFST+6,sp)
1214  04e8 97            	ld	xl,a
1215  04e9 7b03          	ld	a,(OFST+3,sp)
1216  04eb 95            	ld	xh,a
1217  04ec cd07f2        	call	L7_TI3_Config
1219  04ef 84            	pop	a
1220                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1221  04f0 7b06          	ld	a,(OFST+6,sp)
1222  04f2 cd0600        	call	_TIM1_SetIC3Prescaler
1225  04f5 2012          	jra	L152
1226  04f7               L752:
1227                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1228  04f7 7b07          	ld	a,(OFST+7,sp)
1229  04f9 88            	push	a
1230  04fa 7b06          	ld	a,(OFST+6,sp)
1231  04fc 97            	ld	xl,a
1232  04fd 7b03          	ld	a,(OFST+3,sp)
1233  04ff 95            	ld	xh,a
1234  0500 cd0822        	call	L11_TI4_Config
1236  0503 84            	pop	a
1237                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1238  0504 7b06          	ld	a,(OFST+6,sp)
1239  0506 cd060d        	call	_TIM1_SetIC4Prescaler
1241  0509               L152:
1242                     ; 1706 }
1243  0509 85            	popw	x
1244  050a 81            	ret	
1246                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1246                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1246                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1246                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1246                     ; 1737                      uint8_t TIM1_ICFilter)
1246                     ; 1738 {
1247  050b               _TIM1_PWMIConfig:
1248  050b 89            	pushw	x
1249  050c 89            	pushw	x
1250       00000002      OFST:	set	2
1252                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
1253                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
1254                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
1255                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1256                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
1257                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
1258                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
1259  050d 9f            	ld	a,xl
1260  050e 4a            	dec	a
1261  050f 2702          	jreq	L362
1262                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
1263  0511 a601          	ld	a,#1
1265  0513               L362:
1266                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
1267  0513 6b01          	ld	(OFST-1,sp),a
1268                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
1269  0515 7b07          	ld	a,(OFST+5,sp)
1270  0517 4a            	dec	a
1271  0518 2604          	jrne	L762
1272                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
1273  051a a602          	ld	a,#2
1275  051c 2002          	jra	L172
1276  051e               L762:
1277                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
1278  051e a601          	ld	a,#1
1279  0520               L172:
1280  0520 6b02          	ld	(OFST+0,sp),a
1281                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
1282  0522 7b03          	ld	a,(OFST+1,sp)
1283  0524 2626          	jrne	L372
1284                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1285  0526 7b09          	ld	a,(OFST+7,sp)
1286  0528 88            	push	a
1287  0529 7b08          	ld	a,(OFST+6,sp)
1288  052b 97            	ld	xl,a
1289  052c 7b05          	ld	a,(OFST+3,sp)
1290  052e 95            	ld	xh,a
1291  052f cd0792        	call	L3_TI1_Config
1293  0532 84            	pop	a
1294                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1295  0533 7b08          	ld	a,(OFST+6,sp)
1296  0535 cd05e6        	call	_TIM1_SetIC1Prescaler
1298                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1299  0538 7b09          	ld	a,(OFST+7,sp)
1300  053a 88            	push	a
1301  053b 7b03          	ld	a,(OFST+1,sp)
1302  053d 97            	ld	xl,a
1303  053e 7b02          	ld	a,(OFST+0,sp)
1304  0540 95            	ld	xh,a
1305  0541 cd07c2        	call	L5_TI2_Config
1307  0544 84            	pop	a
1308                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1309  0545 7b08          	ld	a,(OFST+6,sp)
1310  0547 cd05f3        	call	_TIM1_SetIC2Prescaler
1313  054a 2023          	jra	L572
1314  054c               L372:
1315                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1316  054c 7b09          	ld	a,(OFST+7,sp)
1317  054e 88            	push	a
1318  054f 7b08          	ld	a,(OFST+6,sp)
1319  0551 97            	ld	xl,a
1320  0552 7b05          	ld	a,(OFST+3,sp)
1321  0554 95            	ld	xh,a
1322  0555 cd07c2        	call	L5_TI2_Config
1324  0558 84            	pop	a
1325                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1326  0559 7b08          	ld	a,(OFST+6,sp)
1327  055b cd05f3        	call	_TIM1_SetIC2Prescaler
1329                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1330  055e 7b09          	ld	a,(OFST+7,sp)
1331  0560 88            	push	a
1332  0561 7b03          	ld	a,(OFST+1,sp)
1333  0563 97            	ld	xl,a
1334  0564 7b02          	ld	a,(OFST+0,sp)
1335  0566 95            	ld	xh,a
1336  0567 cd0792        	call	L3_TI1_Config
1338  056a 84            	pop	a
1339                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1340  056b 7b08          	ld	a,(OFST+6,sp)
1341  056d ad77          	call	_TIM1_SetIC1Prescaler
1343  056f               L572:
1344                     ; 1796 }
1345  056f 5b04          	addw	sp,#4
1346  0571 81            	ret	
1348                     ; 1803 uint16_t TIM1_GetCapture1(void)
1348                     ; 1804 {
1349  0572               _TIM1_GetCapture1:
1350  0572 5204          	subw	sp,#4
1351       00000004      OFST:	set	4
1353                     ; 1807   uint16_t tmpccr1 = 0;
1354                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
1356                     ; 1810   tmpccr1h = TIM1->CCR1H;
1357  0574 c652c6        	ld	a,21190
1358  0577 6b02          	ld	(OFST-2,sp),a
1359                     ; 1811   tmpccr1l = TIM1->CCR1L;
1360  0579 c652c7        	ld	a,21191
1361  057c 6b01          	ld	(OFST-3,sp),a
1362                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
1363  057e 5f            	clrw	x
1364  057f 97            	ld	xl,a
1365  0580 1f03          	ldw	(OFST-1,sp),x
1366                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
1367  0582 5f            	clrw	x
1368  0583 7b02          	ld	a,(OFST-2,sp)
1369  0585 97            	ld	xl,a
1370  0586 7b04          	ld	a,(OFST+0,sp)
1371  0588 01            	rrwa	x,a
1372  0589 1a03          	or	a,(OFST-1,sp)
1373  058b 01            	rrwa	x,a
1374                     ; 1816   return (uint16_t)tmpccr1;
1376  058c 5b04          	addw	sp,#4
1377  058e 81            	ret	
1379                     ; 1824 uint16_t TIM1_GetCapture2(void)
1379                     ; 1825 {
1380  058f               _TIM1_GetCapture2:
1381  058f 5204          	subw	sp,#4
1382       00000004      OFST:	set	4
1384                     ; 1828   uint16_t tmpccr2 = 0;
1385                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
1387                     ; 1831   tmpccr2h = TIM1->CCR2H;
1388  0591 c652c8        	ld	a,21192
1389  0594 6b02          	ld	(OFST-2,sp),a
1390                     ; 1832   tmpccr2l = TIM1->CCR2L;
1391  0596 c652c9        	ld	a,21193
1392  0599 6b01          	ld	(OFST-3,sp),a
1393                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
1394  059b 5f            	clrw	x
1395  059c 97            	ld	xl,a
1396  059d 1f03          	ldw	(OFST-1,sp),x
1397                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
1398  059f 5f            	clrw	x
1399  05a0 7b02          	ld	a,(OFST-2,sp)
1400  05a2 97            	ld	xl,a
1401  05a3 7b04          	ld	a,(OFST+0,sp)
1402  05a5 01            	rrwa	x,a
1403  05a6 1a03          	or	a,(OFST-1,sp)
1404  05a8 01            	rrwa	x,a
1405                     ; 1837   return (uint16_t)tmpccr2;
1407  05a9 5b04          	addw	sp,#4
1408  05ab 81            	ret	
1410                     ; 1845 uint16_t TIM1_GetCapture3(void)
1410                     ; 1846 {
1411  05ac               _TIM1_GetCapture3:
1412  05ac 5204          	subw	sp,#4
1413       00000004      OFST:	set	4
1415                     ; 1848   uint16_t tmpccr3 = 0;
1416                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
1418                     ; 1851   tmpccr3h = TIM1->CCR3H;
1419  05ae c652ca        	ld	a,21194
1420  05b1 6b02          	ld	(OFST-2,sp),a
1421                     ; 1852   tmpccr3l = TIM1->CCR3L;
1422  05b3 c652cb        	ld	a,21195
1423  05b6 6b01          	ld	(OFST-3,sp),a
1424                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
1425  05b8 5f            	clrw	x
1426  05b9 97            	ld	xl,a
1427  05ba 1f03          	ldw	(OFST-1,sp),x
1428                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
1429  05bc 5f            	clrw	x
1430  05bd 7b02          	ld	a,(OFST-2,sp)
1431  05bf 97            	ld	xl,a
1432  05c0 7b04          	ld	a,(OFST+0,sp)
1433  05c2 01            	rrwa	x,a
1434  05c3 1a03          	or	a,(OFST-1,sp)
1435  05c5 01            	rrwa	x,a
1436                     ; 1857   return (uint16_t)tmpccr3;
1438  05c6 5b04          	addw	sp,#4
1439  05c8 81            	ret	
1441                     ; 1865 uint16_t TIM1_GetCapture4(void)
1441                     ; 1866 {
1442  05c9               _TIM1_GetCapture4:
1443  05c9 5204          	subw	sp,#4
1444       00000004      OFST:	set	4
1446                     ; 1868   uint16_t tmpccr4 = 0;
1447                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
1449                     ; 1871   tmpccr4h = TIM1->CCR4H;
1450  05cb c652cc        	ld	a,21196
1451  05ce 6b02          	ld	(OFST-2,sp),a
1452                     ; 1872   tmpccr4l = TIM1->CCR4L;
1453  05d0 c652cd        	ld	a,21197
1454  05d3 6b01          	ld	(OFST-3,sp),a
1455                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
1456  05d5 5f            	clrw	x
1457  05d6 97            	ld	xl,a
1458  05d7 1f03          	ldw	(OFST-1,sp),x
1459                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
1460  05d9 5f            	clrw	x
1461  05da 7b02          	ld	a,(OFST-2,sp)
1462  05dc 97            	ld	xl,a
1463  05dd 7b04          	ld	a,(OFST+0,sp)
1464  05df 01            	rrwa	x,a
1465  05e0 1a03          	or	a,(OFST-1,sp)
1466  05e2 01            	rrwa	x,a
1467                     ; 1877   return (uint16_t)tmpccr4;
1469  05e3 5b04          	addw	sp,#4
1470  05e5 81            	ret	
1472                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
1472                     ; 1891 {
1473  05e6               _TIM1_SetIC1Prescaler:
1474  05e6 88            	push	a
1475       00000000      OFST:	set	0
1477                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
1478                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
1479  05e7 c652b9        	ld	a,21177
1480  05ea a4f3          	and	a,#243
1481  05ec 1a01          	or	a,(OFST+1,sp)
1482  05ee c752b9        	ld	21177,a
1483                     ; 1897 }
1484  05f1 84            	pop	a
1485  05f2 81            	ret	
1487                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
1487                     ; 1910 {
1488  05f3               _TIM1_SetIC2Prescaler:
1489  05f3 88            	push	a
1490       00000000      OFST:	set	0
1492                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
1493                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
1494  05f4 c652ba        	ld	a,21178
1495  05f7 a4f3          	and	a,#243
1496  05f9 1a01          	or	a,(OFST+1,sp)
1497  05fb c752ba        	ld	21178,a
1498                     ; 1916 }
1499  05fe 84            	pop	a
1500  05ff 81            	ret	
1502                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
1502                     ; 1929 {
1503  0600               _TIM1_SetIC3Prescaler:
1504  0600 88            	push	a
1505       00000000      OFST:	set	0
1507                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
1508                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
1509  0601 c652bb        	ld	a,21179
1510  0604 a4f3          	and	a,#243
1511  0606 1a01          	or	a,(OFST+1,sp)
1512  0608 c752bb        	ld	21179,a
1513                     ; 1936 }
1514  060b 84            	pop	a
1515  060c 81            	ret	
1517                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
1517                     ; 1949 {
1518  060d               _TIM1_SetIC4Prescaler:
1519  060d 88            	push	a
1520       00000000      OFST:	set	0
1522                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
1523                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
1524  060e c652bc        	ld	a,21180
1525  0611 a4f3          	and	a,#243
1526  0613 1a01          	or	a,(OFST+1,sp)
1527  0615 c752bc        	ld	21180,a
1528                     ; 1956 }
1529  0618 84            	pop	a
1530  0619 81            	ret	
1532                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
1532                     ; 1992 {
1533  061a               _TIM1_ITConfig:
1534  061a 89            	pushw	x
1535       00000000      OFST:	set	0
1537                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
1538                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
1539                     ; 1997   if (NewState != DISABLE)
1540  061b 9f            	ld	a,xl
1541  061c 4d            	tnz	a
1542  061d 2706          	jreq	L772
1543                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
1544  061f 9e            	ld	a,xh
1545  0620 ca52b5        	or	a,21173
1547  0623 2006          	jra	L103
1548  0625               L772:
1549                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
1550  0625 7b01          	ld	a,(OFST+1,sp)
1551  0627 43            	cpl	a
1552  0628 c452b5        	and	a,21173
1553  062b               L103:
1554  062b c752b5        	ld	21173,a
1555                     ; 2007 }
1556  062e 85            	popw	x
1557  062f 81            	ret	
1559                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
1559                     ; 2024 {
1560  0630               _TIM1_GenerateEvent:
1562                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
1563                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
1564  0630 c752b8        	ld	21176,a
1565                     ; 2030 }
1566  0633 81            	ret	
1568                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
1568                     ; 2050 {
1569  0634               _TIM1_GetFlagStatus:
1570  0634 89            	pushw	x
1571  0635 89            	pushw	x
1572       00000002      OFST:	set	2
1574                     ; 2051   FlagStatus bitstatus = RESET;
1575                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
1577                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
1578                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
1579  0636 9f            	ld	a,xl
1580  0637 c452b6        	and	a,21174
1581  063a 6b01          	ld	(OFST-1,sp),a
1582                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
1583  063c c652b7        	ld	a,21175
1584  063f 1403          	and	a,(OFST+1,sp)
1585  0641 6b02          	ld	(OFST+0,sp),a
1586                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
1587  0643 1a01          	or	a,(OFST-1,sp)
1588  0645 2702          	jreq	L303
1589                     ; 2062     bitstatus = SET;
1590  0647 a601          	ld	a,#1
1592  0649               L303:
1593                     ; 2066     bitstatus = RESET;
1594                     ; 2068   return (FlagStatus)(bitstatus);
1596  0649 5b04          	addw	sp,#4
1597  064b 81            	ret	
1599                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
1599                     ; 2090 {
1600  064c               _TIM1_ClearFlag:
1601  064c 89            	pushw	x
1602       00000000      OFST:	set	0
1604                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
1605                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
1606  064d 9f            	ld	a,xl
1607  064e 43            	cpl	a
1608  064f c752b6        	ld	21174,a
1609                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
1610  0652 7b01          	ld	a,(OFST+1,sp)
1611  0654 43            	cpl	a
1612  0655 a41e          	and	a,#30
1613  0657 c752b7        	ld	21175,a
1614                     ; 2097 }
1615  065a 85            	popw	x
1616  065b 81            	ret	
1618                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
1618                     ; 2115 {
1619  065c               _TIM1_GetITStatus:
1620  065c 88            	push	a
1621  065d 89            	pushw	x
1622       00000002      OFST:	set	2
1624                     ; 2116   ITStatus bitstatus = RESET;
1625                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
1627                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
1628                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
1629  065e c452b6        	and	a,21174
1630  0661 6b01          	ld	(OFST-1,sp),a
1631                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
1632  0663 c652b5        	ld	a,21173
1633  0666 1403          	and	a,(OFST+1,sp)
1634  0668 6b02          	ld	(OFST+0,sp),a
1635                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
1636  066a 7b01          	ld	a,(OFST-1,sp)
1637  066c 2708          	jreq	L703
1639  066e 7b02          	ld	a,(OFST+0,sp)
1640  0670 2704          	jreq	L703
1641                     ; 2129     bitstatus = SET;
1642  0672 a601          	ld	a,#1
1644  0674 2001          	jra	L113
1645  0676               L703:
1646                     ; 2133     bitstatus = RESET;
1647  0676 4f            	clr	a
1648  0677               L113:
1649                     ; 2135   return (ITStatus)(bitstatus);
1651  0677 5b03          	addw	sp,#3
1652  0679 81            	ret	
1654                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
1654                     ; 2153 {
1655  067a               _TIM1_ClearITPendingBit:
1657                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
1658                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
1659  067a 43            	cpl	a
1660  067b c752b6        	ld	21174,a
1661                     ; 2159 }
1662  067e 81            	ret	
1664                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
1664                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
1664                     ; 2169 {
1665  067f               _TIM1_DMAConfig:
1667                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
1668                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
1669                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
1670  067f 9e            	ld	a,xh
1671  0680 c752d1        	ld	21201,a
1672                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
1673  0683 9f            	ld	a,xl
1674  0684 c752d2        	ld	21202,a
1675                     ; 2177 }
1676  0687 81            	ret	
1678                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
1678                     ; 2190 {
1679  0688               _TIM1_DMACmd:
1680  0688 89            	pushw	x
1681       00000000      OFST:	set	0
1683                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
1684                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
1685                     ; 2195   if (NewState != DISABLE)
1686  0689 9f            	ld	a,xl
1687  068a 4d            	tnz	a
1688  068b 2706          	jreq	L313
1689                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
1690  068d 9e            	ld	a,xh
1691  068e ca52b4        	or	a,21172
1693  0691 2006          	jra	L513
1694  0693               L313:
1695                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
1696  0693 7b01          	ld	a,(OFST+1,sp)
1697  0695 43            	cpl	a
1698  0696 c452b4        	and	a,21172
1699  0699               L513:
1700  0699 c752b4        	ld	21172,a
1701                     ; 2205 }
1702  069c 85            	popw	x
1703  069d 81            	ret	
1705                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
1705                     ; 2214 {
1706  069e               _TIM1_SelectCCDMA:
1708                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
1709                     ; 2218   if (NewState != DISABLE)
1710  069e 4d            	tnz	a
1711  069f 2705          	jreq	L713
1712                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
1713  06a1 721652b1      	bset	21169,#3
1715  06a5 81            	ret	
1716  06a6               L713:
1717                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
1718  06a6 721752b1      	bres	21169,#3
1719                     ; 2228 }
1720  06aa 81            	ret	
1722                     ; 2251 void TIM1_InternalClockConfig(void)
1722                     ; 2252 {
1723  06ab               _TIM1_InternalClockConfig:
1725                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
1726  06ab c652b2        	ld	a,21170
1727  06ae a4f8          	and	a,#248
1728  06b0 c752b2        	ld	21170,a
1729                     ; 2255 }
1730  06b3 81            	ret	
1732                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
1732                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1732                     ; 2274                                  uint8_t ICFilter)
1732                     ; 2275 {
1733  06b4               _TIM1_TIxExternalClockConfig:
1734  06b4 89            	pushw	x
1735       00000000      OFST:	set	0
1737                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
1738                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1739                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
1740                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
1741  06b5 9e            	ld	a,xh
1742  06b6 a160          	cp	a,#96
1743  06b8 260d          	jrne	L323
1744                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
1745  06ba 7b05          	ld	a,(OFST+5,sp)
1746  06bc 88            	push	a
1747  06bd 9f            	ld	a,xl
1748  06be ae0001        	ldw	x,#1
1749  06c1 95            	ld	xh,a
1750  06c2 cd07c2        	call	L5_TI2_Config
1753  06c5 200c          	jra	L523
1754  06c7               L323:
1755                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
1756  06c7 7b05          	ld	a,(OFST+5,sp)
1757  06c9 88            	push	a
1758  06ca 7b03          	ld	a,(OFST+3,sp)
1759  06cc ae0001        	ldw	x,#1
1760  06cf 95            	ld	xh,a
1761  06d0 cd0792        	call	L3_TI1_Config
1763  06d3               L523:
1764  06d3 84            	pop	a
1765                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
1766  06d4 7b01          	ld	a,(OFST+1,sp)
1767  06d6 ad2e          	call	_TIM1_SelectInputTrigger
1769                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
1770  06d8 c652b2        	ld	a,21170
1771  06db aa07          	or	a,#7
1772  06dd c752b2        	ld	21170,a
1773                     ; 2296 }
1774  06e0 85            	popw	x
1775  06e1 81            	ret	
1777                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1777                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1777                     ; 2316                               uint8_t ExtTRGFilter)
1777                     ; 2317 {
1778  06e2               _TIM1_ETRClockMode1Config:
1779  06e2 89            	pushw	x
1780       00000000      OFST:	set	0
1782                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
1783                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
1784                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
1785                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
1786  06e3 7b05          	ld	a,(OFST+5,sp)
1787  06e5 88            	push	a
1788  06e6 7b02          	ld	a,(OFST+2,sp)
1789  06e8 95            	ld	xh,a
1790  06e9 ad4f          	call	_TIM1_ETRConfig
1792  06eb 84            	pop	a
1793                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
1793                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
1794  06ec c652b2        	ld	a,21170
1795  06ef aa77          	or	a,#119
1796  06f1 c752b2        	ld	21170,a
1797                     ; 2329 }
1798  06f4 85            	popw	x
1799  06f5 81            	ret	
1801                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1801                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1801                     ; 2349                               uint8_t ExtTRGFilter)
1801                     ; 2350 {
1802  06f6               _TIM1_ETRClockMode2Config:
1803  06f6 89            	pushw	x
1804       00000000      OFST:	set	0
1806                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
1807                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
1808                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
1809  06f7 7b05          	ld	a,(OFST+5,sp)
1810  06f9 88            	push	a
1811  06fa 7b02          	ld	a,(OFST+2,sp)
1812  06fc 95            	ld	xh,a
1813  06fd ad3b          	call	_TIM1_ETRConfig
1815  06ff 721c52b3      	bset	21171,#6
1816                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
1817                     ; 2360 }
1818  0703 5b03          	addw	sp,#3
1819  0705 81            	ret	
1821                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
1821                     ; 2411 {
1822  0706               _TIM1_SelectInputTrigger:
1823  0706 88            	push	a
1824       00000000      OFST:	set	0
1826                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
1827                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
1828  0707 c652b2        	ld	a,21170
1829  070a a48f          	and	a,#143
1830  070c 1a01          	or	a,(OFST+1,sp)
1831  070e c752b2        	ld	21170,a
1832                     ; 2417 }
1833  0711 84            	pop	a
1834  0712 81            	ret	
1836                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
1836                     ; 2434 {
1837  0713               _TIM1_SelectOutputTrigger:
1838  0713 88            	push	a
1839       00000000      OFST:	set	0
1841                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
1842                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
1843  0714 c652b1        	ld	a,21169
1844  0717 a48f          	and	a,#143
1845  0719 1a01          	or	a,(OFST+1,sp)
1846  071b c752b1        	ld	21169,a
1847                     ; 2439 }
1848  071e 84            	pop	a
1849  071f 81            	ret	
1851                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
1851                     ; 2452 {
1852  0720               _TIM1_SelectSlaveMode:
1853  0720 88            	push	a
1854       00000000      OFST:	set	0
1856                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
1857                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
1858  0721 c652b2        	ld	a,21170
1859  0724 a4f8          	and	a,#248
1860  0726 1a01          	or	a,(OFST+1,sp)
1861  0728 c752b2        	ld	21170,a
1862                     ; 2459 }
1863  072b 84            	pop	a
1864  072c 81            	ret	
1866                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
1866                     ; 2468 {
1867  072d               _TIM1_SelectMasterSlaveMode:
1869                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
1870                     ; 2473   if (NewState != DISABLE)
1871  072d 4d            	tnz	a
1872  072e 2705          	jreq	L723
1873                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
1874  0730 721e52b2      	bset	21170,#7
1876  0734 81            	ret	
1877  0735               L723:
1878                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
1879  0735 721f52b2      	bres	21170,#7
1880                     ; 2481 }
1881  0739 81            	ret	
1883                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1883                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1883                     ; 2501                     uint8_t ExtTRGFilter)
1883                     ; 2502 {
1884  073a               _TIM1_ETRConfig:
1885  073a 89            	pushw	x
1886       00000000      OFST:	set	0
1888                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
1889                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
1889                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
1889                     ; 2508                          | (uint8_t) ExtTRGFilter);
1890  073b 9f            	ld	a,xl
1891  073c 1a01          	or	a,(OFST+1,sp)
1892  073e 1a05          	or	a,(OFST+5,sp)
1893  0740 ca52b3        	or	a,21171
1894  0743 c752b3        	ld	21171,a
1895                     ; 2509 }
1896  0746 85            	popw	x
1897  0747 81            	ret	
1899                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
1899                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
1899                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
1899                     ; 2550 {
1900  0748               _TIM1_EncoderInterfaceConfig:
1901  0748 89            	pushw	x
1902       00000000      OFST:	set	0
1904                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
1905                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
1906                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
1907                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
1908  0749 9f            	ld	a,xl
1909  074a 4d            	tnz	a
1910  074b 2706          	jreq	L333
1911                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
1912  074d 721252bd      	bset	21181,#1
1914  0751 2004          	jra	L533
1915  0753               L333:
1916                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
1917  0753 721352bd      	bres	21181,#1
1918  0757               L533:
1919                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
1920  0757 7b05          	ld	a,(OFST+5,sp)
1921  0759 2706          	jreq	L733
1922                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
1923  075b 721a52bd      	bset	21181,#5
1925  075f 2004          	jra	L143
1926  0761               L733:
1927                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
1928  0761 721b52bd      	bres	21181,#5
1929  0765               L143:
1930                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
1931  0765 c652b2        	ld	a,21170
1932  0768 a4f0          	and	a,#240
1933  076a 1a01          	or	a,(OFST+1,sp)
1934  076c c752b2        	ld	21170,a
1935                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
1936  076f c652b9        	ld	a,21177
1937  0772 a4fc          	and	a,#252
1938  0774 aa01          	or	a,#1
1939  0776 c752b9        	ld	21177,a
1940                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
1941  0779 c652ba        	ld	a,21178
1942  077c a4fc          	and	a,#252
1943  077e aa01          	or	a,#1
1944  0780 c752ba        	ld	21178,a
1945                     ; 2581 }
1946  0783 85            	popw	x
1947  0784 81            	ret	
1949                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
1949                     ; 2590 {
1950  0785               _TIM1_SelectHallSensor:
1952                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
1953                     ; 2595   if (NewState != DISABLE)
1954  0785 4d            	tnz	a
1955  0786 2705          	jreq	L343
1956                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
1957  0788 721e52b1      	bset	21169,#7
1959  078c 81            	ret	
1960  078d               L343:
1961                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
1962  078d 721f52b1      	bres	21169,#7
1963                     ; 2603 }
1964  0791 81            	ret	
1966                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
1966                     ; 2624 {
1967  0792               L3_TI1_Config:
1968  0792 89            	pushw	x
1969  0793 88            	push	a
1970       00000001      OFST:	set	1
1972                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
1973  0794 721152bd      	bres	21181,#0
1974                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
1974                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
1975  0798 7b06          	ld	a,(OFST+5,sp)
1976  079a 97            	ld	xl,a
1977  079b a610          	ld	a,#16
1978  079d 42            	mul	x,a
1979  079e 9f            	ld	a,xl
1980  079f 1a03          	or	a,(OFST+2,sp)
1981  07a1 6b01          	ld	(OFST+0,sp),a
1982  07a3 c652b9        	ld	a,21177
1983  07a6 a40c          	and	a,#12
1984  07a8 1a01          	or	a,(OFST+0,sp)
1985  07aa c752b9        	ld	21177,a
1986                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
1987  07ad 7b02          	ld	a,(OFST+1,sp)
1988  07af 2706          	jreq	L743
1989                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
1990  07b1 721252bd      	bset	21181,#1
1992  07b5 2004          	jra	L153
1993  07b7               L743:
1994                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
1995  07b7 721352bd      	bres	21181,#1
1996  07bb               L153:
1997                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
1998  07bb 721052bd      	bset	21181,#0
1999                     ; 2647 }
2000  07bf 5b03          	addw	sp,#3
2001  07c1 81            	ret	
2003                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
2003                     ; 2664 {
2004  07c2               L5_TI2_Config:
2005  07c2 89            	pushw	x
2006  07c3 88            	push	a
2007       00000001      OFST:	set	1
2009                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
2010  07c4 721952bd      	bres	21181,#4
2011                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
2011                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2012  07c8 7b06          	ld	a,(OFST+5,sp)
2013  07ca 97            	ld	xl,a
2014  07cb a610          	ld	a,#16
2015  07cd 42            	mul	x,a
2016  07ce 9f            	ld	a,xl
2017  07cf 1a03          	or	a,(OFST+2,sp)
2018  07d1 6b01          	ld	(OFST+0,sp),a
2019  07d3 c652ba        	ld	a,21178
2020  07d6 a40c          	and	a,#12
2021  07d8 1a01          	or	a,(OFST+0,sp)
2022  07da c752ba        	ld	21178,a
2023                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
2024  07dd 7b02          	ld	a,(OFST+1,sp)
2025  07df 2706          	jreq	L353
2026                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
2027  07e1 721a52bd      	bset	21181,#5
2029  07e5 2004          	jra	L553
2030  07e7               L353:
2031                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
2032  07e7 721b52bd      	bres	21181,#5
2033  07eb               L553:
2034                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
2035  07eb 721852bd      	bset	21181,#4
2036                     ; 2682 }
2037  07ef 5b03          	addw	sp,#3
2038  07f1 81            	ret	
2040                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
2040                     ; 2699 {
2041  07f2               L7_TI3_Config:
2042  07f2 89            	pushw	x
2043  07f3 88            	push	a
2044       00000001      OFST:	set	1
2046                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
2047  07f4 721152be      	bres	21182,#0
2048                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
2048                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2049  07f8 7b06          	ld	a,(OFST+5,sp)
2050  07fa 97            	ld	xl,a
2051  07fb a610          	ld	a,#16
2052  07fd 42            	mul	x,a
2053  07fe 9f            	ld	a,xl
2054  07ff 1a03          	or	a,(OFST+2,sp)
2055  0801 6b01          	ld	(OFST+0,sp),a
2056  0803 c652bb        	ld	a,21179
2057  0806 a40c          	and	a,#12
2058  0808 1a01          	or	a,(OFST+0,sp)
2059  080a c752bb        	ld	21179,a
2060                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
2061  080d 7b02          	ld	a,(OFST+1,sp)
2062  080f 2706          	jreq	L753
2063                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
2064  0811 721252be      	bset	21182,#1
2066  0815 2004          	jra	L163
2067  0817               L753:
2068                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
2069  0817 721352be      	bres	21182,#1
2070  081b               L163:
2071                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
2072  081b 721052be      	bset	21182,#0
2073                     ; 2718 }
2074  081f 5b03          	addw	sp,#3
2075  0821 81            	ret	
2077                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
2077                     ; 2734 {
2078  0822               L11_TI4_Config:
2079  0822 89            	pushw	x
2080  0823 88            	push	a
2081       00000001      OFST:	set	1
2083                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
2084  0824 721952be      	bres	21182,#4
2085                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
2085                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2086  0828 7b06          	ld	a,(OFST+5,sp)
2087  082a 97            	ld	xl,a
2088  082b a610          	ld	a,#16
2089  082d 42            	mul	x,a
2090  082e 9f            	ld	a,xl
2091  082f 1a03          	or	a,(OFST+2,sp)
2092  0831 6b01          	ld	(OFST+0,sp),a
2093  0833 c652bc        	ld	a,21180
2094  0836 a40c          	and	a,#12
2095  0838 1a01          	or	a,(OFST+0,sp)
2096  083a c752bc        	ld	21180,a
2097                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
2098  083d 7b02          	ld	a,(OFST+1,sp)
2099  083f 2706          	jreq	L363
2100                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
2101  0841 721a52be      	bset	21182,#5
2103  0845 2004          	jra	L563
2104  0847               L363:
2105                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
2106  0847 721b52be      	bres	21182,#5
2107  084b               L563:
2108                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
2109  084b 721852be      	bset	21182,#4
2110                     ; 2755 }
2111  084f 5b03          	addw	sp,#3
2112  0851 81            	ret	
2114                     	xdef	_TIM1_SelectHallSensor
2115                     	xdef	_TIM1_EncoderInterfaceConfig
2116                     	xdef	_TIM1_ETRConfig
2117                     	xdef	_TIM1_SelectMasterSlaveMode
2118                     	xdef	_TIM1_SelectSlaveMode
2119                     	xdef	_TIM1_SelectOutputTrigger
2120                     	xdef	_TIM1_SelectInputTrigger
2121                     	xdef	_TIM1_ETRClockMode2Config
2122                     	xdef	_TIM1_ETRClockMode1Config
2123                     	xdef	_TIM1_TIxExternalClockConfig
2124                     	xdef	_TIM1_InternalClockConfig
2125                     	xdef	_TIM1_SelectCCDMA
2126                     	xdef	_TIM1_DMACmd
2127                     	xdef	_TIM1_DMAConfig
2128                     	xdef	_TIM1_ClearITPendingBit
2129                     	xdef	_TIM1_GetITStatus
2130                     	xdef	_TIM1_ClearFlag
2131                     	xdef	_TIM1_GetFlagStatus
2132                     	xdef	_TIM1_GenerateEvent
2133                     	xdef	_TIM1_ITConfig
2134                     	xdef	_TIM1_SetIC4Prescaler
2135                     	xdef	_TIM1_SetIC3Prescaler
2136                     	xdef	_TIM1_SetIC2Prescaler
2137                     	xdef	_TIM1_SetIC1Prescaler
2138                     	xdef	_TIM1_GetCapture4
2139                     	xdef	_TIM1_GetCapture3
2140                     	xdef	_TIM1_GetCapture2
2141                     	xdef	_TIM1_GetCapture1
2142                     	xdef	_TIM1_PWMIConfig
2143                     	xdef	_TIM1_ICInit
2144                     	xdef	_TIM1_CCxNCmd
2145                     	xdef	_TIM1_CCxCmd
2146                     	xdef	_TIM1_SelectCOM
2147                     	xdef	_TIM1_SelectOCREFClear
2148                     	xdef	_TIM1_OC3NPolarityConfig
2149                     	xdef	_TIM1_OC3PolarityConfig
2150                     	xdef	_TIM1_OC2NPolarityConfig
2151                     	xdef	_TIM1_OC2PolarityConfig
2152                     	xdef	_TIM1_OC1NPolarityConfig
2153                     	xdef	_TIM1_OC1PolarityConfig
2154                     	xdef	_TIM1_ClearOC4Ref
2155                     	xdef	_TIM1_ClearOC3Ref
2156                     	xdef	_TIM1_ClearOC2Ref
2157                     	xdef	_TIM1_ClearOC1Ref
2158                     	xdef	_TIM1_OC3FastConfig
2159                     	xdef	_TIM1_OC2FastConfig
2160                     	xdef	_TIM1_OC1FastConfig
2161                     	xdef	_TIM1_OC4PreloadConfig
2162                     	xdef	_TIM1_OC3PreloadConfig
2163                     	xdef	_TIM1_OC2PreloadConfig
2164                     	xdef	_TIM1_OC1PreloadConfig
2165                     	xdef	_TIM1_ForcedOC3Config
2166                     	xdef	_TIM1_ForcedOC2Config
2167                     	xdef	_TIM1_ForcedOC1Config
2168                     	xdef	_TIM1_CCPreloadControl
2169                     	xdef	_TIM1_SetCompare4
2170                     	xdef	_TIM1_SetCompare3
2171                     	xdef	_TIM1_SetCompare2
2172                     	xdef	_TIM1_SetCompare1
2173                     	xdef	_TIM1_SelectOCxM
2174                     	xdef	_TIM1_CtrlPWMOutputs
2175                     	xdef	_TIM1_BDTRConfig
2176                     	xdef	_TIM1_OC3Init
2177                     	xdef	_TIM1_OC2Init
2178                     	xdef	_TIM1_OC1Init
2179                     	xdef	_TIM1_Cmd
2180                     	xdef	_TIM1_SelectOnePulseMode
2181                     	xdef	_TIM1_ARRPreloadConfig
2182                     	xdef	_TIM1_UpdateRequestConfig
2183                     	xdef	_TIM1_UpdateDisableConfig
2184                     	xdef	_TIM1_GetPrescaler
2185                     	xdef	_TIM1_GetCounter
2186                     	xdef	_TIM1_SetAutoreload
2187                     	xdef	_TIM1_SetCounter
2188                     	xdef	_TIM1_CounterModeConfig
2189                     	xdef	_TIM1_PrescalerConfig
2190                     	xdef	_TIM1_TimeBaseInit
2191                     	xdef	_TIM1_DeInit
2192                     	end
