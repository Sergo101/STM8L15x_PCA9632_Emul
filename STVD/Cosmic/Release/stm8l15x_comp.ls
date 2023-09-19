   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 111 void COMP_DeInit(void)
  17                     ; 112 {
  18                     	scross	off
  19  0000               _COMP_DeInit:
  21                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  22  0000 725f5440      	clr	21568
  23                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  24  0004 725f5441      	clr	21569
  25                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  26  0008 35c05442      	mov	21570,#192
  27                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  28  000c 725f5443      	clr	21571
  29                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  30  0010 725f5444      	clr	21572
  31                     ; 127 }
  32  0014 81            	ret	
  34                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
  34                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
  34                     ; 155 {
  35  0015               _COMP_Init:
  36       fffffffe      OFST: set -2
  38                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
  39                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
  40                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
  41                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
  42  0015 c65442        	ld	a,21570
  43  0018 a4c7          	and	a,#199
  44  001a c75442        	ld	21570,a
  45                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
  46  001d 9e            	ld	a,xh
  47  001e ca5442        	or	a,21570
  48  0021 c75442        	ld	21570,a
  49                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
  50  0024 c65442        	ld	a,21570
  51  0027 a43f          	and	a,#63
  52  0029 c75442        	ld	21570,a
  53                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
  54  002c 9f            	ld	a,xl
  55  002d ca5442        	or	a,21570
  56  0030 c75442        	ld	21570,a
  57                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
  58  0033 72155441      	bres	21569,#2
  59                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
  60  0037 c65441        	ld	a,21569
  61  003a 1a03          	or	a,(OFST+5,sp)
  62  003c c75441        	ld	21569,a
  63                     ; 175 }
  64  003f 81            	ret	
  66                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
  66                     ; 184 {
  67  0040               _COMP_VrefintToCOMP1Connect:
  69                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
  70                     ; 188   if (NewState != DISABLE)
  71  0040 4d            	tnz	a
  72  0041 2705          	jreq	L3
  73                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
  74  0043 72145442      	bset	21570,#2
  76  0047 81            	ret	
  77  0048               L3:
  78                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
  79  0048 72155442      	bres	21570,#2
  80                     ; 198 }
  81  004c 81            	ret	
  83                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
  83                     ; 213 {
  84  004d               _COMP_EdgeConfig:
  85  004d 89            	pushw	x
  86       00000000      OFST:	set	0
  88                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
  89                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
  90                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
  91  004e 9e            	ld	a,xh
  92  004f 4a            	dec	a
  93  0050 2611          	jrne	L7
  94                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
  95  0052 c65440        	ld	a,21568
  96  0055 a4fc          	and	a,#252
  97  0057 c75440        	ld	21568,a
  98                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
  99  005a 9f            	ld	a,xl
 100  005b ca5440        	or	a,21568
 101  005e c75440        	ld	21568,a
 103  0061 2010          	jra	L11
 104  0063               L7:
 105                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 106  0063 c65441        	ld	a,21569
 107  0066 a4fc          	and	a,#252
 108  0068 c75441        	ld	21569,a
 109                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 110  006b c65441        	ld	a,21569
 111  006e 1a02          	or	a,(OFST+2,sp)
 112  0070 c75441        	ld	21569,a
 113  0073               L11:
 114                     ; 236 }
 115  0073 85            	popw	x
 116  0074 81            	ret	
 118                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 118                     ; 252 {
 119  0075               _COMP_GetOutputLevel:
 120       00000001      OFST:	set	1
 122                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 123                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 124  0075 4a            	dec	a
 125  0076 2609          	jrne	L31
 126                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 127  0078 7207544002    	btjf	21568,#3,L51
 128                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 130  007d 2007          	jp	LC002
 131  007f               L51:
 132                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 133  007f 2008          	jp	L32
 134  0081               L31:
 135                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 136  0081 7207544103    	btjf	21569,#3,L32
 137                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 138  0086               LC002:
 139  0086 a601          	ld	a,#1
 141  0088 81            	ret	
 142  0089               L32:
 143                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 144  0089 4f            	clr	a
 145                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 147  008a 81            	ret	
 149                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 149                     ; 325 {
 150  008b               _COMP_WindowCmd:
 152                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 153                     ; 329   if (NewState != DISABLE)
 154  008b 4d            	tnz	a
 155  008c 2705          	jreq	L72
 156                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 157  008e 72125442      	bset	21570,#1
 159  0092 81            	ret	
 160  0093               L72:
 161                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 162  0093 72135442      	bres	21570,#1
 163                     ; 339 }
 164  0097 81            	ret	
 166                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 166                     ; 363 {
 167  0098               _COMP_VrefintOutputCmd:
 169                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 170                     ; 367   if (NewState != DISABLE)
 171  0098 4d            	tnz	a
 172  0099 2705          	jreq	L33
 173                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 174  009b 72105442      	bset	21570,#0
 176  009f 81            	ret	
 177  00a0               L33:
 178                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 179  00a0 72115442      	bres	21570,#0
 180                     ; 377 }
 181  00a4 81            	ret	
 183                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 183                     ; 402 {
 184  00a5               _COMP_SchmittTriggerCmd:
 186                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 187                     ; 406   if (NewState != DISABLE)
 188  00a5 4d            	tnz	a
 189  00a6 2705          	jreq	L73
 190                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 191  00a8 72145440      	bset	21568,#2
 193  00ac 81            	ret	
 194  00ad               L73:
 195                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 196  00ad 72155440      	bres	21568,#2
 197                     ; 416 }
 198  00b1 81            	ret	
 200                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 200                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 200                     ; 437                         FunctionalState NewState)
 200                     ; 438 {
 201  00b2               _COMP_TriggerConfig:
 202  00b2 89            	pushw	x
 203       00000000      OFST:	set	0
 205                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 206                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 207                     ; 443   switch (COMP_TriggerGroup)
 208  00b3 9e            	ld	a,xh
 210                     ; 490     default:
 210                     ; 491       break;
 211  00b4 4a            	dec	a
 212  00b5 270b          	jreq	L34
 213  00b7 4a            	dec	a
 214  00b8 2717          	jreq	L54
 215  00ba 4a            	dec	a
 216  00bb 2730          	jreq	L74
 217  00bd 4a            	dec	a
 218  00be 2740          	jreq	L15
 219  00c0 2058          	jra	L75
 220  00c2               L34:
 221                     ; 445     case COMP_TriggerGroup_InvertingInput:
 221                     ; 446 
 221                     ; 447       if (NewState != DISABLE)
 222  00c2 7b05          	ld	a,(OFST+5,sp)
 223  00c4 2704          	jreq	L16
 224                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 225  00c6 7b02          	ld	a,(OFST+2,sp)
 227  00c8 2010          	jp	LC005
 228  00ca               L16:
 229                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 230  00ca c65443        	ld	a,21571
 231  00cd 1a02          	or	a,(OFST+2,sp)
 232  00cf 2017          	jp	LC004
 233  00d1               L54:
 234                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 234                     ; 458       if (NewState != DISABLE)
 235  00d1 7b05          	ld	a,(OFST+5,sp)
 236  00d3 270b          	jreq	L56
 237                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 238  00d5 7b02          	ld	a,(OFST+2,sp)
 239  00d7 48            	sll	a
 240  00d8 48            	sll	a
 241  00d9 48            	sll	a
 242  00da               LC005:
 243  00da 43            	cpl	a
 244  00db c45443        	and	a,21571
 246  00de 2008          	jp	LC004
 247  00e0               L56:
 248                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 249  00e0 7b02          	ld	a,(OFST+2,sp)
 250  00e2 48            	sll	a
 251  00e3 48            	sll	a
 252  00e4 48            	sll	a
 253  00e5 ca5443        	or	a,21571
 254  00e8               LC004:
 255  00e8 c75443        	ld	21571,a
 256  00eb 202d          	jra	L75
 257  00ed               L74:
 258                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
 258                     ; 469       if (NewState != DISABLE)
 259  00ed 7b05          	ld	a,(OFST+5,sp)
 260  00ef 2708          	jreq	L17
 261                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
 262  00f1 7b02          	ld	a,(OFST+2,sp)
 263  00f3 43            	cpl	a
 264  00f4 c45444        	and	a,21572
 266  00f7 201e          	jp	LC003
 267  00f9               L17:
 268                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
 269  00f9 c65444        	ld	a,21572
 270  00fc 1a02          	or	a,(OFST+2,sp)
 271  00fe 2017          	jp	LC003
 272  0100               L15:
 273                     ; 479     case COMP_TriggerGroup_DACOutput:
 273                     ; 480       if (NewState != DISABLE)
 274  0100 7b05          	ld	a,(OFST+5,sp)
 275  0102 270b          	jreq	L57
 276                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 277  0104 7b02          	ld	a,(OFST+2,sp)
 278  0106 48            	sll	a
 279  0107 48            	sll	a
 280  0108 48            	sll	a
 281  0109 43            	cpl	a
 282  010a c45444        	and	a,21572
 284  010d 2008          	jp	LC003
 285  010f               L57:
 286                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
 287  010f 7b02          	ld	a,(OFST+2,sp)
 288  0111 48            	sll	a
 289  0112 48            	sll	a
 290  0113 48            	sll	a
 291  0114 ca5444        	or	a,21572
 292  0117               LC003:
 293  0117 c75444        	ld	21572,a
 294                     ; 490     default:
 294                     ; 491       break;
 295  011a               L75:
 296                     ; 493 }
 297  011a 85            	popw	x
 298  011b 81            	ret	
 300                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
 300                     ; 522 {
 301  011c               _COMP_ITConfig:
 302  011c 89            	pushw	x
 303       00000000      OFST:	set	0
 305                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 306                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
 307                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
 308  011d 9e            	ld	a,xh
 309  011e 4a            	dec	a
 310  011f 2610          	jrne	L101
 311                     ; 530     if (NewState != DISABLE)
 312  0121 9f            	ld	a,xl
 313  0122 4d            	tnz	a
 314  0123 2706          	jreq	L301
 315                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
 316  0125 721a5440      	bset	21568,#5
 318  0129 2014          	jra	L701
 319  012b               L301:
 320                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
 321  012b 721b5440      	bres	21568,#5
 322  012f 200e          	jra	L701
 323  0131               L101:
 324                     ; 543     if (NewState != DISABLE)
 325  0131 7b02          	ld	a,(OFST+2,sp)
 326  0133 2706          	jreq	L111
 327                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
 328  0135 721a5441      	bset	21569,#5
 330  0139 2004          	jra	L701
 331  013b               L111:
 332                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
 333  013b 721b5441      	bres	21569,#5
 334  013f               L701:
 335                     ; 554 }
 336  013f 85            	popw	x
 337  0140 81            	ret	
 339                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
 339                     ; 565 {
 340  0141               _COMP_GetFlagStatus:
 341       00000001      OFST:	set	1
 343                     ; 566   FlagStatus bitstatus = RESET;
 344                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 345                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
 346  0141 4a            	dec	a
 347  0142 2609          	jrne	L511
 348                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
 349  0144 7209544002    	btjf	21568,#4,L711
 350                     ; 577       bitstatus = SET;
 352  0149 2007          	jp	LC007
 353  014b               L711:
 354                     ; 582       bitstatus = RESET;
 355  014b 2008          	jp	L521
 356  014d               L511:
 357                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
 358  014d 7209544103    	btjf	21569,#4,L521
 359                     ; 590       bitstatus = SET;
 360  0152               LC007:
 361  0152 a601          	ld	a,#1
 363  0154 81            	ret	
 364  0155               L521:
 365                     ; 595       bitstatus = RESET;
 366  0155 4f            	clr	a
 367                     ; 600   return (FlagStatus)(bitstatus);
 369  0156 81            	ret	
 371                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
 371                     ; 612 {
 372  0157               _COMP_ClearFlag:
 374                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 375                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
 376  0157 4a            	dec	a
 377  0158 2605          	jrne	L131
 378                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
 379  015a 72195440      	bres	21568,#4
 381  015e 81            	ret	
 382  015f               L131:
 383                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
 384  015f 72195441      	bres	21569,#4
 385                     ; 626 }
 386  0163 81            	ret	
 388                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
 388                     ; 637 {
 389  0164               _COMP_GetITStatus:
 390  0164 89            	pushw	x
 391       00000002      OFST:	set	2
 393                     ; 638   ITStatus bitstatus = RESET;
 394                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
 396                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 397                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
 398  0165 4a            	dec	a
 399  0166 2618          	jrne	L531
 400                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
 401  0168 c65440        	ld	a,21568
 402  016b a410          	and	a,#16
 403  016d 6b01          	ld	(OFST-1,sp),a
 404                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
 405  016f c65440        	ld	a,21568
 406  0172 a420          	and	a,#32
 407  0174 6b02          	ld	(OFST+0,sp),a
 408                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
 409  0176 7b01          	ld	a,(OFST-1,sp)
 410  0178 2720          	jreq	L541
 412  017a 7b02          	ld	a,(OFST+0,sp)
 413  017c 271c          	jreq	L541
 414                     ; 655       bitstatus = SET;
 416  017e 2016          	jp	LC009
 417                     ; 660       bitstatus = RESET;
 418  0180               L531:
 419                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
 420  0180 c65441        	ld	a,21569
 421  0183 a410          	and	a,#16
 422  0185 6b01          	ld	(OFST-1,sp),a
 423                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
 424  0187 c65441        	ld	a,21569
 425  018a a420          	and	a,#32
 426  018c 6b02          	ld	(OFST+0,sp),a
 427                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
 428  018e 7b01          	ld	a,(OFST-1,sp)
 429  0190 2708          	jreq	L541
 431  0192 7b02          	ld	a,(OFST+0,sp)
 432  0194 2704          	jreq	L541
 433                     ; 674       bitstatus = SET;
 434  0196               LC009:
 435  0196 a601          	ld	a,#1
 437  0198 2001          	jra	L341
 438  019a               L541:
 439                     ; 679       bitstatus = RESET;
 440  019a 4f            	clr	a
 441  019b               L341:
 442                     ; 684   return (ITStatus) bitstatus;
 444  019b 85            	popw	x
 445  019c 81            	ret	
 447                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
 447                     ; 696 {
 448  019d               _COMP_ClearITPendingBit:
 450                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 451                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
 452  019d 4a            	dec	a
 453  019e 2605          	jrne	L151
 454                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
 455  01a0 72195440      	bres	21568,#4
 457  01a4 81            	ret	
 458  01a5               L151:
 459                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
 460  01a5 72195441      	bres	21569,#4
 461                     ; 710 }
 462  01a9 81            	ret	
 464                     	xdef	_COMP_ClearITPendingBit
 465                     	xdef	_COMP_GetITStatus
 466                     	xdef	_COMP_ClearFlag
 467                     	xdef	_COMP_GetFlagStatus
 468                     	xdef	_COMP_ITConfig
 469                     	xdef	_COMP_TriggerConfig
 470                     	xdef	_COMP_SchmittTriggerCmd
 471                     	xdef	_COMP_VrefintOutputCmd
 472                     	xdef	_COMP_WindowCmd
 473                     	xdef	_COMP_GetOutputLevel
 474                     	xdef	_COMP_EdgeConfig
 475                     	xdef	_COMP_VrefintToCOMP1Connect
 476                     	xdef	_COMP_Init
 477                     	xdef	_COMP_DeInit
 478                     	end
