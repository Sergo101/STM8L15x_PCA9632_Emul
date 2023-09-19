   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     .const:	section	.text
  18  0000               _SYSDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004 10            	dc.b	16
  24                     ; 120 void CLK_DeInit(void)
  24                     ; 121 {
  25                     	scross	off
  26                     	switch	.text
  27  0000               _CLK_DeInit:
  29                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  30  0000 351150c2      	mov	20674,#17
  31                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  32  0004 725f50c6      	clr	20678
  33                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  34  0008 725f50c1      	clr	20673
  35                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  36  000c 725f50cb      	clr	20683
  37                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  38  0010 350150c8      	mov	20680,#1
  39                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  40  0014 725f50c9      	clr	20681
  41                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  42  0018 350350c0      	mov	20672,#3
  43                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  44  001c 725f50c3      	clr	20675
  45                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  46  0020 358050c4      	mov	20676,#128
  47                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  48  0024 725f50d0      	clr	20688
  49                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  50  0028 725f50ca      	clr	20682
  51                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  52  002c 725f50c5      	clr	20677
  53                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  54  0030 725f50cd      	clr	20685
  55                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  56  0034 725f50cc      	clr	20684
  57                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  58  0038 725f50ce      	clr	20686
  59                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  60  003c 35b950cf      	mov	20687,#185
  61                     ; 138 }
  62  0040 81            	ret	
  64                     ; 160 void CLK_HSICmd(FunctionalState NewState)
  64                     ; 161 {
  65  0041               _CLK_HSICmd:
  67                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
  68                     ; 165   if (NewState != DISABLE)
  69  0041 4d            	tnz	a
  70  0042 2705          	jreq	L3
  71                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
  72  0044 721050c2      	bset	20674,#0
  74  0048 81            	ret	
  75  0049               L3:
  76                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
  77  0049 721150c2      	bres	20674,#0
  78                     ; 175 }
  79  004d 81            	ret	
  81                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
  81                     ; 189 {
  82  004e               _CLK_AdjustHSICalibrationValue:
  84                     ; 191   CLK->HSIUNLCKR = 0xAC;
  85  004e 35ac50ce      	mov	20686,#172
  86                     ; 192   CLK->HSIUNLCKR = 0x35;
  87  0052 353550ce      	mov	20686,#53
  88                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
  89  0056 c750cd        	ld	20685,a
  90                     ; 196 }
  91  0059 81            	ret	
  93                     ; 212 void CLK_LSICmd(FunctionalState NewState)
  93                     ; 213 {
  94  005a               _CLK_LSICmd:
  96                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
  97                     ; 218   if (NewState != DISABLE)
  98  005a 4d            	tnz	a
  99  005b 2705          	jreq	L7
 100                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 101  005d 721450c2      	bset	20674,#2
 103  0061 81            	ret	
 104  0062               L7:
 105                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 106  0062 721550c2      	bres	20674,#2
 107                     ; 228 }
 108  0066 81            	ret	
 110                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 110                     ; 250 {
 111  0067               _CLK_HSEConfig:
 113                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 114                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 115  0067 721150c6      	bres	20678,#0
 116                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 117  006b 721950c6      	bres	20678,#4
 118                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 119  006f ca50c6        	or	a,20678
 120  0072 c750c6        	ld	20678,a
 121                     ; 263 }
 122  0075 81            	ret	
 124                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 124                     ; 281 {
 125  0076               _CLK_LSEConfig:
 127                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 128                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 129  0076 721550c6      	bres	20678,#2
 130                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 131  007a 721b50c6      	bres	20678,#5
 132                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 133  007e ca50c6        	or	a,20678
 134  0081 c750c6        	ld	20678,a
 135                     ; 295 }
 136  0084 81            	ret	
 138                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 138                     ; 307 {
 139  0085               _CLK_ClockSecuritySystemEnable:
 141                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 142  0085 721050ca      	bset	20682,#0
 143                     ; 310 }
 144  0089 81            	ret	
 146                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 146                     ; 318 {
 147  008a               _CLK_ClockSecuritySytemDeglitchCmd:
 149                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 150                     ; 322   if (NewState != DISABLE)
 151  008a 4d            	tnz	a
 152  008b 2705          	jreq	L31
 153                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 154  008d 721850ca      	bset	20682,#4
 156  0091 81            	ret	
 157  0092               L31:
 158                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 159  0092 721950ca      	bres	20682,#4
 160                     ; 332 }
 161  0096 81            	ret	
 163                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 163                     ; 357 {
 164  0097               _CLK_CCOConfig:
 165  0097 89            	pushw	x
 166       00000000      OFST:	set	0
 168                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 169                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 170                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 171  0098 9f            	ld	a,xl
 172  0099 1a01          	or	a,(OFST+1,sp)
 173  009b c750c5        	ld	20677,a
 174                     ; 364 }
 175  009e 85            	popw	x
 176  009f 81            	ret	
 178                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 178                     ; 417 {
 179  00a0               _CLK_SYSCLKSourceConfig:
 181                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 182                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 183  00a0 c750c8        	ld	20680,a
 184                     ; 423 }
 185  00a3 81            	ret	
 187                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 187                     ; 436 {
 188  00a4               _CLK_GetSYSCLKSource:
 190                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 191  00a4 c650c7        	ld	a,20679
 193  00a7 81            	ret	
 195                     ; 478 uint32_t CLK_GetClockFreq(void)
 195                     ; 479 {
 196  00a8               _CLK_GetClockFreq:
 197  00a8 5209          	subw	sp,#9
 198       00000009      OFST:	set	9
 200                     ; 480   uint32_t clockfrequency = 0;
 201                     ; 481   uint32_t sourcefrequency = 0;
 202  00aa 5f            	clrw	x
 203  00ab 1f07          	ldw	(OFST-2,sp),x
 204  00ad 1f05          	ldw	(OFST-4,sp),x
 205                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 206                     ; 483   uint8_t tmp = 0, presc = 0;
 208                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 209  00af c650c7        	ld	a,20679
 210  00b2 6b09          	ld	(OFST+0,sp),a
 211                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 212  00b4 a101          	cp	a,#1
 213                     ; 490     sourcefrequency = HSI_VALUE;
 215  00b6 2710          	jreq	LC002
 216                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 217  00b8 a102          	cp	a,#2
 218  00ba 2608          	jrne	L32
 219                     ; 494     sourcefrequency = LSI_VALUE;
 220  00bc ae9470        	ldw	x,#38000
 221  00bf 1f07          	ldw	(OFST-2,sp),x
 222  00c1 5f            	clrw	x
 224  00c2 200c          	jp	LC001
 225  00c4               L32:
 226                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 227  00c4 a104          	cp	a,#4
 228  00c6 260a          	jrne	L72
 229                     ; 498     sourcefrequency = HSE_VALUE;
 230  00c8               LC002:
 231  00c8 ae2400        	ldw	x,#9216
 232  00cb 1f07          	ldw	(OFST-2,sp),x
 233  00cd ae00f4        	ldw	x,#244
 234  00d0               LC001:
 235  00d0 1f05          	ldw	(OFST-4,sp),x
 237  00d2               L72:
 238                     ; 502     clockfrequency = LSE_VALUE;
 239                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 240  00d2 c650c0        	ld	a,20672
 241  00d5 a407          	and	a,#7
 242                     ; 507   presc = SYSDivFactor[tmp];
 243  00d7 5f            	clrw	x
 244  00d8 97            	ld	xl,a
 245  00d9 d60000        	ld	a,(_SYSDivFactor,x)
 246  00dc 6b09          	ld	(OFST+0,sp),a
 247                     ; 510   clockfrequency = sourcefrequency / presc;
 248  00de b703          	ld	c_lreg+3,a
 249  00e0 3f02          	clr	c_lreg+2
 250  00e2 3f01          	clr	c_lreg+1
 251  00e4 3f00          	clr	c_lreg
 252  00e6 96            	ldw	x,sp
 253  00e7 5c            	incw	x
 254  00e8 cd0000        	call	c_rtol
 256  00eb 96            	ldw	x,sp
 257  00ec 1c0005        	addw	x,#OFST-4
 258  00ef cd0000        	call	c_ltor
 260  00f2 96            	ldw	x,sp
 261  00f3 5c            	incw	x
 262  00f4 cd0000        	call	c_ludv
 264  00f7 96            	ldw	x,sp
 265  00f8 1c0005        	addw	x,#OFST-4
 266  00fb cd0000        	call	c_rtol
 268                     ; 512   return((uint32_t)clockfrequency);
 269  00fe 96            	ldw	x,sp
 270  00ff 1c0005        	addw	x,#OFST-4
 271  0102 cd0000        	call	c_ltor
 274  0105 5b09          	addw	sp,#9
 275  0107 81            	ret	
 277                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
 277                     ; 529 {
 278  0108               _CLK_SYSCLKDivConfig:
 280                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
 281                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
 282  0108 c750c0        	ld	20672,a
 283                     ; 534 }
 284  010b 81            	ret	
 286                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
 286                     ; 542 {
 287  010c               _CLK_SYSCLKSourceSwitchCmd:
 289                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
 290                     ; 546   if (NewState != DISABLE)
 291  010c 4d            	tnz	a
 292  010d 2705          	jreq	L33
 293                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
 294  010f 721250c9      	bset	20681,#1
 296  0113 81            	ret	
 297  0114               L33:
 298                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 299  0114 721350c9      	bres	20681,#1
 300                     ; 556 }
 301  0118 81            	ret	
 303                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
 303                     ; 617 {
 304  0119               _CLK_RTCClockConfig:
 305  0119 89            	pushw	x
 306       00000000      OFST:	set	0
 308                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
 309                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
 310                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
 311  011a 9f            	ld	a,xl
 312  011b 1a01          	or	a,(OFST+1,sp)
 313  011d c750c1        	ld	20673,a
 314                     ; 624 }
 315  0120 85            	popw	x
 316  0121 81            	ret	
 318                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
 318                     ; 636 {
 319  0122               _CLK_BEEPClockConfig:
 321                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
 322                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
 323  0122 c750cb        	ld	20683,a
 324                     ; 643 }
 325  0125 81            	ret	
 327                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 327                     ; 678 {
 328  0126               _CLK_PeripheralClockConfig:
 329  0126 89            	pushw	x
 330  0127 88            	push	a
 331       00000001      OFST:	set	1
 333                     ; 679   uint8_t reg = 0;
 334                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 335                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
 336                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
 337  0128 9e            	ld	a,xh
 338  0129 a4f0          	and	a,#240
 339  012b 6b01          	ld	(OFST+0,sp),a
 340                     ; 688   if ( reg == 0x00)
 341  012d 2633          	jrne	L73
 342                     ; 690     if (NewState != DISABLE)
 343  012f 7b03          	ld	a,(OFST+2,sp)
 344  0131 2717          	jreq	L14
 345                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 346  0133 7b02          	ld	a,(OFST+1,sp)
 347  0135 a40f          	and	a,#15
 348  0137 5f            	clrw	x
 349  0138 97            	ld	xl,a
 350  0139 a601          	ld	a,#1
 351  013b 5d            	tnzw	x
 352  013c 2704          	jreq	L44
 353  013e               L64:
 354  013e 48            	sll	a
 355  013f 5a            	decw	x
 356  0140 26fc          	jrne	L64
 357  0142               L44:
 358  0142 ca50c3        	or	a,20675
 359  0145 c750c3        	ld	20675,a
 361  0148 207a          	jra	L54
 362  014a               L14:
 363                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 364  014a 7b02          	ld	a,(OFST+1,sp)
 365  014c a40f          	and	a,#15
 366  014e 5f            	clrw	x
 367  014f 97            	ld	xl,a
 368  0150 a601          	ld	a,#1
 369  0152 5d            	tnzw	x
 370  0153 2704          	jreq	L05
 371  0155               L25:
 372  0155 48            	sll	a
 373  0156 5a            	decw	x
 374  0157 26fc          	jrne	L25
 375  0159               L05:
 376  0159 43            	cpl	a
 377  015a c450c3        	and	a,20675
 378  015d c750c3        	ld	20675,a
 379  0160 2062          	jra	L54
 380  0162               L73:
 381                     ; 701   else if (reg == 0x10)
 382  0162 a110          	cp	a,#16
 383  0164 2630          	jrne	L74
 384                     ; 703     if (NewState != DISABLE)
 385  0166 7b03          	ld	a,(OFST+2,sp)
 386  0168 2714          	jreq	L15
 387                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 388  016a 7b02          	ld	a,(OFST+1,sp)
 389  016c a40f          	and	a,#15
 390  016e 5f            	clrw	x
 391  016f 97            	ld	xl,a
 392  0170 a601          	ld	a,#1
 393  0172 5d            	tnzw	x
 394  0173 2704          	jreq	L45
 395  0175               L65:
 396  0175 48            	sll	a
 397  0176 5a            	decw	x
 398  0177 26fc          	jrne	L65
 399  0179               L45:
 400  0179 ca50c4        	or	a,20676
 402  017c 2013          	jp	LC004
 403  017e               L15:
 404                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 405  017e 7b02          	ld	a,(OFST+1,sp)
 406  0180 a40f          	and	a,#15
 407  0182 5f            	clrw	x
 408  0183 97            	ld	xl,a
 409  0184 a601          	ld	a,#1
 410  0186 5d            	tnzw	x
 411  0187 2704          	jreq	L06
 412  0189               L26:
 413  0189 48            	sll	a
 414  018a 5a            	decw	x
 415  018b 26fc          	jrne	L26
 416  018d               L06:
 417  018d 43            	cpl	a
 418  018e c450c4        	and	a,20676
 419  0191               LC004:
 420  0191 c750c4        	ld	20676,a
 421  0194 202e          	jra	L54
 422  0196               L74:
 423                     ; 716     if (NewState != DISABLE)
 424  0196 7b03          	ld	a,(OFST+2,sp)
 425  0198 2714          	jreq	L75
 426                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 427  019a 7b02          	ld	a,(OFST+1,sp)
 428  019c a40f          	and	a,#15
 429  019e 5f            	clrw	x
 430  019f 97            	ld	xl,a
 431  01a0 a601          	ld	a,#1
 432  01a2 5d            	tnzw	x
 433  01a3 2704          	jreq	L46
 434  01a5               L66:
 435  01a5 48            	sll	a
 436  01a6 5a            	decw	x
 437  01a7 26fc          	jrne	L66
 438  01a9               L46:
 439  01a9 ca50d0        	or	a,20688
 441  01ac 2013          	jp	LC003
 442  01ae               L75:
 443                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 444  01ae 7b02          	ld	a,(OFST+1,sp)
 445  01b0 a40f          	and	a,#15
 446  01b2 5f            	clrw	x
 447  01b3 97            	ld	xl,a
 448  01b4 a601          	ld	a,#1
 449  01b6 5d            	tnzw	x
 450  01b7 2704          	jreq	L07
 451  01b9               L27:
 452  01b9 48            	sll	a
 453  01ba 5a            	decw	x
 454  01bb 26fc          	jrne	L27
 455  01bd               L07:
 456  01bd 43            	cpl	a
 457  01be c450d0        	and	a,20688
 458  01c1               LC003:
 459  01c1 c750d0        	ld	20688,a
 460  01c4               L54:
 461                     ; 727 }
 462  01c4 5b03          	addw	sp,#3
 463  01c6 81            	ret	
 465                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
 465                     ; 766 {
 466  01c7               _CLK_LSEClockSecuritySystemEnable:
 468                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
 469  01c7 72105190      	bset	20880,#0
 470                     ; 769 }
 471  01cb 81            	ret	
 473                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
 473                     ; 778 {
 474  01cc               _CLK_RTCCLKSwitchOnLSEFailureEnable:
 476                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
 477  01cc 72125190      	bset	20880,#1
 478                     ; 781 }
 479  01d0 81            	ret	
 481                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
 481                     ; 808 {
 482  01d1               _CLK_HaltConfig:
 483  01d1 89            	pushw	x
 484       00000000      OFST:	set	0
 486                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
 487                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
 488                     ; 813   if (NewState != DISABLE)
 489  01d2 9f            	ld	a,xl
 490  01d3 4d            	tnz	a
 491  01d4 2706          	jreq	L36
 492                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
 493  01d6 9e            	ld	a,xh
 494  01d7 ca50c2        	or	a,20674
 496  01da 2006          	jra	L56
 497  01dc               L36:
 498                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
 499  01dc 7b01          	ld	a,(OFST+1,sp)
 500  01de 43            	cpl	a
 501  01df c450c2        	and	a,20674
 502  01e2               L56:
 503  01e2 c750c2        	ld	20674,a
 504                     ; 821 }
 505  01e5 85            	popw	x
 506  01e6 81            	ret	
 508                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
 508                     ; 832 {
 509  01e7               _CLK_MainRegulatorCmd:
 511                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
 512                     ; 836   if (NewState != DISABLE)
 513  01e7 4d            	tnz	a
 514  01e8 2705          	jreq	L76
 515                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
 516  01ea 721350cf      	bres	20687,#1
 518  01ee 81            	ret	
 519  01ef               L76:
 520                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
 521  01ef 721250cf      	bset	20687,#1
 522                     ; 846 }
 523  01f3 81            	ret	
 525                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
 525                     ; 876 {
 526  01f4               _CLK_ITConfig:
 527  01f4 89            	pushw	x
 528       00000000      OFST:	set	0
 530                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
 531                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
 532                     ; 882   if (NewState != DISABLE)
 533  01f5 9f            	ld	a,xl
 534  01f6 4d            	tnz	a
 535  01f7 271d          	jreq	L37
 536                     ; 884     if (CLK_IT == CLK_IT_SWIF)
 537  01f9 9e            	ld	a,xh
 538  01fa a11c          	cp	a,#28
 539  01fc 2606          	jrne	L57
 540                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
 541  01fe 721450c9      	bset	20681,#2
 543  0202 202c          	jra	L501
 544  0204               L57:
 545                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
 546  0204 7b01          	ld	a,(OFST+1,sp)
 547  0206 a12c          	cp	a,#44
 548  0208 2606          	jrne	L101
 549                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
 550  020a 72145190      	bset	20880,#2
 552  020e 2020          	jra	L501
 553  0210               L101:
 554                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
 555  0210 721450ca      	bset	20682,#2
 556  0214 201a          	jra	L501
 557  0216               L37:
 558                     ; 902     if (CLK_IT == CLK_IT_SWIF)
 559  0216 7b01          	ld	a,(OFST+1,sp)
 560  0218 a11c          	cp	a,#28
 561  021a 2606          	jrne	L701
 562                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
 563  021c 721550c9      	bres	20681,#2
 565  0220 200e          	jra	L501
 566  0222               L701:
 567                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
 568  0222 a12c          	cp	a,#44
 569  0224 2606          	jrne	L311
 570                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
 571  0226 72155190      	bres	20880,#2
 573  022a 2004          	jra	L501
 574  022c               L311:
 575                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
 576  022c 721550ca      	bres	20682,#2
 577  0230               L501:
 578                     ; 918 }
 579  0230 85            	popw	x
 580  0231 81            	ret	
 582                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
 582                     ; 946 {
 583  0232               _CLK_GetFlagStatus:
 584  0232 88            	push	a
 585  0233 89            	pushw	x
 586       00000002      OFST:	set	2
 588                     ; 947   uint8_t reg = 0;
 589                     ; 948   uint8_t pos = 0;
 590                     ; 949   FlagStatus bitstatus = RESET;
 591                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
 592                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
 593  0234 a4f0          	and	a,#240
 594  0236 6b02          	ld	(OFST+0,sp),a
 595                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
 596  0238 7b03          	ld	a,(OFST+1,sp)
 597  023a a40f          	and	a,#15
 598  023c 6b01          	ld	(OFST-1,sp),a
 599                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
 600  023e 7b02          	ld	a,(OFST+0,sp)
 601  0240 2605          	jrne	L711
 602                     ; 962     reg = CLK->CRTCR;
 603  0242 c650c1        	ld	a,20673
 605  0245 2042          	jra	L121
 606  0247               L711:
 607                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
 608  0247 a110          	cp	a,#16
 609  0249 2605          	jrne	L321
 610                     ; 966     reg = CLK->ICKCR;
 611  024b c650c2        	ld	a,20674
 613  024e 2039          	jra	L121
 614  0250               L321:
 615                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
 616  0250 a120          	cp	a,#32
 617  0252 2605          	jrne	L721
 618                     ; 970     reg = CLK->CCOR;
 619  0254 c650c5        	ld	a,20677
 621  0257 2030          	jra	L121
 622  0259               L721:
 623                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
 624  0259 a130          	cp	a,#48
 625  025b 2605          	jrne	L331
 626                     ; 974     reg = CLK->ECKCR;
 627  025d c650c6        	ld	a,20678
 629  0260 2027          	jra	L121
 630  0262               L331:
 631                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
 632  0262 a140          	cp	a,#64
 633  0264 2605          	jrne	L731
 634                     ; 978     reg = CLK->SWCR;
 635  0266 c650c9        	ld	a,20681
 637  0269 201e          	jra	L121
 638  026b               L731:
 639                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
 640  026b a150          	cp	a,#80
 641  026d 2605          	jrne	L341
 642                     ; 982     reg = CLK->CSSR;
 643  026f c650ca        	ld	a,20682
 645  0272 2015          	jra	L121
 646  0274               L341:
 647                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
 648  0274 a170          	cp	a,#112
 649  0276 2605          	jrne	L741
 650                     ; 986     reg = CLK->REGCSR;
 651  0278 c650cf        	ld	a,20687
 653  027b 200c          	jra	L121
 654  027d               L741:
 655                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
 656  027d a180          	cp	a,#128
 657  027f 2605          	jrne	L351
 658                     ; 990     reg = CSSLSE->CSR;
 659  0281 c65190        	ld	a,20880
 661  0284 2003          	jra	L121
 662  0286               L351:
 663                     ; 994     reg = CLK->CBEEPR;
 664  0286 c650cb        	ld	a,20683
 665  0289               L121:
 666  0289 6b02          	ld	(OFST+0,sp),a
 667                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
 668  028b 5f            	clrw	x
 669  028c 7b01          	ld	a,(OFST-1,sp)
 670  028e 97            	ld	xl,a
 671  028f a601          	ld	a,#1
 672  0291 5d            	tnzw	x
 673  0292 2704          	jreq	L011
 674  0294               L211:
 675  0294 48            	sll	a
 676  0295 5a            	decw	x
 677  0296 26fc          	jrne	L211
 678  0298               L011:
 679  0298 1402          	and	a,(OFST+0,sp)
 680  029a 2702          	jreq	L751
 681                     ; 1000     bitstatus = SET;
 682  029c a601          	ld	a,#1
 684  029e               L751:
 685                     ; 1004     bitstatus = RESET;
 686                     ; 1008   return((FlagStatus)bitstatus);
 688  029e 5b03          	addw	sp,#3
 689  02a0 81            	ret	
 691                     ; 1016 void CLK_ClearFlag(void)
 691                     ; 1017 {
 692  02a1               _CLK_ClearFlag:
 694                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
 695  02a1 72175190      	bres	20880,#3
 696                     ; 1021 }
 697  02a5 81            	ret	
 699                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
 699                     ; 1033 {
 700  02a6               _CLK_GetITStatus:
 701  02a6 88            	push	a
 702  02a7 88            	push	a
 703       00000001      OFST:	set	1
 705                     ; 1035   ITStatus bitstatus = RESET;
 706                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
 707                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
 708  02a8 a11c          	cp	a,#28
 709  02aa 2605          	jrne	L361
 710                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 711  02ac c450c9        	and	a,20681
 712                     ; 1045       bitstatus = SET;
 714  02af 2009          	jp	LC007
 715                     ; 1049       bitstatus = RESET;
 716  02b1               L361:
 717                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
 718  02b1 a12c          	cp	a,#44
 719  02b3 260d          	jrne	L371
 720                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 721  02b5 c65190        	ld	a,20880
 722  02b8 1402          	and	a,(OFST+1,sp)
 723  02ba               LC007:
 724  02ba a10c          	cp	a,#12
 725  02bc 260d          	jrne	L302
 726                     ; 1057       bitstatus = SET;
 727  02be               LC006:
 728  02be a601          	ld	a,#1
 730  02c0 200a          	jra	L171
 731                     ; 1061       bitstatus = RESET;
 732  02c2               L371:
 733                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 734  02c2 c650ca        	ld	a,20682
 735  02c5 1402          	and	a,(OFST+1,sp)
 736  02c7 a10c          	cp	a,#12
 737                     ; 1069       bitstatus = SET;
 739  02c9 27f3          	jreq	LC006
 740  02cb               L302:
 741                     ; 1073       bitstatus = RESET;
 742  02cb 4f            	clr	a
 743  02cc               L171:
 744                     ; 1078   return bitstatus;
 746  02cc 85            	popw	x
 747  02cd 81            	ret	
 749                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
 749                     ; 1090 {
 750  02ce               _CLK_ClearITPendingBit:
 752                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
 753                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
 754  02ce a4f0          	and	a,#240
 755  02d0 a120          	cp	a,#32
 756  02d2 2605          	jrne	L702
 757                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
 758  02d4 72175190      	bres	20880,#3
 760  02d8 81            	ret	
 761  02d9               L702:
 762                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
 763  02d9 721750c9      	bres	20681,#3
 764                     ; 1105 }
 765  02dd 81            	ret	
 767                     	xdef	_SYSDivFactor
 768                     	xdef	_CLK_ClearITPendingBit
 769                     	xdef	_CLK_GetITStatus
 770                     	xdef	_CLK_ClearFlag
 771                     	xdef	_CLK_GetFlagStatus
 772                     	xdef	_CLK_ITConfig
 773                     	xdef	_CLK_MainRegulatorCmd
 774                     	xdef	_CLK_HaltConfig
 775                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
 776                     	xdef	_CLK_LSEClockSecuritySystemEnable
 777                     	xdef	_CLK_PeripheralClockConfig
 778                     	xdef	_CLK_BEEPClockConfig
 779                     	xdef	_CLK_RTCClockConfig
 780                     	xdef	_CLK_SYSCLKSourceSwitchCmd
 781                     	xdef	_CLK_SYSCLKDivConfig
 782                     	xdef	_CLK_GetClockFreq
 783                     	xdef	_CLK_GetSYSCLKSource
 784                     	xdef	_CLK_SYSCLKSourceConfig
 785                     	xdef	_CLK_CCOConfig
 786                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
 787                     	xdef	_CLK_ClockSecuritySystemEnable
 788                     	xdef	_CLK_LSEConfig
 789                     	xdef	_CLK_HSEConfig
 790                     	xdef	_CLK_LSICmd
 791                     	xdef	_CLK_AdjustHSICalibrationValue
 792                     	xdef	_CLK_HSICmd
 793                     	xdef	_CLK_DeInit
 794                     	xref.b	c_lreg
 795                     	xref.b	c_x
 796                     	xref	c_ludv
 797                     	xref	c_rtol
 798                     	xref	c_ltor
 799                     	end
