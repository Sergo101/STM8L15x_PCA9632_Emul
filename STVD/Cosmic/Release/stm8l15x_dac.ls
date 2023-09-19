   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 142 void DAC_DeInit(void)
  17                     ; 143 {
  18                     	scross	off
  19  0000               _DAC_DeInit:
  21                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  22  0000 725f5380      	clr	21376
  23                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  24  0004 725f5381      	clr	21377
  25                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  26  0008 725f5382      	clr	21378
  27                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  28  000c 725f5383      	clr	21379
  29                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  30  0010 725f5384      	clr	21380
  31                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  32  0014 35ff5385      	mov	21381,#255
  33                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  34  0018 725f5388      	clr	21384
  35                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  36  001c 725f5389      	clr	21385
  37                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  38  0020 725f538c      	clr	21388
  39                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  40  0024 725f538d      	clr	21389
  41                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  42  0028 725f5390      	clr	21392
  43                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  44  002c 725f5394      	clr	21396
  45                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  46  0030 725f5395      	clr	21397
  47                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  48  0034 725f5398      	clr	21400
  49                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  50  0038 725f5399      	clr	21401
  51                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  52  003c 725f539c      	clr	21404
  53                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  54  0040 725f53a0      	clr	21408
  55                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
  56  0044 725f53a1      	clr	21409
  57                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
  58  0048 725f53a2      	clr	21410
  59                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
  60  004c 725f53a3      	clr	21411
  61                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
  62  0050 725f53a4      	clr	21412
  63                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
  64  0054 725f53a5      	clr	21413
  65                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
  66  0058 725f53a6      	clr	21414
  67                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
  68  005c 725f53a7      	clr	21415
  69                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
  70  0060 725f53a8      	clr	21416
  71                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
  72  0064 725f53a9      	clr	21417
  73                     ; 187 }
  74  0068 81            	ret	
  76                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
  76                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
  76                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
  76                     ; 211 {
  77  0069               _DAC_Init:
  78  0069 89            	pushw	x
  79  006a 5203          	subw	sp,#3
  80       00000003      OFST:	set	3
  82                     ; 212   uint8_t tmpreg = 0;
  83                     ; 213   uint16_t tmpreg2 = 0;
  84                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
  85                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
  86                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
  87                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
  88  006c 9e            	ld	a,xh
  89  006d 48            	sll	a
  90  006e 5f            	clrw	x
  91  006f 97            	ld	xl,a
  92  0070 1f01          	ldw	(OFST-2,sp),x
  93                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
  94  0072 d65380        	ld	a,(21376,x)
  95                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
  96  0075 a4c1          	and	a,#193
  97                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
  98  0077 1a08          	or	a,(OFST+5,sp)
  99  0079 6b03          	ld	(OFST+0,sp),a
 100                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 101  007b 7b05          	ld	a,(OFST+2,sp)
 102  007d a130          	cp	a,#48
 103  007f 2706          	jreq	L3
 104                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 105  0081 aa04          	or	a,#4
 106  0083 1a03          	or	a,(OFST+0,sp)
 107  0085 6b03          	ld	(OFST+0,sp),a
 108  0087               L3:
 109                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 110  0087 7b03          	ld	a,(OFST+0,sp)
 111  0089 d75380        	ld	(21376,x),a
 112                     ; 240 }
 113  008c 5b05          	addw	sp,#5
 114  008e 81            	ret	
 116                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 116                     ; 255 {
 117  008f               _DAC_Cmd:
 118  008f 89            	pushw	x
 119  0090 89            	pushw	x
 120       00000002      OFST:	set	2
 122                     ; 256   uint16_t cr1addr = 0;
 123                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 124                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 125                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 126  0091 9e            	ld	a,xh
 127  0092 48            	sll	a
 128  0093 5f            	clrw	x
 129  0094 97            	ld	xl,a
 130  0095 1c5380        	addw	x,#21376
 131  0098 1f01          	ldw	(OFST-1,sp),x
 132                     ; 264   if (NewState != DISABLE)
 133  009a 7b04          	ld	a,(OFST+2,sp)
 134  009c 2705          	jreq	L5
 135                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 136  009e f6            	ld	a,(x)
 137  009f aa01          	or	a,#1
 139  00a1 2003          	jra	L7
 140  00a3               L5:
 141                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 142  00a3 f6            	ld	a,(x)
 143  00a4 a4fe          	and	a,#254
 144  00a6               L7:
 145  00a6 f7            	ld	(x),a
 146                     ; 274 }
 147  00a7 5b04          	addw	sp,#4
 148  00a9 81            	ret	
 150                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 150                     ; 287 {
 151  00aa               _DAC_SoftwareTriggerCmd:
 152  00aa 89            	pushw	x
 153       00000000      OFST:	set	0
 155                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 156                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 157                     ; 292   if (NewState != DISABLE)
 158  00ab 9f            	ld	a,xl
 159  00ac 4d            	tnz	a
 160  00ad 2711          	jreq	L11
 161                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 162  00af 9e            	ld	a,xh
 163  00b0 5f            	clrw	x
 164  00b1 97            	ld	xl,a
 165  00b2 a601          	ld	a,#1
 166  00b4 5d            	tnzw	x
 167  00b5 2704          	jreq	L21
 168  00b7               L41:
 169  00b7 48            	sll	a
 170  00b8 5a            	decw	x
 171  00b9 26fc          	jrne	L41
 172  00bb               L21:
 173  00bb ca5384        	or	a,21380
 175  00be 2011          	jra	L31
 176  00c0               L11:
 177                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 178  00c0 7b01          	ld	a,(OFST+1,sp)
 179  00c2 5f            	clrw	x
 180  00c3 97            	ld	xl,a
 181  00c4 a601          	ld	a,#1
 182  00c6 5d            	tnzw	x
 183  00c7 2704          	jreq	L61
 184  00c9               L02:
 185  00c9 48            	sll	a
 186  00ca 5a            	decw	x
 187  00cb 26fc          	jrne	L02
 188  00cd               L61:
 189  00cd 43            	cpl	a
 190  00ce c45384        	and	a,21380
 191  00d1               L31:
 192  00d1 c75384        	ld	21380,a
 193                     ; 302 }
 194  00d4 85            	popw	x
 195  00d5 81            	ret	
 197                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 197                     ; 312 {
 198  00d6               _DAC_DualSoftwareTriggerCmd:
 200                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 201                     ; 316   if (NewState != DISABLE)
 202  00d6 4d            	tnz	a
 203  00d7 2707          	jreq	L51
 204                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 205  00d9 c65384        	ld	a,21380
 206  00dc aa03          	or	a,#3
 208  00de 2005          	jra	L71
 209  00e0               L51:
 210                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 211  00e0 c65384        	ld	a,21380
 212  00e3 a4fc          	and	a,#252
 213  00e5               L71:
 214  00e5 c75384        	ld	21380,a
 215                     ; 326 }
 216  00e8 81            	ret	
 218                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 218                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 218                     ; 344                            FunctionalState NewState)
 218                     ; 345 {
 219  00e9               _DAC_WaveGenerationCmd:
 220  00e9 89            	pushw	x
 221  00ea 88            	push	a
 222       00000001      OFST:	set	1
 224                     ; 346   uint8_t tmpreg = 0;
 225                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 226                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 227                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 228                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 229  00eb 9e            	ld	a,xh
 230  00ec 48            	sll	a
 231  00ed 5f            	clrw	x
 232  00ee 97            	ld	xl,a
 233  00ef d65380        	ld	a,(21376,x)
 234  00f2 a43f          	and	a,#63
 235                     ; 356   if (NewState != DISABLE)
 236  00f4 0d06          	tnz	(OFST+5,sp)
 237  00f6 2702          	jreq	L12
 238                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 239  00f8 1a03          	or	a,(OFST+2,sp)
 240  00fa               L12:
 241  00fa 6b01          	ld	(OFST+0,sp),a
 242                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 243  00fc 7b02          	ld	a,(OFST+1,sp)
 244  00fe 48            	sll	a
 245  00ff 5f            	clrw	x
 246  0100 97            	ld	xl,a
 247  0101 7b01          	ld	a,(OFST+0,sp)
 248  0103 d75380        	ld	(21376,x),a
 249                     ; 364 }
 250  0106 5b03          	addw	sp,#3
 251  0108 81            	ret	
 253                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 253                     ; 389 {
 254  0109               _DAC_SetNoiseWaveLFSR:
 255  0109 89            	pushw	x
 256  010a 5203          	subw	sp,#3
 257       00000003      OFST:	set	3
 259                     ; 390   uint8_t tmpreg = 0;
 260                     ; 391   uint16_t cr2addr = 0;
 261                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 262                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 263                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 264  010c 9e            	ld	a,xh
 265  010d 48            	sll	a
 266  010e 5f            	clrw	x
 267  010f 97            	ld	xl,a
 268  0110 1c5381        	addw	x,#21377
 269  0113 1f02          	ldw	(OFST-1,sp),x
 270                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 271  0115 f6            	ld	a,(x)
 272  0116 a4f0          	and	a,#240
 273  0118 6b01          	ld	(OFST-2,sp),a
 274                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 275  011a 1a05          	or	a,(OFST+2,sp)
 276  011c f7            	ld	(x),a
 277                     ; 403 }
 278  011d 5b05          	addw	sp,#5
 279  011f 81            	ret	
 281                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
 281                     ; 428 {
 282  0120               _DAC_SetTriangleWaveAmplitude:
 283  0120 89            	pushw	x
 284  0121 5203          	subw	sp,#3
 285       00000003      OFST:	set	3
 287                     ; 429   uint8_t tmpreg = 0;
 288                     ; 430   uint16_t cr2addr = 0;
 289                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 290                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
 291                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 292  0123 9e            	ld	a,xh
 293  0124 48            	sll	a
 294  0125 5f            	clrw	x
 295  0126 97            	ld	xl,a
 296  0127 1c5381        	addw	x,#21377
 297  012a 1f02          	ldw	(OFST-1,sp),x
 298                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 299  012c f6            	ld	a,(x)
 300  012d a4f0          	and	a,#240
 301  012f 6b01          	ld	(OFST-2,sp),a
 302                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
 303  0131 1a05          	or	a,(OFST+2,sp)
 304  0133 f7            	ld	(x),a
 305                     ; 443 }
 306  0134 5b05          	addw	sp,#5
 307  0136 81            	ret	
 309                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
 309                     ; 456 {
 310  0137               _DAC_SetChannel1Data:
 311  0137 88            	push	a
 312       00000000      OFST:	set	0
 314                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
 315                     ; 460   if (DAC_Align != DAC_Align_8b_R)
 316  0138 a108          	cp	a,#8
 317  013a 2712          	jreq	L32
 318                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
 319  013c 5f            	clrw	x
 320  013d 97            	ld	xl,a
 321  013e 7b04          	ld	a,(OFST+4,sp)
 322  0140 d75388        	ld	(21384,x),a
 323                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
 324  0143 5f            	clrw	x
 325  0144 7b01          	ld	a,(OFST+1,sp)
 326  0146 97            	ld	xl,a
 327  0147 7b05          	ld	a,(OFST+5,sp)
 328  0149 d75389        	ld	(21385,x),a
 330  014c 2005          	jra	L52
 331  014e               L32:
 332                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
 333                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
 334  014e 7b05          	ld	a,(OFST+5,sp)
 335  0150 c75390        	ld	21392,a
 336  0153               L52:
 337                     ; 474 }
 338  0153 84            	pop	a
 339  0154 81            	ret	
 341                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
 341                     ; 487 {
 342  0155               _DAC_SetChannel2Data:
 343  0155 88            	push	a
 344       00000000      OFST:	set	0
 346                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
 347                     ; 491   if (DAC_Align != DAC_Align_8b_R)
 348  0156 a108          	cp	a,#8
 349  0158 2712          	jreq	L72
 350                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
 351  015a 5f            	clrw	x
 352  015b 97            	ld	xl,a
 353  015c 7b04          	ld	a,(OFST+4,sp)
 354  015e d75394        	ld	(21396,x),a
 355                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
 356  0161 5f            	clrw	x
 357  0162 7b01          	ld	a,(OFST+1,sp)
 358  0164 97            	ld	xl,a
 359  0165 7b05          	ld	a,(OFST+5,sp)
 360  0167 d75395        	ld	(21397,x),a
 362  016a 2005          	jra	L13
 363  016c               L72:
 364                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
 365                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
 366  016c 7b05          	ld	a,(OFST+5,sp)
 367  016e c7539c        	ld	21404,a
 368  0171               L13:
 369                     ; 505 }
 370  0171 84            	pop	a
 371  0172 81            	ret	
 373                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
 373                     ; 523 {
 374  0173               _DAC_SetDualChannelData:
 375       ffffffff      OFST: set -1
 377                     ; 524   uint16_t dchxrdhrhaddr = 0;
 378                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
 379                     ; 529   if (DAC_Align != DAC_Align_8b_R)
 380  0173 a108          	cp	a,#8
 381  0175 2715          	jreq	L33
 382                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
 383  0177 5f            	clrw	x
 384  0178 97            	ld	xl,a
 385  0179 1c53a0        	addw	x,#21408
 386                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
 387  017c 7b05          	ld	a,(OFST+6,sp)
 388  017e f7            	ld	(x),a
 389                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
 390  017f 7b06          	ld	a,(OFST+7,sp)
 391  0181 e701          	ld	(1,x),a
 392                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
 393  0183 7b03          	ld	a,(OFST+4,sp)
 394  0185 e702          	ld	(2,x),a
 395                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
 396  0187 7b04          	ld	a,(OFST+5,sp)
 397  0189 e703          	ld	(3,x),a
 399  018b 81            	ret	
 400  018c               L33:
 401                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
 402                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
 403  018c 7b06          	ld	a,(OFST+7,sp)
 404  018e c753a8        	ld	21416,a
 405                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
 406  0191 7b04          	ld	a,(OFST+5,sp)
 407  0193 c753a9        	ld	21417,a
 408                     ; 549 }
 409  0196 81            	ret	
 411                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
 411                     ; 560 {
 412  0197               _DAC_GetDataOutputValue:
 413  0197 89            	pushw	x
 414       00000002      OFST:	set	2
 416                     ; 561   uint16_t outputdata = 0;
 417                     ; 562   uint16_t tmp = 0;
 418                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 419                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
 420  0198 4d            	tnz	a
 421  0199 260d          	jrne	L73
 422                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
 423  019b c653ac        	ld	a,21420
 424  019e 97            	ld	xl,a
 425  019f 4f            	clr	a
 426  01a0 02            	rlwa	x,a
 427  01a1 1f01          	ldw	(OFST-1,sp),x
 428                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
 429  01a3 c653ad        	ld	a,21421
 431  01a6 200b          	jra	L14
 432  01a8               L73:
 433                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
 434  01a8 c653b0        	ld	a,21424
 435  01ab 97            	ld	xl,a
 436  01ac 4f            	clr	a
 437  01ad 02            	rlwa	x,a
 438  01ae 1f01          	ldw	(OFST-1,sp),x
 439                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
 440  01b0 c653b1        	ld	a,21425
 441  01b3               L14:
 442  01b3 5f            	clrw	x
 443  01b4 97            	ld	xl,a
 444  01b5 01            	rrwa	x,a
 445  01b6 1a02          	or	a,(OFST+0,sp)
 446  01b8 01            	rrwa	x,a
 447  01b9 1a01          	or	a,(OFST-1,sp)
 448  01bb 01            	rrwa	x,a
 449                     ; 581   return (uint16_t)outputdata;
 451  01bc 5b02          	addw	sp,#2
 452  01be 81            	ret	
 454                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 454                     ; 614 {
 455  01bf               _DAC_DMACmd:
 456  01bf 89            	pushw	x
 457  01c0 89            	pushw	x
 458       00000002      OFST:	set	2
 460                     ; 615   uint16_t cr2addr = 0;
 461                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 462                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
 463                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 464  01c1 9e            	ld	a,xh
 465  01c2 48            	sll	a
 466  01c3 5f            	clrw	x
 467  01c4 97            	ld	xl,a
 468  01c5 1c5381        	addw	x,#21377
 469  01c8 1f01          	ldw	(OFST-1,sp),x
 470                     ; 624   if (NewState != DISABLE)
 471  01ca 7b04          	ld	a,(OFST+2,sp)
 472  01cc 2705          	jreq	L34
 473                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
 474  01ce f6            	ld	a,(x)
 475  01cf aa10          	or	a,#16
 477  01d1 2003          	jra	L54
 478  01d3               L34:
 479                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
 480  01d3 f6            	ld	a,(x)
 481  01d4 a4ef          	and	a,#239
 482  01d6               L54:
 483  01d6 f7            	ld	(x),a
 484                     ; 634 }
 485  01d7 5b04          	addw	sp,#4
 486  01d9 81            	ret	
 488                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
 488                     ; 668 {
 489  01da               _DAC_ITConfig:
 490  01da 89            	pushw	x
 491  01db 89            	pushw	x
 492       00000002      OFST:	set	2
 494                     ; 669   uint16_t cr2addr = 0;
 495                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 496                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
 497                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
 498                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 499  01dc 9e            	ld	a,xh
 500  01dd 48            	sll	a
 501  01de 5f            	clrw	x
 502  01df 97            	ld	xl,a
 503  01e0 1c5381        	addw	x,#21377
 504  01e3 1f01          	ldw	(OFST-1,sp),x
 505                     ; 679   if (NewState != DISABLE)
 506  01e5 7b07          	ld	a,(OFST+5,sp)
 507  01e7 2705          	jreq	L74
 508                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
 509  01e9 f6            	ld	a,(x)
 510  01ea 1a04          	or	a,(OFST+2,sp)
 512  01ec 2004          	jra	L15
 513  01ee               L74:
 514                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
 515  01ee 7b04          	ld	a,(OFST+2,sp)
 516  01f0 43            	cpl	a
 517  01f1 f4            	and	a,(x)
 518  01f2               L15:
 519  01f2 f7            	ld	(x),a
 520                     ; 689 }
 521  01f3 5b04          	addw	sp,#4
 522  01f5 81            	ret	
 524                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
 524                     ; 705 {
 525  01f6               _DAC_GetFlagStatus:
 526  01f6 89            	pushw	x
 527  01f7 88            	push	a
 528       00000001      OFST:	set	1
 530                     ; 706   FlagStatus flagstatus = RESET;
 531                     ; 707   uint8_t flag = 0;
 532                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 533                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
 534                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
 535  01f8 9e            	ld	a,xh
 536  01f9 5f            	clrw	x
 537  01fa 97            	ld	xl,a
 538  01fb 7b03          	ld	a,(OFST+2,sp)
 539  01fd 5d            	tnzw	x
 540  01fe 2704          	jreq	L05
 541  0200               L25:
 542  0200 48            	sll	a
 543  0201 5a            	decw	x
 544  0202 26fc          	jrne	L25
 545  0204               L05:
 546  0204 6b01          	ld	(OFST+0,sp),a
 547                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
 548  0206 c65385        	ld	a,21381
 549  0209 1501          	bcp	a,(OFST+0,sp)
 550  020b 2704          	jreq	L35
 551                     ; 719     flagstatus = SET;
 552  020d a601          	ld	a,#1
 554  020f 2001          	jra	L55
 555  0211               L35:
 556                     ; 724     flagstatus = RESET;
 557  0211 4f            	clr	a
 558  0212               L55:
 559                     ; 728   return  flagstatus;
 561  0212 5b03          	addw	sp,#3
 562  0214 81            	ret	
 564                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
 564                     ; 743 {
 565  0215               _DAC_ClearFlag:
 566  0215 89            	pushw	x
 567  0216 88            	push	a
 568       00000001      OFST:	set	1
 570                     ; 744   uint8_t flag = 0;
 571                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 572                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
 573                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
 574  0217 9e            	ld	a,xh
 575  0218 5f            	clrw	x
 576  0219 97            	ld	xl,a
 577  021a 7b03          	ld	a,(OFST+2,sp)
 578  021c 5d            	tnzw	x
 579  021d 2704          	jreq	L65
 580  021f               L06:
 581  021f 48            	sll	a
 582  0220 5a            	decw	x
 583  0221 26fc          	jrne	L06
 584  0223               L65:
 585                     ; 754   DAC->SR = (uint8_t)(~flag);
 586  0223 43            	cpl	a
 587  0224 c75385        	ld	21381,a
 588                     ; 755 }
 589  0227 5b03          	addw	sp,#3
 590  0229 81            	ret	
 592                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
 592                     ; 771 {
 593  022a               _DAC_GetITStatus:
 594  022a 89            	pushw	x
 595  022b 89            	pushw	x
 596       00000002      OFST:	set	2
 598                     ; 772   ITStatus itstatus = RESET;
 599                     ; 773   uint8_t enablestatus = 0;
 600                     ; 774   uint8_t flagstatus = 0;
 601                     ; 775   uint8_t tempreg = 0;
 602                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 603                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
 604                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
 605  022c 9e            	ld	a,xh
 606  022d 48            	sll	a
 607  022e 48            	sll	a
 608  022f 5f            	clrw	x
 609  0230 97            	ld	xl,a
 610  0231 d65381        	ld	a,(21377,x)
 611  0234 6b02          	ld	(OFST+0,sp),a
 612                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
 613  0236 5f            	clrw	x
 614  0237 7b03          	ld	a,(OFST+1,sp)
 615  0239 97            	ld	xl,a
 616  023a 7b04          	ld	a,(OFST+2,sp)
 617  023c 5d            	tnzw	x
 618  023d 2704          	jreq	L46
 619  023f               L66:
 620  023f 48            	sll	a
 621  0240 5a            	decw	x
 622  0241 26fc          	jrne	L66
 623  0243               L46:
 624  0243 1402          	and	a,(OFST+0,sp)
 625  0245 6b01          	ld	(OFST-1,sp),a
 626                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
 627  0247 a605          	ld	a,#5
 628  0249 1003          	sub	a,(OFST+1,sp)
 629  024b 5f            	clrw	x
 630  024c 97            	ld	xl,a
 631  024d 7b04          	ld	a,(OFST+2,sp)
 632  024f 5d            	tnzw	x
 633  0250 2704          	jreq	L07
 634  0252               L27:
 635  0252 44            	srl	a
 636  0253 5a            	decw	x
 637  0254 26fc          	jrne	L27
 638  0256               L07:
 639  0256 c45385        	and	a,21381
 640  0259 6b02          	ld	(OFST+0,sp),a
 641                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
 642  025b 2708          	jreq	L75
 644  025d 7b01          	ld	a,(OFST-1,sp)
 645  025f 2704          	jreq	L75
 646                     ; 790     itstatus = SET;
 647  0261 a601          	ld	a,#1
 649  0263 2001          	jra	L16
 650  0265               L75:
 651                     ; 795     itstatus = RESET;
 652  0265 4f            	clr	a
 653  0266               L16:
 654                     ; 799   return  itstatus;
 656  0266 5b04          	addw	sp,#4
 657  0268 81            	ret	
 659                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
 659                     ; 814 {
 660  0269               _DAC_ClearITPendingBit:
 661  0269 89            	pushw	x
 662       00000000      OFST:	set	0
 664                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 665                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
 666                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
 667  026a 9e            	ld	a,xh
 668  026b a005          	sub	a,#5
 669  026d 40            	neg	a
 670  026e 5f            	clrw	x
 671  026f 97            	ld	xl,a
 672  0270 7b02          	ld	a,(OFST+2,sp)
 673  0272 5d            	tnzw	x
 674  0273 2704          	jreq	L67
 675  0275               L001:
 676  0275 44            	srl	a
 677  0276 5a            	decw	x
 678  0277 26fc          	jrne	L001
 679  0279               L67:
 680  0279 43            	cpl	a
 681  027a c75385        	ld	21381,a
 682                     ; 821 }
 683  027d 85            	popw	x
 684  027e 81            	ret	
 686                     	xdef	_DAC_ClearITPendingBit
 687                     	xdef	_DAC_GetITStatus
 688                     	xdef	_DAC_ClearFlag
 689                     	xdef	_DAC_GetFlagStatus
 690                     	xdef	_DAC_ITConfig
 691                     	xdef	_DAC_DMACmd
 692                     	xdef	_DAC_GetDataOutputValue
 693                     	xdef	_DAC_SetDualChannelData
 694                     	xdef	_DAC_SetChannel2Data
 695                     	xdef	_DAC_SetChannel1Data
 696                     	xdef	_DAC_SetTriangleWaveAmplitude
 697                     	xdef	_DAC_SetNoiseWaveLFSR
 698                     	xdef	_DAC_WaveGenerationCmd
 699                     	xdef	_DAC_DualSoftwareTriggerCmd
 700                     	xdef	_DAC_SoftwareTriggerCmd
 701                     	xdef	_DAC_Cmd
 702                     	xdef	_DAC_Init
 703                     	xdef	_DAC_DeInit
 704                     	end
