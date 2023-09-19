   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 123 void EXTI_DeInit(void)
  17                     ; 124 {
  18                     	scross	off
  19  0000               _EXTI_DeInit:
  21                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  22  0000 725f50a0      	clr	20640
  23                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  24  0004 725f50a1      	clr	20641
  25                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  26  0008 725f50a2      	clr	20642
  27                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  28  000c 725f50aa      	clr	20650
  29                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  30  0010 35ff50a3      	mov	20643,#255
  31                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  32  0014 35ff50a4      	mov	20644,#255
  33                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  34  0018 725f50a5      	clr	20645
  35                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  36  001c 725f50ab      	clr	20651
  37                     ; 133 }
  38  0020 81            	ret	
  40                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
  40                     ; 161 {
  41  0021               _EXTI_SetPinSensitivity:
  42  0021 89            	pushw	x
  43       00000000      OFST:	set	0
  45                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
  46                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
  47                     ; 168   switch (EXTI_Pin)
  48  0022 9e            	ld	a,xh
  50                     ; 202     default:
  50                     ; 203       break;
  51  0023 4d            	tnz	a
  52  0024 2728          	jreq	L3
  53  0026 a002          	sub	a,#2
  54  0028 273b          	jreq	L5
  55  002a a002          	sub	a,#2
  56  002c 274e          	jreq	L7
  57  002e a002          	sub	a,#2
  58  0030 2761          	jreq	L11
  59  0032 a00a          	sub	a,#10
  60  0034 277a          	jreq	L31
  61  0036 a002          	sub	a,#2
  62  0038 2603cc00c9    	jreq	L51
  63  003d a002          	sub	a,#2
  64  003f 2603cc00e2    	jreq	L71
  65  0044 a002          	sub	a,#2
  66  0046 2603cc00fb    	jreq	L12
  67  004b cc0118        	jra	L72
  68  004e               L3:
  69                     ; 170     case EXTI_Pin_0:
  69                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
  70  004e c650a0        	ld	a,20640
  71  0051 a4fc          	and	a,#252
  72  0053 c750a0        	ld	20640,a
  73                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
  74  0056 7b01          	ld	a,(OFST+1,sp)
  75  0058 5f            	clrw	x
  76  0059 97            	ld	xl,a
  77  005a 7b02          	ld	a,(OFST+2,sp)
  78  005c 5d            	tnzw	x
  79  005d 2749          	jreq	L22
  80  005f               L01:
  81  005f 48            	sll	a
  82  0060 5a            	decw	x
  83  0061 26fc          	jrne	L01
  84                     ; 173       break;
  85  0063 2043          	jp	L22
  86  0065               L5:
  87                     ; 174     case EXTI_Pin_1:
  87                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
  88  0065 c650a0        	ld	a,20640
  89  0068 a4f3          	and	a,#243
  90  006a c750a0        	ld	20640,a
  91                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
  92  006d 7b01          	ld	a,(OFST+1,sp)
  93  006f 5f            	clrw	x
  94  0070 97            	ld	xl,a
  95  0071 7b02          	ld	a,(OFST+2,sp)
  96  0073 5d            	tnzw	x
  97  0074 2732          	jreq	L22
  98  0076               L41:
  99  0076 48            	sll	a
 100  0077 5a            	decw	x
 101  0078 26fc          	jrne	L41
 102                     ; 177       break;
 103  007a 202c          	jp	L22
 104  007c               L7:
 105                     ; 178     case EXTI_Pin_2:
 105                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 106  007c c650a0        	ld	a,20640
 107  007f a4cf          	and	a,#207
 108  0081 c750a0        	ld	20640,a
 109                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 110  0084 7b01          	ld	a,(OFST+1,sp)
 111  0086 5f            	clrw	x
 112  0087 97            	ld	xl,a
 113  0088 7b02          	ld	a,(OFST+2,sp)
 114  008a 5d            	tnzw	x
 115  008b 271b          	jreq	L22
 116  008d               L02:
 117  008d 48            	sll	a
 118  008e 5a            	decw	x
 119  008f 26fc          	jrne	L02
 120                     ; 181       break;
 121  0091 2015          	jp	L22
 122  0093               L11:
 123                     ; 182     case EXTI_Pin_3:
 123                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 124  0093 c650a0        	ld	a,20640
 125  0096 a43f          	and	a,#63
 126  0098 c750a0        	ld	20640,a
 127                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 128  009b 7b01          	ld	a,(OFST+1,sp)
 129  009d 5f            	clrw	x
 130  009e 97            	ld	xl,a
 131  009f 7b02          	ld	a,(OFST+2,sp)
 132  00a1 5d            	tnzw	x
 133  00a2 2704          	jreq	L22
 134  00a4               L42:
 135  00a4 48            	sll	a
 136  00a5 5a            	decw	x
 137  00a6 26fc          	jrne	L42
 138  00a8               L22:
 139  00a8 ca50a0        	or	a,20640
 140  00ab c750a0        	ld	20640,a
 141                     ; 185       break;
 142  00ae 2068          	jra	L72
 143  00b0               L31:
 144                     ; 186     case EXTI_Pin_4:
 144                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 145  00b0 c650a1        	ld	a,20641
 146  00b3 a4fc          	and	a,#252
 147  00b5 c750a1        	ld	20641,a
 148                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 149  00b8 7b01          	ld	a,(OFST+1,sp)
 150  00ba a4ef          	and	a,#239
 151  00bc 5f            	clrw	x
 152  00bd 97            	ld	xl,a
 153  00be 7b02          	ld	a,(OFST+2,sp)
 154  00c0 5d            	tnzw	x
 155  00c1 274f          	jreq	L24
 156  00c3               L03:
 157  00c3 48            	sll	a
 158  00c4 5a            	decw	x
 159  00c5 26fc          	jrne	L03
 160                     ; 189       break;
 161  00c7 2049          	jp	L24
 162  00c9               L51:
 163                     ; 190     case EXTI_Pin_5:
 163                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 164  00c9 c650a1        	ld	a,20641
 165  00cc a4f3          	and	a,#243
 166  00ce c750a1        	ld	20641,a
 167                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 168  00d1 7b01          	ld	a,(OFST+1,sp)
 169  00d3 a4ef          	and	a,#239
 170  00d5 5f            	clrw	x
 171  00d6 97            	ld	xl,a
 172  00d7 7b02          	ld	a,(OFST+2,sp)
 173  00d9 5d            	tnzw	x
 174  00da 2736          	jreq	L24
 175  00dc               L43:
 176  00dc 48            	sll	a
 177  00dd 5a            	decw	x
 178  00de 26fc          	jrne	L43
 179                     ; 193       break;
 180  00e0 2030          	jp	L24
 181  00e2               L71:
 182                     ; 194     case EXTI_Pin_6:
 182                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 183  00e2 c650a1        	ld	a,20641
 184  00e5 a4cf          	and	a,#207
 185  00e7 c750a1        	ld	20641,a
 186                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 187  00ea 7b01          	ld	a,(OFST+1,sp)
 188  00ec a4ef          	and	a,#239
 189  00ee 5f            	clrw	x
 190  00ef 97            	ld	xl,a
 191  00f0 7b02          	ld	a,(OFST+2,sp)
 192  00f2 5d            	tnzw	x
 193  00f3 271d          	jreq	L24
 194  00f5               L04:
 195  00f5 48            	sll	a
 196  00f6 5a            	decw	x
 197  00f7 26fc          	jrne	L04
 198                     ; 197       break;
 199  00f9 2017          	jp	L24
 200  00fb               L12:
 201                     ; 198     case EXTI_Pin_7:
 201                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 202  00fb c650a1        	ld	a,20641
 203  00fe a43f          	and	a,#63
 204  0100 c750a1        	ld	20641,a
 205                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 206  0103 7b01          	ld	a,(OFST+1,sp)
 207  0105 a4ef          	and	a,#239
 208  0107 5f            	clrw	x
 209  0108 97            	ld	xl,a
 210  0109 7b02          	ld	a,(OFST+2,sp)
 211  010b 5d            	tnzw	x
 212  010c 2704          	jreq	L24
 213  010e               L44:
 214  010e 48            	sll	a
 215  010f 5a            	decw	x
 216  0110 26fc          	jrne	L44
 217  0112               L24:
 218  0112 ca50a1        	or	a,20641
 219  0115 c750a1        	ld	20641,a
 220                     ; 201       break;
 221                     ; 202     default:
 221                     ; 203       break;
 222  0118               L72:
 223                     ; 205 }
 224  0118 85            	popw	x
 225  0119 81            	ret	
 227                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 227                     ; 220 {
 228  011a               _EXTI_SelectPort:
 229       00000000      OFST:	set	0
 231                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 232                     ; 224   if (EXTI_Port == EXTI_Port_B)
 233  011a 4d            	tnz	a
 234  011b 2605          	jrne	L13
 235                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 236  011d 721b50ab      	bres	20651,#5
 238  0121 81            	ret	
 239  0122               L13:
 240                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 241  0122 a102          	cp	a,#2
 242  0124 2605          	jrne	L53
 243                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 244  0126 721d50ab      	bres	20651,#6
 246  012a 81            	ret	
 247  012b               L53:
 248                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 249  012b a104          	cp	a,#4
 250  012d 2605          	jrne	L14
 251                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 252  012f 721f50a5      	bres	20645,#7
 254  0133 81            	ret	
 255  0134               L14:
 256                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 257  0134 a106          	cp	a,#6
 258  0136 2605          	jrne	L54
 259                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 260  0138 721e50a5      	bset	20645,#7
 262  013c 81            	ret	
 263  013d               L54:
 264                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 265  013d a110          	cp	a,#16
 266  013f 2605          	jrne	L15
 267                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 268  0141 721a50ab      	bset	20651,#5
 270  0145 81            	ret	
 271  0146               L15:
 272                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 273  0146 721c50ab      	bset	20651,#6
 274                     ; 254 }
 275  014a 81            	ret	
 277                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 277                     ; 281                                FunctionalState NewState)
 277                     ; 282 {
 278  014b               _EXTI_SetHalfPortSelection:
 279  014b 89            	pushw	x
 280       00000000      OFST:	set	0
 282                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 283                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 284                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 285  014c 9e            	ld	a,xh
 286  014d a580          	bcp	a,#128
 287  014f 2616          	jrne	L55
 288                     ; 289     if (NewState != DISABLE)
 289  0151 7b02          	ld	a,(OFST+2,sp)
 290  0153 2707          	jreq	L75
 291                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 292  0155 c650a5        	ld	a,20645
 293  0158 1a01          	or	a,(OFST+1,sp)
 295  015a 2006          	jp	LC004
 296  015c               L75:
 297                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 298  015c 7b01          	ld	a,(OFST+1,sp)
 299  015e 43            	cpl	a
 300  015f c450a5        	and	a,20645
 301  0162               LC004:
 302  0162 c750a5        	ld	20645,a
 303  0165 2018          	jra	L36
 304  0167               L55:
 305                     ; 302     if (NewState != DISABLE)
 306  0167 7b02          	ld	a,(OFST+2,sp)
 307  0169 2709          	jreq	L56
 308                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 309  016b 7b01          	ld	a,(OFST+1,sp)
 310  016d a47f          	and	a,#127
 311  016f ca50ab        	or	a,20651
 313  0172 2008          	jp	LC003
 314  0174               L56:
 315                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 316  0174 7b01          	ld	a,(OFST+1,sp)
 317  0176 a47f          	and	a,#127
 318  0178 43            	cpl	a
 319  0179 c450ab        	and	a,20651
 320  017c               LC003:
 321  017c c750ab        	ld	20651,a
 322  017f               L36:
 323                     ; 313 }
 324  017f 85            	popw	x
 325  0180 81            	ret	
 327                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 327                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 327                     ; 340 {
 328  0181               _EXTI_SetPortSensitivity:
 329  0181 89            	pushw	x
 330       00000000      OFST:	set	0
 332                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 333                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 334                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 335  0182 9e            	ld	a,xh
 336  0183 a5f0          	bcp	a,#240
 337  0185 2629          	jrne	L17
 338                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 339  0187 7b01          	ld	a,(OFST+1,sp)
 340  0189 5f            	clrw	x
 341  018a 97            	ld	xl,a
 342  018b a603          	ld	a,#3
 343  018d 5d            	tnzw	x
 344  018e 2704          	jreq	L45
 345  0190               L65:
 346  0190 48            	sll	a
 347  0191 5a            	decw	x
 348  0192 26fc          	jrne	L65
 349  0194               L45:
 350  0194 43            	cpl	a
 351  0195 c450a2        	and	a,20642
 352  0198 c750a2        	ld	20642,a
 353                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 354  019b 7b01          	ld	a,(OFST+1,sp)
 355  019d 5f            	clrw	x
 356  019e 97            	ld	xl,a
 357  019f 7b02          	ld	a,(OFST+2,sp)
 358  01a1 5d            	tnzw	x
 359  01a2 2704          	jreq	L06
 360  01a4               L26:
 361  01a4 48            	sll	a
 362  01a5 5a            	decw	x
 363  01a6 26fc          	jrne	L26
 364  01a8               L06:
 365  01a8 ca50a2        	or	a,20642
 366  01ab c750a2        	ld	20642,a
 368  01ae 202b          	jra	L37
 369  01b0               L17:
 370                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 371  01b0 7b01          	ld	a,(OFST+1,sp)
 372  01b2 a40f          	and	a,#15
 373  01b4 5f            	clrw	x
 374  01b5 97            	ld	xl,a
 375  01b6 a603          	ld	a,#3
 376  01b8 5d            	tnzw	x
 377  01b9 2704          	jreq	L46
 378  01bb               L66:
 379  01bb 48            	sll	a
 380  01bc 5a            	decw	x
 381  01bd 26fc          	jrne	L66
 382  01bf               L46:
 383  01bf 43            	cpl	a
 384  01c0 c450aa        	and	a,20650
 385  01c3 c750aa        	ld	20650,a
 386                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 387  01c6 7b01          	ld	a,(OFST+1,sp)
 388  01c8 a40f          	and	a,#15
 389  01ca 5f            	clrw	x
 390  01cb 97            	ld	xl,a
 391  01cc 7b02          	ld	a,(OFST+2,sp)
 392  01ce 5d            	tnzw	x
 393  01cf 2704          	jreq	L07
 394  01d1               L27:
 395  01d1 48            	sll	a
 396  01d2 5a            	decw	x
 397  01d3 26fc          	jrne	L27
 398  01d5               L07:
 399  01d5 ca50aa        	or	a,20650
 400  01d8 c750aa        	ld	20650,a
 401  01db               L37:
 402                     ; 360 }
 403  01db 85            	popw	x
 404  01dc 81            	ret	
 406                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
 406                     ; 377 {
 407  01dd               _EXTI_GetPinSensitivity:
 408  01dd 88            	push	a
 409       00000001      OFST:	set	1
 411                     ; 378   uint8_t value = 0;
 412  01de 0f01          	clr	(OFST+0,sp)
 413                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 414                     ; 383   switch (EXTI_Pin)
 416                     ; 409     default:
 416                     ; 410       break;
 417  01e0 4d            	tnz	a
 418  01e1 2720          	jreq	L57
 419  01e3 a002          	sub	a,#2
 420  01e5 2721          	jreq	L77
 421  01e7 a002          	sub	a,#2
 422  01e9 2722          	jreq	L101
 423  01eb a002          	sub	a,#2
 424  01ed 2724          	jreq	L301
 425  01ef a00a          	sub	a,#10
 426  01f1 2725          	jreq	L501
 427  01f3 a002          	sub	a,#2
 428  01f5 2726          	jreq	L701
 429  01f7 a002          	sub	a,#2
 430  01f9 272b          	jreq	L111
 431  01fb a002          	sub	a,#2
 432  01fd 272d          	jreq	L311
 433  01ff 7b01          	ld	a,(OFST+0,sp)
 434  0201 2033          	jra	LC005
 435  0203               L57:
 436                     ; 385     case EXTI_Pin_0:
 436                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 437  0203 c650a0        	ld	a,20640
 438                     ; 387       break;
 439  0206 202c          	jp	LC006
 440  0208               L77:
 441                     ; 388     case EXTI_Pin_1:
 441                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
 442  0208 c650a0        	ld	a,20640
 443                     ; 390       break;
 444  020b 2013          	jp	LC008
 445  020d               L101:
 446                     ; 391     case EXTI_Pin_2:
 446                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
 447  020d c650a0        	ld	a,20640
 448  0210 4e            	swap	a
 449                     ; 393       break;
 450  0211 2021          	jp	LC006
 451  0213               L301:
 452                     ; 394     case EXTI_Pin_3:
 452                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
 453  0213 c650a0        	ld	a,20640
 454                     ; 396       break;
 455  0216 2017          	jp	LC007
 456  0218               L501:
 457                     ; 397     case EXTI_Pin_4:
 457                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 458  0218 c650a1        	ld	a,20641
 459                     ; 399       break;
 460  021b 2017          	jp	LC006
 461  021d               L701:
 462                     ; 400     case EXTI_Pin_5:
 462                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 463  021d c650a1        	ld	a,20641
 464  0220               LC008:
 465  0220 a40c          	and	a,#12
 466  0222 44            	srl	a
 467  0223 44            	srl	a
 468                     ; 402       break;
 469  0224 2010          	jp	LC005
 470  0226               L111:
 471                     ; 403     case EXTI_Pin_6:
 471                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 472  0226 c650a1        	ld	a,20641
 473  0229 4e            	swap	a
 474                     ; 405       break;
 475  022a 2008          	jp	LC006
 476  022c               L311:
 477                     ; 406     case EXTI_Pin_7:
 477                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 478  022c c650a1        	ld	a,20641
 479  022f               LC007:
 480  022f 4e            	swap	a
 481  0230 a40c          	and	a,#12
 482  0232 44            	srl	a
 483  0233 44            	srl	a
 484  0234               LC006:
 485  0234 a403          	and	a,#3
 486  0236               LC005:
 487                     ; 408       break;
 488                     ; 409     default:
 488                     ; 410       break;
 489                     ; 412   return((EXTI_Trigger_TypeDef)value);
 491  0236 5b01          	addw	sp,#1
 492  0238 81            	ret	
 494                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 494                     ; 428 {
 495  0239               _EXTI_GetPortSensitivity:
 496       00000001      OFST:	set	1
 498                     ; 429   uint8_t portsensitivity = 0;
 499                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
 500                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
 501  0239 a5f0          	bcp	a,#240
 502  023b 260e          	jrne	L321
 503                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
 504  023d 5f            	clrw	x
 505  023e 97            	ld	xl,a
 506  023f c650a2        	ld	a,20642
 507  0242 5d            	tnzw	x
 508  0243 2714          	jreq	L401
 509  0245               L201:
 510  0245 44            	srl	a
 511  0246 5a            	decw	x
 512  0247 26fc          	jrne	L201
 514  0249 200e          	jra	L401
 515  024b               L321:
 516                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
 517  024b a40f          	and	a,#15
 518  024d 5f            	clrw	x
 519  024e 97            	ld	xl,a
 520  024f c650aa        	ld	a,20650
 521  0252 5d            	tnzw	x
 522  0253 2704          	jreq	L401
 523  0255               L601:
 524  0255 44            	srl	a
 525  0256 5a            	decw	x
 526  0257 26fc          	jrne	L601
 527  0259               L401:
 528  0259 a403          	and	a,#3
 529                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
 531  025b 81            	ret	
 533                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
 533                     ; 488 {
 534  025c               _EXTI_GetITStatus:
 535  025c 89            	pushw	x
 536  025d 88            	push	a
 537       00000001      OFST:	set	1
 539                     ; 489   ITStatus status = RESET;
 540                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
 541                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
 542  025e 01            	rrwa	x,a
 543  025f 4f            	clr	a
 544  0260 02            	rlwa	x,a
 545  0261 a30100        	cpw	x,#256
 546  0264 2607          	jrne	L721
 547                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
 548  0266 7b03          	ld	a,(OFST+2,sp)
 549  0268 c450a4        	and	a,20644
 551  026b 2005          	jra	L131
 552  026d               L721:
 553                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
 554  026d 7b03          	ld	a,(OFST+2,sp)
 555  026f c450a3        	and	a,20643
 556  0272               L131:
 557                     ; 501   return((ITStatus)status);
 559  0272 5b03          	addw	sp,#3
 560  0274 81            	ret	
 562                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
 562                     ; 525 {
 563  0275               _EXTI_ClearITPendingBit:
 564  0275 89            	pushw	x
 565  0276 89            	pushw	x
 566       00000002      OFST:	set	2
 568                     ; 526   uint16_t tempvalue = 0;
 569                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
 570                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
 571  0277 01            	rrwa	x,a
 572  0278 4f            	clr	a
 573  0279 02            	rlwa	x,a
 574  027a 1f01          	ldw	(OFST-1,sp),x
 575                     ; 533   if ( tempvalue == 0x0100)
 576  027c a30100        	cpw	x,#256
 577  027f 2607          	jrne	L331
 578                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
 579  0281 7b04          	ld	a,(OFST+2,sp)
 580  0283 c750a4        	ld	20644,a
 582  0286 2005          	jra	L531
 583  0288               L331:
 584                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
 585  0288 7b04          	ld	a,(OFST+2,sp)
 586  028a c750a3        	ld	20643,a
 587  028d               L531:
 588                     ; 541 }
 589  028d 5b04          	addw	sp,#4
 590  028f 81            	ret	
 592                     	xdef	_EXTI_ClearITPendingBit
 593                     	xdef	_EXTI_GetITStatus
 594                     	xdef	_EXTI_GetPortSensitivity
 595                     	xdef	_EXTI_GetPinSensitivity
 596                     	xdef	_EXTI_SetPortSensitivity
 597                     	xdef	_EXTI_SetHalfPortSelection
 598                     	xdef	_EXTI_SelectPort
 599                     	xdef	_EXTI_SetPinSensitivity
 600                     	xdef	_EXTI_DeInit
 601                     	end
