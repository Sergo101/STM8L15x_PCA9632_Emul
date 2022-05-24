   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 56 uint8_t ITC_GetCPUCC(void)
  50                     ; 57 {
  52                     .text:	section	.text,new
  53  0000               _ITC_GetCPUCC:
  57                     ; 59   _asm("push cc");
  60  0000 8a            	push	cc
  62                     ; 60   _asm("pop a");
  65  0001 84            	pop	a
  67                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  70  0002 81            	ret	
  93                     ; 87 void ITC_DeInit(void)
  93                     ; 88 {
  94                     .text:	section	.text,new
  95  0000               _ITC_DeInit:
  99                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 101  0000 35ff7f70      	mov	32624,#255
 102                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 104  0004 35ff7f71      	mov	32625,#255
 105                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 107  0008 35ff7f72      	mov	32626,#255
 108                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 110  000c 35ff7f73      	mov	32627,#255
 111                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 113  0010 35ff7f74      	mov	32628,#255
 114                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 116  0014 35ff7f75      	mov	32629,#255
 117                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 119  0018 35ff7f76      	mov	32630,#255
 120                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 122  001c 35ff7f77      	mov	32631,#255
 123                     ; 97 }
 126  0020 81            	ret	
 151                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 151                     ; 105 {
 152                     .text:	section	.text,new
 153  0000               _ITC_GetSoftIntStatus:
 157                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 159  0000 cd0000        	call	_ITC_GetCPUCC
 161  0003 a428          	and	a,#40
 164  0005 81            	ret	
 469                     .const:	section	.text
 470  0000               L42:
 471  0000 0022          	dc.w	L14
 472  0002 0022          	dc.w	L14
 473  0004 0022          	dc.w	L14
 474  0006 0027          	dc.w	L34
 475  0008 0027          	dc.w	L34
 476  000a 0027          	dc.w	L34
 477  000c 0027          	dc.w	L34
 478  000e 002c          	dc.w	L54
 479  0010 002c          	dc.w	L54
 480  0012 002c          	dc.w	L54
 481  0014 002c          	dc.w	L54
 482  0016 0031          	dc.w	L74
 483  0018 0031          	dc.w	L74
 484  001a 0031          	dc.w	L74
 485  001c 0031          	dc.w	L74
 486  001e 0036          	dc.w	L15
 487  0020 0036          	dc.w	L15
 488  0022 0036          	dc.w	L15
 489  0024 0036          	dc.w	L15
 490  0026 003b          	dc.w	L35
 491  0028 003b          	dc.w	L35
 492  002a 003b          	dc.w	L35
 493  002c 003b          	dc.w	L35
 494  002e 0040          	dc.w	L55
 495  0030 0040          	dc.w	L55
 496  0032 0040          	dc.w	L55
 497  0034 0040          	dc.w	L55
 498  0036 0045          	dc.w	L75
 499  0038 0045          	dc.w	L75
 500                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 500                     ; 115 {
 501                     .text:	section	.text,new
 502  0000               _ITC_GetSoftwarePriority:
 504  0000 88            	push	a
 505  0001 89            	pushw	x
 506       00000002      OFST:	set	2
 509                     ; 116   uint8_t Value = 0;
 511  0002 0f02          	clr	(OFST+0,sp)
 513                     ; 117   uint8_t Mask = 0;
 515                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 517                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 519  0004 a403          	and	a,#3
 520  0006 48            	sll	a
 521  0007 5f            	clrw	x
 522  0008 97            	ld	xl,a
 523  0009 a603          	ld	a,#3
 524  000b 5d            	tnzw	x
 525  000c 2704          	jreq	L61
 526  000e               L02:
 527  000e 48            	sll	a
 528  000f 5a            	decw	x
 529  0010 26fc          	jrne	L02
 530  0012               L61:
 531  0012 6b01          	ld	(OFST-1,sp),a
 533                     ; 125   switch (IRQn)
 535  0014 7b03          	ld	a,(OFST+1,sp)
 537                     ; 223     default:
 537                     ; 224       break;
 538  0016 4a            	dec	a
 539  0017 a11d          	cp	a,#29
 540  0019 2431          	jruge	L122
 541  001b 5f            	clrw	x
 542  001c 97            	ld	xl,a
 543  001d 58            	sllw	x
 544  001e de0000        	ldw	x,(L42,x)
 545  0021 fc            	jp	(x)
 546  0022               L14:
 547                     ; 127     case FLASH_IRQn:
 547                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 547                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 547                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 549  0022 c67f70        	ld	a,32624
 550                     ; 131       break;
 552  0025 2021          	jp	LC001
 553  0027               L34:
 554                     ; 133     case EXTIE_F_PVD_IRQn:
 554                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 554                     ; 135     case RTC_IRQn:
 554                     ; 136     case EXTIB_IRQn:
 554                     ; 137     case EXTID_IRQn:
 554                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 554                     ; 139     case RTC_CSSLSE_IRQn:
 554                     ; 140     case EXTIB_IRQn:
 554                     ; 141     case EXTID_IRQn:
 554                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 554                     ; 143     case RTC_CSSLSE_IRQn:
 554                     ; 144     case EXTIB_G_IRQn:
 554                     ; 145     case EXTID_H_IRQn:
 554                     ; 146 #endif  /* STM8L15X_MD */
 554                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 556  0027 c67f71        	ld	a,32625
 557                     ; 148       break;
 559  002a 201c          	jp	LC001
 560  002c               L54:
 561                     ; 150     case EXTI0_IRQn:
 561                     ; 151     case EXTI1_IRQn:
 561                     ; 152     case EXTI2_IRQn:
 561                     ; 153     case EXTI3_IRQn:
 561                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 563  002c c67f72        	ld	a,32626
 564                     ; 155       break;
 566  002f 2017          	jp	LC001
 567  0031               L74:
 568                     ; 157     case EXTI4_IRQn:
 568                     ; 158     case EXTI5_IRQn:
 568                     ; 159     case EXTI6_IRQn:
 568                     ; 160     case EXTI7_IRQn:
 568                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 570  0031 c67f73        	ld	a,32627
 571                     ; 162       break;
 573  0034 2012          	jp	LC001
 574  0036               L15:
 575                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 575                     ; 168 #endif /* STM8L15X_LD */		
 575                     ; 169     case ADC1_COMP_IRQn:
 575                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 575                     ; 171     case LCD_IRQn:
 575                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 575                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 575                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 575                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 575                     ; 176     case LCD_AES_IRQn:
 575                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 575                     ; 178 #endif  /* STM8L15X_MD */
 575                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 577  0036 c67f74        	ld	a,32628
 578                     ; 180       break;
 580  0039 200d          	jp	LC001
 581  003b               L35:
 582                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 582                     ; 184 #endif /* STM8L15X_LD */		
 582                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 582                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 582                     ; 187     case TIM2_CC_IRQn:
 582                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 582                     ; 189     case TIM3_CC_IRQn:
 582                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 582                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 582                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 582                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 582                     ; 194 #endif  /* STM8L15X_MD */
 582                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 584  003b c67f75        	ld	a,32629
 585                     ; 196       break;
 587  003e 2008          	jp	LC001
 588  0040               L55:
 589                     ; 199     case TIM1_CC_IRQn:
 589                     ; 200 #endif /* STM8L15X_LD */	
 589                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 589                     ; 202     case SPI1_IRQn:
 589                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 589                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 589                     ; 205     case USART1_TX_IRQn:
 589                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 589                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 589                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 589                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 591  0040 c67f76        	ld	a,32630
 592                     ; 210       break;
 594  0043 2003          	jp	LC001
 595  0045               L75:
 596                     ; 214     case USART1_RX_IRQn:
 596                     ; 215     case I2C1_IRQn:
 596                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 596                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 596                     ; 218     case I2C1_SPI2_IRQn:
 596                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 596                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 598  0045 c67f77        	ld	a,32631
 599  0048               LC001:
 600  0048 1401          	and	a,(OFST-1,sp)
 601  004a 6b02          	ld	(OFST+0,sp),a
 603                     ; 221       break;
 605                     ; 223     default:
 605                     ; 224       break;
 607  004c               L122:
 608                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 610  004c 7b03          	ld	a,(OFST+1,sp)
 611  004e a403          	and	a,#3
 612  0050 48            	sll	a
 613  0051 5f            	clrw	x
 614  0052 97            	ld	xl,a
 615  0053 7b02          	ld	a,(OFST+0,sp)
 616  0055 5d            	tnzw	x
 617  0056 2704          	jreq	L62
 618  0058               L03:
 619  0058 44            	srl	a
 620  0059 5a            	decw	x
 621  005a 26fc          	jrne	L03
 622  005c               L62:
 624                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 628  005c 5b03          	addw	sp,#3
 629  005e 81            	ret	
 689                     	switch	.const
 690  003a               L64:
 691  003a 0037          	dc.w	L322
 692  003c 0037          	dc.w	L322
 693  003e 0037          	dc.w	L322
 694  0040 0049          	dc.w	L522
 695  0042 0049          	dc.w	L522
 696  0044 0049          	dc.w	L522
 697  0046 0049          	dc.w	L522
 698  0048 005b          	dc.w	L722
 699  004a 005b          	dc.w	L722
 700  004c 005b          	dc.w	L722
 701  004e 005b          	dc.w	L722
 702  0050 006d          	dc.w	L132
 703  0052 006d          	dc.w	L132
 704  0054 006d          	dc.w	L132
 705  0056 006d          	dc.w	L132
 706  0058 007f          	dc.w	L332
 707  005a 007f          	dc.w	L332
 708  005c 007f          	dc.w	L332
 709  005e 007f          	dc.w	L332
 710  0060 0091          	dc.w	L532
 711  0062 0091          	dc.w	L532
 712  0064 0091          	dc.w	L532
 713  0066 0091          	dc.w	L532
 714  0068 00a3          	dc.w	L732
 715  006a 00a3          	dc.w	L732
 716  006c 00a3          	dc.w	L732
 717  006e 00a3          	dc.w	L732
 718  0070 00b5          	dc.w	L142
 719  0072 00b5          	dc.w	L142
 720                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 720                     ; 251 {
 721                     .text:	section	.text,new
 722  0000               _ITC_SetSoftwarePriority:
 724  0000 89            	pushw	x
 725  0001 89            	pushw	x
 726       00000002      OFST:	set	2
 729                     ; 252   uint8_t Mask = 0;
 731                     ; 253   uint8_t NewPriority = 0;
 733                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 735                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 737                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 739                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 741  0002 9e            	ld	a,xh
 742  0003 a403          	and	a,#3
 743  0005 48            	sll	a
 744  0006 5f            	clrw	x
 745  0007 97            	ld	xl,a
 746  0008 a603          	ld	a,#3
 747  000a 5d            	tnzw	x
 748  000b 2704          	jreq	L43
 749  000d               L63:
 750  000d 48            	sll	a
 751  000e 5a            	decw	x
 752  000f 26fc          	jrne	L63
 753  0011               L43:
 754  0011 43            	cpl	a
 755  0012 6b01          	ld	(OFST-1,sp),a
 757                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 759  0014 7b03          	ld	a,(OFST+1,sp)
 760  0016 a403          	and	a,#3
 761  0018 48            	sll	a
 762  0019 5f            	clrw	x
 763  001a 97            	ld	xl,a
 764  001b 7b04          	ld	a,(OFST+2,sp)
 765  001d 5d            	tnzw	x
 766  001e 2704          	jreq	L04
 767  0020               L24:
 768  0020 48            	sll	a
 769  0021 5a            	decw	x
 770  0022 26fc          	jrne	L24
 771  0024               L04:
 772  0024 6b02          	ld	(OFST+0,sp),a
 774                     ; 268   switch (IRQn)
 776  0026 7b03          	ld	a,(OFST+1,sp)
 778                     ; 372     default:
 778                     ; 373       break;
 779  0028 4a            	dec	a
 780  0029 a11d          	cp	a,#29
 781  002b 2503cc00c5    	jruge	L572
 782  0030 5f            	clrw	x
 783  0031 97            	ld	xl,a
 784  0032 58            	sllw	x
 785  0033 de003a        	ldw	x,(L64,x)
 786  0036 fc            	jp	(x)
 787  0037               L322:
 788                     ; 270     case FLASH_IRQn:
 788                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 788                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 788                     ; 273       ITC->ISPR1 &= Mask;
 790  0037 c67f70        	ld	a,32624
 791  003a 1401          	and	a,(OFST-1,sp)
 792  003c c77f70        	ld	32624,a
 793                     ; 274       ITC->ISPR1 |= NewPriority;
 795  003f c67f70        	ld	a,32624
 796  0042 1a02          	or	a,(OFST+0,sp)
 797  0044 c77f70        	ld	32624,a
 798                     ; 275       break;
 800  0047 207c          	jra	L572
 801  0049               L522:
 802                     ; 277     case EXTIE_F_PVD_IRQn:
 802                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 802                     ; 279     case RTC_IRQn:
 802                     ; 280     case EXTIB_IRQn:
 802                     ; 281     case EXTID_IRQn:
 802                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 802                     ; 283     case RTC_CSSLSE_IRQn:
 802                     ; 284     case EXTIB_IRQn:
 802                     ; 285     case EXTID_IRQn:
 802                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 802                     ; 287     case RTC_CSSLSE_IRQn:
 802                     ; 288     case EXTIB_G_IRQn:
 802                     ; 289     case EXTID_H_IRQn:
 802                     ; 290 #endif  /* STM8L15X_MD */
 802                     ; 291       ITC->ISPR2 &= Mask;
 804  0049 c67f71        	ld	a,32625
 805  004c 1401          	and	a,(OFST-1,sp)
 806  004e c77f71        	ld	32625,a
 807                     ; 292       ITC->ISPR2 |= NewPriority;
 809  0051 c67f71        	ld	a,32625
 810  0054 1a02          	or	a,(OFST+0,sp)
 811  0056 c77f71        	ld	32625,a
 812                     ; 293       break;
 814  0059 206a          	jra	L572
 815  005b               L722:
 816                     ; 295     case EXTI0_IRQn:
 816                     ; 296     case EXTI1_IRQn:
 816                     ; 297     case EXTI2_IRQn:
 816                     ; 298     case EXTI3_IRQn:
 816                     ; 299       ITC->ISPR3 &= Mask;
 818  005b c67f72        	ld	a,32626
 819  005e 1401          	and	a,(OFST-1,sp)
 820  0060 c77f72        	ld	32626,a
 821                     ; 300       ITC->ISPR3 |= NewPriority;
 823  0063 c67f72        	ld	a,32626
 824  0066 1a02          	or	a,(OFST+0,sp)
 825  0068 c77f72        	ld	32626,a
 826                     ; 301       break;
 828  006b 2058          	jra	L572
 829  006d               L132:
 830                     ; 303     case EXTI4_IRQn:
 830                     ; 304     case EXTI5_IRQn:
 830                     ; 305     case EXTI6_IRQn:
 830                     ; 306     case EXTI7_IRQn:
 830                     ; 307       ITC->ISPR4 &= Mask;
 832  006d c67f73        	ld	a,32627
 833  0070 1401          	and	a,(OFST-1,sp)
 834  0072 c77f73        	ld	32627,a
 835                     ; 308       ITC->ISPR4 |= NewPriority;
 837  0075 c67f73        	ld	a,32627
 838  0078 1a02          	or	a,(OFST+0,sp)
 839  007a c77f73        	ld	32627,a
 840                     ; 309       break;
 842  007d 2046          	jra	L572
 843  007f               L332:
 844                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 844                     ; 312 #else
 844                     ; 313     case SWITCH_CSS_IRQn:
 844                     ; 314 #endif /*	STM8L15X_LD	*/
 844                     ; 315     case ADC1_COMP_IRQn:
 844                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 844                     ; 317     case LCD_IRQn:
 844                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 844                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 844                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 844                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 844                     ; 322     case LCD_AES_IRQn:
 844                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 844                     ; 324 #endif  /* STM8L15X_MD */
 844                     ; 325       ITC->ISPR5 &= Mask;
 846  007f c67f74        	ld	a,32628
 847  0082 1401          	and	a,(OFST-1,sp)
 848  0084 c77f74        	ld	32628,a
 849                     ; 326       ITC->ISPR5 |= NewPriority;
 851  0087 c67f74        	ld	a,32628
 852  008a 1a02          	or	a,(OFST+0,sp)
 853  008c c77f74        	ld	32628,a
 854                     ; 327       break;
 856  008f 2034          	jra	L572
 857  0091               L532:
 858                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 858                     ; 330 #endif  /* STM8L15X_LD */
 858                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 858                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 858                     ; 333     case TIM2_CC_IRQn:
 858                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 858                     ; 335     case TIM3_CC_IRQn:
 858                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 858                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 858                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 858                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 858                     ; 340 #endif  /* STM8L15X_MD */
 858                     ; 341       ITC->ISPR6 &= Mask;
 860  0091 c67f75        	ld	a,32629
 861  0094 1401          	and	a,(OFST-1,sp)
 862  0096 c77f75        	ld	32629,a
 863                     ; 342       ITC->ISPR6 |= NewPriority;
 865  0099 c67f75        	ld	a,32629
 866  009c 1a02          	or	a,(OFST+0,sp)
 867  009e c77f75        	ld	32629,a
 868                     ; 343       break;
 870  00a1 2022          	jra	L572
 871  00a3               L732:
 872                     ; 346     case TIM1_CC_IRQn:
 872                     ; 347 #endif  /* STM8L15X_LD */
 872                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 872                     ; 349     case SPI1_IRQn:
 872                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 872                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 872                     ; 352     case USART1_TX_IRQn:
 872                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 872                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 872                     ; 355 #endif  /* STM8L15X_MD */
 872                     ; 356       ITC->ISPR7 &= Mask;
 874  00a3 c67f76        	ld	a,32630
 875  00a6 1401          	and	a,(OFST-1,sp)
 876  00a8 c77f76        	ld	32630,a
 877                     ; 357       ITC->ISPR7 |= NewPriority;
 879  00ab c67f76        	ld	a,32630
 880  00ae 1a02          	or	a,(OFST+0,sp)
 881  00b0 c77f76        	ld	32630,a
 882                     ; 358       break;
 884  00b3 2010          	jra	L572
 885  00b5               L142:
 886                     ; 362     case USART1_RX_IRQn:
 886                     ; 363     case I2C1_IRQn:
 886                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 886                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 886                     ; 366     case I2C1_SPI2_IRQn:
 886                     ; 367 #endif  /* STM8L15X_MD */
 886                     ; 368       ITC->ISPR8 &= Mask;
 888  00b5 c67f77        	ld	a,32631
 889  00b8 1401          	and	a,(OFST-1,sp)
 890  00ba c77f77        	ld	32631,a
 891                     ; 369       ITC->ISPR8 |= NewPriority;
 893  00bd c67f77        	ld	a,32631
 894  00c0 1a02          	or	a,(OFST+0,sp)
 895  00c2 c77f77        	ld	32631,a
 896                     ; 370       break;
 898                     ; 372     default:
 898                     ; 373       break;
 900  00c5               L572:
 901                     ; 375 }
 904  00c5 5b04          	addw	sp,#4
 905  00c7 81            	ret	
 918                     	xdef	_ITC_GetSoftwarePriority
 919                     	xdef	_ITC_SetSoftwarePriority
 920                     	xdef	_ITC_GetSoftIntStatus
 921                     	xdef	_ITC_GetCPUCC
 922                     	xdef	_ITC_DeInit
 941                     	end
