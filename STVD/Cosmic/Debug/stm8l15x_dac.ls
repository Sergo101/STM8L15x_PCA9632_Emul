   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 142 void DAC_DeInit(void)
  50                     ; 143 {
  52                     .text:	section	.text,new
  53  0000               _DAC_DeInit:
  57                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  59  0000 725f5380      	clr	21376
  60                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  62  0004 725f5381      	clr	21377
  63                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  65  0008 725f5382      	clr	21378
  66                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  68  000c 725f5383      	clr	21379
  69                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  71  0010 725f5384      	clr	21380
  72                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  74  0014 35ff5385      	mov	21381,#255
  75                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  77  0018 725f5388      	clr	21384
  78                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  80  001c 725f5389      	clr	21385
  81                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  83  0020 725f538c      	clr	21388
  84                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  86  0024 725f538d      	clr	21389
  87                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  89  0028 725f5390      	clr	21392
  90                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  92  002c 725f5394      	clr	21396
  93                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  95  0030 725f5395      	clr	21397
  96                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  98  0034 725f5398      	clr	21400
  99                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
 101  0038 725f5399      	clr	21401
 102                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
 104  003c 725f539c      	clr	21404
 105                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 107  0040 725f53a0      	clr	21408
 108                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 110  0044 725f53a1      	clr	21409
 111                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 113  0048 725f53a2      	clr	21410
 114                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 116  004c 725f53a3      	clr	21411
 117                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 119  0050 725f53a4      	clr	21412
 120                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 122  0054 725f53a5      	clr	21413
 123                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 125  0058 725f53a6      	clr	21414
 126                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 128  005c 725f53a7      	clr	21415
 129                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 131  0060 725f53a8      	clr	21416
 132                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 134  0064 725f53a9      	clr	21417
 135                     ; 187 }
 138  0068 81            	ret	
 293                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 293                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 293                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 293                     ; 211 {
 294                     .text:	section	.text,new
 295  0000               _DAC_Init:
 297  0000 89            	pushw	x
 298  0001 5203          	subw	sp,#3
 299       00000003      OFST:	set	3
 302                     ; 212   uint8_t tmpreg = 0;
 304                     ; 213   uint16_t tmpreg2 = 0;
 306                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 308                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 310                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 312                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 314  0003 9e            	ld	a,xh
 315  0004 48            	sll	a
 316  0005 5f            	clrw	x
 317  0006 97            	ld	xl,a
 318  0007 1f01          	ldw	(OFST-2,sp),x
 320                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 322  0009 d65380        	ld	a,(21376,x)
 324                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 326  000c a4c1          	and	a,#193
 328                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 330  000e 1a08          	or	a,(OFST+5,sp)
 331  0010 6b03          	ld	(OFST+0,sp),a
 333                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 335  0012 7b05          	ld	a,(OFST+2,sp)
 336  0014 a130          	cp	a,#48
 337  0016 2706          	jreq	L111
 338                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 340  0018 aa04          	or	a,#4
 341  001a 1a03          	or	a,(OFST+0,sp)
 342  001c 6b03          	ld	(OFST+0,sp),a
 344  001e               L111:
 345                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 347  001e 7b03          	ld	a,(OFST+0,sp)
 348  0020 d75380        	ld	(21376,x),a
 349                     ; 240 }
 352  0023 5b05          	addw	sp,#5
 353  0025 81            	ret	
 425                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 425                     ; 255 {
 426                     .text:	section	.text,new
 427  0000               _DAC_Cmd:
 429  0000 89            	pushw	x
 430  0001 89            	pushw	x
 431       00000002      OFST:	set	2
 434                     ; 256   uint16_t cr1addr = 0;
 436                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 438                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 440                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 442  0002 9e            	ld	a,xh
 443  0003 48            	sll	a
 444  0004 5f            	clrw	x
 445  0005 97            	ld	xl,a
 446  0006 1c5380        	addw	x,#21376
 447  0009 1f01          	ldw	(OFST-1,sp),x
 449                     ; 264   if (NewState != DISABLE)
 451  000b 7b04          	ld	a,(OFST+2,sp)
 452  000d 2705          	jreq	L741
 453                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 455  000f f6            	ld	a,(x)
 456  0010 aa01          	or	a,#1
 458  0012 2003          	jra	L151
 459  0014               L741:
 460                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 462  0014 f6            	ld	a,(x)
 463  0015 a4fe          	and	a,#254
 464  0017               L151:
 465  0017 f7            	ld	(x),a
 466                     ; 274 }
 469  0018 5b04          	addw	sp,#4
 470  001a 81            	ret	
 516                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 516                     ; 287 {
 517                     .text:	section	.text,new
 518  0000               _DAC_SoftwareTriggerCmd:
 520  0000 89            	pushw	x
 521       00000000      OFST:	set	0
 524                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 526                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 528                     ; 292   if (NewState != DISABLE)
 530  0001 9f            	ld	a,xl
 531  0002 4d            	tnz	a
 532  0003 2711          	jreq	L571
 533                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 535  0005 9e            	ld	a,xh
 536  0006 5f            	clrw	x
 537  0007 97            	ld	xl,a
 538  0008 a601          	ld	a,#1
 539  000a 5d            	tnzw	x
 540  000b 2704          	jreq	L41
 541  000d               L61:
 542  000d 48            	sll	a
 543  000e 5a            	decw	x
 544  000f 26fc          	jrne	L61
 545  0011               L41:
 546  0011 ca5384        	or	a,21380
 548  0014 2011          	jra	L771
 549  0016               L571:
 550                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 552  0016 7b01          	ld	a,(OFST+1,sp)
 553  0018 5f            	clrw	x
 554  0019 97            	ld	xl,a
 555  001a a601          	ld	a,#1
 556  001c 5d            	tnzw	x
 557  001d 2704          	jreq	L02
 558  001f               L22:
 559  001f 48            	sll	a
 560  0020 5a            	decw	x
 561  0021 26fc          	jrne	L22
 562  0023               L02:
 563  0023 43            	cpl	a
 564  0024 c45384        	and	a,21380
 565  0027               L771:
 566  0027 c75384        	ld	21380,a
 567                     ; 302 }
 570  002a 85            	popw	x
 571  002b 81            	ret	
 607                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 607                     ; 312 {
 608                     .text:	section	.text,new
 609  0000               _DAC_DualSoftwareTriggerCmd:
 613                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 615                     ; 316   if (NewState != DISABLE)
 617  0000 4d            	tnz	a
 618  0001 2707          	jreq	L712
 619                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 621  0003 c65384        	ld	a,21380
 622  0006 aa03          	or	a,#3
 624  0008 2005          	jra	L122
 625  000a               L712:
 626                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 628  000a c65384        	ld	a,21380
 629  000d a4fc          	and	a,#252
 630  000f               L122:
 631  000f c75384        	ld	21380,a
 632                     ; 326 }
 635  0012 81            	ret	
 718                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 718                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 718                     ; 344                            FunctionalState NewState)
 718                     ; 345 {
 719                     .text:	section	.text,new
 720  0000               _DAC_WaveGenerationCmd:
 722  0000 89            	pushw	x
 723  0001 88            	push	a
 724       00000001      OFST:	set	1
 727                     ; 346   uint8_t tmpreg = 0;
 729                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 731                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 733                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 735                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 737  0002 9e            	ld	a,xh
 738  0003 48            	sll	a
 739  0004 5f            	clrw	x
 740  0005 97            	ld	xl,a
 741  0006 d65380        	ld	a,(21376,x)
 742  0009 a43f          	and	a,#63
 744                     ; 356   if (NewState != DISABLE)
 746  000b 0d06          	tnz	(OFST+5,sp)
 747  000d 2702          	jreq	L362
 748                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 750  000f 1a03          	or	a,(OFST+2,sp)
 752  0011               L362:
 753  0011 6b01          	ld	(OFST+0,sp),a
 754                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 756  0013 7b02          	ld	a,(OFST+1,sp)
 757  0015 48            	sll	a
 758  0016 5f            	clrw	x
 759  0017 97            	ld	xl,a
 760  0018 7b01          	ld	a,(OFST+0,sp)
 761  001a d75380        	ld	(21376,x),a
 762                     ; 364 }
 765  001d 5b03          	addw	sp,#3
 766  001f 81            	ret	
 928                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 928                     ; 389 {
 929                     .text:	section	.text,new
 930  0000               _DAC_SetNoiseWaveLFSR:
 932  0000 89            	pushw	x
 933  0001 5203          	subw	sp,#3
 934       00000003      OFST:	set	3
 937                     ; 390   uint8_t tmpreg = 0;
 939                     ; 391   uint16_t cr2addr = 0;
 941                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 943                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 945                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 947  0003 9e            	ld	a,xh
 948  0004 48            	sll	a
 949  0005 5f            	clrw	x
 950  0006 97            	ld	xl,a
 951  0007 1c5381        	addw	x,#21377
 952  000a 1f02          	ldw	(OFST-1,sp),x
 954                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 956  000c f6            	ld	a,(x)
 957  000d a4f0          	and	a,#240
 958  000f 6b01          	ld	(OFST-2,sp),a
 960                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 962  0011 1a05          	or	a,(OFST+2,sp)
 963  0013 f7            	ld	(x),a
 964                     ; 403 }
 967  0014 5b05          	addw	sp,#5
 968  0016 81            	ret	
