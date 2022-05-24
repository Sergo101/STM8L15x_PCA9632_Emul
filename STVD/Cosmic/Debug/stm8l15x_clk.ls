   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  22                     .const:	section	.text
  23  0000               _SYSDivFactor:
  24  0000 01            	dc.b	1
  25  0001 02            	dc.b	2
  26  0002 04            	dc.b	4
  27  0003 08            	dc.b	8
  28  0004 10            	dc.b	16
  57                     ; 120 void CLK_DeInit(void)
  57                     ; 121 {
  59                     .text:	section	.text,new
  60  0000               _CLK_DeInit:
  64                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  66  0000 351150c2      	mov	20674,#17
  67                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  69  0004 725f50c6      	clr	20678
  70                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  72  0008 725f50c1      	clr	20673
  73                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  75  000c 725f50cb      	clr	20683
  76                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  78  0010 350150c8      	mov	20680,#1
  79                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  81  0014 725f50c9      	clr	20681
  82                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  84  0018 350350c0      	mov	20672,#3
  85                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  87  001c 725f50c3      	clr	20675
  88                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  90  0020 358050c4      	mov	20676,#128
  91                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  93  0024 725f50d0      	clr	20688
  94                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  96  0028 725f50ca      	clr	20682
  97                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  99  002c 725f50c5      	clr	20677
 100                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 102  0030 725f50cd      	clr	20685
 103                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
 105  0034 725f50cc      	clr	20684
 106                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 108  0038 725f50ce      	clr	20686
 109                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 111  003c 35b950cf      	mov	20687,#185
 112                     ; 138 }
 115  0040 81            	ret	
 170                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 170                     ; 161 {
 171                     .text:	section	.text,new
 172  0000               _CLK_HSICmd:
 176                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 178                     ; 165   if (NewState != DISABLE)
 180  0000 4d            	tnz	a
 181  0001 2705          	jreq	L74
 182                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 184  0003 721050c2      	bset	20674,#0
 187  0007 81            	ret	
 188  0008               L74:
 189                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 191  0008 721150c2      	bres	20674,#0
 192                     ; 175 }
 195  000c 81            	ret	
 229                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 229                     ; 189 {
 230                     .text:	section	.text,new
 231  0000               _CLK_AdjustHSICalibrationValue:
 235                     ; 191   CLK->HSIUNLCKR = 0xAC;
 237  0000 35ac50ce      	mov	20686,#172
 238                     ; 192   CLK->HSIUNLCKR = 0x35;
 240  0004 353550ce      	mov	20686,#53
 241                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 243  0008 c750cd        	ld	20685,a
 244                     ; 196 }
 247  000b 81            	ret	
 282                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 282                     ; 213 {
 283                     .text:	section	.text,new
 284  0000               _CLK_LSICmd:
 288                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 290                     ; 218   if (NewState != DISABLE)
 292  0000 4d            	tnz	a
 293  0001 2705          	jreq	L501
 294                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 296  0003 721450c2      	bset	20674,#2
 299  0007 81            	ret	
 300  0008               L501:
 301                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 303  0008 721550c2      	bres	20674,#2
 304                     ; 228 }
 307  000c 81            	ret	
 369                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 369                     ; 250 {
 370                     .text:	section	.text,new
 371  0000               _CLK_HSEConfig:
 375                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 377                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 379  0000 721150c6      	bres	20678,#0
 380                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 382  0004 721950c6      	bres	20678,#4
 383                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 385  0008 ca50c6        	or	a,20678
 386  000b c750c6        	ld	20678,a
 387                     ; 263 }
 390  000e 81            	ret	
 452                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 452                     ; 281 {
 453                     .text:	section	.text,new
 454  0000               _CLK_LSEConfig:
 458                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 460                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 462  0000 721550c6      	bres	20678,#2
 463                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 465  0004 721b50c6      	bres	20678,#5
 466                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 468  0008 ca50c6        	or	a,20678
 469  000b c750c6        	ld	20678,a
 470                     ; 295 }
 473  000e 81            	ret	
 497                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 497                     ; 307 {
 498                     .text:	section	.text,new
 499  0000               _CLK_ClockSecuritySystemEnable:
 503                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 505  0000 721050ca      	bset	20682,#0
 506                     ; 310 }
 509  0004 81            	ret	
 545                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 545                     ; 318 {
 546                     .text:	section	.text,new
 547  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 551                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 553                     ; 322   if (NewState != DISABLE)
 555  0000 4d            	tnz	a
 556  0001 2705          	jreq	L712
 557                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 559  0003 721850ca      	bset	20682,#4
 562  0007 81            	ret	
 563  0008               L712:
 564                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 566  0008 721950ca      	bres	20682,#4
 567                     ; 332 }
 570  000c 81            	ret	
 711                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 711                     ; 357 {
 712                     .text:	section	.text,new
 713  0000               _CLK_CCOConfig:
 715  0000 89            	pushw	x
 716       00000000      OFST:	set	0
 719                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 721                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 723                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 725  0001 9f            	ld	a,xl
 726  0002 1a01          	or	a,(OFST+1,sp)
 727  0004 c750c5        	ld	20677,a
 728                     ; 364 }
 731  0007 85            	popw	x
 732  0008 81            	ret	
 806                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 806                     ; 417 {
 807                     .text:	section	.text,new
 808  0000               _CLK_SYSCLKSourceConfig:
 812                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 814                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 816  0000 c750c8        	ld	20680,a
 817                     ; 423 }
 820  0003 81            	ret	
 845                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 845                     ; 436 {
 846                     .text:	section	.text,new
 847  0000               _CLK_GetSYSCLKSource:
 851                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 853  0000 c650c7        	ld	a,20679
 856  0003 81            	ret	
 920                     ; 478 uint32_t CLK_GetClockFreq(void)
 920                     ; 479 {
 921                     .text:	section	.text,new
 922  0000               _CLK_GetClockFreq:
 924  0000 5209          	subw	sp,#9
 925       00000009      OFST:	set	9
 928                     ; 480   uint32_t clockfrequency = 0;
 930                     ; 481   uint32_t sourcefrequency = 0;
 932  0002 5f            	clrw	x
 933  0003 1f07          	ldw	(OFST-2,sp),x
 934  0005 1f05          	ldw	(OFST-4,sp),x
 936                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 938                     ; 483   uint8_t tmp = 0, presc = 0;
 942                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 944  0007 c650c7        	ld	a,20679
 945  000a 6b09          	ld	(OFST+0,sp),a
 947                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 949  000c a101          	cp	a,#1
 950                     ; 490     sourcefrequency = HSI_VALUE;
 952  000e 2710          	jreq	LC002
 953                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 955  0010 a102          	cp	a,#2
 956  0012 2608          	jrne	L104
 957                     ; 494     sourcefrequency = LSI_VALUE;
 959  0014 ae9470        	ldw	x,#38000
 960  0017 1f07          	ldw	(OFST-2,sp),x
 961  0019 5f            	clrw	x
 963  001a 200c          	jp	LC001
 964  001c               L104:
 965                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 967  001c a104          	cp	a,#4
 968  001e 260a          	jrne	L504
 969                     ; 498     sourcefrequency = HSE_VALUE;
 971  0020               LC002:
 973  0020 ae2400        	ldw	x,#9216
 974  0023 1f07          	ldw	(OFST-2,sp),x
 975  0025 ae00f4        	ldw	x,#244
 976  0028               LC001:
 977  0028 1f05          	ldw	(OFST-4,sp),x
 980  002a               L504:
 981                     ; 502     clockfrequency = LSE_VALUE;
 983                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 985  002a c650c0        	ld	a,20672
 986  002d a407          	and	a,#7
 988                     ; 507   presc = SYSDivFactor[tmp];
 990  002f 5f            	clrw	x
 991  0030 97            	ld	xl,a
 992  0031 d60000        	ld	a,(_SYSDivFactor,x)
 993  0034 6b09          	ld	(OFST+0,sp),a
 995                     ; 510   clockfrequency = sourcefrequency / presc;
 997  0036 b703          	ld	c_lreg+3,a
 998  0038 3f02          	clr	c_lreg+2
 999  003a 3f01          	clr	c_lreg+1
1000  003c 3f00          	clr	c_lreg
1001  003e 96            	ldw	x,sp
1002  003f 5c            	incw	x
1003  0040 cd0000        	call	c_rtol
1006  0043 96            	ldw	x,sp
1007  0044 1c0005        	addw	x,#OFST-4
1008  0047 cd0000        	call	c_ltor
1010  004a 96            	ldw	x,sp
1011  004b 5c            	incw	x
1012  004c cd0000        	call	c_ludv
1014  004f 96            	ldw	x,sp
1015  0050 1c0005        	addw	x,#OFST-4
1016  0053 cd0000        	call	c_rtol
1019                     ; 512   return((uint32_t)clockfrequency);
1021  0056 96            	ldw	x,sp
1022  0057 1c0005        	addw	x,#OFST-4
1023  005a cd0000        	call	c_ltor
1027  005d 5b09          	addw	sp,#9
1028  005f 81            	ret	
1126                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1126                     ; 529 {
1127                     .text:	section	.text,new
1128  0000               _CLK_SYSCLKDivConfig:
1132                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1134                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1136  0000 c750c0        	ld	20672,a
1137                     ; 534 }
1140  0003 81            	ret	
1176                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1176                     ; 542 {
1177                     .text:	section	.text,new
1178  0000               _CLK_SYSCLKSourceSwitchCmd:
1182                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1184                     ; 546   if (NewState != DISABLE)
1186  0000 4d            	tnz	a
1187  0001 2705          	jreq	L174
1188                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1190  0003 721250c9      	bset	20681,#1
1193  0007 81            	ret	
1194  0008               L174:
1195                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1197  0008 721350c9      	bres	20681,#1
1198                     ; 556 }
1201  000c 81            	ret	
1347                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1347                     ; 617 {
1348                     .text:	section	.text,new
1349  0000               _CLK_RTCClockConfig:
1351  0000 89            	pushw	x
1352       00000000      OFST:	set	0
1355                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1357                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1359                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1361  0001 9f            	ld	a,xl
1362  0002 1a01          	or	a,(OFST+1,sp)
1363  0004 c750c1        	ld	20673,a
1364                     ; 624 }
1367  0007 85            	popw	x
1368  0008 81            	ret	
1434                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1434                     ; 636 {
1435                     .text:	section	.text,new
1436  0000               _CLK_BEEPClockConfig:
1440                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1442                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1444  0000 c750cb        	ld	20683,a
1445                     ; 643 }
1448  0003 81            	ret	
1671                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1671                     ; 678 {
1672                     .text:	section	.text,new
1673  0000               _CLK_PeripheralClockConfig:
1675  0000 89            	pushw	x
1676  0001 88            	push	a
1677       00000001      OFST:	set	1
1680                     ; 679   uint8_t reg = 0;
1682                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1684                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1686                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1688  0002 9e            	ld	a,xh
1689  0003 a4f0          	and	a,#240
1690  0005 6b01          	ld	(OFST+0,sp),a
1692                     ; 688   if ( reg == 0x00)
1694  0007 2629          	jrne	L117
1695                     ; 690     if (NewState != DISABLE)
1697  0009 7b03          	ld	a,(OFST+2,sp)
1698  000b 2712          	jreq	L317
1699                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1701  000d 7b02          	ld	a,(OFST+1,sp)
1702  000f ad72          	call	LC005
1703  0011 2704          	jreq	L64
1704  0013               L05:
1705  0013 48            	sll	a
1706  0014 5a            	decw	x
1707  0015 26fc          	jrne	L05
1708  0017               L64:
1709  0017 ca50c3        	or	a,20675
1710  001a c750c3        	ld	20675,a
1712  001d 2061          	jra	L717
1713  001f               L317:
1714                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1716  001f 7b02          	ld	a,(OFST+1,sp)
1717  0021 ad60          	call	LC005
1718  0023 2704          	jreq	L25
1719  0025               L45:
1720  0025 48            	sll	a
1721  0026 5a            	decw	x
1722  0027 26fc          	jrne	L45
1723  0029               L25:
1724  0029 43            	cpl	a
1725  002a c450c3        	and	a,20675
1726  002d c750c3        	ld	20675,a
1727  0030 204e          	jra	L717
1728  0032               L117:
1729                     ; 701   else if (reg == 0x10)
1731  0032 a110          	cp	a,#16
1732  0034 2626          	jrne	L127
1733                     ; 703     if (NewState != DISABLE)
1735  0036 7b03          	ld	a,(OFST+2,sp)
1736  0038 270f          	jreq	L327
1737                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1739  003a 7b02          	ld	a,(OFST+1,sp)
1740  003c ad45          	call	LC005
1741  003e 2704          	jreq	L65
1742  0040               L06:
1743  0040 48            	sll	a
1744  0041 5a            	decw	x
1745  0042 26fc          	jrne	L06
1746  0044               L65:
1747  0044 ca50c4        	or	a,20676
1749  0047 200e          	jp	LC004
1750  0049               L327:
1751                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1753  0049 7b02          	ld	a,(OFST+1,sp)
1754  004b ad36          	call	LC005
1755  004d 2704          	jreq	L26
1756  004f               L46:
1757  004f 48            	sll	a
1758  0050 5a            	decw	x
1759  0051 26fc          	jrne	L46
1760  0053               L26:
1761  0053 43            	cpl	a
1762  0054 c450c4        	and	a,20676
1763  0057               LC004:
1764  0057 c750c4        	ld	20676,a
1765  005a 2024          	jra	L717
1766  005c               L127:
1767                     ; 716     if (NewState != DISABLE)
1769  005c 7b03          	ld	a,(OFST+2,sp)
1770  005e 270f          	jreq	L137
1771                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1773  0060 7b02          	ld	a,(OFST+1,sp)
1774  0062 ad1f          	call	LC005
1775  0064 2704          	jreq	L66
1776  0066               L07:
1777  0066 48            	sll	a
1778  0067 5a            	decw	x
1779  0068 26fc          	jrne	L07
1780  006a               L66:
1781  006a ca50d0        	or	a,20688
1783  006d 200e          	jp	LC003
1784  006f               L137:
1785                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1787  006f 7b02          	ld	a,(OFST+1,sp)
1788  0071 ad10          	call	LC005
1789  0073 2704          	jreq	L27
1790  0075               L47:
1791  0075 48            	sll	a
1792  0076 5a            	decw	x
1793  0077 26fc          	jrne	L47
1794  0079               L27:
1795  0079 43            	cpl	a
1796  007a c450d0        	and	a,20688
1797  007d               LC003:
1798  007d c750d0        	ld	20688,a
1799  0080               L717:
1800                     ; 727 }
1803  0080 5b03          	addw	sp,#3
1804  0082 81            	ret	
1805  0083               LC005:
1806  0083 a40f          	and	a,#15
1807  0085 5f            	clrw	x
1808  0086 97            	ld	xl,a
1809  0087 a601          	ld	a,#1
1810  0089 5d            	tnzw	x
1811  008a 81            	ret	
1835                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1835                     ; 766 {
1836                     .text:	section	.text,new
1837  0000               _CLK_LSEClockSecuritySystemEnable:
1841                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1843  0000 72105190      	bset	20880,#0
1844                     ; 769 }
1847  0004 81            	ret	
1871                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1871                     ; 778 {
1872                     .text:	section	.text,new
1873  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1877                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1879  0000 72125190      	bset	20880,#1
1880                     ; 781 }
1883  0004 81            	ret	
1958                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1958                     ; 808 {
1959                     .text:	section	.text,new
1960  0000               _CLK_HaltConfig:
1962  0000 89            	pushw	x
1963       00000000      OFST:	set	0
1966                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1968                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1970                     ; 813   if (NewState != DISABLE)
1972  0001 9f            	ld	a,xl
1973  0002 4d            	tnz	a
1974  0003 2706          	jreq	L1101
1975                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1977  0005 9e            	ld	a,xh
1978  0006 ca50c2        	or	a,20674
1980  0009 2006          	jra	L3101
1981  000b               L1101:
1982                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1984  000b 7b01          	ld	a,(OFST+1,sp)
1985  000d 43            	cpl	a
1986  000e c450c2        	and	a,20674
1987  0011               L3101:
1988  0011 c750c2        	ld	20674,a
1989                     ; 821 }
1992  0014 85            	popw	x
1993  0015 81            	ret	
2029                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2029                     ; 832 {
2030                     .text:	section	.text,new
2031  0000               _CLK_MainRegulatorCmd:
2035                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2037                     ; 836   if (NewState != DISABLE)
2039  0000 4d            	tnz	a
2040  0001 2705          	jreq	L3301
2041                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2043  0003 721350cf      	bres	20687,#1
2046  0007 81            	ret	
2047  0008               L3301:
2048                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2050  0008 721250cf      	bset	20687,#1
2051                     ; 846 }
2054  000c 81            	ret	
2126                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2126                     ; 876 {
2127                     .text:	section	.text,new
2128  0000               _CLK_ITConfig:
2130  0000 89            	pushw	x
2131       00000000      OFST:	set	0
2134                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2136                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2138                     ; 882   if (NewState != DISABLE)
2140  0001 9f            	ld	a,xl
2141  0002 4d            	tnz	a
2142  0003 271d          	jreq	L3701
2143                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2145  0005 9e            	ld	a,xh
2146  0006 a11c          	cp	a,#28
2147  0008 2606          	jrne	L5701
2148                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2150  000a 721450c9      	bset	20681,#2
2152  000e 202c          	jra	L5011
2153  0010               L5701:
2154                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2156  0010 7b01          	ld	a,(OFST+1,sp)
2157  0012 a12c          	cp	a,#44
2158  0014 2606          	jrne	L1011
2159                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2161  0016 72145190      	bset	20880,#2
2163  001a 2020          	jra	L5011
2164  001c               L1011:
2165                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2167  001c 721450ca      	bset	20682,#2
2168  0020 201a          	jra	L5011
2169  0022               L3701:
2170                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2172  0022 7b01          	ld	a,(OFST+1,sp)
2173  0024 a11c          	cp	a,#28
2174  0026 2606          	jrne	L7011
2175                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2177  0028 721550c9      	bres	20681,#2
2179  002c 200e          	jra	L5011
2180  002e               L7011:
2181                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2183  002e a12c          	cp	a,#44
2184  0030 2606          	jrne	L3111
2185                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2187  0032 72155190      	bres	20880,#2
2189  0036 2004          	jra	L5011
2190  0038               L3111:
2191                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2193  0038 721550ca      	bres	20682,#2
2194  003c               L5011:
2195                     ; 918 }
2198  003c 85            	popw	x
2199  003d 81            	ret	
2418                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2418                     ; 946 {
2419                     .text:	section	.text,new
2420  0000               _CLK_GetFlagStatus:
2422  0000 88            	push	a
2423  0001 89            	pushw	x
2424       00000002      OFST:	set	2
2427                     ; 947   uint8_t reg = 0;
2429                     ; 948   uint8_t pos = 0;
2431                     ; 949   FlagStatus bitstatus = RESET;
2433                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2435                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2437  0002 a4f0          	and	a,#240
2438  0004 6b02          	ld	(OFST+0,sp),a
2440                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2442  0006 7b03          	ld	a,(OFST+1,sp)
2443  0008 a40f          	and	a,#15
2444  000a 6b01          	ld	(OFST-1,sp),a
2446                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2448  000c 7b02          	ld	a,(OFST+0,sp)
2449  000e 2605          	jrne	L7221
2450                     ; 962     reg = CLK->CRTCR;
2452  0010 c650c1        	ld	a,20673
2454  0013 2042          	jra	L1321
2455  0015               L7221:
2456                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2458  0015 a110          	cp	a,#16
2459  0017 2605          	jrne	L3321
2460                     ; 966     reg = CLK->ICKCR;
2462  0019 c650c2        	ld	a,20674
2464  001c 2039          	jra	L1321
2465  001e               L3321:
2466                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2468  001e a120          	cp	a,#32
2469  0020 2605          	jrne	L7321
2470                     ; 970     reg = CLK->CCOR;
2472  0022 c650c5        	ld	a,20677
2474  0025 2030          	jra	L1321
2475  0027               L7321:
2476                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2478  0027 a130          	cp	a,#48
2479  0029 2605          	jrne	L3421
2480                     ; 974     reg = CLK->ECKCR;
2482  002b c650c6        	ld	a,20678
2484  002e 2027          	jra	L1321
2485  0030               L3421:
2486                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2488  0030 a140          	cp	a,#64
2489  0032 2605          	jrne	L7421
2490                     ; 978     reg = CLK->SWCR;
2492  0034 c650c9        	ld	a,20681
2494  0037 201e          	jra	L1321
2495  0039               L7421:
2496                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2498  0039 a150          	cp	a,#80
2499  003b 2605          	jrne	L3521
2500                     ; 982     reg = CLK->CSSR;
2502  003d c650ca        	ld	a,20682
2504  0040 2015          	jra	L1321
2505  0042               L3521:
2506                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2508  0042 a170          	cp	a,#112
2509  0044 2605          	jrne	L7521
2510                     ; 986     reg = CLK->REGCSR;
2512  0046 c650cf        	ld	a,20687
2514  0049 200c          	jra	L1321
2515  004b               L7521:
2516                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2518  004b a180          	cp	a,#128
2519  004d 2605          	jrne	L3621
2520                     ; 990     reg = CSSLSE->CSR;
2522  004f c65190        	ld	a,20880
2524  0052 2003          	jra	L1321
2525  0054               L3621:
2526                     ; 994     reg = CLK->CBEEPR;
2528  0054 c650cb        	ld	a,20683
2529  0057               L1321:
2530  0057 6b02          	ld	(OFST+0,sp),a
2532                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2534  0059 5f            	clrw	x
2535  005a 7b01          	ld	a,(OFST-1,sp)
2536  005c 97            	ld	xl,a
2537  005d a601          	ld	a,#1
2538  005f 5d            	tnzw	x
2539  0060 2704          	jreq	L211
2540  0062               L411:
2541  0062 48            	sll	a
2542  0063 5a            	decw	x
2543  0064 26fc          	jrne	L411
2544  0066               L211:
2545  0066 1402          	and	a,(OFST+0,sp)
2546  0068 2702          	jreq	L7621
2547                     ; 1000     bitstatus = SET;
2549  006a a601          	ld	a,#1
2552  006c               L7621:
2553                     ; 1004     bitstatus = RESET;
2556                     ; 1008   return((FlagStatus)bitstatus);
2560  006c 5b03          	addw	sp,#3
2561  006e 81            	ret	
2584                     ; 1016 void CLK_ClearFlag(void)
2584                     ; 1017 {
2585                     .text:	section	.text,new
2586  0000               _CLK_ClearFlag:
2590                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2592  0000 72175190      	bres	20880,#3
2593                     ; 1021 }
2596  0004 81            	ret	
2642                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2642                     ; 1033 {
2643                     .text:	section	.text,new
2644  0000               _CLK_GetITStatus:
2646  0000 88            	push	a
2647  0001 88            	push	a
2648       00000001      OFST:	set	1
2651                     ; 1035   ITStatus bitstatus = RESET;
2653                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2655                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2657  0002 a11c          	cp	a,#28
2658  0004 2605          	jrne	L5231
2659                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2661  0006 c450c9        	and	a,20681
2662                     ; 1045       bitstatus = SET;
2664  0009 2009          	jp	LC008
2665                     ; 1049       bitstatus = RESET;
2666  000b               L5231:
2667                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2669  000b a12c          	cp	a,#44
2670  000d 260d          	jrne	L5331
2671                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2673  000f c65190        	ld	a,20880
2674  0012 1402          	and	a,(OFST+1,sp)
2675  0014               LC008:
2676  0014 a10c          	cp	a,#12
2677  0016 260d          	jrne	L5431
2678                     ; 1057       bitstatus = SET;
2680  0018               LC007:
2683  0018 a601          	ld	a,#1
2686  001a 200a          	jra	L3331
2687                     ; 1061       bitstatus = RESET;
2688  001c               L5331:
2689                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2691  001c c650ca        	ld	a,20682
2692  001f 1402          	and	a,(OFST+1,sp)
2693  0021 a10c          	cp	a,#12
2694                     ; 1069       bitstatus = SET;
2696  0023 27f3          	jreq	LC007
2697  0025               L5431:
2698                     ; 1073       bitstatus = RESET;
2702  0025 4f            	clr	a
2704  0026               L3331:
2705                     ; 1078   return bitstatus;
2709  0026 85            	popw	x
2710  0027 81            	ret	
2746                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2746                     ; 1090 {
2747                     .text:	section	.text,new
2748  0000               _CLK_ClearITPendingBit:
2752                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2754                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2756  0000 a4f0          	and	a,#240
2757  0002 a120          	cp	a,#32
2758  0004 2605          	jrne	L7631
2759                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2761  0006 72175190      	bres	20880,#3
2764  000a 81            	ret	
2765  000b               L7631:
2766                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2768  000b 721750c9      	bres	20681,#3
2769                     ; 1105 }
2772  000f 81            	ret	
2797                     	xdef	_SYSDivFactor
2798                     	xdef	_CLK_ClearITPendingBit
2799                     	xdef	_CLK_GetITStatus
2800                     	xdef	_CLK_ClearFlag
2801                     	xdef	_CLK_GetFlagStatus
2802                     	xdef	_CLK_ITConfig
2803                     	xdef	_CLK_MainRegulatorCmd
2804                     	xdef	_CLK_HaltConfig
2805                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2806                     	xdef	_CLK_LSEClockSecuritySystemEnable
2807                     	xdef	_CLK_PeripheralClockConfig
2808                     	xdef	_CLK_BEEPClockConfig
2809                     	xdef	_CLK_RTCClockConfig
2810                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2811                     	xdef	_CLK_SYSCLKDivConfig
2812                     	xdef	_CLK_GetClockFreq
2813                     	xdef	_CLK_GetSYSCLKSource
2814                     	xdef	_CLK_SYSCLKSourceConfig
2815                     	xdef	_CLK_CCOConfig
2816                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2817                     	xdef	_CLK_ClockSecuritySystemEnable
2818                     	xdef	_CLK_LSEConfig
2819                     	xdef	_CLK_HSEConfig
2820                     	xdef	_CLK_LSICmd
2821                     	xdef	_CLK_AdjustHSICalibrationValue
2822                     	xdef	_CLK_HSICmd
2823                     	xdef	_CLK_DeInit
2824                     	xref.b	c_lreg
2825                     	xref.b	c_x
2844                     	xref	c_ludv
2845                     	xref	c_rtol
2846                     	xref	c_ltor
2847                     	end
