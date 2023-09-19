   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 95 void WFE_DeInit(void)
  17                     ; 96 {
  18                     	scross	off
  19  0000               _WFE_DeInit:
  21                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  22  0000 725f50a6      	clr	20646
  23                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  24  0004 725f50a7      	clr	20647
  25                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  26  0008 725f50a8      	clr	20648
  27                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  28  000c 725f50a9      	clr	20649
  29                     ; 101 }
  30  0010 81            	ret	
  32                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
  32                     ; 142 {
  33  0011               _WFE_WakeUpSourceEventCmd:
  34  0011 89            	pushw	x
  35  0012 88            	push	a
  36       00000001      OFST:	set	1
  38                     ; 143   uint8_t register_index = 0;
  39                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
  40                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
  41                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
  42  0013 9e            	ld	a,xh
  43  0014 6b01          	ld	(OFST+0,sp),a
  44                     ; 151   if (NewState != DISABLE)
  45  0016 0d06          	tnz	(OFST+5,sp)
  46  0018 2730          	jreq	L72
  47                     ; 153     switch (register_index)
  49                     ; 171       default:
  49                     ; 172         break;
  50  001a 4a            	dec	a
  51  001b 270b          	jreq	L3
  52  001d 4a            	dec	a
  53  001e 270f          	jreq	L5
  54  0020 4a            	dec	a
  55  0021 2716          	jreq	L7
  56  0023 4a            	dec	a
  57  0024 271d          	jreq	L11
  58  0026 2039          	jra	L53
  59  0028               L3:
  60                     ; 155       case 1:
  60                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
  61  0028 c650a6        	ld	a,20646
  62  002b 1a03          	or	a,(OFST+2,sp)
  63                     ; 157         break;
  64  002d 202f          	jp	LC001
  65  002f               L5:
  66                     ; 159       case 2:
  66                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
  67  002f c650a7        	ld	a,20647
  68  0032 1a03          	or	a,(OFST+2,sp)
  69  0034 c750a7        	ld	20647,a
  70                     ; 161         break;
  71  0037 2028          	jra	L53
  72  0039               L7:
  73                     ; 163       case 3:
  73                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
  74  0039 c650a8        	ld	a,20648
  75  003c 1a03          	or	a,(OFST+2,sp)
  76  003e c750a8        	ld	20648,a
  77                     ; 165         break;
  78  0041 201e          	jra	L53
  79  0043               L11:
  80                     ; 167       case 4:
  80                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
  81  0043 c650a9        	ld	a,20649
  82  0046 1a03          	or	a,(OFST+2,sp)
  83                     ; 169         break;
  84  0048 2036          	jp	LC002
  85                     ; 171       default:
  85                     ; 172         break;
  87  004a               L72:
  88                     ; 177     switch (register_index)
  90                     ; 195       default:
  90                     ; 196         break;
  91  004a 4a            	dec	a
  92  004b 270b          	jreq	L51
  93  004d 4a            	dec	a
  94  004e 2714          	jreq	L71
  95  0050 4a            	dec	a
  96  0051 271c          	jreq	L12
  97  0053 4a            	dec	a
  98  0054 2724          	jreq	L32
  99  0056 2009          	jra	L53
 100  0058               L51:
 101                     ; 179       case 1:
 101                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 102  0058 7b03          	ld	a,(OFST+2,sp)
 103  005a 43            	cpl	a
 104  005b c450a6        	and	a,20646
 105  005e               LC001:
 106  005e c750a6        	ld	20646,a
 107                     ; 181         break;
 108  0061               L53:
 109                     ; 199 }
 110  0061 5b03          	addw	sp,#3
 111  0063 81            	ret	
 112  0064               L71:
 113                     ; 183       case 2:
 113                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 114  0064 7b03          	ld	a,(OFST+2,sp)
 115  0066 43            	cpl	a
 116  0067 c450a7        	and	a,20647
 117  006a c750a7        	ld	20647,a
 118                     ; 185         break;
 119  006d 20f2          	jra	L53
 120  006f               L12:
 121                     ; 187       case 3:
 121                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 122  006f 7b03          	ld	a,(OFST+2,sp)
 123  0071 43            	cpl	a
 124  0072 c450a8        	and	a,20648
 125  0075 c750a8        	ld	20648,a
 126                     ; 189         break;
 127  0078 20e7          	jra	L53
 128  007a               L32:
 129                     ; 191       case 4:
 129                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 130  007a 7b03          	ld	a,(OFST+2,sp)
 131  007c 43            	cpl	a
 132  007d c450a9        	and	a,20649
 133  0080               LC002:
 134  0080 c750a9        	ld	20649,a
 135                     ; 193         break;
 136  0083 20dc          	jra	L53
 137                     ; 195       default:
 137                     ; 196         break;
 139                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 139                     ; 238 {
 140  0085               _WFE_GetWakeUpSourceEventStatus:
 141  0085 89            	pushw	x
 142  0086 88            	push	a
 143       00000001      OFST:	set	1
 145                     ; 239   FunctionalState status = DISABLE;
 146  0087 0f01          	clr	(OFST+0,sp)
 147                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 148                     ; 243   switch (WFE_Source)
 150                     ; 326     default:
 150                     ; 327       break;
 151  0089 1d0101        	subw	x,#257
 152  008c 2603cc0121    	jreq	L34
 153  0091 5a            	decw	x
 154  0092 27fa          	jreq	L34
 155  0094 1d0002        	subw	x,#2
 156  0097 27f5          	jreq	L34
 157  0099 1d0004        	subw	x,#4
 158  009c 27f0          	jreq	L34
 159  009e 1d0008        	subw	x,#8
 160  00a1 277e          	jreq	L34
 161  00a3 1d0010        	subw	x,#16
 162  00a6 2779          	jreq	L34
 163  00a8 1d0020        	subw	x,#32
 164  00ab 2774          	jreq	L34
 165  00ad 1d0040        	subw	x,#64
 166  00b0 276f          	jreq	L34
 167  00b2 1d0081        	subw	x,#129
 168  00b5 276f          	jreq	L54
 169  00b7 5a            	decw	x
 170  00b8 276c          	jreq	L54
 171  00ba 1d0002        	subw	x,#2
 172  00bd 2767          	jreq	L54
 173  00bf 1d0004        	subw	x,#4
 174  00c2 2762          	jreq	L54
 175  00c4 1d0008        	subw	x,#8
 176  00c7 275d          	jreq	L54
 177  00c9 1d0010        	subw	x,#16
 178  00cc 2758          	jreq	L54
 179  00ce 1d0020        	subw	x,#32
 180  00d1 2753          	jreq	L54
 181  00d3 1d0040        	subw	x,#64
 182  00d6 274e          	jreq	L54
 183  00d8 1d0081        	subw	x,#129
 184  00db 274e          	jreq	L74
 185  00dd 5a            	decw	x
 186  00de 274b          	jreq	L74
 187  00e0 1d0002        	subw	x,#2
 188  00e3 2746          	jreq	L74
 189  00e5 1d0004        	subw	x,#4
 190  00e8 2741          	jreq	L74
 191  00ea 1d0008        	subw	x,#8
 192  00ed 273c          	jreq	L74
 193  00ef 1d0010        	subw	x,#16
 194  00f2 2737          	jreq	L74
 195  00f4 1d0020        	subw	x,#32
 196  00f7 2732          	jreq	L74
 197  00f9 1d0040        	subw	x,#64
 198  00fc 272d          	jreq	L74
 199  00fe 1d0081        	subw	x,#129
 200  0101 2735          	jreq	L15
 201  0103 5a            	decw	x
 202  0104 2732          	jreq	L15
 203  0106 1d0002        	subw	x,#2
 204  0109 272d          	jreq	L15
 205  010b 1d0004        	subw	x,#4
 206  010e 2728          	jreq	L15
 207  0110 1d0008        	subw	x,#8
 208  0113 2723          	jreq	L15
 209  0115 1d0010        	subw	x,#16
 210  0118 271e          	jreq	L15
 211  011a 1d0020        	subw	x,#32
 212  011d 2719          	jreq	L15
 213  011f 2020          	jra	L75
 214  0121               L34:
 215                     ; 245     case WFE_Source_TIM2_EV0:
 215                     ; 246     case WFE_Source_TIM2_EV1:
 215                     ; 247     case WFE_Source_TIM1_EV0:
 215                     ; 248     case WFE_Source_TIM1_EV1:
 215                     ; 249     case WFE_Source_EXTI_EV0:
 215                     ; 250     case WFE_Source_EXTI_EV1:
 215                     ; 251     case WFE_Source_EXTI_EV2:
 215                     ; 252     case WFE_Source_EXTI_EV3:
 215                     ; 253 
 215                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 216  0121 c650a6        	ld	a,20646
 217                     ; 257         status = ENABLE;
 219  0124 2008          	jp	LC005
 220                     ; 262         status = DISABLE;
 221  0126               L54:
 222                     ; 266     case WFE_Source_EXTI_EV4:
 222                     ; 267     case WFE_Source_EXTI_EV5:
 222                     ; 268     case WFE_Source_EXTI_EV6:
 222                     ; 269     case WFE_Source_EXTI_EV7:
 222                     ; 270     case WFE_Source_EXTI_EVB_G:
 222                     ; 271     case WFE_Source_EXTI_EVD_H:
 222                     ; 272     case WFE_Source_EXTI_EVE_F:
 222                     ; 273     case WFE_Source_ADC1_COMP_EV:
 222                     ; 274 
 222                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 223  0126 c650a7        	ld	a,20647
 224                     ; 278         status = ENABLE;
 226  0129 2003          	jp	LC005
 227                     ; 283         status = DISABLE;
 228  012b               L74:
 229                     ; 286     case WFE_Source_TIM3_EV0:
 229                     ; 287     case WFE_Source_TIM3_EV1:
 229                     ; 288     case WFE_Source_TIM4_EV:
 229                     ; 289     case WFE_Source_SPI1_EV:
 229                     ; 290     case WFE_Source_I2C1_EV:
 229                     ; 291     case WFE_Source_USART1_EV:
 229                     ; 292     case WFE_Source_DMA1CH01_EV:
 229                     ; 293     case WFE_Source_DMA1CH23_EV:
 229                     ; 294 
 229                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 230  012b c650a8        	ld	a,20648
 231  012e               LC005:
 232  012e 1503          	bcp	a,(OFST+2,sp)
 233  0130 270d          	jreq	L57
 234                     ; 298         status = ENABLE;
 235  0132               LC004:
 236  0132 a601          	ld	a,#1
 237  0134 6b01          	ld	(OFST+0,sp),a
 239  0136 2009          	jra	L75
 240                     ; 303         status = DISABLE;
 241  0138               L15:
 242                     ; 307     case WFE_Source_TIM5_EV0:
 242                     ; 308     case WFE_Source_TIM5_EV1:
 242                     ; 309     case WFE_Source_AES_EV:
 242                     ; 310     case WFE_Source_SPI2_EV:
 242                     ; 311     case WFE_Source_USART2_EV:
 242                     ; 312     case WFE_Source_USART3_EV:
 242                     ; 313     case WFE_Source_RTC_CSS_EV:
 242                     ; 314 
 242                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 243  0138 c650a9        	ld	a,20649
 244  013b 1503          	bcp	a,(OFST+2,sp)
 245                     ; 318         status = ENABLE;
 247  013d 26f3          	jrne	LC004
 248  013f               L57:
 249                     ; 323         status = DISABLE;
 250  013f 0f01          	clr	(OFST+0,sp)
 251                     ; 326     default:
 251                     ; 327       break;
 252  0141               L75:
 253                     ; 329   return status;
 254  0141 7b01          	ld	a,(OFST+0,sp)
 256  0143 5b03          	addw	sp,#3
 257  0145 81            	ret	
 259                     	xdef	_WFE_GetWakeUpSourceEventStatus
 260                     	xdef	_WFE_WakeUpSourceEventCmd
 261                     	xdef	_WFE_DeInit
 262                     	end
