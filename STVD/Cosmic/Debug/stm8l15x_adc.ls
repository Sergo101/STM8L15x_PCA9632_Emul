   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
 181                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 181                     ; 136 {
 183                     .text:	section	.text,new
 184  0000               _ADC_DeInit:
 188                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 190  0000 7f            	clr	(x)
 191                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 193  0001 6f01          	clr	(1,x)
 194                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 196  0003 a61f          	ld	a,#31
 197  0005 e702          	ld	(2,x),a
 198                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 200  0007 a6ff          	ld	a,#255
 201  0009 e703          	ld	(3,x),a
 202                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 204  000b a60f          	ld	a,#15
 205  000d e706          	ld	(6,x),a
 206                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 208  000f a6ff          	ld	a,#255
 209  0011 e707          	ld	(7,x),a
 210                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 212  0013 6f08          	clr	(8,x)
 213                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 215  0015 6f09          	clr	(9,x)
 216                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 218  0017 6f0a          	clr	(10,x)
 219                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 221  0019 6f0b          	clr	(11,x)
 222                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 224  001b 6f0c          	clr	(12,x)
 225                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 227  001d 6f0d          	clr	(13,x)
 228                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 230  001f 6f0e          	clr	(14,x)
 231                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 233  0021 6f0f          	clr	(15,x)
 234                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 236  0023 6f10          	clr	(16,x)
 237                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 239  0025 6f11          	clr	(17,x)
 240                     ; 164 }
 243  0027 81            	ret	
 390                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 390                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 390                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 390                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 390                     ; 190 {
 391                     .text:	section	.text,new
 392  0000               _ADC_Init:
 394       fffffffe      OFST: set -2
 397                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 399                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 401                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 403                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 405  0000 f6            	ld	a,(x)
 406  0001 a49b          	and	a,#155
 407  0003 f7            	ld	(x),a
 408                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 410  0004 7b03          	ld	a,(OFST+5,sp)
 411  0006 1a04          	or	a,(OFST+6,sp)
 412  0008 fa            	or	a,(x)
 413  0009 f7            	ld	(x),a
 414                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 416  000a e601          	ld	a,(1,x)
 417  000c a47f          	and	a,#127
 418  000e e701          	ld	(1,x),a
 419                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 421  0010 e601          	ld	a,(1,x)
 422  0012 1a05          	or	a,(OFST+7,sp)
 423  0014 e701          	ld	(1,x),a
 424                     ; 207 }
 427  0016 81            	ret	
 494                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 494                     ; 217              FunctionalState NewState)
 494                     ; 218 {
 495                     .text:	section	.text,new
 496  0000               _ADC_Cmd:
 498       fffffffe      OFST: set -2
 501                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 503                     ; 222   if (NewState != DISABLE)
 505  0000 7b03          	ld	a,(OFST+5,sp)
 506  0002 2705          	jreq	L142
 507                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 509  0004 f6            	ld	a,(x)
 510  0005 aa01          	or	a,#1
 512  0007 2003          	jra	L342
 513  0009               L142:
 514                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 516  0009 f6            	ld	a,(x)
 517  000a a4fe          	and	a,#254
 518  000c               L342:
 519  000c f7            	ld	(x),a
 520                     ; 232 }
 523  000d 81            	ret	
 561                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 561                     ; 240 {
 562                     .text:	section	.text,new
 563  0000               _ADC_SoftwareStartConv:
 567                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 569  0000 f6            	ld	a,(x)
 570  0001 aa02          	or	a,#2
 571  0003 f7            	ld	(x),a
 572                     ; 243 }
 575  0004 81            	ret	
 703                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 703                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 703                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 703                     ; 264 {
 704                     .text:	section	.text,new
 705  0000               _ADC_ExternalTrigConfig:
 707       fffffffe      OFST: set -2
 710                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 712                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 714                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 716  0000 e601          	ld	a,(1,x)
 717  0002 a487          	and	a,#135
 718  0004 e701          	ld	(1,x),a
 719                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 719                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 721  0006 7b04          	ld	a,(OFST+6,sp)
 722  0008 1a03          	or	a,(OFST+5,sp)
 723  000a ea01          	or	a,(1,x)
 724  000c e701          	ld	(1,x),a
 725                     ; 276 }
 728  000e 81            	ret	
