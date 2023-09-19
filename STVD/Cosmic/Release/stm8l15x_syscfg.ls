   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 119 void SYSCFG_RIDeInit(void)
  17                     ; 120 {
  18                     	scross	off
  19  0000               _SYSCFG_RIDeInit:
  21                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  22  0000 725f5431      	clr	21553
  23                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  24  0004 725f5432      	clr	21554
  25                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  26  0008 725f5439      	clr	21561
  27                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  28  000c 725f543a      	clr	21562
  29                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  30  0010 725f543b      	clr	21563
  31                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  32  0014 725f5457      	clr	21591
  33                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  34  0018 725f543d      	clr	21565
  35                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  36  001c 725f543e      	clr	21566
  37                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  38  0020 725f543f      	clr	21567
  39                     ; 130 }
  40  0024 81            	ret	
  42                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
  42                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
  42                     ; 144 {
  43  0025               _SYSCFG_RITIMInputCaptureConfig:
  44  0025 89            	pushw	x
  45       00000000      OFST:	set	0
  47                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
  48                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
  49                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
  50  0026 9e            	ld	a,xh
  51  0027 a102          	cp	a,#2
  52  0029 2606          	jrne	L3
  53                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
  54  002b 9f            	ld	a,xl
  55  002c c75431        	ld	21553,a
  57  002f 2005          	jra	L5
  58  0031               L3:
  59                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
  60  0031 7b02          	ld	a,(OFST+2,sp)
  61  0033 c75432        	ld	21554,a
  62  0036               L5:
  63                     ; 161 }
  64  0036 85            	popw	x
  65  0037 81            	ret	
  67                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
  67                     ; 185                                  FunctionalState NewState)
  67                     ; 186 {
  68  0038               _SYSCFG_RIAnalogSwitchConfig:
  69  0038 89            	pushw	x
  70  0039 89            	pushw	x
  71       00000002      OFST:	set	2
  73                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
  74                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
  75                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
  76                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
  77  003a 9e            	ld	a,xh
  78  003b a4f0          	and	a,#240
  79  003d 6b01          	ld	(OFST-1,sp),a
  80                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
  81  003f 7b03          	ld	a,(OFST+1,sp)
  82  0041 a40f          	and	a,#15
  83  0043 6b02          	ld	(OFST+0,sp),a
  84                     ; 199   if (NewState != DISABLE)
  85  0045 7b04          	ld	a,(OFST+2,sp)
  86  0047 272a          	jreq	L7
  87                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
  88  0049 7b01          	ld	a,(OFST-1,sp)
  89  004b a110          	cp	a,#16
  90  004d 2612          	jrne	L11
  91                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
  92  004f 7b02          	ld	a,(OFST+0,sp)
  93  0051 5f            	clrw	x
  94  0052 97            	ld	xl,a
  95  0053 a601          	ld	a,#1
  96  0055 5d            	tnzw	x
  97  0056 2704          	jreq	L01
  98  0058               L21:
  99  0058 48            	sll	a
 100  0059 5a            	decw	x
 101  005a 26fc          	jrne	L21
 102  005c               L01:
 103  005c ca543d        	or	a,21565
 105  005f 2029          	jp	LC002
 106  0061               L11:
 107                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 108  0061 7b02          	ld	a,(OFST+0,sp)
 109  0063 5f            	clrw	x
 110  0064 97            	ld	xl,a
 111  0065 a601          	ld	a,#1
 112  0067 5d            	tnzw	x
 113  0068 2704          	jreq	L41
 114  006a               L61:
 115  006a 48            	sll	a
 116  006b 5a            	decw	x
 117  006c 26fc          	jrne	L61
 118  006e               L41:
 119  006e ca543e        	or	a,21566
 120  0071 202d          	jp	LC001
 121  0073               L7:
 122                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 123  0073 7b01          	ld	a,(OFST-1,sp)
 124  0075 a110          	cp	a,#16
 125  0077 2616          	jrne	L71
 126                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 127  0079 7b02          	ld	a,(OFST+0,sp)
 128  007b 5f            	clrw	x
 129  007c 97            	ld	xl,a
 130  007d a601          	ld	a,#1
 131  007f 5d            	tnzw	x
 132  0080 2704          	jreq	L02
 133  0082               L22:
 134  0082 48            	sll	a
 135  0083 5a            	decw	x
 136  0084 26fc          	jrne	L22
 137  0086               L02:
 138  0086 43            	cpl	a
 139  0087 c4543d        	and	a,21565
 140  008a               LC002:
 141  008a c7543d        	ld	21565,a
 143  008d 2014          	jra	L51
 144  008f               L71:
 145                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 146  008f 7b02          	ld	a,(OFST+0,sp)
 147  0091 5f            	clrw	x
 148  0092 97            	ld	xl,a
 149  0093 a601          	ld	a,#1
 150  0095 5d            	tnzw	x
 151  0096 2704          	jreq	L42
 152  0098               L62:
 153  0098 48            	sll	a
 154  0099 5a            	decw	x
 155  009a 26fc          	jrne	L62
 156  009c               L42:
 157  009c 43            	cpl	a
 158  009d c4543e        	and	a,21566
 159  00a0               LC001:
 160  00a0 c7543e        	ld	21566,a
 161  00a3               L51:
 162                     ; 225 }
 163  00a3 5b04          	addw	sp,#4
 164  00a5 81            	ret	
 166                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 166                     ; 235                              FunctionalState NewState)
 166                     ; 236 {
 167  00a6               _SYSCFG_RIIOSwitchConfig:
 168  00a6 89            	pushw	x
 169  00a7 89            	pushw	x
 170       00000002      OFST:	set	2
 172                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 173                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 174                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 175                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 176  00a8 9e            	ld	a,xh
 177  00a9 a40f          	and	a,#15
 178  00ab 6b02          	ld	(OFST+0,sp),a
 179                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 180  00ad 7b03          	ld	a,(OFST+1,sp)
 181  00af a4f0          	and	a,#240
 182  00b1 6b01          	ld	(OFST-1,sp),a
 183                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 184  00b3 a110          	cp	a,#16
 185  00b5 2631          	jrne	L32
 186                     ; 252     if (NewState != DISABLE)
 187  00b7 7b04          	ld	a,(OFST+2,sp)
 188  00b9 2716          	jreq	L52
 189                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 190  00bb 7b02          	ld	a,(OFST+0,sp)
 191  00bd 5f            	clrw	x
 192  00be 97            	ld	xl,a
 193  00bf a601          	ld	a,#1
 194  00c1 5d            	tnzw	x
 195  00c2 2704          	jreq	L23
 196  00c4               L43:
 197  00c4 48            	sll	a
 198  00c5 5a            	decw	x
 199  00c6 26fc          	jrne	L43
 200  00c8               L23:
 201  00c8 ca5439        	or	a,21561
 202  00cb c75439        	ld	21561,a
 204  00ce cc0175        	jra	L13
 205  00d1               L52:
 206                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 207  00d1 7b02          	ld	a,(OFST+0,sp)
 208  00d3 5f            	clrw	x
 209  00d4 97            	ld	xl,a
 210  00d5 a601          	ld	a,#1
 211  00d7 5d            	tnzw	x
 212  00d8 2704          	jreq	L63
 213  00da               L04:
 214  00da 48            	sll	a
 215  00db 5a            	decw	x
 216  00dc 26fc          	jrne	L04
 217  00de               L63:
 218  00de 43            	cpl	a
 219  00df c45439        	and	a,21561
 220  00e2 c75439        	ld	21561,a
 221  00e5 cc0175        	jra	L13
 222  00e8               L32:
 223                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
 224  00e8 a120          	cp	a,#32
 225  00ea 262f          	jrne	L33
 226                     ; 267     if (NewState != DISABLE)
 227  00ec 7b04          	ld	a,(OFST+2,sp)
 228  00ee 2715          	jreq	L53
 229                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 230  00f0 7b02          	ld	a,(OFST+0,sp)
 231  00f2 5f            	clrw	x
 232  00f3 97            	ld	xl,a
 233  00f4 a601          	ld	a,#1
 234  00f6 5d            	tnzw	x
 235  00f7 2704          	jreq	L24
 236  00f9               L44:
 237  00f9 48            	sll	a
 238  00fa 5a            	decw	x
 239  00fb 26fc          	jrne	L44
 240  00fd               L24:
 241  00fd ca543a        	or	a,21562
 242  0100 c7543a        	ld	21562,a
 244  0103 2070          	jra	L13
 245  0105               L53:
 246                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
 247  0105 7b02          	ld	a,(OFST+0,sp)
 248  0107 5f            	clrw	x
 249  0108 97            	ld	xl,a
 250  0109 a601          	ld	a,#1
 251  010b 5d            	tnzw	x
 252  010c 2704          	jreq	L64
 253  010e               L05:
 254  010e 48            	sll	a
 255  010f 5a            	decw	x
 256  0110 26fc          	jrne	L05
 257  0112               L64:
 258  0112 43            	cpl	a
 259  0113 c4543a        	and	a,21562
 260  0116 c7543a        	ld	21562,a
 261  0119 205a          	jra	L13
 262  011b               L33:
 263                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
 264  011b a130          	cp	a,#48
 265  011d 262c          	jrne	L34
 266                     ; 282     if (NewState != DISABLE)
 267  011f 7b04          	ld	a,(OFST+2,sp)
 268  0121 2712          	jreq	L54
 269                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 270  0123 7b02          	ld	a,(OFST+0,sp)
 271  0125 5f            	clrw	x
 272  0126 97            	ld	xl,a
 273  0127 a601          	ld	a,#1
 274  0129 5d            	tnzw	x
 275  012a 2704          	jreq	L25
 276  012c               L45:
 277  012c 48            	sll	a
 278  012d 5a            	decw	x
 279  012e 26fc          	jrne	L45
 280  0130               L25:
 281  0130 ca543b        	or	a,21563
 283  0133 2011          	jp	LC004
 284  0135               L54:
 285                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
 286  0135 7b02          	ld	a,(OFST+0,sp)
 287  0137 5f            	clrw	x
 288  0138 97            	ld	xl,a
 289  0139 a601          	ld	a,#1
 290  013b 5d            	tnzw	x
 291  013c 2704          	jreq	L65
 292  013e               L06:
 293  013e 48            	sll	a
 294  013f 5a            	decw	x
 295  0140 26fc          	jrne	L06
 296  0142               L65:
 297  0142 43            	cpl	a
 298  0143 c4543b        	and	a,21563
 299  0146               LC004:
 300  0146 c7543b        	ld	21563,a
 301  0149 202a          	jra	L13
 302  014b               L34:
 303                     ; 297     if (NewState != DISABLE)
 304  014b 7b04          	ld	a,(OFST+2,sp)
 305  014d 2712          	jreq	L35
 306                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 307  014f 7b02          	ld	a,(OFST+0,sp)
 308  0151 5f            	clrw	x
 309  0152 97            	ld	xl,a
 310  0153 a601          	ld	a,#1
 311  0155 5d            	tnzw	x
 312  0156 2704          	jreq	L26
 313  0158               L46:
 314  0158 48            	sll	a
 315  0159 5a            	decw	x
 316  015a 26fc          	jrne	L46
 317  015c               L26:
 318  015c ca5457        	or	a,21591
 320  015f 2011          	jp	LC003
 321  0161               L35:
 322                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
 323  0161 7b02          	ld	a,(OFST+0,sp)
 324  0163 5f            	clrw	x
 325  0164 97            	ld	xl,a
 326  0165 a601          	ld	a,#1
 327  0167 5d            	tnzw	x
 328  0168 2704          	jreq	L66
 329  016a               L07:
 330  016a 48            	sll	a
 331  016b 5a            	decw	x
 332  016c 26fc          	jrne	L07
 333  016e               L66:
 334  016e 43            	cpl	a
 335  016f c45457        	and	a,21591
 336  0172               LC003:
 337  0172 c75457        	ld	21591,a
 338  0175               L13:
 339                     ; 308 }
 340  0175 5b04          	addw	sp,#4
 341  0177 81            	ret	
 343                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
 343                     ; 321 {
 344  0178               _SYSCFG_RIResistorConfig:
 345  0178 89            	pushw	x
 346       00000000      OFST:	set	0
 348                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
 349                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 350                     ; 326   if (NewState != DISABLE)
 351  0179 9f            	ld	a,xl
 352  017a 4d            	tnz	a
 353  017b 2706          	jreq	L75
 354                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
 355  017d 9e            	ld	a,xh
 356  017e ca543f        	or	a,21567
 358  0181 2006          	jra	L16
 359  0183               L75:
 360                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
 361  0183 7b01          	ld	a,(OFST+1,sp)
 362  0185 43            	cpl	a
 363  0186 c4543f        	and	a,21567
 364  0189               L16:
 365  0189 c7543f        	ld	21567,a
 366                     ; 336 }
 367  018c 85            	popw	x
 368  018d 81            	ret	
 370                     ; 368 void SYSCFG_REMAPDeInit(void)
 370                     ; 369 {
 371  018e               _SYSCFG_REMAPDeInit:
 373                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
 374  018e 350c509e      	mov	20638,#12
 375                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
 376  0192 725f509f      	clr	20639
 377                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
 378  0196 725f509d      	clr	20637
 379                     ; 378 }
 380  019a 81            	ret	
 382                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
 382                     ; 412 {
 383  019b               _SYSCFG_REMAPPinConfig:
 384  019b 89            	pushw	x
 385  019c 88            	push	a
 386       00000001      OFST:	set	1
 388                     ; 413   uint8_t regindex = 0;
 389                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
 390                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
 391                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
 392  019d 9e            	ld	a,xh
 393  019e 6b01          	ld	(OFST+0,sp),a
 394                     ; 422   if (regindex == 0x01)
 395  01a0 a101          	cp	a,#1
 396  01a2 261c          	jrne	L36
 397                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
 398  01a4 a610          	ld	a,#16
 399  01a6 42            	mul	x,a
 400  01a7 9f            	ld	a,xl
 401  01a8 aa0f          	or	a,#15
 402  01aa c4509e        	and	a,20638
 403  01ad c7509e        	ld	20638,a
 404                     ; 425     if (NewState != DISABLE)
 405  01b0 7b06          	ld	a,(OFST+5,sp)
 406  01b2 273a          	jreq	L76
 407                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
 408  01b4 7b03          	ld	a,(OFST+2,sp)
 409  01b6 a4f0          	and	a,#240
 410  01b8 ca509e        	or	a,20638
 411  01bb c7509e        	ld	20638,a
 412  01be 202e          	jra	L76
 413  01c0               L36:
 414                     ; 431   else if (regindex == 0x02)
 415  01c0 a102          	cp	a,#2
 416  01c2 2616          	jrne	L17
 417                     ; 433     if (NewState != DISABLE)
 418  01c4 7b06          	ld	a,(OFST+5,sp)
 419  01c6 2707          	jreq	L37
 420                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
 421  01c8 c6509f        	ld	a,20639
 422  01cb 1a03          	or	a,(OFST+2,sp)
 424  01cd 2006          	jp	LC006
 425  01cf               L37:
 426                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
 427  01cf 7b03          	ld	a,(OFST+2,sp)
 428  01d1 43            	cpl	a
 429  01d2 c4509f        	and	a,20639
 430  01d5               LC006:
 431  01d5 c7509f        	ld	20639,a
 432  01d8 2014          	jra	L76
 433  01da               L17:
 434                     ; 445     if (NewState != DISABLE)
 435  01da 7b06          	ld	a,(OFST+5,sp)
 436  01dc 2707          	jreq	L101
 437                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
 438  01de c6509d        	ld	a,20637
 439  01e1 1a03          	or	a,(OFST+2,sp)
 441  01e3 2006          	jp	LC005
 442  01e5               L101:
 443                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
 444  01e5 7b03          	ld	a,(OFST+2,sp)
 445  01e7 43            	cpl	a
 446  01e8 c4509d        	and	a,20637
 447  01eb               LC005:
 448  01eb c7509d        	ld	20637,a
 449  01ee               L76:
 450                     ; 454 }
 451  01ee 5b03          	addw	sp,#3
 452  01f0 81            	ret	
 454                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
 454                     ; 471 {
 455  01f1               _SYSCFG_REMAPDMAChannelConfig:
 456  01f1 88            	push	a
 457       00000000      OFST:	set	0
 459                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
 460                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
 461  01f2 a5f0          	bcp	a,#240
 462  01f4 2707          	jreq	L501
 463                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
 464  01f6 c6509e        	ld	a,20638
 465  01f9 a4f3          	and	a,#243
 467  01fb 2005          	jra	L701
 468  01fd               L501:
 469                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
 470  01fd c6509e        	ld	a,20638
 471  0200 a4fc          	and	a,#252
 472  0202               L701:
 473  0202 c7509e        	ld	20638,a
 474                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
 475  0205 7b01          	ld	a,(OFST+1,sp)
 476  0207 a40f          	and	a,#15
 477  0209 ca509e        	or	a,20638
 478  020c c7509e        	ld	20638,a
 479                     ; 489 }
 480  020f 84            	pop	a
 481  0210 81            	ret	
 483                     	xdef	_SYSCFG_REMAPDMAChannelConfig
 484                     	xdef	_SYSCFG_REMAPPinConfig
 485                     	xdef	_SYSCFG_REMAPDeInit
 486                     	xdef	_SYSCFG_RIResistorConfig
 487                     	xdef	_SYSCFG_RIIOSwitchConfig
 488                     	xdef	_SYSCFG_RIAnalogSwitchConfig
 489                     	xdef	_SYSCFG_RITIMInputCaptureConfig
 490                     	xdef	_SYSCFG_RIDeInit
 491                     	end
