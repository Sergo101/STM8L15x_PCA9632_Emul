   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     	switch	.data
  18  0000               _CommunicationEnd:
  19  0000 00            	dc.b	0
  20  0001               _baudrate:
  21  0001 00003840      	dc.l	14400
  22                     ; 124 void main(void)
  22                     ; 125 {
  23                     	scross	off
  24                     	switch	.text
  25  0000               _main:
  26  0000 88            	push	a
  27       00000001      OFST:	set	1
  29                     ; 126   uint8_t i = 0;
  30                     ; 129   CLK_Config(); 
  31  0001 cd016a        	call	L3_CLK_Config
  33                     ; 132   GPIO_Config(); 
  34  0004 cd0186        	call	L5_GPIO_Config
  36                     ; 135   TIM1_Config();
  37  0007 cd01ee        	call	L7_TIM1_Config
  39                     ; 138   TIM3_Config();
  40  000a cd0256        	call	L11_TIM3_Config
  42                     ; 141 	slave_address = 0;
  43  000d 725f0123      	clr	_slave_address
  44                     ; 142 	if (GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_4)) {
  45  0011 4b10          	push	#16
  46  0013 ae5000        	ldw	x,#20480
  47  0016 cd0000        	call	_GPIO_ReadInputDataBit
  49  0019 5b01          	addw	sp,#1
  50  001b 4d            	tnz	a
  51  001c 2704          	jreq	L71
  52                     ; 143 		slave_address = slave_address | 0b10;
  53  001e 72120123      	bset	_slave_address,#1
  54  0022               L71:
  55                     ; 145 	if (GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_5)) {
  56  0022 4b20          	push	#32
  57  0024 ae5000        	ldw	x,#20480
  58  0027 cd0000        	call	_GPIO_ReadInputDataBit
  60  002a 5b01          	addw	sp,#1
  61  002c 4d            	tnz	a
  62  002d 2704          	jreq	L12
  63                     ; 146 		slave_address = slave_address | 0b01;
  64  002f 72100123      	bset	_slave_address,#0
  65  0033               L12:
  66                     ; 148 	slave_address = (slave_address | 0b1100000) <<1;
  67  0033 c60123        	ld	a,_slave_address
  68  0036 aa60          	or	a,#96
  69  0038 48            	sll	a
  70  0039 c70123        	ld	_slave_address,a
  71                     ; 149 	slave_address = 0b1100010 << 1;
  72  003c 35c40123      	mov	_slave_address,#196
  73                     ; 151   I2C_DeInit(I2C1);
  74  0040 ae5210        	ldw	x,#21008
  75  0043 cd0000        	call	_I2C_DeInit
  77                     ; 154   I2C_Init(I2C1, 400000, slave_address,
  77                     ; 155            I2C_Mode_I2C, I2C_DutyCycle_2,
  77                     ; 156            I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  78  0046 4b00          	push	#0
  79  0048 4b04          	push	#4
  80  004a 4b00          	push	#0
  81  004c 4b00          	push	#0
  82  004e c60123        	ld	a,_slave_address
  83  0051 5f            	clrw	x
  84  0052 97            	ld	xl,a
  85  0053 89            	pushw	x
  86  0054 ae1a80        	ldw	x,#6784
  87  0057 89            	pushw	x
  88  0058 ae0006        	ldw	x,#6
  89  005b 89            	pushw	x
  90  005c ae5210        	ldw	x,#21008
  91  005f cd0000        	call	_I2C_Init
  93  0062 5b0a          	addw	sp,#10
  94                     ; 160   I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  95  0064 4b01          	push	#1
  96  0066 ae0007        	ldw	x,#7
  97  0069 89            	pushw	x
  98  006a ae5210        	ldw	x,#21008
  99  006d cd0000        	call	_I2C_ITConfig
 101  0070 5b03          	addw	sp,#3
 102                     ; 171 	USART_DeInit(USART1);
 103  0072 ae5230        	ldw	x,#21040
 104  0075 cd0000        	call	_USART_DeInit
 106                     ; 172 	a = 1000;
 106                     ; 173 			while (a) a--;
 107  0078 ae03e8        	ldw	x,#1000
 108  007b cf0002        	ldw	_a+2,x
 109  007e 5f            	clrw	x
 110  007f cf0000        	ldw	_a,x
 111  0082 ae0000        	ldw	x,#_a
 112  0085               L32:
 114  0085 a601          	ld	a,#1
 115  0087 cd0000        	call	c_lgsbc
 118  008a cd0000        	call	c_lzmp
 120  008d 26f6          	jrne	L32
 121                     ; 174   USART_Init(USART1, (uint32_t)115200, USART_WordLength_8b, USART_StopBits_1,
 121                     ; 175                    USART_Parity_No, USART_Mode_Rx | USART_Mode_Tx );
 122  008f 4b0c          	push	#12
 123  0091 4b00          	push	#0
 124  0093 4b00          	push	#0
 125  0095 4b00          	push	#0
 126  0097 aec200        	ldw	x,#49664
 127  009a 89            	pushw	x
 128  009b ae0001        	ldw	x,#1
 129  009e 89            	pushw	x
 130  009f ae5230        	ldw	x,#21040
 131  00a2 cd0000        	call	_USART_Init
 133  00a5 5b08          	addw	sp,#8
 134                     ; 179   USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
 135  00a7 4b01          	push	#1
 136  00a9 ae0255        	ldw	x,#597
 137  00ac 89            	pushw	x
 138  00ad ae5230        	ldw	x,#21040
 139  00b0 cd0000        	call	_USART_ITConfig
 141  00b3 5b03          	addw	sp,#3
 142                     ; 181 	USART_Cmd (USART1, ENABLE);
 143  00b5 4b01          	push	#1
 144  00b7 ae5230        	ldw	x,#21040
 145  00ba cd0000        	call	_USART_Cmd
 147  00bd 9a            	rim	
 148  00be ae1388        	ldw	x,#5000
 149  00c1 84            	pop	a
 150                     ; 184   enableInterrupts();
 153                     ; 187 	Set_LED1 (5000);
 154  00c2 cd0000        	call	_TIM1_SetCompare3
 156                     ; 188 	a = 100000;
 156                     ; 189 			while (a) a--;
 157  00c5 ae86a0        	ldw	x,#34464
 158  00c8 cf0002        	ldw	_a+2,x
 159  00cb ae0001        	ldw	x,#1
 160  00ce cf0000        	ldw	_a,x
 161  00d1 ae0000        	ldw	x,#_a
 162  00d4               L13:
 164  00d4 a601          	ld	a,#1
 165  00d6 cd0000        	call	c_lgsbc
 168  00d9 cd0000        	call	c_lzmp
 170  00dc 26f6          	jrne	L13
 171                     ; 190 	Set_LED1 (0);
 172  00de 5f            	clrw	x
 173  00df cd0000        	call	_TIM1_SetCompare3
 175                     ; 192 Config_reg[MODE1] = 0b10010001;
 176  00e2 35910116      	mov	_Config_reg,#145
 177                     ; 194 	printf("\n\rPCA9632 V 1.0\n\r");
 178  00e6 ae0058        	ldw	x,#L73
 179  00e9 cd0000        	call	_printf
 181                     ; 195   printf("\n\rInertGas Medical\n\r");
 182  00ec ae0043        	ldw	x,#L14
 183  00ef cd0000        	call	_printf
 185  00f2               L34:
 186                     ; 200 			if(CommunicationEnd == 0x01) //upload data from i2c buffer and update pwm 
 187  00f2 c60000        	ld	a,_CommunicationEnd
 188  00f5 4a            	dec	a
 189  00f6 2607          	jrne	L74
 190                     ; 204 				Update_Control ();
 191  00f8 cd03bb        	call	L51_Update_Control
 193                     ; 205 				CommunicationEnd = 0;
 194  00fb 725f0000      	clr	_CommunicationEnd
 195  00ff               L74:
 196                     ; 210 			if (i2c_buff [0]) 
 197  00ff 725d0006      	tnz	_i2c_buff
 198  0103 27ed          	jreq	L34
 199                     ; 212 				printf ("%X %X %X %X %X %X \n\r", i2c_buff [1],i2c_buff [2],(uint16_t)i2c_buff [3],(uint16_t)i2c_buff [4], 
 199                     ; 213 				(int16_t)i2c_buff [5],(int16_t)i2c_buff [6] );
 200  0105 c6000c        	ld	a,_i2c_buff+6
 201  0108 5f            	clrw	x
 202  0109 97            	ld	xl,a
 203  010a 89            	pushw	x
 204  010b c6000b        	ld	a,_i2c_buff+5
 205  010e 5f            	clrw	x
 206  010f 97            	ld	xl,a
 207  0110 89            	pushw	x
 208  0111 c6000a        	ld	a,_i2c_buff+4
 209  0114 5f            	clrw	x
 210  0115 97            	ld	xl,a
 211  0116 89            	pushw	x
 212  0117 c60009        	ld	a,_i2c_buff+3
 213  011a 5f            	clrw	x
 214  011b 97            	ld	xl,a
 215  011c 89            	pushw	x
 216  011d 3b0008        	push	_i2c_buff+2
 217  0120 3b0007        	push	_i2c_buff+1
 218  0123 ae002e        	ldw	x,#L35
 219  0126 cd0000        	call	_printf
 221  0129 5b0a          	addw	sp,#10
 222                     ; 214 				i2c_buff [0] = 0;
 223  012b 725f0006      	clr	_i2c_buff
 224  012f 20c1          	jra	L34
 226                     ; 226 PUTCHAR_PROTOTYPE
 226                     ; 227 {
 227  0131               _putchar:
 228  0131 88            	push	a
 229       00000000      OFST:	set	0
 231                     ; 229   USART_SendData8(USART1, c);
 232  0132 88            	push	a
 233  0133 ae5230        	ldw	x,#21040
 234  0136 cd0000        	call	_USART_SendData8
 236  0139 84            	pop	a
 238  013a               L75:
 239                     ; 231   while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
 240  013a ae0040        	ldw	x,#64
 241  013d 89            	pushw	x
 242  013e ae5230        	ldw	x,#21040
 243  0141 cd0000        	call	_USART_GetFlagStatus
 245  0144 4d            	tnz	a
 246  0145 85            	popw	x
 247  0146 27f2          	jreq	L75
 248                     ; 233   return (c);
 249  0148 7b01          	ld	a,(OFST+1,sp)
 251  014a 5b01          	addw	sp,#1
 252  014c 81            	ret	
 254                     ; 242 GETCHAR_PROTOTYPE
 254                     ; 243 {
 255  014d               _getchar:
 256  014d 89            	pushw	x
 257       00000002      OFST:	set	2
 259                     ; 244   int c = 0;
 261  014e               L56:
 262                     ; 246   while (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == RESET);
 263  014e ae0020        	ldw	x,#32
 264  0151 89            	pushw	x
 265  0152 ae5230        	ldw	x,#21040
 266  0155 cd0000        	call	_USART_GetFlagStatus
 268  0158 4d            	tnz	a
 269  0159 85            	popw	x
 270  015a 27f2          	jreq	L56
 271                     ; 247     c = USART_ReceiveData8(USART1);
 272  015c ae5230        	ldw	x,#21040
 273  015f cd0000        	call	_USART_ReceiveData8
 275  0162 5f            	clrw	x
 276  0163 97            	ld	xl,a
 277  0164 1f01          	ldw	(OFST-1,sp),x
 278                     ; 248     return (c);
 279  0166 7b02          	ld	a,(OFST+0,sp)
 281  0168 85            	popw	x
 282  0169 81            	ret	
 284                     ; 256 static void CLK_Config(void)
 284                     ; 257 {
 285  016a               L3_CLK_Config:
 287                     ; 259 	CLK_SYSCLKDivConfig (CLK_SYSCLKDiv_1); 
 288  016a 4f            	clr	a
 289  016b cd0000        	call	_CLK_SYSCLKDivConfig
 291                     ; 262   CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 292  016e ae0301        	ldw	x,#769
 293  0171 cd0000        	call	_CLK_PeripheralClockConfig
 295                     ; 265   CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 296  0174 ae1101        	ldw	x,#4353
 297  0177 cd0000        	call	_CLK_PeripheralClockConfig
 299                     ; 268   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 300  017a ae0101        	ldw	x,#257
 301  017d cd0000        	call	_CLK_PeripheralClockConfig
 303                     ; 271   CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 304  0180 ae0501        	ldw	x,#1281
 306                     ; 272 }
 307  0183 cc0000        	jp	_CLK_PeripheralClockConfig
 309                     ; 279 static void GPIO_Config(void)
 309                     ; 280 {
 310  0186               L5_GPIO_Config:
 312                     ; 281 	SYSCFG->RMPCR1	|= 0b01 << 4;	//reconfig USART Pins from PC2,3 to PA2,3
 313  0186 7218509e      	bset	20638,#4
 314                     ; 284 	GPIO_Init(GPIOA, GPIO_Pin_2 , GPIO_Mode_Out_OD_HiZ_Fast);
 315  018a 4bb0          	push	#176
 316  018c 4b04          	push	#4
 317  018e ae5000        	ldw	x,#20480
 318  0191 cd0000        	call	_GPIO_Init
 320  0194 85            	popw	x
 321                     ; 287   GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
 322  0195 4b01          	push	#1
 323  0197 4b04          	push	#4
 324  0199 ae5000        	ldw	x,#20480
 325  019c cd0000        	call	_GPIO_ExternalPullUpConfig
 327  019f 85            	popw	x
 328                     ; 290   GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
 329  01a0 4b01          	push	#1
 330  01a2 4b08          	push	#8
 331  01a4 ae5000        	ldw	x,#20480
 332  01a7 cd0000        	call	_GPIO_ExternalPullUpConfig
 334  01aa 85            	popw	x
 335                     ; 293   GPIO_Init(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 336  01ab 4be0          	push	#224
 337  01ad 4b17          	push	#23
 338  01af ae500f        	ldw	x,#20495
 339  01b2 cd0000        	call	_GPIO_Init
 341  01b5 85            	popw	x
 342                     ; 296 	GPIO_Init(GPIOA, GPIO_Pin_1 | GPIO_Pin_4 | GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
 343  01b6 4b40          	push	#64
 344  01b8 4b32          	push	#50
 345  01ba ae5000        	ldw	x,#20480
 346  01bd cd0000        	call	_GPIO_Init
 348  01c0 85            	popw	x
 349                     ; 299 	GPIO_Init(GPIOC, GPIO_Pin_0 | GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
 350  01c1 4b40          	push	#64
 351  01c3 4b03          	push	#3
 352  01c5 ae500a        	ldw	x,#20490
 353  01c8 cd0000        	call	_GPIO_Init
 355  01cb 85            	popw	x
 356                     ; 302   GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_0, ENABLE);
 357  01cc 4b01          	push	#1
 358  01ce 4b01          	push	#1
 359  01d0 ae500a        	ldw	x,#20490
 360  01d3 cd0000        	call	_GPIO_ExternalPullUpConfig
 362  01d6 85            	popw	x
 363                     ; 305   GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_1, ENABLE);
 364  01d7 4b01          	push	#1
 365  01d9 4b02          	push	#2
 366  01db ae500a        	ldw	x,#20490
 367  01de cd0000        	call	_GPIO_ExternalPullUpConfig
 369  01e1 85            	popw	x
 370                     ; 308 	GPIO_Init(GPIOA, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
 371  01e2 4b40          	push	#64
 372  01e4 4b02          	push	#2
 373  01e6 ae5000        	ldw	x,#20480
 374  01e9 cd0000        	call	_GPIO_Init
 376  01ec 85            	popw	x
 377                     ; 309 }
 378  01ed 81            	ret	
 380                     ; 316 static void TIM1_Config(void)
 380                     ; 317 {
 381  01ee               L7_TIM1_Config:
 383                     ; 323   TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);
 384  01ee 4b00          	push	#0
 385  01f0 ae27d8        	ldw	x,#10200
 386  01f3 89            	pushw	x
 387  01f4 4b00          	push	#0
 388  01f6 5f            	clrw	x
 389  01f7 cd0000        	call	_TIM1_TimeBaseInit
 391  01fa 5b04          	addw	sp,#4
 392                     ; 326   TIM1_OC1Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 392                     ; 327                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 392                     ; 328                TIM1_OCNIdleState_Set);
 393  01fc 4b2a          	push	#42
 394  01fe 4b55          	push	#85
 395  0200 4b88          	push	#136
 396  0202 4b00          	push	#0
 397  0204 5f            	clrw	x
 398  0205 89            	pushw	x
 399  0206 4b00          	push	#0
 400  0208 ae6011        	ldw	x,#24593
 401  020b cd0000        	call	_TIM1_OC1Init
 403  020e 5b07          	addw	sp,#7
 404                     ; 329   TIM1_OC1PreloadConfig(DISABLE);
 405  0210 4f            	clr	a
 406  0211 cd0000        	call	_TIM1_OC1PreloadConfig
 408                     ; 332   TIM1_OC2Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 408                     ; 333                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 408                     ; 334                TIM1_OCNIdleState_Set);
 409  0214 4b2a          	push	#42
 410  0216 4b55          	push	#85
 411  0218 4b88          	push	#136
 412  021a 4b00          	push	#0
 413  021c 5f            	clrw	x
 414  021d 89            	pushw	x
 415  021e 4b00          	push	#0
 416  0220 ae6011        	ldw	x,#24593
 417  0223 cd0000        	call	_TIM1_OC2Init
 419  0226 5b07          	addw	sp,#7
 420                     ; 335   TIM1_OC2PreloadConfig(ENABLE);
 421  0228 a601          	ld	a,#1
 422  022a cd0000        	call	_TIM1_OC2PreloadConfig
 424                     ; 338   TIM1_OC3Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
 424                     ; 339                0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
 424                     ; 340                TIM1_OCNIdleState_Set);
 425  022d 4b2a          	push	#42
 426  022f 4b55          	push	#85
 427  0231 4b88          	push	#136
 428  0233 4b00          	push	#0
 429  0235 5f            	clrw	x
 430  0236 89            	pushw	x
 431  0237 4b00          	push	#0
 432  0239 ae6011        	ldw	x,#24593
 433  023c cd0000        	call	_TIM1_OC3Init
 435  023f 5b07          	addw	sp,#7
 436                     ; 341   TIM1_OC3PreloadConfig(ENABLE);
 437  0241 a601          	ld	a,#1
 438  0243 cd0000        	call	_TIM1_OC3PreloadConfig
 440                     ; 343   TIM1_ARRPreloadConfig(ENABLE);
 441  0246 a601          	ld	a,#1
 442  0248 cd0000        	call	_TIM1_ARRPreloadConfig
 444                     ; 346   enableInterrupts();
 446  024b 9a            	rim	
 448                     ; 349   TIM1_CtrlPWMOutputs(ENABLE);
 449  024c a601          	ld	a,#1
 450  024e cd0000        	call	_TIM1_CtrlPWMOutputs
 452                     ; 351   TIM1_Cmd(ENABLE);
 453  0251 a601          	ld	a,#1
 455                     ; 352 }
 456  0253 cc0000        	jp	_TIM1_Cmd
 458                     ; 354 static void TIM3_Config(void)
 458                     ; 355 {
 459  0256               L11_TIM3_Config:
 461                     ; 361   TIM3_TimeBaseInit(TIM1_PRESCALER, TIM3_CounterMode_Up, TIM1_PERIOD);
 462  0256 ae27d8        	ldw	x,#10200
 463  0259 89            	pushw	x
 464  025a 5f            	clrw	x
 465  025b cd0000        	call	_TIM3_TimeBaseInit
 467  025e 85            	popw	x
 468                     ; 365   TIM3_OC2Init(TIM3_OCMode_PWM1, TIM3_OutputState_Enable, 0, TIM3_OCPolarity_High, TIM3_OCIdleState_Set);
 469  025f 4b01          	push	#1
 470  0261 4b00          	push	#0
 471  0263 5f            	clrw	x
 472  0264 89            	pushw	x
 473  0265 ae6001        	ldw	x,#24577
 474  0268 cd0000        	call	_TIM3_OC2Init
 476  026b 5b04          	addw	sp,#4
 477                     ; 366   TIM3_OC2PreloadConfig(DISABLE);
 478  026d 4f            	clr	a
 479  026e cd0000        	call	_TIM3_OC2PreloadConfig
 481                     ; 368   TIM3_ARRPreloadConfig(ENABLE);
 482  0271 a601          	ld	a,#1
 483  0273 cd0000        	call	_TIM3_ARRPreloadConfig
 485                     ; 371   enableInterrupts();
 487  0276 9a            	rim	
 489                     ; 374   TIM3_CtrlPWMOutputs(ENABLE);
 490  0277 a601          	ld	a,#1
 491  0279 cd0000        	call	_TIM3_CtrlPWMOutputs
 493                     ; 376   TIM3_Cmd(ENABLE);
 494  027c a601          	ld	a,#1
 496                     ; 377 }
 497  027e cc0000        	jp	_TIM3_Cmd
 499                     ; 379 static void I2C_Data_To_Registers (void){
 500  0281               L31_I2C_Data_To_Registers:
 501  0281 5203          	subw	sp,#3
 502       00000003      OFST:	set	3
 504                     ; 384 	A = Slave_Buffer_Rx[0] & 0b11100000; //разбор битов управления и регистров по своим местам
 505  0283 c60017        	ld	a,_Slave_Buffer_Rx
 506  0286 a4e0          	and	a,#224
 507  0288 6b01          	ld	(OFST-2,sp),a
 508                     ; 385 	D = Slave_Buffer_Rx[0] & 0b00001111;
 509  028a c60017        	ld	a,_Slave_Buffer_Rx
 510  028d a40f          	and	a,#15
 511  028f 6b03          	ld	(OFST+0,sp),a
 512                     ; 387 	printf ("Rx_size = %d\r", (int16_t)Rx_size);
 513  0291 c60016        	ld	a,_Rx_size
 514  0294 5f            	clrw	x
 515  0295 97            	ld	xl,a
 516  0296 89            	pushw	x
 517  0297 ae0020        	ldw	x,#L301
 518  029a cd0000        	call	_printf
 520  029d 85            	popw	x
 521                     ; 388 	printf ("D = %d\r", (int16_t)D);
 522  029e 7b03          	ld	a,(OFST+0,sp)
 523  02a0 5f            	clrw	x
 524  02a1 97            	ld	xl,a
 525  02a2 89            	pushw	x
 526  02a3 ae0018        	ldw	x,#L501
 527  02a6 cd0000        	call	_printf
 529  02a9 85            	popw	x
 530                     ; 389 	for (i = 0; i < Rx_size; i++){
 531  02aa 0f02          	clr	(OFST-1,sp)
 533  02ac 2011          	jra	L311
 534  02ae               L701:
 535                     ; 390 					printf ("buff = %x\r", (int16_t)Slave_Buffer_Rx[i]);
 536  02ae 5f            	clrw	x
 537  02af 97            	ld	xl,a
 538  02b0 d60017        	ld	a,(_Slave_Buffer_Rx,x)
 539  02b3 5f            	clrw	x
 540  02b4 97            	ld	xl,a
 541  02b5 89            	pushw	x
 542  02b6 ae000d        	ldw	x,#L711
 543  02b9 cd0000        	call	_printf
 545  02bc 85            	popw	x
 546                     ; 389 	for (i = 0; i < Rx_size; i++){
 547  02bd 0c02          	inc	(OFST-1,sp)
 548  02bf               L311:
 550  02bf 7b02          	ld	a,(OFST-1,sp)
 551  02c1 c10016        	cp	a,_Rx_size
 552  02c4 25e8          	jrult	L701
 553                     ; 393 		switch (A){
 554  02c6 7b01          	ld	a,(OFST-2,sp)
 556                     ; 430 				break;
 557  02c8 2719          	jreq	L17
 558  02ca a080          	sub	a,#128
 559  02cc 2722          	jreq	L37
 560  02ce a020          	sub	a,#32
 561  02d0 2761          	jreq	L57
 562  02d2 a020          	sub	a,#32
 563  02d4 2603cc0360    	jreq	L77
 564  02d9 a020          	sub	a,#32
 565  02db 2603cc038d    	jreq	L101
 566  02e0 cc03b8        	jra	L321
 567  02e3               L17:
 568                     ; 395 			case AUTO_INCREMENT_OFF: 
 568                     ; 396 				Config_reg[D] = Slave_Buffer_Rx[1];
 569  02e3 7b03          	ld	a,(OFST+0,sp)
 570  02e5 5f            	clrw	x
 571  02e6 97            	ld	xl,a
 572  02e7 c60018        	ld	a,_Slave_Buffer_Rx+1
 573  02ea d70116        	ld	(_Config_reg,x),a
 574                     ; 397 				break;
 575  02ed cc03b8        	jra	L321
 576  02f0               L37:
 577                     ; 399 			case AUTO_INCREMENT_ALL:
 577                     ; 400 				for (i = 1; i <= Rx_size; i++){
 578  02f0 4c            	inc	a
 579  02f1 6b02          	ld	(OFST-1,sp),a
 581  02f3 2036          	jra	L131
 582  02f5               L521:
 583                     ; 401 					Config_reg[D] = Slave_Buffer_Rx[i];
 584  02f5 7b03          	ld	a,(OFST+0,sp)
 585  02f7 5f            	clrw	x
 586  02f8 97            	ld	xl,a
 587  02f9 7b02          	ld	a,(OFST-1,sp)
 588  02fb 905f          	clrw	y
 589  02fd 9097          	ld	yl,a
 590  02ff 90d60017      	ld	a,(_Slave_Buffer_Rx,y)
 591  0303 d70116        	ld	(_Config_reg,x),a
 592                     ; 402 					printf ("reg %d = %d\r", (int16_t)D, (int16_t)Slave_Buffer_Rx[i]);
 593  0306 7b02          	ld	a,(OFST-1,sp)
 594  0308 5f            	clrw	x
 595  0309 97            	ld	xl,a
 596  030a d60017        	ld	a,(_Slave_Buffer_Rx,x)
 597  030d 5f            	clrw	x
 598  030e 97            	ld	xl,a
 599  030f 89            	pushw	x
 600  0310 7b05          	ld	a,(OFST+2,sp)
 601  0312 5f            	clrw	x
 602  0313 97            	ld	xl,a
 603  0314 89            	pushw	x
 604  0315 ae0000        	ldw	x,#L531
 605  0318 cd0000        	call	_printf
 607  031b 5b04          	addw	sp,#4
 608                     ; 403 					D++;
 609  031d 0c03          	inc	(OFST+0,sp)
 610                     ; 404 						if (D > ALLCALLADR) D = MODE1;
 611  031f 7b03          	ld	a,(OFST+0,sp)
 612  0321 a10d          	cp	a,#13
 613  0323 2502          	jrult	L731
 615  0325 0f03          	clr	(OFST+0,sp)
 616  0327               L731:
 617                     ; 400 				for (i = 1; i <= Rx_size; i++){
 618  0327 0c02          	inc	(OFST-1,sp)
 619  0329 7b02          	ld	a,(OFST-1,sp)
 620  032b               L131:
 622  032b c10016        	cp	a,_Rx_size
 623  032e 23c5          	jrule	L521
 624                     ; 406 				break;
 625  0330 cc03b8        	jra	L321
 626  0333               L57:
 627                     ; 408 			case AUTO_INCREMENT_BRIGHTNESS:
 627                     ; 409 				for (i = 1; i <= Rx_size; i++){
 628  0333 4c            	inc	a
 629  0334 6b02          	ld	(OFST-1,sp),a
 631  0336 2021          	jra	L541
 632  0338               L141:
 633                     ; 410 					Config_reg[D] = Slave_Buffer_Rx[i];
 634  0338 7b03          	ld	a,(OFST+0,sp)
 635  033a 5f            	clrw	x
 636  033b 97            	ld	xl,a
 637  033c 7b02          	ld	a,(OFST-1,sp)
 638  033e 905f          	clrw	y
 639  0340 9097          	ld	yl,a
 640  0342 90d60017      	ld	a,(_Slave_Buffer_Rx,y)
 641  0346 d70116        	ld	(_Config_reg,x),a
 642                     ; 411 					D++;
 643  0349 0c03          	inc	(OFST+0,sp)
 644                     ; 412 						if (D > PWM3) D = PWM0;
 645  034b 7b03          	ld	a,(OFST+0,sp)
 646  034d a106          	cp	a,#6
 647  034f 2504          	jrult	L151
 649  0351 a602          	ld	a,#2
 650  0353 6b03          	ld	(OFST+0,sp),a
 651  0355               L151:
 652                     ; 409 				for (i = 1; i <= Rx_size; i++){
 653  0355 0c02          	inc	(OFST-1,sp)
 654  0357 7b02          	ld	a,(OFST-1,sp)
 655  0359               L541:
 657  0359 c10016        	cp	a,_Rx_size
 658  035c 23da          	jrule	L141
 659                     ; 414 				break;
 660  035e 2058          	jra	L321
 661  0360               L77:
 662                     ; 416 			case AUTO_INCREMENT_GCONTROL:
 662                     ; 417 				for (i = 1; i <= Rx_size; i++){
 663  0360 4c            	inc	a
 664  0361 6b02          	ld	(OFST-1,sp),a
 666  0363 2021          	jra	L751
 667  0365               L351:
 668                     ; 418 					Config_reg[D] = Slave_Buffer_Rx[i];
 669  0365 7b03          	ld	a,(OFST+0,sp)
 670  0367 5f            	clrw	x
 671  0368 97            	ld	xl,a
 672  0369 7b02          	ld	a,(OFST-1,sp)
 673  036b 905f          	clrw	y
 674  036d 9097          	ld	yl,a
 675  036f 90d60017      	ld	a,(_Slave_Buffer_Rx,y)
 676  0373 d70116        	ld	(_Config_reg,x),a
 677                     ; 419 					D++;
 678  0376 0c03          	inc	(OFST+0,sp)
 679                     ; 420 						if (D > GRPFREQ) D = GRPPWM;
 680  0378 7b03          	ld	a,(OFST+0,sp)
 681  037a a108          	cp	a,#8
 682  037c 2504          	jrult	L361
 684  037e a606          	ld	a,#6
 685  0380 6b03          	ld	(OFST+0,sp),a
 686  0382               L361:
 687                     ; 417 				for (i = 1; i <= Rx_size; i++){
 688  0382 0c02          	inc	(OFST-1,sp)
 689  0384 7b02          	ld	a,(OFST-1,sp)
 690  0386               L751:
 692  0386 c10016        	cp	a,_Rx_size
 693  0389 23da          	jrule	L351
 694                     ; 422 				break;
 695  038b 202b          	jra	L321
 696  038d               L101:
 697                     ; 424 			case AUTO_INCREMENT_I_GCONTROL:
 697                     ; 425 				for (i = 1; i <= Rx_size; i++){
 698  038d 4c            	inc	a
 699  038e 6b02          	ld	(OFST-1,sp),a
 701  0390 2021          	jra	L171
 702  0392               L561:
 703                     ; 426 					Config_reg[D] = Slave_Buffer_Rx[i];
 704  0392 7b03          	ld	a,(OFST+0,sp)
 705  0394 5f            	clrw	x
 706  0395 97            	ld	xl,a
 707  0396 7b02          	ld	a,(OFST-1,sp)
 708  0398 905f          	clrw	y
 709  039a 9097          	ld	yl,a
 710  039c 90d60017      	ld	a,(_Slave_Buffer_Rx,y)
 711  03a0 d70116        	ld	(_Config_reg,x),a
 712                     ; 427 					D++;
 713  03a3 0c03          	inc	(OFST+0,sp)
 714                     ; 428 						if (D > GRPFREQ) D = PWM0;
 715  03a5 7b03          	ld	a,(OFST+0,sp)
 716  03a7 a108          	cp	a,#8
 717  03a9 2504          	jrult	L571
 719  03ab a602          	ld	a,#2
 720  03ad 6b03          	ld	(OFST+0,sp),a
 721  03af               L571:
 722                     ; 425 				for (i = 1; i <= Rx_size; i++){
 723  03af 0c02          	inc	(OFST-1,sp)
 724  03b1 7b02          	ld	a,(OFST-1,sp)
 725  03b3               L171:
 727  03b3 c10016        	cp	a,_Rx_size
 728  03b6 23da          	jrule	L561
 729                     ; 430 				break;
 730  03b8               L321:
 731                     ; 433 }
 732  03b8 5b03          	addw	sp,#3
 733  03ba 81            	ret	
 735                     ; 435 static void Update_Control (void){
 736  03bb               L51_Update_Control:
 737  03bb 520c          	subw	sp,#12
 738       0000000c      OFST:	set	12
 740                     ; 436 	uint8_t ledout0 = Config_reg[LEDOUT] & 0b11;
 741  03bd c6011e        	ld	a,_Config_reg+8
 742  03c0 a403          	and	a,#3
 743  03c2 6b04          	ld	(OFST-8,sp),a
 744                     ; 437 	uint8_t ledout1 = (Config_reg[LEDOUT] >> 2) & 0b11;
 745  03c4 c6011e        	ld	a,_Config_reg+8
 746  03c7 a40c          	and	a,#12
 747  03c9 44            	srl	a
 748  03ca 44            	srl	a
 749  03cb 6b02          	ld	(OFST-10,sp),a
 750                     ; 438 	uint8_t ledout2 = (Config_reg[LEDOUT] >> 4) & 0b11;
 751  03cd c6011e        	ld	a,_Config_reg+8
 752  03d0 4e            	swap	a
 753  03d1 a403          	and	a,#3
 754  03d3 6b03          	ld	(OFST-9,sp),a
 755                     ; 439 	uint8_t ledout3 = (Config_reg[LEDOUT] >> 6) & 0b11;
 756  03d5 c6011e        	ld	a,_Config_reg+8
 757                     ; 447 	if ( !((Config_reg [MODE1] >> 4) & 1) ){ //check for SLEEP mode bit & OFF when SLEEP = 0
 758  03d8 c60116        	ld	a,_Config_reg
 759  03db 4e            	swap	a
 760  03dc a401          	and	a,#1
 761  03de 5f            	clrw	x
 762  03df 97            	ld	xl,a
 763  03e0 5d            	tnzw	x
 764  03e1 2703cc0515    	jrne	L732
 765                     ; 450 		if ((Config_reg [MODE2] >> 4)&1) {
 766  03e6 c60117        	ld	a,_Config_reg+1
 767  03e9 4e            	swap	a
 768  03ea a401          	and	a,#1
 769  03ec 5f            	clrw	x
 770  03ed 97            	ld	xl,a
 771  03ee 5d            	tnzw	x
 772  03ef 2744          	jreq	L142
 773                     ; 451 			pwm0 = (255 - Config_reg[PWM0]) *40;
 774  03f1 4f            	clr	a
 775  03f2 97            	ld	xl,a
 776  03f3 4a            	dec	a
 777  03f4 c00118        	sub	a,_Config_reg+2
 778  03f7 2401          	jrnc	L602
 779  03f9 5a            	decw	x
 780  03fa               L602:
 781  03fa 02            	rlwa	x,a
 782  03fb a628          	ld	a,#40
 783  03fd cd0000        	call	c_bmulx
 785  0400 1f05          	ldw	(OFST-7,sp),x
 786                     ; 452 			pwm1 = (255 - Config_reg[PWM1]) *40;
 787  0402 4f            	clr	a
 788  0403 97            	ld	xl,a
 789  0404 4a            	dec	a
 790  0405 c00119        	sub	a,_Config_reg+3
 791  0408 2401          	jrnc	L012
 792  040a 5a            	decw	x
 793  040b               L012:
 794  040b 02            	rlwa	x,a
 795  040c a628          	ld	a,#40
 796  040e cd0000        	call	c_bmulx
 798  0411 1f07          	ldw	(OFST-5,sp),x
 799                     ; 453 			pwm2 = (255 - Config_reg[PWM2]) *40;
 800  0413 4f            	clr	a
 801  0414 97            	ld	xl,a
 802  0415 4a            	dec	a
 803  0416 c0011a        	sub	a,_Config_reg+4
 804  0419 2401          	jrnc	L212
 805  041b 5a            	decw	x
 806  041c               L212:
 807  041c 02            	rlwa	x,a
 808  041d a628          	ld	a,#40
 809  041f cd0000        	call	c_bmulx
 811  0422 1f09          	ldw	(OFST-3,sp),x
 812                     ; 454 			pwm3 = (255 - Config_reg[PWM3]) *40;
 813  0424 4f            	clr	a
 814  0425 97            	ld	xl,a
 815  0426 4a            	dec	a
 816  0427 c0011b        	sub	a,_Config_reg+5
 817  042a 2401          	jrnc	L412
 818  042c 5a            	decw	x
 819  042d               L412:
 820  042d 02            	rlwa	x,a
 821  042e a628          	ld	a,#40
 822  0430 cd0000        	call	c_bmulx
 825  0433 2022          	jra	L342
 826  0435               L142:
 827                     ; 457 			pwm0 = Config_reg[PWM0] *40;
 828  0435 c60118        	ld	a,_Config_reg+2
 829  0438 97            	ld	xl,a
 830  0439 a628          	ld	a,#40
 831  043b 42            	mul	x,a
 832  043c 1f05          	ldw	(OFST-7,sp),x
 833                     ; 458 			pwm1 = Config_reg[PWM1] *40;
 834  043e c60119        	ld	a,_Config_reg+3
 835  0441 97            	ld	xl,a
 836  0442 a628          	ld	a,#40
 837  0444 42            	mul	x,a
 838  0445 1f07          	ldw	(OFST-5,sp),x
 839                     ; 459 			pwm2 = Config_reg[PWM2] *40;
 840  0447 c6011a        	ld	a,_Config_reg+4
 841  044a 97            	ld	xl,a
 842  044b a628          	ld	a,#40
 843  044d 42            	mul	x,a
 844  044e 1f09          	ldw	(OFST-3,sp),x
 845                     ; 460 			pwm3 = Config_reg[PWM3] *40;
 846  0450 c6011b        	ld	a,_Config_reg+5
 847  0453 97            	ld	xl,a
 848  0454 a628          	ld	a,#40
 849  0456 42            	mul	x,a
 850  0457               L342:
 851  0457 1f0b          	ldw	(OFST-1,sp),x
 852                     ; 465 		switch (ledout0) {
 853  0459 7b04          	ld	a,(OFST-8,sp)
 855                     ; 481 				break;
 856  045b 270b          	jreq	L771
 857  045d 4a            	dec	a
 858  045e 270b          	jreq	L102
 859  0460 4a            	dec	a
 860  0461 270d          	jreq	L302
 861  0463 4a            	dec	a
 862  0464 2715          	jreq	L502
 863  0466 201c          	jra	L742
 864  0468               L771:
 865                     ; 466 			case 0b00:
 865                     ; 467 				Set_LED0 (0);
 866  0468 5f            	clrw	x
 868                     ; 468 				en_blink_led0 = 0;
 869                     ; 469 				break;
 870  0469 2007          	jp	LC001
 871  046b               L102:
 872                     ; 470 			case 0b01:
 872                     ; 471 				Set_LED0 (10200);
 873  046b ae27d8        	ldw	x,#10200
 875                     ; 472 				en_blink_led0 = 0;
 876                     ; 473 				break;
 877  046e 2002          	jp	LC001
 878  0470               L302:
 879                     ; 474 			case 0b10:
 879                     ; 475 				Set_LED0 (pwm0);
 880  0470 1e05          	ldw	x,(OFST-7,sp)
 882                     ; 476 				en_blink_led0 = 0;
 883  0472               LC001:
 884  0472 cd0000        	call	_TIM3_SetCompare2
 885  0475 725f0003      	clr	_en_blink_led0
 886                     ; 477 				break;
 887  0479 2009          	jra	L742
 888  047b               L502:
 889                     ; 478 			case 0b11:
 889                     ; 479 				Set_LED0 (pwm0);
 890  047b 1e05          	ldw	x,(OFST-7,sp)
 891  047d cd0000        	call	_TIM3_SetCompare2
 893                     ; 480 				en_blink_led0 = 1;
 894  0480 35010003      	mov	_en_blink_led0,#1
 895                     ; 481 				break;
 896  0484               L742:
 897                     ; 484 		switch (ledout1) {
 898  0484 7b02          	ld	a,(OFST-10,sp)
 900                     ; 500 				break;
 901  0486 270b          	jreq	L702
 902  0488 4a            	dec	a
 903  0489 270b          	jreq	L112
 904  048b 4a            	dec	a
 905  048c 270d          	jreq	L312
 906  048e 4a            	dec	a
 907  048f 2715          	jreq	L512
 908  0491 201c          	jra	L352
 909  0493               L702:
 910                     ; 485 			case 0b00:
 910                     ; 486 				Set_LED1 (0);
 911  0493 5f            	clrw	x
 913                     ; 487 				en_blink_led1 = 0;
 914                     ; 488 				break;
 915  0494 2007          	jp	LC002
 916  0496               L112:
 917                     ; 489 			case 0b01:
 917                     ; 490 				Set_LED1 (10200);
 918  0496 ae27d8        	ldw	x,#10200
 920                     ; 491 				en_blink_led1 = 0;
 921                     ; 492 				break;
 922  0499 2002          	jp	LC002
 923  049b               L312:
 924                     ; 493 			case 0b10:
 924                     ; 494 				Set_LED1 (pwm1);
 925  049b 1e07          	ldw	x,(OFST-5,sp)
 927                     ; 495 				en_blink_led1 = 0;
 928  049d               LC002:
 929  049d cd0000        	call	_TIM1_SetCompare3
 930  04a0 725f0002      	clr	_en_blink_led1
 931                     ; 496 				break;
 932  04a4 2009          	jra	L352
 933  04a6               L512:
 934                     ; 497 			case 0b11:
 934                     ; 498 				Set_LED1 (pwm1);
 935  04a6 1e07          	ldw	x,(OFST-5,sp)
 936  04a8 cd0000        	call	_TIM1_SetCompare3
 938                     ; 499 				en_blink_led1 = 1;
 939  04ab 35010002      	mov	_en_blink_led1,#1
 940                     ; 500 				break;
 941  04af               L352:
 942                     ; 503 		switch (ledout2) {
 943  04af 7b03          	ld	a,(OFST-9,sp)
 945                     ; 519 				break;
 946  04b1 270b          	jreq	L712
 947  04b3 4a            	dec	a
 948  04b4 270b          	jreq	L122
 949  04b6 4a            	dec	a
 950  04b7 270d          	jreq	L322
 951  04b9 4a            	dec	a
 952  04ba 2715          	jreq	L522
 953  04bc 201c          	jra	L752
 954  04be               L712:
 955                     ; 504 			case 0b00:
 955                     ; 505 				Set_LED2 (0);
 956  04be 5f            	clrw	x
 958                     ; 506 				en_blink_led2 = 0;
 959                     ; 507 				break;
 960  04bf 2007          	jp	LC003
 961  04c1               L122:
 962                     ; 508 			case 0b01:
 962                     ; 509 				Set_LED2 (10200);
 963  04c1 ae27d8        	ldw	x,#10200
 965                     ; 510 				en_blink_led2 = 0;
 966                     ; 511 				break;
 967  04c4 2002          	jp	LC003
 968  04c6               L322:
 969                     ; 512 			case 0b10:
 969                     ; 513 				Set_LED2 (pwm2);
 970  04c6 1e09          	ldw	x,(OFST-3,sp)
 972                     ; 514 				en_blink_led2 = 0;
 973  04c8               LC003:
 974  04c8 cd0000        	call	_TIM1_SetCompare1
 975  04cb 725f0001      	clr	_en_blink_led2
 976                     ; 515 				break;
 977  04cf 2009          	jra	L752
 978  04d1               L522:
 979                     ; 516 			case 0b11:
 979                     ; 517 				Set_LED2 (pwm2);
 980  04d1 1e09          	ldw	x,(OFST-3,sp)
 981  04d3 cd0000        	call	_TIM1_SetCompare1
 983                     ; 518 				en_blink_led2 = 1;
 984  04d6 35010001      	mov	_en_blink_led2,#1
 985                     ; 519 				break;
 986  04da               L752:
 987                     ; 522 		switch (ledout0) {
 988  04da 7b04          	ld	a,(OFST-8,sp)
 990                     ; 538 				break;
 991  04dc 270b          	jreq	L722
 992  04de 4a            	dec	a
 993  04df 2712          	jreq	L132
 994  04e1 4a            	dec	a
 995  04e2 271b          	jreq	L332
 996  04e4 4a            	dec	a
 997  04e5 2723          	jreq	L532
 998  04e7 203c          	jra	L562
 999  04e9               L722:
1000                     ; 523 			case 0b00:
1000                     ; 524 				Set_LED3 (0);
1001  04e9 5f            	clrw	x
1002  04ea cd0000        	call	_TIM1_SetCompare2
1004                     ; 525 				en_blink_led3 = 0;
1005  04ed 725f0000      	clr	_en_blink_led3
1006                     ; 526 				break;
1007  04f1 2032          	jra	L562
1008  04f3               L132:
1009                     ; 527 			case 0b01:
1009                     ; 528 				Set_LED3 (10200);
1010  04f3 ae27d8        	ldw	x,#10200
1011  04f6 cd0000        	call	_TIM1_SetCompare2
1013                     ; 529 				en_blink_led3 = 0;
1014  04f9 725f0000      	clr	_en_blink_led3
1015                     ; 530 				break;
1016  04fd 2026          	jra	L562
1017  04ff               L332:
1018                     ; 531 			case 0b10:
1018                     ; 532 				Set_LED3 (pwm3);
1019  04ff 1e0b          	ldw	x,(OFST-1,sp)
1020  0501 cd0000        	call	_TIM1_SetCompare2
1022                     ; 533 				en_blink_led3 = 0;
1023  0504 725f0000      	clr	_en_blink_led3
1024                     ; 534 				break;
1025  0508 201b          	jra	L562
1026  050a               L532:
1027                     ; 535 			case 0b11:
1027                     ; 536 				Set_LED3 (pwm3);
1028  050a 1e0b          	ldw	x,(OFST-1,sp)
1029  050c cd0000        	call	_TIM1_SetCompare2
1031                     ; 537 				en_blink_led3 = 1;
1032  050f 35010000      	mov	_en_blink_led3,#1
1033                     ; 538 				break;
1034  0513 2010          	jra	L562
1036  0515               L732:
1037                     ; 542 		Set_LED0 (0);
1038  0515 5f            	clrw	x
1039  0516 cd0000        	call	_TIM3_SetCompare2
1041                     ; 543 		Set_LED1 (0);
1042  0519 5f            	clrw	x
1043  051a cd0000        	call	_TIM1_SetCompare3
1045                     ; 544 		Set_LED2 (0);
1046  051d 5f            	clrw	x
1047  051e cd0000        	call	_TIM1_SetCompare1
1049                     ; 545 		Set_LED3 (0);
1050  0521 5f            	clrw	x
1051  0522 cd0000        	call	_TIM1_SetCompare2
1053  0525               L562:
1054                     ; 548 }
1055  0525 5b0c          	addw	sp,#12
1056  0527 81            	ret	
1058                     	xdef	_main
1059                     	xdef	_baudrate
1060                     	switch	.bss
1061  0000               _en_blink_led3:
1062  0000 00            	ds.b	1
1063                     	xdef	_en_blink_led3
1064  0001               _en_blink_led2:
1065  0001 00            	ds.b	1
1066                     	xdef	_en_blink_led2
1067  0002               _en_blink_led1:
1068  0002 00            	ds.b	1
1069                     	xdef	_en_blink_led1
1070  0003               _en_blink_led0:
1071  0003 00            	ds.b	1
1072                     	xdef	_en_blink_led0
1073                     	xref	_a
1074  0004               _bright:
1075  0004 0000          	ds.b	2
1076                     	xdef	_bright
1077  0006               _i2c_buff:
1078  0006 000000000000  	ds.b	16
1079                     	xdef	_i2c_buff
1080                     	xdef	_CommunicationEnd
1081  0016               _Rx_size:
1082  0016 00            	ds.b	1
1083                     	xdef	_Rx_size
1084  0017               _Slave_Buffer_Rx:
1085  0017 000000000000  	ds.b	255
1086                     	xdef	_Slave_Buffer_Rx
1087  0116               _Config_reg:
1088  0116 000000000000  	ds.b	13
1089                     	xdef	_Config_reg
1090  0123               _slave_address:
1091  0123 00            	ds.b	1
1092                     	xdef	_slave_address
1093                     	xdef	_putchar
1094                     	xref	_printf
1095                     	xdef	_getchar
1096                     	xref	_USART_GetFlagStatus
1097                     	xref	_USART_ITConfig
1098                     	xref	_USART_ReceiveData8
1099                     	xref	_USART_SendData8
1100                     	xref	_USART_Cmd
1101                     	xref	_USART_Init
1102                     	xref	_USART_DeInit
1103                     	xref	_TIM3_OC2PreloadConfig
1104                     	xref	_TIM3_SetCompare2
1105                     	xref	_TIM3_CtrlPWMOutputs
1106                     	xref	_TIM3_OC2Init
1107                     	xref	_TIM3_Cmd
1108                     	xref	_TIM3_ARRPreloadConfig
1109                     	xref	_TIM3_TimeBaseInit
1110                     	xref	_TIM1_OC3PreloadConfig
1111                     	xref	_TIM1_OC2PreloadConfig
1112                     	xref	_TIM1_OC1PreloadConfig
1113                     	xref	_TIM1_SetCompare3
1114                     	xref	_TIM1_SetCompare2
1115                     	xref	_TIM1_SetCompare1
1116                     	xref	_TIM1_CtrlPWMOutputs
1117                     	xref	_TIM1_OC3Init
1118                     	xref	_TIM1_OC2Init
1119                     	xref	_TIM1_OC1Init
1120                     	xref	_TIM1_Cmd
1121                     	xref	_TIM1_ARRPreloadConfig
1122                     	xref	_TIM1_TimeBaseInit
1123                     	xref	_I2C_ITConfig
1124                     	xref	_I2C_Init
1125                     	xref	_I2C_DeInit
1126                     	xref	_GPIO_ReadInputDataBit
1127                     	xref	_GPIO_ExternalPullUpConfig
1128                     	xref	_GPIO_Init
1129                     	xref	_CLK_PeripheralClockConfig
1130                     	xref	_CLK_SYSCLKDivConfig
1131                     .const:	section	.text
1132  0000               L531:
1133  0000 726567202564  	dc.b	"reg %d = %d",13,0
1134  000d               L711:
1135  000d 62756666203d  	dc.b	"buff = %x",13,0
1136  0018               L501:
1137  0018 44203d202564  	dc.b	"D = %d",13,0
1138  0020               L301:
1139  0020 52785f73697a  	dc.b	"Rx_size = %d",13,0
1140  002e               L35:
1141  002e 255820255820  	dc.b	"%X %X %X %X %X %X "
1142  0040 0a0d00        	dc.b	10,13,0
1143  0043               L14:
1144  0043 0a0d496e6572  	dc.b	10,13,73,110,101,114
1145  0049 74476173204d  	dc.b	"tGas Medical",10
1146  0056 0d00          	dc.b	13,0
1147  0058               L73:
1148  0058 0a0d50434139  	dc.b	10,13,80,67,65,57
1149  005e 363332205620  	dc.b	"632 V 1.0",10
1150  0068 0d00          	dc.b	13,0
1151                     	xref.b	c_x
1152                     	xref	c_bmulx
1153                     	xref	c_lzmp
1154                     	xref	c_lgsbc
1155                     	end
