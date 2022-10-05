   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  22                     	switch	.data
  23  0000               _Rx_Idx:
  24  0000 00            	dc.b	0
  25  0001               _addr_ok:
  26  0001 00            	dc.b	0
  27  0002               _Event:
  28  0002 0000          	dc.w	0
  58                     ; 112 INTERRUPT_HANDLER(NonHandledInterrupt, 0)
  58                     ; 113 {
  59                     .text:	section	.text,new
  60  0000               f_NonHandledInterrupt:
  64                     ; 117 }
  67  0000 80            	iret	
  89                     ; 125 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  89                     ; 126 {
  90                     .text:	section	.text,new
  91  0000               f_TRAP_IRQHandler:
  95                     ; 130 }
  98  0000 80            	iret	
 120                     ; 136 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
 120                     ; 137 {
 121                     .text:	section	.text,new
 122  0000               f_FLASH_IRQHandler:
 126                     ; 141 }
 129  0000 80            	iret	
 152                     ; 147 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
 152                     ; 148 {
 153                     .text:	section	.text,new
 154  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 158                     ; 152 }
 161  0000 80            	iret	
 184                     ; 158 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 184                     ; 159 {
 185                     .text:	section	.text,new
 186  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 190                     ; 163 }
 193  0000 80            	iret	
 216                     ; 170 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
 216                     ; 171 {
 217                     .text:	section	.text,new
 218  0000               f_RTC_CSSLSE_IRQHandler:
 222                     ; 175 }
 225  0000 80            	iret	
 248                     ; 181 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 248                     ; 182 {
 249                     .text:	section	.text,new
 250  0000               f_EXTIE_F_PVD_IRQHandler:
 254                     ; 186 }
 257  0000 80            	iret	
 279                     ; 193 INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
 279                     ; 194 {
 280                     .text:	section	.text,new
 281  0000               f_EXTIB_G_IRQHandler:
 285                     ; 198 }
 288  0000 80            	iret	
 310                     ; 205 INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
 310                     ; 206 {
 311                     .text:	section	.text,new
 312  0000               f_EXTID_H_IRQHandler:
 316                     ; 210 }
 319  0000 80            	iret	
 341                     ; 217 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 341                     ; 218 {
 342                     .text:	section	.text,new
 343  0000               f_EXTI0_IRQHandler:
 347                     ; 222 }
 350  0000 80            	iret	
 372                     ; 229 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 372                     ; 230 {
 373                     .text:	section	.text,new
 374  0000               f_EXTI1_IRQHandler:
 378                     ; 234 }
 381  0000 80            	iret	
 403                     ; 241 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 403                     ; 242 {
 404                     .text:	section	.text,new
 405  0000               f_EXTI2_IRQHandler:
 409                     ; 246 }
 412  0000 80            	iret	
 434                     ; 253 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 434                     ; 254 {
 435                     .text:	section	.text,new
 436  0000               f_EXTI3_IRQHandler:
 440                     ; 258 }
 443  0000 80            	iret	
 465                     ; 265 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 465                     ; 266 {
 466                     .text:	section	.text,new
 467  0000               f_EXTI4_IRQHandler:
 471                     ; 270 }
 474  0000 80            	iret	
 496                     ; 277 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 496                     ; 278 {
 497                     .text:	section	.text,new
 498  0000               f_EXTI5_IRQHandler:
 502                     ; 282 }
 505  0000 80            	iret	
 527                     ; 289 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 527                     ; 290 {
 528                     .text:	section	.text,new
 529  0000               f_EXTI6_IRQHandler:
 533                     ; 294 }
 536  0000 80            	iret	
 558                     ; 301 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 558                     ; 302 {
 559                     .text:	section	.text,new
 560  0000               f_EXTI7_IRQHandler:
 564                     ; 306 }
 567  0000 80            	iret	
 589                     ; 313 INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
 589                     ; 314 {
 590                     .text:	section	.text,new
 591  0000               f_LCD_AES_IRQHandler:
 595                     ; 318 }
 598  0000 80            	iret	
 621                     ; 324 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 621                     ; 325 {
 622                     .text:	section	.text,new
 623  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 627                     ; 329 }
 630  0000 80            	iret	
 653                     ; 336 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 653                     ; 337 {
 654                     .text:	section	.text,new
 655  0000               f_ADC1_COMP_IRQHandler:
 659                     ; 341 }
 662  0000 80            	iret	
 686                     ; 348 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)
 686                     ; 349 {
 687                     .text:	section	.text,new
 688  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 692                     ; 353 }
 695  0000 80            	iret	
 718                     ; 360 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
 718                     ; 361 {
 719                     .text:	section	.text,new
 720  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 724                     ; 365 }
 727  0000 80            	iret	
 751                     ; 372 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
 751                     ; 373 {
 752                     .text:	section	.text,new
 753  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 757                     ; 377 }
 760  0000 80            	iret	
 783                     ; 384 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
 783                     ; 385 {
 784                     .text:	section	.text,new
 785  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 789                     ; 389 }
 792  0000 80            	iret	
 815                     ; 395 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 815                     ; 396 {
 816                     .text:	section	.text,new
 817  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 821                     ; 400 }
 824  0000 80            	iret	
 846                     ; 407 INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
 846                     ; 408 {
 847                     .text:	section	.text,new
 848  0000               f_TIM1_CC_IRQHandler:
 852                     ; 412 }
 855  0000 80            	iret	
 878                     ; 419 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 878                     ; 420 {
 879                     .text:	section	.text,new
 880  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 884                     ; 424 }
 887  0000 80            	iret	
 909                     ; 430 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 909                     ; 431 {
 910                     .text:	section	.text,new
 911  0000               f_SPI1_IRQHandler:
 915                     ; 435 }
 918  0000 80            	iret	
 942                     ; 442 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
 942                     ; 443 {
 943                     .text:	section	.text,new
 944  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 948                     ; 448 }
 951  0000 80            	iret	
 974                     ; 455 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
 974                     ; 456 {
 975                     .text:	section	.text,new
 976  0000               f_USART1_RX_TIM5_CC_IRQHandler:
 980                     ; 460 }
 983  0000 80            	iret	
