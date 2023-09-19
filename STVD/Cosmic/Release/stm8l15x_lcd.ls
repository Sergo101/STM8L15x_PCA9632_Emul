   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 121 void LCD_DeInit(void)
  17                     ; 122 {
  18                     	scross	off
  19  0000               _LCD_DeInit:
  20  0000 88            	push	a
  21       00000001      OFST:	set	1
  23                     ; 123   uint8_t counter = 0;
  24                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  25  0001 725f5400      	clr	21504
  26                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  27  0005 725f5401      	clr	21505
  28                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  29  0009 725f5402      	clr	21506
  30                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  31  000d 725f5403      	clr	21507
  32                     ; 130   for (counter = 0;counter < 0x05; counter++)
  33  0011 4f            	clr	a
  34  0012 6b01          	ld	(OFST+0,sp),a
  35  0014               L3:
  36                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  37  0014 5f            	clrw	x
  38  0015 97            	ld	xl,a
  39  0016 724f5404      	clr	(21508,x)
  40                     ; 130   for (counter = 0;counter < 0x05; counter++)
  41  001a 0c01          	inc	(OFST+0,sp)
  43  001c 7b01          	ld	a,(OFST+0,sp)
  44  001e a105          	cp	a,#5
  45  0020 25f2          	jrult	L3
  46                     ; 135   for (counter = 0;counter < 0x16; counter++)
  47  0022 4f            	clr	a
  48  0023 6b01          	ld	(OFST+0,sp),a
  49  0025               L11:
  50                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
  51  0025 5f            	clrw	x
  52  0026 97            	ld	xl,a
  53  0027 724f540c      	clr	(21516,x)
  54                     ; 135   for (counter = 0;counter < 0x16; counter++)
  55  002b 0c01          	inc	(OFST+0,sp)
  57  002d 7b01          	ld	a,(OFST+0,sp)
  58  002f a116          	cp	a,#22
  59  0031 25f2          	jrult	L11
  60                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
  61  0033 725f542f      	clr	21551
  62                     ; 142 }
  63  0037 84            	pop	a
  64  0038 81            	ret	
  66                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
  66                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
  66                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
  66                     ; 203 {
  67  0039               _LCD_Init:
  68       fffffffe      OFST: set -2
  70                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
  71                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
  72                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
  73                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
  74                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
  75                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
  76  0039 c65403        	ld	a,21507
  77  003c a40f          	and	a,#15
  78  003e c75403        	ld	21507,a
  79                     ; 212   LCD->FRQ |= LCD_Prescaler;
  80  0041 9e            	ld	a,xh
  81  0042 ca5403        	or	a,21507
  82  0045 c75403        	ld	21507,a
  83                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
  84  0048 c65403        	ld	a,21507
  85  004b a4f0          	and	a,#240
  86  004d c75403        	ld	21507,a
  87                     ; 215   LCD->FRQ |= LCD_Divider;
  88  0050 9f            	ld	a,xl
  89  0051 ca5403        	or	a,21507
  90  0054 c75403        	ld	21507,a
  91                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
  92  0057 c65400        	ld	a,21504
  93  005a a4f9          	and	a,#249
  94  005c c75400        	ld	21504,a
  95                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
  96  005f 7213542f      	bres	21551,#1
  97                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
  98  0063 7b03          	ld	a,(OFST+5,sp)
  99  0065 a120          	cp	a,#32
 100  0067 260b          	jrne	L71
 101                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 102  0069 4e            	swap	a
 103  006a a40f          	and	a,#15
 104  006c ca542f        	or	a,21551
 105  006f c7542f        	ld	21551,a
 107  0072 2008          	jra	L12
 108  0074               L71:
 109                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 110  0074 a40f          	and	a,#15
 111  0076 ca5400        	or	a,21504
 112  0079 c75400        	ld	21504,a
 113  007c               L12:
 114                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 115  007c 72115400      	bres	21504,#0
 116                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 117  0080 7211542f      	bres	21551,#0
 118                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 119  0084 7b04          	ld	a,(OFST+6,sp)
 120  0086 a110          	cp	a,#16
 121  0088 2615          	jrne	L32
 122                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 123  008a a40f          	and	a,#15
 124  008c ca5400        	or	a,21504
 125  008f c75400        	ld	21504,a
 126                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 127  0092 7b04          	ld	a,(OFST+6,sp)
 128  0094 4e            	swap	a
 129  0095 a40f          	and	a,#15
 130  0097 ca542f        	or	a,21551
 131  009a c7542f        	ld	21551,a
 133  009d 2008          	jra	L52
 134  009f               L32:
 135                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 136  009f a40f          	and	a,#15
 137  00a1 ca5400        	or	a,21504
 138  00a4 c75400        	ld	21504,a
 139  00a7               L52:
 140                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 141  00a7 72115401      	bres	21505,#0
 142                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 143  00ab c65401        	ld	a,21505
 144  00ae 1a05          	or	a,(OFST+7,sp)
 145  00b0 c75401        	ld	21505,a
 146                     ; 247 }
 147  00b3 81            	ret	
 149                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 149                     ; 263 {
 150  00b4               _LCD_PortMaskConfig:
 151  00b4 89            	pushw	x
 152       00000000      OFST:	set	0
 154                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 155                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 156  00b5 9e            	ld	a,xh
 157  00b6 5f            	clrw	x
 158  00b7 97            	ld	xl,a
 159  00b8 7b02          	ld	a,(OFST+2,sp)
 160  00ba d75404        	ld	(21508,x),a
 161                     ; 270 }
 162  00bd 85            	popw	x
 163  00be 81            	ret	
 165                     ; 279 void LCD_Cmd(FunctionalState NewState)
 165                     ; 280 {
 166  00bf               _LCD_Cmd:
 168                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 169                     ; 284   if (NewState != DISABLE)
 170  00bf 4d            	tnz	a
 171  00c0 2705          	jreq	L72
 172                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 173  00c2 721c5402      	bset	21506,#6
 175  00c6 81            	ret	
 176  00c7               L72:
 177                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 178  00c7 721d5402      	bres	21506,#6
 179                     ; 292 }
 180  00cb 81            	ret	
 182                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 182                     ; 306 {
 183  00cc               _LCD_HighDriveCmd:
 185                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 186                     ; 310   if (NewState != DISABLE)
 187  00cc 4d            	tnz	a
 188  00cd 2705          	jreq	L33
 189                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 190  00cf 72185401      	bset	21505,#4
 192  00d3 81            	ret	
 193  00d4               L33:
 194                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 195  00d4 72195401      	bres	21505,#4
 196                     ; 318 }
 197  00d8 81            	ret	
 199                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
 199                     ; 336 {
 200  00d9               _LCD_PulseOnDurationConfig:
 201  00d9 88            	push	a
 202       00000000      OFST:	set	0
 204                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
 205                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
 206  00da c65401        	ld	a,21505
 207  00dd a41f          	and	a,#31
 208  00df c75401        	ld	21505,a
 209                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
 210  00e2 c65401        	ld	a,21505
 211  00e5 1a01          	or	a,(OFST+1,sp)
 212  00e7 c75401        	ld	21505,a
 213                     ; 342 }
 214  00ea 84            	pop	a
 215  00eb 81            	ret	
 217                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
 217                     ; 359 {
 218  00ec               _LCD_DeadTimeConfig:
 219  00ec 88            	push	a
 220       00000000      OFST:	set	0
 222                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
 223                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
 224  00ed c65402        	ld	a,21506
 225  00f0 a4f8          	and	a,#248
 226  00f2 c75402        	ld	21506,a
 227                     ; 365   LCD->CR3 |= LCD_DeadTime;
 228  00f5 c65402        	ld	a,21506
 229  00f8 1a01          	or	a,(OFST+1,sp)
 230  00fa c75402        	ld	21506,a
 231                     ; 367 }
 232  00fd 84            	pop	a
 233  00fe 81            	ret	
 235                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
 235                     ; 392 {
 236  00ff               _LCD_BlinkConfig:
 238                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
 239                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
 240                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
 241  00ff c65400        	ld	a,21504
 242  0102 a43f          	and	a,#63
 243  0104 c75400        	ld	21504,a
 244                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
 245  0107 9e            	ld	a,xh
 246  0108 ca5400        	or	a,21504
 247  010b c75400        	ld	21504,a
 248                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
 249  010e c65400        	ld	a,21504
 250  0111 a4c7          	and	a,#199
 251  0113 c75400        	ld	21504,a
 252                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
 253  0116 9f            	ld	a,xl
 254  0117 ca5400        	or	a,21504
 255  011a c75400        	ld	21504,a
 256                     ; 403 }
 257  011d 81            	ret	
 259                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
 259                     ; 420 {
 260  011e               _LCD_ContrastConfig:
 261  011e 88            	push	a
 262       00000000      OFST:	set	0
 264                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
 265                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
 266  011f c65401        	ld	a,21505
 267  0122 a4f1          	and	a,#241
 268  0124 c75401        	ld	21505,a
 269                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
 270  0127 c65401        	ld	a,21505
 271  012a 1a01          	or	a,(OFST+1,sp)
 272  012c c75401        	ld	21505,a
 273                     ; 427 }
 274  012f 84            	pop	a
 275  0130 81            	ret	
 277                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
 277                     ; 475 {
 278  0131               _LCD_WriteRAM:
 279  0131 89            	pushw	x
 280       00000000      OFST:	set	0
 282                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
 283                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
 284  0132 9e            	ld	a,xh
 285  0133 5f            	clrw	x
 286  0134 97            	ld	xl,a
 287  0135 7b02          	ld	a,(OFST+2,sp)
 288  0137 d7540c        	ld	(21516,x),a
 289                     ; 482 }
 290  013a 85            	popw	x
 291  013b 81            	ret	
 293                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
 293                     ; 493 {
 294  013c               _LCD_PageSelect:
 296                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
 297                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
 298  013c 7215542f      	bres	21551,#2
 299                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
 300  0140 ca542f        	or	a,21551
 301  0143 c7542f        	ld	21551,a
 302                     ; 500 }
 303  0146 81            	ret	
 305                     ; 525 void LCD_ITConfig(FunctionalState NewState)
 305                     ; 526 {
 306  0147               _LCD_ITConfig:
 308                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
 309                     ; 530   if (NewState != DISABLE)
 310  0147 4d            	tnz	a
 311  0148 2705          	jreq	L73
 312                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
 313  014a 721a5402      	bset	21506,#5
 315  014e 81            	ret	
 316  014f               L73:
 317                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
 318  014f 721b5402      	bres	21506,#5
 319                     ; 539 }
 320  0153 81            	ret	
 322                     ; 546 FlagStatus LCD_GetFlagStatus(void)
 322                     ; 547 {
 323  0154               _LCD_GetFlagStatus:
 324       00000001      OFST:	set	1
 326                     ; 548   FlagStatus status = RESET;
 327                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
 328  0154 7209540203    	btjf	21506,#4,L34
 329                     ; 553     status = SET; /* Flag is set */
 330  0159 a601          	ld	a,#1
 332  015b 81            	ret	
 333  015c               L34:
 334                     ; 557     status = RESET; /* Flag is reset*/
 335  015c 4f            	clr	a
 336                     ; 560   return status;
 338  015d 81            	ret	
 340                     ; 569 void LCD_ClearFlag(void)
 340                     ; 570 {
 341  015e               _LCD_ClearFlag:
 343                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
 344  015e 72165402      	bset	21506,#3
 345                     ; 574 }
 346  0162 81            	ret	
 348                     ; 582 ITStatus LCD_GetITStatus(void)
 348                     ; 583 {
 349  0163               _LCD_GetITStatus:
 350       00000001      OFST:	set	1
 352                     ; 584   ITStatus pendingbitstatus = RESET;
 353                     ; 585   uint8_t enablestatus = 0;
 354                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
 355  0163 c65402        	ld	a,21506
 356  0166 a420          	and	a,#32
 357                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
 358  0168 7209540205    	btjf	21506,#4,L74
 360  016d 2703          	jreq	L74
 361                     ; 592     pendingbitstatus = SET;
 362  016f a601          	ld	a,#1
 364  0171 81            	ret	
 365  0172               L74:
 366                     ; 597     pendingbitstatus = RESET;
 367  0172 4f            	clr	a
 368                     ; 600   return  pendingbitstatus;
 370  0173 81            	ret	
 372                     ; 609 void LCD_ClearITPendingBit(void)
 372                     ; 610 {
 373  0174               _LCD_ClearITPendingBit:
 375                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
 376  0174 72165402      	bset	21506,#3
 377                     ; 614 }
 378  0178 81            	ret	
 380                     	xdef	_LCD_ClearITPendingBit
 381                     	xdef	_LCD_GetITStatus
 382                     	xdef	_LCD_ClearFlag
 383                     	xdef	_LCD_GetFlagStatus
 384                     	xdef	_LCD_ITConfig
 385                     	xdef	_LCD_PageSelect
 386                     	xdef	_LCD_WriteRAM
 387                     	xdef	_LCD_ContrastConfig
 388                     	xdef	_LCD_BlinkConfig
 389                     	xdef	_LCD_DeadTimeConfig
 390                     	xdef	_LCD_PulseOnDurationConfig
 391                     	xdef	_LCD_HighDriveCmd
 392                     	xdef	_LCD_Cmd
 393                     	xdef	_LCD_PortMaskConfig
 394                     	xdef	_LCD_Init
 395                     	xdef	_LCD_DeInit
 396                     	end
