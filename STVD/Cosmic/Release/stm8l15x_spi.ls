   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
  17                     ; 129 {
  18                     	scross	off
  19  0000               _SPI_DeInit:
  21                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
  22  0000 7f            	clr	(x)
  23                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
  24  0001 6f01          	clr	(1,x)
  25                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
  26  0003 6f02          	clr	(2,x)
  27                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
  28  0005 a602          	ld	a,#2
  29  0007 e703          	ld	(3,x),a
  30                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
  31  0009 a607          	ld	a,#7
  32  000b e705          	ld	(5,x),a
  33                     ; 135 }
  34  000d 81            	ret	
  36                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
  36                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
  36                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
  36                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
  36                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
  36                     ; 182 {
  37  000e               _SPI_Init:
  38  000e 89            	pushw	x
  39  000f 88            	push	a
  40       00000001      OFST:	set	1
  42                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
  43                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
  44                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
  45                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
  46                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
  47                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
  48                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
  49                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
  50                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
  50                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
  50                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
  50                     ; 197                                   SPI_CPHA));
  51  0010 7b09          	ld	a,(OFST+8,sp)
  52  0012 1a0a          	or	a,(OFST+9,sp)
  53  0014 6b01          	ld	(OFST+0,sp),a
  54  0016 7b06          	ld	a,(OFST+5,sp)
  55  0018 1a07          	or	a,(OFST+6,sp)
  56  001a 1a01          	or	a,(OFST+0,sp)
  57  001c 1e02          	ldw	x,(OFST+1,sp)
  58  001e f7            	ld	(x),a
  59                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
  60  001f 7b0b          	ld	a,(OFST+10,sp)
  61  0021 1a0c          	or	a,(OFST+11,sp)
  62  0023 e701          	ld	(1,x),a
  63                     ; 202   if (SPI_Mode == SPI_Mode_Master)
  64  0025 7b08          	ld	a,(OFST+7,sp)
  65  0027 a104          	cp	a,#4
  66  0029 2606          	jrne	L3
  67                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
  68  002b e601          	ld	a,(1,x)
  69  002d aa01          	or	a,#1
  71  002f 2004          	jra	L5
  72  0031               L3:
  73                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
  74  0031 e601          	ld	a,(1,x)
  75  0033 a4fe          	and	a,#254
  76  0035               L5:
  77  0035 e701          	ld	(1,x),a
  78                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
  79  0037 f6            	ld	a,(x)
  80  0038 1a08          	or	a,(OFST+7,sp)
  81  003a f7            	ld	(x),a
  82                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
  83  003b 7b0d          	ld	a,(OFST+12,sp)
  84  003d e705          	ld	(5,x),a
  85                     ; 216 }
  86  003f 5b03          	addw	sp,#3
  87  0041 81            	ret	
  89                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
  89                     ; 226 {
  90  0042               _SPI_Cmd:
  91       fffffffe      OFST: set -2
  93                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
  94                     ; 230   if (NewState != DISABLE)
  95  0042 7b03          	ld	a,(OFST+5,sp)
  96  0044 2705          	jreq	L7
  97                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
  98  0046 f6            	ld	a,(x)
  99  0047 aa40          	or	a,#64
 101  0049 2003          	jra	L11
 102  004b               L7:
 103                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 104  004b f6            	ld	a,(x)
 105  004c a4bf          	and	a,#191
 106  004e               L11:
 107  004e f7            	ld	(x),a
 108                     ; 238 }
 109  004f 81            	ret	
 111                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 111                     ; 248 {
 112  0050               _SPI_NSSInternalSoftwareCmd:
 113       fffffffe      OFST: set -2
 115                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 116                     ; 252   if (NewState != DISABLE)
 117  0050 7b03          	ld	a,(OFST+5,sp)
 118  0052 2706          	jreq	L31
 119                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 120  0054 e601          	ld	a,(1,x)
 121  0056 aa01          	or	a,#1
 123  0058 2004          	jra	L51
 124  005a               L31:
 125                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 126  005a e601          	ld	a,(1,x)
 127  005c a4fe          	and	a,#254
 128  005e               L51:
 129  005e e701          	ld	(1,x),a
 130                     ; 260 }
 131  0060 81            	ret	
 133                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 133                     ; 272 {
 134  0061               _SPI_BiDirectionalLineConfig:
 135       fffffffe      OFST: set -2
 137                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 138                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 139  0061 7b03          	ld	a,(OFST+5,sp)
 140  0063 2706          	jreq	L71
 141                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 142  0065 e601          	ld	a,(1,x)
 143  0067 aa40          	or	a,#64
 145  0069 2004          	jra	L12
 146  006b               L71:
 147                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 148  006b e601          	ld	a,(1,x)
 149  006d a4bf          	and	a,#191
 150  006f               L12:
 151  006f e701          	ld	(1,x),a
 152                     ; 284 }
 153  0071 81            	ret	
 155                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 155                     ; 320 {
 156  0072               _SPI_SendData:
 157       fffffffe      OFST: set -2
 159                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 160  0072 7b03          	ld	a,(OFST+5,sp)
 161  0074 e704          	ld	(4,x),a
 162                     ; 322 }
 163  0076 81            	ret	
 165                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 165                     ; 330 {
 166  0077               _SPI_ReceiveData:
 168                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 169  0077 e604          	ld	a,(4,x)
 171  0079 81            	ret	
 173                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 173                     ; 415 {
 174  007a               _SPI_TransmitCRC:
 176                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 177  007a e601          	ld	a,(1,x)
 178  007c aa10          	or	a,#16
 179  007e e701          	ld	(1,x),a
 180                     ; 417 }
 181  0080 81            	ret	
 183                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 183                     ; 427 {
 184  0081               _SPI_CalculateCRCCmd:
 185  0081 89            	pushw	x
 186       00000000      OFST:	set	0
 188                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 189                     ; 432   SPI_Cmd(SPI1, DISABLE);
 190  0082 4b00          	push	#0
 191  0084 ae5200        	ldw	x,#20992
 192  0087 adb9          	call	_SPI_Cmd
 194  0089 84            	pop	a
 195                     ; 434   if (NewState != DISABLE)
 196  008a 7b05          	ld	a,(OFST+5,sp)
 197  008c 2708          	jreq	L32
 198                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 199  008e 1e01          	ldw	x,(OFST+1,sp)
 200  0090 e601          	ld	a,(1,x)
 201  0092 aa20          	or	a,#32
 203  0094 2006          	jra	L52
 204  0096               L32:
 205                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 206  0096 1e01          	ldw	x,(OFST+1,sp)
 207  0098 e601          	ld	a,(1,x)
 208  009a a4df          	and	a,#223
 209  009c               L52:
 210  009c e701          	ld	(1,x),a
 211                     ; 442 }
 212  009e 85            	popw	x
 213  009f 81            	ret	
 215                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
 215                     ; 454 {
 216  00a0               _SPI_GetCRC:
 217       fffffffe      OFST: set -2
 219                     ; 455   uint8_t crcreg = 0;
 220                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
 221                     ; 460   if (SPI_CRC != SPI_CRC_RX)
 222  00a0 7b03          	ld	a,(OFST+5,sp)
 223  00a2 2703          	jreq	L72
 224                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
 225  00a4 e607          	ld	a,(7,x)
 227  00a6 81            	ret	
 228  00a7               L72:
 229                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
 230  00a7 e606          	ld	a,(6,x)
 231                     ; 470   return crcreg;
 233  00a9 81            	ret	
 235                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
 235                     ; 479 {
 236  00aa               _SPI_ResetCRC:
 237  00aa 89            	pushw	x
 238       00000000      OFST:	set	0
 240                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
 241  00ab 4b01          	push	#1
 242  00ad add2          	call	_SPI_CalculateCRCCmd
 244  00af 84            	pop	a
 245                     ; 485   SPI_Cmd(SPIx, ENABLE);
 246  00b0 4b01          	push	#1
 247  00b2 1e02          	ldw	x,(OFST+2,sp)
 248  00b4 ad8c          	call	_SPI_Cmd
 250                     ; 486 }
 251  00b6 5b03          	addw	sp,#3
 252  00b8 81            	ret	
 254                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
 254                     ; 494 {
 255  00b9               _SPI_GetCRCPolynomial:
 257                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
 258  00b9 e605          	ld	a,(5,x)
 260  00bb 81            	ret	
 262                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
 262                     ; 526 {
 263  00bc               _SPI_DMACmd:
 264       fffffffe      OFST: set -2
 266                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
 267                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
 268                     ; 531   if (NewState != DISABLE)
 269  00bc 7b04          	ld	a,(OFST+6,sp)
 270  00be 2706          	jreq	L33
 271                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
 272  00c0 e602          	ld	a,(2,x)
 273  00c2 1a03          	or	a,(OFST+5,sp)
 275  00c4 2005          	jra	L53
 276  00c6               L33:
 277                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
 278  00c6 7b03          	ld	a,(OFST+5,sp)
 279  00c8 43            	cpl	a
 280  00c9 e402          	and	a,(2,x)
 281  00cb               L53:
 282  00cb e702          	ld	(2,x),a
 283                     ; 541 }
 284  00cd 81            	ret	
 286                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 286                     ; 627 {
 287  00ce               _SPI_ITConfig:
 288  00ce 89            	pushw	x
 289  00cf 88            	push	a
 290       00000001      OFST:	set	1
 292                     ; 628   uint8_t itpos = 0;
 293                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
 294                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
 295                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 296  00d0 7b06          	ld	a,(OFST+5,sp)
 297  00d2 a40f          	and	a,#15
 298  00d4 5f            	clrw	x
 299  00d5 97            	ld	xl,a
 300  00d6 a601          	ld	a,#1
 301  00d8 5d            	tnzw	x
 302  00d9 2704          	jreq	L44
 303  00db               L64:
 304  00db 48            	sll	a
 305  00dc 5a            	decw	x
 306  00dd 26fc          	jrne	L64
 307  00df               L44:
 308  00df 6b01          	ld	(OFST+0,sp),a
 309                     ; 636   if (NewState != DISABLE)
 310  00e1 0d07          	tnz	(OFST+6,sp)
 311  00e3 2708          	jreq	L73
 312                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
 313  00e5 1e02          	ldw	x,(OFST+1,sp)
 314  00e7 e602          	ld	a,(2,x)
 315  00e9 1a01          	or	a,(OFST+0,sp)
 317  00eb 2005          	jra	L14
 318  00ed               L73:
 319                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
 320  00ed 1e02          	ldw	x,(OFST+1,sp)
 321  00ef 43            	cpl	a
 322  00f0 e402          	and	a,(2,x)
 323  00f2               L14:
 324  00f2 e702          	ld	(2,x),a
 325                     ; 644 }
 326  00f4 5b03          	addw	sp,#3
 327  00f6 81            	ret	
 329                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
 329                     ; 662 {
 330  00f7               _SPI_GetFlagStatus:
 331       fffffffe      OFST: set -2
 333                     ; 663   FlagStatus status = RESET;
 334                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
 335                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
 336  00f7 e603          	ld	a,(3,x)
 337  00f9 1503          	bcp	a,(OFST+5,sp)
 338  00fb 2703          	jreq	L34
 339                     ; 670     status = SET; /* SPI_FLAG is set */
 340  00fd a601          	ld	a,#1
 342  00ff 81            	ret	
 343  0100               L34:
 344                     ; 674     status = RESET; /* SPI_FLAG is reset*/
 345  0100 4f            	clr	a
 346                     ; 678   return status;
 348  0101 81            	ret	
 350                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
 350                     ; 697 {
 351  0102               _SPI_ClearFlag:
 352       fffffffe      OFST: set -2
 354                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
 355                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
 356  0102 7b03          	ld	a,(OFST+5,sp)
 357  0104 43            	cpl	a
 358  0105 e703          	ld	(3,x),a
 359                     ; 701 }
 360  0107 81            	ret	
 362                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
 362                     ; 718 {
 363  0108               _SPI_GetITStatus:
 364  0108 89            	pushw	x
 365  0109 5203          	subw	sp,#3
 366       00000003      OFST:	set	3
 368                     ; 719   ITStatus pendingbitstatus = RESET;
 369                     ; 720   uint8_t itpos = 0;
 370                     ; 721   uint8_t itmask1 = 0;
 371                     ; 722   uint8_t itmask2 = 0;
 372                     ; 723   __IO uint8_t enablestatus = 0;
 373  010b 0f02          	clr	(OFST-1,sp)
 374                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
 375                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
 376  010d 7b08          	ld	a,(OFST+5,sp)
 377  010f a40f          	and	a,#15
 378  0111 5f            	clrw	x
 379  0112 97            	ld	xl,a
 380  0113 a601          	ld	a,#1
 381  0115 5d            	tnzw	x
 382  0116 2704          	jreq	L65
 383  0118               L06:
 384  0118 48            	sll	a
 385  0119 5a            	decw	x
 386  011a 26fc          	jrne	L06
 387  011c               L65:
 388  011c 6b01          	ld	(OFST-2,sp),a
 389                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
 390  011e 7b08          	ld	a,(OFST+5,sp)
 391  0120 4e            	swap	a
 392  0121 a40f          	and	a,#15
 393  0123 6b03          	ld	(OFST+0,sp),a
 394                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
 395  0125 5f            	clrw	x
 396  0126 97            	ld	xl,a
 397  0127 a601          	ld	a,#1
 398  0129 5d            	tnzw	x
 399  012a 2704          	jreq	L26
 400  012c               L46:
 401  012c 48            	sll	a
 402  012d 5a            	decw	x
 403  012e 26fc          	jrne	L46
 404  0130               L26:
 405  0130 6b03          	ld	(OFST+0,sp),a
 406                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
 407  0132 1e04          	ldw	x,(OFST+1,sp)
 408  0134 e603          	ld	a,(3,x)
 409  0136 1403          	and	a,(OFST+0,sp)
 410  0138 6b02          	ld	(OFST-1,sp),a
 411                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
 412  013a e602          	ld	a,(2,x)
 413  013c 1501          	bcp	a,(OFST-2,sp)
 414  013e 2708          	jreq	L74
 416  0140 0d02          	tnz	(OFST-1,sp)
 417  0142 2704          	jreq	L74
 418                     ; 738     pendingbitstatus = SET;
 419  0144 a601          	ld	a,#1
 421  0146 2001          	jra	L15
 422  0148               L74:
 423                     ; 743     pendingbitstatus = RESET;
 424  0148 4f            	clr	a
 425  0149               L15:
 426                     ; 746   return  pendingbitstatus;
 428  0149 5b05          	addw	sp,#5
 429  014b 81            	ret	
 431                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
 431                     ; 765 {
 432  014c               _SPI_ClearITPendingBit:
 433  014c 89            	pushw	x
 434  014d 88            	push	a
 435       00000001      OFST:	set	1
 437                     ; 766   uint8_t itpos = 0;
 438                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
 439                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
 440  014e 7b06          	ld	a,(OFST+5,sp)
 441  0150 4e            	swap	a
 442  0151 a40f          	and	a,#15
 443  0153 5f            	clrw	x
 444  0154 97            	ld	xl,a
 445  0155 a601          	ld	a,#1
 446  0157 5d            	tnzw	x
 447  0158 2704          	jreq	L07
 448  015a               L27:
 449  015a 48            	sll	a
 450  015b 5a            	decw	x
 451  015c 26fc          	jrne	L27
 452  015e               L07:
 453  015e 6b01          	ld	(OFST+0,sp),a
 454                     ; 774   SPIx->SR = (uint8_t)(~itpos);
 455  0160 43            	cpl	a
 456  0161 1e02          	ldw	x,(OFST+1,sp)
 457  0163 e703          	ld	(3,x),a
 458                     ; 776 }
 459  0165 5b03          	addw	sp,#3
 460  0167 81            	ret	
 462                     	xdef	_SPI_ClearITPendingBit
 463                     	xdef	_SPI_GetITStatus
 464                     	xdef	_SPI_ClearFlag
 465                     	xdef	_SPI_GetFlagStatus
 466                     	xdef	_SPI_ITConfig
 467                     	xdef	_SPI_DMACmd
 468                     	xdef	_SPI_GetCRCPolynomial
 469                     	xdef	_SPI_ResetCRC
 470                     	xdef	_SPI_GetCRC
 471                     	xdef	_SPI_CalculateCRCCmd
 472                     	xdef	_SPI_TransmitCRC
 473                     	xdef	_SPI_ReceiveData
 474                     	xdef	_SPI_SendData
 475                     	xdef	_SPI_BiDirectionalLineConfig
 476                     	xdef	_SPI_NSSInternalSoftwareCmd
 477                     	xdef	_SPI_Cmd
 478                     	xdef	_SPI_Init
 479                     	xdef	_SPI_DeInit
 480                     	end
