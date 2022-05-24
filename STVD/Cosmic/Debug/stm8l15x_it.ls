   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  22                     	switch	.data
  23  0000               _Rx_Idx:
  24  0000 00            	dc.b	0
  25  0001               _Event:
  26  0001 0000          	dc.w	0
  56                     ; 65 INTERRUPT_HANDLER(NonHandledInterrupt, 0)
  56                     ; 66 {
  57                     .text:	section	.text,new
  58  0000               f_NonHandledInterrupt:
  62                     ; 70 }
  65  0000 80            	iret	
  87                     ; 78 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  87                     ; 79 {
  88                     .text:	section	.text,new
  89  0000               f_TRAP_IRQHandler:
  93                     ; 83 }
  96  0000 80            	iret	
 118                     ; 89 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
 118                     ; 90 {
 119                     .text:	section	.text,new
 120  0000               f_FLASH_IRQHandler:
 124                     ; 94 }
 127  0000 80            	iret	
 150                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
 150                     ; 101 {
 151                     .text:	section	.text,new
 152  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 156                     ; 105 }
 159  0000 80            	iret	
 182                     ; 111 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 182                     ; 112 {
 183                     .text:	section	.text,new
 184  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 188                     ; 116 }
 191  0000 80            	iret	
 214                     ; 123 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
 214                     ; 124 {
 215                     .text:	section	.text,new
 216  0000               f_RTC_CSSLSE_IRQHandler:
 220                     ; 128 }
 223  0000 80            	iret	
 246                     ; 134 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 246                     ; 135 {
 247                     .text:	section	.text,new
 248  0000               f_EXTIE_F_PVD_IRQHandler:
 252                     ; 139 }
 255  0000 80            	iret	
 277                     ; 146 INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
 277                     ; 147 {
 278                     .text:	section	.text,new
 279  0000               f_EXTIB_G_IRQHandler:
 283                     ; 151 }
 286  0000 80            	iret	
 308                     ; 158 INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
 308                     ; 159 {
 309                     .text:	section	.text,new
 310  0000               f_EXTID_H_IRQHandler:
 314                     ; 163 }
 317  0000 80            	iret	
 339                     ; 170 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 339                     ; 171 {
 340                     .text:	section	.text,new
 341  0000               f_EXTI0_IRQHandler:
 345                     ; 175 }
 348  0000 80            	iret	
 370                     ; 182 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 370                     ; 183 {
 371                     .text:	section	.text,new
 372  0000               f_EXTI1_IRQHandler:
 376                     ; 187 }
 379  0000 80            	iret	
 401                     ; 194 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 401                     ; 195 {
 402                     .text:	section	.text,new
 403  0000               f_EXTI2_IRQHandler:
 407                     ; 199 }
 410  0000 80            	iret	
 432                     ; 206 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 432                     ; 207 {
 433                     .text:	section	.text,new
 434  0000               f_EXTI3_IRQHandler:
 438                     ; 211 }
 441  0000 80            	iret	
 463                     ; 218 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 463                     ; 219 {
 464                     .text:	section	.text,new
 465  0000               f_EXTI4_IRQHandler:
 469                     ; 223 }
 472  0000 80            	iret	
 494                     ; 230 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 494                     ; 231 {
 495                     .text:	section	.text,new
 496  0000               f_EXTI5_IRQHandler:
 500                     ; 235 }
 503  0000 80            	iret	
 525                     ; 242 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 525                     ; 243 {
 526                     .text:	section	.text,new
 527  0000               f_EXTI6_IRQHandler:
 531                     ; 247 }
 534  0000 80            	iret	
 556                     ; 254 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 556                     ; 255 {
 557                     .text:	section	.text,new
 558  0000               f_EXTI7_IRQHandler:
 562                     ; 259 }
 565  0000 80            	iret	
 587                     ; 266 INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
 587                     ; 267 {
 588                     .text:	section	.text,new
 589  0000               f_LCD_AES_IRQHandler:
 593                     ; 271 }
 596  0000 80            	iret	
 619                     ; 277 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 619                     ; 278 {
 620                     .text:	section	.text,new
 621  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 625                     ; 282 }
 628  0000 80            	iret	
 651                     ; 289 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 651                     ; 290 {
 652                     .text:	section	.text,new
 653  0000               f_ADC1_COMP_IRQHandler:
 657                     ; 294 }
 660  0000 80            	iret	
 684                     ; 301 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)
 684                     ; 302 {
 685                     .text:	section	.text,new
 686  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 690                     ; 306 }
 693  0000 80            	iret	
 716                     ; 313 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
 716                     ; 314 {
 717                     .text:	section	.text,new
 718  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 722                     ; 318 }
 725  0000 80            	iret	
 749                     ; 325 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
 749                     ; 326 {
 750                     .text:	section	.text,new
 751  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 755                     ; 330 }
 758  0000 80            	iret	
 781                     ; 337 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
 781                     ; 338 {
 782                     .text:	section	.text,new
 783  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 787                     ; 342 }
 790  0000 80            	iret	
 813                     ; 348 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 813                     ; 349 {
 814                     .text:	section	.text,new
 815  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 819                     ; 353 }
 822  0000 80            	iret	
 844                     ; 360 INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
 844                     ; 361 {
 845                     .text:	section	.text,new
 846  0000               f_TIM1_CC_IRQHandler:
 850                     ; 365 }
 853  0000 80            	iret	
 876                     ; 372 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 876                     ; 373 {
 877                     .text:	section	.text,new
 878  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 882                     ; 377 }
 885  0000 80            	iret	
 907                     ; 383 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 907                     ; 384 {
 908                     .text:	section	.text,new
 909  0000               f_SPI1_IRQHandler:
 913                     ; 388 }
 916  0000 80            	iret	
 940                     ; 395 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
 940                     ; 396 {
 941                     .text:	section	.text,new
 942  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 946                     ; 401 }
 949  0000 80            	iret	
 972                     ; 408 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
 972                     ; 409 {
 973                     .text:	section	.text,new
 974  0000               f_USART1_RX_TIM5_CC_IRQHandler:
 978                     ; 413 }
 981  0000 80            	iret	