1042                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1042                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1042                     ; 341 {
1043                     .text:	section	.text,new
1044  0000               _ADC_AnalogWatchdogChannelSelect:
1046       fffffffe      OFST: set -2
1049                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1051                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1053  0000 e602          	ld	a,(2,x)
1054  0002 a4e0          	and	a,#224
1055  0004 e702          	ld	(2,x),a
1056                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1058  0006 e602          	ld	a,(2,x)
1059  0008 1a03          	or	a,(OFST+5,sp)
1060  000a e702          	ld	(2,x),a
1061                     ; 350 }
1064  000c 81            	ret	
1116                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1116                     ; 362 {
1117                     .text:	section	.text,new
1118  0000               _ADC_AnalogWatchdogThresholdsConfig:
1120       fffffffe      OFST: set -2
1123                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1125                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1127                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1129  0000 7b03          	ld	a,(OFST+5,sp)
1130  0002 e706          	ld	(6,x),a
1131                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1133  0004 7b04          	ld	a,(OFST+6,sp)
1134  0006 e707          	ld	(7,x),a
1135                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1137  0008 7b05          	ld	a,(OFST+7,sp)
1138  000a e708          	ld	(8,x),a
1139                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1141  000c 7b06          	ld	a,(OFST+8,sp)
1142  000e e709          	ld	(9,x),a
1143                     ; 374 }
1146  0010 81            	ret	
1209                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1209                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1209                     ; 414                               uint16_t HighThreshold,
1209                     ; 415                               uint16_t LowThreshold)
1209                     ; 416 {
1210                     .text:	section	.text,new
1211  0000               _ADC_AnalogWatchdogConfig:
1213       fffffffe      OFST: set -2
1216                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1218                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1220                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1222                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1224  0000 e602          	ld	a,(2,x)
1225  0002 a4e0          	and	a,#224
1226  0004 e702          	ld	(2,x),a
1227                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1229  0006 e602          	ld	a,(2,x)
1230  0008 1a03          	or	a,(OFST+5,sp)
1231  000a e702          	ld	(2,x),a
1232                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1234  000c 7b04          	ld	a,(OFST+6,sp)
1235  000e e706          	ld	(6,x),a
1236                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1238  0010 7b05          	ld	a,(OFST+7,sp)
1239  0012 e707          	ld	(7,x),a
1240                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1242  0014 7b06          	ld	a,(OFST+8,sp)
1243  0016 e708          	ld	(8,x),a
1244                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1246  0018 7b07          	ld	a,(OFST+9,sp)
1247  001a e709          	ld	(9,x),a
1248                     ; 435 }
1251  001c 81            	ret	
1286                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1286                     ; 475 {
1287                     .text:	section	.text,new
1288  0000               _ADC_TempSensorCmd:
1292                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1294                     ; 479   if (NewState != DISABLE)
1296  0000 4d            	tnz	a
1297  0001 2705          	jreq	L165
1298                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1300  0003 721a534e      	bset	21326,#5
1303  0007 81            	ret	
1304  0008               L165:
1305                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1307  0008 721b534e      	bres	21326,#5
1308                     ; 489 }
1311  000c 81            	ret	
1346                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1346                     ; 498 {
1347                     .text:	section	.text,new
1348  0000               _ADC_VrefintCmd:
1352                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1354                     ; 502   if (NewState != DISABLE)
1356  0000 4d            	tnz	a
1357  0001 2705          	jreq	L306
1358                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1360  0003 7218534e      	bset	21326,#4
1363  0007 81            	ret	
1364  0008               L306:
1365                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1367  0008 7219534e      	bres	21326,#4
1368                     ; 512 }
1371  000c 81            	ret	
1681                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1681                     ; 584 {
1682                     .text:	section	.text,new
1683  0000               _ADC_ChannelCmd:
1685  0000 89            	pushw	x
1686  0001 88            	push	a
1687       00000001      OFST:	set	1
1690                     ; 585   uint8_t regindex = 0;
1692                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1694                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1696  0002 7b06          	ld	a,(OFST+5,sp)
1697  0004 6b01          	ld	(OFST+0,sp),a
1699                     ; 591   if (NewState != DISABLE)
1701  0006 0d08          	tnz	(OFST+7,sp)
1702  0008 270d          	jreq	L157
1703                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1705  000a 01            	rrwa	x,a
1706  000b 1b01          	add	a,(OFST+0,sp)
1707  000d 2401          	jrnc	L23
1708  000f 5c            	incw	x
1709  0010               L23:
1710  0010 02            	rlwa	x,a
1711  0011 e60a          	ld	a,(10,x)
1712  0013 1a07          	or	a,(OFST+6,sp)
1714  0015 200a          	jra	L357
1715  0017               L157:
1716                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1718  0017 5f            	clrw	x
1719  0018 97            	ld	xl,a
1720  0019 72fb02        	addw	x,(OFST+1,sp)
1721  001c 7b07          	ld	a,(OFST+6,sp)
1722  001e 43            	cpl	a
1723  001f e40a          	and	a,(10,x)
1724  0021               L357:
1725  0021 e70a          	ld	(10,x),a
1726                     ; 601 }
1729  0023 5b03          	addw	sp,#3
1730  0025 81            	ret	
1880                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1880                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1880                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1880                     ; 628 {
1881                     .text:	section	.text,new
1882  0000               _ADC_SamplingTimeConfig:
1884       fffffffe      OFST: set -2
1887                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1889                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1891                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1893  0000 7b03          	ld	a,(OFST+5,sp)
1894  0002 2711          	jreq	L1401
1895                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1897  0004 e602          	ld	a,(2,x)
1898  0006 a41f          	and	a,#31
1899  0008 e702          	ld	(2,x),a
1900                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1902  000a 7b04          	ld	a,(OFST+6,sp)
1903  000c 4e            	swap	a
1904  000d 48            	sll	a
1905  000e a4e0          	and	a,#224
1906  0010 ea02          	or	a,(2,x)
1907  0012 e702          	ld	(2,x),a
1910  0014 81            	ret	
1911  0015               L1401:
1912                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1914  0015 e601          	ld	a,(1,x)
1915  0017 a4f8          	and	a,#248
1916  0019 e701          	ld	(1,x),a
1917                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1919  001b e601          	ld	a,(1,x)
1920  001d 1a04          	or	a,(OFST+6,sp)
1921  001f e701          	ld	(1,x),a
1922                     ; 645 }
1925  0021 81            	ret	
1990                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
1990                     ; 692                               FunctionalState NewState)
1990                     ; 693 {
1991                     .text:	section	.text,new
1992  0000               _ADC_SchmittTriggerConfig:
1994  0000 89            	pushw	x
1995  0001 88            	push	a
1996       00000001      OFST:	set	1
1999                     ; 694   uint8_t regindex = 0;
2001                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2003                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2005  0002 7b06          	ld	a,(OFST+5,sp)
2006  0004 6b01          	ld	(OFST+0,sp),a
2008                     ; 700   if (NewState != DISABLE)
2010  0006 0d08          	tnz	(OFST+7,sp)
2011  0008 270e          	jreq	L7701
2012                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2014  000a 01            	rrwa	x,a
2015  000b 1b01          	add	a,(OFST+0,sp)
2016  000d 2401          	jrnc	L04
2017  000f 5c            	incw	x
2018  0010               L04:
2019  0010 02            	rlwa	x,a
2020  0011 7b07          	ld	a,(OFST+6,sp)
2021  0013 43            	cpl	a
2022  0014 e40e          	and	a,(14,x)
2024  0016 2009          	jra	L1011
2025  0018               L7701:
2026                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2028  0018 5f            	clrw	x
2029  0019 97            	ld	xl,a
2030  001a 72fb02        	addw	x,(OFST+1,sp)
2031  001d e60e          	ld	a,(14,x)
2032  001f 1a07          	or	a,(OFST+6,sp)
2033  0021               L1011:
2034  0021 e70e          	ld	(14,x),a
2035                     ; 710 }
2038  0023 5b03          	addw	sp,#3
2039  0025 81            	ret	
2084                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2084                     ; 718 {
2085                     .text:	section	.text,new
2086  0000               _ADC_GetConversionValue:
2088  0000 89            	pushw	x
2089  0001 89            	pushw	x
2090       00000002      OFST:	set	2
2093                     ; 719   uint16_t tmpreg = 0;
2095                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2097  0002 e604          	ld	a,(4,x)
2098  0004 97            	ld	xl,a
2100                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2102  0005 1603          	ldw	y,(OFST+1,sp)
2103  0007 90e605        	ld	a,(5,y)
2104  000a 02            	rlwa	x,a
2106                     ; 726   return (uint16_t)(tmpreg) ;
2110  000b 5b04          	addw	sp,#4
2111  000d 81            	ret	
2158                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2158                     ; 761 {
2159                     .text:	section	.text,new
2160  0000               _ADC_DMACmd:
2162       fffffffe      OFST: set -2
2165                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2167                     ; 765   if (NewState != DISABLE)
2169  0000 7b03          	ld	a,(OFST+5,sp)
2170  0002 2706          	jreq	L1511
2171                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2173  0004 e60a          	ld	a,(10,x)
2174  0006 a47f          	and	a,#127
2176  0008 2004          	jra	L3511
2177  000a               L1511:
2178                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2180  000a e60a          	ld	a,(10,x)
2181  000c aa80          	or	a,#128
2182  000e               L3511:
2183  000e e70a          	ld	(10,x),a
2184                     ; 775 }
2187  0010 81            	ret	
2271                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2271                     ; 832 {
2272                     .text:	section	.text,new
2273  0000               _ADC_ITConfig:
2275       fffffffe      OFST: set -2
2278                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2280                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2282                     ; 837   if (NewState != DISABLE)
2284  0000 7b04          	ld	a,(OFST+6,sp)
2285  0002 2705          	jreq	L7121
2286                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2288  0004 f6            	ld	a,(x)
2289  0005 1a03          	or	a,(OFST+5,sp)
2291  0007 2004          	jra	L1221
2292  0009               L7121:
2293                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2295  0009 7b03          	ld	a,(OFST+5,sp)
2296  000b 43            	cpl	a
2297  000c f4            	and	a,(x)
2298  000d               L1221:
2299  000d f7            	ld	(x),a
2300                     ; 847 }
2303  000e 81            	ret	
2408                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2408                     ; 860 {
2409                     .text:	section	.text,new
2410  0000               _ADC_GetFlagStatus:
2412       fffffffe      OFST: set -2
2415                     ; 861   FlagStatus flagstatus = RESET;
2417                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2419                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2421  0000 e603          	ld	a,(3,x)
2422  0002 1503          	bcp	a,(OFST+5,sp)
2423  0004 2703          	jreq	L5721
2424                     ; 870     flagstatus = SET;
2426  0006 a601          	ld	a,#1
2430  0008 81            	ret	
2431  0009               L5721:
2432                     ; 875     flagstatus = RESET;
2434  0009 4f            	clr	a
2436                     ; 879   return  flagstatus;
2440  000a 81            	ret	
2487                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2487                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2487                     ; 894 {
2488                     .text:	section	.text,new
2489  0000               _ADC_ClearFlag:
2491       fffffffe      OFST: set -2
2494                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2496                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2498  0000 7b03          	ld	a,(OFST+5,sp)
2499  0002 43            	cpl	a
2500  0003 e703          	ld	(3,x),a
2501                     ; 900 }
2504  0005 81            	ret	
2576                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2576                     ; 913                          ADC_IT_TypeDef ADC_IT)
2576                     ; 914 {
2577                     .text:	section	.text,new
2578  0000               _ADC_GetITStatus:
2580  0000 89            	pushw	x
2581  0001 5203          	subw	sp,#3
2582       00000003      OFST:	set	3
2585                     ; 915   ITStatus itstatus = RESET;
2587                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2591                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2593                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2595  0003 7b08          	ld	a,(OFST+5,sp)
2596  0005 44            	srl	a
2597  0006 44            	srl	a
2598  0007 44            	srl	a
2599  0008 6b03          	ld	(OFST+0,sp),a
2601                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2601                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2603  000a a403          	and	a,#3
2604  000c 6b01          	ld	(OFST-2,sp),a
2606  000e 7b03          	ld	a,(OFST+0,sp)
2607  0010 a410          	and	a,#16
2608  0012 44            	srl	a
2609  0013 44            	srl	a
2610  0014 1a01          	or	a,(OFST-2,sp)
2611  0016 6b03          	ld	(OFST+0,sp),a
2613                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2615  0018 f6            	ld	a,(x)
2616  0019 1408          	and	a,(OFST+5,sp)
2617  001b 6b02          	ld	(OFST-1,sp),a
2619                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2621  001d e603          	ld	a,(3,x)
2622  001f 1503          	bcp	a,(OFST+0,sp)
2623  0021 2708          	jreq	L1631
2625  0023 7b02          	ld	a,(OFST-1,sp)
2626  0025 2704          	jreq	L1631
2627                     ; 933     itstatus = SET;
2629  0027 a601          	ld	a,#1
2632  0029 2001          	jra	L3631
2633  002b               L1631:
2634                     ; 938     itstatus = RESET;
2636  002b 4f            	clr	a
2638  002c               L3631:
2639                     ; 942   return  itstatus;
2643  002c 5b05          	addw	sp,#5
2644  002e 81            	ret	
2699                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2699                     ; 956                            ADC_IT_TypeDef ADC_IT)
2699                     ; 957 {
2700                     .text:	section	.text,new
2701  0000               _ADC_ClearITPendingBit:
2703  0000 89            	pushw	x
2704  0001 89            	pushw	x
2705       00000002      OFST:	set	2
2708                     ; 958   uint8_t itmask = 0;
2710                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2712                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2714  0002 7b07          	ld	a,(OFST+5,sp)
2715  0004 44            	srl	a
2716  0005 44            	srl	a
2717  0006 44            	srl	a
2718  0007 6b02          	ld	(OFST+0,sp),a
2720                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2720                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2722  0009 a403          	and	a,#3
2723  000b 6b01          	ld	(OFST-1,sp),a
2725  000d 7b02          	ld	a,(OFST+0,sp)
2726  000f a410          	and	a,#16
2727  0011 44            	srl	a
2728  0012 44            	srl	a
2729  0013 1a01          	or	a,(OFST-1,sp)
2730  0015 6b02          	ld	(OFST+0,sp),a
2732                     ; 969   ADCx->SR = (uint8_t)~itmask;
2734  0017 43            	cpl	a
2735  0018 1e03          	ldw	x,(OFST+1,sp)
2736  001a e703          	ld	(3,x),a
2737                     ; 970 }
2740  001c 5b04          	addw	sp,#4
2741  001e 81            	ret	
2754                     	xdef	_ADC_ClearITPendingBit
2755                     	xdef	_ADC_GetITStatus
2756                     	xdef	_ADC_ClearFlag
2757                     	xdef	_ADC_GetFlagStatus
2758                     	xdef	_ADC_ITConfig
2759                     	xdef	_ADC_DMACmd
2760                     	xdef	_ADC_GetConversionValue
2761                     	xdef	_ADC_SchmittTriggerConfig
2762                     	xdef	_ADC_SamplingTimeConfig
2763                     	xdef	_ADC_ChannelCmd
2764                     	xdef	_ADC_VrefintCmd
2765                     	xdef	_ADC_TempSensorCmd
2766                     	xdef	_ADC_AnalogWatchdogConfig
2767                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2768                     	xdef	_ADC_AnalogWatchdogChannelSelect
2769                     	xdef	_ADC_ExternalTrigConfig
2770                     	xdef	_ADC_SoftwareStartConv
2771                     	xdef	_ADC_Cmd
2772                     	xdef	_ADC_Init
2773                     	xdef	_ADC_DeInit
2792                     	end
