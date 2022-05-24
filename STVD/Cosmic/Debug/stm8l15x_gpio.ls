   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
 116                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 116                     ; 97 {
 118                     .text:	section	.text,new
 119  0000               _GPIO_DeInit:
 123                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 125  0000 6f04          	clr	(4,x)
 126                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 128  0002 7f            	clr	(x)
 129                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 131  0003 6f02          	clr	(2,x)
 132                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 134  0005 6f03          	clr	(3,x)
 135                     ; 102 }
 138  0007 81            	ret	
 292                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 292                     ; 134 {
 293                     .text:	section	.text,new
 294  0000               _GPIO_Init:
 296  0000 89            	pushw	x
 297       00000000      OFST:	set	0
 300                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 302                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 304                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 306  0001 7b05          	ld	a,(OFST+5,sp)
 307  0003 43            	cpl	a
 308  0004 e404          	and	a,(4,x)
 309  0006 e704          	ld	(4,x),a
 310                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 312  0008 7b06          	ld	a,(OFST+6,sp)
 313  000a 2a16          	jrpl	L341
 314                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 316  000c a510          	bcp	a,#16
 317  000e 2705          	jreq	L541
 318                     ; 153       GPIOx->ODR |= GPIO_Pin;
 320  0010 f6            	ld	a,(x)
 321  0011 1a05          	or	a,(OFST+5,sp)
 323  0013 2004          	jra	L741
 324  0015               L541:
 325                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 327  0015 7b05          	ld	a,(OFST+5,sp)
 328  0017 43            	cpl	a
 329  0018 f4            	and	a,(x)
 330  0019               L741:
 331  0019 f7            	ld	(x),a
 332                     ; 159     GPIOx->DDR |= GPIO_Pin;
 334  001a 1e01          	ldw	x,(OFST+1,sp)
 335  001c e602          	ld	a,(2,x)
 336  001e 1a05          	or	a,(OFST+5,sp)
 338  0020 2005          	jra	L151
 339  0022               L341:
 340                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 342  0022 7b05          	ld	a,(OFST+5,sp)
 343  0024 43            	cpl	a
 344  0025 e402          	and	a,(2,x)
 345  0027               L151:
 346  0027 e702          	ld	(2,x),a
 347                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 349  0029 7b06          	ld	a,(OFST+6,sp)
 350  002b a540          	bcp	a,#64
 351  002d 2706          	jreq	L351
 352                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 354  002f e603          	ld	a,(3,x)
 355  0031 1a05          	or	a,(OFST+5,sp)
 357  0033 2005          	jra	L551
 358  0035               L351:
 359                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 361  0035 7b05          	ld	a,(OFST+5,sp)
 362  0037 43            	cpl	a
 363  0038 e403          	and	a,(3,x)
 364  003a               L551:
 365  003a e703          	ld	(3,x),a
 366                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 368  003c 7b06          	ld	a,(OFST+6,sp)
 369  003e a520          	bcp	a,#32
 370  0040 2706          	jreq	L751
 371                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 373  0042 e604          	ld	a,(4,x)
 374  0044 1a05          	or	a,(OFST+5,sp)
 376  0046 2005          	jra	L161
 377  0048               L751:
 378                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 380  0048 7b05          	ld	a,(OFST+5,sp)
 381  004a 43            	cpl	a
 382  004b e404          	and	a,(4,x)
 383  004d               L161:
 384  004d e704          	ld	(4,x),a
 385                     ; 190 }
 388  004f 85            	popw	x
 389  0050 81            	ret	
 464                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 464                     ; 210 {
 465                     .text:	section	.text,new
 466  0000               _GPIO_ExternalPullUpConfig:
 468       fffffffe      OFST: set -2
 471                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 473                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 475                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 477  0000 7b04          	ld	a,(OFST+6,sp)
 478  0002 2706          	jreq	L122
 479                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 481  0004 e603          	ld	a,(3,x)
 482  0006 1a03          	or	a,(OFST+5,sp)
 484  0008 2005          	jra	L322
 485  000a               L122:
 486                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 488  000a 7b03          	ld	a,(OFST+5,sp)
 489  000c 43            	cpl	a
 490  000d e403          	and	a,(3,x)
 491  000f               L322:
 492  000f e703          	ld	(3,x),a
 493                     ; 222 }
 496  0011 81            	ret	
 540                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 540                     ; 249 {
 541                     .text:	section	.text,new
 542  0000               _GPIO_Write:
 544       fffffffe      OFST: set -2
 547                     ; 250   GPIOx->ODR = GPIO_PortVal;
 549  0000 7b03          	ld	a,(OFST+5,sp)
 550  0002 f7            	ld	(x),a
 551                     ; 251 }
 554  0003 81            	ret	
 714                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 714                     ; 271 {
 715                     .text:	section	.text,new
 716  0000               _GPIO_WriteBit:
 718       fffffffe      OFST: set -2
 721                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 723                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 725                     ; 276   if (GPIO_BitVal != RESET)
 727  0000 7b04          	ld	a,(OFST+6,sp)
 728  0002 2705          	jreq	L143
 729                     ; 278     GPIOx->ODR |= GPIO_Pin;
 731  0004 f6            	ld	a,(x)
 732  0005 1a03          	or	a,(OFST+5,sp)
 734  0007 2004          	jra	L343
 735  0009               L143:
 736                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 738  0009 7b03          	ld	a,(OFST+5,sp)
 739  000b 43            	cpl	a
 740  000c f4            	and	a,(x)
 741  000d               L343:
 742  000d f7            	ld	(x),a
 743                     ; 285 }
 746  000e 81            	ret	
 790                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 790                     ; 304 {
 791                     .text:	section	.text,new
 792  0000               _GPIO_SetBits:
 794       fffffffe      OFST: set -2
 797                     ; 305   GPIOx->ODR |= GPIO_Pin;
 799  0000 f6            	ld	a,(x)
 800  0001 1a03          	or	a,(OFST+5,sp)
 801  0003 f7            	ld	(x),a
 802                     ; 306 }
 805  0004 81            	ret	
 849                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 849                     ; 325 {
 850                     .text:	section	.text,new
 851  0000               _GPIO_ResetBits:
 853       fffffffe      OFST: set -2
 856                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 858  0000 7b03          	ld	a,(OFST+5,sp)
 859  0002 43            	cpl	a
 860  0003 f4            	and	a,(x)
 861  0004 f7            	ld	(x),a
 862                     ; 327 }
 865  0005 81            	ret	
 909                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 909                     ; 337 {
 910                     .text:	section	.text,new
 911  0000               _GPIO_ToggleBits:
 913       fffffffe      OFST: set -2
 916                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 918  0000 f6            	ld	a,(x)
 919  0001 1803          	xor	a,(OFST+5,sp)
 920  0003 f7            	ld	(x),a
 921                     ; 339 }
 924  0004 81            	ret	
 961                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 961                     ; 348 {
 962                     .text:	section	.text,new
 963  0000               _GPIO_ReadInputData:
 967                     ; 349   return ((uint8_t)GPIOx->IDR);
 969  0000 e601          	ld	a,(1,x)
 972  0002 81            	ret	
1010                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1010                     ; 359 {
1011                     .text:	section	.text,new
1012  0000               _GPIO_ReadOutputData:
1016                     ; 360   return ((uint8_t)GPIOx->ODR);
1018  0000 f6            	ld	a,(x)
1021  0001 81            	ret	
1070                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1070                     ; 379 {
1071                     .text:	section	.text,new
1072  0000               _GPIO_ReadInputDataBit:
1074       fffffffe      OFST: set -2
1077                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1079  0000 e601          	ld	a,(1,x)
1080  0002 1403          	and	a,(OFST+5,sp)
1083  0004 81            	ret	
1132                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1132                     ; 390 {
1133                     .text:	section	.text,new
1134  0000               _GPIO_ReadOutputDataBit:
1136       fffffffe      OFST: set -2
1139                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1141  0000 f6            	ld	a,(x)
1142  0001 1403          	and	a,(OFST+5,sp)
1145  0003 81            	ret	
1158                     	xdef	_GPIO_ReadOutputDataBit
1159                     	xdef	_GPIO_ReadInputDataBit
1160                     	xdef	_GPIO_ReadOutputData
1161                     	xdef	_GPIO_ReadInputData
1162                     	xdef	_GPIO_ToggleBits
1163                     	xdef	_GPIO_ResetBits
1164                     	xdef	_GPIO_SetBits
1165                     	xdef	_GPIO_WriteBit
1166                     	xdef	_GPIO_Write
1167                     	xdef	_GPIO_ExternalPullUpConfig
1168                     	xdef	_GPIO_Init
1169                     	xdef	_GPIO_DeInit
1188                     	end
