   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
 170                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 170                     ; 149 {
 172                     .text:	section	.text,new
 173  0000               _USART_DeInit:
 177                     ; 153   (void) USARTx->SR;
 179  0000 f6            	ld	a,(x)
 180                     ; 154   (void) USARTx->DR;
 182  0001 e601          	ld	a,(1,x)
 183                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 185  0003 6f03          	clr	(3,x)
 186                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 188  0005 6f02          	clr	(2,x)
 189                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 191  0007 6f04          	clr	(4,x)
 192                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 194  0009 6f05          	clr	(5,x)
 195                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 197  000b 6f06          	clr	(6,x)
 198                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 200  000d 6f07          	clr	(7,x)
 201                     ; 163 }
 204  000f 81            	ret	
 392                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 392                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 392                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 392                     ; 195 {
 393                     .text:	section	.text,new
 394  0000               _USART_Init:
 396  0000 89            	pushw	x
 397  0001 5204          	subw	sp,#4
 398       00000004      OFST:	set	4
 401                     ; 196   uint32_t BaudRate_Mantissa = 0;
 403                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 405                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 407                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 409                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 411                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 413                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 415  0003 e604          	ld	a,(4,x)
 416  0005 a4e9          	and	a,#233
 417  0007 e704          	ld	(4,x),a
 418                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 420  0009 7b0d          	ld	a,(OFST+9,sp)
 421  000b 1a0f          	or	a,(OFST+11,sp)
 422  000d ea04          	or	a,(4,x)
 423  000f e704          	ld	(4,x),a
 424                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 426  0011 e606          	ld	a,(6,x)
 427  0013 a4cf          	and	a,#207
 428  0015 e706          	ld	(6,x),a
 429                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 431  0017 e606          	ld	a,(6,x)
 432  0019 1a0e          	or	a,(OFST+10,sp)
 433  001b e706          	ld	(6,x),a
 434                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 436  001d 6f02          	clr	(2,x)
 437                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 439  001f e603          	ld	a,(3,x)
 440  0021 a40f          	and	a,#15
 441  0023 e703          	ld	(3,x),a
 442                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 444  0025 e603          	ld	a,(3,x)
 445  0027 a4f0          	and	a,#240
 446  0029 e703          	ld	(3,x),a
 447                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 449  002b cd0000        	call	_CLK_GetClockFreq
 451  002e 96            	ldw	x,sp
 452  002f 1c0009        	addw	x,#OFST+5
 453  0032 cd0000        	call	c_ludv
 455  0035 96            	ldw	x,sp
 456  0036 5c            	incw	x
 457  0037 cd0000        	call	c_rtol
 460                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 462  003a 7b03          	ld	a,(OFST-1,sp)
 463  003c a4f0          	and	a,#240
 464  003e 1e05          	ldw	x,(OFST+1,sp)
 465  0040 e703          	ld	(3,x),a
 466                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 468  0042 7b04          	ld	a,(OFST+0,sp)
 469  0044 a40f          	and	a,#15
 470  0046 ea03          	or	a,(3,x)
 471  0048 e703          	ld	(3,x),a
 472                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 474  004a 96            	ldw	x,sp
 475  004b 5c            	incw	x
 476  004c cd0000        	call	c_ltor
 478  004f a604          	ld	a,#4
 479  0051 cd0000        	call	c_lursh
 481  0054 b603          	ld	a,c_lreg+3
 482  0056 1e05          	ldw	x,(OFST+1,sp)
 483  0058 e702          	ld	(2,x),a
 484                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 486  005a e605          	ld	a,(5,x)
 487  005c a4f3          	and	a,#243
 488  005e e705          	ld	(5,x),a
 489                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 491  0060 e605          	ld	a,(5,x)
 492  0062 1a10          	or	a,(OFST+12,sp)
 493  0064 e705          	ld	(5,x),a
 494                     ; 239 }
 497  0066 5b06          	addw	sp,#6
 498  0068 81            	ret	
 658                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 658                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 658                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 658                     ; 267 {
 659                     .text:	section	.text,new
 660  0000               _USART_ClockInit:
 662       fffffffe      OFST: set -2
 665                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 667                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 669                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 671                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 673                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 675  0000 e606          	ld	a,(6,x)
 676  0002 a4f8          	and	a,#248
 677  0004 e706          	ld	(6,x),a
 678                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 680  0006 7b04          	ld	a,(OFST+6,sp)
 681  0008 1a05          	or	a,(OFST+7,sp)
 682  000a 1a06          	or	a,(OFST+8,sp)
 683  000c ea06          	or	a,(6,x)
 684  000e e706          	ld	(6,x),a
 685                     ; 279   if (USART_Clock != USART_Clock_Disable)
 687  0010 7b03          	ld	a,(OFST+5,sp)
 688  0012 2706          	jreq	L123
 689                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 691  0014 e606          	ld	a,(6,x)
 692  0016 aa08          	or	a,#8
 694  0018 2004          	jra	L323
 695  001a               L123:
 696                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 698  001a e606          	ld	a,(6,x)
 699  001c a4f7          	and	a,#247
 700  001e               L323:
 701  001e e706          	ld	(6,x),a
 702                     ; 287 }
 705  0020 81            	ret	
 772                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 772                     ; 297 {
 773                     .text:	section	.text,new
 774  0000               _USART_Cmd:
 776       fffffffe      OFST: set -2
 779                     ; 298   if (NewState != DISABLE)
 781  0000 7b03          	ld	a,(OFST+5,sp)
 782  0002 2706          	jreq	L163
 783                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 785  0004 e604          	ld	a,(4,x)
 786  0006 a4df          	and	a,#223
 788  0008 2004          	jra	L363
 789  000a               L163:
 790                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 792  000a e604          	ld	a,(4,x)
 793  000c aa20          	or	a,#32
 794  000e               L363:
 795  000e e704          	ld	(4,x),a
 796                     ; 306 }
 799  0010 81            	ret	
 843                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 843                     ; 330 {
 844                     .text:	section	.text,new
 845  0000               _USART_SetPrescaler:
 847       fffffffe      OFST: set -2
 850                     ; 332   USARTx->PSCR = USART_Prescaler;
 852  0000 7b03          	ld	a,(OFST+5,sp)
 853  0002 e70a          	ld	(10,x),a
 854                     ; 333 }
 857  0004 81            	ret	
 894                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 894                     ; 341 {
 895                     .text:	section	.text,new
 896  0000               _USART_SendBreak:
 900                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 902  0000 e605          	ld	a,(5,x)
 903  0002 aa01          	or	a,#1
 904  0004 e705          	ld	(5,x),a
 905                     ; 343 }
 908  0006 81            	ret	
 945                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 945                     ; 383 {
 946                     .text:	section	.text,new
 947  0000               _USART_ReceiveData8:
 951                     ; 384   return USARTx->DR;
 953  0000 e601          	ld	a,(1,x)
 956  0002 81            	ret	
1000                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1000                     ; 393 {
1001                     .text:	section	.text,new
1002  0000               _USART_ReceiveData9:
1004  0000 89            	pushw	x
1005  0001 89            	pushw	x
1006       00000002      OFST:	set	2
1009                     ; 394   uint16_t temp = 0;
1011                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1013  0002 e604          	ld	a,(4,x)
1014  0004 a480          	and	a,#128
1015  0006 5f            	clrw	x
1016  0007 02            	rlwa	x,a
1017  0008 58            	sllw	x
1018  0009 1f01          	ldw	(OFST-1,sp),x
1020                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1022  000b 1e03          	ldw	x,(OFST+1,sp)
1023  000d e601          	ld	a,(1,x)
1024  000f 5f            	clrw	x
1025  0010 97            	ld	xl,a
1026  0011 01            	rrwa	x,a
1027  0012 1a02          	or	a,(OFST+0,sp)
1028  0014 01            	rrwa	x,a
1029  0015 1a01          	or	a,(OFST-1,sp)
1030  0017 a401          	and	a,#1
1031  0019 01            	rrwa	x,a
1034  001a 5b04          	addw	sp,#4
1035  001c 81            	ret	
1079                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1079                     ; 406 {
1080                     .text:	section	.text,new
1081  0000               _USART_SendData8:
1083       fffffffe      OFST: set -2
1086                     ; 408   USARTx->DR = Data;
1088  0000 7b03          	ld	a,(OFST+5,sp)
1089  0002 e701          	ld	(1,x),a
1090                     ; 409 }
1093  0004 81            	ret	
1137                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1137                     ; 419 {
1138                     .text:	section	.text,new
1139  0000               _USART_SendData9:
1141       fffffffe      OFST: set -2
1144                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1146                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1148  0000 e604          	ld	a,(4,x)
1149  0002 a4bf          	and	a,#191
1150  0004 e704          	ld	(4,x),a
1151                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1153  0006 1603          	ldw	y,(OFST+5,sp)
1154  0008 9054          	srlw	y
1155  000a 9054          	srlw	y
1156  000c 909f          	ld	a,yl
1157  000e a440          	and	a,#64
1158  0010 ea04          	or	a,(4,x)
1159  0012 e704          	ld	(4,x),a
1160                     ; 429   USARTx->DR   = (uint8_t)(Data);
1162  0014 7b04          	ld	a,(OFST+6,sp)
1163  0016 e701          	ld	(1,x),a
1164                     ; 430 }
1167  0018 81            	ret	
1215                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1215                     ; 474 {
1216                     .text:	section	.text,new
1217  0000               _USART_ReceiverWakeUpCmd:
1219       fffffffe      OFST: set -2
1222                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1224                     ; 477   if (NewState != DISABLE)
1226  0000 7b03          	ld	a,(OFST+5,sp)
1227  0002 2706          	jreq	L165
1228                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1230  0004 e605          	ld	a,(5,x)
1231  0006 aa02          	or	a,#2
1233  0008 2004          	jra	L365
1234  000a               L165:
1235                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1237  000a e605          	ld	a,(5,x)
1238  000c a4fd          	and	a,#253
1239  000e               L365:
1240  000e e705          	ld	(5,x),a
1241                     ; 487 }
1244  0010 81            	ret	
1288                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1288                     ; 497 {
1289                     .text:	section	.text,new
1290  0000               _USART_SetAddress:
1292       fffffffe      OFST: set -2
1295                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1297                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1299  0000 e607          	ld	a,(7,x)
1300  0002 a4f0          	and	a,#240
1301  0004 e707          	ld	(7,x),a
1302                     ; 504   USARTx->CR4 |= USART_Address;
1304  0006 e607          	ld	a,(7,x)
1305  0008 1a03          	or	a,(OFST+5,sp)
1306  000a e707          	ld	(7,x),a
1307                     ; 505 }
1310  000c 81            	ret	
1379                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1379                     ; 516 {
1380                     .text:	section	.text,new
1381  0000               _USART_WakeUpConfig:
1383       fffffffe      OFST: set -2
1386                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1388                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1390  0000 e604          	ld	a,(4,x)
1391  0002 a4f7          	and	a,#247
1392  0004 e704          	ld	(4,x),a
1393                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1395  0006 e604          	ld	a,(4,x)
1396  0008 1a03          	or	a,(OFST+5,sp)
1397  000a e704          	ld	(4,x),a
1398                     ; 521 }
1401  000c 81            	ret	
1449                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1449                     ; 567 {
1450                     .text:	section	.text,new
1451  0000               _USART_HalfDuplexCmd:
1453       fffffffe      OFST: set -2
1456                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1458                     ; 570   if (NewState != DISABLE)
1460  0000 7b03          	ld	a,(OFST+5,sp)
1461  0002 2706          	jreq	L766
1462                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1464  0004 e608          	ld	a,(8,x)
1465  0006 aa08          	or	a,#8
1467  0008 2004          	jra	L176
1468  000a               L766:
1469                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1471  000a e608          	ld	a,(8,x)
1472  000c a4f7          	and	a,#247
1473  000e               L176:
1474  000e e708          	ld	(8,x),a
1475                     ; 578 }
1478  0010 81            	ret	
1525                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1525                     ; 645 {
1526                     .text:	section	.text,new
1527  0000               _USART_SmartCardCmd:
1529       fffffffe      OFST: set -2
1532                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1534                     ; 648   if (NewState != DISABLE)
1536  0000 7b03          	ld	a,(OFST+5,sp)
1537  0002 2706          	jreq	L717
1538                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1540  0004 e608          	ld	a,(8,x)
1541  0006 aa20          	or	a,#32
1543  0008 2004          	jra	L127
1544  000a               L717:
1545                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1547  000a e608          	ld	a,(8,x)
1548  000c a4df          	and	a,#223
1549  000e               L127:
1550  000e e708          	ld	(8,x),a
1551                     ; 658 }
1554  0010 81            	ret	
1602                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1602                     ; 668 {
1603                     .text:	section	.text,new
1604  0000               _USART_SmartCardNACKCmd:
1606       fffffffe      OFST: set -2
1609                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1611                     ; 671   if (NewState != DISABLE)
1613  0000 7b03          	ld	a,(OFST+5,sp)
1614  0002 2706          	jreq	L747
1615                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1617  0004 e608          	ld	a,(8,x)
1618  0006 aa10          	or	a,#16
1620  0008 2004          	jra	L157
1621  000a               L747:
1622                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1624  000a e608          	ld	a,(8,x)
1625  000c a4ef          	and	a,#239
1626  000e               L157:
1627  000e e708          	ld	(8,x),a
1628                     ; 681 }
1631  0010 81            	ret	
1675                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1675                     ; 691 {
1676                     .text:	section	.text,new
1677  0000               _USART_SetGuardTime:
1679       fffffffe      OFST: set -2
1682                     ; 693   USARTx->GTR = USART_GuardTime;
1684  0000 7b03          	ld	a,(OFST+5,sp)
1685  0002 e709          	ld	(9,x),a
1686                     ; 694 }
1689  0004 81            	ret	
1758                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1758                     ; 752 {
1759                     .text:	section	.text,new
1760  0000               _USART_IrDAConfig:
1762       fffffffe      OFST: set -2
1765                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1767                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1769  0000 7b03          	ld	a,(OFST+5,sp)
1770  0002 2706          	jreq	L1301
1771                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1773  0004 e608          	ld	a,(8,x)
1774  0006 aa04          	or	a,#4
1776  0008 2004          	jra	L3301
1777  000a               L1301:
1778                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1780  000a e608          	ld	a,(8,x)
1781  000c a4fb          	and	a,#251
1782  000e               L3301:
1783  000e e708          	ld	(8,x),a
1784                     ; 763 }
1787  0010 81            	ret	
1834                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1834                     ; 773 {
1835                     .text:	section	.text,new
1836  0000               _USART_IrDACmd:
1838       fffffffe      OFST: set -2
1841                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1843                     ; 778   if (NewState != DISABLE)
1845  0000 7b03          	ld	a,(OFST+5,sp)
1846  0002 2706          	jreq	L1601
1847                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1849  0004 e608          	ld	a,(8,x)
1850  0006 aa02          	or	a,#2
1852  0008 2004          	jra	L3601
1853  000a               L1601:
1854                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1856  000a e608          	ld	a,(8,x)
1857  000c a4fd          	and	a,#253
1858  000e               L3601:
1859  000e e708          	ld	(8,x),a
1860                     ; 788 }
1863  0010 81            	ret	
1940                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1940                     ; 819                   FunctionalState NewState)
1940                     ; 820 {
1941                     .text:	section	.text,new
1942  0000               _USART_DMACmd:
1944       fffffffe      OFST: set -2
1947                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1949                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
1951                     ; 825   if (NewState != DISABLE)
1953  0000 7b04          	ld	a,(OFST+6,sp)
1954  0002 2706          	jreq	L5211
1955                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
1957  0004 e608          	ld	a,(8,x)
1958  0006 1a03          	or	a,(OFST+5,sp)
1960  0008 2005          	jra	L7211
1961  000a               L5211:
1962                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
1964  000a 7b03          	ld	a,(OFST+5,sp)
1965  000c 43            	cpl	a
1966  000d e408          	and	a,(8,x)
1967  000f               L7211:
1968  000f e708          	ld	(8,x),a
1969                     ; 837 }
1972  0011 81            	ret	
2112                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2112                     ; 940 {
2113                     .text:	section	.text,new
2114  0000               _USART_ITConfig:
2116  0000 89            	pushw	x
2117  0001 89            	pushw	x
2118       00000002      OFST:	set	2
2121                     ; 941   uint8_t usartreg, itpos = 0x00;
2123                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2125                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2127                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2129  0002 7b07          	ld	a,(OFST+5,sp)
2130  0004 6b01          	ld	(OFST-1,sp),a
2132                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2134  0006 7b08          	ld	a,(OFST+6,sp)
2135  0008 a40f          	and	a,#15
2136  000a 5f            	clrw	x
2137  000b 97            	ld	xl,a
2138  000c a601          	ld	a,#1
2139  000e 5d            	tnzw	x
2140  000f 2704          	jreq	L06
2141  0011               L26:
2142  0011 48            	sll	a
2143  0012 5a            	decw	x
2144  0013 26fc          	jrne	L26
2145  0015               L06:
2146  0015 6b02          	ld	(OFST+0,sp),a
2148                     ; 950   if (NewState != DISABLE)
2150  0017 7b09          	ld	a,(OFST+7,sp)
2151  0019 2722          	jreq	L3121
2152                     ; 953     if (usartreg == 0x01)
2154  001b 7b01          	ld	a,(OFST-1,sp)
2155  001d a101          	cp	a,#1
2156  001f 2608          	jrne	L5121
2157                     ; 955       USARTx->CR1 |= itpos;
2159  0021 1e03          	ldw	x,(OFST+1,sp)
2160  0023 e604          	ld	a,(4,x)
2161  0025 1a02          	or	a,(OFST+0,sp)
2163  0027 2021          	jp	LC002
2164  0029               L5121:
2165                     ; 957     else if (usartreg == 0x05)
2167  0029 a105          	cp	a,#5
2168  002b 2608          	jrne	L1221
2169                     ; 959       USARTx->CR5 |= itpos;
2171  002d 1e03          	ldw	x,(OFST+1,sp)
2172  002f e608          	ld	a,(8,x)
2173  0031 1a02          	or	a,(OFST+0,sp)
2175  0033 2024          	jp	LC003
2176  0035               L1221:
2177                     ; 964       USARTx->CR2 |= itpos;
2179  0035 1e03          	ldw	x,(OFST+1,sp)
2180  0037 e605          	ld	a,(5,x)
2181  0039 1a02          	or	a,(OFST+0,sp)
2182  003b 2027          	jp	LC001
2183  003d               L3121:
2184                     ; 970     if (usartreg == 0x01)
2186  003d 7b01          	ld	a,(OFST-1,sp)
2187  003f a101          	cp	a,#1
2188  0041 260b          	jrne	L7221
2189                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2191  0043 1e03          	ldw	x,(OFST+1,sp)
2192  0045 7b02          	ld	a,(OFST+0,sp)
2193  0047 43            	cpl	a
2194  0048 e404          	and	a,(4,x)
2195  004a               LC002:
2196  004a e704          	ld	(4,x),a
2198  004c 2018          	jra	L5221
2199  004e               L7221:
2200                     ; 974     else if (usartreg == 0x05)
2202  004e a105          	cp	a,#5
2203  0050 260b          	jrne	L3321
2204                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2206  0052 1e03          	ldw	x,(OFST+1,sp)
2207  0054 7b02          	ld	a,(OFST+0,sp)
2208  0056 43            	cpl	a
2209  0057 e408          	and	a,(8,x)
2210  0059               LC003:
2211  0059 e708          	ld	(8,x),a
2213  005b 2009          	jra	L5221
2214  005d               L3321:
2215                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2217  005d 1e03          	ldw	x,(OFST+1,sp)
2218  005f 7b02          	ld	a,(OFST+0,sp)
2219  0061 43            	cpl	a
2220  0062 e405          	and	a,(5,x)
2221  0064               LC001:
2222  0064 e705          	ld	(5,x),a
2223  0066               L5221:
2224                     ; 984 }
2227  0066 5b04          	addw	sp,#4
2228  0068 81            	ret	
2376                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2376                     ; 1003 {
2377                     .text:	section	.text,new
2378  0000               _USART_GetFlagStatus:
2380  0000 89            	pushw	x
2381  0001 88            	push	a
2382       00000001      OFST:	set	1
2385                     ; 1004   FlagStatus status = RESET;
2387                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2389                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2391  0002 1e06          	ldw	x,(OFST+5,sp)
2392  0004 a30101        	cpw	x,#257
2393  0007 260a          	jrne	L5231
2394                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2396  0009 1e02          	ldw	x,(OFST+1,sp)
2397  000b e605          	ld	a,(5,x)
2398  000d 1507          	bcp	a,(OFST+6,sp)
2399  000f 270d          	jreq	L5331
2400                     ; 1014       status = SET;
2402  0011 2007          	jp	LC005
2403                     ; 1019       status = RESET;
2404  0013               L5231:
2405                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2407  0013 1e02          	ldw	x,(OFST+1,sp)
2408  0015 f6            	ld	a,(x)
2409  0016 1507          	bcp	a,(OFST+6,sp)
2410  0018 2704          	jreq	L5331
2411                     ; 1027       status = SET;
2413  001a               LC005:
2415  001a a601          	ld	a,#1
2418  001c 2001          	jra	L3331
2419  001e               L5331:
2420                     ; 1032       status = RESET;
2423  001e 4f            	clr	a
2425  001f               L3331:
2426                     ; 1036   return status;
2430  001f 5b03          	addw	sp,#3
2431  0021 81            	ret	
2478                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2478                     ; 1061 {
2479                     .text:	section	.text,new
2480  0000               _USART_ClearFlag:
2482       fffffffe      OFST: set -2
2485                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2487                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2489  0000 7b04          	ld	a,(OFST+6,sp)
2490  0002 43            	cpl	a
2491  0003 f7            	ld	(x),a
2492                     ; 1066 }
2495  0004 81            	ret	
2588                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2588                     ; 1084 {
2589                     .text:	section	.text,new
2590  0000               _USART_GetITStatus:
2592  0000 89            	pushw	x
2593  0001 5203          	subw	sp,#3
2594       00000003      OFST:	set	3
2597                     ; 1085   ITStatus pendingbitstatus = RESET;
2599                     ; 1086   uint8_t temp = 0;
2601                     ; 1087   uint8_t itpos = 0;
2603                     ; 1088   uint8_t itmask1 = 0;
2605                     ; 1089   uint8_t itmask2 = 0;
2607                     ; 1090   uint8_t enablestatus = 0;
2609                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2611                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2613  0003 7b09          	ld	a,(OFST+6,sp)
2614  0005 a40f          	and	a,#15
2615  0007 5f            	clrw	x
2616  0008 97            	ld	xl,a
2617  0009 a601          	ld	a,#1
2618  000b 5d            	tnzw	x
2619  000c 2704          	jreq	L27
2620  000e               L47:
2621  000e 48            	sll	a
2622  000f 5a            	decw	x
2623  0010 26fc          	jrne	L47
2624  0012               L27:
2625  0012 6b02          	ld	(OFST-1,sp),a
2627                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2629  0014 7b09          	ld	a,(OFST+6,sp)
2630  0016 4e            	swap	a
2631  0017 a40f          	and	a,#15
2632  0019 6b03          	ld	(OFST+0,sp),a
2634                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2636  001b 5f            	clrw	x
2637  001c 97            	ld	xl,a
2638  001d a601          	ld	a,#1
2639  001f 5d            	tnzw	x
2640  0020 2704          	jreq	L67
2641  0022               L001:
2642  0022 48            	sll	a
2643  0023 5a            	decw	x
2644  0024 26fc          	jrne	L001
2645  0026               L67:
2646  0026 6b03          	ld	(OFST+0,sp),a
2648                     ; 1103   if (USART_IT == USART_IT_PE)
2650  0028 1e08          	ldw	x,(OFST+5,sp)
2651  002a a30100        	cpw	x,#256
2652  002d 2611          	jrne	L7241
2653                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2655  002f 1e04          	ldw	x,(OFST+1,sp)
2656  0031 e604          	ld	a,(4,x)
2657  0033 1403          	and	a,(OFST+0,sp)
2658  0035 6b03          	ld	(OFST+0,sp),a
2660                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2662  0037 f6            	ld	a,(x)
2663  0038 1502          	bcp	a,(OFST-1,sp)
2664  003a 2739          	jreq	L1541
2666  003c 7b03          	ld	a,(OFST+0,sp)
2667                     ; 1112       pendingbitstatus = SET;
2669  003e 201e          	jp	LC008
2670                     ; 1117       pendingbitstatus = RESET;
2671  0040               L7241:
2672                     ; 1121   else if (USART_IT == USART_IT_OR)
2674  0040 a30235        	cpw	x,#565
2675  0043 261f          	jrne	L7341
2676                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2678  0045 1e04          	ldw	x,(OFST+1,sp)
2679  0047 e605          	ld	a,(5,x)
2680  0049 1403          	and	a,(OFST+0,sp)
2681  004b 6b03          	ld	(OFST+0,sp),a
2683                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2685  004d e608          	ld	a,(8,x)
2686  004f a401          	and	a,#1
2687  0051 6b01          	ld	(OFST-2,sp),a
2689                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2691  0053 f6            	ld	a,(x)
2692  0054 1502          	bcp	a,(OFST-1,sp)
2693  0056 271d          	jreq	L1541
2695  0058 7b03          	ld	a,(OFST+0,sp)
2696  005a 2604          	jrne	L3441
2698  005c 7b01          	ld	a,(OFST-2,sp)
2699  005e               LC008:
2700  005e 2715          	jreq	L1541
2701  0060               L3441:
2702                     ; 1132       pendingbitstatus = SET;
2706  0060 a601          	ld	a,#1
2709  0062 2012          	jra	L5341
2710                     ; 1137       pendingbitstatus = RESET;
2711  0064               L7341:
2712                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2714  0064 1e04          	ldw	x,(OFST+1,sp)
2715  0066 e605          	ld	a,(5,x)
2716  0068 1403          	and	a,(OFST+0,sp)
2717  006a 6b03          	ld	(OFST+0,sp),a
2719                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2721  006c f6            	ld	a,(x)
2722  006d 1502          	bcp	a,(OFST-1,sp)
2723  006f 2704          	jreq	L1541
2725  0071 7b03          	ld	a,(OFST+0,sp)
2726                     ; 1149       pendingbitstatus = SET;
2728  0073 26eb          	jrne	L3441
2729  0075               L1541:
2730                     ; 1154       pendingbitstatus = RESET;
2734  0075 4f            	clr	a
2736  0076               L5341:
2737                     ; 1159   return  pendingbitstatus;
2741  0076 5b05          	addw	sp,#5
2742  0078 81            	ret	
2780                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2780                     ; 1184 {
2781                     .text:	section	.text,new
2782  0000               _USART_ClearITPendingBit:
2786                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2788                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2790  0000 f6            	ld	a,(x)
2791  0001 a4bf          	and	a,#191
2792  0003 f7            	ld	(x),a
2793                     ; 1189 }
2796  0004 81            	ret	
2809                     	xdef	_USART_ClearITPendingBit
2810                     	xdef	_USART_GetITStatus
2811                     	xdef	_USART_ClearFlag
2812                     	xdef	_USART_GetFlagStatus
2813                     	xdef	_USART_ITConfig
2814                     	xdef	_USART_DMACmd
2815                     	xdef	_USART_IrDACmd
2816                     	xdef	_USART_IrDAConfig
2817                     	xdef	_USART_SetGuardTime
2818                     	xdef	_USART_SmartCardNACKCmd
2819                     	xdef	_USART_SmartCardCmd
2820                     	xdef	_USART_HalfDuplexCmd
2821                     	xdef	_USART_SetAddress
2822                     	xdef	_USART_ReceiverWakeUpCmd
2823                     	xdef	_USART_WakeUpConfig
2824                     	xdef	_USART_ReceiveData9
2825                     	xdef	_USART_ReceiveData8
2826                     	xdef	_USART_SendData9
2827                     	xdef	_USART_SendData8
2828                     	xdef	_USART_SendBreak
2829                     	xdef	_USART_SetPrescaler
2830                     	xdef	_USART_Cmd
2831                     	xdef	_USART_ClockInit
2832                     	xdef	_USART_Init
2833                     	xdef	_USART_DeInit
2834                     	xref	_CLK_GetClockFreq
2835                     	xref.b	c_lreg
2836                     	xref.b	c_x
2855                     	xref	c_lursh
2856                     	xref	c_ltor
2857                     	xref	c_rtol
2858                     	xref	c_ludv
2859                     	end
