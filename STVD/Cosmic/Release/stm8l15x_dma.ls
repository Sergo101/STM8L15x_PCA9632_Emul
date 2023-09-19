   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 140 void DMA_GlobalDeInit(void)
  17                     ; 141 {
  18                     	scross	off
  19  0000               _DMA_GlobalDeInit:
  21                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  22  0000 72115070      	bres	20592,#0
  23                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  24  0004 35fc5070      	mov	20592,#252
  25                     ; 147 }
  26  0008 81            	ret	
  28                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
  28                     ; 156 {
  29  0009               _DMA_DeInit:
  30  0009 89            	pushw	x
  31       00000000      OFST:	set	0
  33                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
  34                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
  35  000a f6            	ld	a,(x)
  36  000b a4fe          	and	a,#254
  37  000d f7            	ld	(x),a
  38                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
  39  000e 7f            	clr	(x)
  40                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
  41  000f 6f02          	clr	(2,x)
  42                     ; 170   if (DMA_Channelx == DMA1_Channel3)
  43  0011 a35093        	cpw	x,#20627
  44  0014 2608          	jrne	L3
  45                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
  46  0016 a640          	ld	a,#64
  47  0018 e703          	ld	(3,x),a
  48                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
  49  001a 6f05          	clr	(5,x)
  51  001c 2004          	jra	L5
  52  001e               L3:
  53                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
  54  001e a652          	ld	a,#82
  55  0020 e703          	ld	(3,x),a
  56  0022               L5:
  57                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
  58  0022 1e01          	ldw	x,(OFST+1,sp)
  59  0024 6f04          	clr	(4,x)
  60                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
  61  0026 6f06          	clr	(6,x)
  62                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
  63  0028 6f07          	clr	(7,x)
  64                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
  65  002a 6f01          	clr	(1,x)
  66                     ; 187 }
  67  002c 85            	popw	x
  68  002d 81            	ret	
  70                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
  70                     ; 225               uint32_t DMA_Memory0BaseAddr,
  70                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
  70                     ; 227               uint8_t DMA_BufferSize,
  70                     ; 228               DMA_DIR_TypeDef DMA_DIR,
  70                     ; 229               DMA_Mode_TypeDef DMA_Mode,
  70                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
  70                     ; 231               DMA_Priority_TypeDef DMA_Priority,
  70                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
  70                     ; 233 {
  71  002e               _DMA_Init:
  72       fffffffe      OFST: set -2
  74                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
  75                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
  76                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
  77                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
  78                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
  79                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
  80                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
  81  002e f6            	ld	a,(x)
  82  002f a4fe          	and	a,#254
  83  0031 f7            	ld	(x),a
  84                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
  85  0032 7f            	clr	(x)
  86                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
  86                     ; 251                                            (uint8_t)DMA_Mode) | \
  86                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
  87  0033 7b0a          	ld	a,(OFST+12,sp)
  88  0035 1a0b          	or	a,(OFST+13,sp)
  89  0037 1a0c          	or	a,(OFST+14,sp)
  90  0039 fa            	or	a,(x)
  91  003a f7            	ld	(x),a
  92                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
  93  003b e601          	ld	a,(1,x)
  94  003d a4c7          	and	a,#199
  95  003f e701          	ld	(1,x),a
  96                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
  96                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
  97  0041 7b0d          	ld	a,(OFST+15,sp)
  98  0043 1a0e          	or	a,(OFST+16,sp)
  99  0045 ea01          	or	a,(1,x)
 100  0047 e701          	ld	(1,x),a
 101                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 102  0049 7b09          	ld	a,(OFST+11,sp)
 103  004b e702          	ld	(2,x),a
 104                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 105  004d 7b07          	ld	a,(OFST+9,sp)
 106  004f e703          	ld	(3,x),a
 107                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 108  0051 7b08          	ld	a,(OFST+10,sp)
 109  0053 e704          	ld	(4,x),a
 110                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 111  0055 a35093        	cpw	x,#20627
 112  0058 2604          	jrne	L7
 113                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 114  005a 7b04          	ld	a,(OFST+6,sp)
 115  005c e705          	ld	(5,x),a
 116  005e               L7:
 117                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 118  005e 7b05          	ld	a,(OFST+7,sp)
 119  0060 e706          	ld	(6,x),a
 120                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 121  0062 7b06          	ld	a,(OFST+8,sp)
 122  0064 e707          	ld	(7,x),a
 123                     ; 280 }
 124  0066 81            	ret	
 126                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 126                     ; 289 {
 127  0067               _DMA_GlobalCmd:
 129                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 130                     ; 293   if (NewState != DISABLE)
 131  0067 4d            	tnz	a
 132  0068 2705          	jreq	L11
 133                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 134  006a 72105070      	bset	20592,#0
 136  006e 81            	ret	
 137  006f               L11:
 138                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 139  006f 72115070      	bres	20592,#0
 140                     ; 303 }
 141  0073 81            	ret	
 143                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 143                     ; 315 {
 144  0074               _DMA_Cmd:
 145       fffffffe      OFST: set -2
 147                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 148                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 149                     ; 320   if (NewState != DISABLE)
 150  0074 7b03          	ld	a,(OFST+5,sp)
 151  0076 2705          	jreq	L51
 152                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 153  0078 f6            	ld	a,(x)
 154  0079 aa01          	or	a,#1
 156  007b 2003          	jra	L71
 157  007d               L51:
 158                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 159  007d f6            	ld	a,(x)
 160  007e a4fe          	and	a,#254
 161  0080               L71:
 162  0080 f7            	ld	(x),a
 163                     ; 330 }
 164  0081 81            	ret	
 166                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 166                     ; 343 {
 167  0082               _DMA_SetTimeOut:
 169                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 170                     ; 348   DMA1->GCSR = 0;
 171  0082 725f5070      	clr	20592
 172                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 173  0086 48            	sll	a
 174  0087 48            	sll	a
 175  0088 c75070        	ld	20592,a
 176                     ; 351 }
 177  008b 81            	ret	
 179                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 179                     ; 402 {
 180  008c               _DMA_SetCurrDataCounter:
 181       fffffffe      OFST: set -2
 183                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 184                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 185  008c 7b03          	ld	a,(OFST+5,sp)
 186  008e e702          	ld	(2,x),a
 187                     ; 408 }
 188  0090 81            	ret	
 190                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 190                     ; 416 {
 191  0091               _DMA_GetCurrDataCounter:
 193                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 194                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 195  0091 e602          	ld	a,(2,x)
 197  0093 81            	ret	
 199                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 199                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 199                     ; 484                   FunctionalState NewState)
 199                     ; 485 {
 200  0094               _DMA_ITConfig:
 201       fffffffe      OFST: set -2
 203                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 204                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 205                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 206                     ; 491   if (NewState != DISABLE)
 207  0094 7b04          	ld	a,(OFST+6,sp)
 208  0096 2705          	jreq	L12
 209                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 210  0098 f6            	ld	a,(x)
 211  0099 1a03          	or	a,(OFST+5,sp)
 213  009b 2004          	jra	L32
 214  009d               L12:
 215                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 216  009d 7b03          	ld	a,(OFST+5,sp)
 217  009f 43            	cpl	a
 218  00a0 f4            	and	a,(x)
 219  00a1               L32:
 220  00a1 f7            	ld	(x),a
 221                     ; 501 }
 222  00a2 81            	ret	
 224                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
 224                     ; 531 {
 225  00a3               _DMA_GetFlagStatus:
 226  00a3 89            	pushw	x
 227  00a4 5204          	subw	sp,#4
 228       00000004      OFST:	set	4
 230                     ; 532   FlagStatus flagstatus = RESET;
 231                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 232                     ; 534   uint8_t tmpgir1 = 0;
 233                     ; 535   uint8_t tmpgcsr = 0;
 234                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
 235                     ; 541   tmpgcsr = DMA1->GCSR;
 236  00a6 c65070        	ld	a,20592
 237  00a9 6b04          	ld	(OFST+0,sp),a
 238                     ; 542   tmpgir1 = DMA1->GIR1;
 239  00ab c65071        	ld	a,20593
 240  00ae 6b01          	ld	(OFST-3,sp),a
 241                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
 242  00b0 01            	rrwa	x,a
 243  00b1 9f            	ld	a,xl
 244  00b2 a40f          	and	a,#15
 245  00b4 97            	ld	xl,a
 246  00b5 4f            	clr	a
 247  00b6 02            	rlwa	x,a
 248  00b7 5d            	tnzw	x
 249  00b8 2728          	jreq	L52
 250                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
 251  00ba 7b05          	ld	a,(OFST+1,sp)
 252  00bc a501          	bcp	a,#1
 253  00be 2705          	jreq	L72
 254                     ; 549       DMA_Channelx = DMA1_Channel0;
 255  00c0 ae5075        	ldw	x,#20597
 257  00c3 2015          	jra	L13
 258  00c5               L72:
 259                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
 260  00c5 a502          	bcp	a,#2
 261  00c7 2705          	jreq	L33
 262                     ; 553       DMA_Channelx = DMA1_Channel1;
 263  00c9 ae507f        	ldw	x,#20607
 265  00cc 200c          	jra	L13
 266  00ce               L33:
 267                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
 268  00ce a504          	bcp	a,#4
 269  00d0 2705          	jreq	L73
 270                     ; 557       DMA_Channelx = DMA1_Channel2;
 271  00d2 ae5089        	ldw	x,#20617
 273  00d5 2003          	jra	L13
 274  00d7               L73:
 275                     ; 561       DMA_Channelx = DMA1_Channel3;
 276  00d7 ae5093        	ldw	x,#20627
 277  00da               L13:
 278  00da 1f02          	ldw	(OFST-2,sp),x
 279                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
 280  00dc e601          	ld	a,(1,x)
 281  00de 1406          	and	a,(OFST+2,sp)
 283  00e0 2010          	jra	L34
 284  00e2               L52:
 285                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
 286  00e2 7b05          	ld	a,(OFST+1,sp)
 287  00e4 a510          	bcp	a,#16
 288  00e6 2706          	jreq	L54
 289                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
 290  00e8 7b06          	ld	a,(OFST+2,sp)
 291  00ea 1401          	and	a,(OFST-3,sp)
 293  00ec 2004          	jra	L34
 294  00ee               L54:
 295                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
 296  00ee 7b04          	ld	a,(OFST+0,sp)
 297  00f0 a402          	and	a,#2
 298  00f2               L34:
 299                     ; 579   return (flagstatus);
 301  00f2 5b06          	addw	sp,#6
 302  00f4 81            	ret	
 304                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
 304                     ; 598 {
 305  00f5               _DMA_ClearFlag:
 306  00f5 89            	pushw	x
 307  00f6 89            	pushw	x
 308       00000002      OFST:	set	2
 310                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 311                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
 312                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
 313  00f7 01            	rrwa	x,a
 314  00f8 9f            	ld	a,xl
 315  00f9 a401          	and	a,#1
 316  00fb 97            	ld	xl,a
 317  00fc 4f            	clr	a
 318  00fd 02            	rlwa	x,a
 319  00fe 5d            	tnzw	x
 320  00ff 2705          	jreq	L15
 321                     ; 607     DMA_Channelx = DMA1_Channel0;
 322  0101 ae5075        	ldw	x,#20597
 324  0104 2017          	jra	L35
 325  0106               L15:
 326                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
 327  0106 7b03          	ld	a,(OFST+1,sp)
 328  0108 a502          	bcp	a,#2
 329  010a 2705          	jreq	L55
 330                     ; 613       DMA_Channelx = DMA1_Channel1;
 331  010c ae507f        	ldw	x,#20607
 333  010f 200c          	jra	L35
 334  0111               L55:
 335                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
 336  0111 a504          	bcp	a,#4
 337  0113 2705          	jreq	L16
 338                     ; 619         DMA_Channelx = DMA1_Channel2;
 339  0115 ae5089        	ldw	x,#20617
 341  0118 2003          	jra	L35
 342  011a               L16:
 343                     ; 623         DMA_Channelx = DMA1_Channel3;
 344  011a ae5093        	ldw	x,#20627
 345  011d               L35:
 346  011d 1f01          	ldw	(OFST-1,sp),x
 347                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
 348  011f 7b04          	ld	a,(OFST+2,sp)
 349  0121 a406          	and	a,#6
 350  0123 43            	cpl	a
 351  0124 e401          	and	a,(1,x)
 352  0126 e701          	ld	(1,x),a
 353                     ; 630 }
 354  0128 5b04          	addw	sp,#4
 355  012a 81            	ret	
 357                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
 357                     ; 647 {
 358  012b               _DMA_GetITStatus:
 359  012b 88            	push	a
 360  012c 5204          	subw	sp,#4
 361       00000004      OFST:	set	4
 363                     ; 648   ITStatus itstatus = RESET;
 364                     ; 649   uint8_t tmpreg = 0;
 365                     ; 650   uint8_t tmp2 = 0;
 366                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 367                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
 368                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
 369  012e a510          	bcp	a,#16
 370  0130 2705          	jreq	L56
 371                     ; 659     DMA_Channelx = DMA1_Channel0;
 372  0132 ae5075        	ldw	x,#20597
 374  0135 2015          	jra	L76
 375  0137               L56:
 376                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
 377  0137 a520          	bcp	a,#32
 378  0139 2705          	jreq	L17
 379                     ; 665       DMA_Channelx = DMA1_Channel1;
 380  013b ae507f        	ldw	x,#20607
 382  013e 200c          	jra	L76
 383  0140               L17:
 384                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
 385  0140 a540          	bcp	a,#64
 386  0142 2705          	jreq	L57
 387                     ; 671         DMA_Channelx = DMA1_Channel2;
 388  0144 ae5089        	ldw	x,#20617
 390  0147 2003          	jra	L76
 391  0149               L57:
 392                     ; 675         DMA_Channelx = DMA1_Channel3;
 393  0149 ae5093        	ldw	x,#20627
 394  014c               L76:
 395  014c 1f03          	ldw	(OFST-1,sp),x
 396                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
 397  014e e601          	ld	a,(1,x)
 398                     ; 681   tmpreg &= DMA_Channelx->CCR ;
 399  0150 f4            	and	a,(x)
 400  0151 6b01          	ld	(OFST-3,sp),a
 401                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
 402  0153 7b05          	ld	a,(OFST+1,sp)
 403  0155 a406          	and	a,#6
 404                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
 405  0157 1401          	and	a,(OFST-3,sp)
 406                     ; 686   return (itstatus);
 408  0159 5b05          	addw	sp,#5
 409  015b 81            	ret	
 411                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
 411                     ; 705 {
 412  015c               _DMA_ClearITPendingBit:
 413  015c 88            	push	a
 414  015d 89            	pushw	x
 415       00000002      OFST:	set	2
 417                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 418                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
 419                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
 420  015e a510          	bcp	a,#16
 421  0160 2705          	jreq	L101
 422                     ; 713     DMA_Channelx = DMA1_Channel0;
 423  0162 ae5075        	ldw	x,#20597
 425  0165 2015          	jra	L301
 426  0167               L101:
 427                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
 428  0167 a520          	bcp	a,#32
 429  0169 2705          	jreq	L501
 430                     ; 719       DMA_Channelx = DMA1_Channel1;
 431  016b ae507f        	ldw	x,#20607
 433  016e 200c          	jra	L301
 434  0170               L501:
 435                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
 436  0170 a540          	bcp	a,#64
 437  0172 2705          	jreq	L111
 438                     ; 725         DMA_Channelx = DMA1_Channel2;
 439  0174 ae5089        	ldw	x,#20617
 441  0177 2003          	jra	L301
 442  0179               L111:
 443                     ; 729         DMA_Channelx = DMA1_Channel3;
 444  0179 ae5093        	ldw	x,#20627
 445  017c               L301:
 446  017c 1f01          	ldw	(OFST-1,sp),x
 447                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
 448  017e 7b03          	ld	a,(OFST+1,sp)
 449  0180 a406          	and	a,#6
 450  0182 43            	cpl	a
 451  0183 e401          	and	a,(1,x)
 452  0185 e701          	ld	(1,x),a
 453                     ; 735 }
 454  0187 5b03          	addw	sp,#3
 455  0189 81            	ret	
 457                     	xdef	_DMA_ClearITPendingBit
 458                     	xdef	_DMA_GetITStatus
 459                     	xdef	_DMA_ClearFlag
 460                     	xdef	_DMA_GetFlagStatus
 461                     	xdef	_DMA_ITConfig
 462                     	xdef	_DMA_GetCurrDataCounter
 463                     	xdef	_DMA_SetCurrDataCounter
 464                     	xdef	_DMA_SetTimeOut
 465                     	xdef	_DMA_Cmd
 466                     	xdef	_DMA_GlobalCmd
 467                     	xdef	_DMA_Init
 468                     	xdef	_DMA_DeInit
 469                     	xdef	_DMA_GlobalDeInit
 470                     	end
