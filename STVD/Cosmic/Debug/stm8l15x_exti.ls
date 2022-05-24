   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 123 void EXTI_DeInit(void)
  50                     ; 124 {
  52                     .text:	section	.text,new
  53  0000               _EXTI_DeInit:
  57                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  59  0000 725f50a0      	clr	20640
  60                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  62  0004 725f50a1      	clr	20641
  63                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  65  0008 725f50a2      	clr	20642
  66                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  68  000c 725f50aa      	clr	20650
  69                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  71  0010 35ff50a3      	mov	20643,#255
  72                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  74  0014 35ff50a4      	mov	20644,#255
  75                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  77  0018 725f50a5      	clr	20645
  78                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  80  001c 725f50ab      	clr	20651
  81                     ; 133 }
  84  0020 81            	ret	
 230                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 230                     ; 161 {
 231                     .text:	section	.text,new
 232  0000               _EXTI_SetPinSensitivity:
 234  0000 89            	pushw	x
 235       00000000      OFST:	set	0
 238                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 240                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 242                     ; 168   switch (EXTI_Pin)
 244  0001 9e            	ld	a,xh
 246                     ; 202     default:
 246                     ; 203       break;
 247  0002 4d            	tnz	a
 248  0003 2728          	jreq	L12
 249  0005 a002          	sub	a,#2
 250  0007 273b          	jreq	L32
 251  0009 a002          	sub	a,#2
 252  000b 274e          	jreq	L52
 253  000d a002          	sub	a,#2
 254  000f 2761          	jreq	L72
 255  0011 a00a          	sub	a,#10
 256  0013 277a          	jreq	L13
 257  0015 a002          	sub	a,#2
 258  0017 2603cc00a6    	jreq	L33
 259  001c a002          	sub	a,#2
 260  001e 2603cc00bd    	jreq	L53
 261  0023 a002          	sub	a,#2
 262  0025 2603cc00d4    	jreq	L73
 263  002a cc00ef        	jra	L721
 264  002d               L12:
 265                     ; 170     case EXTI_Pin_0:
 265                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 267  002d c650a0        	ld	a,20640
 268  0030 a4fc          	and	a,#252
 269  0032 c750a0        	ld	20640,a
 270                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 272  0035 7b01          	ld	a,(OFST+1,sp)
 273  0037 5f            	clrw	x
 274  0038 97            	ld	xl,a
 275  0039 7b02          	ld	a,(OFST+2,sp)
 276  003b 5d            	tnzw	x
 277  003c 2749          	jreq	L42
 278  003e               L21:
 279  003e 48            	sll	a
 280  003f 5a            	decw	x
 281  0040 26fc          	jrne	L21
 282                     ; 173       break;
 284  0042 2043          	jp	L42
 285  0044               L32:
 286                     ; 174     case EXTI_Pin_1:
 286                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 288  0044 c650a0        	ld	a,20640
 289  0047 a4f3          	and	a,#243
 290  0049 c750a0        	ld	20640,a
 291                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 293  004c 7b01          	ld	a,(OFST+1,sp)
 294  004e 5f            	clrw	x
 295  004f 97            	ld	xl,a
 296  0050 7b02          	ld	a,(OFST+2,sp)
 297  0052 5d            	tnzw	x
 298  0053 2732          	jreq	L42
 299  0055               L61:
 300  0055 48            	sll	a
 301  0056 5a            	decw	x
 302  0057 26fc          	jrne	L61
 303                     ; 177       break;
 305  0059 202c          	jp	L42
 306  005b               L52:
 307                     ; 178     case EXTI_Pin_2:
 307                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 309  005b c650a0        	ld	a,20640
 310  005e a4cf          	and	a,#207
 311  0060 c750a0        	ld	20640,a
 312                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 314  0063 7b01          	ld	a,(OFST+1,sp)
 315  0065 5f            	clrw	x
 316  0066 97            	ld	xl,a
 317  0067 7b02          	ld	a,(OFST+2,sp)
 318  0069 5d            	tnzw	x
 319  006a 271b          	jreq	L42
 320  006c               L22:
 321  006c 48            	sll	a
 322  006d 5a            	decw	x
 323  006e 26fc          	jrne	L22
 324                     ; 181       break;
 326  0070 2015          	jp	L42
 327  0072               L72:
 328                     ; 182     case EXTI_Pin_3:
 328                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 330  0072 c650a0        	ld	a,20640
 331  0075 a43f          	and	a,#63
 332  0077 c750a0        	ld	20640,a
 333                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 335  007a 7b01          	ld	a,(OFST+1,sp)
 336  007c 5f            	clrw	x
 337  007d 97            	ld	xl,a
 338  007e 7b02          	ld	a,(OFST+2,sp)
 339  0080 5d            	tnzw	x
 340  0081 2704          	jreq	L42
 341  0083               L62:
 342  0083 48            	sll	a
 343  0084 5a            	decw	x
 344  0085 26fc          	jrne	L62
 345  0087               L42:
 346  0087 ca50a0        	or	a,20640
 347  008a c750a0        	ld	20640,a
 348                     ; 185       break;
 350  008d 2060          	jra	L721
 351  008f               L13:
 352                     ; 186     case EXTI_Pin_4:
 352                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 354  008f c650a1        	ld	a,20641
 355  0092 a4fc          	and	a,#252
 356  0094 c750a1        	ld	20641,a
 357                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 359  0097 7b01          	ld	a,(OFST+1,sp)
 360  0099 ad56          	call	LC003
 361  009b 7b02          	ld	a,(OFST+2,sp)
 362  009d 5d            	tnzw	x
 363  009e 2749          	jreq	L44
 364  00a0               L23:
 365  00a0 48            	sll	a
 366  00a1 5a            	decw	x
 367  00a2 26fc          	jrne	L23
 368                     ; 189       break;
 370  00a4 2043          	jp	L44
 371  00a6               L33:
 372                     ; 190     case EXTI_Pin_5:
 372                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 374  00a6 c650a1        	ld	a,20641
 375  00a9 a4f3          	and	a,#243
 376  00ab c750a1        	ld	20641,a
 377                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 379  00ae 7b01          	ld	a,(OFST+1,sp)
 380  00b0 ad3f          	call	LC003
 381  00b2 7b02          	ld	a,(OFST+2,sp)
 382  00b4 5d            	tnzw	x
 383  00b5 2732          	jreq	L44
 384  00b7               L63:
 385  00b7 48            	sll	a
 386  00b8 5a            	decw	x
 387  00b9 26fc          	jrne	L63
 388                     ; 193       break;
 390  00bb 202c          	jp	L44
 391  00bd               L53:
 392                     ; 194     case EXTI_Pin_6:
 392                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 394  00bd c650a1        	ld	a,20641
 395  00c0 a4cf          	and	a,#207
 396  00c2 c750a1        	ld	20641,a
 397                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 399  00c5 7b01          	ld	a,(OFST+1,sp)
 400  00c7 ad28          	call	LC003
 401  00c9 7b02          	ld	a,(OFST+2,sp)
 402  00cb 5d            	tnzw	x
 403  00cc 271b          	jreq	L44
 404  00ce               L24:
 405  00ce 48            	sll	a
 406  00cf 5a            	decw	x
 407  00d0 26fc          	jrne	L24
 408                     ; 197       break;
 410  00d2 2015          	jp	L44
 411  00d4               L73:
 412                     ; 198     case EXTI_Pin_7:
 412                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 414  00d4 c650a1        	ld	a,20641
 415  00d7 a43f          	and	a,#63
 416  00d9 c750a1        	ld	20641,a
 417                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 419  00dc 7b01          	ld	a,(OFST+1,sp)
 420  00de ad11          	call	LC003
 421  00e0 7b02          	ld	a,(OFST+2,sp)
 422  00e2 5d            	tnzw	x
 423  00e3 2704          	jreq	L44
 424  00e5               L64:
 425  00e5 48            	sll	a
 426  00e6 5a            	decw	x
 427  00e7 26fc          	jrne	L64
 428  00e9               L44:
 429  00e9 ca50a1        	or	a,20641
 430  00ec c750a1        	ld	20641,a
 431                     ; 201       break;
 433                     ; 202     default:
 433                     ; 203       break;
 435  00ef               L721:
 436                     ; 205 }
 439  00ef 85            	popw	x
 440  00f0 81            	ret	
 441  00f1               LC003:
 442  00f1 a4ef          	and	a,#239
 443  00f3 5f            	clrw	x
 444  00f4 97            	ld	xl,a
 445  00f5 81            	ret	
 528                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 528                     ; 220 {
 529                     .text:	section	.text,new
 530  0000               _EXTI_SelectPort:
 532       00000000      OFST:	set	0
 535                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 537                     ; 224   if (EXTI_Port == EXTI_Port_B)
 539  0000 4d            	tnz	a
 540  0001 2605          	jrne	L761
 541                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 543  0003 721b50ab      	bres	20651,#5
 546  0007 81            	ret	
 547  0008               L761:
 548                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 550  0008 a102          	cp	a,#2
 551  000a 2605          	jrne	L371
 552                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 554  000c 721d50ab      	bres	20651,#6
 557  0010 81            	ret	
 558  0011               L371:
 559                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 561  0011 a104          	cp	a,#4
 562  0013 2605          	jrne	L771
 563                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 565  0015 721f50a5      	bres	20645,#7
 568  0019 81            	ret	
 569  001a               L771:
 570                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 572  001a a106          	cp	a,#6
 573  001c 2605          	jrne	L302
 574                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 576  001e 721e50a5      	bset	20645,#7
 579  0022 81            	ret	
 580  0023               L302:
 581                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 583  0023 a110          	cp	a,#16
 584  0025 2605          	jrne	L702
 585                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 587  0027 721a50ab      	bset	20651,#5
 590  002b 81            	ret	
 591  002c               L702:
 592                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 594  002c 721c50ab      	bset	20651,#6
 595                     ; 254 }
 598  0030 81            	ret	
 766                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 766                     ; 281                                FunctionalState NewState)
 766                     ; 282 {
 767                     .text:	section	.text,new
 768  0000               _EXTI_SetHalfPortSelection:
 770  0000 89            	pushw	x
 771       00000000      OFST:	set	0
 774                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 776                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 778                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 780  0001 9e            	ld	a,xh
 781  0002 a580          	bcp	a,#128
 782  0004 2616          	jrne	L103
 783                     ; 289     if (NewState != DISABLE)
 785  0006 7b02          	ld	a,(OFST+2,sp)
 786  0008 2707          	jreq	L303
 787                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 789  000a c650a5        	ld	a,20645
 790  000d 1a01          	or	a,(OFST+1,sp)
 792  000f 2006          	jp	LC005
 793  0011               L303:
 794                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 796  0011 7b01          	ld	a,(OFST+1,sp)
 797  0013 43            	cpl	a
 798  0014 c450a5        	and	a,20645
 799  0017               LC005:
 800  0017 c750a5        	ld	20645,a
 801  001a 2018          	jra	L703
 802  001c               L103:
 803                     ; 302     if (NewState != DISABLE)
 805  001c 7b02          	ld	a,(OFST+2,sp)
 806  001e 2709          	jreq	L113
 807                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 809  0020 7b01          	ld	a,(OFST+1,sp)
 810  0022 a47f          	and	a,#127
 811  0024 ca50ab        	or	a,20651
 813  0027 2008          	jp	LC004
 814  0029               L113:
 815                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 817  0029 7b01          	ld	a,(OFST+1,sp)
 818  002b a47f          	and	a,#127
 819  002d 43            	cpl	a
 820  002e c450ab        	and	a,20651
 821  0031               LC004:
 822  0031 c750ab        	ld	20651,a
 823  0034               L703:
 824                     ; 313 }
 827  0034 85            	popw	x
 828  0035 81            	ret	
 874                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 874                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 874                     ; 340 {
 875                     .text:	section	.text,new
 876  0000               _EXTI_SetPortSensitivity:
 878  0000 89            	pushw	x
 879       00000000      OFST:	set	0
 882                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 884                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 886                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 888  0001 9e            	ld	a,xh
 889  0002 a5f0          	bcp	a,#240
 890  0004 2629          	jrne	L733
 891                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 893  0006 7b01          	ld	a,(OFST+1,sp)
 894  0008 5f            	clrw	x
 895  0009 97            	ld	xl,a
 896  000a a603          	ld	a,#3
 897  000c 5d            	tnzw	x
 898  000d 2704          	jreq	L65
 899  000f               L06:
 900  000f 48            	sll	a
 901  0010 5a            	decw	x
 902  0011 26fc          	jrne	L06
 903  0013               L65:
 904  0013 43            	cpl	a
 905  0014 c450a2        	and	a,20642
 906  0017 c750a2        	ld	20642,a
 907                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 909  001a 7b01          	ld	a,(OFST+1,sp)
 910  001c 5f            	clrw	x
 911  001d 97            	ld	xl,a
 912  001e 7b02          	ld	a,(OFST+2,sp)
 913  0020 5d            	tnzw	x
 914  0021 2704          	jreq	L26
 915  0023               L46:
 916  0023 48            	sll	a
 917  0024 5a            	decw	x
 918  0025 26fc          	jrne	L46
 919  0027               L26:
 920  0027 ca50a2        	or	a,20642
 921  002a c750a2        	ld	20642,a
 923  002d 202b          	jra	L143
 924  002f               L733:
 925                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 927  002f 7b01          	ld	a,(OFST+1,sp)
 928  0031 a40f          	and	a,#15
 929  0033 5f            	clrw	x
 930  0034 97            	ld	xl,a
 931  0035 a603          	ld	a,#3
 932  0037 5d            	tnzw	x
 933  0038 2704          	jreq	L66
 934  003a               L07:
 935  003a 48            	sll	a
 936  003b 5a            	decw	x
 937  003c 26fc          	jrne	L07
 938  003e               L66:
 939  003e 43            	cpl	a
 940  003f c450aa        	and	a,20650
 941  0042 c750aa        	ld	20650,a
 942                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 944  0045 7b01          	ld	a,(OFST+1,sp)
 945  0047 a40f          	and	a,#15
 946  0049 5f            	clrw	x
 947  004a 97            	ld	xl,a
 948  004b 7b02          	ld	a,(OFST+2,sp)
 949  004d 5d            	tnzw	x
 950  004e 2704          	jreq	L27
 951  0050               L47:
 952  0050 48            	sll	a
 953  0051 5a            	decw	x
 954  0052 26fc          	jrne	L47
 955  0054               L27:
 956  0054 ca50aa        	or	a,20650
 957  0057 c750aa        	ld	20650,a
 958  005a               L143:
 959                     ; 360 }
 962  005a 85            	popw	x
 963  005b 81            	ret	