1021                     ; 467 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
1021                     ; 468 {
1022                     .text:	section	.text,new
1023  0000               f_I2C1_SPI2_IRQHandler:
1025  0000 8a            	push	cc
1026  0001 84            	pop	a
1027  0002 a4bf          	and	a,#191
1028  0004 88            	push	a
1029  0005 86            	pop	cc
1030  0006 3b0002        	push	c_x+2
1031  0009 be00          	ldw	x,c_x
1032  000b 89            	pushw	x
1033  000c 3b0002        	push	c_y+2
1034  000f be00          	ldw	x,c_y
1035  0011 89            	pushw	x
1038                     ; 470   if (I2C_ReadRegister(I2C1, I2C_Register_SR2))
1040  0012 4b08          	push	#8
1041  0014 ae5210        	ldw	x,#21008
1042  0017 cd0000        	call	_I2C_ReadRegister
1044  001a 5b01          	addw	sp,#1
1045  001c 4d            	tnz	a
1046  001d 2704          	jreq	L324
1047                     ; 473     I2C1->SR2 = 0;
1049  001f 725f5218      	clr	21016
1050  0023               L324:
1051                     ; 479   Event = I2C_GetLastEvent(I2C1);
1053  0023 ae5210        	ldw	x,#21008
1054  0026 cd0000        	call	_I2C_GetLastEvent
1056  0029 cf0002        	ldw	_Event,x
1057                     ; 480   switch (Event)
1059  002c ce0002        	ldw	x,_Event
1061                     ; 546     default:
1061                     ; 547       break;
1062  002f 1d0010        	subw	x,#16
1063  0032 2604acef00ef  	jreq	L704
1064  0038 1d01f2        	subw	x,#498
1065  003b 2709          	jreq	L173
1066  003d 1d003e        	subw	x,#62
1067  0040 2710          	jreq	L373
1068  0042 ac120112      	jra	L724
1069  0046               L173:
1070                     ; 483     case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
1070                     ; 484       Rx_Idx = 0;
1072  0046 725f0000      	clr	_Rx_Idx
1073                     ; 485 			addr_ok = 1;
1075  004a 35010001      	mov	_addr_ok,#1
1076                     ; 486       break;
1078  004e ac120112      	jra	L724
1079  0052               L373:
1080                     ; 489     case I2C_EVENT_SLAVE_BYTE_RECEIVED:
1080                     ; 490 			if (addr_ok == 1) {
1082  0052 c60001        	ld	a,_addr_ok
1083  0055 4a            	dec	a
1084  0056 2704ace900e9  	jrne	L134
1085                     ; 491 				if (Rx_Idx == 0) {
1087  005c 725d0000      	tnz	_Rx_Idx
1088  0060 2656          	jrne	L334
1089                     ; 492 					 inp = I2C_ReceiveData(I2C1);
1091  0062 ae5210        	ldw	x,#21008
1092  0065 cd0000        	call	_I2C_ReceiveData
1094  0068 c70004        	ld	_inp,a
1095                     ; 493 						A = inp & 0b11100000; //разбор битов управления и регистров по своим местам
1097  006b a4e0          	and	a,#224
1098  006d c70003        	ld	_A,a
1099                     ; 494 						D = inp & 0b00001111;
1101  0070 c60004        	ld	a,_inp
1102  0073 a40f          	and	a,#15
1103  0075 c70002        	ld	_D,a
1104                     ; 495 						USART_SendData8(USART1, D);
1106  0078 88            	push	a
1107  0079 ae5230        	ldw	x,#21040
1108  007c cd0000        	call	_USART_SendData8
1110  007f 84            	pop	a
1111                     ; 496 						switch (A){
1113  0080 c60003        	ld	a,_A
1115                     ; 519 						break;
1116  0083 a080          	sub	a,#128
1117  0085 270e          	jreq	L773
1118  0087 a020          	sub	a,#32
1119  0089 2713          	jreq	L104
1120  008b a020          	sub	a,#32
1121  008d 2719          	jreq	L304
1122  008f a020          	sub	a,#32
1123  0091 271b          	jreq	L504
1124  0093 2054          	jra	L134
1125                     ; 498 						case AUTO_INCREMENT_OFF: 
1125                     ; 499 						break;
1127  0095               L773:
1128                     ; 501 						case AUTO_INCREMENT_ALL:
1128                     ; 502 						ai_start = MODE1;
1130  0095 c70001        	ld	_ai_start,a
1131                     ; 503 						ai_end = ALLCALLADR;
1133  0098 350c0000      	mov	_ai_end,#12
1134                     ; 504 						break;
1136  009c 204b          	jra	L134
1137  009e               L104:
1138                     ; 506 						case AUTO_INCREMENT_BRIGHTNESS:
1138                     ; 507 						ai_start = PWM0;
1140  009e 35020001      	mov	_ai_start,#2
1141                     ; 508 						ai_end = PWM3;
1143  00a2 35050000      	mov	_ai_end,#5
1144                     ; 509 						break;
1146  00a6 2041          	jra	L134
1147  00a8               L304:
1148                     ; 511 						case AUTO_INCREMENT_GCONTROL:
1148                     ; 512 						ai_start = GRPPWM;
1150  00a8 35060001      	mov	_ai_start,#6
1151                     ; 513 						ai_end = GRPFREQ;
1152                     ; 514 						break;
1154  00ac 2004          	jpf	LC001
1155  00ae               L504:
1156                     ; 516 						case AUTO_INCREMENT_I_GCONTROL:
1156                     ; 517 						ai_start = PWM0;
1158  00ae 35020001      	mov	_ai_start,#2
1159                     ; 518 						ai_end = GRPFREQ;
1161  00b2               LC001:
1163  00b2 35070000      	mov	_ai_end,#7
1164                     ; 519 						break;
1166  00b6 2031          	jra	L134
1168  00b8               L334:
1169                     ; 523 							Config_reg [D] = I2C_ReceiveData(I2C1);
1171  00b8 c60002        	ld	a,_D
1172  00bb 5f            	clrw	x
1173  00bc 97            	ld	xl,a
1174  00bd 89            	pushw	x
1175  00be ae5210        	ldw	x,#21008
1176  00c1 cd0000        	call	_I2C_ReceiveData
1178  00c4 85            	popw	x
1179  00c5 d70000        	ld	(_Config_reg,x),a
1180                     ; 524 							USART_SendData8(USART1, Config_reg [D]);
1182  00c8 c60002        	ld	a,_D
1183  00cb 5f            	clrw	x
1184  00cc 97            	ld	xl,a
1185  00cd d60000        	ld	a,(_Config_reg,x)
1186  00d0 88            	push	a
1187  00d1 ae5230        	ldw	x,#21040
1188  00d4 cd0000        	call	_USART_SendData8
1190  00d7 725c0002      	inc	_D
1191  00db 84            	pop	a
1192                     ; 525 							D ++;
1194                     ; 526 							if (D > ai_end) D = ai_start;
1196  00dc c60002        	ld	a,_D
1197  00df c10000        	cp	a,_ai_end
1198  00e2 2305          	jrule	L134
1201  00e4 5500010002    	mov	_D,_ai_start
1202  00e9               L134:
1203                     ; 529 				Rx_Idx++;
1205  00e9 725c0000      	inc	_Rx_Idx
1206                     ; 530       break;
1208  00ed 2023          	jra	L724
1209  00ef               L704:
1210                     ; 533     case (I2C_EVENT_SLAVE_STOP_DETECTED):
1210                     ; 534 			/* write to CR2 to clear STOPF flag */
1210                     ; 535 			I2C1->CR2 |= I2C_CR2_ACK;
1212  00ef 72145211      	bset	21009,#2
1213                     ; 537 			if (addr_ok == 1) {
1215  00f3 c60001        	ld	a,_addr_ok
1216  00f6 4a            	dec	a
1217  00f7 2615          	jrne	L544
1218                     ; 538 			Rx_size = Rx_Idx;
1220  00f9 5500000000    	mov	_Rx_size,_Rx_Idx
1221                     ; 539 			Rx_Idx = 0;
1223  00fe c70000        	ld	_Rx_Idx,a
1224                     ; 540 			CommunicationEnd = 0x01;
1226  0101 35010000      	mov	_CommunicationEnd,#1
1227                     ; 541 			USART_SendData8(USART1, 0xFF);
1229  0105 4bff          	push	#255
1230  0107 ae5230        	ldw	x,#21040
1231  010a cd0000        	call	_USART_SendData8
1233  010d 84            	pop	a
1234  010e               L544:
1235                     ; 543 			addr_ok = 0;
1237  010e 725f0001      	clr	_addr_ok
1238                     ; 544       break;
1240                     ; 546     default:
1240                     ; 547       break;
1242  0112               L724:
1243                     ; 549 }
1246  0112 85            	popw	x
1247  0113 bf00          	ldw	c_y,x
1248  0115 320002        	pop	c_y+2
1249  0118 85            	popw	x
1250  0119 bf00          	ldw	c_x,x
1251  011b 320002        	pop	c_x+2
1252  011e 80            	iret	
1333                     	xref	_Config_reg
1334                     	xref	_CommunicationEnd
1335                     	xdef	_Event
1336                     	xref	_Rx_size
1337                     	switch	.bss
1338  0000               _ai_end:
1339  0000 00            	ds.b	1
1340                     	xdef	_ai_end
1341  0001               _ai_start:
1342  0001 00            	ds.b	1
1343                     	xdef	_ai_start
1344  0002               _D:
1345  0002 00            	ds.b	1
1346                     	xdef	_D
1347  0003               _A:
1348  0003 00            	ds.b	1
1349                     	xdef	_A
1350                     	xdef	_addr_ok
1351  0004               _inp:
1352  0004 00            	ds.b	1
1353                     	xdef	_inp
1354  0005               _a:
1355  0005 00000000      	ds.b	4
1356                     	xdef	_a
1357                     	xdef	_Rx_Idx
1358                     	xdef	f_I2C1_SPI2_IRQHandler
1359                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1360                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1361                     	xdef	f_SPI1_IRQHandler
1362                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1363                     	xdef	f_TIM1_CC_IRQHandler
1364                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1365                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1366                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1367                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1368                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1369                     	xdef	f_ADC1_COMP_IRQHandler
1370                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1371                     	xdef	f_LCD_AES_IRQHandler
1372                     	xdef	f_EXTI7_IRQHandler
1373                     	xdef	f_EXTI6_IRQHandler
1374                     	xdef	f_EXTI5_IRQHandler
1375                     	xdef	f_EXTI4_IRQHandler
1376                     	xdef	f_EXTI3_IRQHandler
1377                     	xdef	f_EXTI2_IRQHandler
1378                     	xdef	f_EXTI1_IRQHandler
1379                     	xdef	f_EXTI0_IRQHandler
1380                     	xdef	f_EXTID_H_IRQHandler
1381                     	xdef	f_EXTIB_G_IRQHandler
1382                     	xdef	f_EXTIE_F_PVD_IRQHandler
1383                     	xdef	f_RTC_CSSLSE_IRQHandler
1384                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1385                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1386                     	xdef	f_FLASH_IRQHandler
1387                     	xdef	f_TRAP_IRQHandler
1388                     	xdef	f_NonHandledInterrupt
1389                     	xref	_USART_SendData8
1390                     	xref	_I2C_GetLastEvent
1391                     	xref	_I2C_ReadRegister
1392                     	xref	_I2C_ReceiveData
1393                     	xref.b	c_x
1394                     	xref.b	c_y
1414                     	end