1131                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1131                     ; 428 {
1132                     .text:	section	.text,new
1133  0000               _DAC_SetTriangleWaveAmplitude:
1135  0000 89            	pushw	x
1136  0001 5203          	subw	sp,#3
1137       00000003      OFST:	set	3
1140                     ; 429   uint8_t tmpreg = 0;
1142                     ; 430   uint16_t cr2addr = 0;
1144                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1146                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1148                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1150  0003 9e            	ld	a,xh
1151  0004 48            	sll	a
1152  0005 5f            	clrw	x
1153  0006 97            	ld	xl,a
1154  0007 1c5381        	addw	x,#21377
1155  000a 1f02          	ldw	(OFST-1,sp),x
1157                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1159  000c f6            	ld	a,(x)
1160  000d a4f0          	and	a,#240
1161  000f 6b01          	ld	(OFST-2,sp),a
1163                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1165  0011 1a05          	or	a,(OFST+2,sp)
1166  0013 f7            	ld	(x),a
1167                     ; 443 }
1170  0014 5b05          	addw	sp,#5
1171  0016 81            	ret	
1241                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1241                     ; 456 {
1242                     .text:	section	.text,new
1243  0000               _DAC_SetChannel1Data:
1245  0000 88            	push	a
1246       00000000      OFST:	set	0
1249                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1251                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1253  0001 a108          	cp	a,#8
1254  0003 2712          	jreq	L364
1255                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1257  0005 5f            	clrw	x
1258  0006 97            	ld	xl,a
1259  0007 7b04          	ld	a,(OFST+4,sp)
1260  0009 d75388        	ld	(21384,x),a
1261                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1263  000c 5f            	clrw	x
1264  000d 7b01          	ld	a,(OFST+1,sp)
1265  000f 97            	ld	xl,a
1266  0010 7b05          	ld	a,(OFST+5,sp)
1267  0012 d75389        	ld	(21385,x),a
1269  0015 2005          	jra	L564
1270  0017               L364:
1271                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1273                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1275  0017 7b05          	ld	a,(OFST+5,sp)
1276  0019 c75390        	ld	21392,a
1277  001c               L564:
1278                     ; 474 }
1281  001c 84            	pop	a
1282  001d 81            	ret	
1325                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1325                     ; 487 {
1326                     .text:	section	.text,new
1327  0000               _DAC_SetChannel2Data:
1329  0000 88            	push	a
1330       00000000      OFST:	set	0
1333                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1335                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1337  0001 a108          	cp	a,#8
1338  0003 2712          	jreq	L705
1339                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1341  0005 5f            	clrw	x
1342  0006 97            	ld	xl,a
1343  0007 7b04          	ld	a,(OFST+4,sp)
1344  0009 d75394        	ld	(21396,x),a
1345                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1347  000c 5f            	clrw	x
1348  000d 7b01          	ld	a,(OFST+1,sp)
1349  000f 97            	ld	xl,a
1350  0010 7b05          	ld	a,(OFST+5,sp)
1351  0012 d75395        	ld	(21397,x),a
1353  0015 2005          	jra	L115
1354  0017               L705:
1355                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1357                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1359  0017 7b05          	ld	a,(OFST+5,sp)
1360  0019 c7539c        	ld	21404,a
1361  001c               L115:
1362                     ; 505 }
1365  001c 84            	pop	a
1366  001d 81            	ret	
1423                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1423                     ; 523 {
1424                     .text:	section	.text,new
1425  0000               _DAC_SetDualChannelData:
1427       ffffffff      OFST: set -1
1430                     ; 524   uint16_t dchxrdhrhaddr = 0;
1432                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1434                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1436  0000 a108          	cp	a,#8
1437  0002 2715          	jreq	L735
1438                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1440  0004 5f            	clrw	x
1441  0005 97            	ld	xl,a
1442  0006 1c53a0        	addw	x,#21408
1444                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1446  0009 7b05          	ld	a,(OFST+6,sp)
1447  000b f7            	ld	(x),a
1448                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1450  000c 7b06          	ld	a,(OFST+7,sp)
1451  000e e701          	ld	(1,x),a
1452                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1454  0010 7b03          	ld	a,(OFST+4,sp)
1455  0012 e702          	ld	(2,x),a
1456                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1458  0014 7b04          	ld	a,(OFST+5,sp)
1459  0016 e703          	ld	(3,x),a
1462  0018 81            	ret	
1463  0019               L735:
1464                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1466                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1468  0019 7b06          	ld	a,(OFST+7,sp)
1469  001b c753a8        	ld	21416,a
1470                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1472  001e 7b04          	ld	a,(OFST+5,sp)
1473  0020 c753a9        	ld	21417,a
1474                     ; 549 }
1477  0023 81            	ret	
1527                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1527                     ; 560 {
1528                     .text:	section	.text,new
1529  0000               _DAC_GetDataOutputValue:
1531  0000 89            	pushw	x
1532       00000002      OFST:	set	2
1535                     ; 561   uint16_t outputdata = 0;
1537                     ; 562   uint16_t tmp = 0;
1539                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1541                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1543  0001 4d            	tnz	a
1544  0002 260d          	jrne	L565
1545                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1547  0004 c653ac        	ld	a,21420
1548  0007 97            	ld	xl,a
1549  0008 4f            	clr	a
1550  0009 02            	rlwa	x,a
1551  000a 1f01          	ldw	(OFST-1,sp),x
1553                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1555  000c c653ad        	ld	a,21421
1557  000f 200b          	jra	L765
1558  0011               L565:
1559                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1561  0011 c653b0        	ld	a,21424
1562  0014 97            	ld	xl,a
1563  0015 4f            	clr	a
1564  0016 02            	rlwa	x,a
1565  0017 1f01          	ldw	(OFST-1,sp),x
1567                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1569  0019 c653b1        	ld	a,21425
1570  001c               L765:
1571  001c 5f            	clrw	x
1572  001d 97            	ld	xl,a
1573  001e 01            	rrwa	x,a
1574  001f 1a02          	or	a,(OFST+0,sp)
1575  0021 01            	rrwa	x,a
1576  0022 1a01          	or	a,(OFST-1,sp)
1577  0024 01            	rrwa	x,a
1579                     ; 581   return (uint16_t)outputdata;
1583  0025 5b02          	addw	sp,#2
1584  0027 81            	ret	
1636                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1636                     ; 614 {
1637                     .text:	section	.text,new
1638  0000               _DAC_DMACmd:
1640  0000 89            	pushw	x
1641  0001 89            	pushw	x
1642       00000002      OFST:	set	2
1645                     ; 615   uint16_t cr2addr = 0;
1647                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1649                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1651                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1653  0002 9e            	ld	a,xh
1654  0003 48            	sll	a
1655  0004 5f            	clrw	x
1656  0005 97            	ld	xl,a
1657  0006 1c5381        	addw	x,#21377
1658  0009 1f01          	ldw	(OFST-1,sp),x
1660                     ; 624   if (NewState != DISABLE)
1662  000b 7b04          	ld	a,(OFST+2,sp)
1663  000d 2705          	jreq	L516
1664                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1666  000f f6            	ld	a,(x)
1667  0010 aa10          	or	a,#16
1669  0012 2003          	jra	L716
1670  0014               L516:
1671                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1673  0014 f6            	ld	a,(x)
1674  0015 a4ef          	and	a,#239
1675  0017               L716:
1676  0017 f7            	ld	(x),a
1677                     ; 634 }
1680  0018 5b04          	addw	sp,#4
1681  001a 81            	ret	
1756                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1756                     ; 668 {
1757                     .text:	section	.text,new
1758  0000               _DAC_ITConfig:
1760  0000 89            	pushw	x
1761  0001 89            	pushw	x
1762       00000002      OFST:	set	2
1765                     ; 669   uint16_t cr2addr = 0;
1767                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1769                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1771                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1773                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1775  0002 9e            	ld	a,xh
1776  0003 48            	sll	a
1777  0004 5f            	clrw	x
1778  0005 97            	ld	xl,a
1779  0006 1c5381        	addw	x,#21377
1780  0009 1f01          	ldw	(OFST-1,sp),x
1782                     ; 679   if (NewState != DISABLE)
1784  000b 7b07          	ld	a,(OFST+5,sp)
1785  000d 2705          	jreq	L756
1786                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1788  000f f6            	ld	a,(x)
1789  0010 1a04          	or	a,(OFST+2,sp)
1791  0012 2004          	jra	L166
1792  0014               L756:
1793                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1795  0014 7b04          	ld	a,(OFST+2,sp)
1796  0016 43            	cpl	a
1797  0017 f4            	and	a,(x)
1798  0018               L166:
1799  0018 f7            	ld	(x),a
1800                     ; 689 }
1803  0019 5b04          	addw	sp,#4
1804  001b 81            	ret	
1900                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1900                     ; 705 {
1901                     .text:	section	.text,new
1902  0000               _DAC_GetFlagStatus:
1904  0000 89            	pushw	x
1905  0001 88            	push	a
1906       00000001      OFST:	set	1
1909                     ; 706   FlagStatus flagstatus = RESET;
1911                     ; 707   uint8_t flag = 0;
1913                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1915                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1917                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1919  0002 9e            	ld	a,xh
1920  0003 5f            	clrw	x
1921  0004 97            	ld	xl,a
1922  0005 7b03          	ld	a,(OFST+2,sp)
1923  0007 5d            	tnzw	x
1924  0008 2704          	jreq	L25
1925  000a               L45:
1926  000a 48            	sll	a
1927  000b 5a            	decw	x
1928  000c 26fc          	jrne	L45
1929  000e               L25:
1930  000e 6b01          	ld	(OFST+0,sp),a
1932                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
1934  0010 c65385        	ld	a,21381
1935  0013 1501          	bcp	a,(OFST+0,sp)
1936  0015 2704          	jreq	L137
1937                     ; 719     flagstatus = SET;
1939  0017 a601          	ld	a,#1
1942  0019 2001          	jra	L337
1943  001b               L137:
1944                     ; 724     flagstatus = RESET;
1946  001b 4f            	clr	a
1948  001c               L337:
1949                     ; 728   return  flagstatus;
1953  001c 5b03          	addw	sp,#3
1954  001e 81            	ret	
2006                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2006                     ; 743 {
2007                     .text:	section	.text,new
2008  0000               _DAC_ClearFlag:
2010  0000 89            	pushw	x
2011  0001 88            	push	a
2012       00000001      OFST:	set	1
2015                     ; 744   uint8_t flag = 0;
2017                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2019                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2021                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2023  0002 9e            	ld	a,xh
2024  0003 5f            	clrw	x
2025  0004 97            	ld	xl,a
2026  0005 7b03          	ld	a,(OFST+2,sp)
2027  0007 5d            	tnzw	x
2028  0008 2704          	jreq	L06
2029  000a               L26:
2030  000a 48            	sll	a
2031  000b 5a            	decw	x
2032  000c 26fc          	jrne	L26
2033  000e               L06:
2035                     ; 754   DAC->SR = (uint8_t)(~flag);
2037  000e 43            	cpl	a
2038  000f c75385        	ld	21381,a
2039                     ; 755 }
2042  0012 5b03          	addw	sp,#3
2043  0014 81            	ret	
2120                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2120                     ; 771 {
2121                     .text:	section	.text,new
2122  0000               _DAC_GetITStatus:
2124  0000 89            	pushw	x
2125  0001 89            	pushw	x
2126       00000002      OFST:	set	2
2129                     ; 772   ITStatus itstatus = RESET;
2131                     ; 773   uint8_t enablestatus = 0;
2133                     ; 774   uint8_t flagstatus = 0;
2135                     ; 775   uint8_t tempreg = 0;
2137                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2139                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2141                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2143  0002 9e            	ld	a,xh
2144  0003 48            	sll	a
2145  0004 48            	sll	a
2146  0005 5f            	clrw	x
2147  0006 97            	ld	xl,a
2148  0007 d65381        	ld	a,(21377,x)
2149  000a 6b02          	ld	(OFST+0,sp),a
2151                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2153  000c 5f            	clrw	x
2154  000d 7b03          	ld	a,(OFST+1,sp)
2155  000f 97            	ld	xl,a
2156  0010 7b04          	ld	a,(OFST+2,sp)
2157  0012 5d            	tnzw	x
2158  0013 2704          	jreq	L66
2159  0015               L07:
2160  0015 48            	sll	a
2161  0016 5a            	decw	x
2162  0017 26fc          	jrne	L07
2163  0019               L66:
2164  0019 1402          	and	a,(OFST+0,sp)
2165  001b 6b01          	ld	(OFST-1,sp),a
2167                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2169  001d a605          	ld	a,#5
2170  001f 1003          	sub	a,(OFST+1,sp)
2171  0021 5f            	clrw	x
2172  0022 97            	ld	xl,a
2173  0023 7b04          	ld	a,(OFST+2,sp)
2174  0025 5d            	tnzw	x
2175  0026 2704          	jreq	L27
2176  0028               L47:
2177  0028 44            	srl	a
2178  0029 5a            	decw	x
2179  002a 26fc          	jrne	L47
2180  002c               L27:
2181  002c c45385        	and	a,21381
2182  002f 6b02          	ld	(OFST+0,sp),a
2184                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2186  0031 2708          	jreq	L5101
2188  0033 7b01          	ld	a,(OFST-1,sp)
2189  0035 2704          	jreq	L5101
2190                     ; 790     itstatus = SET;
2192  0037 a601          	ld	a,#1
2195  0039 2001          	jra	L7101
2196  003b               L5101:
2197                     ; 795     itstatus = RESET;
2199  003b 4f            	clr	a
2201  003c               L7101:
2202                     ; 799   return  itstatus;
2206  003c 5b04          	addw	sp,#4
2207  003e 81            	ret	
2253                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2253                     ; 814 {
2254                     .text:	section	.text,new
2255  0000               _DAC_ClearITPendingBit:
2257  0000 89            	pushw	x
2258       00000000      OFST:	set	0
2261                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2263                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2265                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2267  0001 9e            	ld	a,xh
2268  0002 a005          	sub	a,#5
2269  0004 40            	neg	a
2270  0005 5f            	clrw	x
2271  0006 97            	ld	xl,a
2272  0007 7b02          	ld	a,(OFST+2,sp)
2273  0009 5d            	tnzw	x
2274  000a 2704          	jreq	L001
2275  000c               L201:
2276  000c 44            	srl	a
2277  000d 5a            	decw	x
2278  000e 26fc          	jrne	L201
2279  0010               L001:
2280  0010 43            	cpl	a
2281  0011 c75385        	ld	21381,a
2282                     ; 821 }
2285  0014 85            	popw	x
2286  0015 81            	ret	
2299                     	xdef	_DAC_ClearITPendingBit
2300                     	xdef	_DAC_GetITStatus
2301                     	xdef	_DAC_ClearFlag
2302                     	xdef	_DAC_GetFlagStatus
2303                     	xdef	_DAC_ITConfig
2304                     	xdef	_DAC_DMACmd
2305                     	xdef	_DAC_GetDataOutputValue
2306                     	xdef	_DAC_SetDualChannelData
2307                     	xdef	_DAC_SetChannel2Data
2308                     	xdef	_DAC_SetChannel1Data
2309                     	xdef	_DAC_SetTriangleWaveAmplitude
2310                     	xdef	_DAC_SetNoiseWaveLFSR
2311                     	xdef	_DAC_WaveGenerationCmd
2312                     	xdef	_DAC_DualSoftwareTriggerCmd
2313                     	xdef	_DAC_SoftwareTriggerCmd
2314                     	xdef	_DAC_Cmd
2315                     	xdef	_DAC_Init
2316                     	xdef	_DAC_DeInit
2335                     	end
