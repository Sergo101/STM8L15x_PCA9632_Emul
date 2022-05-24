   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  99                     ; 232 ErrorStatus RTC_DeInit(void)
  99                     ; 233 {
 101                     .text:	section	.text,new
 102  0000               _RTC_DeInit:
 104  0000 5205          	subw	sp,#5
 105       00000005      OFST:	set	5
 108                     ; 234   ErrorStatus status = ERROR;
 110                     ; 235   uint16_t wutwfcount = 0;
 112  0002 5f            	clrw	x
 113  0003 1f02          	ldw	(OFST-3,sp),x
 115                     ; 236   uint16_t recalpfcount = 0;
 117  0005 1f04          	ldw	(OFST-1,sp),x
 119                     ; 239   RTC->WPR = 0xCA;
 121  0007 35ca5159      	mov	20825,#202
 122                     ; 240   RTC->WPR = 0x53;
 124  000b 35535159      	mov	20825,#83
 125                     ; 243   if (RTC_EnterInitMode() == ERROR)
 127  000f cd0000        	call	_RTC_EnterInitMode
 129  0012 4d            	tnz	a
 130  0013 260b          	jrne	L74
 131                     ; 245     status = ERROR;
 133  0015               LC002:
 135  0015 6b01          	ld	(OFST-4,sp),a
 137                     ; 247     RTC->WPR = 0xFF; 
 140  0017               L15:
 143  0017 35ff5159      	mov	20825,#255
 144                     ; 343   return (ErrorStatus)status;
 146  001b 7b01          	ld	a,(OFST-4,sp)
 149  001d 5b05          	addw	sp,#5
 150  001f 81            	ret	
 151  0020               L74:
 152                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 154  0020 725f5140      	clr	20800
 155                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 157  0024 725f5141      	clr	20801
 158                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 160  0028 725f5142      	clr	20802
 161                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 163  002c 35015144      	mov	20804,#1
 164                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 166  0030 35215145      	mov	20805,#33
 167                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 169  0034 725f5146      	clr	20806
 170                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 172  0038 725f5150      	clr	20816
 173                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 175  003c 35ff5151      	mov	20817,#255
 176                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 178  0040 357f5152      	mov	20818,#127
 179                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 181  0044 725f516c      	clr	20844
 182                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 184  0048 725f516d      	clr	20845
 185                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 187  004c 725f5148      	clr	20808
 188                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 190  0050 725f5149      	clr	20809
 191                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 193  0054 725f514a      	clr	20810
 195  0058 2007          	jra	L75
 196  005a               L35:
 197                     ; 278       wutwfcount++;
 199  005a 5c            	incw	x
 200  005b 1f02          	ldw	(OFST-3,sp),x
 202                     ; 279       RTC->ISR1 = 0;
 204  005d 725f514c      	clr	20812
 205  0061               L75:
 206                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 208  0061 7204514c07    	btjt	20812,#2,L36
 210  0066 1e02          	ldw	x,(OFST-3,sp)
 211  0068 a3ffff        	cpw	x,#65535
 212  006b 26ed          	jrne	L35
 213  006d               L36:
 214                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 216  006d 7204514c02    	btjt	20812,#2,L56
 217                     ; 284       status = ERROR;
 218                     ; 286       RTC->WPR = 0xFF; 
 220  0072 2061          	jp	L301
 221  0074               L56:
 222                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 224  0074 725f5148      	clr	20808
 225                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 227  0078 35ff5154      	mov	20820,#255
 228                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 230  007c 35ff5155      	mov	20821,#255
 231                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 233  0080 725f515c      	clr	20828
 234                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 236  0084 725f515d      	clr	20829
 237                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 239  0088 725f515e      	clr	20830
 240                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 242  008c 725f515f      	clr	20831
 243                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 245  0090 725f5164      	clr	20836
 246                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 248  0094 725f5165      	clr	20837
 249                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 251  0098 725f5166      	clr	20838
 252                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 254  009c 725f514c      	clr	20812
 255                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 257  00a0 725f514d      	clr	20813
 258                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 260  00a4 7203514c11    	btjf	20812,#1,L17
 262  00a9 2003          	jra	L57
 263  00ab               L37:
 264                     ; 315           recalpfcount++;
 266  00ab 5c            	incw	x
 267  00ac 1f04          	ldw	(OFST-1,sp),x
 269  00ae               L57:
 270                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 272  00ae 7203514c07    	btjf	20812,#1,L17
 274  00b3 1e04          	ldw	x,(OFST-1,sp)
 275  00b5 a3ffff        	cpw	x,#65535
 276  00b8 26f1          	jrne	L37
 277  00ba               L17:
 278                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 280  00ba 7202514c16    	btjt	20812,#1,L301
 281                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 283  00bf 725f516a      	clr	20842
 284                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 286  00c3 725f516b      	clr	20843
 287                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 289  00c7 cd0000        	call	_RTC_WaitForSynchro
 291  00ca 4d            	tnz	a
 292                     ; 325           status = ERROR;
 294  00cb 2603cc0015    	jreq	LC002
 295                     ; 329           status = SUCCESS;
 297  00d0 a601          	ld	a,#1
 298  00d2 cc0015        	jp	LC002
 299  00d5               L301:
 300                     ; 334         status = ERROR;
 303  00d5 0f01          	clr	(OFST-4,sp)
 305                     ; 338       RTC->WPR = 0xFF; 
 306  00d7 cc0017        	jra	L15
 406                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 406                     ; 360 {
 407                     .text:	section	.text,new
 408  0000               _RTC_Init:
 410  0000 89            	pushw	x
 411  0001 88            	push	a
 412       00000001      OFST:	set	1
 415                     ; 361   ErrorStatus status = ERROR;
 417                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 419                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 421                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 423                     ; 369   RTC->WPR = 0xCA;
 425  0002 35ca5159      	mov	20825,#202
 426                     ; 370   RTC->WPR = 0x53;
 428  0006 35535159      	mov	20825,#83
 429                     ; 373   if (RTC_EnterInitMode() == ERROR)
 431  000a cd0000        	call	_RTC_EnterInitMode
 433  000d 4d            	tnz	a
 434                     ; 375     status = ERROR;
 438  000e 2727          	jreq	L561
 439                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 441  0010 721d5148      	bres	20808,#6
 442                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 444  0014 1e02          	ldw	x,(OFST+1,sp)
 445  0016 c65148        	ld	a,20808
 446  0019 fa            	or	a,(x)
 447  001a c75148        	ld	20808,a
 448                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 450  001d ee02          	ldw	x,(2,x)
 451  001f 4f            	clr	a
 452  0020 01            	rrwa	x,a
 453  0021 9f            	ld	a,xl
 454  0022 c75150        	ld	20816,a
 455                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 457  0025 1e02          	ldw	x,(OFST+1,sp)
 458  0027 e603          	ld	a,(3,x)
 459  0029 c75151        	ld	20817,a
 460                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 462  002c e601          	ld	a,(1,x)
 463  002e c75152        	ld	20818,a
 464                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 466  0031 721f514c      	bres	20812,#7
 467                     ; 393     status = SUCCESS;
 469  0035 a601          	ld	a,#1
 471  0037               L561:
 472                     ; 397   RTC->WPR = 0xFF; 
 474  0037 35ff5159      	mov	20825,#255
 475                     ; 400   return (ErrorStatus)(status);
 479  003b 5b03          	addw	sp,#3
 480  003d 81            	ret	
 517                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 517                     ; 411 {
 518                     .text:	section	.text,new
 519  0000               _RTC_StructInit:
 523                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 525  0000 7f            	clr	(x)
 526                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 528  0001 a67f          	ld	a,#127
 529  0003 e701          	ld	(1,x),a
 530                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 532  0005 90ae00ff      	ldw	y,#255
 533  0009 ef02          	ldw	(2,x),y
 534                     ; 420 }
 537  000b 81            	ret	
 593                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 593                     ; 431 {
 594                     .text:	section	.text,new
 595  0000               _RTC_WriteProtectionCmd:
 599                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 601                     ; 435   if (NewState != DISABLE)
 603  0000 4d            	tnz	a
 604  0001 2705          	jreq	L532
 605                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 607  0003 35ff5159      	mov	20825,#255
 610  0007 81            	ret	
 611  0008               L532:
 612                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 614  0008 35ca5159      	mov	20825,#202
 615                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 617  000c 35535159      	mov	20825,#83
 618                     ; 446 }
 621  0010 81            	ret	
 664                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 664                     ; 459 {
 665                     .text:	section	.text,new
 666  0000               _RTC_EnterInitMode:
 668       00000003      OFST:	set	3
 671                     ; 460   ErrorStatus status = ERROR;
 673                     ; 461   uint16_t initfcount = 0;
 675  0000 5f            	clrw	x
 677                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 679  0001 720c514c11    	btjt	20812,#6,L162
 680                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 682  0006 3580514c      	mov	20812,#128
 684  000a 2001          	jra	L762
 685  000c               L362:
 686                     ; 472       initfcount++;
 688  000c 5c            	incw	x
 690  000d               L762:
 691                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 693  000d 720c514c05    	btjt	20812,#6,L162
 695  0012 a3ffff        	cpw	x,#65535
 696  0015 26f5          	jrne	L362
 697  0017               L162:
 698                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 700  0017 720c514c02    	btjt	20812,#6,L572
 701                     ; 478     status = ERROR;
 703  001c 4f            	clr	a
 707  001d 81            	ret	
 708  001e               L572:
 709                     ; 482     status = SUCCESS;
 711  001e a601          	ld	a,#1
 713                     ; 485   return (ErrorStatus)status;
 717  0020 81            	ret	
 740                     ; 498 void RTC_ExitInitMode(void)
 740                     ; 499 {
 741                     .text:	section	.text,new
 742  0000               _RTC_ExitInitMode:
 746                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 748  0000 721f514c      	bres	20812,#7
 749                     ; 502 }
 752  0004 81            	ret	
 795                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 795                     ; 528 {
 796                     .text:	section	.text,new
 797  0000               _RTC_WaitForSynchro:
 799  0000 5203          	subw	sp,#3
 800       00000003      OFST:	set	3
 803                     ; 529   uint16_t rsfcount = 0;
 805  0002 5f            	clrw	x
 806  0003 1f02          	ldw	(OFST-1,sp),x
 808                     ; 530   ErrorStatus status = ERROR;
 810                     ; 533   RTC->WPR = 0xCA;
 812  0005 35ca5159      	mov	20825,#202
 813                     ; 534   RTC->WPR = 0x53;
 815  0009 35535159      	mov	20825,#83
 816                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 818  000d c6514c        	ld	a,20812
 819  0010 a45f          	and	a,#95
 820  0012 c7514c        	ld	20812,a
 822  0015 2003          	jra	L333
 823  0017               L133:
 824                     ; 542     rsfcount++;
 826  0017 5c            	incw	x
 827  0018 1f02          	ldw	(OFST-1,sp),x
 829  001a               L333:
 830                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 832  001a 720a514c05    	btjt	20812,#5,L733
 834  001f a3ffff        	cpw	x,#65535
 835  0022 26f3          	jrne	L133
 836  0024               L733:
 837                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 839  0024 720b514c06    	btjf	20812,#5,L143
 840                     ; 548     status = SUCCESS;
 842  0029 a601          	ld	a,#1
 843  002b 6b01          	ld	(OFST-2,sp),a
 846  002d 2002          	jra	L343
 847  002f               L143:
 848                     ; 552     status = ERROR;
 850  002f 0f01          	clr	(OFST-2,sp)
 852  0031               L343:
 853                     ; 556   RTC->WPR = 0xFF; 
 855  0031 35ff5159      	mov	20825,#255
 856                     ; 558   return (ErrorStatus)status;
 858  0035 7b01          	ld	a,(OFST-2,sp)
 861  0037 5b03          	addw	sp,#3
 862  0039 81            	ret	
 897                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 897                     ; 569 {
 898                     .text:	section	.text,new
 899  0000               _RTC_RatioCmd:
 903                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 905                     ; 574   RTC->WPR = 0xCA;
 907  0000 35ca5159      	mov	20825,#202
 908                     ; 575   RTC->WPR = 0x53;
 910  0004 35535159      	mov	20825,#83
 911                     ; 577   if (NewState != DISABLE)
 913  0008 4d            	tnz	a
 914  0009 2706          	jreq	L363
 915                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 917  000b 721a5148      	bset	20808,#5
 919  000f 2004          	jra	L563
 920  0011               L363:
 921                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 923  0011 721b5148      	bres	20808,#5
 924  0015               L563:
 925                     ; 589   RTC->WPR = 0xFF; 
 927  0015 35ff5159      	mov	20825,#255
 928                     ; 590 }
 931  0019 81            	ret	
 967                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 967                     ; 599 {
 968                     .text:	section	.text,new
 969  0000               _RTC_BypassShadowCmd:
 973                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
 975                     ; 604   RTC->WPR = 0xCA;
 977  0000 35ca5159      	mov	20825,#202
 978                     ; 605   RTC->WPR = 0x53;
 980  0004 35535159      	mov	20825,#83
 981                     ; 607   if (NewState != DISABLE)
 983  0008 4d            	tnz	a
 984  0009 2706          	jreq	L504
 985                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 987  000b 72185148      	bset	20808,#4
 989  000f 2004          	jra	L704
 990  0011               L504:
 991                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 993  0011 72195148      	bres	20808,#4
 994  0015               L704:
 995                     ; 619   RTC->WPR = 0xFF; 
 997  0015 35ff5159      	mov	20825,#255
 998                     ; 620 }
1001  0019 81            	ret	
1147                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1147                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1147                     ; 661 {
1148                     .text:	section	.text,new
1149  0000               _RTC_SetTime:
1151  0000 88            	push	a
1152  0001 88            	push	a
1153       00000001      OFST:	set	1
1156                     ; 662   ErrorStatus status = ERROR;
1158                     ; 663   uint8_t temp = 0;
1160                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1162                     ; 668   if (RTC_Format == RTC_Format_BIN)
1164                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1165                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1167                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1170                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1172                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1174                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1177                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1179                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1181                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1185  0002 c65148        	ld	a,20808
1186                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1188                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1190                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1192                     ; 701   RTC->WPR = 0xCA;
1194  0005 35ca5159      	mov	20825,#202
1195                     ; 702   RTC->WPR = 0x53;
1197  0009 35535159      	mov	20825,#83
1198                     ; 705   if (RTC_EnterInitMode() == ERROR)
1200  000d cd0000        	call	_RTC_EnterInitMode
1202  0010 4d            	tnz	a
1203  0011 2606          	jrne	L515
1204                     ; 707     status = ERROR;
1207                     ; 709     RTC->WPR = 0xFF; 
1209  0013 35ff5159      	mov	20825,#255
1211  0017 2059          	jra	L715
1212  0019               L515:
1213                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1215  0019 720d514808    	btjf	20808,#6,L125
1216                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1218                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1220  001e 1e05          	ldw	x,(OFST+4,sp)
1221  0020 e603          	ld	a,(3,x)
1222  0022 6b01          	ld	(OFST+0,sp),a
1225  0024 2002          	jra	L325
1226  0026               L125:
1227                     ; 721       temp = 0;
1229  0026 0f01          	clr	(OFST+0,sp)
1231  0028               L325:
1232                     ; 724     if (RTC_Format != RTC_Format_BIN)
1234  0028 7b02          	ld	a,(OFST+1,sp)
1235  002a 270f          	jreq	L525
1236                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1238  002c 1e05          	ldw	x,(OFST+4,sp)
1239  002e e602          	ld	a,(2,x)
1240  0030 c75140        	ld	20800,a
1241                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1243  0033 e601          	ld	a,(1,x)
1244  0035 c75141        	ld	20801,a
1245                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1247  0038 f6            	ld	a,(x)
1249  0039 201a          	jra	L725
1250  003b               L525:
1251                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1253  003b 1e05          	ldw	x,(OFST+4,sp)
1254  003d e602          	ld	a,(2,x)
1255  003f cd0000        	call	L3_ByteToBcd2
1257  0042 c75140        	ld	20800,a
1258                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1260  0045 1e05          	ldw	x,(OFST+4,sp)
1261  0047 e601          	ld	a,(1,x)
1262  0049 cd0000        	call	L3_ByteToBcd2
1264  004c c75141        	ld	20801,a
1265                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1267  004f 1e05          	ldw	x,(OFST+4,sp)
1268  0051 f6            	ld	a,(x)
1269  0052 cd0000        	call	L3_ByteToBcd2
1271  0055               L725:
1272  0055 1a01          	or	a,(OFST+0,sp)
1273  0057 c75142        	ld	20802,a
1274                     ; 737     (void)(RTC->DR3);
1276  005a c65146        	ld	a,20806
1277                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1279  005d 721f514c      	bres	20812,#7
1280                     ; 743     RTC->WPR = 0xFF; 
1282  0061 35ff5159      	mov	20825,#255
1283                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1285  0065 7208514806    	btjt	20808,#4,L135
1286                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1288  006a cd0000        	call	_RTC_WaitForSynchro
1290  006d 4d            	tnz	a
1291                     ; 750         status = ERROR;
1295  006e 2702          	jreq	L715
1296                     ; 754         status = SUCCESS;
1297  0070               L135:
1298                     ; 759       status = SUCCESS;
1301  0070 a601          	ld	a,#1
1303  0072               L715:
1304                     ; 763   return (ErrorStatus)status;
1308  0072 85            	popw	x
1309  0073 81            	ret	
1346                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1346                     ; 776 {
1347                     .text:	section	.text,new
1348  0000               _RTC_TimeStructInit:
1352                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1354  0000 6f03          	clr	(3,x)
1355                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1357  0002 7f            	clr	(x)
1358                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1360  0003 6f01          	clr	(1,x)
1361                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1363  0005 6f02          	clr	(2,x)
1364                     ; 782 }
1367  0007 81            	ret	
1422                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1422                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1422                     ; 800 {
1423                     .text:	section	.text,new
1424  0000               _RTC_GetTime:
1426  0000 88            	push	a
1427  0001 88            	push	a
1428       00000001      OFST:	set	1
1431                     ; 801   uint8_t  tmpreg = 0;
1433                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1435                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1437  0002 1e05          	ldw	x,(OFST+4,sp)
1438  0004 c65140        	ld	a,20800
1439  0007 e702          	ld	(2,x),a
1440                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1442  0009 c65141        	ld	a,20801
1443  000c e701          	ld	(1,x),a
1444                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1446  000e c65142        	ld	a,20802
1447  0011 6b01          	ld	(OFST+0,sp),a
1449                     ; 817   (void) (RTC->DR3) ;
1451  0013 c65146        	ld	a,20806
1452                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1454  0016 7b01          	ld	a,(OFST+0,sp)
1455  0018 a4bf          	and	a,#191
1456  001a f7            	ld	(x),a
1457                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1459  001b 7b01          	ld	a,(OFST+0,sp)
1460  001d a440          	and	a,#64
1461  001f e703          	ld	(3,x),a
1462                     ; 827   if (RTC_Format == RTC_Format_BIN)
1464  0021 7b02          	ld	a,(OFST+1,sp)
1465  0023 2619          	jrne	L706
1466                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1468  0025 f6            	ld	a,(x)
1469  0026 cd0000        	call	L5_Bcd2ToByte
1471  0029 1e05          	ldw	x,(OFST+4,sp)
1472  002b f7            	ld	(x),a
1473                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1475  002c e601          	ld	a,(1,x)
1476  002e cd0000        	call	L5_Bcd2ToByte
1478  0031 1e05          	ldw	x,(OFST+4,sp)
1479  0033 e701          	ld	(1,x),a
1480                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1482  0035 e602          	ld	a,(2,x)
1483  0037 cd0000        	call	L5_Bcd2ToByte
1485  003a 1e05          	ldw	x,(OFST+4,sp)
1486  003c e702          	ld	(2,x),a
1487  003e               L706:
1488                     ; 834 }
1491  003e 85            	popw	x
1492  003f 81            	ret	
1538                     ; 845 uint16_t RTC_GetSubSecond(void)
1538                     ; 846 {
1539                     .text:	section	.text,new
1540  0000               _RTC_GetSubSecond:
1542  0000 5206          	subw	sp,#6
1543       00000006      OFST:	set	6
1546                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1550                     ; 848   uint16_t ssrreg = 0;
1552                     ; 851   ssrhreg = RTC->SSRH;
1554  0002 c65157        	ld	a,20823
1555  0005 6b03          	ld	(OFST-3,sp),a
1557                     ; 852   ssrlreg = RTC->SSRL;
1559  0007 c65158        	ld	a,20824
1560  000a 6b04          	ld	(OFST-2,sp),a
1562                     ; 855   (void) (RTC->DR3);
1564  000c c65146        	ld	a,20806
1565                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1567  000f 7b04          	ld	a,(OFST-2,sp)
1568  0011 5f            	clrw	x
1569  0012 97            	ld	xl,a
1570  0013 1f01          	ldw	(OFST-5,sp),x
1572  0015 5f            	clrw	x
1573  0016 7b03          	ld	a,(OFST-3,sp)
1574  0018 97            	ld	xl,a
1575  0019 7b02          	ld	a,(OFST-4,sp)
1576  001b 01            	rrwa	x,a
1577  001c 1a01          	or	a,(OFST-5,sp)
1578  001e 01            	rrwa	x,a
1580                     ; 859   return (uint16_t)(ssrreg);
1584  001f 5b06          	addw	sp,#6
1585  0021 81            	ret	
1837                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1837                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1837                     ; 878 {
1838                     .text:	section	.text,new
1839  0000               _RTC_SetDate:
1841  0000 88            	push	a
1842  0001 89            	pushw	x
1843       00000002      OFST:	set	2
1846                     ; 879   ErrorStatus status = ERROR;
1848                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1850  0002 4d            	tnz	a
1851  0003 2610          	jrne	L757
1853  0005 1e06          	ldw	x,(OFST+4,sp)
1854  0007 e601          	ld	a,(1,x)
1855  0009 a410          	and	a,#16
1856  000b 2708          	jreq	L757
1857                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1859  000d e601          	ld	a,(1,x)
1860  000f a4ef          	and	a,#239
1861  0011 ab0a          	add	a,#10
1862  0013 e701          	ld	(1,x),a
1863  0015               L757:
1864                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1866                     ; 888   if (RTC_Format == RTC_Format_BIN)
1868                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1870                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1872                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1874                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1876                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1879                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1881                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1883                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1885                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1887                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1889                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1891                     ; 907   RTC->WPR = 0xCA;
1893  0015 35ca5159      	mov	20825,#202
1894                     ; 908   RTC->WPR = 0x53;
1896  0019 35535159      	mov	20825,#83
1897                     ; 911   if (RTC_EnterInitMode() == ERROR)
1899  001d cd0000        	call	_RTC_EnterInitMode
1901  0020 4d            	tnz	a
1902  0021 2606          	jrne	L567
1903                     ; 913     status = ERROR;
1906                     ; 915     RTC->WPR = 0xFF; 
1908  0023 35ff5159      	mov	20825,#255
1910  0027 205e          	jra	L767
1911  0029               L567:
1912                     ; 919     (void)(RTC->TR1);
1914  0029 c65140        	ld	a,20800
1915                     ; 922     if (RTC_Format != RTC_Format_BIN)
1917  002c 7b03          	ld	a,(OFST+1,sp)
1918  002e 2718          	jreq	L177
1919                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1921  0030 1e06          	ldw	x,(OFST+4,sp)
1922  0032 e602          	ld	a,(2,x)
1923  0034 c75144        	ld	20804,a
1924                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1926  0037 f6            	ld	a,(x)
1927  0038 97            	ld	xl,a
1928  0039 a620          	ld	a,#32
1929  003b 42            	mul	x,a
1930  003c 9f            	ld	a,xl
1931  003d 1e06          	ldw	x,(OFST+4,sp)
1932  003f ea01          	or	a,(1,x)
1933  0041 c75145        	ld	20805,a
1934                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1936  0044 e603          	ld	a,(3,x)
1938  0046 2027          	jra	L377
1939  0048               L177:
1940                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1942  0048 1e06          	ldw	x,(OFST+4,sp)
1943  004a e602          	ld	a,(2,x)
1944  004c cd0000        	call	L3_ByteToBcd2
1946  004f c75144        	ld	20804,a
1947                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1949  0052 1e06          	ldw	x,(OFST+4,sp)
1950  0054 f6            	ld	a,(x)
1951  0055 97            	ld	xl,a
1952  0056 a620          	ld	a,#32
1953  0058 42            	mul	x,a
1954  0059 9f            	ld	a,xl
1955  005a 6b01          	ld	(OFST-1,sp),a
1957  005c 1e06          	ldw	x,(OFST+4,sp)
1958  005e e601          	ld	a,(1,x)
1959  0060 cd0000        	call	L3_ByteToBcd2
1961  0063 1a01          	or	a,(OFST-1,sp)
1962  0065 c75145        	ld	20805,a
1963                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1965  0068 1e06          	ldw	x,(OFST+4,sp)
1966  006a e603          	ld	a,(3,x)
1967  006c cd0000        	call	L3_ByteToBcd2
1969  006f               L377:
1970  006f c75146        	ld	20806,a
1971                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1973  0072 721f514c      	bres	20812,#7
1974                     ; 939     RTC->WPR = 0xFF; 
1976  0076 35ff5159      	mov	20825,#255
1977                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1979  007a 7208514806    	btjt	20808,#4,L577
1980                     ; 944       if (RTC_WaitForSynchro() == ERROR)
1982  007f cd0000        	call	_RTC_WaitForSynchro
1984  0082 4d            	tnz	a
1985                     ; 946         status = ERROR;
1989  0083 2702          	jreq	L767
1990                     ; 950         status = SUCCESS;
1991  0085               L577:
1992                     ; 955       status = SUCCESS;
1995  0085 a601          	ld	a,#1
1997  0087               L767:
1998                     ; 959   return (ErrorStatus)status;
2002  0087 5b03          	addw	sp,#3
2003  0089 81            	ret	
2040                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2040                     ; 969 {
2041                     .text:	section	.text,new
2042  0000               _RTC_DateStructInit:
2046                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2048  0000 a601          	ld	a,#1
2049  0002 f7            	ld	(x),a
2050                     ; 972   RTC_DateStruct->RTC_Date = 1;
2052  0003 e702          	ld	(2,x),a
2053                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2055  0005 e701          	ld	(1,x),a
2056                     ; 974   RTC_DateStruct->RTC_Year = 0;
2058  0007 6f03          	clr	(3,x)
2059                     ; 975 }
2062  0009 81            	ret	
2117                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2117                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2117                     ; 990 {
2118                     .text:	section	.text,new
2119  0000               _RTC_GetDate:
2121  0000 88            	push	a
2122  0001 88            	push	a
2123       00000001      OFST:	set	1
2126                     ; 991   uint8_t tmpreg = 0;
2128                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2130                     ; 997   (void) (RTC->TR1) ;
2132  0002 c65140        	ld	a,20800
2133                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2135  0005 1e05          	ldw	x,(OFST+4,sp)
2136  0007 c65144        	ld	a,20804
2137  000a e702          	ld	(2,x),a
2138                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2140  000c c65145        	ld	a,20805
2141  000f 6b01          	ld	(OFST+0,sp),a
2143                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2145  0011 c65146        	ld	a,20806
2146  0014 e703          	ld	(3,x),a
2147                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2149  0016 7b01          	ld	a,(OFST+0,sp)
2150  0018 a41f          	and	a,#31
2151  001a e701          	ld	(1,x),a
2152                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2154  001c 7b01          	ld	a,(OFST+0,sp)
2155  001e 4e            	swap	a
2156  001f a40e          	and	a,#14
2157  0021 44            	srl	a
2158  0022 f7            	ld	(x),a
2159                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2161  0023 7b02          	ld	a,(OFST+1,sp)
2162  0025 261b          	jrne	L3501
2163                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2165  0027 e603          	ld	a,(3,x)
2166  0029 cd0000        	call	L5_Bcd2ToByte
2168  002c 1e05          	ldw	x,(OFST+4,sp)
2169  002e e703          	ld	(3,x),a
2170                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2172  0030 e601          	ld	a,(1,x)
2173  0032 cd0000        	call	L5_Bcd2ToByte
2175  0035 1e05          	ldw	x,(OFST+4,sp)
2176  0037 e701          	ld	(1,x),a
2177                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2179  0039 e602          	ld	a,(2,x)
2180  003b cd0000        	call	L5_Bcd2ToByte
2182  003e 1e05          	ldw	x,(OFST+4,sp)
2183  0040 e702          	ld	(2,x),a
2184  0042               L3501:
2185                     ; 1014 }
2188  0042 85            	popw	x
2189  0043 81            	ret	
2330                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2330                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2330                     ; 1046 {
2331                     .text:	section	.text,new
2332  0000               _RTC_SetAlarm:
2334  0000 88            	push	a
2335  0001 5205          	subw	sp,#5
2336       00000005      OFST:	set	5
2339                     ; 1047   uint8_t tmpreg1 = 0;
2341                     ; 1048   uint8_t tmpreg2 = 0;
2343                     ; 1049   uint8_t tmpreg3 = 0;
2345                     ; 1050   uint8_t tmpreg4 = 0;
2347                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2349                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2351                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2353                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2355                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2357                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2358                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2360                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2363                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2365                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2367                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2370                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2372                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2374                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2378  0003 c65148        	ld	a,20808
2379                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2381                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2383                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2385                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2387                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2389                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2392                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2394                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2396                     ; 1108   RTC->WPR = 0xCA;
2398  0006 35ca5159      	mov	20825,#202
2399                     ; 1109   RTC->WPR = 0x53;
2401  000a 35535159      	mov	20825,#83
2402                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2404  000e 7b06          	ld	a,(OFST+1,sp)
2405  0010 272d          	jreq	L3611
2406                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2406                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2408  0012 1e09          	ldw	x,(OFST+4,sp)
2409  0014 e604          	ld	a,(4,x)
2410  0016 a480          	and	a,#128
2411  0018 ea02          	or	a,(2,x)
2412  001a 6b02          	ld	(OFST-3,sp),a
2414                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2414                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2416  001c e604          	ld	a,(4,x)
2417  001e 48            	sll	a
2418  001f a480          	and	a,#128
2419  0021 ea01          	or	a,(1,x)
2420  0023 6b03          	ld	(OFST-2,sp),a
2422                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2422                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2422                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2424  0025 ad7e          	call	LC006
2425  0027 a480          	and	a,#128
2426  0029 6b01          	ld	(OFST-4,sp),a
2428  002b e603          	ld	a,(3,x)
2429  002d fa            	or	a,(x)
2430  002e 1a01          	or	a,(OFST-4,sp)
2431  0030 6b04          	ld	(OFST-1,sp),a
2433                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2433                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2433                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2435  0032 ad71          	call	LC006
2436  0034 48            	sll	a
2437  0035 a480          	and	a,#128
2438  0037 6b01          	ld	(OFST-4,sp),a
2440  0039 e605          	ld	a,(5,x)
2441  003b ea06          	or	a,(6,x)
2443  003d 2047          	jra	L5611
2444  003f               L3611:
2445                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2445                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2447  003f 1e09          	ldw	x,(OFST+4,sp)
2448  0041 e604          	ld	a,(4,x)
2449  0043 a480          	and	a,#128
2450  0045 6b01          	ld	(OFST-4,sp),a
2452  0047 e602          	ld	a,(2,x)
2453  0049 cd0000        	call	L3_ByteToBcd2
2455  004c 1a01          	or	a,(OFST-4,sp)
2456  004e 6b02          	ld	(OFST-3,sp),a
2458                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2458                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2460  0050 1e09          	ldw	x,(OFST+4,sp)
2461  0052 e604          	ld	a,(4,x)
2462  0054 48            	sll	a
2463  0055 a480          	and	a,#128
2464  0057 6b01          	ld	(OFST-4,sp),a
2466  0059 e601          	ld	a,(1,x)
2467  005b cd0000        	call	L3_ByteToBcd2
2469  005e 1a01          	or	a,(OFST-4,sp)
2470  0060 6b03          	ld	(OFST-2,sp),a
2472                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2472                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2472                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2474  0062 1e09          	ldw	x,(OFST+4,sp)
2475  0064 ad3f          	call	LC006
2476  0066 a480          	and	a,#128
2477  0068 6b01          	ld	(OFST-4,sp),a
2479  006a f6            	ld	a,(x)
2480  006b cd0000        	call	L3_ByteToBcd2
2482  006e 1e09          	ldw	x,(OFST+4,sp)
2483  0070 ea03          	or	a,(3,x)
2484  0072 1a01          	or	a,(OFST-4,sp)
2485  0074 6b04          	ld	(OFST-1,sp),a
2487                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2487                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2487                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2489  0076 ad2d          	call	LC006
2490  0078 48            	sll	a
2491  0079 a480          	and	a,#128
2492  007b 6b01          	ld	(OFST-4,sp),a
2494  007d e606          	ld	a,(6,x)
2495  007f cd0000        	call	L3_ByteToBcd2
2497  0082 1e09          	ldw	x,(OFST+4,sp)
2498  0084 ea05          	or	a,(5,x)
2499  0086               L5611:
2500  0086 1a01          	or	a,(OFST-4,sp)
2501  0088 6b05          	ld	(OFST+0,sp),a
2503                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2505  008a 7b02          	ld	a,(OFST-3,sp)
2506  008c c7515c        	ld	20828,a
2507                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2509  008f 7b03          	ld	a,(OFST-2,sp)
2510  0091 c7515d        	ld	20829,a
2511                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2513  0094 7b04          	ld	a,(OFST-1,sp)
2514  0096 c7515e        	ld	20830,a
2515                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2517  0099 7b05          	ld	a,(OFST+0,sp)
2518  009b c7515f        	ld	20831,a
2519                     ; 1154   RTC->WPR = 0xFF; 
2521  009e 35ff5159      	mov	20825,#255
2522                     ; 1155 }
2525  00a2 5b06          	addw	sp,#6
2526  00a4 81            	ret	
2527  00a5               LC006:
2528  00a5 e604          	ld	a,(4,x)
2529  00a7 48            	sll	a
2530  00a8 48            	sll	a
2531  00a9 81            	ret	
2569                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2569                     ; 1166 {
2570                     .text:	section	.text,new
2571  0000               _RTC_AlarmStructInit:
2575                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2577  0000 6f03          	clr	(3,x)
2578                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2580  0002 7f            	clr	(x)
2581                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2583  0003 6f01          	clr	(1,x)
2584                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2586  0005 6f02          	clr	(2,x)
2587                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2589  0007 6f05          	clr	(5,x)
2590                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2592  0009 a601          	ld	a,#1
2593  000b e706          	ld	(6,x),a
2594                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2596  000d a6f0          	ld	a,#240
2597  000f e704          	ld	(4,x),a
2598                     ; 1179 }
2601  0011 81            	ret	
2684                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2684                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2684                     ; 1190 {
2685                     .text:	section	.text,new
2686  0000               _RTC_GetAlarm:
2688  0000 88            	push	a
2689  0001 5204          	subw	sp,#4
2690       00000004      OFST:	set	4
2693                     ; 1191   uint8_t tmpreg1 = 0;
2695                     ; 1192   uint8_t tmpreg2 = 0;
2697                     ; 1193   uint8_t tmpreg3 = 0;
2699                     ; 1194   uint8_t tmpreg4 = 0;
2701                     ; 1195   uint8_t alarmmask = 0;
2703                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2705                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2707  0003 c6515c        	ld	a,20828
2708  0006 6b04          	ld	(OFST+0,sp),a
2710                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2712  0008 c6515d        	ld	a,20829
2713  000b 6b01          	ld	(OFST-3,sp),a
2715                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2717  000d c6515e        	ld	a,20830
2718  0010 6b02          	ld	(OFST-2,sp),a
2720                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2722  0012 c6515f        	ld	a,20831
2723  0015 6b03          	ld	(OFST-1,sp),a
2725                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2727  0017 7b04          	ld	a,(OFST+0,sp)
2728  0019 1e08          	ldw	x,(OFST+4,sp)
2729  001b a47f          	and	a,#127
2730  001d e702          	ld	(2,x),a
2731                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2733  001f 7b04          	ld	a,(OFST+0,sp)
2734  0021 a480          	and	a,#128
2735  0023 6b04          	ld	(OFST+0,sp),a
2737                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2739  0025 7b01          	ld	a,(OFST-3,sp)
2740  0027 a47f          	and	a,#127
2741  0029 e701          	ld	(1,x),a
2742                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2744  002b 7b01          	ld	a,(OFST-3,sp)
2745  002d a480          	and	a,#128
2746  002f 44            	srl	a
2747  0030 1a04          	or	a,(OFST+0,sp)
2748  0032 6b04          	ld	(OFST+0,sp),a
2750                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2752  0034 7b02          	ld	a,(OFST-2,sp)
2753  0036 a43f          	and	a,#63
2754  0038 f7            	ld	(x),a
2755                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2757  0039 7b02          	ld	a,(OFST-2,sp)
2758  003b a440          	and	a,#64
2759  003d e703          	ld	(3,x),a
2760                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2762  003f 7b02          	ld	a,(OFST-2,sp)
2763  0041 a480          	and	a,#128
2764  0043 44            	srl	a
2765  0044 44            	srl	a
2766  0045 1a04          	or	a,(OFST+0,sp)
2767  0047 6b04          	ld	(OFST+0,sp),a
2769                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2771  0049 7b03          	ld	a,(OFST-1,sp)
2772  004b a43f          	and	a,#63
2773  004d e706          	ld	(6,x),a
2774                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2776  004f 7b03          	ld	a,(OFST-1,sp)
2777  0051 a440          	and	a,#64
2778  0053 e705          	ld	(5,x),a
2779                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2781  0055 7b03          	ld	a,(OFST-1,sp)
2782  0057 a480          	and	a,#128
2783  0059 44            	srl	a
2784  005a 44            	srl	a
2785  005b 44            	srl	a
2786  005c 1a04          	or	a,(OFST+0,sp)
2787  005e 6b04          	ld	(OFST+0,sp),a
2789                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2791  0060 e704          	ld	(4,x),a
2792                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2794  0062 7b05          	ld	a,(OFST+1,sp)
2795  0064 2622          	jrne	L5421
2796                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2798  0066 f6            	ld	a,(x)
2799  0067 cd0000        	call	L5_Bcd2ToByte
2801  006a 1e08          	ldw	x,(OFST+4,sp)
2802  006c f7            	ld	(x),a
2803                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2805  006d e601          	ld	a,(1,x)
2806  006f cd0000        	call	L5_Bcd2ToByte
2808  0072 1e08          	ldw	x,(OFST+4,sp)
2809  0074 e701          	ld	(1,x),a
2810                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2812  0076 e602          	ld	a,(2,x)
2813  0078 cd0000        	call	L5_Bcd2ToByte
2815  007b 1e08          	ldw	x,(OFST+4,sp)
2816  007d e702          	ld	(2,x),a
2817                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2819  007f e606          	ld	a,(6,x)
2820  0081 cd0000        	call	L5_Bcd2ToByte
2822  0084 1e08          	ldw	x,(OFST+4,sp)
2823  0086 e706          	ld	(6,x),a
2824  0088               L5421:
2825                     ; 1233 }
2828  0088 5b05          	addw	sp,#5
2829  008a 81            	ret	
2891                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2891                     ; 1243 {
2892                     .text:	section	.text,new
2893  0000               _RTC_AlarmCmd:
2895  0000 5203          	subw	sp,#3
2896       00000003      OFST:	set	3
2899                     ; 1244   __IO uint16_t alrawfcount = 0;
2901  0002 5f            	clrw	x
2902  0003 1f01          	ldw	(OFST-2,sp),x
2904                     ; 1245   ErrorStatus status = ERROR;
2906                     ; 1246   uint8_t temp1 = 0;
2908                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
2910                     ; 1252   RTC->WPR = 0xCA;
2912  0005 35ca5159      	mov	20825,#202
2913                     ; 1253   RTC->WPR = 0x53;
2915  0009 35535159      	mov	20825,#83
2916                     ; 1256   if (NewState != DISABLE)
2918  000d 4d            	tnz	a
2919  000e 2711          	jreq	L7721
2920                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2922  0010 72105149      	bset	20809,#0
2923                     ; 1259     status = SUCCESS;
2925  0014               LC007:
2927  0014 a601          	ld	a,#1
2928  0016 6b03          	ld	(OFST+0,sp),a
2931  0018               L1031:
2932                     ; 1283   RTC->WPR = 0xFF; 
2934  0018 35ff5159      	mov	20825,#255
2935                     ; 1286   return (ErrorStatus)status;
2937  001c 7b03          	ld	a,(OFST+0,sp)
2940  001e 5b03          	addw	sp,#3
2941  0020 81            	ret	
2942  0021               L7721:
2943                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2945  0021 72115149      	bres	20809,#0
2946                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2948  0025 c6514c        	ld	a,20812
2949  0028 a401          	and	a,#1
2950  002a 6b03          	ld	(OFST+0,sp),a
2953  002c 2005          	jra	L7031
2954  002e               L3031:
2955                     ; 1269       alrawfcount++;
2957  002e 1e01          	ldw	x,(OFST-2,sp)
2958  0030 5c            	incw	x
2959  0031 1f01          	ldw	(OFST-2,sp),x
2961  0033               L7031:
2962                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2964  0033 1e01          	ldw	x,(OFST-2,sp)
2965  0035 5c            	incw	x
2966  0036 2704          	jreq	L3131
2968  0038 7b03          	ld	a,(OFST+0,sp)
2969  003a 27f2          	jreq	L3031
2970  003c               L3131:
2971                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2973  003c 7200514c04    	btjt	20812,#0,L5131
2974                     ; 1274       status = ERROR;
2976  0041 0f03          	clr	(OFST+0,sp)
2979  0043 20d3          	jra	L1031
2980  0045               L5131:
2981                     ; 1278       status = SUCCESS;
2982  0045 20cd          	jp	LC007
3179                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3179                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3179                     ; 1300 {
3180                     .text:	section	.text,new
3181  0000               _RTC_AlarmSubSecondConfig:
3183  0000 89            	pushw	x
3184  0001 88            	push	a
3185       00000001      OFST:	set	1
3188                     ; 1301   uint8_t alarmstatus = 0;
3190                     ; 1302   ErrorStatus status = ERROR;
3192                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3194                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3196                     ; 1309   RTC->WPR = 0xCA;
3198  0002 35ca5159      	mov	20825,#202
3199                     ; 1310   RTC->WPR = 0x53;
3201  0006 35535159      	mov	20825,#83
3202                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3204  000a 720c514c26    	btjt	20812,#6,L3141
3205                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3207  000f c65149        	ld	a,20809
3208  0012 aa01          	or	a,#1
3209  0014 6b01          	ld	(OFST+0,sp),a
3211                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3213  0016 72115149      	bres	20809,#0
3214                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3216  001a 9e            	ld	a,xh
3217  001b c75164        	ld	20836,a
3218                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3220  001e 9f            	ld	a,xl
3221  001f c75165        	ld	20837,a
3222                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3224  0022 7b06          	ld	a,(OFST+5,sp)
3225  0024 c75166        	ld	20838,a
3226                     ; 1327     RTC->CR2 |= alarmstatus;
3228  0027 c65149        	ld	a,20809
3229  002a 1a01          	or	a,(OFST+0,sp)
3230  002c c75149        	ld	20809,a
3231                     ; 1329     status = SUCCESS;
3233  002f a601          	ld	a,#1
3234  0031 6b01          	ld	(OFST+0,sp),a
3237  0033 2002          	jra	L5141
3238  0035               L3141:
3239                     ; 1333     status = ERROR;
3241  0035 0f01          	clr	(OFST+0,sp)
3243  0037               L5141:
3244                     ; 1337   RTC->WPR = 0xFF; 
3246  0037 35ff5159      	mov	20825,#255
3247                     ; 1339   return (ErrorStatus)status;
3249  003b 7b01          	ld	a,(OFST+0,sp)
3252  003d 5b03          	addw	sp,#3
3253  003f 81            	ret	
3343                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3343                     ; 1370 {
3344                     .text:	section	.text,new
3345  0000               _RTC_WakeUpClockConfig:
3347  0000 88            	push	a
3348       00000000      OFST:	set	0
3351                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3353                     ; 1376   RTC->WPR = 0xCA;
3355  0001 35ca5159      	mov	20825,#202
3356                     ; 1377   RTC->WPR = 0x53;
3358  0005 35535159      	mov	20825,#83
3359                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3361  0009 72155149      	bres	20809,#2
3362                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3364  000d c65148        	ld	a,20808
3365  0010 a4f8          	and	a,#248
3366  0012 c75148        	ld	20808,a
3367                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3369  0015 c65148        	ld	a,20808
3370  0018 1a01          	or	a,(OFST+1,sp)
3371  001a c75148        	ld	20808,a
3372                     ; 1389   RTC->WPR = 0xFF; 
3374  001d 35ff5159      	mov	20825,#255
3375                     ; 1390 }
3378  0021 84            	pop	a
3379  0022 81            	ret	
3412                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3412                     ; 1401 {
3413                     .text:	section	.text,new
3414  0000               _RTC_SetWakeUpCounter:
3418                     ; 1403   RTC->WPR = 0xCA;
3420  0000 35ca5159      	mov	20825,#202
3421                     ; 1404   RTC->WPR = 0x53;
3423  0004 35535159      	mov	20825,#83
3424                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3426  0008 9e            	ld	a,xh
3427  0009 c75154        	ld	20820,a
3428                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3430  000c 9f            	ld	a,xl
3431  000d c75155        	ld	20821,a
3432                     ; 1412   RTC->WPR = 0xFF; 
3434  0010 35ff5159      	mov	20825,#255
3435                     ; 1413 }
3438  0014 81            	ret	
3471                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3471                     ; 1421 {
3472                     .text:	section	.text,new
3473  0000               _RTC_GetWakeUpCounter:
3475  0000 89            	pushw	x
3476       00000002      OFST:	set	2
3479                     ; 1422   uint16_t tmpreg = 0;
3481                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3483  0001 c65154        	ld	a,20820
3484  0004 97            	ld	xl,a
3485  0005 4f            	clr	a
3486  0006 02            	rlwa	x,a
3487  0007 1f01          	ldw	(OFST-1,sp),x
3489                     ; 1426   tmpreg |= RTC->WUTRL;
3491  0009 c65155        	ld	a,20821
3492  000c 5f            	clrw	x
3493  000d 97            	ld	xl,a
3494  000e 01            	rrwa	x,a
3495  000f 1a02          	or	a,(OFST+0,sp)
3496  0011 01            	rrwa	x,a
3497  0012 1a01          	or	a,(OFST-1,sp)
3498  0014 01            	rrwa	x,a
3500                     ; 1429   return (uint16_t)tmpreg;
3504  0015 5b02          	addw	sp,#2
3505  0017 81            	ret	
3558                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3558                     ; 1441 {
3559                     .text:	section	.text,new
3560  0000               _RTC_WakeUpCmd:
3562  0000 5203          	subw	sp,#3
3563       00000003      OFST:	set	3
3566                     ; 1442   ErrorStatus status = ERROR;
3568                     ; 1443   uint16_t wutwfcount = 0;
3570  0002 5f            	clrw	x
3571  0003 1f02          	ldw	(OFST-1,sp),x
3573                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3575                     ; 1449   RTC->WPR = 0xCA;
3577  0005 35ca5159      	mov	20825,#202
3578                     ; 1450   RTC->WPR = 0x53;
3580  0009 35535159      	mov	20825,#83
3581                     ; 1452   if (NewState != DISABLE)
3583  000d 4d            	tnz	a
3584  000e 2711          	jreq	L1351
3585                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3587  0010 72145149      	bset	20809,#2
3588                     ; 1457     status = SUCCESS;
3590  0014               LC008:
3592  0014 a601          	ld	a,#1
3593  0016 6b01          	ld	(OFST-2,sp),a
3596  0018               L3351:
3597                     ; 1482   RTC->WPR = 0xFF; 
3599  0018 35ff5159      	mov	20825,#255
3600                     ; 1485   return (ErrorStatus)status;
3602  001c 7b01          	ld	a,(OFST-2,sp)
3605  001e 5b03          	addw	sp,#3
3606  0020 81            	ret	
3607  0021               L1351:
3608                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3610  0021 72155149      	bres	20809,#2
3612  0025 2003          	jra	L7351
3613  0027               L5351:
3614                     ; 1467       wutwfcount++;
3616  0027 5c            	incw	x
3617  0028 1f02          	ldw	(OFST-1,sp),x
3619  002a               L7351:
3620                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3622  002a 7204514c05    	btjt	20812,#2,L3451
3624  002f a3ffff        	cpw	x,#65535
3625  0032 26f3          	jrne	L5351
3626  0034               L3451:
3627                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3629  0034 7204514c04    	btjt	20812,#2,L5451
3630                     ; 1473       status = ERROR;
3632  0039 0f01          	clr	(OFST-2,sp)
3635  003b 20db          	jra	L3351
3636  003d               L5451:
3637                     ; 1477       status = SUCCESS;
3638  003d 20d5          	jp	LC008
3728                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3728                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3728                     ; 1524 {
3729                     .text:	section	.text,new
3730  0000               _RTC_DayLightSavingConfig:
3732  0000 89            	pushw	x
3733       00000000      OFST:	set	0
3736                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3738                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3740                     ; 1530   RTC->WPR = 0xCA;
3742  0001 35ca5159      	mov	20825,#202
3743                     ; 1531   RTC->WPR = 0x53;
3745  0005 35535159      	mov	20825,#83
3746                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3748  0009 7215514a      	bres	20810,#2
3749                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3751  000d 9f            	ld	a,xl
3752  000e 1a01          	or	a,(OFST+1,sp)
3753  0010 ca514a        	or	a,20810
3754  0013 c7514a        	ld	20810,a
3755                     ; 1540   RTC->WPR = 0xFF; 
3757  0016 35ff5159      	mov	20825,#255
3758                     ; 1541 }
3761  001a 85            	popw	x
3762  001b 81            	ret	
3787                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3787                     ; 1550 {
3788                     .text:	section	.text,new
3789  0000               _RTC_GetStoreOperation:
3793                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3795  0000 c6514a        	ld	a,20810
3796  0003 a404          	and	a,#4
3799  0005 81            	ret	
3893                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3893                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3893                     ; 1589 {
3894                     .text:	section	.text,new
3895  0000               _RTC_OutputConfig:
3897  0000 89            	pushw	x
3898       00000000      OFST:	set	0
3901                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3903                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3905                     ; 1595   RTC->WPR = 0xCA;
3907  0001 35ca5159      	mov	20825,#202
3908                     ; 1596   RTC->WPR = 0x53;
3910  0005 35535159      	mov	20825,#83
3911                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3913  0009 c6514a        	ld	a,20810
3914  000c a48f          	and	a,#143
3915  000e c7514a        	ld	20810,a
3916                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3918  0011 9f            	ld	a,xl
3919  0012 1a01          	or	a,(OFST+1,sp)
3920  0014 ca514a        	or	a,20810
3921  0017 c7514a        	ld	20810,a
3922                     ; 1605   RTC->WPR = 0xFF; 
3924  001a 35ff5159      	mov	20825,#255
3925                     ; 1606 }
3928  001e 85            	popw	x
3929  001f 81            	ret	
4018                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4018                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4018                     ; 1641 {
4019                     .text:	section	.text,new
4020  0000               _RTC_SynchroShiftConfig:
4022  0000 88            	push	a
4023  0001 5203          	subw	sp,#3
4024       00000003      OFST:	set	3
4027                     ; 1642   uint8_t shiftrhreg = 0;
4029                     ; 1643   ErrorStatus status = ERROR;
4031                     ; 1644   uint16_t shpfcount = 0;
4033  0003 5f            	clrw	x
4034  0004 1f02          	ldw	(OFST-1,sp),x
4036                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4038                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4040                     ; 1651   RTC->WPR = 0xCA;
4042  0006 35ca5159      	mov	20825,#202
4043                     ; 1652   RTC->WPR = 0x53;
4045  000a 35535159      	mov	20825,#83
4046                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4048  000e 7207514c0f    	btjf	20812,#3,L7271
4050  0013 2003          	jra	L3371
4051  0015               L1371:
4052                     ; 1660       shpfcount++;
4054  0015 5c            	incw	x
4055  0016 1f02          	ldw	(OFST-1,sp),x
4057  0018               L3371:
4058                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4060  0018 7207514c05    	btjf	20812,#3,L7271
4062  001d a3ffff        	cpw	x,#65535
4063  0020 26f3          	jrne	L1371
4064  0022               L7271:
4065                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4067  0022 7206514c12    	btjt	20812,#3,L1471
4068                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4070  0027 7b07          	ld	a,(OFST+4,sp)
4071  0029 1a04          	or	a,(OFST+1,sp)
4073                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4075  002b c7515a        	ld	20826,a
4076                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4078  002e 7b08          	ld	a,(OFST+5,sp)
4079  0030 c7515b        	ld	20827,a
4080                     ; 1672     status = SUCCESS;
4082  0033 a601          	ld	a,#1
4083  0035 6b01          	ld	(OFST-2,sp),a
4086  0037 2002          	jra	L3471
4087  0039               L1471:
4088                     ; 1676     status = ERROR;
4090  0039 0f01          	clr	(OFST-2,sp)
4092  003b               L3471:
4093                     ; 1680   RTC->WPR = 0xFF; 
4095  003b 35ff5159      	mov	20825,#255
4096                     ; 1682   return (ErrorStatus)(status);
4098  003f 7b01          	ld	a,(OFST-2,sp)
4101  0041 5b04          	addw	sp,#4
4102  0043 81            	ret	
4228                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4228                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4228                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4228                     ; 1721 {
4229                     .text:	section	.text,new
4230  0000               _RTC_SmoothCalibConfig:
4232  0000 89            	pushw	x
4233  0001 5203          	subw	sp,#3
4234       00000003      OFST:	set	3
4237                     ; 1722   ErrorStatus status = ERROR;
4239                     ; 1723   uint16_t recalpfcount = 0;
4241  0003 5f            	clrw	x
4242  0004 1f02          	ldw	(OFST-1,sp),x
4244                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4246                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4248                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4250                     ; 1731   RTC->WPR = 0xCA;
4252  0006 35ca5159      	mov	20825,#202
4253                     ; 1732   RTC->WPR = 0x53;
4255  000a 35535159      	mov	20825,#83
4256                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4258  000e 7203514c0f    	btjf	20812,#1,L1202
4260  0013 2003          	jra	L5202
4261  0015               L3202:
4262                     ; 1740       recalpfcount++;
4264  0015 5c            	incw	x
4265  0016 1f02          	ldw	(OFST-1,sp),x
4267  0018               L5202:
4268                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4270  0018 7203514c05    	btjf	20812,#1,L1202
4272  001d a3ffff        	cpw	x,#65535
4273  0020 26f3          	jrne	L3202
4274  0022               L1202:
4275                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4277  0022 7202514c14    	btjt	20812,#1,L3302
4278                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4278                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4278                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4280  0027 7b04          	ld	a,(OFST+1,sp)
4281  0029 1a05          	or	a,(OFST+2,sp)
4282  002b 1a08          	or	a,(OFST+5,sp)
4283  002d c7516a        	ld	20842,a
4284                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4286  0030 7b09          	ld	a,(OFST+6,sp)
4287  0032 c7516b        	ld	20843,a
4288                     ; 1754     status = SUCCESS;
4290  0035 a601          	ld	a,#1
4291  0037 6b01          	ld	(OFST-2,sp),a
4294  0039 2002          	jra	L5302
4295  003b               L3302:
4296                     ; 1758     status = ERROR;
4298  003b 0f01          	clr	(OFST-2,sp)
4300  003d               L5302:
4301                     ; 1762   RTC->WPR = 0xFF; 
4303  003d 35ff5159      	mov	20825,#255
4304                     ; 1764   return (ErrorStatus)(status);
4306  0041 7b01          	ld	a,(OFST-2,sp)
4309  0043 5b05          	addw	sp,#5
4310  0045 81            	ret	
4368                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4368                     ; 1791 {
4369                     .text:	section	.text,new
4370  0000               _RTC_CalibOutputConfig:
4374                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4376                     ; 1796   RTC->WPR = 0xCA;
4378  0000 35ca5159      	mov	20825,#202
4379                     ; 1797   RTC->WPR = 0x53;
4381  0004 35535159      	mov	20825,#83
4382                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4384  0008 4d            	tnz	a
4385  0009 2706          	jreq	L5602
4386                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4388  000b 7216514a      	bset	20810,#3
4390  000f 2004          	jra	L7602
4391  0011               L5602:
4392                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4394  0011 7217514a      	bres	20810,#3
4395  0015               L7602:
4396                     ; 1811   RTC->WPR = 0xFF; 
4398  0015 35ff5159      	mov	20825,#255
4399                     ; 1812 }
4402  0019 81            	ret	
4437                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4437                     ; 1821 {
4438                     .text:	section	.text,new
4439  0000               _RTC_CalibOutputCmd:
4443                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4445                     ; 1826   RTC->WPR = 0xCA;
4447  0000 35ca5159      	mov	20825,#202
4448                     ; 1827   RTC->WPR = 0x53;
4450  0004 35535159      	mov	20825,#83
4451                     ; 1829   if (NewState != DISABLE)
4453  0008 4d            	tnz	a
4454  0009 2706          	jreq	L7012
4455                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4457  000b 721e514a      	bset	20810,#7
4459  000f 2004          	jra	L1112
4460  0011               L7012:
4461                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4463  0011 721f514a      	bres	20810,#7
4464  0015               L1112:
4465                     ; 1841   RTC->WPR = 0xFF; 
4467  0015 35ff5159      	mov	20825,#255
4468                     ; 1842 }
4471  0019 81            	ret	
4566                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4566                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4566                     ; 1873 {
4567                     .text:	section	.text,new
4568  0000               _RTC_TamperLevelConfig:
4570  0000 89            	pushw	x
4571       00000000      OFST:	set	0
4574                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4576                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4578                     ; 1879   RTC->WPR = 0xCA;
4580  0001 35ca5159      	mov	20825,#202
4581                     ; 1880   RTC->WPR = 0x53;
4583  0005 35535159      	mov	20825,#83
4584                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4586  0009 9f            	ld	a,xl
4587  000a 4d            	tnz	a
4588  000b 2707          	jreq	L7512
4589                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4591  000d 9e            	ld	a,xh
4592  000e 48            	sll	a
4593  000f ca516c        	or	a,20844
4595  0012 2007          	jra	L1612
4596  0014               L7512:
4597                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4599  0014 7b01          	ld	a,(OFST+1,sp)
4600  0016 48            	sll	a
4601  0017 43            	cpl	a
4602  0018 c4516c        	and	a,20844
4603  001b               L1612:
4604  001b c7516c        	ld	20844,a
4605                     ; 1894   RTC->WPR = 0xFF; 
4607  001e 35ff5159      	mov	20825,#255
4608                     ; 1895 }
4611  0022 85            	popw	x
4612  0023 81            	ret	
4686                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4686                     ; 1904 {
4687                     .text:	section	.text,new
4688  0000               _RTC_TamperFilterConfig:
4690  0000 88            	push	a
4691       00000000      OFST:	set	0
4694                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4696                     ; 1910   RTC->WPR = 0xCA;
4698  0001 35ca5159      	mov	20825,#202
4699                     ; 1911   RTC->WPR = 0x53;
4701  0005 35535159      	mov	20825,#83
4702                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4704  0009 c6516d        	ld	a,20845
4705  000c a4e7          	and	a,#231
4706  000e c7516d        	ld	20845,a
4707                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4709  0011 c6516d        	ld	a,20845
4710  0014 1a01          	or	a,(OFST+1,sp)
4711  0016 c7516d        	ld	20845,a
4712                     ; 1920   RTC->WPR = 0xFF; 
4714  0019 35ff5159      	mov	20825,#255
4715                     ; 1922 }
4718  001d 84            	pop	a
4719  001e 81            	ret	
4832                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4832                     ; 1932 {
4833                     .text:	section	.text,new
4834  0000               _RTC_TamperSamplingFreqConfig:
4836  0000 88            	push	a
4837       00000000      OFST:	set	0
4840                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4842                     ; 1937   RTC->WPR = 0xCA;
4844  0001 35ca5159      	mov	20825,#202
4845                     ; 1938   RTC->WPR = 0x53;
4847  0005 35535159      	mov	20825,#83
4848                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4850  0009 c6516d        	ld	a,20845
4851  000c a4f8          	and	a,#248
4852  000e c7516d        	ld	20845,a
4853                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4855  0011 c6516d        	ld	a,20845
4856  0014 1a01          	or	a,(OFST+1,sp)
4857  0016 c7516d        	ld	20845,a
4858                     ; 1947   RTC->WPR = 0xFF; 
4860  0019 35ff5159      	mov	20825,#255
4861                     ; 1948 }
4864  001d 84            	pop	a
4865  001e 81            	ret	
4948                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4948                     ; 1959 {
4949                     .text:	section	.text,new
4950  0000               _RTC_TamperPinsPrechargeDuration:
4952  0000 88            	push	a
4953       00000000      OFST:	set	0
4956                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4958                     ; 1964   RTC->WPR = 0xCA;
4960  0001 35ca5159      	mov	20825,#202
4961                     ; 1965   RTC->WPR = 0x53;
4963  0005 35535159      	mov	20825,#83
4964                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4966  0009 c6516d        	ld	a,20845
4967  000c a41f          	and	a,#31
4968  000e c7516d        	ld	20845,a
4969                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4971  0011 c6516d        	ld	a,20845
4972  0014 1a01          	or	a,(OFST+1,sp)
4973  0016 c7516d        	ld	20845,a
4974                     ; 1974   RTC->WPR = 0xFF; 
4976  0019 35ff5159      	mov	20825,#255
4977                     ; 1975 }
4980  001d 84            	pop	a
4981  001e 81            	ret	
5026                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5026                     ; 1988                    FunctionalState NewState)
5026                     ; 1989 {
5027                     .text:	section	.text,new
5028  0000               _RTC_TamperCmd:
5030  0000 89            	pushw	x
5031       00000000      OFST:	set	0
5034                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5036                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5038                     ; 1996   RTC->WPR = 0xCA;
5040  0001 35ca5159      	mov	20825,#202
5041                     ; 1997   RTC->WPR = 0x53;
5043  0005 35535159      	mov	20825,#83
5044                     ; 2000   if (NewState != DISABLE)
5046  0009 9f            	ld	a,xl
5047  000a 4d            	tnz	a
5048  000b 2706          	jreq	L5332
5049                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5051  000d 9e            	ld	a,xh
5052  000e ca516c        	or	a,20844
5054  0011 2006          	jra	L7332
5055  0013               L5332:
5056                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5058  0013 7b01          	ld	a,(OFST+1,sp)
5059  0015 43            	cpl	a
5060  0016 c4516c        	and	a,20844
5061  0019               L7332:
5062  0019 c7516c        	ld	20844,a
5063                     ; 2013   RTC->WPR = 0xFF; 
5065  001c 35ff5159      	mov	20825,#255
5066                     ; 2014 }
5069  0020 85            	popw	x
5070  0021 81            	ret	
5142                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5142                     ; 2059 {
5143                     .text:	section	.text,new
5144  0000               _RTC_ITConfig:
5146  0000 89            	pushw	x
5147       00000000      OFST:	set	0
5150                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5152                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5154                     ; 2065   RTC->WPR = 0xCA;
5156  0001 35ca5159      	mov	20825,#202
5157                     ; 2066   RTC->WPR = 0x53;
5159  0005 35535159      	mov	20825,#83
5160                     ; 2068   if (NewState != DISABLE)
5162  0009 7b05          	ld	a,(OFST+5,sp)
5163  000b 2712          	jreq	L5732
5164                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5166  000d 9f            	ld	a,xl
5167  000e a4f0          	and	a,#240
5168  0010 ca5149        	or	a,20809
5169  0013 c75149        	ld	20809,a
5170                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5172  0016 7b02          	ld	a,(OFST+2,sp)
5173  0018 a401          	and	a,#1
5174  001a ca516c        	or	a,20844
5176  001d 2013          	jra	L7732
5177  001f               L5732:
5178                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5180  001f 7b02          	ld	a,(OFST+2,sp)
5181  0021 a4f0          	and	a,#240
5182  0023 43            	cpl	a
5183  0024 c45149        	and	a,20809
5184  0027 c75149        	ld	20809,a
5185                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5187  002a 7b02          	ld	a,(OFST+2,sp)
5188  002c a401          	and	a,#1
5189  002e 43            	cpl	a
5190  002f c4516c        	and	a,20844
5191  0032               L7732:
5192  0032 c7516c        	ld	20844,a
5193                     ; 2082   RTC->WPR = 0xFF; 
5195  0035 35ff5159      	mov	20825,#255
5196                     ; 2083 }
5199  0039 85            	popw	x
5200  003a 81            	ret	
5370                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5370                     ; 2091 {
5371                     .text:	section	.text,new
5372  0000               _RTC_GetFlagStatus:
5374  0000 89            	pushw	x
5375  0001 5203          	subw	sp,#3
5376       00000003      OFST:	set	3
5379                     ; 2092   FlagStatus flagstatus = RESET;
5381                     ; 2093   uint16_t tmpreg1 = 0;
5383                     ; 2094   uint16_t tmpreg2 = 0;
5385                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5387                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5389  0003 c6514c        	ld	a,20812
5390  0006 97            	ld	xl,a
5391  0007 4f            	clr	a
5392  0008 02            	rlwa	x,a
5393  0009 1f02          	ldw	(OFST-1,sp),x
5395                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5397  000b c6514d        	ld	a,20813
5398  000e 5f            	clrw	x
5399  000f 97            	ld	xl,a
5400  0010 01            	rrwa	x,a
5401  0011 1a03          	or	a,(OFST+0,sp)
5402  0013 01            	rrwa	x,a
5403  0014 1a02          	or	a,(OFST-1,sp)
5404  0016 01            	rrwa	x,a
5405  0017 1f02          	ldw	(OFST-1,sp),x
5407                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5409  0019 01            	rrwa	x,a
5410  001a 1405          	and	a,(OFST+2,sp)
5411  001c 01            	rrwa	x,a
5412  001d 1404          	and	a,(OFST+1,sp)
5413  001f 01            	rrwa	x,a
5414  0020 5d            	tnzw	x
5415  0021 2704          	jreq	L3742
5416                     ; 2106     flagstatus = SET;
5418  0023 a601          	ld	a,#1
5421  0025 2001          	jra	L5742
5422  0027               L3742:
5423                     ; 2110     flagstatus = RESET;
5425  0027 4f            	clr	a
5427  0028               L5742:
5428                     ; 2112   return (FlagStatus)flagstatus;
5432  0028 5b05          	addw	sp,#5
5433  002a 81            	ret	
5468                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5468                     ; 2123 {
5469                     .text:	section	.text,new
5470  0000               _RTC_ClearFlag:
5472  0000 89            	pushw	x
5473       00000000      OFST:	set	0
5476                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5478                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5480  0001 9f            	ld	a,xl
5481  0002 43            	cpl	a
5482  0003 c7514d        	ld	20813,a
5483                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5485  0006 7b01          	ld	a,(OFST+1,sp)
5486  0008 43            	cpl	a
5487  0009 a47f          	and	a,#127
5488  000b c7514c        	ld	20812,a
5489                     ; 2130 }
5492  000e 85            	popw	x
5493  000f 81            	ret	
5553                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5553                     ; 2139 {
5554                     .text:	section	.text,new
5555  0000               _RTC_GetITStatus:
5557  0000 89            	pushw	x
5558  0001 89            	pushw	x
5559       00000002      OFST:	set	2
5562                     ; 2140   ITStatus itstatus = RESET;
5564                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5568                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5570                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5572  0002 9f            	ld	a,xl
5573  0003 c45149        	and	a,20809
5574  0006 6b01          	ld	(OFST-1,sp),a
5576                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5578  0008 1e03          	ldw	x,(OFST+1,sp)
5579  000a 54            	srlw	x
5580  000b 54            	srlw	x
5581  000c 54            	srlw	x
5582  000d 54            	srlw	x
5583  000e 9f            	ld	a,xl
5584  000f c4514d        	and	a,20813
5585  0012 6b02          	ld	(OFST+0,sp),a
5587                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5589  0014 7b01          	ld	a,(OFST-1,sp)
5590  0016 2708          	jreq	L3452
5592  0018 7b02          	ld	a,(OFST+0,sp)
5593  001a 2704          	jreq	L3452
5594                     ; 2155     itstatus = SET;
5596  001c a601          	ld	a,#1
5599  001e 2001          	jra	L5452
5600  0020               L3452:
5601                     ; 2159     itstatus = RESET;
5603  0020 4f            	clr	a
5605  0021               L5452:
5606                     ; 2162   return (ITStatus)itstatus;
5610  0021 5b04          	addw	sp,#4
5611  0023 81            	ret	
5647                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5647                     ; 2173 {
5648                     .text:	section	.text,new
5649  0000               _RTC_ClearITPendingBit:
5653                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5655                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5657  0000 54            	srlw	x
5658  0001 54            	srlw	x
5659  0002 54            	srlw	x
5660  0003 54            	srlw	x
5661  0004 9f            	ld	a,xl
5662  0005 43            	cpl	a
5663  0006 c7514d        	ld	20813,a
5664                     ; 2179 }
5667  0009 81            	ret	
5706                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5706                     ; 2203 {
5707                     .text:	section	.text,new
5708  0000               L3_ByteToBcd2:
5710  0000 88            	push	a
5711  0001 88            	push	a
5712       00000001      OFST:	set	1
5715                     ; 2204   uint8_t bcdhigh = 0;
5717  0002 0f01          	clr	(OFST+0,sp)
5720  0004 7b02          	ld	a,(OFST+1,sp)
5721  0006 2006          	jra	L7062
5722  0008               L3062:
5723                     ; 2208     bcdhigh++;
5725  0008 0c01          	inc	(OFST+0,sp)
5727                     ; 2209     Value -= 10;
5729  000a a00a          	sub	a,#10
5730  000c 6b02          	ld	(OFST+1,sp),a
5731  000e               L7062:
5732                     ; 2206   while (Value >= 10)
5734  000e a10a          	cp	a,#10
5735  0010 24f6          	jruge	L3062
5736                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5738  0012 7b01          	ld	a,(OFST+0,sp)
5739  0014 97            	ld	xl,a
5740  0015 a610          	ld	a,#16
5741  0017 42            	mul	x,a
5742  0018 9f            	ld	a,xl
5743  0019 1a02          	or	a,(OFST+1,sp)
5746  001b 85            	popw	x
5747  001c 81            	ret	
5786                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5786                     ; 2221 {
5787                     .text:	section	.text,new
5788  0000               L5_Bcd2ToByte:
5790  0000 88            	push	a
5791  0001 88            	push	a
5792       00000001      OFST:	set	1
5795                     ; 2222   uint8_t tmp = 0;
5797                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5799  0002 4e            	swap	a
5800  0003 a40f          	and	a,#15
5801  0005 97            	ld	xl,a
5802  0006 a60a          	ld	a,#10
5803  0008 42            	mul	x,a
5804  0009 9f            	ld	a,xl
5805  000a 6b01          	ld	(OFST+0,sp),a
5807                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5809  000c 7b02          	ld	a,(OFST+1,sp)
5810  000e a40f          	and	a,#15
5811  0010 1b01          	add	a,(OFST+0,sp)
5814  0012 85            	popw	x
5815  0013 81            	ret	
5828                     	xdef	_RTC_ClearITPendingBit
5829                     	xdef	_RTC_GetITStatus
5830                     	xdef	_RTC_ClearFlag
5831                     	xdef	_RTC_GetFlagStatus
5832                     	xdef	_RTC_ITConfig
5833                     	xdef	_RTC_TamperCmd
5834                     	xdef	_RTC_TamperPinsPrechargeDuration
5835                     	xdef	_RTC_TamperSamplingFreqConfig
5836                     	xdef	_RTC_TamperFilterConfig
5837                     	xdef	_RTC_TamperLevelConfig
5838                     	xdef	_RTC_CalibOutputCmd
5839                     	xdef	_RTC_CalibOutputConfig
5840                     	xdef	_RTC_SmoothCalibConfig
5841                     	xdef	_RTC_SynchroShiftConfig
5842                     	xdef	_RTC_OutputConfig
5843                     	xdef	_RTC_GetStoreOperation
5844                     	xdef	_RTC_DayLightSavingConfig
5845                     	xdef	_RTC_WakeUpCmd
5846                     	xdef	_RTC_GetWakeUpCounter
5847                     	xdef	_RTC_SetWakeUpCounter
5848                     	xdef	_RTC_WakeUpClockConfig
5849                     	xdef	_RTC_AlarmSubSecondConfig
5850                     	xdef	_RTC_AlarmCmd
5851                     	xdef	_RTC_GetAlarm
5852                     	xdef	_RTC_AlarmStructInit
5853                     	xdef	_RTC_SetAlarm
5854                     	xdef	_RTC_GetDate
5855                     	xdef	_RTC_DateStructInit
5856                     	xdef	_RTC_SetDate
5857                     	xdef	_RTC_GetSubSecond
5858                     	xdef	_RTC_GetTime
5859                     	xdef	_RTC_TimeStructInit
5860                     	xdef	_RTC_SetTime
5861                     	xdef	_RTC_BypassShadowCmd
5862                     	xdef	_RTC_RatioCmd
5863                     	xdef	_RTC_WaitForSynchro
5864                     	xdef	_RTC_ExitInitMode
5865                     	xdef	_RTC_EnterInitMode
5866                     	xdef	_RTC_WriteProtectionCmd
5867                     	xdef	_RTC_StructInit
5868                     	xdef	_RTC_Init
5869                     	xdef	_RTC_DeInit
5888                     	end
