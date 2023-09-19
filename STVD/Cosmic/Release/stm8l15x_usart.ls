   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
  17                     ; 149 {
  18                     	scross	off
  19  0000               _USART_DeInit:
  21                     ; 153   (void) USARTx->SR;
  22  0000 f6            	ld	a,(x)
  23                     ; 154   (void) USARTx->DR;
  24  0001 e601          	ld	a,(1,x)
  25                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  26  0003 6f03          	clr	(3,x)
  27                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  28  0005 6f02          	clr	(2,x)
  29                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  30  0007 6f04          	clr	(4,x)
  31                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  32  0009 6f05          	clr	(5,x)
  33                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  34  000b 6f06          	clr	(6,x)
  35                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  36  000d 6f07          	clr	(7,x)
  37                     ; 163 }
  38  000f 81            	ret	
  40                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
  40                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
  40                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
  40                     ; 195 {
  41  0010               _USART_Init:
  42  0010 89            	pushw	x
  43  0011 5204          	subw	sp,#4
  44       00000004      OFST:	set	4
  46                     ; 196   uint32_t BaudRate_Mantissa = 0;
  47                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
  48                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
  49                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
  50                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
  51                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
  52                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
  53  0013 e604          	ld	a,(4,x)
  54  0015 a4e9          	and	a,#233
  55  0017 e704          	ld	(4,x),a
  56                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
  57  0019 7b0d          	ld	a,(OFST+9,sp)
  58  001b 1a0f          	or	a,(OFST+11,sp)
  59  001d ea04          	or	a,(4,x)
  60  001f e704          	ld	(4,x),a
  61                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
  62  0021 e606          	ld	a,(6,x)
  63  0023 a4cf          	and	a,#207
  64  0025 e706          	ld	(6,x),a
  65                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
  66  0027 e606          	ld	a,(6,x)
  67  0029 1a0e          	or	a,(OFST+10,sp)
  68  002b e706          	ld	(6,x),a
  69                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
  70  002d 6f02          	clr	(2,x)
  71                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
  72  002f e603          	ld	a,(3,x)
  73  0031 a40f          	and	a,#15
  74  0033 e703          	ld	(3,x),a
  75                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
  76  0035 e603          	ld	a,(3,x)
  77  0037 a4f0          	and	a,#240
  78  0039 e703          	ld	(3,x),a
  79                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
  80  003b cd0000        	call	_CLK_GetClockFreq
  82  003e 96            	ldw	x,sp
  83  003f 1c0009        	addw	x,#OFST+5
  84  0042 cd0000        	call	c_ludv
  86  0045 96            	ldw	x,sp
  87  0046 5c            	incw	x
  88  0047 cd0000        	call	c_rtol
  90                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
  91  004a 7b03          	ld	a,(OFST-1,sp)
  92  004c a4f0          	and	a,#240
  93  004e 1e05          	ldw	x,(OFST+1,sp)
  94  0050 e703          	ld	(3,x),a
  95                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
  96  0052 7b04          	ld	a,(OFST+0,sp)
  97  0054 a40f          	and	a,#15
  98  0056 ea03          	or	a,(3,x)
  99  0058 e703          	ld	(3,x),a
 100                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 101  005a 96            	ldw	x,sp
 102  005b 5c            	incw	x
 103  005c cd0000        	call	c_ltor
 105  005f a604          	ld	a,#4
 106  0061 cd0000        	call	c_lursh
 108  0064 b603          	ld	a,c_lreg+3
 109  0066 1e05          	ldw	x,(OFST+1,sp)
 110  0068 e702          	ld	(2,x),a
 111                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 112  006a e605          	ld	a,(5,x)
 113  006c a4f3          	and	a,#243
 114  006e e705          	ld	(5,x),a
 115                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 116  0070 e605          	ld	a,(5,x)
 117  0072 1a10          	or	a,(OFST+12,sp)
 118  0074 e705          	ld	(5,x),a
 119                     ; 239 }
 120  0076 5b06          	addw	sp,#6
 121  0078 81            	ret	
 123                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 123                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 123                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 123                     ; 267 {
 124  0079               _USART_ClockInit:
 125       fffffffe      OFST: set -2
 127                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 128                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 129                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 130                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 131                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 132  0079 e606          	ld	a,(6,x)
 133  007b a4f8          	and	a,#248
 134  007d e706          	ld	(6,x),a
 135                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 136  007f 7b04          	ld	a,(OFST+6,sp)
 137  0081 1a05          	or	a,(OFST+7,sp)
 138  0083 1a06          	or	a,(OFST+8,sp)
 139  0085 ea06          	or	a,(6,x)
 140  0087 e706          	ld	(6,x),a
 141                     ; 279   if (USART_Clock != USART_Clock_Disable)
 142  0089 7b03          	ld	a,(OFST+5,sp)
 143  008b 2706          	jreq	L3
 144                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 145  008d e606          	ld	a,(6,x)
 146  008f aa08          	or	a,#8
 148  0091 2004          	jra	L5
 149  0093               L3:
 150                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 151  0093 e606          	ld	a,(6,x)
 152  0095 a4f7          	and	a,#247
 153  0097               L5:
 154  0097 e706          	ld	(6,x),a
 155                     ; 287 }
 156  0099 81            	ret	
 158                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 158                     ; 297 {
 159  009a               _USART_Cmd:
 160       fffffffe      OFST: set -2
 162                     ; 298   if (NewState != DISABLE)
 163  009a 7b03          	ld	a,(OFST+5,sp)
 164  009c 2706          	jreq	L7
 165                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 166  009e e604          	ld	a,(4,x)
 167  00a0 a4df          	and	a,#223
 169  00a2 2004          	jra	L11
 170  00a4               L7:
 171                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 172  00a4 e604          	ld	a,(4,x)
 173  00a6 aa20          	or	a,#32
 174  00a8               L11:
 175  00a8 e704          	ld	(4,x),a
 176                     ; 306 }
 177  00aa 81            	ret	
 179                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 179                     ; 330 {
 180  00ab               _USART_SetPrescaler:
 181       fffffffe      OFST: set -2
 183                     ; 332   USARTx->PSCR = USART_Prescaler;
 184  00ab 7b03          	ld	a,(OFST+5,sp)
 185  00ad e70a          	ld	(10,x),a
 186                     ; 333 }
 187  00af 81            	ret	
 189                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 189                     ; 341 {
 190  00b0               _USART_SendBreak:
 192                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 193  00b0 e605          	ld	a,(5,x)
 194  00b2 aa01          	or	a,#1
 195  00b4 e705          	ld	(5,x),a
 196                     ; 343 }
 197  00b6 81            	ret	
 199                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 199                     ; 383 {
 200  00b7               _USART_ReceiveData8:
 202                     ; 384   return USARTx->DR;
 203  00b7 e601          	ld	a,(1,x)
 205  00b9 81            	ret	
 207                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
 207                     ; 393 {
 208  00ba               _USART_ReceiveData9:
 209  00ba 89            	pushw	x
 210  00bb 89            	pushw	x
 211       00000002      OFST:	set	2
 213                     ; 394   uint16_t temp = 0;
 214                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 215  00bc e604          	ld	a,(4,x)
 216  00be a480          	and	a,#128
 217  00c0 5f            	clrw	x
 218  00c1 02            	rlwa	x,a
 219  00c2 58            	sllw	x
 220  00c3 1f01          	ldw	(OFST-1,sp),x
 221                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
 222  00c5 1e03          	ldw	x,(OFST+1,sp)
 223  00c7 e601          	ld	a,(1,x)
 224  00c9 5f            	clrw	x
 225  00ca 97            	ld	xl,a
 226  00cb 01            	rrwa	x,a
 227  00cc 1a02          	or	a,(OFST+0,sp)
 228  00ce 01            	rrwa	x,a
 229  00cf 1a01          	or	a,(OFST-1,sp)
 230  00d1 a401          	and	a,#1
 231  00d3 01            	rrwa	x,a
 233  00d4 5b04          	addw	sp,#4
 234  00d6 81            	ret	
 236                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
 236                     ; 406 {
 237  00d7               _USART_SendData8:
 238       fffffffe      OFST: set -2
 240                     ; 408   USARTx->DR = Data;
 241  00d7 7b03          	ld	a,(OFST+5,sp)
 242  00d9 e701          	ld	(1,x),a
 243                     ; 409 }
 244  00db 81            	ret	
 246                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
 246                     ; 419 {
 247  00dc               _USART_SendData9:
 248       fffffffe      OFST: set -2
 250                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
 251                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
 252  00dc e604          	ld	a,(4,x)
 253  00de a4bf          	and	a,#191
 254  00e0 e704          	ld	(4,x),a
 255                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
 256  00e2 1603          	ldw	y,(OFST+5,sp)
 257  00e4 9054          	srlw	y
 258  00e6 9054          	srlw	y
 259  00e8 909f          	ld	a,yl
 260  00ea a440          	and	a,#64
 261  00ec ea04          	or	a,(4,x)
 262  00ee e704          	ld	(4,x),a
 263                     ; 429   USARTx->DR   = (uint8_t)(Data);
 264  00f0 7b04          	ld	a,(OFST+6,sp)
 265  00f2 e701          	ld	(1,x),a
 266                     ; 430 }
 267  00f4 81            	ret	
 269                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 269                     ; 474 {
 270  00f5               _USART_ReceiverWakeUpCmd:
 271       fffffffe      OFST: set -2
 273                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
 274                     ; 477   if (NewState != DISABLE)
 275  00f5 7b03          	ld	a,(OFST+5,sp)
 276  00f7 2706          	jreq	L31
 277                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
 278  00f9 e605          	ld	a,(5,x)
 279  00fb aa02          	or	a,#2
 281  00fd 2004          	jra	L51
 282  00ff               L31:
 283                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
 284  00ff e605          	ld	a,(5,x)
 285  0101 a4fd          	and	a,#253
 286  0103               L51:
 287  0103 e705          	ld	(5,x),a
 288                     ; 487 }
 289  0105 81            	ret	
 291                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
 291                     ; 497 {
 292  0106               _USART_SetAddress:
 293       fffffffe      OFST: set -2
 295                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
 296                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
 297  0106 e607          	ld	a,(7,x)
 298  0108 a4f0          	and	a,#240
 299  010a e707          	ld	(7,x),a
 300                     ; 504   USARTx->CR4 |= USART_Address;
 301  010c e607          	ld	a,(7,x)
 302  010e 1a03          	or	a,(OFST+5,sp)
 303  0110 e707          	ld	(7,x),a
 304                     ; 505 }
 305  0112 81            	ret	
 307                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
 307                     ; 516 {
 308  0113               _USART_WakeUpConfig:
 309       fffffffe      OFST: set -2
 311                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
 312                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
 313  0113 e604          	ld	a,(4,x)
 314  0115 a4f7          	and	a,#247
 315  0117 e704          	ld	(4,x),a
 316                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
 317  0119 e604          	ld	a,(4,x)
 318  011b 1a03          	or	a,(OFST+5,sp)
 319  011d e704          	ld	(4,x),a
 320                     ; 521 }
 321  011f 81            	ret	
 323                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 323                     ; 567 {
 324  0120               _USART_HalfDuplexCmd:
 325       fffffffe      OFST: set -2
 327                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
 328                     ; 570   if (NewState != DISABLE)
 329  0120 7b03          	ld	a,(OFST+5,sp)
 330  0122 2706          	jreq	L71
 331                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
 332  0124 e608          	ld	a,(8,x)
 333  0126 aa08          	or	a,#8
 335  0128 2004          	jra	L12
 336  012a               L71:
 337                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
 338  012a e608          	ld	a,(8,x)
 339  012c a4f7          	and	a,#247
 340  012e               L12:
 341  012e e708          	ld	(8,x),a
 342                     ; 578 }
 343  0130 81            	ret	
 345                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 345                     ; 645 {
 346  0131               _USART_SmartCardCmd:
 347       fffffffe      OFST: set -2
 349                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
 350                     ; 648   if (NewState != DISABLE)
 351  0131 7b03          	ld	a,(OFST+5,sp)
 352  0133 2706          	jreq	L32
 353                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
 354  0135 e608          	ld	a,(8,x)
 355  0137 aa20          	or	a,#32
 357  0139 2004          	jra	L52
 358  013b               L32:
 359                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
 360  013b e608          	ld	a,(8,x)
 361  013d a4df          	and	a,#223
 362  013f               L52:
 363  013f e708          	ld	(8,x),a
 364                     ; 658 }
 365  0141 81            	ret	
 367                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 367                     ; 668 {
 368  0142               _USART_SmartCardNACKCmd:
 369       fffffffe      OFST: set -2
 371                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
 372                     ; 671   if (NewState != DISABLE)
 373  0142 7b03          	ld	a,(OFST+5,sp)
 374  0144 2706          	jreq	L72
 375                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
 376  0146 e608          	ld	a,(8,x)
 377  0148 aa10          	or	a,#16
 379  014a 2004          	jra	L13
 380  014c               L72:
 381                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
 382  014c e608          	ld	a,(8,x)
 383  014e a4ef          	and	a,#239
 384  0150               L13:
 385  0150 e708          	ld	(8,x),a
 386                     ; 681 }
 387  0152 81            	ret	
 389                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
 389                     ; 691 {
 390  0153               _USART_SetGuardTime:
 391       fffffffe      OFST: set -2
 393                     ; 693   USARTx->GTR = USART_GuardTime;
 394  0153 7b03          	ld	a,(OFST+5,sp)
 395  0155 e709          	ld	(9,x),a
 396                     ; 694 }
 397  0157 81            	ret	
 399                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
 399                     ; 752 {
 400  0158               _USART_IrDAConfig:
 401       fffffffe      OFST: set -2
 403                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
 404                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
 405  0158 7b03          	ld	a,(OFST+5,sp)
 406  015a 2706          	jreq	L33
 407                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
 408  015c e608          	ld	a,(8,x)
 409  015e aa04          	or	a,#4
 411  0160 2004          	jra	L53
 412  0162               L33:
 413                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
 414  0162 e608          	ld	a,(8,x)
 415  0164 a4fb          	and	a,#251
 416  0166               L53:
 417  0166 e708          	ld	(8,x),a
 418                     ; 763 }
 419  0168 81            	ret	
 421                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
 421                     ; 773 {
 422  0169               _USART_IrDACmd:
 423       fffffffe      OFST: set -2
 425                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
 426                     ; 778   if (NewState != DISABLE)
 427  0169 7b03          	ld	a,(OFST+5,sp)
 428  016b 2706          	jreq	L73
 429                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
 430  016d e608          	ld	a,(8,x)
 431  016f aa02          	or	a,#2
 433  0171 2004          	jra	L14
 434  0173               L73:
 435                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
 436  0173 e608          	ld	a,(8,x)
 437  0175 a4fd          	and	a,#253
 438  0177               L14:
 439  0177 e708          	ld	(8,x),a
 440                     ; 788 }
 441  0179 81            	ret	
 443                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
 443                     ; 819                   FunctionalState NewState)
 443                     ; 820 {
 444  017a               _USART_DMACmd:
 445       fffffffe      OFST: set -2
 447                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
 448                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
 449                     ; 825   if (NewState != DISABLE)
 450  017a 7b04          	ld	a,(OFST+6,sp)
 451  017c 2706          	jreq	L34
 452                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
 453  017e e608          	ld	a,(8,x)
 454  0180 1a03          	or	a,(OFST+5,sp)
 456  0182 2005          	jra	L54
 457  0184               L34:
 458                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
 459  0184 7b03          	ld	a,(OFST+5,sp)
 460  0186 43            	cpl	a
 461  0187 e408          	and	a,(8,x)
 462  0189               L54:
 463  0189 e708          	ld	(8,x),a
 464                     ; 837 }
 465  018b 81            	ret	
 467                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
 467                     ; 940 {
 468  018c               _USART_ITConfig:
 469  018c 89            	pushw	x
 470  018d 89            	pushw	x
 471       00000002      OFST:	set	2
 473                     ; 941   uint8_t usartreg, itpos = 0x00;
 474                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
 475                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
 476                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
 477  018e 7b07          	ld	a,(OFST+5,sp)
 478  0190 6b01          	ld	(OFST-1,sp),a
 479                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 480  0192 7b08          	ld	a,(OFST+6,sp)
 481  0194 a40f          	and	a,#15
 482  0196 5f            	clrw	x
 483  0197 97            	ld	xl,a
 484  0198 a601          	ld	a,#1
 485  019a 5d            	tnzw	x
 486  019b 2704          	jreq	L65
 487  019d               L06:
 488  019d 48            	sll	a
 489  019e 5a            	decw	x
 490  019f 26fc          	jrne	L06
 491  01a1               L65:
 492  01a1 6b02          	ld	(OFST+0,sp),a
 493                     ; 950   if (NewState != DISABLE)
 494  01a3 7b09          	ld	a,(OFST+7,sp)
 495  01a5 2722          	jreq	L74
 496                     ; 953     if (usartreg == 0x01)
 497  01a7 7b01          	ld	a,(OFST-1,sp)
 498  01a9 a101          	cp	a,#1
 499  01ab 2608          	jrne	L15
 500                     ; 955       USARTx->CR1 |= itpos;
 501  01ad 1e03          	ldw	x,(OFST+1,sp)
 502  01af e604          	ld	a,(4,x)
 503  01b1 1a02          	or	a,(OFST+0,sp)
 505  01b3 2021          	jp	LC002
 506  01b5               L15:
 507                     ; 957     else if (usartreg == 0x05)
 508  01b5 a105          	cp	a,#5
 509  01b7 2608          	jrne	L55
 510                     ; 959       USARTx->CR5 |= itpos;
 511  01b9 1e03          	ldw	x,(OFST+1,sp)
 512  01bb e608          	ld	a,(8,x)
 513  01bd 1a02          	or	a,(OFST+0,sp)
 515  01bf 2024          	jp	LC003
 516  01c1               L55:
 517                     ; 964       USARTx->CR2 |= itpos;
 518  01c1 1e03          	ldw	x,(OFST+1,sp)
 519  01c3 e605          	ld	a,(5,x)
 520  01c5 1a02          	or	a,(OFST+0,sp)
 521  01c7 2027          	jp	LC001
 522  01c9               L74:
 523                     ; 970     if (usartreg == 0x01)
 524  01c9 7b01          	ld	a,(OFST-1,sp)
 525  01cb a101          	cp	a,#1
 526  01cd 260b          	jrne	L36
 527                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
 528  01cf 1e03          	ldw	x,(OFST+1,sp)
 529  01d1 7b02          	ld	a,(OFST+0,sp)
 530  01d3 43            	cpl	a
 531  01d4 e404          	and	a,(4,x)
 532  01d6               LC002:
 533  01d6 e704          	ld	(4,x),a
 535  01d8 2018          	jra	L16
 536  01da               L36:
 537                     ; 974     else if (usartreg == 0x05)
 538  01da a105          	cp	a,#5
 539  01dc 260b          	jrne	L76
 540                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
 541  01de 1e03          	ldw	x,(OFST+1,sp)
 542  01e0 7b02          	ld	a,(OFST+0,sp)
 543  01e2 43            	cpl	a
 544  01e3 e408          	and	a,(8,x)
 545  01e5               LC003:
 546  01e5 e708          	ld	(8,x),a
 548  01e7 2009          	jra	L16
 549  01e9               L76:
 550                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
 551  01e9 1e03          	ldw	x,(OFST+1,sp)
 552  01eb 7b02          	ld	a,(OFST+0,sp)
 553  01ed 43            	cpl	a
 554  01ee e405          	and	a,(5,x)
 555  01f0               LC001:
 556  01f0 e705          	ld	(5,x),a
 557  01f2               L16:
 558                     ; 984 }
 559  01f2 5b04          	addw	sp,#4
 560  01f4 81            	ret	
 562                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
 562                     ; 1003 {
 563  01f5               _USART_GetFlagStatus:
 564  01f5 89            	pushw	x
 565  01f6 88            	push	a
 566       00000001      OFST:	set	1
 568                     ; 1004   FlagStatus status = RESET;
 569                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
 570                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
 571  01f7 1e06          	ldw	x,(OFST+5,sp)
 572  01f9 a30101        	cpw	x,#257
 573  01fc 260a          	jrne	L37
 574                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
 575  01fe 1e02          	ldw	x,(OFST+1,sp)
 576  0200 e605          	ld	a,(5,x)
 577  0202 1507          	bcp	a,(OFST+6,sp)
 578  0204 270d          	jreq	L301
 579                     ; 1014       status = SET;
 581  0206 2007          	jp	LC005
 582                     ; 1019       status = RESET;
 583  0208               L37:
 584                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
 585  0208 1e02          	ldw	x,(OFST+1,sp)
 586  020a f6            	ld	a,(x)
 587  020b 1507          	bcp	a,(OFST+6,sp)
 588  020d 2704          	jreq	L301
 589                     ; 1027       status = SET;
 590  020f               LC005:
 591  020f a601          	ld	a,#1
 593  0211 2001          	jra	L101
 594  0213               L301:
 595                     ; 1032       status = RESET;
 596  0213 4f            	clr	a
 597  0214               L101:
 598                     ; 1036   return status;
 600  0214 5b03          	addw	sp,#3
 601  0216 81            	ret	
 603                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
 603                     ; 1061 {
 604  0217               _USART_ClearFlag:
 605       fffffffe      OFST: set -2
 607                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
 608                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
 609  0217 7b04          	ld	a,(OFST+6,sp)
 610  0219 43            	cpl	a
 611  021a f7            	ld	(x),a
 612                     ; 1066 }
 613  021b 81            	ret	
 615                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
 615                     ; 1084 {
 616  021c               _USART_GetITStatus:
 617  021c 89            	pushw	x
 618  021d 5203          	subw	sp,#3
 619       00000003      OFST:	set	3
 621                     ; 1085   ITStatus pendingbitstatus = RESET;
 622                     ; 1086   uint8_t temp = 0;
 623                     ; 1087   uint8_t itpos = 0;
 624                     ; 1088   uint8_t itmask1 = 0;
 625                     ; 1089   uint8_t itmask2 = 0;
 626                     ; 1090   uint8_t enablestatus = 0;
 627                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
 628                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 629  021f 7b09          	ld	a,(OFST+6,sp)
 630  0221 a40f          	and	a,#15
 631  0223 5f            	clrw	x
 632  0224 97            	ld	xl,a
 633  0225 a601          	ld	a,#1
 634  0227 5d            	tnzw	x
 635  0228 2704          	jreq	L07
 636  022a               L27:
 637  022a 48            	sll	a
 638  022b 5a            	decw	x
 639  022c 26fc          	jrne	L27
 640  022e               L07:
 641  022e 6b02          	ld	(OFST-1,sp),a
 642                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
 643  0230 7b09          	ld	a,(OFST+6,sp)
 644  0232 4e            	swap	a
 645  0233 a40f          	and	a,#15
 646  0235 6b03          	ld	(OFST+0,sp),a
 647                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
 648  0237 5f            	clrw	x
 649  0238 97            	ld	xl,a
 650  0239 a601          	ld	a,#1
 651  023b 5d            	tnzw	x
 652  023c 2704          	jreq	L47
 653  023e               L67:
 654  023e 48            	sll	a
 655  023f 5a            	decw	x
 656  0240 26fc          	jrne	L67
 657  0242               L47:
 658  0242 6b03          	ld	(OFST+0,sp),a
 659                     ; 1103   if (USART_IT == USART_IT_PE)
 660  0244 1e08          	ldw	x,(OFST+5,sp)
 661  0246 a30100        	cpw	x,#256
 662  0249 2611          	jrne	L701
 663                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
 664  024b 1e04          	ldw	x,(OFST+1,sp)
 665  024d e604          	ld	a,(4,x)
 666  024f 1403          	and	a,(OFST+0,sp)
 667  0251 6b03          	ld	(OFST+0,sp),a
 668                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
 669  0253 f6            	ld	a,(x)
 670  0254 1502          	bcp	a,(OFST-1,sp)
 671  0256 2739          	jreq	L131
 673  0258 7b03          	ld	a,(OFST+0,sp)
 674                     ; 1112       pendingbitstatus = SET;
 676  025a 201e          	jp	LC008
 677                     ; 1117       pendingbitstatus = RESET;
 678  025c               L701:
 679                     ; 1121   else if (USART_IT == USART_IT_OR)
 680  025c a30235        	cpw	x,#565
 681  025f 261f          	jrne	L711
 682                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
 683  0261 1e04          	ldw	x,(OFST+1,sp)
 684  0263 e605          	ld	a,(5,x)
 685  0265 1403          	and	a,(OFST+0,sp)
 686  0267 6b03          	ld	(OFST+0,sp),a
 687                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
 688  0269 e608          	ld	a,(8,x)
 689  026b a401          	and	a,#1
 690  026d 6b01          	ld	(OFST-2,sp),a
 691                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
 692  026f f6            	ld	a,(x)
 693  0270 1502          	bcp	a,(OFST-1,sp)
 694  0272 271d          	jreq	L131
 696  0274 7b03          	ld	a,(OFST+0,sp)
 697  0276 2604          	jrne	L321
 699  0278 7b01          	ld	a,(OFST-2,sp)
 700  027a               LC008:
 701  027a 2715          	jreq	L131
 702  027c               L321:
 703                     ; 1132       pendingbitstatus = SET;
 704  027c a601          	ld	a,#1
 706  027e 2012          	jra	L511
 707                     ; 1137       pendingbitstatus = RESET;
 708  0280               L711:
 709                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
 710  0280 1e04          	ldw	x,(OFST+1,sp)
 711  0282 e605          	ld	a,(5,x)
 712  0284 1403          	and	a,(OFST+0,sp)
 713  0286 6b03          	ld	(OFST+0,sp),a
 714                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
 715  0288 f6            	ld	a,(x)
 716  0289 1502          	bcp	a,(OFST-1,sp)
 717  028b 2704          	jreq	L131
 719  028d 7b03          	ld	a,(OFST+0,sp)
 720                     ; 1149       pendingbitstatus = SET;
 722  028f 26eb          	jrne	L321
 723  0291               L131:
 724                     ; 1154       pendingbitstatus = RESET;
 725  0291 4f            	clr	a
 726  0292               L511:
 727                     ; 1159   return  pendingbitstatus;
 729  0292 5b05          	addw	sp,#5
 730  0294 81            	ret	
 732                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
 732                     ; 1184 {
 733  0295               _USART_ClearITPendingBit:
 735                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
 736                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
 737  0295 f6            	ld	a,(x)
 738  0296 a4bf          	and	a,#191
 739  0298 f7            	ld	(x),a
 740                     ; 1189 }
 741  0299 81            	ret	
 743                     	xdef	_USART_ClearITPendingBit
 744                     	xdef	_USART_GetITStatus
 745                     	xdef	_USART_ClearFlag
 746                     	xdef	_USART_GetFlagStatus
 747                     	xdef	_USART_ITConfig
 748                     	xdef	_USART_DMACmd
 749                     	xdef	_USART_IrDACmd
 750                     	xdef	_USART_IrDAConfig
 751                     	xdef	_USART_SetGuardTime
 752                     	xdef	_USART_SmartCardNACKCmd
 753                     	xdef	_USART_SmartCardCmd
 754                     	xdef	_USART_HalfDuplexCmd
 755                     	xdef	_USART_SetAddress
 756                     	xdef	_USART_ReceiverWakeUpCmd
 757                     	xdef	_USART_WakeUpConfig
 758                     	xdef	_USART_ReceiveData9
 759                     	xdef	_USART_ReceiveData8
 760                     	xdef	_USART_SendData9
 761                     	xdef	_USART_SendData8
 762                     	xdef	_USART_SendBreak
 763                     	xdef	_USART_SetPrescaler
 764                     	xdef	_USART_Cmd
 765                     	xdef	_USART_ClockInit
 766                     	xdef	_USART_Init
 767                     	xdef	_USART_DeInit
 768                     	xref	_CLK_GetClockFreq
 769                     	xref.b	c_lreg
 770                     	xref.b	c_x
 771                     	xref	c_lursh
 772                     	xref	c_ltor
 773                     	xref	c_rtol
 774                     	xref	c_ludv
 775                     	end