1012                     ; 420 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
1012                     ; 421 {
1013                     .text:	section	.text,new
1014  0000               f_I2C1_SPI2_IRQHandler:
1016  0000 8a            	push	cc
1017  0001 84            	pop	a
1018  0002 a4bf          	and	a,#191
1019  0004 88            	push	a
1020  0005 86            	pop	cc
1021  0006 3b0002        	push	c_x+2
1022  0009 be00          	ldw	x,c_x
1023  000b 89            	pushw	x
1024  000c 3b0002        	push	c_y+2
1025  000f be00          	ldw	x,c_y
1026  0011 89            	pushw	x
1029                     ; 423   if (I2C_ReadRegister(I2C1, I2C_Register_SR2))
1031  0012 4b08          	push	#8
1032  0014 ae5210        	ldw	x,#21008
1033  0017 cd0000        	call	_I2C_ReadRegister
1035  001a 5b01          	addw	sp,#1
1036  001c 4d            	tnz	a
1037  001d 2704          	jreq	L114
1038                     ; 426     I2C1->SR2 = 0;
1040  001f 725f5218      	clr	21016
1041  0023               L114:
1042                     ; 433   Event = I2C_GetLastEvent(I2C1);
1044  0023 ae5210        	ldw	x,#21008
1045  0026 cd0000        	call	_I2C_GetLastEvent
1047  0029 cf0001        	ldw	_Event,x
1048                     ; 434   switch (Event)
1050  002c ce0001        	ldw	x,_Event
1052                     ; 455     default:
1052                     ; 456       break;
1053  002f 1d0010        	subw	x,#16
1054  0032 2728          	jreq	L573
1055  0034 1d01f2        	subw	x,#498
1056  0037 2707          	jreq	L173
1057  0039 1d003e        	subw	x,#62
1058  003c 2708          	jreq	L373
1059  003e 202f          	jra	L514
1060  0040               L173:
1061                     ; 437     case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
1061                     ; 438       Rx_Idx = 0;
1063  0040 725f0000      	clr	_Rx_Idx
1064                     ; 439       break;
1066  0044 2029          	jra	L514
1067  0046               L373:
1068                     ; 442     case I2C_EVENT_SLAVE_BYTE_RECEIVED:
1068                     ; 443       Slave_Buffer_Rx[Rx_Idx++] = I2C_ReceiveData(I2C1);
1070  0046 c60000        	ld	a,_Rx_Idx
1071  0049 725c0000      	inc	_Rx_Idx
1072  004d 5f            	clrw	x
1073  004e 97            	ld	xl,a
1074  004f 89            	pushw	x
1075  0050 ae5210        	ldw	x,#21008
1076  0053 cd0000        	call	_I2C_ReceiveData
1078  0056 85            	popw	x
1079  0057 d70000        	ld	(_Slave_Buffer_Rx,x),a
1080                     ; 444       break;
1082  005a 2013          	jra	L514
1083  005c               L573:
1084                     ; 447     case (I2C_EVENT_SLAVE_STOP_DETECTED):
1084                     ; 448 			/* write to CR2 to clear STOPF flag */
1084                     ; 449 			I2C1->CR2 |= I2C_CR2_ACK;
1086  005c 72145211      	bset	21009,#2
1087                     ; 450 			Rx_size = Rx_Idx-1;
1089  0060 c60000        	ld	a,_Rx_Idx
1090  0063 4a            	dec	a
1091  0064 c70000        	ld	_Rx_size,a
1092                     ; 451 			Rx_Idx = 0;
1094  0067 725f0000      	clr	_Rx_Idx
1095                     ; 452 			CommunicationEnd = 0x01;
1097  006b 35010000      	mov	_CommunicationEnd,#1
1098                     ; 453       break;
1100                     ; 455     default:
1100                     ; 456       break;
1102  006f               L514:
1103                     ; 458 }
1106  006f 85            	popw	x
1107  0070 bf00          	ldw	c_y,x
1108  0072 320002        	pop	c_y+2
1109  0075 85            	popw	x
1110  0076 bf00          	ldw	c_x,x
1111  0078 320002        	pop	c_x+2
1112  007b 80            	iret	
1144                     	xref	_CommunicationEnd
1145                     	xdef	_Event
1146                     	xref	_Rx_size
1147                     	xref	_Slave_Buffer_Rx
1148                     	xdef	_Rx_Idx
1149                     	xdef	f_I2C1_SPI2_IRQHandler
1150                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1151                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1152                     	xdef	f_SPI1_IRQHandler
1153                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1154                     	xdef	f_TIM1_CC_IRQHandler
1155                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1156                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1157                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1158                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1159                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1160                     	xdef	f_ADC1_COMP_IRQHandler
1161                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1162                     	xdef	f_LCD_AES_IRQHandler
1163                     	xdef	f_EXTI7_IRQHandler
1164                     	xdef	f_EXTI6_IRQHandler
1165                     	xdef	f_EXTI5_IRQHandler
1166                     	xdef	f_EXTI4_IRQHandler
1167                     	xdef	f_EXTI3_IRQHandler
1168                     	xdef	f_EXTI2_IRQHandler
1169                     	xdef	f_EXTI1_IRQHandler
1170                     	xdef	f_EXTI0_IRQHandler
1171                     	xdef	f_EXTID_H_IRQHandler
1172                     	xdef	f_EXTIB_G_IRQHandler
1173                     	xdef	f_EXTIE_F_PVD_IRQHandler
1174                     	xdef	f_RTC_CSSLSE_IRQHandler
1175                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1176                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1177                     	xdef	f_FLASH_IRQHandler
1178                     	xdef	f_TRAP_IRQHandler
1179                     	xdef	f_NonHandledInterrupt
1180                     	xref	_I2C_GetLastEvent
1181                     	xref	_I2C_ReadRegister
1182                     	xref	_I2C_ReceiveData
1183                     	xref.b	c_x
1184                     	xref.b	c_y
1203                     	end
