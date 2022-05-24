   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 95 void WFE_DeInit(void)
  50                     ; 96 {
  52                     .text:	section	.text,new
  53  0000               _WFE_DeInit:
  57                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  59  0000 725f50a6      	clr	20646
  60                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  62  0004 725f50a7      	clr	20647
  63                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  65  0008 725f50a8      	clr	20648
  66                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  68  000c 725f50a9      	clr	20649
  69                     ; 101 }
  72  0010 81            	ret	
 394                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 394                     ; 142 {
 395                     .text:	section	.text,new
 396  0000               _WFE_WakeUpSourceEventCmd:
 398  0000 89            	pushw	x
 399  0001 88            	push	a
 400       00000001      OFST:	set	1
 403                     ; 143   uint8_t register_index = 0;
 405                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 407                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 409                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 411  0002 9e            	ld	a,xh
 412  0003 6b01          	ld	(OFST+0,sp),a
 414                     ; 151   if (NewState != DISABLE)
 416  0005 0d06          	tnz	(OFST+5,sp)
 417  0007 2730          	jreq	L302
 418                     ; 153     switch (register_index)
 421                     ; 171       default:
 421                     ; 172         break;
 422  0009 4a            	dec	a
 423  000a 270b          	jreq	L12
 424  000c 4a            	dec	a
 425  000d 270f          	jreq	L32
 426  000f 4a            	dec	a
 427  0010 2716          	jreq	L52
 428  0012 4a            	dec	a
 429  0013 271d          	jreq	L72
 430  0015 2039          	jra	L112
 431  0017               L12:
 432                     ; 155       case 1:
 432                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 434  0017 c650a6        	ld	a,20646
 435  001a 1a03          	or	a,(OFST+2,sp)
 436                     ; 157         break;
 438  001c 202f          	jp	LC001
 439  001e               L32:
 440                     ; 159       case 2:
 440                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 442  001e c650a7        	ld	a,20647
 443  0021 1a03          	or	a,(OFST+2,sp)
 444  0023 c750a7        	ld	20647,a
 445                     ; 161         break;
 447  0026 2028          	jra	L112
 448  0028               L52:
 449                     ; 163       case 3:
 449                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 451  0028 c650a8        	ld	a,20648
 452  002b 1a03          	or	a,(OFST+2,sp)
 453  002d c750a8        	ld	20648,a
 454                     ; 165         break;
 456  0030 201e          	jra	L112
 457  0032               L72:
 458                     ; 167       case 4:
 458                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 460  0032 c650a9        	ld	a,20649
 461  0035 1a03          	or	a,(OFST+2,sp)
 462                     ; 169         break;
 464  0037 2036          	jp	LC002
 465                     ; 171       default:
 465                     ; 172         break;
 468  0039               L302:
 469                     ; 177     switch (register_index)
 472                     ; 195       default:
 472                     ; 196         break;
 473  0039 4a            	dec	a
 474  003a 270b          	jreq	L33
 475  003c 4a            	dec	a
 476  003d 2714          	jreq	L53
 477  003f 4a            	dec	a
 478  0040 271c          	jreq	L73
 479  0042 4a            	dec	a
 480  0043 2724          	jreq	L14
 481  0045 2009          	jra	L112
 482  0047               L33:
 483                     ; 179       case 1:
 483                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 485  0047 7b03          	ld	a,(OFST+2,sp)
 486  0049 43            	cpl	a
 487  004a c450a6        	and	a,20646
 488  004d               LC001:
 489  004d c750a6        	ld	20646,a
 490                     ; 181         break;
 491  0050               L112:
 492                     ; 199 }
 495  0050 5b03          	addw	sp,#3
 496  0052 81            	ret	
 497  0053               L53:
 498                     ; 183       case 2:
 498                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 500  0053 7b03          	ld	a,(OFST+2,sp)
 501  0055 43            	cpl	a
 502  0056 c450a7        	and	a,20647
 503  0059 c750a7        	ld	20647,a
 504                     ; 185         break;
 506  005c 20f2          	jra	L112
 507  005e               L73:
 508                     ; 187       case 3:
 508                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 510  005e 7b03          	ld	a,(OFST+2,sp)
 511  0060 43            	cpl	a
 512  0061 c450a8        	and	a,20648
 513  0064 c750a8        	ld	20648,a
 514                     ; 189         break;
 516  0067 20e7          	jra	L112
 517  0069               L14:
 518                     ; 191       case 4:
 518                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 520  0069 7b03          	ld	a,(OFST+2,sp)
 521  006b 43            	cpl	a
 522  006c c450a9        	and	a,20649
 523  006f               LC002:
 524  006f c750a9        	ld	20649,a
 525                     ; 193         break;
 527  0072 20dc          	jra	L112
 528                     ; 195       default:
 528                     ; 196         break;
 576                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 576                     ; 238 {
 577                     .text:	section	.text,new
 578  0000               _WFE_GetWakeUpSourceEventStatus:
 580  0000 89            	pushw	x
 581  0001 88            	push	a
 582       00000001      OFST:	set	1
 585                     ; 239   FunctionalState status = DISABLE;
 587  0002 0f01          	clr	(OFST+0,sp)
 589                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 591                     ; 243   switch (WFE_Source)
 594                     ; 326     default:
 594                     ; 327       break;
 595  0004 1d0101        	subw	x,#257
 596  0007 2603cc009c    	jreq	L712
 597  000c 5a            	decw	x
 598  000d 27fa          	jreq	L712
 599  000f 1d0002        	subw	x,#2
 600  0012 27f5          	jreq	L712
 601  0014 1d0004        	subw	x,#4
 602  0017 27f0          	jreq	L712
 603  0019 1d0008        	subw	x,#8
 604  001c 277e          	jreq	L712
 605  001e 1d0010        	subw	x,#16
 606  0021 2779          	jreq	L712
 607  0023 1d0020        	subw	x,#32
 608  0026 2774          	jreq	L712
 609  0028 1d0040        	subw	x,#64
 610  002b 276f          	jreq	L712
 611  002d 1d0081        	subw	x,#129
 612  0030 276f          	jreq	L122
 613  0032 5a            	decw	x
 614  0033 276c          	jreq	L122
 615  0035 1d0002        	subw	x,#2
 616  0038 2767          	jreq	L122
 617  003a 1d0004        	subw	x,#4
 618  003d 2762          	jreq	L122
 619  003f 1d0008        	subw	x,#8
 620  0042 275d          	jreq	L122
 621  0044 1d0010        	subw	x,#16
 622  0047 2758          	jreq	L122
 623  0049 1d0020        	subw	x,#32
 624  004c 2753          	jreq	L122
 625  004e 1d0040        	subw	x,#64
 626  0051 274e          	jreq	L122
 627  0053 1d0081        	subw	x,#129
 628  0056 274e          	jreq	L322
 629  0058 5a            	decw	x
 630  0059 274b          	jreq	L322
 631  005b 1d0002        	subw	x,#2
 632  005e 2746          	jreq	L322
 633  0060 1d0004        	subw	x,#4
 634  0063 2741          	jreq	L322
 635  0065 1d0008        	subw	x,#8
 636  0068 273c          	jreq	L322
 637  006a 1d0010        	subw	x,#16
 638  006d 2737          	jreq	L322
 639  006f 1d0020        	subw	x,#32
 640  0072 2732          	jreq	L322
 641  0074 1d0040        	subw	x,#64
 642  0077 272d          	jreq	L322
 643  0079 1d0081        	subw	x,#129
 644  007c 2735          	jreq	L522
 645  007e 5a            	decw	x
 646  007f 2732          	jreq	L522
 647  0081 1d0002        	subw	x,#2
 648  0084 272d          	jreq	L522
 649  0086 1d0004        	subw	x,#4
 650  0089 2728          	jreq	L522
 651  008b 1d0008        	subw	x,#8
 652  008e 2723          	jreq	L522
 653  0090 1d0010        	subw	x,#16
 654  0093 271e          	jreq	L522
 655  0095 1d0020        	subw	x,#32
 656  0098 2719          	jreq	L522
 657  009a 2020          	jra	L552
 658  009c               L712:
 659                     ; 245     case WFE_Source_TIM2_EV0:
 659                     ; 246     case WFE_Source_TIM2_EV1:
 659                     ; 247     case WFE_Source_TIM1_EV0:
 659                     ; 248     case WFE_Source_TIM1_EV1:
 659                     ; 249     case WFE_Source_EXTI_EV0:
 659                     ; 250     case WFE_Source_EXTI_EV1:
 659                     ; 251     case WFE_Source_EXTI_EV2:
 659                     ; 252     case WFE_Source_EXTI_EV3:
 659                     ; 253 
 659                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 661  009c c650a6        	ld	a,20646
 662                     ; 257         status = ENABLE;
 664  009f 2008          	jp	LC005
 665                     ; 262         status = DISABLE;
 666  00a1               L122:
 667                     ; 266     case WFE_Source_EXTI_EV4:
 667                     ; 267     case WFE_Source_EXTI_EV5:
 667                     ; 268     case WFE_Source_EXTI_EV6:
 667                     ; 269     case WFE_Source_EXTI_EV7:
 667                     ; 270     case WFE_Source_EXTI_EVB_G:
 667                     ; 271     case WFE_Source_EXTI_EVD_H:
 667                     ; 272     case WFE_Source_EXTI_EVE_F:
 667                     ; 273     case WFE_Source_ADC1_COMP_EV:
 667                     ; 274 
 667                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 669  00a1 c650a7        	ld	a,20647
 670                     ; 278         status = ENABLE;
 672  00a4 2003          	jp	LC005
 673                     ; 283         status = DISABLE;
 674  00a6               L322:
 675                     ; 286     case WFE_Source_TIM3_EV0:
 675                     ; 287     case WFE_Source_TIM3_EV1:
 675                     ; 288     case WFE_Source_TIM4_EV:
 675                     ; 289     case WFE_Source_SPI1_EV:
 675                     ; 290     case WFE_Source_I2C1_EV:
 675                     ; 291     case WFE_Source_USART1_EV:
 675                     ; 292     case WFE_Source_DMA1CH01_EV:
 675                     ; 293     case WFE_Source_DMA1CH23_EV:
 675                     ; 294 
 675                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 677  00a6 c650a8        	ld	a,20648
 678  00a9               LC005:
 679  00a9 1503          	bcp	a,(OFST+2,sp)
 680  00ab 270d          	jreq	L372
 681                     ; 298         status = ENABLE;
 683  00ad               LC004:
 687  00ad a601          	ld	a,#1
 688  00af 6b01          	ld	(OFST+0,sp),a
 691  00b1 2009          	jra	L552
 692                     ; 303         status = DISABLE;
 693  00b3               L522:
 694                     ; 307     case WFE_Source_TIM5_EV0:
 694                     ; 308     case WFE_Source_TIM5_EV1:
 694                     ; 309     case WFE_Source_AES_EV:
 694                     ; 310     case WFE_Source_SPI2_EV:
 694                     ; 311     case WFE_Source_USART2_EV:
 694                     ; 312     case WFE_Source_USART3_EV:
 694                     ; 313     case WFE_Source_RTC_CSS_EV:
 694                     ; 314 
 694                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 696  00b3 c650a9        	ld	a,20649
 697  00b6 1503          	bcp	a,(OFST+2,sp)
 698                     ; 318         status = ENABLE;
 700  00b8 26f3          	jrne	LC004
 701  00ba               L372:
 702                     ; 323         status = DISABLE;
 707  00ba 0f01          	clr	(OFST+0,sp)
 709                     ; 326     default:
 709                     ; 327       break;
 711  00bc               L552:
 712                     ; 329   return status;
 714  00bc 7b01          	ld	a,(OFST+0,sp)
 717  00be 5b03          	addw	sp,#3
 718  00c0 81            	ret	
 731                     	xdef	_WFE_GetWakeUpSourceEventStatus
 732                     	xdef	_WFE_WakeUpSourceEventCmd
 733                     	xdef	_WFE_DeInit
 752                     	end