1007                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1007                     ; 377 {
1008                     .text:	section	.text,new
1009  0000               _EXTI_GetPinSensitivity:
1011  0000 88            	push	a
1012       00000001      OFST:	set	1
1015                     ; 378   uint8_t value = 0;
1017  0001 0f01          	clr	(OFST+0,sp)
1019                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1021                     ; 383   switch (EXTI_Pin)
1024                     ; 409     default:
1024                     ; 410       break;
1025  0003 4d            	tnz	a
1026  0004 2720          	jreq	L343
1027  0006 a002          	sub	a,#2
1028  0008 2721          	jreq	L543
1029  000a a002          	sub	a,#2
1030  000c 2722          	jreq	L743
1031  000e a002          	sub	a,#2
1032  0010 2724          	jreq	L153
1033  0012 a00a          	sub	a,#10
1034  0014 2725          	jreq	L353
1035  0016 a002          	sub	a,#2
1036  0018 2726          	jreq	L553
1037  001a a002          	sub	a,#2
1038  001c 272b          	jreq	L753
1039  001e a002          	sub	a,#2
1040  0020 272d          	jreq	L163
1041  0022 7b01          	ld	a,(OFST+0,sp)
1042  0024 2033          	jra	LC006
1043  0026               L343:
1044                     ; 385     case EXTI_Pin_0:
1044                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1046  0026 c650a0        	ld	a,20640
1047                     ; 387       break;
1049  0029 202c          	jp	LC007
1050  002b               L543:
1051                     ; 388     case EXTI_Pin_1:
1051                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1053  002b c650a0        	ld	a,20640
1054                     ; 390       break;
1056  002e 2013          	jp	LC009
1057  0030               L743:
1058                     ; 391     case EXTI_Pin_2:
1058                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1060  0030 c650a0        	ld	a,20640
1061  0033 4e            	swap	a
1062                     ; 393       break;
1064  0034 2021          	jp	LC007
1065  0036               L153:
1066                     ; 394     case EXTI_Pin_3:
1066                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1068  0036 c650a0        	ld	a,20640
1069                     ; 396       break;
1071  0039 2017          	jp	LC008
1072  003b               L353:
1073                     ; 397     case EXTI_Pin_4:
1073                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1075  003b c650a1        	ld	a,20641
1076                     ; 399       break;
1078  003e 2017          	jp	LC007
1079  0040               L553:
1080                     ; 400     case EXTI_Pin_5:
1080                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1082  0040 c650a1        	ld	a,20641
1083  0043               LC009:
1084  0043 a40c          	and	a,#12
1085  0045 44            	srl	a
1086  0046 44            	srl	a
1087                     ; 402       break;
1089  0047 2010          	jp	LC006
1090  0049               L753:
1091                     ; 403     case EXTI_Pin_6:
1091                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1093  0049 c650a1        	ld	a,20641
1094  004c 4e            	swap	a
1095                     ; 405       break;
1097  004d 2008          	jp	LC007
1098  004f               L163:
1099                     ; 406     case EXTI_Pin_7:
1099                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1101  004f c650a1        	ld	a,20641
1102  0052               LC008:
1103  0052 4e            	swap	a
1104  0053 a40c          	and	a,#12
1105  0055 44            	srl	a
1106  0056 44            	srl	a
1107  0057               LC007:
1108  0057 a403          	and	a,#3
1109  0059               LC006:
1111                     ; 408       break;
1113                     ; 409     default:
1113                     ; 410       break;
1115                     ; 412   return((EXTI_Trigger_TypeDef)value);
1119  0059 5b01          	addw	sp,#1
1120  005b 81            	ret	
1164                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1164                     ; 428 {
1165                     .text:	section	.text,new
1166  0000               _EXTI_GetPortSensitivity:
1168       00000001      OFST:	set	1
1171                     ; 429   uint8_t portsensitivity = 0;
1173                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1175                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1177  0000 a5f0          	bcp	a,#240
1178  0002 260e          	jrne	L134
1179                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1181  0004 5f            	clrw	x
1182  0005 97            	ld	xl,a
1183  0006 c650a2        	ld	a,20642
1184  0009 5d            	tnzw	x
1185  000a 2714          	jreq	L601
1186  000c               L401:
1187  000c 44            	srl	a
1188  000d 5a            	decw	x
1189  000e 26fc          	jrne	L401
1191  0010 200e          	jra	L601
1192  0012               L134:
1193                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1195  0012 a40f          	and	a,#15
1196  0014 5f            	clrw	x
1197  0015 97            	ld	xl,a
1198  0016 c650aa        	ld	a,20650
1199  0019 5d            	tnzw	x
1200  001a 2704          	jreq	L601
1201  001c               L011:
1202  001c 44            	srl	a
1203  001d 5a            	decw	x
1204  001e 26fc          	jrne	L011
1205  0020               L601:
1206  0020 a403          	and	a,#3
1208                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1212  0022 81            	ret	
1382                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1382                     ; 488 {
1383                     .text:	section	.text,new
1384  0000               _EXTI_GetITStatus:
1386  0000 89            	pushw	x
1387  0001 88            	push	a
1388       00000001      OFST:	set	1
1391                     ; 489   ITStatus status = RESET;
1393                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1395                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1397  0002 01            	rrwa	x,a
1398  0003 4f            	clr	a
1399  0004 02            	rlwa	x,a
1400  0005 a30100        	cpw	x,#256
1401  0008 2607          	jrne	L725
1402                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1404  000a 7b03          	ld	a,(OFST+2,sp)
1405  000c c450a4        	and	a,20644
1408  000f 2005          	jra	L135
1409  0011               L725:
1410                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1412  0011 7b03          	ld	a,(OFST+2,sp)
1413  0013 c450a3        	and	a,20643
1415  0016               L135:
1416                     ; 501   return((ITStatus)status);
1420  0016 5b03          	addw	sp,#3
1421  0018 81            	ret	
1464                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1464                     ; 525 {
1465                     .text:	section	.text,new
1466  0000               _EXTI_ClearITPendingBit:
1468  0000 89            	pushw	x
1469  0001 89            	pushw	x
1470       00000002      OFST:	set	2
1473                     ; 526   uint16_t tempvalue = 0;
1475                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1477                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1479  0002 01            	rrwa	x,a
1480  0003 4f            	clr	a
1481  0004 02            	rlwa	x,a
1482  0005 1f01          	ldw	(OFST-1,sp),x
1484                     ; 533   if ( tempvalue == 0x0100)
1486  0007 a30100        	cpw	x,#256
1487  000a 2607          	jrne	L355
1488                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1490  000c 7b04          	ld	a,(OFST+2,sp)
1491  000e c750a4        	ld	20644,a
1493  0011 2005          	jra	L555
1494  0013               L355:
1495                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1497  0013 7b04          	ld	a,(OFST+2,sp)
1498  0015 c750a3        	ld	20643,a
1499  0018               L555:
1500                     ; 541 }
1503  0018 5b04          	addw	sp,#4
1504  001a 81            	ret	
1517                     	xdef	_EXTI_ClearITPendingBit
1518                     	xdef	_EXTI_GetITStatus
1519                     	xdef	_EXTI_GetPortSensitivity
1520                     	xdef	_EXTI_GetPinSensitivity
1521                     	xdef	_EXTI_SetPortSensitivity
1522                     	xdef	_EXTI_SetHalfPortSelection
1523                     	xdef	_EXTI_SelectPort
1524                     	xdef	_EXTI_SetPinSensitivity
1525                     	xdef	_EXTI_DeInit
1544                     	end
