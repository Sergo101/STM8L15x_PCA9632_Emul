   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  22                     	switch	.data
  23  0000               _CommunicationEnd:
  24  0000 00            	dc.b	0
  82                     ; 116 void main(void)
  82                     ; 117 {
  84                     .text:	section	.text,new
  85  0000               _main:
  87  0000 88            	push	a
  88       00000001      OFST:	set	1
  91                     ; 118   uint8_t i = 0;
  93                     ; 121   CLK_Config(); 
  95  0001 cd0000        	call	L3_CLK_Config
  97                     ; 124   GPIO_Config(); 
  99  0004 cd0000        	call	L5_GPIO_Config
 101                     ; 127   TIM1_Config();
 103  0007 cd0000        	call	L7_TIM1_Config
 105                     ; 130   TIM3_Config();
 107  000a cd0000        	call	L11_TIM3_Config
 109                     ; 133 	slave_address = 0;
 111  000d 725f0113      	clr	_slave_address
 112                     ; 134 	if (GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_4)) {
 114  0011 4b10          	push	#16
 115  0013 ae5000        	ldw	x,#20480
 116  0016 cd0000        	call	_GPIO_ReadInputDataBit
 118  0019 5b01          	addw	sp,#1
 119  001b 4d            	tnz	a
 120  001c 2704          	jreq	L14
 121                     ; 135 		slave_address = slave_address | 0b10;
 123  001e 72120113      	bset	_slave_address,#1
 124  0022               L14:
 125                     ; 137 	if (GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_5)) {
 127  0022 4b20          	push	#32
 128  0024 ae5000        	ldw	x,#20480
 129  0027 cd0000        	call	_GPIO_ReadInputDataBit
 131  002a 5b01          	addw	sp,#1
 132  002c 4d            	tnz	a
 133  002d 2704          	jreq	L34
 134                     ; 138 		slave_address = slave_address | 0b01;
 136  002f 72100113      	bset	_slave_address,#0
 137  0033               L34:
 138                     ; 140 	slave_address = (slave_address | 0b1100000) <<1;
 140  0033 c60113        	ld	a,_slave_address
 141  0036 aa60          	or	a,#96
 142  0038 48            	sll	a
 143  0039 c70113        	ld	_slave_address,a
 144                     ; 143   I2C_DeInit(I2C1);
 146  003c ae5210        	ldw	x,#21008
 147  003f cd0000        	call	_I2C_DeInit
 149                     ; 146   I2C_Init(I2C1, 100000, slave_address,
 149                     ; 147            I2C_Mode_I2C, I2C_DutyCycle_2,
 149                     ; 148            I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 151  0042 4b00          	push	#0
 152  0044 4b04          	push	#4
 153  0046 4b00          	push	#0
 154  0048 4b00          	push	#0
 155  004a c60113        	ld	a,_slave_address
 156  004d 5f            	clrw	x
 157  004e 97            	ld	xl,a
 158  004f 89            	pushw	x
 159  0050 ae86a0        	ldw	x,#34464
 160  0053 89            	pushw	x
 161  0054 ae0001        	ldw	x,#1
 162  0057 89            	pushw	x
 163  0058 ae5210        	ldw	x,#21008
 164  005b cd0000        	call	_I2C_Init
 166  005e 5b0a          	addw	sp,#10
 167                     ; 152   I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
 169  0060 4b01          	push	#1
 170  0062 ae0007        	ldw	x,#7
 171  0065 89            	pushw	x
 172  0066 ae5210        	ldw	x,#21008
 173  0069 cd0000        	call	_I2C_ITConfig
 175  006c 5b03          	addw	sp,#3
 176                     ; 163 	USART_DeInit(USART1);
 178  006e ae5230        	ldw	x,#21040
 179  0071 cd0000        	call	_USART_DeInit
 181                     ; 164   USART_Init(USART1, (uint32_t)115200, USART_WordLength_8b, USART_StopBits_1,
 181                     ; 165                    USART_Parity_No, USART_Mode_Rx | USART_Mode_Tx );
 183  0074 4b0c          	push	#12
 184  0076 4b00          	push	#0
 185  0078 4b00          	push	#0
 186  007a 4b00          	push	#0
 187  007c aec200        	ldw	x,#49664
 188  007f 89            	pushw	x
 189  0080 ae0001        	ldw	x,#1
 190  0083 89            	pushw	x
 191  0084 ae5230        	ldw	x,#21040
 192  0087 cd0000        	call	_USART_Init
 194  008a 5b08          	addw	sp,#8
 195                     ; 169   USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
 197  008c 4b01          	push	#1
 198  008e ae0255        	ldw	x,#597
 199  0091 89            	pushw	x
 200  0092 ae5230        	ldw	x,#21040
 201  0095 cd0000        	call	_USART_ITConfig
 203  0098 5b03          	addw	sp,#3
 204                     ; 171 	USART_Cmd (USART1, ENABLE);
 206  009a 4b01          	push	#1
 207  009c ae5230        	ldw	x,#21040
 208  009f cd0000        	call	_USART_Cmd
 210  00a2 9a            	rim	
 211  00a3 ae1388        	ldw	x,#5000
 212  00a6 84            	pop	a
 213                     ; 174   enableInterrupts();
 217                     ; 177 	Set_LED1 (5000);
 220  00a7 cd0000        	call	_TIM1_SetCompare3
 222                     ; 178 	a = 100000;
 222                     ; 179 			while (a) a--;
 225  00aa ae86a0        	ldw	x,#34464
 226  00ad cf0002        	ldw	_a+2,x
 227  00b0 ae0001        	ldw	x,#1
 228  00b3 cf0000        	ldw	_a,x
 229  00b6 ae0000        	ldw	x,#_a
 230  00b9               L54:
 234  00b9 a601          	ld	a,#1
 235  00bb cd0000        	call	c_lgsbc
 239  00be cd0000        	call	c_lzmp
 241  00c1 26f6          	jrne	L54
 242                     ; 180 	Set_LED1 (0);
 244  00c3 5f            	clrw	x
 245  00c4 cd0000        	call	_TIM1_SetCompare3
 247                     ; 182 Config_reg[MODE1] = 0b10010001;
 249  00c7 35910106      	mov	_Config_reg,#145
 250                     ; 184 	printf("\n\rPCA9632 V 1.0\n\r");
 252  00cb ae0043        	ldw	x,#L35
 253  00ce cd0000        	call	_printf
 255                     ; 185   printf("\n\rInertGas Medical\n\r");
 257  00d1 ae002e        	ldw	x,#L55
 258  00d4 cd0000        	call	_printf
 260  00d7               L75:
 261                     ; 189 			if(CommunicationEnd == 0x01) //upload data from i2c buffer and update pwm 
 263  00d7 c60000        	ld	a,_CommunicationEnd
 264  00da 4a            	dec	a
 265  00db 26fa          	jrne	L75
 266                     ; 193 				Update_Control ();
 268  00dd cd0000        	call	L51_Update_Control
 270                     ; 194 				CommunicationEnd = 0;
 272  00e0 725f0000      	clr	_CommunicationEnd
 273  00e4 20f1          	jra	L75
 307                     ; 206 PUTCHAR_PROTOTYPE
 307                     ; 207 {
 308                     .text:	section	.text,new
 309  0000               _putchar:
 311  0000 88            	push	a
 312       00000000      OFST:	set	0
 315                     ; 209   USART_SendData8(USART1, c);
 317  0001 88            	push	a
 318  0002 ae5230        	ldw	x,#21040
 319  0005 cd0000        	call	_USART_SendData8
 321  0008 84            	pop	a
 323  0009               L301:
 324                     ; 211   while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
 326  0009 ae0040        	ldw	x,#64
 327  000c 89            	pushw	x
 328  000d ae5230        	ldw	x,#21040
 329  0010 cd0000        	call	_USART_GetFlagStatus
 331  0013 4d            	tnz	a
 332  0014 85            	popw	x
 333  0015 27f2          	jreq	L301
 334                     ; 213   return (c);
 336  0017 7b01          	ld	a,(OFST+1,sp)
 339  0019 5b01          	addw	sp,#1
 340  001b 81            	ret	
 374                     ; 222 GETCHAR_PROTOTYPE
 374                     ; 223 {
 375                     .text:	section	.text,new
 376  0000               _getchar:
 378  0000 89            	pushw	x
 379       00000002      OFST:	set	2
 382                     ; 224   int c = 0;
 385  0001               L521:
 386                     ; 226   while (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == RESET);
 388  0001 ae0020        	ldw	x,#32
 389  0004 89            	pushw	x
 390  0005 ae5230        	ldw	x,#21040
 391  0008 cd0000        	call	_USART_GetFlagStatus
 393  000b 4d            	tnz	a
 394  000c 85            	popw	x
 395  000d 27f2          	jreq	L521
 396                     ; 227     c = USART_ReceiveData8(USART1);
 398  000f ae5230        	ldw	x,#21040
 399  0012 cd0000        	call	_USART_ReceiveData8
 401  0015 5f            	clrw	x
 402  0016 97            	ld	xl,a
 403  0017 1f01          	ldw	(OFST-1,sp),x
 405                     ; 228     return (c);
 407  0019 7b02          	ld	a,(OFST+0,sp)
 410  001b 85            	popw	x
 411  001c 81            	ret	
 436                     ; 236 static void CLK_Config(void)
 436                     ; 237 {
 437                     .text:	section	.text,new
 438  0000               L3_CLK_Config:
 442                     ; 239 	CLK_SYSCLKDivConfig (CLK_SYSCLKDiv_1); 
 444  0000 4f            	clr	a
 445  0001 cd0000        	call	_CLK_SYSCLKDivConfig
 447                     ; 242   CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 449  0004 ae0301        	ldw	x,#769
 450  0007 cd0000        	call	_CLK_PeripheralClockConfig
 452                     ; 245   CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 454  000a ae1101        	ldw	x,#4353
 455  000d cd0000        	call	_CLK_PeripheralClockConfig
 457                     ; 248   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 459  0010 ae0101        	ldw	x,#257
 460  0013 cd0000        	call	_CLK_PeripheralClockConfig
 462                     ; 251   CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 464  0016 ae0501        	ldw	x,#1281
 466                     ; 252 }
 469  0019 cc0000        	jp	_CLK_PeripheralClockConfig
 493                     ; 259 static void GPIO_Config(void)
 493                     ; 260 {
 494                     .text:	section	.text,new
 495  0000               L5_GPIO_Config:
 499                     ; 261 	SYSCFG->RMPCR1	|= 0b01 << 4;	//reconfig USART Pins from PC2,3 to PA2,3
 501  0000 7218509e      	bset	20638,#4
 502                     ; 264   GPIO_Init(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 504  0004 4be0          	push	#224
 505  0006 4b17          	push	#23
 506  0008 ae500f        	ldw	x,#20495
 507  000b cd0000        	call	_GPIO_Init
 509  000e 85            	popw	x
 510                     ; 267 	GPIO_Init(GPIOA, GPIO_Pin_4 | GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
 512  000f 4b40          	push	#64
 513  0011 4b30          	push	#48
 514  0013 ae5000        	ldw	x,#20480
 515  0016 cd0000        	call	_GPIO_Init
 517  0019 85            	popw	x
 518                     ; 268 }
 521  001a 81            	ret	
 555                     ; 275 static void TIM1_Config(void)
 555                     ; 276 {
 556                     .text:	section	.text,new
 557  0000               L7_TIM1_Config:
 561                     ; 282   TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);
 563  0000 4b00          	push	#0
 564  0002 ae27d8        	ldw	x,#10200
 565  0005 89            	pushw	x
 566  0006 4b00          	push	#0
 567  0008 5f            	clrw	x
 568  0009 cd0000        	call	_TIM1_TimeBaseInit
 570  000c 5b04          	addw	sp,#4
 571                     ; 285   TIM1_OC1Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 571                     ; 286                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 571                     ; 287                TIM1_OCNIdleState_Set);
 573  000e 4b2a          	push	#42
 574  0010 4b55          	push	#85
 575  0012 4b88          	push	#136
 576  0014 4b00          	push	#0
 577  0016 5f            	clrw	x
 578  0017 89            	pushw	x
 579  0018 4b00          	push	#0
 580  001a ae6011        	ldw	x,#24593
 581  001d cd0000        	call	_TIM1_OC1Init
 583  0020 5b07          	addw	sp,#7
 584                     ; 288   TIM1_OC1PreloadConfig(DISABLE);
 586  0022 4f            	clr	a
 587  0023 cd0000        	call	_TIM1_OC1PreloadConfig
 589                     ; 291   TIM1_OC2Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 589                     ; 292                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 589                     ; 293                TIM1_OCNIdleState_Set);
 591  0026 4b2a          	push	#42
 592  0028 4b55          	push	#85
 593  002a 4b88          	push	#136
 594  002c 4b00          	push	#0
 595  002e 5f            	clrw	x
 596  002f 89            	pushw	x
 597  0030 4b00          	push	#0
 598  0032 ae6011        	ldw	x,#24593
 599  0035 cd0000        	call	_TIM1_OC2Init
 601  0038 5b07          	addw	sp,#7
 602                     ; 294   TIM1_OC2PreloadConfig(ENABLE);
 604  003a a601          	ld	a,#1
 605  003c cd0000        	call	_TIM1_OC2PreloadConfig
 607                     ; 297   TIM1_OC3Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 607                     ; 298                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 607                     ; 299                TIM1_OCNIdleState_Set);
 609  003f 4b2a          	push	#42
 610  0041 4b55          	push	#85
 611  0043 4b88          	push	#136
 612  0045 4b00          	push	#0
 613  0047 5f            	clrw	x
 614  0048 89            	pushw	x
 615  0049 4b00          	push	#0
 616  004b ae6011        	ldw	x,#24593
 617  004e cd0000        	call	_TIM1_OC3Init
 619  0051 5b07          	addw	sp,#7
 620                     ; 300   TIM1_OC3PreloadConfig(ENABLE);
 622  0053 a601          	ld	a,#1
 623  0055 cd0000        	call	_TIM1_OC3PreloadConfig
 625                     ; 302   TIM1_ARRPreloadConfig(ENABLE);
 627  0058 a601          	ld	a,#1
 628  005a cd0000        	call	_TIM1_ARRPreloadConfig
 630                     ; 305   enableInterrupts();
 633  005d 9a            	rim	
 635                     ; 308   TIM1_CtrlPWMOutputs(ENABLE);
 638  005e a601          	ld	a,#1
 639  0060 cd0000        	call	_TIM1_CtrlPWMOutputs
 641                     ; 310   TIM1_Cmd(ENABLE);
 643  0063 a601          	ld	a,#1
 645                     ; 311 }
 648  0065 cc0000        	jp	_TIM1_Cmd
 678                     ; 313 static void TIM3_Config(void)
 678                     ; 314 {
 679                     .text:	section	.text,new
 680  0000               L11_TIM3_Config:
 684                     ; 320   TIM3_TimeBaseInit(TIM1_PRESCALER, TIM3_CounterMode_Up, TIM1_PERIOD);
 686  0000 ae27d8        	ldw	x,#10200
 687  0003 89            	pushw	x
 688  0004 5f            	clrw	x
 689  0005 cd0000        	call	_TIM3_TimeBaseInit
 691  0008 85            	popw	x
 692                     ; 324   TIM3_OC2Init(TIM3_OCMode_PWM1, TIM3_OutputState_Enable, 0, TIM3_OCPolarity_High, TIM3_OCIdleState_Set);
 694  0009 4b01          	push	#1
 695  000b 4b00          	push	#0
 696  000d 5f            	clrw	x
 697  000e 89            	pushw	x
 698  000f ae6001        	ldw	x,#24577
 699  0012 cd0000        	call	_TIM3_OC2Init
 701  0015 5b04          	addw	sp,#4
 702                     ; 325   TIM3_OC2PreloadConfig(DISABLE);
 704  0017 4f            	clr	a
 705  0018 cd0000        	call	_TIM3_OC2PreloadConfig
 707                     ; 327   TIM3_ARRPreloadConfig(ENABLE);
 709  001b a601          	ld	a,#1
 710  001d cd0000        	call	_TIM3_ARRPreloadConfig
 712                     ; 330   enableInterrupts();
 715  0020 9a            	rim	
 717                     ; 333   TIM3_CtrlPWMOutputs(ENABLE);
 720  0021 a601          	ld	a,#1
 721  0023 cd0000        	call	_TIM3_CtrlPWMOutputs
 723                     ; 335   TIM3_Cmd(ENABLE);
 725  0026 a601          	ld	a,#1
 727                     ; 336 }
 730  0028 cc0000        	jp	_TIM3_Cmd
 781                     ; 338 static void I2C_Data_To_Registers (void){
 782                     .text:	section	.text,new
 783  0000               L31_I2C_Data_To_Registers:
 785  0000 5203          	subw	sp,#3
 786       00000003      OFST:	set	3
 789                     ; 343 	A = Slave_Buffer_Rx[0] & 0b11100000; //разбор битов управления и регистров по своим местам
 791  0002 c60007        	ld	a,_Slave_Buffer_Rx
 792  0005 a4e0          	and	a,#224
 793  0007 6b01          	ld	(OFST-2,sp),a
 795                     ; 344 	D = Slave_Buffer_Rx[0] & 0b00001111;
 797  0009 c60007        	ld	a,_Slave_Buffer_Rx
 798  000c a40f          	and	a,#15
 799  000e 6b03          	ld	(OFST+0,sp),a
 801                     ; 346 	printf ("Rx_size = %d\r", (int16_t)Rx_size);
 803  0010 c60006        	ld	a,_Rx_size
 804  0013 5f            	clrw	x
 805  0014 97            	ld	xl,a
 806  0015 89            	pushw	x
 807  0016 ae0020        	ldw	x,#L322
 808  0019 cd0000        	call	_printf
 810  001c 85            	popw	x
 811                     ; 347 	printf ("D = %d\r", (int16_t)D);
 813  001d 7b03          	ld	a,(OFST+0,sp)
 814  001f 5f            	clrw	x
 815  0020 97            	ld	xl,a
 816  0021 89            	pushw	x
 817  0022 ae0018        	ldw	x,#L522
 818  0025 cd0000        	call	_printf
 820  0028 85            	popw	x
 821                     ; 348 	for (i = 0; i < Rx_size; i++){
 823  0029 0f02          	clr	(OFST-1,sp)
 826  002b 2011          	jra	L332
 827  002d               L722:
 828                     ; 349 					printf ("buff = %x\r", (int16_t)Slave_Buffer_Rx[i]);
 830  002d 5f            	clrw	x
 831  002e 97            	ld	xl,a
 832  002f d60007        	ld	a,(_Slave_Buffer_Rx,x)
 833  0032 5f            	clrw	x
 834  0033 97            	ld	xl,a
 835  0034 89            	pushw	x
 836  0035 ae000d        	ldw	x,#L732
 837  0038 cd0000        	call	_printf
 839  003b 85            	popw	x
 840                     ; 348 	for (i = 0; i < Rx_size; i++){
 842  003c 0c02          	inc	(OFST-1,sp)
 844  003e               L332:
 847  003e 7b02          	ld	a,(OFST-1,sp)
 848  0040 c10006        	cp	a,_Rx_size
 849  0043 25e8          	jrult	L722
 850                     ; 352 		switch (A){
 852  0045 7b01          	ld	a,(OFST-2,sp)
 854                     ; 389 				break;
 855  0047 2716          	jreq	L171
 856  0049 a080          	sub	a,#128
 857  004b 271f          	jreq	L371
 858  004d a020          	sub	a,#32
 859  004f 2755          	jreq	L571
 860  0051 a020          	sub	a,#32
 861  0053 2775          	jreq	L771
 862  0055 a020          	sub	a,#32
 863  0057 2603cc00ee    	jreq	L102
 864  005c cc0110        	jra	L342
 865  005f               L171:
 866                     ; 354 			case AUTO_INCREMENT_OFF: 
 866                     ; 355 				Config_reg[D] = Slave_Buffer_Rx[1];
 868  005f 7b03          	ld	a,(OFST+0,sp)
 869  0061 5f            	clrw	x
 870  0062 97            	ld	xl,a
 871  0063 c60008        	ld	a,_Slave_Buffer_Rx+1
 872  0066 d70106        	ld	(_Config_reg,x),a
 873                     ; 356 				break;
 875  0069 cc0110        	jra	L342
 876  006c               L371:
 877                     ; 358 			case AUTO_INCREMENT_ALL:
 877                     ; 359 				for (i = 1; i <= Rx_size; i++){
 879  006c 4c            	inc	a
 880  006d 6b02          	ld	(OFST-1,sp),a
 883  006f 202e          	jra	L152
 884  0071               L542:
 885                     ; 360 					Config_reg[D] = Slave_Buffer_Rx[i];
 887  0071 7b03          	ld	a,(OFST+0,sp)
 888  0073 5f            	clrw	x
 889  0074 97            	ld	xl,a
 890  0075 7b02          	ld	a,(OFST-1,sp)
 891  0077 cd0113        	call	LC001
 892                     ; 361 					printf ("reg %d = %d\r", (int16_t)D, (int16_t)Slave_Buffer_Rx[i]);
 894  007a 7b02          	ld	a,(OFST-1,sp)
 895  007c 5f            	clrw	x
 896  007d 97            	ld	xl,a
 897  007e d60007        	ld	a,(_Slave_Buffer_Rx,x)
 898  0081 5f            	clrw	x
 899  0082 97            	ld	xl,a
 900  0083 89            	pushw	x
 901  0084 7b05          	ld	a,(OFST+2,sp)
 902  0086 5f            	clrw	x
 903  0087 97            	ld	xl,a
 904  0088 89            	pushw	x
 905  0089 ae0000        	ldw	x,#L552
 906  008c cd0000        	call	_printf
 908  008f 5b04          	addw	sp,#4
 909                     ; 362 					D++;
 911  0091 0c03          	inc	(OFST+0,sp)
 913                     ; 363 						if (D > ALLCALLADR) D = MODE1;
 915  0093 7b03          	ld	a,(OFST+0,sp)
 916  0095 a10d          	cp	a,#13
 917  0097 2502          	jrult	L752
 920  0099 0f03          	clr	(OFST+0,sp)
 922  009b               L752:
 923                     ; 359 				for (i = 1; i <= Rx_size; i++){
 925  009b 0c02          	inc	(OFST-1,sp)
 927  009d 7b02          	ld	a,(OFST-1,sp)
 928  009f               L152:
 931  009f c10006        	cp	a,_Rx_size
 932  00a2 23cd          	jrule	L542
 933                     ; 365 				break;
 935  00a4 206a          	jra	L342
 936  00a6               L571:
 937                     ; 367 			case AUTO_INCREMENT_BRIGHTNESS:
 937                     ; 368 				for (i = 1; i <= Rx_size; i++){
 939  00a6 4c            	inc	a
 940  00a7 6b02          	ld	(OFST-1,sp),a
 943  00a9 2018          	jra	L562
 944  00ab               L162:
 945                     ; 369 					Config_reg[D] = Slave_Buffer_Rx[i];
 947  00ab 7b03          	ld	a,(OFST+0,sp)
 948  00ad 5f            	clrw	x
 949  00ae 97            	ld	xl,a
 950  00af 7b02          	ld	a,(OFST-1,sp)
 951  00b1 ad60          	call	LC001
 952                     ; 370 					D++;
 954  00b3 0c03          	inc	(OFST+0,sp)
 956                     ; 371 						if (D > PWM3) D = PWM0;
 958  00b5 7b03          	ld	a,(OFST+0,sp)
 959  00b7 a106          	cp	a,#6
 960  00b9 2504          	jrult	L172
 963  00bb a602          	ld	a,#2
 964  00bd 6b03          	ld	(OFST+0,sp),a
 966  00bf               L172:
 967                     ; 368 				for (i = 1; i <= Rx_size; i++){
 969  00bf 0c02          	inc	(OFST-1,sp)
 971  00c1 7b02          	ld	a,(OFST-1,sp)
 972  00c3               L562:
 975  00c3 c10006        	cp	a,_Rx_size
 976  00c6 23e3          	jrule	L162
 977                     ; 373 				break;
 979  00c8 2046          	jra	L342
 980  00ca               L771:
 981                     ; 375 			case AUTO_INCREMENT_GCONTROL:
 981                     ; 376 				for (i = 1; i <= Rx_size; i++){
 983  00ca 4c            	inc	a
 984  00cb 6b02          	ld	(OFST-1,sp),a
 987  00cd 2018          	jra	L772
 988  00cf               L372:
 989                     ; 377 					Config_reg[D] = Slave_Buffer_Rx[i];
 991  00cf 7b03          	ld	a,(OFST+0,sp)
 992  00d1 5f            	clrw	x
 993  00d2 97            	ld	xl,a
 994  00d3 7b02          	ld	a,(OFST-1,sp)
 995  00d5 ad3c          	call	LC001
 996                     ; 378 					D++;
 998  00d7 0c03          	inc	(OFST+0,sp)
1000                     ; 379 						if (D > GRPFREQ) D = GRPPWM;
1002  00d9 7b03          	ld	a,(OFST+0,sp)
1003  00db a108          	cp	a,#8
1004  00dd 2504          	jrult	L303
1007  00df a606          	ld	a,#6
1008  00e1 6b03          	ld	(OFST+0,sp),a
1010  00e3               L303:
1011                     ; 376 				for (i = 1; i <= Rx_size; i++){
1013  00e3 0c02          	inc	(OFST-1,sp)
1015  00e5 7b02          	ld	a,(OFST-1,sp)
1016  00e7               L772:
1019  00e7 c10006        	cp	a,_Rx_size
1020  00ea 23e3          	jrule	L372
1021                     ; 381 				break;
1023  00ec 2022          	jra	L342
1024  00ee               L102:
1025                     ; 383 			case AUTO_INCREMENT_I_GCONTROL:
1025                     ; 384 				for (i = 1; i <= Rx_size; i++){
1027  00ee 4c            	inc	a
1028  00ef 6b02          	ld	(OFST-1,sp),a
1031  00f1 2018          	jra	L113
1032  00f3               L503:
1033                     ; 385 					Config_reg[D] = Slave_Buffer_Rx[i];
1035  00f3 7b03          	ld	a,(OFST+0,sp)
1036  00f5 5f            	clrw	x
1037  00f6 97            	ld	xl,a
1038  00f7 7b02          	ld	a,(OFST-1,sp)
1039  00f9 ad18          	call	LC001
1040                     ; 386 					D++;
1042  00fb 0c03          	inc	(OFST+0,sp)
1044                     ; 387 						if (D > GRPFREQ) D = PWM0;
1046  00fd 7b03          	ld	a,(OFST+0,sp)
1047  00ff a108          	cp	a,#8
1048  0101 2504          	jrult	L513
1051  0103 a602          	ld	a,#2
1052  0105 6b03          	ld	(OFST+0,sp),a
1054  0107               L513:
1055                     ; 384 				for (i = 1; i <= Rx_size; i++){
1057  0107 0c02          	inc	(OFST-1,sp)
1059  0109 7b02          	ld	a,(OFST-1,sp)
1060  010b               L113:
1063  010b c10006        	cp	a,_Rx_size
1064  010e 23e3          	jrule	L503
1065                     ; 389 				break;
1067  0110               L342:
1068                     ; 392 }
1071  0110 5b03          	addw	sp,#3
1072  0112 81            	ret	
1073  0113               LC001:
1074  0113 905f          	clrw	y
1075  0115 9097          	ld	yl,a
1076  0117 90d60007      	ld	a,(_Slave_Buffer_Rx,y)
1077  011b d70106        	ld	(_Config_reg,x),a
1078  011e 81            	ret	
1168                     ; 394 static void Update_Control (void){
1169                     .text:	section	.text,new
1170  0000               L51_Update_Control:
1172  0000 520c          	subw	sp,#12
1173       0000000c      OFST:	set	12
1176                     ; 395 	uint8_t ledout0 = Config_reg[LEDOUT] & 0b11;
1178  0002 c6010e        	ld	a,_Config_reg+8
1179  0005 a403          	and	a,#3
1180  0007 6b04          	ld	(OFST-8,sp),a
1182                     ; 396 	uint8_t ledout1 = (Config_reg[LEDOUT] >> 2) & 0b11;
1184  0009 c6010e        	ld	a,_Config_reg+8
1185  000c a40c          	and	a,#12
1186  000e 44            	srl	a
1187  000f 44            	srl	a
1188  0010 6b02          	ld	(OFST-10,sp),a
1190                     ; 397 	uint8_t ledout2 = (Config_reg[LEDOUT] >> 4) & 0b11;
1192  0012 c6010e        	ld	a,_Config_reg+8
1193  0015 4e            	swap	a
1194  0016 a403          	and	a,#3
1195  0018 6b03          	ld	(OFST-9,sp),a
1197                     ; 398 	uint8_t ledout3 = (Config_reg[LEDOUT] >> 6) & 0b11;
1199  001a c6010e        	ld	a,_Config_reg+8
1200                     ; 406 	if ( !((Config_reg [MODE1] >> 4) & 1) ){ //check for SLEEP mode bit & OFF when SLEEP = 0
1202  001d c60106        	ld	a,_Config_reg
1203  0020 4e            	swap	a
1204  0021 a401          	and	a,#1
1205  0023 5f            	clrw	x
1206  0024 97            	ld	xl,a
1207  0025 5d            	tnzw	x
1208  0026 2703cc014a    	jrne	L114
1209                     ; 409 		if ((Config_reg [MODE2] >> 4)&1) {
1211  002b c60107        	ld	a,_Config_reg+1
1212  002e 4e            	swap	a
1213  002f a401          	and	a,#1
1214  0031 5f            	clrw	x
1215  0032 97            	ld	xl,a
1216  0033 5d            	tnzw	x
1217  0034 2738          	jreq	L314
1218                     ; 410 			pwm0 = (255 - Config_reg[PWM0]) *40;
1220  0036 4f            	clr	a
1221  0037 97            	ld	xl,a
1222  0038 4a            	dec	a
1223  0039 c00108        	sub	a,_Config_reg+2
1224  003c 2401          	jrnc	L071
1225  003e 5a            	decw	x
1226  003f               L071:
1227  003f cd015d        	call	LC005
1229  0042 1f05          	ldw	(OFST-7,sp),x
1231                     ; 411 			pwm1 = (255 - Config_reg[PWM1]) *40;
1233  0044 4f            	clr	a
1234  0045 97            	ld	xl,a
1235  0046 4a            	dec	a
1236  0047 c00109        	sub	a,_Config_reg+3
1237  004a 2401          	jrnc	L271
1238  004c 5a            	decw	x
1239  004d               L271:
1240  004d cd015d        	call	LC005
1242  0050 1f07          	ldw	(OFST-5,sp),x
1244                     ; 412 			pwm2 = (255 - Config_reg[PWM2]) *40;
1246  0052 4f            	clr	a
1247  0053 97            	ld	xl,a
1248  0054 4a            	dec	a
1249  0055 c0010a        	sub	a,_Config_reg+4
1250  0058 2401          	jrnc	L471
1251  005a 5a            	decw	x
1252  005b               L471:
1253  005b cd015d        	call	LC005
1255  005e 1f09          	ldw	(OFST-3,sp),x
1257                     ; 413 			pwm3 = (255 - Config_reg[PWM3]) *40;
1259  0060 4f            	clr	a
1260  0061 97            	ld	xl,a
1261  0062 4a            	dec	a
1262  0063 c0010b        	sub	a,_Config_reg+5
1263  0066 2401          	jrnc	L671
1264  0068 5a            	decw	x
1265  0069               L671:
1266  0069 cd015d        	call	LC005
1269  006c 201e          	jra	L514
1270  006e               L314:
1271                     ; 416 			pwm0 = Config_reg[PWM0] *40;
1273  006e c60108        	ld	a,_Config_reg+2
1274  0071 cd0163        	call	LC006
1275  0074 1f05          	ldw	(OFST-7,sp),x
1277                     ; 417 			pwm1 = Config_reg[PWM1] *40;
1279  0076 c60109        	ld	a,_Config_reg+3
1280  0079 cd0163        	call	LC006
1281  007c 1f07          	ldw	(OFST-5,sp),x
1283                     ; 418 			pwm2 = Config_reg[PWM2] *40;
1285  007e c6010a        	ld	a,_Config_reg+4
1286  0081 cd0163        	call	LC006
1287  0084 1f09          	ldw	(OFST-3,sp),x
1289                     ; 419 			pwm3 = Config_reg[PWM3] *40;
1291  0086 c6010b        	ld	a,_Config_reg+5
1292  0089 cd0163        	call	LC006
1293  008c               L514:
1294  008c 1f0b          	ldw	(OFST-1,sp),x
1296                     ; 424 		switch (ledout0) {
1298  008e 7b04          	ld	a,(OFST-8,sp)
1300                     ; 440 				break;
1301  0090 270b          	jreq	L713
1302  0092 4a            	dec	a
1303  0093 270b          	jreq	L123
1304  0095 4a            	dec	a
1305  0096 270d          	jreq	L323
1306  0098 4a            	dec	a
1307  0099 2715          	jreq	L523
1308  009b 201c          	jra	L124
1309  009d               L713:
1310                     ; 425 			case 0b00:
1310                     ; 426 				Set_LED0 (0);
1312  009d 5f            	clrw	x
1314                     ; 427 				en_blink_led0 = 0;
1315                     ; 428 				break;
1317  009e 2007          	jp	LC002
1318  00a0               L123:
1319                     ; 429 			case 0b01:
1319                     ; 430 				Set_LED0 (10200);
1321  00a0 ae27d8        	ldw	x,#10200
1323                     ; 431 				en_blink_led0 = 0;
1324                     ; 432 				break;
1326  00a3 2002          	jp	LC002
1327  00a5               L323:
1328                     ; 433 			case 0b10:
1328                     ; 434 				Set_LED0 (pwm0);
1330  00a5 1e05          	ldw	x,(OFST-7,sp)
1332                     ; 435 				en_blink_led0 = 0;
1334  00a7               LC002:
1335  00a7 cd0000        	call	_TIM3_SetCompare2
1338  00aa 725f0003      	clr	_en_blink_led0
1339                     ; 436 				break;
1341  00ae 2009          	jra	L124
1342  00b0               L523:
1343                     ; 437 			case 0b11:
1343                     ; 438 				Set_LED0 (pwm0);
1345  00b0 1e05          	ldw	x,(OFST-7,sp)
1346  00b2 cd0000        	call	_TIM3_SetCompare2
1348                     ; 439 				en_blink_led0 = 1;
1350  00b5 35010003      	mov	_en_blink_led0,#1
1351                     ; 440 				break;
1353  00b9               L124:
1354                     ; 443 		switch (ledout1) {
1356  00b9 7b02          	ld	a,(OFST-10,sp)
1358                     ; 459 				break;
1359  00bb 270b          	jreq	L723
1360  00bd 4a            	dec	a
1361  00be 270b          	jreq	L133
1362  00c0 4a            	dec	a
1363  00c1 270d          	jreq	L333
1364  00c3 4a            	dec	a
1365  00c4 2715          	jreq	L533
1366  00c6 201c          	jra	L524
1367  00c8               L723:
1368                     ; 444 			case 0b00:
1368                     ; 445 				Set_LED1 (0);
1370  00c8 5f            	clrw	x
1372                     ; 446 				en_blink_led1 = 0;
1373                     ; 447 				break;
1375  00c9 2007          	jp	LC003
1376  00cb               L133:
1377                     ; 448 			case 0b01:
1377                     ; 449 				Set_LED1 (10200);
1379  00cb ae27d8        	ldw	x,#10200
1381                     ; 450 				en_blink_led1 = 0;
1382                     ; 451 				break;
1384  00ce 2002          	jp	LC003
1385  00d0               L333:
1386                     ; 452 			case 0b10:
1386                     ; 453 				Set_LED1 (pwm1);
1388  00d0 1e07          	ldw	x,(OFST-5,sp)
1390                     ; 454 				en_blink_led1 = 0;
1392  00d2               LC003:
1393  00d2 cd0000        	call	_TIM1_SetCompare3
1396  00d5 725f0002      	clr	_en_blink_led1
1397                     ; 455 				break;
1399  00d9 2009          	jra	L524
1400  00db               L533:
1401                     ; 456 			case 0b11:
1401                     ; 457 				Set_LED1 (pwm1);
1403  00db 1e07          	ldw	x,(OFST-5,sp)
1404  00dd cd0000        	call	_TIM1_SetCompare3
1406                     ; 458 				en_blink_led1 = 1;
1408  00e0 35010002      	mov	_en_blink_led1,#1
1409                     ; 459 				break;
1411  00e4               L524:
1412                     ; 462 		switch (ledout2) {
1414  00e4 7b03          	ld	a,(OFST-9,sp)
1416                     ; 478 				break;
1417  00e6 270b          	jreq	L733
1418  00e8 4a            	dec	a
1419  00e9 270b          	jreq	L143
1420  00eb 4a            	dec	a
1421  00ec 270d          	jreq	L343
1422  00ee 4a            	dec	a
1423  00ef 2715          	jreq	L543
1424  00f1 201c          	jra	L134
1425  00f3               L733:
1426                     ; 463 			case 0b00:
1426                     ; 464 				Set_LED2 (0);
1428  00f3 5f            	clrw	x
1430                     ; 465 				en_blink_led2 = 0;
1431                     ; 466 				break;
1433  00f4 2007          	jp	LC004
1434  00f6               L143:
1435                     ; 467 			case 0b01:
1435                     ; 468 				Set_LED2 (10200);
1437  00f6 ae27d8        	ldw	x,#10200
1439                     ; 469 				en_blink_led2 = 0;
1440                     ; 470 				break;
1442  00f9 2002          	jp	LC004
1443  00fb               L343:
1444                     ; 471 			case 0b10:
1444                     ; 472 				Set_LED2 (pwm2);
1446  00fb 1e09          	ldw	x,(OFST-3,sp)
1448                     ; 473 				en_blink_led2 = 0;
1450  00fd               LC004:
1451  00fd cd0000        	call	_TIM1_SetCompare1
1454  0100 725f0001      	clr	_en_blink_led2
1455                     ; 474 				break;
1457  0104 2009          	jra	L134
1458  0106               L543:
1459                     ; 475 			case 0b11:
1459                     ; 476 				Set_LED2 (pwm2);
1461  0106 1e09          	ldw	x,(OFST-3,sp)
1462  0108 cd0000        	call	_TIM1_SetCompare1
1464                     ; 477 				en_blink_led2 = 1;
1466  010b 35010001      	mov	_en_blink_led2,#1
1467                     ; 478 				break;
1469  010f               L134:
1470                     ; 481 		switch (ledout0) {
1472  010f 7b04          	ld	a,(OFST-8,sp)
1474                     ; 497 				break;
1475  0111 270b          	jreq	L743
1476  0113 4a            	dec	a
1477  0114 2712          	jreq	L153
1478  0116 4a            	dec	a
1479  0117 271b          	jreq	L353
1480  0119 4a            	dec	a
1481  011a 2723          	jreq	L553
1482  011c 203c          	jra	L734
1483  011e               L743:
1484                     ; 482 			case 0b00:
1484                     ; 483 				Set_LED3 (0);
1486  011e 5f            	clrw	x
1487  011f cd0000        	call	_TIM1_SetCompare2
1489                     ; 484 				en_blink_led3 = 0;
1491  0122 725f0000      	clr	_en_blink_led3
1492                     ; 485 				break;
1494  0126 2032          	jra	L734
1495  0128               L153:
1496                     ; 486 			case 0b01:
1496                     ; 487 				Set_LED3 (10200);
1498  0128 ae27d8        	ldw	x,#10200
1499  012b cd0000        	call	_TIM1_SetCompare2
1501                     ; 488 				en_blink_led3 = 0;
1503  012e 725f0000      	clr	_en_blink_led3
1504                     ; 489 				break;
1506  0132 2026          	jra	L734
1507  0134               L353:
1508                     ; 490 			case 0b10:
1508                     ; 491 				Set_LED3 (pwm3);
1510  0134 1e0b          	ldw	x,(OFST-1,sp)
1511  0136 cd0000        	call	_TIM1_SetCompare2
1513                     ; 492 				en_blink_led3 = 0;
1515  0139 725f0000      	clr	_en_blink_led3
1516                     ; 493 				break;
1518  013d 201b          	jra	L734
1519  013f               L553:
1520                     ; 494 			case 0b11:
1520                     ; 495 				Set_LED3 (pwm3);
1522  013f 1e0b          	ldw	x,(OFST-1,sp)
1523  0141 cd0000        	call	_TIM1_SetCompare2
1525                     ; 496 				en_blink_led3 = 1;
1527  0144 35010000      	mov	_en_blink_led3,#1
1528                     ; 497 				break;
1530  0148 2010          	jra	L734
1532  014a               L114:
1533                     ; 501 		Set_LED0 (0);
1535  014a 5f            	clrw	x
1536  014b cd0000        	call	_TIM3_SetCompare2
1538                     ; 502 		Set_LED1 (0);
1540  014e 5f            	clrw	x
1541  014f cd0000        	call	_TIM1_SetCompare3
1543                     ; 503 		Set_LED2 (0);
1545  0152 5f            	clrw	x
1546  0153 cd0000        	call	_TIM1_SetCompare1
1548                     ; 504 		Set_LED3 (0);
1550  0156 5f            	clrw	x
1551  0157 cd0000        	call	_TIM1_SetCompare2
1553  015a               L734:
1554                     ; 507 }
1557  015a 5b0c          	addw	sp,#12
1558  015c 81            	ret	
1559  015d               LC005:
1560  015d 02            	rlwa	x,a
1561  015e a628          	ld	a,#40
1562  0160 cc0000        	jp	c_bmulx
1563  0163               LC006:
1564  0163 97            	ld	xl,a
1565  0164 a628          	ld	a,#40
1566  0166 42            	mul	x,a
1567  0167 81            	ret	
1662                     	xdef	_main
1663                     	switch	.bss
1664  0000               _en_blink_led3:
1665  0000 00            	ds.b	1
1666                     	xdef	_en_blink_led3
1667  0001               _en_blink_led2:
1668  0001 00            	ds.b	1
1669                     	xdef	_en_blink_led2
1670  0002               _en_blink_led1:
1671  0002 00            	ds.b	1
1672                     	xdef	_en_blink_led1
1673  0003               _en_blink_led0:
1674  0003 00            	ds.b	1
1675                     	xdef	_en_blink_led0
1676                     	xref	_a
1677  0004               _bright:
1678  0004 0000          	ds.b	2
1679                     	xdef	_bright
1680                     	xdef	_CommunicationEnd
1681  0006               _Rx_size:
1682  0006 00            	ds.b	1
1683                     	xdef	_Rx_size
1684  0007               _Slave_Buffer_Rx:
1685  0007 000000000000  	ds.b	255
1686                     	xdef	_Slave_Buffer_Rx
1687  0106               _Config_reg:
1688  0106 000000000000  	ds.b	13
1689                     	xdef	_Config_reg
1690  0113               _slave_address:
1691  0113 00            	ds.b	1
1692                     	xdef	_slave_address
1693                     	xdef	_putchar
1694                     	xref	_printf
1695                     	xdef	_getchar
1696                     	xref	_USART_GetFlagStatus
1697                     	xref	_USART_ITConfig
1698                     	xref	_USART_ReceiveData8
1699                     	xref	_USART_SendData8
1700                     	xref	_USART_Cmd
1701                     	xref	_USART_Init
1702                     	xref	_USART_DeInit
1703                     	xref	_TIM3_OC2PreloadConfig
1704                     	xref	_TIM3_SetCompare2
1705                     	xref	_TIM3_CtrlPWMOutputs
1706                     	xref	_TIM3_OC2Init
1707                     	xref	_TIM3_Cmd
1708                     	xref	_TIM3_ARRPreloadConfig
1709                     	xref	_TIM3_TimeBaseInit
1710                     	xref	_TIM1_OC3PreloadConfig
1711                     	xref	_TIM1_OC2PreloadConfig
1712                     	xref	_TIM1_OC1PreloadConfig
1713                     	xref	_TIM1_SetCompare3
1714                     	xref	_TIM1_SetCompare2
1715                     	xref	_TIM1_SetCompare1
1716                     	xref	_TIM1_CtrlPWMOutputs
1717                     	xref	_TIM1_OC3Init
1718                     	xref	_TIM1_OC2Init
1719                     	xref	_TIM1_OC1Init
1720                     	xref	_TIM1_Cmd
1721                     	xref	_TIM1_ARRPreloadConfig
1722                     	xref	_TIM1_TimeBaseInit
1723                     	xref	_I2C_ITConfig
1724                     	xref	_I2C_Init
1725                     	xref	_I2C_DeInit
1726                     	xref	_GPIO_ReadInputDataBit
1727                     	xref	_GPIO_Init
1728                     	xref	_CLK_PeripheralClockConfig
1729                     	xref	_CLK_SYSCLKDivConfig
1730                     .const:	section	.text
1731  0000               L552:
1732  0000 726567202564  	dc.b	"reg %d = %d",13,0
1733  000d               L732:
1734  000d 62756666203d  	dc.b	"buff = %x",13,0
1735  0018               L522:
1736  0018 44203d202564  	dc.b	"D = %d",13,0
1737  0020               L322:
1738  0020 52785f73697a  	dc.b	"Rx_size = %d",13,0
1739  002e               L55:
1740  002e 0a0d496e6572  	dc.b	10,13,73,110,101,114
1741  0034 74476173204d  	dc.b	"tGas Medical",10
1742  0041 0d00          	dc.b	13,0
1743  0043               L35:
1744  0043 0a0d50434139  	dc.b	10,13,80,67,65,57
1745  0049 363332205620  	dc.b	"632 V 1.0",10
1746  0053 0d00          	dc.b	13,0
1747                     	xref.b	c_x
1767                     	xref	c_bmulx
1768                     	xref	c_lzmp
1769                     	xref	c_lgsbc
1770                     	end
