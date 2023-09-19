   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 56 uint8_t ITC_GetCPUCC(void)
  17                     ; 57 {
  18                     	scross	off
  19  0000               _ITC_GetCPUCC:
  21                     ; 59   _asm("push cc");
  23  0000 8a            	push	cc
  25                     ; 60   _asm("pop a");
  27  0001 84            	pop	a
  29                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  30  0002 81            	ret	
  32                     ; 87 void ITC_DeInit(void)
  32                     ; 88 {
  33  0003               _ITC_DeInit:
  35                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  36  0003 35ff7f70      	mov	32624,#255
  37                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  38  0007 35ff7f71      	mov	32625,#255
  39                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  40  000b 35ff7f72      	mov	32626,#255
  41                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  42  000f 35ff7f73      	mov	32627,#255
  43                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  44  0013 35ff7f74      	mov	32628,#255
  45                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  46  0017 35ff7f75      	mov	32629,#255
  47                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
  48  001b 35ff7f76      	mov	32630,#255
  49                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
  50  001f 35ff7f77      	mov	32631,#255
  51                     ; 97 }
  52  0023 81            	ret	
  54                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
  54                     ; 105 {
  55  0024               _ITC_GetSoftIntStatus:
  57                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
  58  0024 adda          	call	_ITC_GetCPUCC
  60  0026 a428          	and	a,#40
  62  0028 81            	ret	
  64                     .const:	section	.text
  65  0000               L22:
  66  0000 004b          	dc.w	L3
  67  0002 004b          	dc.w	L3
  68  0004 004b          	dc.w	L3
  69  0006 0050          	dc.w	L5
  70  0008 0050          	dc.w	L5
  71  000a 0050          	dc.w	L5
  72  000c 0050          	dc.w	L5
  73  000e 0055          	dc.w	L7
  74  0010 0055          	dc.w	L7
  75  0012 0055          	dc.w	L7
  76  0014 0055          	dc.w	L7
  77  0016 005a          	dc.w	L11
  78  0018 005a          	dc.w	L11
  79  001a 005a          	dc.w	L11
  80  001c 005a          	dc.w	L11
  81  001e 005f          	dc.w	L31
  82  0020 005f          	dc.w	L31
  83  0022 005f          	dc.w	L31
  84  0024 005f          	dc.w	L31
  85  0026 0064          	dc.w	L51
  86  0028 0064          	dc.w	L51
  87  002a 0064          	dc.w	L51
  88  002c 0064          	dc.w	L51
  89  002e 0069          	dc.w	L71
  90  0030 0069          	dc.w	L71
  91  0032 0069          	dc.w	L71
  92  0034 0069          	dc.w	L71
  93  0036 006e          	dc.w	L12
  94  0038 006e          	dc.w	L12
  95                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
  95                     ; 115 {
  96                     	switch	.text
  97  0029               _ITC_GetSoftwarePriority:
  98  0029 88            	push	a
  99  002a 89            	pushw	x
 100       00000002      OFST:	set	2
 102                     ; 116   uint8_t Value = 0;
 103  002b 0f02          	clr	(OFST+0,sp)
 104                     ; 117   uint8_t Mask = 0;
 105                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 106                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 107  002d a403          	and	a,#3
 108  002f 48            	sll	a
 109  0030 5f            	clrw	x
 110  0031 97            	ld	xl,a
 111  0032 a603          	ld	a,#3
 112  0034 5d            	tnzw	x
 113  0035 2704          	jreq	L41
 114  0037               L61:
 115  0037 48            	sll	a
 116  0038 5a            	decw	x
 117  0039 26fc          	jrne	L61
 118  003b               L41:
 119  003b 6b01          	ld	(OFST-1,sp),a
 120                     ; 125   switch (IRQn)
 121  003d 7b03          	ld	a,(OFST+1,sp)
 123                     ; 223     default:
 123                     ; 224       break;
 124  003f 4a            	dec	a
 125  0040 a11d          	cp	a,#29
 126  0042 2431          	jruge	L72
 127  0044 5f            	clrw	x
 128  0045 97            	ld	xl,a
 129  0046 58            	sllw	x
 130  0047 de0000        	ldw	x,(L22,x)
 131  004a fc            	jp	(x)
 132  004b               L3:
 133                     ; 127     case FLASH_IRQn:
 133                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 133                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 133                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 134  004b c67f70        	ld	a,32624
 135                     ; 131       break;
 136  004e 2021          	jp	LC001
 137  0050               L5:
 138                     ; 133     case EXTIE_F_PVD_IRQn:
 138                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 138                     ; 135     case RTC_IRQn:
 138                     ; 136     case EXTIB_IRQn:
 138                     ; 137     case EXTID_IRQn:
 138                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 138                     ; 139     case RTC_CSSLSE_IRQn:
 138                     ; 140     case EXTIB_IRQn:
 138                     ; 141     case EXTID_IRQn:
 138                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 138                     ; 143     case RTC_CSSLSE_IRQn:
 138                     ; 144     case EXTIB_G_IRQn:
 138                     ; 145     case EXTID_H_IRQn:
 138                     ; 146 #endif  /* STM8L15X_MD */
 138                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 139  0050 c67f71        	ld	a,32625
 140                     ; 148       break;
 141  0053 201c          	jp	LC001
 142  0055               L7:
 143                     ; 150     case EXTI0_IRQn:
 143                     ; 151     case EXTI1_IRQn:
 143                     ; 152     case EXTI2_IRQn:
 143                     ; 153     case EXTI3_IRQn:
 143                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 144  0055 c67f72        	ld	a,32626
 145                     ; 155       break;
 146  0058 2017          	jp	LC001
 147  005a               L11:
 148                     ; 157     case EXTI4_IRQn:
 148                     ; 158     case EXTI5_IRQn:
 148                     ; 159     case EXTI6_IRQn:
 148                     ; 160     case EXTI7_IRQn:
 148                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 149  005a c67f73        	ld	a,32627
 150                     ; 162       break;
 151  005d 2012          	jp	LC001
 152  005f               L31:
 153                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 153                     ; 168 #endif /* STM8L15X_LD */		
 153                     ; 169     case ADC1_COMP_IRQn:
 153                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 153                     ; 171     case LCD_IRQn:
 153                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 153                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 153                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 153                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 153                     ; 176     case LCD_AES_IRQn:
 153                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 153                     ; 178 #endif  /* STM8L15X_MD */
 153                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 154  005f c67f74        	ld	a,32628
 155                     ; 180       break;
 156  0062 200d          	jp	LC001
 157  0064               L51:
 158                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 158                     ; 184 #endif /* STM8L15X_LD */		
 158                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 158                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 158                     ; 187     case TIM2_CC_IRQn:
 158                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 158                     ; 189     case TIM3_CC_IRQn:
 158                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 158                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 158                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 158                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 158                     ; 194 #endif  /* STM8L15X_MD */
 158                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 159  0064 c67f75        	ld	a,32629
 160                     ; 196       break;
 161  0067 2008          	jp	LC001
 162  0069               L71:
 163                     ; 199     case TIM1_CC_IRQn:
 163                     ; 200 #endif /* STM8L15X_LD */	
 163                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 163                     ; 202     case SPI1_IRQn:
 163                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 163                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 163                     ; 205     case USART1_TX_IRQn:
 163                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 163                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 163                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 163                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 164  0069 c67f76        	ld	a,32630
 165                     ; 210       break;
 166  006c 2003          	jp	LC001
 167  006e               L12:
 168                     ; 214     case USART1_RX_IRQn:
 168                     ; 215     case I2C1_IRQn:
 168                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 168                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 168                     ; 218     case I2C1_SPI2_IRQn:
 168                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 168                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 169  006e c67f77        	ld	a,32631
 170  0071               LC001:
 171  0071 1401          	and	a,(OFST-1,sp)
 172  0073 6b02          	ld	(OFST+0,sp),a
 173                     ; 221       break;
 174                     ; 223     default:
 174                     ; 224       break;
 175  0075               L72:
 176                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 177  0075 7b03          	ld	a,(OFST+1,sp)
 178  0077 a403          	and	a,#3
 179  0079 48            	sll	a
 180  007a 5f            	clrw	x
 181  007b 97            	ld	xl,a
 182  007c 7b02          	ld	a,(OFST+0,sp)
 183  007e 5d            	tnzw	x
 184  007f 2704          	jreq	L42
 185  0081               L62:
 186  0081 44            	srl	a
 187  0082 5a            	decw	x
 188  0083 26fc          	jrne	L62
 189  0085               L42:
 190                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 192  0085 5b03          	addw	sp,#3
 193  0087 81            	ret	
 195                     	switch	.const
 196  003a               L44:
 197  003a 00bf          	dc.w	L13
 198  003c 00bf          	dc.w	L13
 199  003e 00bf          	dc.w	L13
 200  0040 00d1          	dc.w	L33
 201  0042 00d1          	dc.w	L33
 202  0044 00d1          	dc.w	L33
 203  0046 00d1          	dc.w	L33
 204  0048 00e3          	dc.w	L53
 205  004a 00e3          	dc.w	L53
 206  004c 00e3          	dc.w	L53
 207  004e 00e3          	dc.w	L53
 208  0050 00f5          	dc.w	L73
 209  0052 00f5          	dc.w	L73
 210  0054 00f5          	dc.w	L73
 211  0056 00f5          	dc.w	L73
 212  0058 0107          	dc.w	L14
 213  005a 0107          	dc.w	L14
 214  005c 0107          	dc.w	L14
 215  005e 0107          	dc.w	L14
 216  0060 0119          	dc.w	L34
 217  0062 0119          	dc.w	L34
 218  0064 0119          	dc.w	L34
 219  0066 0119          	dc.w	L34
 220  0068 012b          	dc.w	L54
 221  006a 012b          	dc.w	L54
 222  006c 012b          	dc.w	L54
 223  006e 012b          	dc.w	L54
 224  0070 013d          	dc.w	L74
 225  0072 013d          	dc.w	L74
 226                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 226                     ; 251 {
 227                     	switch	.text
 228  0088               _ITC_SetSoftwarePriority:
 229  0088 89            	pushw	x
 230  0089 89            	pushw	x
 231       00000002      OFST:	set	2
 233                     ; 252   uint8_t Mask = 0;
 234                     ; 253   uint8_t NewPriority = 0;
 235                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 236                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 237                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 238                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 239  008a 9e            	ld	a,xh
 240  008b a403          	and	a,#3
 241  008d 48            	sll	a
 242  008e 5f            	clrw	x
 243  008f 97            	ld	xl,a
 244  0090 a603          	ld	a,#3
 245  0092 5d            	tnzw	x
 246  0093 2704          	jreq	L23
 247  0095               L43:
 248  0095 48            	sll	a
 249  0096 5a            	decw	x
 250  0097 26fc          	jrne	L43
 251  0099               L23:
 252  0099 43            	cpl	a
 253  009a 6b01          	ld	(OFST-1,sp),a
 254                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 255  009c 7b03          	ld	a,(OFST+1,sp)
 256  009e a403          	and	a,#3
 257  00a0 48            	sll	a
 258  00a1 5f            	clrw	x
 259  00a2 97            	ld	xl,a
 260  00a3 7b04          	ld	a,(OFST+2,sp)
 261  00a5 5d            	tnzw	x
 262  00a6 2704          	jreq	L63
 263  00a8               L04:
 264  00a8 48            	sll	a
 265  00a9 5a            	decw	x
 266  00aa 26fc          	jrne	L04
 267  00ac               L63:
 268  00ac 6b02          	ld	(OFST+0,sp),a
 269                     ; 268   switch (IRQn)
 270  00ae 7b03          	ld	a,(OFST+1,sp)
 272                     ; 372     default:
 272                     ; 373       break;
 273  00b0 4a            	dec	a
 274  00b1 a11d          	cp	a,#29
 275  00b3 2503cc014d    	jruge	L55
 276  00b8 5f            	clrw	x
 277  00b9 97            	ld	xl,a
 278  00ba 58            	sllw	x
 279  00bb de003a        	ldw	x,(L44,x)
 280  00be fc            	jp	(x)
 281  00bf               L13:
 282                     ; 270     case FLASH_IRQn:
 282                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 282                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 282                     ; 273       ITC->ISPR1 &= Mask;
 283  00bf c67f70        	ld	a,32624
 284  00c2 1401          	and	a,(OFST-1,sp)
 285  00c4 c77f70        	ld	32624,a
 286                     ; 274       ITC->ISPR1 |= NewPriority;
 287  00c7 c67f70        	ld	a,32624
 288  00ca 1a02          	or	a,(OFST+0,sp)
 289  00cc c77f70        	ld	32624,a
 290                     ; 275       break;
 291  00cf 207c          	jra	L55
 292  00d1               L33:
 293                     ; 277     case EXTIE_F_PVD_IRQn:
 293                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 293                     ; 279     case RTC_IRQn:
 293                     ; 280     case EXTIB_IRQn:
 293                     ; 281     case EXTID_IRQn:
 293                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 293                     ; 283     case RTC_CSSLSE_IRQn:
 293                     ; 284     case EXTIB_IRQn:
 293                     ; 285     case EXTID_IRQn:
 293                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 293                     ; 287     case RTC_CSSLSE_IRQn:
 293                     ; 288     case EXTIB_G_IRQn:
 293                     ; 289     case EXTID_H_IRQn:
 293                     ; 290 #endif  /* STM8L15X_MD */
 293                     ; 291       ITC->ISPR2 &= Mask;
 294  00d1 c67f71        	ld	a,32625
 295  00d4 1401          	and	a,(OFST-1,sp)
 296  00d6 c77f71        	ld	32625,a
 297                     ; 292       ITC->ISPR2 |= NewPriority;
 298  00d9 c67f71        	ld	a,32625
 299  00dc 1a02          	or	a,(OFST+0,sp)
 300  00de c77f71        	ld	32625,a
 301                     ; 293       break;
 302  00e1 206a          	jra	L55
 303  00e3               L53:
 304                     ; 295     case EXTI0_IRQn:
 304                     ; 296     case EXTI1_IRQn:
 304                     ; 297     case EXTI2_IRQn:
 304                     ; 298     case EXTI3_IRQn:
 304                     ; 299       ITC->ISPR3 &= Mask;
 305  00e3 c67f72        	ld	a,32626
 306  00e6 1401          	and	a,(OFST-1,sp)
 307  00e8 c77f72        	ld	32626,a
 308                     ; 300       ITC->ISPR3 |= NewPriority;
 309  00eb c67f72        	ld	a,32626
 310  00ee 1a02          	or	a,(OFST+0,sp)
 311  00f0 c77f72        	ld	32626,a
 312                     ; 301       break;
 313  00f3 2058          	jra	L55
 314  00f5               L73:
 315                     ; 303     case EXTI4_IRQn:
 315                     ; 304     case EXTI5_IRQn:
 315                     ; 305     case EXTI6_IRQn:
 315                     ; 306     case EXTI7_IRQn:
 315                     ; 307       ITC->ISPR4 &= Mask;
 316  00f5 c67f73        	ld	a,32627
 317  00f8 1401          	and	a,(OFST-1,sp)
 318  00fa c77f73        	ld	32627,a
 319                     ; 308       ITC->ISPR4 |= NewPriority;
 320  00fd c67f73        	ld	a,32627
 321  0100 1a02          	or	a,(OFST+0,sp)
 322  0102 c77f73        	ld	32627,a
 323                     ; 309       break;
 324  0105 2046          	jra	L55
 325  0107               L14:
 326                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 326                     ; 312 #else
 326                     ; 313     case SWITCH_CSS_IRQn:
 326                     ; 314 #endif /*	STM8L15X_LD	*/
 326                     ; 315     case ADC1_COMP_IRQn:
 326                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 326                     ; 317     case LCD_IRQn:
 326                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 326                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 326                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 326                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 326                     ; 322     case LCD_AES_IRQn:
 326                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 326                     ; 324 #endif  /* STM8L15X_MD */
 326                     ; 325       ITC->ISPR5 &= Mask;
 327  0107 c67f74        	ld	a,32628
 328  010a 1401          	and	a,(OFST-1,sp)
 329  010c c77f74        	ld	32628,a
 330                     ; 326       ITC->ISPR5 |= NewPriority;
 331  010f c67f74        	ld	a,32628
 332  0112 1a02          	or	a,(OFST+0,sp)
 333  0114 c77f74        	ld	32628,a
 334                     ; 327       break;
 335  0117 2034          	jra	L55
 336  0119               L34:
 337                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 337                     ; 330 #endif  /* STM8L15X_LD */
 337                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 337                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 337                     ; 333     case TIM2_CC_IRQn:
 337                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 337                     ; 335     case TIM3_CC_IRQn:
 337                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 337                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 337                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 337                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 337                     ; 340 #endif  /* STM8L15X_MD */
 337                     ; 341       ITC->ISPR6 &= Mask;
 338  0119 c67f75        	ld	a,32629
 339  011c 1401          	and	a,(OFST-1,sp)
 340  011e c77f75        	ld	32629,a
 341                     ; 342       ITC->ISPR6 |= NewPriority;
 342  0121 c67f75        	ld	a,32629
 343  0124 1a02          	or	a,(OFST+0,sp)
 344  0126 c77f75        	ld	32629,a
 345                     ; 343       break;
 346  0129 2022          	jra	L55
 347  012b               L54:
 348                     ; 346     case TIM1_CC_IRQn:
 348                     ; 347 #endif  /* STM8L15X_LD */
 348                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 348                     ; 349     case SPI1_IRQn:
 348                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 348                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 348                     ; 352     case USART1_TX_IRQn:
 348                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 348                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 348                     ; 355 #endif  /* STM8L15X_MD */
 348                     ; 356       ITC->ISPR7 &= Mask;
 349  012b c67f76        	ld	a,32630
 350  012e 1401          	and	a,(OFST-1,sp)
 351  0130 c77f76        	ld	32630,a
 352                     ; 357       ITC->ISPR7 |= NewPriority;
 353  0133 c67f76        	ld	a,32630
 354  0136 1a02          	or	a,(OFST+0,sp)
 355  0138 c77f76        	ld	32630,a
 356                     ; 358       break;
 357  013b 2010          	jra	L55
 358  013d               L74:
 359                     ; 362     case USART1_RX_IRQn:
 359                     ; 363     case I2C1_IRQn:
 359                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 359                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 359                     ; 366     case I2C1_SPI2_IRQn:
 359                     ; 367 #endif  /* STM8L15X_MD */
 359                     ; 368       ITC->ISPR8 &= Mask;
 360  013d c67f77        	ld	a,32631
 361  0140 1401          	and	a,(OFST-1,sp)
 362  0142 c77f77        	ld	32631,a
 363                     ; 369       ITC->ISPR8 |= NewPriority;
 364  0145 c67f77        	ld	a,32631
 365  0148 1a02          	or	a,(OFST+0,sp)
 366  014a c77f77        	ld	32631,a
 367                     ; 370       break;
 368                     ; 372     default:
 368                     ; 373       break;
 369  014d               L55:
 370                     ; 375 }
 371  014d 5b04          	addw	sp,#4
 372  014f 81            	ret	
 374                     	xdef	_ITC_GetSoftwarePriority
 375                     	xdef	_ITC_SetSoftwarePriority
 376                     	xdef	_ITC_GetSoftIntStatus
 377                     	xdef	_ITC_GetCPUCC
 378                     	xdef	_ITC_DeInit
 379                     	end
