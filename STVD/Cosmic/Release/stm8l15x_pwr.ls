   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 82 void PWR_DeInit(void)
  17                     ; 83 {
  18                     	scross	off
  19  0000               _PWR_DeInit:
  21                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  22  0000 352050b2      	mov	20658,#32
  23                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  24  0004 725f50b3      	clr	20659
  25                     ; 86 }
  26  0008 81            	ret	
  28                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
  28                     ; 103 {
  29  0009               _PWR_PVDLevelConfig:
  30  0009 88            	push	a
  31       00000000      OFST:	set	0
  33                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
  34                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
  35  000a c650b2        	ld	a,20658
  36  000d a4f1          	and	a,#241
  37  000f c750b2        	ld	20658,a
  38                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
  39  0012 c650b2        	ld	a,20658
  40  0015 1a01          	or	a,(OFST+1,sp)
  41  0017 c750b2        	ld	20658,a
  42                     ; 113 }
  43  001a 84            	pop	a
  44  001b 81            	ret	
  46                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
  46                     ; 122 {
  47  001c               _PWR_PVDCmd:
  49                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
  50                     ; 126   if (NewState != DISABLE)
  51  001c 4d            	tnz	a
  52  001d 2705          	jreq	L3
  53                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
  54  001f 721050b2      	bset	20658,#0
  56  0023 81            	ret	
  57  0024               L3:
  58                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
  59  0024 721150b2      	bres	20658,#0
  60                     ; 136 }
  61  0028 81            	ret	
  63                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
  63                     ; 172 {
  64  0029               _PWR_FastWakeUpCmd:
  66                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
  67                     ; 176   if (NewState != DISABLE)
  68  0029 4d            	tnz	a
  69  002a 2705          	jreq	L7
  70                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
  71  002c 721450b3      	bset	20659,#2
  73  0030 81            	ret	
  74  0031               L7:
  75                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
  76  0031 721550b3      	bres	20659,#2
  77                     ; 186 }
  78  0035 81            	ret	
  80                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
  80                     ; 195 {
  81  0036               _PWR_UltraLowPowerCmd:
  83                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
  84                     ; 199   if (NewState != DISABLE)
  85  0036 4d            	tnz	a
  86  0037 2705          	jreq	L31
  87                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
  88  0039 721250b3      	bset	20659,#1
  90  003d 81            	ret	
  91  003e               L31:
  92                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
  93  003e 721350b3      	bres	20659,#1
  94                     ; 209 }
  95  0042 81            	ret	
  97                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
  97                     ; 233 {
  98  0043               _PWR_PVDITConfig:
 100                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 101                     ; 237   if (NewState != DISABLE)
 102  0043 4d            	tnz	a
 103  0044 2705          	jreq	L71
 104                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 105  0046 721850b2      	bset	20658,#4
 107  004a 81            	ret	
 108  004b               L71:
 109                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 110  004b 721950b2      	bres	20658,#4
 111                     ; 247 }
 112  004f 81            	ret	
 114                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 114                     ; 262 {
 115  0050               _PWR_GetFlagStatus:
 116  0050 88            	push	a
 117  0051 88            	push	a
 118       00000001      OFST:	set	1
 120                     ; 263   FlagStatus bitstatus = RESET;
 121                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 122                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 123  0052 a501          	bcp	a,#1
 124  0054 2709          	jreq	L32
 125                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 126  0056 720150b302    	btjf	20659,#0,L52
 127                     ; 272       bitstatus = SET;
 129  005b 2009          	jp	LC002
 130  005d               L52:
 131                     ; 276       bitstatus = RESET;
 132  005d 200b          	jp	L33
 133  005f               L32:
 134                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 135  005f c650b2        	ld	a,20658
 136  0062 1502          	bcp	a,(OFST+1,sp)
 137  0064 2704          	jreq	L33
 138                     ; 283       bitstatus = SET;
 139  0066               LC002:
 140  0066 a601          	ld	a,#1
 142  0068 2001          	jra	L13
 143  006a               L33:
 144                     ; 287       bitstatus = RESET;
 145  006a 4f            	clr	a
 146  006b               L13:
 147                     ; 292   return((FlagStatus)bitstatus);
 149  006b 85            	popw	x
 150  006c 81            	ret	
 152                     ; 300 void PWR_PVDClearFlag(void)
 152                     ; 301 {
 153  006d               _PWR_PVDClearFlag:
 155                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 156  006d 721a50b2      	bset	20658,#5
 157                     ; 304 }
 158  0071 81            	ret	
 160                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 160                     ; 312 {
 161  0072               _PWR_PVDGetITStatus:
 162  0072 89            	pushw	x
 163       00000002      OFST:	set	2
 165                     ; 313   ITStatus bitstatus = RESET;
 166                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 168                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 169  0073 c650b2        	ld	a,20658
 170  0076 a420          	and	a,#32
 171  0078 6b01          	ld	(OFST-1,sp),a
 172                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 173  007a c650b2        	ld	a,20658
 174  007d a410          	and	a,#16
 175  007f 6b02          	ld	(OFST+0,sp),a
 176                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 177  0081 7b01          	ld	a,(OFST-1,sp)
 178  0083 2708          	jreq	L73
 180  0085 7b02          	ld	a,(OFST+0,sp)
 181  0087 2704          	jreq	L73
 182                     ; 322     bitstatus = (ITStatus)SET;
 183  0089 a601          	ld	a,#1
 185  008b 2001          	jra	L14
 186  008d               L73:
 187                     ; 326     bitstatus = (ITStatus)RESET;
 188  008d 4f            	clr	a
 189  008e               L14:
 190                     ; 328   return ((ITStatus)bitstatus);
 192  008e 85            	popw	x
 193  008f 81            	ret	
 195                     ; 336 void PWR_PVDClearITPendingBit(void)
 195                     ; 337 {
 196  0090               _PWR_PVDClearITPendingBit:
 198                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 199  0090 721a50b2      	bset	20658,#5
 200                     ; 340 }
 201  0094 81            	ret	
 203                     	xdef	_PWR_PVDClearITPendingBit
 204                     	xdef	_PWR_PVDClearFlag
 205                     	xdef	_PWR_GetFlagStatus
 206                     	xdef	_PWR_PVDGetITStatus
 207                     	xdef	_PWR_PVDITConfig
 208                     	xdef	_PWR_UltraLowPowerCmd
 209                     	xdef	_PWR_FastWakeUpCmd
 210                     	xdef	_PWR_PVDCmd
 211                     	xdef	_PWR_PVDLevelConfig
 212                     	xdef	_PWR_DeInit
 213                     	end
