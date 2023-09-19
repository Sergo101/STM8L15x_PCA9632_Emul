   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     	switch	.data
  18  0000               _Rx_Idx:
  19  0000 00            	dc.b	0
  20  0001               _addr_ok:
  21  0001 00            	dc.b	0
  22  0002               _Event:
  23  0002 0000          	dc.w	0
  24                     ; 115 INTERRUPT_HANDLER(NonHandledInterrupt, 0)
  24                     ; 116 {
  25                     	switch	.text
  26  0000               f_NonHandledInterrupt:
  28                     ; 120 }
  29  0000 80            	iret	
  30                     ; 128 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  30                     ; 129 {
  31  0001               f_TRAP_IRQHandler:
  33                     ; 133 }
  34  0001 80            	iret	
  35                     ; 139 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
  35                     ; 140 {
  36  0002               f_FLASH_IRQHandler:
  38                     ; 144 }
  39  0002 80            	iret	
  40                     ; 150 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
  40                     ; 151 {
  41  0003               f_DMA1_CHANNEL0_1_IRQHandler:
  43                     ; 155 }
  44  0003 80            	iret	
  45                     ; 161 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
  45                     ; 162 {
  46  0004               f_DMA1_CHANNEL2_3_IRQHandler:
  48                     ; 166 }
  49  0004 80            	iret	
  50                     ; 173 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
  50                     ; 174 {
  51  0005               f_RTC_CSSLSE_IRQHandler:
  53                     ; 178 }
  54  0005 80            	iret	
  55                     ; 184 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
  55                     ; 185 {
  56  0006               f_EXTIE_F_PVD_IRQHandler:
  58                     ; 189 }
  59  0006 80            	iret	
  60                     ; 196 INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
  60                     ; 197 {
  61  0007               f_EXTIB_G_IRQHandler:
  63                     ; 201 }
  64  0007 80            	iret	
  65                     ; 208 INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
  65                     ; 209 {
  66  0008               f_EXTID_H_IRQHandler:
  68                     ; 213 }
  69  0008 80            	iret	
  70                     ; 220 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
  70                     ; 221 {
  71  0009               f_EXTI0_IRQHandler:
  73                     ; 225 }
  74  0009 80            	iret	
  75                     ; 232 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
  75                     ; 233 {
  76  000a               f_EXTI1_IRQHandler:
  78                     ; 237 }
  79  000a 80            	iret	
  80                     ; 244 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
  80                     ; 245 {
  81  000b               f_EXTI2_IRQHandler:
  83                     ; 249 }
  84  000b 80            	iret	
  85                     ; 256 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
  85                     ; 257 {
  86  000c               f_EXTI3_IRQHandler:
  88                     ; 261 }
  89  000c 80            	iret	
  90                     ; 268 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
  90                     ; 269 {
  91  000d               f_EXTI4_IRQHandler:
  93                     ; 273 }
  94  000d 80            	iret	
  95                     ; 280 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
  95                     ; 281 {
  96  000e               f_EXTI5_IRQHandler:
  98                     ; 285 }
  99  000e 80            	iret	
 100                     ; 292 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 100                     ; 293 {
 101  000f               f_EXTI6_IRQHandler:
 103                     ; 297 }
 104  000f 80            	iret	
 105                     ; 304 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 105                     ; 305 {
 106  0010               f_EXTI7_IRQHandler:
 108                     ; 309 }
 109  0010 80            	iret	
 110                     ; 316 INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
 110                     ; 317 {
 111  0011               f_LCD_AES_IRQHandler:
 113                     ; 321 }
 114  0011 80            	iret	
 115                     ; 327 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 115                     ; 328 {
 116  0012               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 118                     ; 332 }
 119  0012 80            	iret	
 120                     ; 339 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 120                     ; 340 {
 121  0013               f_ADC1_COMP_IRQHandler:
 123                     ; 344 }
 124  0013 80            	iret	
 125                     ; 351 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)
 125                     ; 352 {
 126  0014               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 128                     ; 356 }
 129  0014 80            	iret	
 130                     ; 363 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
 130                     ; 364 {
 131  0015               f_TIM2_CC_USART2_RX_IRQHandler:
 133                     ; 368 }
 134  0015 80            	iret	
 135                     ; 375 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
 135                     ; 376 {
 136  0016               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 138                     ; 380 }
 139  0016 80            	iret	
 140                     ; 387 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
 140                     ; 388 {
 141  0017               f_TIM3_CC_USART3_RX_IRQHandler:
 143                     ; 392 }
 144  0017 80            	iret	
 145                     ; 398 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 145                     ; 399 {
 146  0018               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 148                     ; 403 }
 149  0018 80            	iret	
 150                     ; 410 INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
 150                     ; 411 {
 151  0019               f_TIM1_CC_IRQHandler:
 153                     ; 415 }
 154  0019 80            	iret	
 155                     ; 422 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 155                     ; 423 {
 156  001a               f_TIM4_UPD_OVF_TRG_IRQHandler:
 158                     ; 427 }
 159  001a 80            	iret	
 160                     ; 433 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 160                     ; 434 {
 161  001b               f_SPI1_IRQHandler:
 163                     ; 438 }
 164  001b 80            	iret	
 165                     ; 445 @svlreg INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
 165                     ; 446 {
 166  001c               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 168                     ; 451 }
 169  001c 80            	iret	
 170                     ; 458 @svlreg INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
 170                     ; 459 {
 171  001d               f_USART1_RX_TIM5_CC_IRQHandler:
 173                     ; 463 }
 174  001d 80            	iret	
 175                     ; 470 @svlreg INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
 175                     ; 471 {
 176  001e               f_I2C1_SPI2_IRQHandler:
 177  001e 8a            	push	cc
 178  001f 84            	pop	a
 179  0020 a4bf          	and	a,#191
 180  0022 88            	push	a
 181  0023 86            	pop	cc
 182  0024 3b0002        	push	c_x+2
 183  0027 be00          	ldw	x,c_x
 184  0029 89            	pushw	x
 185  002a 3b0002        	push	c_y+2
 186  002d be00          	ldw	x,c_y
 187  002f 89            	pushw	x
 188  0030 be02          	ldw	x,c_lreg+2
 189  0032 89            	pushw	x
 190  0033 be00          	ldw	x,c_lreg
 191  0035 89            	pushw	x
 193                     ; 473   if (I2C_ReadRegister(I2C1, I2C_Register_SR2))
 194  0036 4b08          	push	#8
 195  0038 ae5210        	ldw	x,#21008
 196  003b cd0000        	call	_I2C_ReadRegister
 198  003e 5b01          	addw	sp,#1
 199  0040 4d            	tnz	a
 200  0041 2704          	jreq	L52
 201                     ; 476     I2C1->SR2 = 0;
 202  0043 725f5218      	clr	21016
 203  0047               L52:
 204                     ; 482   Event = I2C_GetLastEvent(I2C1);
 205  0047 ae5210        	ldw	x,#21008
 206  004a cd0000        	call	_I2C_GetLastEvent
 208  004d cf0002        	ldw	_Event,x
 209                     ; 483   switch (Event)
 210  0050 ce0002        	ldw	x,_Event
 212                     ; 552     default:
 212                     ; 553       break;
 213  0053 1d0010        	subw	x,#16
 214  0056 2604ac220122  	jreq	L12
 215  005c 1d01f2        	subw	x,#498
 216  005f 2709          	jreq	L3
 217  0061 1d003e        	subw	x,#62
 218  0064 2710          	jreq	L5
 219  0066 ac450145      	jra	L13
 220  006a               L3:
 221                     ; 486     case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
 221                     ; 487       Rx_Idx = 0;
 222  006a 725f0000      	clr	_Rx_Idx
 223                     ; 488 			addr_ok = 1;
 224  006e 35010001      	mov	_addr_ok,#1
 225                     ; 489       break;
 226  0072 ac450145      	jra	L13
 227  0076               L5:
 228                     ; 492     case I2C_EVENT_SLAVE_BYTE_RECEIVED:
 228                     ; 493 			if (addr_ok == 1) {
 229  0076 c60001        	ld	a,_addr_ok
 230  0079 4a            	dec	a
 231  007a 2704ac1c011c  	jrne	L33
 232                     ; 494 				if (Rx_Idx == 0) {
 233  0080 725d0000      	tnz	_Rx_Idx
 234  0084 265e          	jrne	L53
 235                     ; 495 					i2c_buff [0] = 1;
 236  0086 35010000      	mov	_i2c_buff,#1
 237                     ; 496 					count = 1;
 238  008a 35010004      	mov	_count,#1
 239                     ; 497 					 inp = I2C_ReceiveData(I2C1);
 240  008e ae5210        	ldw	x,#21008
 241  0091 cd0000        	call	_I2C_ReceiveData
 243  0094 c70005        	ld	_inp,a
 244                     ; 498 						A = inp & 0b11100000; //разбор битов управления и регистров по своим местам
 245  0097 a4e0          	and	a,#224
 246  0099 c70003        	ld	_A,a
 247                     ; 499 						D = inp & 0b00001111;
 248  009c c60005        	ld	a,_inp
 249  009f a40f          	and	a,#15
 250  00a1 c70002        	ld	_D,a
 251                     ; 500 						USART_SendData8(USART1, D);
 252  00a4 88            	push	a
 253  00a5 ae5230        	ldw	x,#21040
 254  00a8 cd0000        	call	_USART_SendData8
 256  00ab 84            	pop	a
 257                     ; 501 						switch (A){
 258  00ac c60003        	ld	a,_A
 260                     ; 524 						break;
 261  00af a080          	sub	a,#128
 262  00b1 270e          	jreq	L11
 263  00b3 a020          	sub	a,#32
 264  00b5 2713          	jreq	L31
 265  00b7 a020          	sub	a,#32
 266  00b9 2719          	jreq	L51
 267  00bb a020          	sub	a,#32
 268  00bd 271b          	jreq	L71
 269  00bf 205b          	jra	L33
 270                     ; 503 						case AUTO_INCREMENT_OFF: 
 270                     ; 504 						break;
 271  00c1               L11:
 272                     ; 506 						case AUTO_INCREMENT_ALL:
 272                     ; 507 						ai_start = MODE1;
 273  00c1 c70001        	ld	_ai_start,a
 274                     ; 508 						ai_end = ALLCALLADR;
 275  00c4 350c0000      	mov	_ai_end,#12
 276                     ; 509 						break;
 277  00c8 2052          	jra	L33
 278  00ca               L31:
 279                     ; 511 						case AUTO_INCREMENT_BRIGHTNESS:
 279                     ; 512 						ai_start = PWM0;
 280  00ca 35020001      	mov	_ai_start,#2
 281                     ; 513 						ai_end = PWM3;
 282  00ce 35050000      	mov	_ai_end,#5
 283                     ; 514 						break;
 284  00d2 2048          	jra	L33
 285  00d4               L51:
 286                     ; 516 						case AUTO_INCREMENT_GCONTROL:
 286                     ; 517 						ai_start = GRPPWM;
 287  00d4 35060001      	mov	_ai_start,#6
 288                     ; 518 						ai_end = GRPFREQ;
 289                     ; 519 						break;
 290  00d8 2004          	jpf	LC001
 291  00da               L71:
 292                     ; 521 						case AUTO_INCREMENT_I_GCONTROL:
 292                     ; 522 						ai_start = PWM0;
 293  00da 35020001      	mov	_ai_start,#2
 294                     ; 523 						ai_end = GRPFREQ;
 295  00de               LC001:
 296  00de 35070000      	mov	_ai_end,#7
 297                     ; 524 						break;
 298  00e2 2038          	jra	L33
 300  00e4               L53:
 301                     ; 528 							Config_reg [D] = I2C_ReceiveData(I2C1);
 302  00e4 c60002        	ld	a,_D
 303  00e7 5f            	clrw	x
 304  00e8 97            	ld	xl,a
 305  00e9 89            	pushw	x
 306  00ea ae5210        	ldw	x,#21008
 307  00ed cd0000        	call	_I2C_ReceiveData
 309  00f0 85            	popw	x
 310  00f1 d70000        	ld	(_Config_reg,x),a
 311                     ; 529 							i2c_buff [count] = Config_reg [D];
 312  00f4 c60004        	ld	a,_count
 313  00f7 5f            	clrw	x
 314  00f8 97            	ld	xl,a
 315  00f9 c60002        	ld	a,_D
 316  00fc 905f          	clrw	y
 317  00fe 9097          	ld	yl,a
 318  0100 90d60000      	ld	a,(_Config_reg,y)
 319  0104 d70000        	ld	(_i2c_buff,x),a
 320                     ; 530 							count++;
 321  0107 725c0004      	inc	_count
 322                     ; 531 							D ++;
 323  010b 725c0002      	inc	_D
 324                     ; 532 							if (D > ai_end) D = ai_start;
 325  010f c60002        	ld	a,_D
 326  0112 c10000        	cp	a,_ai_end
 327  0115 2305          	jrule	L33
 329  0117 5500010002    	mov	_D,_ai_start
 330  011c               L33:
 331                     ; 535 				Rx_Idx++;
 332  011c 725c0000      	inc	_Rx_Idx
 333                     ; 536       break;
 334  0120 2023          	jra	L13
 335  0122               L12:
 336                     ; 539     case (I2C_EVENT_SLAVE_STOP_DETECTED):
 336                     ; 540 			/* write to CR2 to clear STOPF flag */
 336                     ; 541 			I2C1->CR2 |= I2C_CR2_ACK;
 337  0122 72145211      	bset	21009,#2
 338                     ; 543 			if (addr_ok == 1) {
 339  0126 c60001        	ld	a,_addr_ok
 340  0129 4a            	dec	a
 341  012a 2615          	jrne	L74
 342                     ; 544 			Rx_size = Rx_Idx;
 343  012c 5500000000    	mov	_Rx_size,_Rx_Idx
 344                     ; 545 			Rx_Idx = 0;
 345  0131 c70000        	ld	_Rx_Idx,a
 346                     ; 546 			CommunicationEnd = 0x01;
 347  0134 35010000      	mov	_CommunicationEnd,#1
 348                     ; 547 			USART_SendData8(USART1, 0xFF);
 349  0138 4bff          	push	#255
 350  013a ae5230        	ldw	x,#21040
 351  013d cd0000        	call	_USART_SendData8
 353  0140 84            	pop	a
 354  0141               L74:
 355                     ; 549 			addr_ok = 0;
 356  0141 725f0001      	clr	_addr_ok
 357                     ; 550       break;
 358                     ; 552     default:
 358                     ; 553       break;
 359  0145               L13:
 360                     ; 555 }
 361  0145 85            	popw	x
 362  0146 bf00          	ldw	c_lreg,x
 363  0148 85            	popw	x
 364  0149 bf02          	ldw	c_lreg+2,x
 365  014b 85            	popw	x
 366  014c bf00          	ldw	c_y,x
 367  014e 320002        	pop	c_y+2
 368  0151 85            	popw	x
 369  0152 bf00          	ldw	c_x,x
 370  0154 320002        	pop	c_x+2
 371  0157 80            	iret	
 372                     	xref	_i2c_buff
 373                     	xref	_Config_reg
 374                     	xref	_CommunicationEnd
 375                     	xdef	_Event
 376                     	xref	_Rx_size
 377                     	switch	.bss
 378  0000               _ai_end:
 379  0000 00            	ds.b	1
 380                     	xdef	_ai_end
 381  0001               _ai_start:
 382  0001 00            	ds.b	1
 383                     	xdef	_ai_start
 384  0002               _D:
 385  0002 00            	ds.b	1
 386                     	xdef	_D
 387  0003               _A:
 388  0003 00            	ds.b	1
 389                     	xdef	_A
 390                     	xdef	_addr_ok
 391  0004               _count:
 392  0004 00            	ds.b	1
 393                     	xdef	_count
 394  0005               _inp:
 395  0005 00            	ds.b	1
 396                     	xdef	_inp
 397  0006               _a:
 398  0006 00000000      	ds.b	4
 399                     	xdef	_a
 400                     	xdef	_Rx_Idx
 401                     	xdef	f_I2C1_SPI2_IRQHandler
 402                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
 403                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 404                     	xdef	f_SPI1_IRQHandler
 405                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
 406                     	xdef	f_TIM1_CC_IRQHandler
 407                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 408                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
 409                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 410                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
 411                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 412                     	xdef	f_ADC1_COMP_IRQHandler
 413                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 414                     	xdef	f_LCD_AES_IRQHandler
 415                     	xdef	f_EXTI7_IRQHandler
 416                     	xdef	f_EXTI6_IRQHandler
 417                     	xdef	f_EXTI5_IRQHandler
 418                     	xdef	f_EXTI4_IRQHandler
 419                     	xdef	f_EXTI3_IRQHandler
 420                     	xdef	f_EXTI2_IRQHandler
 421                     	xdef	f_EXTI1_IRQHandler
 422                     	xdef	f_EXTI0_IRQHandler
 423                     	xdef	f_EXTID_H_IRQHandler
 424                     	xdef	f_EXTIB_G_IRQHandler
 425                     	xdef	f_EXTIE_F_PVD_IRQHandler
 426                     	xdef	f_RTC_CSSLSE_IRQHandler
 427                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
 428                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
 429                     	xdef	f_FLASH_IRQHandler
 430                     	xdef	f_TRAP_IRQHandler
 431                     	xdef	f_NonHandledInterrupt
 432                     	xref	_USART_SendData8
 433                     	xref	_I2C_GetLastEvent
 434                     	xref	_I2C_ReadRegister
 435                     	xref	_I2C_ReceiveData
 436                     	xref.b	c_lreg
 437                     	xref.b	c_x
 438                     	xref.b	c_y
 439                     	end
