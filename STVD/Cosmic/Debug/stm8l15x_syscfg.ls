   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 119 void SYSCFG_RIDeInit(void)
  50                     ; 120 {
  52                     .text:	section	.text,new
  53  0000               _SYSCFG_RIDeInit:
  57                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  59  0000 725f5431      	clr	21553
  60                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  62  0004 725f5432      	clr	21554
  63                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  65  0008 725f5439      	clr	21561
  66                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  68  000c 725f543a      	clr	21562
  69                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  71  0010 725f543b      	clr	21563
  72                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  74  0014 725f5457      	clr	21591
  75                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  77  0018 725f543d      	clr	21565
  78                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  80  001c 725f543e      	clr	21566
  81                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  83  0020 725f543f      	clr	21567
  84                     ; 130 }
  87  0024 81            	ret	
 346                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 346                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 346                     ; 144 {
 347                     .text:	section	.text,new
 348  0000               _SYSCFG_RITIMInputCaptureConfig:
 350  0000 89            	pushw	x
 351       00000000      OFST:	set	0
 354                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 356                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 358                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 360  0001 9e            	ld	a,xh
 361  0002 a102          	cp	a,#2
 362  0004 2606          	jrne	L531
 363                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 365  0006 9f            	ld	a,xl
 366  0007 c75431        	ld	21553,a
 368  000a 2005          	jra	L731
 369  000c               L531:
 370                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 372  000c 7b02          	ld	a,(OFST+2,sp)
 373  000e c75432        	ld	21554,a
 374  0011               L731:
 375                     ; 161 }
 378  0011 85            	popw	x
 379  0012 81            	ret	
 557                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 557                     ; 185                                  FunctionalState NewState)
 557                     ; 186 {
 558                     .text:	section	.text,new
 559  0000               _SYSCFG_RIAnalogSwitchConfig:
 561  0000 89            	pushw	x
 562  0001 89            	pushw	x
 563       00000002      OFST:	set	2
 566                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 568                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 570                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 572                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 574  0002 9e            	ld	a,xh
 575  0003 a4f0          	and	a,#240
 576  0005 6b01          	ld	(OFST-1,sp),a
 578                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 580  0007 7b03          	ld	a,(OFST+1,sp)
 581  0009 a40f          	and	a,#15
 582  000b 6b02          	ld	(OFST+0,sp),a
 584                     ; 199   if (NewState != DISABLE)
 586  000d 7b04          	ld	a,(OFST+2,sp)
 587  000f 2724          	jreq	L532
 588                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 590  0011 7b01          	ld	a,(OFST-1,sp)
 591  0013 a110          	cp	a,#16
 592  0015 260f          	jrne	L732
 593                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 595  0017 7b02          	ld	a,(OFST+0,sp)
 596  0019 ad47          	call	LC003
 597  001b 2704          	jreq	L21
 598  001d               L41:
 599  001d 48            	sll	a
 600  001e 5a            	decw	x
 601  001f 26fc          	jrne	L41
 602  0021               L21:
 603  0021 ca543d        	or	a,21565
 605  0024 2023          	jp	LC002
 606  0026               L732:
 607                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 609  0026 7b02          	ld	a,(OFST+0,sp)
 610  0028 ad38          	call	LC003
 611  002a 2704          	jreq	L61
 612  002c               L02:
 613  002c 48            	sll	a
 614  002d 5a            	decw	x
 615  002e 26fc          	jrne	L02
 616  0030               L61:
 617  0030 ca543e        	or	a,21566
 618  0033 2027          	jp	LC001
 619  0035               L532:
 620                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 622  0035 7b01          	ld	a,(OFST-1,sp)
 623  0037 a110          	cp	a,#16
 624  0039 2613          	jrne	L542
 625                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 627  003b 7b02          	ld	a,(OFST+0,sp)
 628  003d ad23          	call	LC003
 629  003f 2704          	jreq	L22
 630  0041               L42:
 631  0041 48            	sll	a
 632  0042 5a            	decw	x
 633  0043 26fc          	jrne	L42
 634  0045               L22:
 635  0045 43            	cpl	a
 636  0046 c4543d        	and	a,21565
 637  0049               LC002:
 638  0049 c7543d        	ld	21565,a
 640  004c 2011          	jra	L342
 641  004e               L542:
 642                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 644  004e 7b02          	ld	a,(OFST+0,sp)
 645  0050 ad10          	call	LC003
 646  0052 2704          	jreq	L62
 647  0054               L03:
 648  0054 48            	sll	a
 649  0055 5a            	decw	x
 650  0056 26fc          	jrne	L03
 651  0058               L62:
 652  0058 43            	cpl	a
 653  0059 c4543e        	and	a,21566
 654  005c               LC001:
 655  005c c7543e        	ld	21566,a
 656  005f               L342:
 657                     ; 225 }
 660  005f 5b04          	addw	sp,#4
 661  0061 81            	ret	
 662  0062               LC003:
 663  0062 5f            	clrw	x
 664  0063 97            	ld	xl,a
 665  0064 a601          	ld	a,#1
 666  0066 5d            	tnzw	x
 667  0067 81            	ret	
 929                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 929                     ; 235                              FunctionalState NewState)
 929                     ; 236 {
 930                     .text:	section	.text,new
 931  0000               _SYSCFG_RIIOSwitchConfig:
 933  0000 89            	pushw	x
 934  0001 89            	pushw	x
 935       00000002      OFST:	set	2
 938                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 940                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 942                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 944                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 946  0002 9e            	ld	a,xh
 947  0003 a40f          	and	a,#15
 948  0005 6b02          	ld	(OFST+0,sp),a
 950                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 952  0007 7b03          	ld	a,(OFST+1,sp)
 953  0009 a4f0          	and	a,#240
 954  000b 6b01          	ld	(OFST-1,sp),a
 956                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 958  000d a110          	cp	a,#16
 959  000f 262c          	jrne	L373
 960                     ; 252     if (NewState != DISABLE)
 962  0011 7b04          	ld	a,(OFST+2,sp)
 963  0013 2714          	jreq	L573
 964                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 966  0015 7b02          	ld	a,(OFST+0,sp)
 967  0017 cd00bb        	call	LC006
 968  001a 2704          	jreq	L43
 969  001c               L63:
 970  001c 48            	sll	a
 971  001d 5a            	decw	x
 972  001e 26fc          	jrne	L63
 973  0020               L43:
 974  0020 ca5439        	or	a,21561
 975  0023 c75439        	ld	21561,a
 977  0026 cc00b8        	jra	L104
 978  0029               L573:
 979                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 981  0029 7b02          	ld	a,(OFST+0,sp)
 982  002b cd00bb        	call	LC006
 983  002e 2704          	jreq	L04
 984  0030               L24:
 985  0030 48            	sll	a
 986  0031 5a            	decw	x
 987  0032 26fc          	jrne	L24
 988  0034               L04:
 989  0034 43            	cpl	a
 990  0035 c45439        	and	a,21561
 991  0038 c75439        	ld	21561,a
 992  003b 207b          	jra	L104
 993  003d               L373:
 994                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
 996  003d a120          	cp	a,#32
 997  003f 2629          	jrne	L304
 998                     ; 267     if (NewState != DISABLE)
1000  0041 7b04          	ld	a,(OFST+2,sp)
1001  0043 2712          	jreq	L504
1002                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1004  0045 7b02          	ld	a,(OFST+0,sp)
1005  0047 ad72          	call	LC006
1006  0049 2704          	jreq	L44
1007  004b               L64:
1008  004b 48            	sll	a
1009  004c 5a            	decw	x
1010  004d 26fc          	jrne	L64
1011  004f               L44:
1012  004f ca543a        	or	a,21562
1013  0052 c7543a        	ld	21562,a
1015  0055 2061          	jra	L104
1016  0057               L504:
1017                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1019  0057 7b02          	ld	a,(OFST+0,sp)
1020  0059 ad60          	call	LC006
1021  005b 2704          	jreq	L05
1022  005d               L25:
1023  005d 48            	sll	a
1024  005e 5a            	decw	x
1025  005f 26fc          	jrne	L25
1026  0061               L05:
1027  0061 43            	cpl	a
1028  0062 c4543a        	and	a,21562
1029  0065 c7543a        	ld	21562,a
1030  0068 204e          	jra	L104
1031  006a               L304:
1032                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1034  006a a130          	cp	a,#48
1035  006c 2626          	jrne	L314
1036                     ; 282     if (NewState != DISABLE)
1038  006e 7b04          	ld	a,(OFST+2,sp)
1039  0070 270f          	jreq	L514
1040                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1042  0072 7b02          	ld	a,(OFST+0,sp)
1043  0074 ad45          	call	LC006
1044  0076 2704          	jreq	L45
1045  0078               L65:
1046  0078 48            	sll	a
1047  0079 5a            	decw	x
1048  007a 26fc          	jrne	L65
1049  007c               L45:
1050  007c ca543b        	or	a,21563
1052  007f 200e          	jp	LC005
1053  0081               L514:
1054                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1056  0081 7b02          	ld	a,(OFST+0,sp)
1057  0083 ad36          	call	LC006
1058  0085 2704          	jreq	L06
1059  0087               L26:
1060  0087 48            	sll	a
1061  0088 5a            	decw	x
1062  0089 26fc          	jrne	L26
1063  008b               L06:
1064  008b 43            	cpl	a
1065  008c c4543b        	and	a,21563
1066  008f               LC005:
1067  008f c7543b        	ld	21563,a
1068  0092 2024          	jra	L104
1069  0094               L314:
1070                     ; 297     if (NewState != DISABLE)
1072  0094 7b04          	ld	a,(OFST+2,sp)
1073  0096 270f          	jreq	L324
1074                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1076  0098 7b02          	ld	a,(OFST+0,sp)
1077  009a ad1f          	call	LC006
1078  009c 2704          	jreq	L46
1079  009e               L66:
1080  009e 48            	sll	a
1081  009f 5a            	decw	x
1082  00a0 26fc          	jrne	L66
1083  00a2               L46:
1084  00a2 ca5457        	or	a,21591
1086  00a5 200e          	jp	LC004
1087  00a7               L324:
1088                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1090  00a7 7b02          	ld	a,(OFST+0,sp)
1091  00a9 ad10          	call	LC006
1092  00ab 2704          	jreq	L07
1093  00ad               L27:
1094  00ad 48            	sll	a
1095  00ae 5a            	decw	x
1096  00af 26fc          	jrne	L27
1097  00b1               L07:
1098  00b1 43            	cpl	a
1099  00b2 c45457        	and	a,21591
1100  00b5               LC004:
1101  00b5 c75457        	ld	21591,a
1102  00b8               L104:
1103                     ; 308 }
1106  00b8 5b04          	addw	sp,#4
1107  00ba 81            	ret	
1108  00bb               LC006:
1109  00bb 5f            	clrw	x
1110  00bc 97            	ld	xl,a
1111  00bd a601          	ld	a,#1
1112  00bf 5d            	tnzw	x
1113  00c0 81            	ret	
1193                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1193                     ; 321 {
1194                     .text:	section	.text,new
1195  0000               _SYSCFG_RIResistorConfig:
1197  0000 89            	pushw	x
1198       00000000      OFST:	set	0
1201                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1203                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1205                     ; 326   if (NewState != DISABLE)
1207  0001 9f            	ld	a,xl
1208  0002 4d            	tnz	a
1209  0003 2706          	jreq	L564
1210                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1212  0005 9e            	ld	a,xh
1213  0006 ca543f        	or	a,21567
1215  0009 2006          	jra	L764
1216  000b               L564:
1217                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1219  000b 7b01          	ld	a,(OFST+1,sp)
1220  000d 43            	cpl	a
1221  000e c4543f        	and	a,21567
1222  0011               L764:
1223  0011 c7543f        	ld	21567,a
1224                     ; 336 }
1227  0014 85            	popw	x
1228  0015 81            	ret	
1251                     ; 368 void SYSCFG_REMAPDeInit(void)
1251                     ; 369 {
1252                     .text:	section	.text,new
1253  0000               _SYSCFG_REMAPDeInit:
1257                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1259  0000 350c509e      	mov	20638,#12
1260                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1262  0004 725f509f      	clr	20639
1263                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1265  0008 725f509d      	clr	20637
1266                     ; 378 }
1269  000c 81            	ret	
1485                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1485                     ; 412 {
1486                     .text:	section	.text,new
1487  0000               _SYSCFG_REMAPPinConfig:
1489  0000 89            	pushw	x
1490  0001 88            	push	a
1491       00000001      OFST:	set	1
1494                     ; 413   uint8_t regindex = 0;
1496                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1498                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1500                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1502  0002 9e            	ld	a,xh
1503  0003 6b01          	ld	(OFST+0,sp),a
1505                     ; 422   if (regindex == 0x01)
1507  0005 a101          	cp	a,#1
1508  0007 261c          	jrne	L106
1509                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1511  0009 a610          	ld	a,#16
1512  000b 42            	mul	x,a
1513  000c 9f            	ld	a,xl
1514  000d aa0f          	or	a,#15
1515  000f c4509e        	and	a,20638
1516  0012 c7509e        	ld	20638,a
1517                     ; 425     if (NewState != DISABLE)
1519  0015 7b06          	ld	a,(OFST+5,sp)
1520  0017 273a          	jreq	L506
1521                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1523  0019 7b03          	ld	a,(OFST+2,sp)
1524  001b a4f0          	and	a,#240
1525  001d ca509e        	or	a,20638
1526  0020 c7509e        	ld	20638,a
1527  0023 202e          	jra	L506
1528  0025               L106:
1529                     ; 431   else if (regindex == 0x02)
1531  0025 a102          	cp	a,#2
1532  0027 2616          	jrne	L706
1533                     ; 433     if (NewState != DISABLE)
1535  0029 7b06          	ld	a,(OFST+5,sp)
1536  002b 2707          	jreq	L116
1537                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1539  002d c6509f        	ld	a,20639
1540  0030 1a03          	or	a,(OFST+2,sp)
1542  0032 2006          	jp	LC008
1543  0034               L116:
1544                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1546  0034 7b03          	ld	a,(OFST+2,sp)
1547  0036 43            	cpl	a
1548  0037 c4509f        	and	a,20639
1549  003a               LC008:
1550  003a c7509f        	ld	20639,a
1551  003d 2014          	jra	L506
1552  003f               L706:
1553                     ; 445     if (NewState != DISABLE)
1555  003f 7b06          	ld	a,(OFST+5,sp)
1556  0041 2707          	jreq	L716
1557                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1559  0043 c6509d        	ld	a,20637
1560  0046 1a03          	or	a,(OFST+2,sp)
1562  0048 2006          	jp	LC007
1563  004a               L716:
1564                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1566  004a 7b03          	ld	a,(OFST+2,sp)
1567  004c 43            	cpl	a
1568  004d c4509d        	and	a,20637
1569  0050               LC007:
1570  0050 c7509d        	ld	20637,a
1571  0053               L506:
1572                     ; 454 }
1575  0053 5b03          	addw	sp,#3
1576  0055 81            	ret	
1682                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1682                     ; 471 {
1683                     .text:	section	.text,new
1684  0000               _SYSCFG_REMAPDMAChannelConfig:
1686  0000 88            	push	a
1687       00000000      OFST:	set	0
1690                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1692                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1694  0001 a5f0          	bcp	a,#240
1695  0003 2707          	jreq	L566
1696                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1698  0005 c6509e        	ld	a,20638
1699  0008 a4f3          	and	a,#243
1701  000a 2005          	jra	L766
1702  000c               L566:
1703                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1705  000c c6509e        	ld	a,20638
1706  000f a4fc          	and	a,#252
1707  0011               L766:
1708  0011 c7509e        	ld	20638,a
1709                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1711  0014 7b01          	ld	a,(OFST+1,sp)
1712  0016 a40f          	and	a,#15
1713  0018 ca509e        	or	a,20638
1714  001b c7509e        	ld	20638,a
1715                     ; 489 }
1718  001e 84            	pop	a
1719  001f 81            	ret	
1732                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1733                     	xdef	_SYSCFG_REMAPPinConfig
1734                     	xdef	_SYSCFG_REMAPDeInit
1735                     	xdef	_SYSCFG_RIResistorConfig
1736                     	xdef	_SYSCFG_RIIOSwitchConfig
1737                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1738                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1739                     	xdef	_SYSCFG_RIDeInit
1758                     	end
