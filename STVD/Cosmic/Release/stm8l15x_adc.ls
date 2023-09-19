   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
  17                     ; 136 {
  18                     	scross	off
  19  0000               _ADC_DeInit:
  21                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
  22  0000 7f            	clr	(x)
  23                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
  24  0001 6f01          	clr	(1,x)
  25                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
  26  0003 a61f          	ld	a,#31
  27  0005 e702          	ld	(2,x),a
  28                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
  29  0007 a6ff          	ld	a,#255
  30  0009 e703          	ld	(3,x),a
  31                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
  32  000b a60f          	ld	a,#15
  33  000d e706          	ld	(6,x),a
  34                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
  35  000f a6ff          	ld	a,#255
  36  0011 e707          	ld	(7,x),a
  37                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
  38  0013 6f08          	clr	(8,x)
  39                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
  40  0015 6f09          	clr	(9,x)
  41                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
  42  0017 6f0a          	clr	(10,x)
  43                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
  44  0019 6f0b          	clr	(11,x)
  45                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
  46  001b 6f0c          	clr	(12,x)
  47                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
  48  001d 6f0d          	clr	(13,x)
  49                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
  50  001f 6f0e          	clr	(14,x)
  51                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
  52  0021 6f0f          	clr	(15,x)
  53                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
  54  0023 6f10          	clr	(16,x)
  55                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
  56  0025 6f11          	clr	(17,x)
  57                     ; 164 }
  58  0027 81            	ret	
  60                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
  60                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
  60                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
  60                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
  60                     ; 190 {
  61  0028               _ADC_Init:
  62       fffffffe      OFST: set -2
  64                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
  65                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
  66                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
  67                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
  68  0028 f6            	ld	a,(x)
  69  0029 a49b          	and	a,#155
  70  002b f7            	ld	(x),a
  71                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
  72  002c 7b03          	ld	a,(OFST+5,sp)
  73  002e 1a04          	or	a,(OFST+6,sp)
  74  0030 fa            	or	a,(x)
  75  0031 f7            	ld	(x),a
  76                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
  77  0032 e601          	ld	a,(1,x)
  78  0034 a47f          	and	a,#127
  79  0036 e701          	ld	(1,x),a
  80                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
  81  0038 e601          	ld	a,(1,x)
  82  003a 1a05          	or	a,(OFST+7,sp)
  83  003c e701          	ld	(1,x),a
  84                     ; 207 }
  85  003e 81            	ret	
  87                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
  87                     ; 217              FunctionalState NewState)
  87                     ; 218 {
  88  003f               _ADC_Cmd:
  89       fffffffe      OFST: set -2
  91                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
  92                     ; 222   if (NewState != DISABLE)
  93  003f 7b03          	ld	a,(OFST+5,sp)
  94  0041 2705          	jreq	L3
  95                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
  96  0043 f6            	ld	a,(x)
  97  0044 aa01          	or	a,#1
  99  0046 2003          	jra	L5
 100  0048               L3:
 101                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 102  0048 f6            	ld	a,(x)
 103  0049 a4fe          	and	a,#254
 104  004b               L5:
 105  004b f7            	ld	(x),a
 106                     ; 232 }
 107  004c 81            	ret	
 109                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 109                     ; 240 {
 110  004d               _ADC_SoftwareStartConv:
 112                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 113  004d f6            	ld	a,(x)
 114  004e aa02          	or	a,#2
 115  0050 f7            	ld	(x),a
 116                     ; 243 }
 117  0051 81            	ret	
 119                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 119                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 119                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 119                     ; 264 {
 120  0052               _ADC_ExternalTrigConfig:
 121       fffffffe      OFST: set -2
 123                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 124                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 125                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 126  0052 e601          	ld	a,(1,x)
 127  0054 a487          	and	a,#135
 128  0056 e701          	ld	(1,x),a
 129                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 129                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 130  0058 7b04          	ld	a,(OFST+6,sp)
 131  005a 1a03          	or	a,(OFST+5,sp)
 132  005c ea01          	or	a,(1,x)
 133  005e e701          	ld	(1,x),a
 134                     ; 276 }
 135  0060 81            	ret	
 137                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
 137                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
 137                     ; 341 {
 138  0061               _ADC_AnalogWatchdogChannelSelect:
 139       fffffffe      OFST: set -2
 141                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
 142                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
 143  0061 e602          	ld	a,(2,x)
 144  0063 a4e0          	and	a,#224
 145  0065 e702          	ld	(2,x),a
 146                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
 147  0067 e602          	ld	a,(2,x)
 148  0069 1a03          	or	a,(OFST+5,sp)
 149  006b e702          	ld	(2,x),a
 150                     ; 350 }
 151  006d 81            	ret	
 153                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
 153                     ; 362 {
 154  006e               _ADC_AnalogWatchdogThresholdsConfig:
 155       fffffffe      OFST: set -2
 157                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
 158                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
 159                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
 160  006e 7b03          	ld	a,(OFST+5,sp)
 161  0070 e706          	ld	(6,x),a
 162                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
 163  0072 7b04          	ld	a,(OFST+6,sp)
 164  0074 e707          	ld	(7,x),a
 165                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
 166  0076 7b05          	ld	a,(OFST+7,sp)
 167  0078 e708          	ld	(8,x),a
 168                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
 169  007a 7b06          	ld	a,(OFST+8,sp)
 170  007c e709          	ld	(9,x),a
 171                     ; 374 }
 172  007e 81            	ret	
 174                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
 174                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
 174                     ; 414                               uint16_t HighThreshold,
 174                     ; 415                               uint16_t LowThreshold)
 174                     ; 416 {
 175  007f               _ADC_AnalogWatchdogConfig:
 176       fffffffe      OFST: set -2
 178                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
 179                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
 180                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
 181                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
 182  007f e602          	ld	a,(2,x)
 183  0081 a4e0          	and	a,#224
 184  0083 e702          	ld	(2,x),a
 185                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
 186  0085 e602          	ld	a,(2,x)
 187  0087 1a03          	or	a,(OFST+5,sp)
 188  0089 e702          	ld	(2,x),a
 189                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
 190  008b 7b04          	ld	a,(OFST+6,sp)
 191  008d e706          	ld	(6,x),a
 192                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
 193  008f 7b05          	ld	a,(OFST+7,sp)
 194  0091 e707          	ld	(7,x),a
 195                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
 196  0093 7b06          	ld	a,(OFST+8,sp)
 197  0095 e708          	ld	(8,x),a
 198                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
 199  0097 7b07          	ld	a,(OFST+9,sp)
 200  0099 e709          	ld	(9,x),a
 201                     ; 435 }
 202  009b 81            	ret	
 204                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
 204                     ; 475 {
 205  009c               _ADC_TempSensorCmd:
 207                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
 208                     ; 479   if (NewState != DISABLE)
 209  009c 4d            	tnz	a
 210  009d 2705          	jreq	L7
 211                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
 212  009f 721a534e      	bset	21326,#5
 214  00a3 81            	ret	
 215  00a4               L7:
 216                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
 217  00a4 721b534e      	bres	21326,#5
 218                     ; 489 }
 219  00a8 81            	ret	
 221                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
 221                     ; 498 {
 222  00a9               _ADC_VrefintCmd:
 224                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
 225                     ; 502   if (NewState != DISABLE)
 226  00a9 4d            	tnz	a
 227  00aa 2705          	jreq	L31
 228                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
 229  00ac 7218534e      	bset	21326,#4
 231  00b0 81            	ret	
 232  00b1               L31:
 233                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
 234  00b1 7219534e      	bres	21326,#4
 235                     ; 512 }
 236  00b5 81            	ret	
 238                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
 238                     ; 584 {
 239  00b6               _ADC_ChannelCmd:
 240  00b6 89            	pushw	x
 241  00b7 88            	push	a
 242       00000001      OFST:	set	1
 244                     ; 585   uint8_t regindex = 0;
 245                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
 246                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
 247  00b8 7b06          	ld	a,(OFST+5,sp)
 248  00ba 6b01          	ld	(OFST+0,sp),a
 249                     ; 591   if (NewState != DISABLE)
 250  00bc 0d08          	tnz	(OFST+7,sp)
 251  00be 270d          	jreq	L71
 252                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
 253  00c0 01            	rrwa	x,a
 254  00c1 1b01          	add	a,(OFST+0,sp)
 255  00c3 2401          	jrnc	L03
 256  00c5 5c            	incw	x
 257  00c6               L03:
 258  00c6 02            	rlwa	x,a
 259  00c7 e60a          	ld	a,(10,x)
 260  00c9 1a07          	or	a,(OFST+6,sp)
 262  00cb 200a          	jra	L12
 263  00cd               L71:
 264                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
 265  00cd 5f            	clrw	x
 266  00ce 97            	ld	xl,a
 267  00cf 72fb02        	addw	x,(OFST+1,sp)
 268  00d2 7b07          	ld	a,(OFST+6,sp)
 269  00d4 43            	cpl	a
 270  00d5 e40a          	and	a,(10,x)
 271  00d7               L12:
 272  00d7 e70a          	ld	(10,x),a
 273                     ; 601 }
 274  00d9 5b03          	addw	sp,#3
 275  00db 81            	ret	
 277                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
 277                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
 277                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
 277                     ; 628 {
 278  00dc               _ADC_SamplingTimeConfig:
 279       fffffffe      OFST: set -2
 281                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
 282                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
 283                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
 284  00dc 7b03          	ld	a,(OFST+5,sp)
 285  00de 2711          	jreq	L32
 286                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
 287  00e0 e602          	ld	a,(2,x)
 288  00e2 a41f          	and	a,#31
 289  00e4 e702          	ld	(2,x),a
 290                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
 291  00e6 7b04          	ld	a,(OFST+6,sp)
 292  00e8 4e            	swap	a
 293  00e9 48            	sll	a
 294  00ea a4e0          	and	a,#224
 295  00ec ea02          	or	a,(2,x)
 296  00ee e702          	ld	(2,x),a
 298  00f0 81            	ret	
 299  00f1               L32:
 300                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
 301  00f1 e601          	ld	a,(1,x)
 302  00f3 a4f8          	and	a,#248
 303  00f5 e701          	ld	(1,x),a
 304                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
 305  00f7 e601          	ld	a,(1,x)
 306  00f9 1a04          	or	a,(OFST+6,sp)
 307  00fb e701          	ld	(1,x),a
 308                     ; 645 }
 309  00fd 81            	ret	
 311                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
 311                     ; 692                               FunctionalState NewState)
 311                     ; 693 {
 312  00fe               _ADC_SchmittTriggerConfig:
 313  00fe 89            	pushw	x
 314  00ff 88            	push	a
 315       00000001      OFST:	set	1
 317                     ; 694   uint8_t regindex = 0;
 318                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
 319                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
 320  0100 7b06          	ld	a,(OFST+5,sp)
 321  0102 6b01          	ld	(OFST+0,sp),a
 322                     ; 700   if (NewState != DISABLE)
 323  0104 0d08          	tnz	(OFST+7,sp)
 324  0106 270e          	jreq	L72
 325                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
 326  0108 01            	rrwa	x,a
 327  0109 1b01          	add	a,(OFST+0,sp)
 328  010b 2401          	jrnc	L63
 329  010d 5c            	incw	x
 330  010e               L63:
 331  010e 02            	rlwa	x,a
 332  010f 7b07          	ld	a,(OFST+6,sp)
 333  0111 43            	cpl	a
 334  0112 e40e          	and	a,(14,x)
 336  0114 2009          	jra	L13
 337  0116               L72:
 338                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
 339  0116 5f            	clrw	x
 340  0117 97            	ld	xl,a
 341  0118 72fb02        	addw	x,(OFST+1,sp)
 342  011b e60e          	ld	a,(14,x)
 343  011d 1a07          	or	a,(OFST+6,sp)
 344  011f               L13:
 345  011f e70e          	ld	(14,x),a
 346                     ; 710 }
 347  0121 5b03          	addw	sp,#3
 348  0123 81            	ret	
 350                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
 350                     ; 718 {
 351  0124               _ADC_GetConversionValue:
 352  0124 89            	pushw	x
 353  0125 89            	pushw	x
 354       00000002      OFST:	set	2
 356                     ; 719   uint16_t tmpreg = 0;
 357                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
 358  0126 e604          	ld	a,(4,x)
 359  0128 97            	ld	xl,a
 360                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
 361  0129 1603          	ldw	y,(OFST+1,sp)
 362  012b 90e605        	ld	a,(5,y)
 363  012e 02            	rlwa	x,a
 364                     ; 726   return (uint16_t)(tmpreg) ;
 366  012f 5b04          	addw	sp,#4
 367  0131 81            	ret	
 369                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
 369                     ; 761 {
 370  0132               _ADC_DMACmd:
 371       fffffffe      OFST: set -2
 373                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
 374                     ; 765   if (NewState != DISABLE)
 375  0132 7b03          	ld	a,(OFST+5,sp)
 376  0134 2706          	jreq	L33
 377                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
 378  0136 e60a          	ld	a,(10,x)
 379  0138 a47f          	and	a,#127
 381  013a 2004          	jra	L53
 382  013c               L33:
 383                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
 384  013c e60a          	ld	a,(10,x)
 385  013e aa80          	or	a,#128
 386  0140               L53:
 387  0140 e70a          	ld	(10,x),a
 388                     ; 775 }
 389  0142 81            	ret	
 391                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
 391                     ; 832 {
 392  0143               _ADC_ITConfig:
 393       fffffffe      OFST: set -2
 395                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
 396                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
 397                     ; 837   if (NewState != DISABLE)
 398  0143 7b04          	ld	a,(OFST+6,sp)
 399  0145 2705          	jreq	L73
 400                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
 401  0147 f6            	ld	a,(x)
 402  0148 1a03          	or	a,(OFST+5,sp)
 404  014a 2004          	jra	L14
 405  014c               L73:
 406                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
 407  014c 7b03          	ld	a,(OFST+5,sp)
 408  014e 43            	cpl	a
 409  014f f4            	and	a,(x)
 410  0150               L14:
 411  0150 f7            	ld	(x),a
 412                     ; 847 }
 413  0151 81            	ret	
 415                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
 415                     ; 860 {
 416  0152               _ADC_GetFlagStatus:
 417       fffffffe      OFST: set -2
 419                     ; 861   FlagStatus flagstatus = RESET;
 420                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
 421                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
 422  0152 e603          	ld	a,(3,x)
 423  0154 1503          	bcp	a,(OFST+5,sp)
 424  0156 2703          	jreq	L34
 425                     ; 870     flagstatus = SET;
 426  0158 a601          	ld	a,#1
 428  015a 81            	ret	
 429  015b               L34:
 430                     ; 875     flagstatus = RESET;
 431  015b 4f            	clr	a
 432                     ; 879   return  flagstatus;
 434  015c 81            	ret	
 436                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
 436                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
 436                     ; 894 {
 437  015d               _ADC_ClearFlag:
 438       fffffffe      OFST: set -2
 440                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
 441                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
 442  015d 7b03          	ld	a,(OFST+5,sp)
 443  015f 43            	cpl	a
 444  0160 e703          	ld	(3,x),a
 445                     ; 900 }
 446  0162 81            	ret	
 448                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
 448                     ; 913                          ADC_IT_TypeDef ADC_IT)
 448                     ; 914 {
 449  0163               _ADC_GetITStatus:
 450  0163 89            	pushw	x
 451  0164 5203          	subw	sp,#3
 452       00000003      OFST:	set	3
 454                     ; 915   ITStatus itstatus = RESET;
 455                     ; 916   uint8_t itmask = 0, enablestatus = 0;
 457                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
 458                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
 459  0166 7b08          	ld	a,(OFST+5,sp)
 460  0168 44            	srl	a
 461  0169 44            	srl	a
 462  016a 44            	srl	a
 463  016b 6b03          	ld	(OFST+0,sp),a
 464                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
 464                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
 465  016d a403          	and	a,#3
 466  016f 6b01          	ld	(OFST-2,sp),a
 467  0171 7b03          	ld	a,(OFST+0,sp)
 468  0173 a410          	and	a,#16
 469  0175 44            	srl	a
 470  0176 44            	srl	a
 471  0177 1a01          	or	a,(OFST-2,sp)
 472  0179 6b03          	ld	(OFST+0,sp),a
 473                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
 474  017b f6            	ld	a,(x)
 475  017c 1408          	and	a,(OFST+5,sp)
 476  017e 6b02          	ld	(OFST-1,sp),a
 477                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
 478  0180 e603          	ld	a,(3,x)
 479  0182 1503          	bcp	a,(OFST+0,sp)
 480  0184 2708          	jreq	L74
 482  0186 7b02          	ld	a,(OFST-1,sp)
 483  0188 2704          	jreq	L74
 484                     ; 933     itstatus = SET;
 485  018a a601          	ld	a,#1
 487  018c 2001          	jra	L15
 488  018e               L74:
 489                     ; 938     itstatus = RESET;
 490  018e 4f            	clr	a
 491  018f               L15:
 492                     ; 942   return  itstatus;
 494  018f 5b05          	addw	sp,#5
 495  0191 81            	ret	
 497                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
 497                     ; 956                            ADC_IT_TypeDef ADC_IT)
 497                     ; 957 {
 498  0192               _ADC_ClearITPendingBit:
 499  0192 89            	pushw	x
 500  0193 89            	pushw	x
 501       00000002      OFST:	set	2
 503                     ; 958   uint8_t itmask = 0;
 504                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
 505                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
 506  0194 7b07          	ld	a,(OFST+5,sp)
 507  0196 44            	srl	a
 508  0197 44            	srl	a
 509  0198 44            	srl	a
 510  0199 6b02          	ld	(OFST+0,sp),a
 511                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
 511                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
 512  019b a403          	and	a,#3
 513  019d 6b01          	ld	(OFST-1,sp),a
 514  019f 7b02          	ld	a,(OFST+0,sp)
 515  01a1 a410          	and	a,#16
 516  01a3 44            	srl	a
 517  01a4 44            	srl	a
 518  01a5 1a01          	or	a,(OFST-1,sp)
 519  01a7 6b02          	ld	(OFST+0,sp),a
 520                     ; 969   ADCx->SR = (uint8_t)~itmask;
 521  01a9 43            	cpl	a
 522  01aa 1e03          	ldw	x,(OFST+1,sp)
 523  01ac e703          	ld	(3,x),a
 524                     ; 970 }
 525  01ae 5b04          	addw	sp,#4
 526  01b0 81            	ret	
 528                     	xdef	_ADC_ClearITPendingBit
 529                     	xdef	_ADC_GetITStatus
 530                     	xdef	_ADC_ClearFlag
 531                     	xdef	_ADC_GetFlagStatus
 532                     	xdef	_ADC_ITConfig
 533                     	xdef	_ADC_DMACmd
 534                     	xdef	_ADC_GetConversionValue
 535                     	xdef	_ADC_SchmittTriggerConfig
 536                     	xdef	_ADC_SamplingTimeConfig
 537                     	xdef	_ADC_ChannelCmd
 538                     	xdef	_ADC_VrefintCmd
 539                     	xdef	_ADC_TempSensorCmd
 540                     	xdef	_ADC_AnalogWatchdogConfig
 541                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
 542                     	xdef	_ADC_AnalogWatchdogChannelSelect
 543                     	xdef	_ADC_ExternalTrigConfig
 544                     	xdef	_ADC_SoftwareStartConv
 545                     	xdef	_ADC_Cmd
 546                     	xdef	_ADC_Init
 547                     	xdef	_ADC_DeInit
 548                     	end
