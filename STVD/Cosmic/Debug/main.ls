   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  22                     	switch	.data
  23  0000               _CommunicationEnd:
  24  0000 00            	dc.b	0
  75                     ; 111 void main(void)
  75                     ; 112 {
  77                     .text:	section	.text,new
  78  0000               _main:
  80  0000 89            	pushw	x
  81       00000002      OFST:	set	2
  84                     ; 113   uint8_t i = 0;
  86                     ; 116   CLK_Config(); 
  88  0001 cd0000        	call	L3_CLK_Config
  90                     ; 119   GPIO_Config(); 
  92  0004 cd0000        	call	L5_GPIO_Config
  94                     ; 122   TIM1_Config();
  96  0007 cd0000        	call	L7_TIM1_Config
  98                     ; 125   TIM3_Config();
 100  000a cd0000        	call	L11_TIM3_Config
 102                     ; 128 	slave_address = 0b1100000 & (GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_4)<<1) & GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_5);
 104  000d 4b20          	push	#32
 105  000f ae5000        	ldw	x,#20480
 106  0012 cd0000        	call	_GPIO_ReadInputDataBit
 108  0015 5b01          	addw	sp,#1
 109  0017 6b01          	ld	(OFST-1,sp),a
 111  0019 4b10          	push	#16
 112  001b ae5000        	ldw	x,#20480
 113  001e cd0000        	call	_GPIO_ReadInputDataBit
 115  0021 5b01          	addw	sp,#1
 116  0023 48            	sll	a
 117  0024 a460          	and	a,#96
 118  0026 1401          	and	a,(OFST-1,sp)
 119  0028 48            	sll	a
 120  0029 c70115        	ld	_slave_address,a
 121                     ; 129 	slave_address = slave_address << 1;
 123                     ; 131   I2C_DeInit(I2C1);
 125  002c ae5210        	ldw	x,#21008
 126  002f cd0000        	call	_I2C_DeInit
 128                     ; 134   I2C_Init(I2C1, 100000, slave_address,
 128                     ; 135            I2C_Mode_I2C, I2C_DutyCycle_2,
 128                     ; 136            I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 130  0032 4b00          	push	#0
 131  0034 4b04          	push	#4
 132  0036 4b00          	push	#0
 133  0038 4b00          	push	#0
 134  003a c60115        	ld	a,_slave_address
 135  003d 5f            	clrw	x
 136  003e 97            	ld	xl,a
 137  003f 89            	pushw	x
 138  0040 ae86a0        	ldw	x,#34464
 139  0043 89            	pushw	x
 140  0044 ae0001        	ldw	x,#1
 141  0047 89            	pushw	x
 142  0048 ae5210        	ldw	x,#21008
 143  004b cd0000        	call	_I2C_Init
 145  004e 5b0a          	addw	sp,#10
 146                     ; 140   I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
 148  0050 4b01          	push	#1
 149  0052 ae0007        	ldw	x,#7
 150  0055 89            	pushw	x
 151  0056 ae5210        	ldw	x,#21008
 152  0059 cd0000        	call	_I2C_ITConfig
 154  005c 5b03          	addw	sp,#3
 155                     ; 143   enableInterrupts();
 158  005e 9a            	rim	
 160  005f               L14:
 161                     ; 154 			if(CommunicationEnd = 0x01) //upload data from i2c buffer and update pwm 
 163  005f 35010000      	mov	_CommunicationEnd,#1
 164  0063 725d0000      	tnz	_CommunicationEnd
 165  0067 27f6          	jreq	L14
 166                     ; 156 				I2C_Data_To_Registers();
 168  0069 cd0000        	call	L31_I2C_Data_To_Registers
 170                     ; 158 				Update_Control ();
 172  006c cd0000        	call	L51_Update_Control
 174  006f 20ee          	jra	L14
 199                     ; 168 static void CLK_Config(void)
 199                     ; 169 {
 200                     .text:	section	.text,new
 201  0000               L3_CLK_Config:
 205                     ; 171 	CLK_SYSCLKDivConfig (CLK_SYSCLKDiv_1); 
 207  0000 4f            	clr	a
 208  0001 cd0000        	call	_CLK_SYSCLKDivConfig
 210                     ; 174   CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 212  0004 ae0301        	ldw	x,#769
 213  0007 cd0000        	call	_CLK_PeripheralClockConfig
 215                     ; 177   CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 217  000a ae1101        	ldw	x,#4353
 218  000d cd0000        	call	_CLK_PeripheralClockConfig
 220                     ; 180   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 222  0010 ae0101        	ldw	x,#257
 224                     ; 181 }
 227  0013 cc0000        	jp	_CLK_PeripheralClockConfig
 251                     ; 188 static void GPIO_Config(void)
 251                     ; 189 {
 252                     .text:	section	.text,new
 253  0000               L5_GPIO_Config:
 257                     ; 191   GPIO_Init(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 259  0000 4be0          	push	#224
 260  0002 4b17          	push	#23
 261  0004 ae500f        	ldw	x,#20495
 262  0007 cd0000        	call	_GPIO_Init
 264  000a 85            	popw	x
 265                     ; 194 	GPIO_Init(GPIOA, GPIO_Pin_4 | GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
 267  000b 4b40          	push	#64
 268  000d 4b30          	push	#48
 269  000f ae5000        	ldw	x,#20480
 270  0012 cd0000        	call	_GPIO_Init
 272  0015 85            	popw	x
 273                     ; 195 }
 276  0016 81            	ret	
 310                     ; 202 static void TIM1_Config(void)
 310                     ; 203 {
 311                     .text:	section	.text,new
 312  0000               L7_TIM1_Config:
 316                     ; 209   TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);
 318  0000 4b00          	push	#0
 319  0002 ae27d8        	ldw	x,#10200
 320  0005 89            	pushw	x
 321  0006 4b00          	push	#0
 322  0008 5f            	clrw	x
 323  0009 cd0000        	call	_TIM1_TimeBaseInit
 325  000c 5b04          	addw	sp,#4
 326                     ; 212   TIM1_OC1Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 326                     ; 213                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 326                     ; 214                TIM1_OCNIdleState_Set);
 328  000e 4b2a          	push	#42
 329  0010 4b55          	push	#85
 330  0012 4b88          	push	#136
 331  0014 4b00          	push	#0
 332  0016 5f            	clrw	x
 333  0017 89            	pushw	x
 334  0018 4b00          	push	#0
 335  001a ae6011        	ldw	x,#24593
 336  001d cd0000        	call	_TIM1_OC1Init
 338  0020 5b07          	addw	sp,#7
 339                     ; 215   TIM1_OC1PreloadConfig(DISABLE);
 341  0022 4f            	clr	a
 342  0023 cd0000        	call	_TIM1_OC1PreloadConfig
 344                     ; 218   TIM1_OC2Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 344                     ; 219                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 344                     ; 220                TIM1_OCNIdleState_Set);
 346  0026 4b2a          	push	#42
 347  0028 4b55          	push	#85
 348  002a 4b88          	push	#136
 349  002c 4b00          	push	#0
 350  002e 5f            	clrw	x
 351  002f 89            	pushw	x
 352  0030 4b00          	push	#0
 353  0032 ae6011        	ldw	x,#24593
 354  0035 cd0000        	call	_TIM1_OC2Init
 356  0038 5b07          	addw	sp,#7
 357                     ; 221   TIM1_OC2PreloadConfig(ENABLE);
 359  003a a601          	ld	a,#1
 360  003c cd0000        	call	_TIM1_OC2PreloadConfig
 362                     ; 224   TIM1_OC3Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 362                     ; 225                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 362                     ; 226                TIM1_OCNIdleState_Set);
 364  003f 4b2a          	push	#42
 365  0041 4b55          	push	#85
 366  0043 4b88          	push	#136
 367  0045 4b00          	push	#0
 368  0047 5f            	clrw	x
 369  0048 89            	pushw	x
 370  0049 4b00          	push	#0
 371  004b ae6011        	ldw	x,#24593
 372  004e cd0000        	call	_TIM1_OC3Init
 374  0051 5b07          	addw	sp,#7
 375                     ; 227   TIM1_OC3PreloadConfig(ENABLE);
 377  0053 a601          	ld	a,#1
 378  0055 cd0000        	call	_TIM1_OC3PreloadConfig
 380                     ; 229   TIM1_ARRPreloadConfig(ENABLE);
 382  0058 a601          	ld	a,#1
 383  005a cd0000        	call	_TIM1_ARRPreloadConfig
 385                     ; 232   enableInterrupts();
 388  005d 9a            	rim	
 390                     ; 235   TIM1_CtrlPWMOutputs(ENABLE);
 393  005e a601          	ld	a,#1
 394  0060 cd0000        	call	_TIM1_CtrlPWMOutputs
 396                     ; 237   TIM1_Cmd(ENABLE);
 398  0063 a601          	ld	a,#1
 400                     ; 238 }
 403  0065 cc0000        	jp	_TIM1_Cmd
 433                     ; 240 static void TIM3_Config(void)
 433                     ; 241 {
 434                     .text:	section	.text,new
 435  0000               L11_TIM3_Config:
 439                     ; 247   TIM3_TimeBaseInit(TIM1_PRESCALER, TIM3_CounterMode_Up, TIM1_PERIOD);
 441  0000 ae27d8        	ldw	x,#10200
 442  0003 89            	pushw	x
 443  0004 5f            	clrw	x
 444  0005 cd0000        	call	_TIM3_TimeBaseInit
 446  0008 85            	popw	x
 447                     ; 251   TIM3_OC2Init(TIM3_OCMode_PWM1, TIM3_OutputState_Enable, 0, TIM3_OCPolarity_High, TIM3_OCIdleState_Set);
 449  0009 4b01          	push	#1
 450  000b 4b00          	push	#0
 451  000d 5f            	clrw	x
 452  000e 89            	pushw	x
 453  000f ae6001        	ldw	x,#24577
 454  0012 cd0000        	call	_TIM3_OC2Init
 456  0015 5b04          	addw	sp,#4
 457                     ; 252   TIM3_OC2PreloadConfig(DISABLE);
 459  0017 4f            	clr	a
 460  0018 cd0000        	call	_TIM3_OC2PreloadConfig
 462                     ; 254   TIM3_ARRPreloadConfig(ENABLE);
 464  001b a601          	ld	a,#1
 465  001d cd0000        	call	_TIM3_ARRPreloadConfig
 467                     ; 257   enableInterrupts();
 470  0020 9a            	rim	
 472                     ; 260   TIM3_CtrlPWMOutputs(ENABLE);
 475  0021 a601          	ld	a,#1
 476  0023 cd0000        	call	_TIM3_CtrlPWMOutputs
 478                     ; 262   TIM3_Cmd(ENABLE);
 480  0026 a601          	ld	a,#1
 482                     ; 263 }
 485  0028 cc0000        	jp	_TIM3_Cmd
 535                     ; 265 static void I2C_Data_To_Registers (void){
 536                     .text:	section	.text,new
 537  0000               L31_I2C_Data_To_Registers:
 539  0000 89            	pushw	x
 540       00000002      OFST:	set	2
 543                     ; 269 	A = Slave_Buffer_Rx[0] & 0b11100000; //разбор битов управления и регистров по своим местам
 545  0001 c60009        	ld	a,_Slave_Buffer_Rx
 546  0004 a4e0          	and	a,#224
 547  0006 6b01          	ld	(OFST-1,sp),a
 549                     ; 270 	D = Slave_Buffer_Rx[0] & REGISTER_MASK;
 551  0008 c60009        	ld	a,_Slave_Buffer_Rx
 552  000b a40f          	and	a,#15
 553  000d 6b02          	ld	(OFST+0,sp),a
 555                     ; 272 		switch (A){
 557  000f 7b01          	ld	a,(OFST-1,sp)
 559                     ; 308 				break;
 560  0011 2713          	jreq	L701
 561  0013 a080          	sub	a,#128
 562  0015 271c          	jreq	L111
 563  0017 a020          	sub	a,#32
 564  0019 273b          	jreq	L311
 565  001b a020          	sub	a,#32
 566  001d 275b          	jreq	L511
 567  001f a020          	sub	a,#32
 568  0021 277b          	jreq	L711
 569  0023 cc00c0        	jra	L341
 570  0026               L701:
 571                     ; 274 			case AUTO_INCREMENT_OFF: 
 571                     ; 275 				Config_reg[D] = Slave_Buffer_Rx[1];
 573  0026 7b02          	ld	a,(OFST+0,sp)
 574  0028 5f            	clrw	x
 575  0029 97            	ld	xl,a
 576  002a c6000a        	ld	a,_Slave_Buffer_Rx+1
 577  002d d70108        	ld	(_Config_reg,x),a
 578                     ; 276 				break;
 580  0030 cc00c0        	jra	L341
 581  0033               L111:
 582                     ; 278 			case AUTO_INCREMENT_ALL:
 582                     ; 279 				for (i = 1; i <= Rx_size; i++){
 584  0033 4c            	inc	a
 585  0034 6b01          	ld	(OFST-1,sp),a
 588  0036 2017          	jra	L151
 589  0038               L541:
 590                     ; 280 					Config_reg[D] = Slave_Buffer_Rx[i];
 592  0038 7b02          	ld	a,(OFST+0,sp)
 593  003a 5f            	clrw	x
 594  003b 97            	ld	xl,a
 595  003c 7b01          	ld	a,(OFST-1,sp)
 596  003e cd00c2        	call	LC001
 597                     ; 281 					D++;
 599  0041 0c02          	inc	(OFST+0,sp)
 601                     ; 282 						if (D > ALLCALLADR) D = MODE1;
 603  0043 7b02          	ld	a,(OFST+0,sp)
 604  0045 a10d          	cp	a,#13
 605  0047 2502          	jrult	L551
 608  0049 0f02          	clr	(OFST+0,sp)
 610  004b               L551:
 611                     ; 279 				for (i = 1; i <= Rx_size; i++){
 613  004b 0c01          	inc	(OFST-1,sp)
 615  004d 7b01          	ld	a,(OFST-1,sp)
 616  004f               L151:
 619  004f c10008        	cp	a,_Rx_size
 620  0052 23e4          	jrule	L541
 621                     ; 284 				break;
 623  0054 206a          	jra	L341
 624  0056               L311:
 625                     ; 286 			case AUTO_INCREMENT_BRIGHTNESS:
 625                     ; 287 				for (i = 1; i <= Rx_size; i++){
 627  0056 4c            	inc	a
 628  0057 6b01          	ld	(OFST-1,sp),a
 631  0059 2018          	jra	L361
 632  005b               L751:
 633                     ; 288 					Config_reg[D] = Slave_Buffer_Rx[i];
 635  005b 7b02          	ld	a,(OFST+0,sp)
 636  005d 5f            	clrw	x
 637  005e 97            	ld	xl,a
 638  005f 7b01          	ld	a,(OFST-1,sp)
 639  0061 ad5f          	call	LC001
 640                     ; 289 					D++;
 642  0063 0c02          	inc	(OFST+0,sp)
 644                     ; 290 						if (D > PWM3) D = PWM0;
 646  0065 7b02          	ld	a,(OFST+0,sp)
 647  0067 a106          	cp	a,#6
 648  0069 2504          	jrult	L761
 651  006b a602          	ld	a,#2
 652  006d 6b02          	ld	(OFST+0,sp),a
 654  006f               L761:
 655                     ; 287 				for (i = 1; i <= Rx_size; i++){
 657  006f 0c01          	inc	(OFST-1,sp)
 659  0071 7b01          	ld	a,(OFST-1,sp)
 660  0073               L361:
 663  0073 c10008        	cp	a,_Rx_size
 664  0076 23e3          	jrule	L751
 665                     ; 292 				break;
 667  0078 2046          	jra	L341
 668  007a               L511:
 669                     ; 294 			case AUTO_INCREMENT_GCONTROL:
 669                     ; 295 				for (i = 1; i <= Rx_size; i++){
 671  007a 4c            	inc	a
 672  007b 6b01          	ld	(OFST-1,sp),a
 675  007d 2018          	jra	L571
 676  007f               L171:
 677                     ; 296 					Config_reg[D] = Slave_Buffer_Rx[i];
 679  007f 7b02          	ld	a,(OFST+0,sp)
 680  0081 5f            	clrw	x
 681  0082 97            	ld	xl,a
 682  0083 7b01          	ld	a,(OFST-1,sp)
 683  0085 ad3b          	call	LC001
 684                     ; 297 					D++;
 686  0087 0c02          	inc	(OFST+0,sp)
 688                     ; 298 						if (D > GRPFREQ) D = GRPPWM;
 690  0089 7b02          	ld	a,(OFST+0,sp)
 691  008b a108          	cp	a,#8
 692  008d 2504          	jrult	L102
 695  008f a606          	ld	a,#6
 696  0091 6b02          	ld	(OFST+0,sp),a
 698  0093               L102:
 699                     ; 295 				for (i = 1; i <= Rx_size; i++){
 701  0093 0c01          	inc	(OFST-1,sp)
 703  0095 7b01          	ld	a,(OFST-1,sp)
 704  0097               L571:
 707  0097 c10008        	cp	a,_Rx_size
 708  009a 23e3          	jrule	L171
 709                     ; 300 				break;
 711  009c 2022          	jra	L341
 712  009e               L711:
 713                     ; 302 			case AUTO_INCREMENT_I_GCONTROL:
 713                     ; 303 				for (i = 1; i <= Rx_size; i++){
 715  009e 4c            	inc	a
 716  009f 6b01          	ld	(OFST-1,sp),a
 719  00a1 2018          	jra	L702
 720  00a3               L302:
 721                     ; 304 					Config_reg[D] = Slave_Buffer_Rx[i];
 723  00a3 7b02          	ld	a,(OFST+0,sp)
 724  00a5 5f            	clrw	x
 725  00a6 97            	ld	xl,a
 726  00a7 7b01          	ld	a,(OFST-1,sp)
 727  00a9 ad17          	call	LC001
 728                     ; 305 					D++;
 730  00ab 0c02          	inc	(OFST+0,sp)
 732                     ; 306 						if (D > GRPFREQ) D = PWM0;
 734  00ad 7b02          	ld	a,(OFST+0,sp)
 735  00af a108          	cp	a,#8
 736  00b1 2504          	jrult	L312
 739  00b3 a602          	ld	a,#2
 740  00b5 6b02          	ld	(OFST+0,sp),a
 742  00b7               L312:
 743                     ; 303 				for (i = 1; i <= Rx_size; i++){
 745  00b7 0c01          	inc	(OFST-1,sp)
 747  00b9 7b01          	ld	a,(OFST-1,sp)
 748  00bb               L702:
 751  00bb c10008        	cp	a,_Rx_size
 752  00be 23e3          	jrule	L302
 753                     ; 308 				break;
 755  00c0               L341:
 756                     ; 311 }
 759  00c0 85            	popw	x
 760  00c1 81            	ret	
 761  00c2               LC001:
 762  00c2 905f          	clrw	y
 763  00c4 9097          	ld	yl,a
 764  00c6 90d60009      	ld	a,(_Slave_Buffer_Rx,y)
 765  00ca d70108        	ld	(_Config_reg,x),a
 766  00cd 81            	ret	
 856                     ; 313 static void Update_Control (void){
 857                     .text:	section	.text,new
 858  0000               L51_Update_Control:
 860  0000 520c          	subw	sp,#12
 861       0000000c      OFST:	set	12
 864                     ; 314 	uint8_t ledout0 = Config_reg[LEDOUT] & 0b11;
 866  0002 c60110        	ld	a,_Config_reg+8
 867  0005 a403          	and	a,#3
 868  0007 6b04          	ld	(OFST-8,sp),a
 870                     ; 315 	uint8_t ledout1 = (Config_reg[LEDOUT] >> 2) & 0b11;
 872  0009 c60110        	ld	a,_Config_reg+8
 873  000c a40c          	and	a,#12
 874  000e 44            	srl	a
 875  000f 44            	srl	a
 876  0010 6b02          	ld	(OFST-10,sp),a
 878                     ; 316 	uint8_t ledout2 = (Config_reg[LEDOUT] >> 4) & 0b11;
 880  0012 c60110        	ld	a,_Config_reg+8
 881  0015 4e            	swap	a
 882  0016 a403          	and	a,#3
 883  0018 6b03          	ld	(OFST-9,sp),a
 885                     ; 317 	uint8_t ledout3 = (Config_reg[LEDOUT] >> 6) & 0b11;
 887                     ; 325 	if ((Config_reg [MODE1] >> 4) & 1){ //check for SLEEP mode bit & OFF when SLEEP = 0
 889  001a c60108        	ld	a,_Config_reg
 890  001d 4e            	swap	a
 891  001e a401          	and	a,#1
 892  0020 5f            	clrw	x
 893  0021 97            	ld	xl,a
 894  0022 5d            	tnzw	x
 895  0023 2603cc0147    	jreq	L703
 896                     ; 328 		if ((Config_reg [MODE2] >> 4)&1) {
 898  0028 c60109        	ld	a,_Config_reg+1
 899  002b 4e            	swap	a
 900  002c a401          	and	a,#1
 901  002e 5f            	clrw	x
 902  002f 97            	ld	xl,a
 903  0030 5d            	tnzw	x
 904  0031 2738          	jreq	L113
 905                     ; 329 			pwm0 = (255 - Config_reg[PWM0]) *40;
 907  0033 4f            	clr	a
 908  0034 97            	ld	xl,a
 909  0035 4a            	dec	a
 910  0036 c0010a        	sub	a,_Config_reg+2
 911  0039 2401          	jrnc	L421
 912  003b 5a            	decw	x
 913  003c               L421:
 914  003c cd015a        	call	LC005
 916  003f 1f05          	ldw	(OFST-7,sp),x
 918                     ; 330 			pwm1 = (255 - Config_reg[PWM1]) *40;
 920  0041 4f            	clr	a
 921  0042 97            	ld	xl,a
 922  0043 4a            	dec	a
 923  0044 c0010b        	sub	a,_Config_reg+3
 924  0047 2401          	jrnc	L621
 925  0049 5a            	decw	x
 926  004a               L621:
 927  004a cd015a        	call	LC005
 929  004d 1f07          	ldw	(OFST-5,sp),x
 931                     ; 331 			pwm2 = (255 - Config_reg[PWM2]) *40;
 933  004f 4f            	clr	a
 934  0050 97            	ld	xl,a
 935  0051 4a            	dec	a
 936  0052 c0010c        	sub	a,_Config_reg+4
 937  0055 2401          	jrnc	L031
 938  0057 5a            	decw	x
 939  0058               L031:
 940  0058 cd015a        	call	LC005
 942  005b 1f09          	ldw	(OFST-3,sp),x
 944                     ; 332 			pwm3 = (255 - Config_reg[PWM3]) *40;
 946  005d 4f            	clr	a
 947  005e 97            	ld	xl,a
 948  005f 4a            	dec	a
 949  0060 c0010d        	sub	a,_Config_reg+5
 950  0063 2401          	jrnc	L231
 951  0065 5a            	decw	x
 952  0066               L231:
 953  0066 cd015a        	call	LC005
 956  0069 201e          	jra	L313
 957  006b               L113:
 958                     ; 335 			pwm0 = Config_reg[PWM0] *40;
 960  006b c6010a        	ld	a,_Config_reg+2
 961  006e cd0160        	call	LC006
 962  0071 1f05          	ldw	(OFST-7,sp),x
 964                     ; 336 			pwm1 = Config_reg[PWM1] *40;
 966  0073 c6010b        	ld	a,_Config_reg+3
 967  0076 cd0160        	call	LC006
 968  0079 1f07          	ldw	(OFST-5,sp),x
 970                     ; 337 			pwm2 = Config_reg[PWM2] *40;
 972  007b c6010c        	ld	a,_Config_reg+4
 973  007e cd0160        	call	LC006
 974  0081 1f09          	ldw	(OFST-3,sp),x
 976                     ; 338 			pwm3 = Config_reg[PWM3] *40;
 978  0083 c6010d        	ld	a,_Config_reg+5
 979  0086 cd0160        	call	LC006
 980  0089               L313:
 981  0089 1f0b          	ldw	(OFST-1,sp),x
 983                     ; 343 		switch (ledout0) {
 985  008b 7b04          	ld	a,(OFST-8,sp)
 987                     ; 359 				break;
 988  008d 270b          	jreq	L512
 989  008f 4a            	dec	a
 990  0090 270b          	jreq	L712
 991  0092 4a            	dec	a
 992  0093 270d          	jreq	L122
 993  0095 4a            	dec	a
 994  0096 2715          	jreq	L322
 995  0098 201c          	jra	L713
 996  009a               L512:
 997                     ; 344 			case 0b00:
 997                     ; 345 				Set_LED0 (0);
 999  009a 5f            	clrw	x
1001                     ; 346 				en_blink_led0 = 0;
1002                     ; 347 				break;
1004  009b 2007          	jp	LC002
1005  009d               L712:
1006                     ; 348 			case 0b01:
1006                     ; 349 				Set_LED0 (10200);
1008  009d ae27d8        	ldw	x,#10200
1010                     ; 350 				en_blink_led0 = 0;
1011                     ; 351 				break;
1013  00a0 2002          	jp	LC002
1014  00a2               L122:
1015                     ; 352 			case 0b10:
1015                     ; 353 				Set_LED0 (pwm0);
1017  00a2 1e05          	ldw	x,(OFST-7,sp)
1019                     ; 354 				en_blink_led0 = 0;
1021  00a4               LC002:
1022  00a4 cd0000        	call	_TIM3_SetCompare2
1025  00a7 725f0003      	clr	_en_blink_led0
1026                     ; 355 				break;
1028  00ab 2009          	jra	L713
1029  00ad               L322:
1030                     ; 356 			case 0b11:
1030                     ; 357 				Set_LED0 (pwm0);
1032  00ad 1e05          	ldw	x,(OFST-7,sp)
1033  00af cd0000        	call	_TIM3_SetCompare2
1035                     ; 358 				en_blink_led0 = 1;
1037  00b2 35010003      	mov	_en_blink_led0,#1
1038                     ; 359 				break;
1040  00b6               L713:
1041                     ; 362 		switch (ledout1) {
1043  00b6 7b02          	ld	a,(OFST-10,sp)
1045                     ; 378 				break;
1046  00b8 270b          	jreq	L522
1047  00ba 4a            	dec	a
1048  00bb 270b          	jreq	L722
1049  00bd 4a            	dec	a
1050  00be 270d          	jreq	L132
1051  00c0 4a            	dec	a
1052  00c1 2715          	jreq	L332
1053  00c3 201c          	jra	L323
1054  00c5               L522:
1055                     ; 363 			case 0b00:
1055                     ; 364 				Set_LED1 (0);
1057  00c5 5f            	clrw	x
1059                     ; 365 				en_blink_led1 = 0;
1060                     ; 366 				break;
1062  00c6 2007          	jp	LC003
1063  00c8               L722:
1064                     ; 367 			case 0b01:
1064                     ; 368 				Set_LED1 (10200);
1066  00c8 ae27d8        	ldw	x,#10200
1068                     ; 369 				en_blink_led1 = 0;
1069                     ; 370 				break;
1071  00cb 2002          	jp	LC003
1072  00cd               L132:
1073                     ; 371 			case 0b10:
1073                     ; 372 				Set_LED1 (pwm1);
1075  00cd 1e07          	ldw	x,(OFST-5,sp)
1077                     ; 373 				en_blink_led1 = 0;
1079  00cf               LC003:
1080  00cf cd0000        	call	_TIM1_SetCompare3
1083  00d2 725f0002      	clr	_en_blink_led1
1084                     ; 374 				break;
1086  00d6 2009          	jra	L323
1087  00d8               L332:
1088                     ; 375 			case 0b11:
1088                     ; 376 				Set_LED1 (pwm1);
1090  00d8 1e07          	ldw	x,(OFST-5,sp)
1091  00da cd0000        	call	_TIM1_SetCompare3
1093                     ; 377 				en_blink_led1 = 1;
1095  00dd 35010002      	mov	_en_blink_led1,#1
1096                     ; 378 				break;
1098  00e1               L323:
1099                     ; 381 		switch (ledout2) {
1101  00e1 7b03          	ld	a,(OFST-9,sp)
1103                     ; 397 				break;
1104  00e3 270b          	jreq	L532
1105  00e5 4a            	dec	a
1106  00e6 270b          	jreq	L732
1107  00e8 4a            	dec	a
1108  00e9 270d          	jreq	L142
1109  00eb 4a            	dec	a
1110  00ec 2715          	jreq	L342
1111  00ee 201c          	jra	L723
1112  00f0               L532:
1113                     ; 382 			case 0b00:
1113                     ; 383 				Set_LED2 (0);
1115  00f0 5f            	clrw	x
1117                     ; 384 				en_blink_led2 = 0;
1118                     ; 385 				break;
1120  00f1 2007          	jp	LC004
1121  00f3               L732:
1122                     ; 386 			case 0b01:
1122                     ; 387 				Set_LED2 (10200);
1124  00f3 ae27d8        	ldw	x,#10200
1126                     ; 388 				en_blink_led2 = 0;
1127                     ; 389 				break;
1129  00f6 2002          	jp	LC004
1130  00f8               L142:
1131                     ; 390 			case 0b10:
1131                     ; 391 				Set_LED2 (pwm2);
1133  00f8 1e09          	ldw	x,(OFST-3,sp)
1135                     ; 392 				en_blink_led2 = 0;
1137  00fa               LC004:
1138  00fa cd0000        	call	_TIM1_SetCompare1
1141  00fd 725f0001      	clr	_en_blink_led2
1142                     ; 393 				break;
1144  0101 2009          	jra	L723
1145  0103               L342:
1146                     ; 394 			case 0b11:
1146                     ; 395 				Set_LED2 (pwm2);
1148  0103 1e09          	ldw	x,(OFST-3,sp)
1149  0105 cd0000        	call	_TIM1_SetCompare1
1151                     ; 396 				en_blink_led2 = 1;
1153  0108 35010001      	mov	_en_blink_led2,#1
1154                     ; 397 				break;
1156  010c               L723:
1157                     ; 400 		switch (ledout0) {
1159  010c 7b04          	ld	a,(OFST-8,sp)
1161                     ; 416 				break;
1162  010e 270b          	jreq	L542
1163  0110 4a            	dec	a
1164  0111 2712          	jreq	L742
1165  0113 4a            	dec	a
1166  0114 271b          	jreq	L152
1167  0116 4a            	dec	a
1168  0117 2723          	jreq	L352
1169  0119 203c          	jra	L533
1170  011b               L542:
1171                     ; 401 			case 0b00:
1171                     ; 402 				Set_LED3 (0);
1173  011b 5f            	clrw	x
1174  011c cd0000        	call	_TIM1_SetCompare2
1176                     ; 403 				en_blink_led3 = 0;
1178  011f 725f0000      	clr	_en_blink_led3
1179                     ; 404 				break;
1181  0123 2032          	jra	L533
1182  0125               L742:
1183                     ; 405 			case 0b01:
1183                     ; 406 				Set_LED3 (10200);
1185  0125 ae27d8        	ldw	x,#10200
1186  0128 cd0000        	call	_TIM1_SetCompare2
1188                     ; 407 				en_blink_led3 = 0;
1190  012b 725f0000      	clr	_en_blink_led3
1191                     ; 408 				break;
1193  012f 2026          	jra	L533
1194  0131               L152:
1195                     ; 409 			case 0b10:
1195                     ; 410 				Set_LED3 (pwm3);
1197  0131 1e0b          	ldw	x,(OFST-1,sp)
1198  0133 cd0000        	call	_TIM1_SetCompare2
1200                     ; 411 				en_blink_led3 = 0;
1202  0136 725f0000      	clr	_en_blink_led3
1203                     ; 412 				break;
1205  013a 201b          	jra	L533
1206  013c               L352:
1207                     ; 413 			case 0b11:
1207                     ; 414 				Set_LED3 (pwm3);
1209  013c 1e0b          	ldw	x,(OFST-1,sp)
1210  013e cd0000        	call	_TIM1_SetCompare2
1212                     ; 415 				en_blink_led3 = 1;
1214  0141 35010000      	mov	_en_blink_led3,#1
1215                     ; 416 				break;
1217  0145 2010          	jra	L533
1219  0147               L703:
1220                     ; 420 		Set_LED0 (0);
1222  0147 5f            	clrw	x
1223  0148 cd0000        	call	_TIM3_SetCompare2
1225                     ; 421 		Set_LED1 (0);
1227  014b 5f            	clrw	x
1228  014c cd0000        	call	_TIM1_SetCompare3
1230                     ; 422 		Set_LED2 (0);
1232  014f 5f            	clrw	x
1233  0150 cd0000        	call	_TIM1_SetCompare1
1235                     ; 423 		Set_LED3 (0);
1237  0153 5f            	clrw	x
1238  0154 cd0000        	call	_TIM1_SetCompare2
1240  0157               L533:
1241                     ; 426 }
1244  0157 5b0c          	addw	sp,#12
1245  0159 81            	ret	
1246  015a               LC005:
1247  015a 02            	rlwa	x,a
1248  015b a628          	ld	a,#40
1249  015d cc0000        	jp	c_bmulx
1250  0160               LC006:
1251  0160 97            	ld	xl,a
1252  0161 a628          	ld	a,#40
1253  0163 42            	mul	x,a
1254  0164 81            	ret	
1356                     	xdef	_main
1357                     	switch	.bss
1358  0000               _en_blink_led3:
1359  0000 00            	ds.b	1
1360                     	xdef	_en_blink_led3
1361  0001               _en_blink_led2:
1362  0001 00            	ds.b	1
1363                     	xdef	_en_blink_led2
1364  0002               _en_blink_led1:
1365  0002 00            	ds.b	1
1366                     	xdef	_en_blink_led1
1367  0003               _en_blink_led0:
1368  0003 00            	ds.b	1
1369                     	xdef	_en_blink_led0
1370  0004               _a:
1371  0004 0000          	ds.b	2
1372                     	xdef	_a
1373  0006               _bright:
1374  0006 0000          	ds.b	2
1375                     	xdef	_bright
1376                     	xdef	_CommunicationEnd
1377  0008               _Rx_size:
1378  0008 00            	ds.b	1
1379                     	xdef	_Rx_size
1380  0009               _Slave_Buffer_Rx:
1381  0009 000000000000  	ds.b	255
1382                     	xdef	_Slave_Buffer_Rx
1383  0108               _Config_reg:
1384  0108 000000000000  	ds.b	13
1385                     	xdef	_Config_reg
1386  0115               _slave_address:
1387  0115 00            	ds.b	1
1388                     	xdef	_slave_address
1389                     	xref	_TIM3_OC2PreloadConfig
1390                     	xref	_TIM3_SetCompare2
1391                     	xref	_TIM3_CtrlPWMOutputs
1392                     	xref	_TIM3_OC2Init
1393                     	xref	_TIM3_Cmd
1394                     	xref	_TIM3_ARRPreloadConfig
1395                     	xref	_TIM3_TimeBaseInit
1396                     	xref	_TIM1_OC3PreloadConfig
1397                     	xref	_TIM1_OC2PreloadConfig
1398                     	xref	_TIM1_OC1PreloadConfig
1399                     	xref	_TIM1_SetCompare3
1400                     	xref	_TIM1_SetCompare2
1401                     	xref	_TIM1_SetCompare1
1402                     	xref	_TIM1_CtrlPWMOutputs
1403                     	xref	_TIM1_OC3Init
1404                     	xref	_TIM1_OC2Init
1405                     	xref	_TIM1_OC1Init
1406                     	xref	_TIM1_Cmd
1407                     	xref	_TIM1_ARRPreloadConfig
1408                     	xref	_TIM1_TimeBaseInit
1409                     	xref	_I2C_ITConfig
1410                     	xref	_I2C_Init
1411                     	xref	_I2C_DeInit
1412                     	xref	_GPIO_ReadInputDataBit
1413                     	xref	_GPIO_Init
1414                     	xref	_CLK_PeripheralClockConfig
1415                     	xref	_CLK_SYSCLKDivConfig
1416                     	xref.b	c_x
1436                     	xref	c_bmulx
1437                     	end
