   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
 206                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 206                     ; 142 {
 208                     .text:	section	.text,new
 209  0000               _I2C_DeInit:
 213                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 215  0000 7f            	clr	(x)
 216                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 218  0001 6f01          	clr	(1,x)
 219                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 221  0003 6f02          	clr	(2,x)
 222                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 224  0005 6f03          	clr	(3,x)
 225                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 227  0007 6f04          	clr	(4,x)
 228                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 230  0009 6f05          	clr	(5,x)
 231                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 233  000b 6f0a          	clr	(10,x)
 234                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 236  000d 6f0b          	clr	(11,x)
 237                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 239  000f 6f0c          	clr	(12,x)
 240                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 242  0011 a602          	ld	a,#2
 243  0013 e70d          	ld	(13,x),a
 244                     ; 153 }
 247  0015 81            	ret	
 459                     .const:	section	.text
 460  0000               L21:
 461  0000 000f4240      	dc.l	1000000
 462  0004               L41:
 463  0004 000186a1      	dc.l	100001
 464  0008               L61:
 465  0008 00000004      	dc.l	4
 466                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 466                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 466                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 466                     ; 187 {
 467                     .text:	section	.text,new
 468  0000               _I2C_Init:
 470  0000 89            	pushw	x
 471  0001 520c          	subw	sp,#12
 472       0000000c      OFST:	set	12
 475                     ; 188   uint32_t result = 0x0004;
 477                     ; 189   uint16_t tmpval = 0;
 479                     ; 190   uint8_t tmpccrh = 0;
 481  0003 0f07          	clr	(OFST-5,sp)
 483                     ; 191   uint8_t input_clock = 0;
 485                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 487                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 489                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 491                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 493                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 495                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 497                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 499  0005 cd0000        	call	_CLK_GetClockFreq
 501  0008 ae0000        	ldw	x,#L21
 502  000b cd0000        	call	c_ludv
 504  000e b603          	ld	a,c_lreg+3
 505  0010 6b08          	ld	(OFST-4,sp),a
 507                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 509  0012 1e0d          	ldw	x,(OFST+1,sp)
 510  0014 e602          	ld	a,(2,x)
 511  0016 a4c0          	and	a,#192
 512  0018 e702          	ld	(2,x),a
 513                     ; 209   I2Cx->FREQR |= input_clock;
 515  001a e602          	ld	a,(2,x)
 516  001c 1a08          	or	a,(OFST-4,sp)
 517  001e e702          	ld	(2,x),a
 518                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 520  0020 f6            	ld	a,(x)
 521  0021 a4fe          	and	a,#254
 522  0023 f7            	ld	(x),a
 523                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 525  0024 e60c          	ld	a,(12,x)
 526  0026 a430          	and	a,#48
 527  0028 e70c          	ld	(12,x),a
 528                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 530  002a 6f0b          	clr	(11,x)
 531                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 533  002c 96            	ldw	x,sp
 534  002d 1c0011        	addw	x,#OFST+5
 535  0030 cd0000        	call	c_ltor
 537  0033 ae0004        	ldw	x,#L41
 538  0036 cd0000        	call	c_lcmp
 540  0039 2576          	jrult	L742
 541                     ; 223     tmpccrh = I2C_CCRH_FS;
 543  003b a680          	ld	a,#128
 544  003d 6b07          	ld	(OFST-5,sp),a
 546                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 548  003f 96            	ldw	x,sp
 549  0040 0d18          	tnz	(OFST+12,sp)
 550  0042 2623          	jrne	L152
 551                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 553  0044 1c0011        	addw	x,#OFST+5
 554  0047 cd0000        	call	c_ltor
 556  004a a603          	ld	a,#3
 557  004c cd0000        	call	c_smul
 559  004f 96            	ldw	x,sp
 560  0050 5c            	incw	x
 561  0051 cd0000        	call	c_rtol
 564  0054 7b08          	ld	a,(OFST-4,sp)
 565  0056 cd012b        	call	LC001
 567  0059 96            	ldw	x,sp
 568  005a 5c            	incw	x
 569  005b cd0000        	call	c_ludv
 571  005e 96            	ldw	x,sp
 572  005f 1c0009        	addw	x,#OFST-3
 573  0062 cd0000        	call	c_rtol
 577  0065 2027          	jra	L352
 578  0067               L152:
 579                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 581  0067 1c0011        	addw	x,#OFST+5
 582  006a cd0000        	call	c_ltor
 584  006d a619          	ld	a,#25
 585  006f cd0000        	call	c_smul
 587  0072 96            	ldw	x,sp
 588  0073 5c            	incw	x
 589  0074 cd0000        	call	c_rtol
 592  0077 7b08          	ld	a,(OFST-4,sp)
 593  0079 cd012b        	call	LC001
 595  007c 96            	ldw	x,sp
 596  007d 5c            	incw	x
 597  007e cd0000        	call	c_ludv
 599  0081 96            	ldw	x,sp
 600  0082 1c0009        	addw	x,#OFST-3
 601  0085 cd0000        	call	c_rtol
 604                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 606  0088 7b07          	ld	a,(OFST-5,sp)
 607  008a aa40          	or	a,#64
 608  008c 6b07          	ld	(OFST-5,sp),a
 610  008e               L352:
 611                     ; 239     if (result < (uint16_t)0x01)
 613  008e 96            	ldw	x,sp
 614  008f 1c0009        	addw	x,#OFST-3
 615  0092 cd0000        	call	c_lzmp
 617  0095 2608          	jrne	L552
 618                     ; 242       result = (uint16_t)0x0001;
 620  0097 ae0001        	ldw	x,#1
 621  009a 1f0b          	ldw	(OFST-1,sp),x
 622  009c 5f            	clrw	x
 623  009d 1f09          	ldw	(OFST-3,sp),x
 625  009f               L552:
 626                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 628  009f 7b08          	ld	a,(OFST-4,sp)
 629  00a1 97            	ld	xl,a
 630  00a2 a603          	ld	a,#3
 631  00a4 42            	mul	x,a
 632  00a5 a60a          	ld	a,#10
 633  00a7 cd0000        	call	c_sdivx
 635  00aa 5c            	incw	x
 636  00ab 1f05          	ldw	(OFST-7,sp),x
 638                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 640  00ad 7b06          	ld	a,(OFST-6,sp)
 642  00af 2046          	jra	L752
 643  00b1               L742:
 644                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 646  00b1 96            	ldw	x,sp
 647  00b2 1c0011        	addw	x,#OFST+5
 648  00b5 cd0000        	call	c_ltor
 650  00b8 3803          	sll	c_lreg+3
 651  00ba 3902          	rlc	c_lreg+2
 652  00bc 3901          	rlc	c_lreg+1
 653  00be 96            	ldw	x,sp
 654  00bf 3900          	rlc	c_lreg
 655  00c1 5c            	incw	x
 656  00c2 cd0000        	call	c_rtol
 659  00c5 7b08          	ld	a,(OFST-4,sp)
 660  00c7 ad62          	call	LC001
 662  00c9 96            	ldw	x,sp
 663  00ca 5c            	incw	x
 664  00cb cd0000        	call	c_ludv
 666  00ce b602          	ld	a,c_lreg+2
 667  00d0 97            	ld	xl,a
 668  00d1 b603          	ld	a,c_lreg+3
 669  00d3 cd0000        	call	c_uitol
 671  00d6 96            	ldw	x,sp
 672  00d7 1c0009        	addw	x,#OFST-3
 673  00da cd0000        	call	c_rtol
 676                     ; 259     if (result < (uint16_t)0x0004)
 678  00dd 96            	ldw	x,sp
 679  00de 1c0009        	addw	x,#OFST-3
 680  00e1 cd0000        	call	c_ltor
 682  00e4 ae0008        	ldw	x,#L61
 683  00e7 cd0000        	call	c_lcmp
 685  00ea 2408          	jruge	L162
 686                     ; 262       result = (uint16_t)0x0004;
 688  00ec ae0004        	ldw	x,#4
 689  00ef 1f0b          	ldw	(OFST-1,sp),x
 690  00f1 5f            	clrw	x
 691  00f2 1f09          	ldw	(OFST-3,sp),x
 693  00f4               L162:
 694                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 696  00f4 7b08          	ld	a,(OFST-4,sp)
 697  00f6 4c            	inc	a
 698  00f7               L752:
 699  00f7 1e0d          	ldw	x,(OFST+1,sp)
 700  00f9 e70d          	ld	(13,x),a
 701                     ; 273   I2Cx->CCRL = (uint8_t)result;
 703  00fb 7b0c          	ld	a,(OFST+0,sp)
 704  00fd e70b          	ld	(11,x),a
 705                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 707  00ff 7b07          	ld	a,(OFST-5,sp)
 708  0101 e70c          	ld	(12,x),a
 709                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 711  0103 7b17          	ld	a,(OFST+11,sp)
 712  0105 aa01          	or	a,#1
 713  0107 fa            	or	a,(x)
 714  0108 f7            	ld	(x),a
 715                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 717  0109 e601          	ld	a,(1,x)
 718  010b 1a19          	or	a,(OFST+13,sp)
 719  010d e701          	ld	(1,x),a
 720                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 722  010f 7b16          	ld	a,(OFST+10,sp)
 723  0111 e703          	ld	(3,x),a
 724                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 724                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 726  0113 1e15          	ldw	x,(OFST+9,sp)
 727  0115 4f            	clr	a
 728  0116 01            	rrwa	x,a
 729  0117 48            	sll	a
 730  0118 01            	rrwa	x,a
 731  0119 49            	rlc	a
 732  011a a406          	and	a,#6
 733  011c 6b04          	ld	(OFST-8,sp),a
 735  011e 7b1a          	ld	a,(OFST+14,sp)
 736  0120 aa40          	or	a,#64
 737  0122 1a04          	or	a,(OFST-8,sp)
 738  0124 1e0d          	ldw	x,(OFST+1,sp)
 739  0126 e704          	ld	(4,x),a
 740                     ; 286 }
 743  0128 5b0e          	addw	sp,#14
 744  012a 81            	ret	
 745  012b               LC001:
 746  012b b703          	ld	c_lreg+3,a
 747  012d 3f02          	clr	c_lreg+2
 748  012f 3f01          	clr	c_lreg+1
 749  0131 3f00          	clr	c_lreg
 750  0133 ae0000        	ldw	x,#L21
 751  0136 cc0000        	jp	c_lmul
 818                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 818                     ; 296 {
 819                     .text:	section	.text,new
 820  0000               _I2C_Cmd:
 822       fffffffe      OFST: set -2
 825                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 827                     ; 301   if (NewState != DISABLE)
 829  0000 7b03          	ld	a,(OFST+5,sp)
 830  0002 2705          	jreq	L713
 831                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 833  0004 f6            	ld	a,(x)
 834  0005 aa01          	or	a,#1
 836  0007 2003          	jra	L123
 837  0009               L713:
 838                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 840  0009 f6            	ld	a,(x)
 841  000a a4fe          	and	a,#254
 842  000c               L123:
 843  000c f7            	ld	(x),a
 844                     ; 311 }
 847  000d 81            	ret	
 894                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 894                     ; 321 {
 895                     .text:	section	.text,new
 896  0000               _I2C_GeneralCallCmd:
 898       fffffffe      OFST: set -2
 901                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 903                     ; 326   if (NewState != DISABLE)
 905  0000 7b03          	ld	a,(OFST+5,sp)
 906  0002 2705          	jreq	L743
 907                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 909  0004 f6            	ld	a,(x)
 910  0005 aa40          	or	a,#64
 912  0007 2003          	jra	L153
 913  0009               L743:
 914                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 916  0009 f6            	ld	a,(x)
 917  000a a4bf          	and	a,#191
 918  000c               L153:
 919  000c f7            	ld	(x),a
 920                     ; 336 }
 923  000d 81            	ret	
 970                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 970                     ; 348 {
 971                     .text:	section	.text,new
 972  0000               _I2C_GenerateSTART:
 974       fffffffe      OFST: set -2
 977                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 979                     ; 353   if (NewState != DISABLE)
 981  0000 7b03          	ld	a,(OFST+5,sp)
 982  0002 2706          	jreq	L773
 983                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 985  0004 e601          	ld	a,(1,x)
 986  0006 aa01          	or	a,#1
 988  0008 2004          	jra	L104
 989  000a               L773:
 990                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 992  000a e601          	ld	a,(1,x)
 993  000c a4fe          	and	a,#254
 994  000e               L104:
 995  000e e701          	ld	(1,x),a
 996                     ; 363 }
 999  0010 81            	ret	
1046                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1046                     ; 373 {
1047                     .text:	section	.text,new
1048  0000               _I2C_GenerateSTOP:
1050       fffffffe      OFST: set -2
1053                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1055                     ; 378   if (NewState != DISABLE)
1057  0000 7b03          	ld	a,(OFST+5,sp)
1058  0002 2706          	jreq	L724
1059                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1061  0004 e601          	ld	a,(1,x)
1062  0006 aa02          	or	a,#2
1064  0008 2004          	jra	L134
1065  000a               L724:
1066                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1068  000a e601          	ld	a,(1,x)
1069  000c a4fd          	and	a,#253
1070  000e               L134:
1071  000e e701          	ld	(1,x),a
1072                     ; 388 }
1075  0010 81            	ret	
1123                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1123                     ; 398 {
1124                     .text:	section	.text,new
1125  0000               _I2C_SoftwareResetCmd:
1127       fffffffe      OFST: set -2
1130                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1132                     ; 402   if (NewState != DISABLE)
1134  0000 7b03          	ld	a,(OFST+5,sp)
1135  0002 2706          	jreq	L754
1136                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1138  0004 e601          	ld	a,(1,x)
1139  0006 aa80          	or	a,#128
1141  0008 2004          	jra	L164
1142  000a               L754:
1143                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1145  000a e601          	ld	a,(1,x)
1146  000c a47f          	and	a,#127
1147  000e               L164:
1148  000e e701          	ld	(1,x),a
1149                     ; 412 }
1152  0010 81            	ret	
1200                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1200                     ; 422 {
1201                     .text:	section	.text,new
1202  0000               _I2C_StretchClockCmd:
1204       fffffffe      OFST: set -2
1207                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1209                     ; 426   if (NewState != DISABLE)
1211  0000 7b03          	ld	a,(OFST+5,sp)
1212  0002 2705          	jreq	L705
1213                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1215  0004 f6            	ld	a,(x)
1216  0005 a47f          	and	a,#127
1218  0007 2003          	jra	L115
1219  0009               L705:
1220                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1222  0009 f6            	ld	a,(x)
1223  000a aa80          	or	a,#128
1224  000c               L115:
1225  000c f7            	ld	(x),a
1226                     ; 437 }
1229  000d 81            	ret	
1276                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1276                     ; 447 {
1277                     .text:	section	.text,new
1278  0000               _I2C_ARPCmd:
1280       fffffffe      OFST: set -2
1283                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1285                     ; 451   if (NewState != DISABLE)
1287  0000 7b03          	ld	a,(OFST+5,sp)
1288  0002 2705          	jreq	L735
1289                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1291  0004 f6            	ld	a,(x)
1292  0005 aa10          	or	a,#16
1294  0007 2003          	jra	L145
1295  0009               L735:
1296                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1298  0009 f6            	ld	a,(x)
1299  000a a4ef          	and	a,#239
1300  000c               L145:
1301  000c f7            	ld	(x),a
1302                     ; 462 }
1305  000d 81            	ret	
1353                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1353                     ; 472 {
1354                     .text:	section	.text,new
1355  0000               _I2C_AcknowledgeConfig:
1357       fffffffe      OFST: set -2
1360                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1362                     ; 476   if (NewState != DISABLE)
1364  0000 7b03          	ld	a,(OFST+5,sp)
1365  0002 2706          	jreq	L765
1366                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1368  0004 e601          	ld	a,(1,x)
1369  0006 aa04          	or	a,#4
1371  0008 2004          	jra	L175
1372  000a               L765:
1373                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1375  000a e601          	ld	a,(1,x)
1376  000c a4fb          	and	a,#251
1377  000e               L175:
1378  000e e701          	ld	(1,x),a
1379                     ; 486 }
1382  0010 81            	ret	
1434                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1434                     ; 495 {
1435                     .text:	section	.text,new
1436  0000               _I2C_OwnAddress2Config:
1438  0000 89            	pushw	x
1439  0001 88            	push	a
1440       00000001      OFST:	set	1
1443                     ; 496   uint8_t tmpreg = 0;
1445                     ; 499   tmpreg = I2Cx->OAR2;
1447  0002 e605          	ld	a,(5,x)
1449                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1451  0004 a401          	and	a,#1
1452  0006 6b01          	ld	(OFST+0,sp),a
1454                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1456  0008 7b06          	ld	a,(OFST+5,sp)
1457  000a a4fe          	and	a,#254
1458  000c 1a01          	or	a,(OFST+0,sp)
1459  000e 6b01          	ld	(OFST+0,sp),a
1461                     ; 508   I2Cx->OAR2 = tmpreg;
1463  0010 1e02          	ldw	x,(OFST+1,sp)
1464  0012 e705          	ld	(5,x),a
1465                     ; 509 }
1468  0014 5b03          	addw	sp,#3
1469  0016 81            	ret	
1516                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1516                     ; 519 {
1517                     .text:	section	.text,new
1518  0000               _I2C_DualAddressCmd:
1520       fffffffe      OFST: set -2
1523                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1525                     ; 523   if (NewState != DISABLE)
1527  0000 7b03          	ld	a,(OFST+5,sp)
1528  0002 2706          	jreq	L346
1529                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1531  0004 e605          	ld	a,(5,x)
1532  0006 aa01          	or	a,#1
1534  0008 2004          	jra	L546
1535  000a               L346:
1536                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1538  000a e605          	ld	a,(5,x)
1539  000c a4fe          	and	a,#254
1540  000e               L546:
1541  000e e705          	ld	(5,x),a
1542                     ; 533 }
1545  0010 81            	ret	
1615                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1615                     ; 546 {
1616                     .text:	section	.text,new
1617  0000               _I2C_AckPositionConfig:
1619       fffffffe      OFST: set -2
1622                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1624                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1626  0000 e601          	ld	a,(1,x)
1627  0002 a4f7          	and	a,#247
1628  0004 e701          	ld	(1,x),a
1629                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1631  0006 e601          	ld	a,(1,x)
1632  0008 1a03          	or	a,(OFST+5,sp)
1633  000a e701          	ld	(1,x),a
1634                     ; 554 }
1637  000c 81            	ret	
1706                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1706                     ; 566 {
1707                     .text:	section	.text,new
1708  0000               _I2C_SMBusAlertConfig:
1710       fffffffe      OFST: set -2
1713                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1715                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1717  0000 7b03          	ld	a,(OFST+5,sp)
1718  0002 2706          	jreq	L737
1719                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1721  0004 e601          	ld	a,(1,x)
1722  0006 aa20          	or	a,#32
1724  0008 2004          	jra	L147
1725  000a               L737:
1726                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1728  000a e601          	ld	a,(1,x)
1729  000c a4df          	and	a,#223
1730  000e               L147:
1731  000e e701          	ld	(1,x),a
1732                     ; 581 }
1735  0010 81            	ret	
1783                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1783                     ; 593 {
1784                     .text:	section	.text,new
1785  0000               _I2C_FastModeDutyCycleConfig:
1787       fffffffe      OFST: set -2
1790                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1792                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1794  0000 7b03          	ld	a,(OFST+5,sp)
1795  0002 a140          	cp	a,#64
1796  0004 2606          	jrne	L767
1797                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1799  0006 e60c          	ld	a,(12,x)
1800  0008 aa40          	or	a,#64
1802  000a 2004          	jra	L177
1803  000c               L767:
1804                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1806  000c e60c          	ld	a,(12,x)
1807  000e a4bf          	and	a,#191
1808  0010               L177:
1809  0010 e70c          	ld	(12,x),a
1810                     ; 608 }
1813  0012 81            	ret	
1890                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1890                     ; 622 {
1891                     .text:	section	.text,new
1892  0000               _I2C_Send7bitAddress:
1894  0000 89            	pushw	x
1895       00000000      OFST:	set	0
1898                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1900                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1902                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1904  0001 7b06          	ld	a,(OFST+6,sp)
1905  0003 2706          	jreq	L1301
1906                     ; 631     Address |= OAR1_ADD0_Set;
1908  0005 7b05          	ld	a,(OFST+5,sp)
1909  0007 aa01          	or	a,#1
1911  0009 2004          	jra	L3301
1912  000b               L1301:
1913                     ; 636     Address &= OAR1_ADD0_Reset;
1915  000b 7b05          	ld	a,(OFST+5,sp)
1916  000d a4fe          	and	a,#254
1917  000f               L3301:
1918  000f 6b05          	ld	(OFST+5,sp),a
1919                     ; 639   I2Cx->DR = Address;
1921  0011 1e01          	ldw	x,(OFST+1,sp)
1922  0013 e706          	ld	(6,x),a
1923                     ; 640 }
1926  0015 85            	popw	x
1927  0016 81            	ret	
1971                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1971                     ; 665 {
1972                     .text:	section	.text,new
1973  0000               _I2C_SendData:
1975       fffffffe      OFST: set -2
1978                     ; 667   I2Cx->DR = Data;
1980  0000 7b03          	ld	a,(OFST+5,sp)
1981  0002 e706          	ld	(6,x),a
1982                     ; 668 }
1985  0004 81            	ret	
2022                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2022                     ; 677 {
2023                     .text:	section	.text,new
2024  0000               _I2C_ReceiveData:
2028                     ; 679   return ((uint8_t)I2Cx->DR);
2030  0000 e606          	ld	a,(6,x)
2033  0002 81            	ret	
2080                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2080                     ; 706 {
2081                     .text:	section	.text,new
2082  0000               _I2C_TransmitPEC:
2084       fffffffe      OFST: set -2
2087                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2089                     ; 710   if (NewState != DISABLE)
2091  0000 7b03          	ld	a,(OFST+5,sp)
2092  0002 2706          	jreq	L3211
2093                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2095  0004 e601          	ld	a,(1,x)
2096  0006 aa10          	or	a,#16
2098  0008 2004          	jra	L5211
2099  000a               L3211:
2100                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2102  000a e601          	ld	a,(1,x)
2103  000c a4ef          	and	a,#239
2104  000e               L5211:
2105  000e e701          	ld	(1,x),a
2106                     ; 720 }
2109  0010 81            	ret	
2156                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2156                     ; 730 {
2157                     .text:	section	.text,new
2158  0000               _I2C_CalculatePEC:
2160       fffffffe      OFST: set -2
2163                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2165                     ; 734   if (NewState != DISABLE)
2167  0000 7b03          	ld	a,(OFST+5,sp)
2168  0002 2705          	jreq	L3511
2169                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2171  0004 f6            	ld	a,(x)
2172  0005 aa20          	or	a,#32
2174  0007 2003          	jra	L5511
2175  0009               L3511:
2176                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2178  0009 f6            	ld	a,(x)
2179  000a a4df          	and	a,#223
2180  000c               L5511:
2181  000c f7            	ld	(x),a
2182                     ; 744 }
2185  000d 81            	ret	
2255                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2255                     ; 756 {
2256                     .text:	section	.text,new
2257  0000               _I2C_PECPositionConfig:
2259       fffffffe      OFST: set -2
2262                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2264                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2266  0000 e601          	ld	a,(1,x)
2267  0002 a4f7          	and	a,#247
2268  0004 e701          	ld	(1,x),a
2269                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2271  0006 e601          	ld	a,(1,x)
2272  0008 1a03          	or	a,(OFST+5,sp)
2273  000a e701          	ld	(1,x),a
2274                     ; 764 }
2277  000c 81            	ret	
2314                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2314                     ; 773 {
2315                     .text:	section	.text,new
2316  0000               _I2C_GetPEC:
2320                     ; 775   return (I2Cx->PECR);
2322  0000 e60e          	ld	a,(14,x)
2325  0002 81            	ret	
2372                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2372                     ; 804 {
2373                     .text:	section	.text,new
2374  0000               _I2C_DMACmd:
2376       fffffffe      OFST: set -2
2379                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2381                     ; 808   if (NewState != DISABLE)
2383  0000 7b03          	ld	a,(OFST+5,sp)
2384  0002 2706          	jreq	L7521
2385                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2387  0004 e60a          	ld	a,(10,x)
2388  0006 aa08          	or	a,#8
2390  0008 2004          	jra	L1621
2391  000a               L7521:
2392                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2394  000a e60a          	ld	a,(10,x)
2395  000c a4f7          	and	a,#247
2396  000e               L1621:
2397  000e e70a          	ld	(10,x),a
2398                     ; 818 }
2401  0010 81            	ret	
2449                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2449                     ; 828 {
2450                     .text:	section	.text,new
2451  0000               _I2C_DMALastTransferCmd:
2453       fffffffe      OFST: set -2
2456                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2458                     ; 832   if (NewState != DISABLE)
2460  0000 7b03          	ld	a,(OFST+5,sp)
2461  0002 2706          	jreq	L7031
2462                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2464  0004 e60a          	ld	a,(10,x)
2465  0006 aa10          	or	a,#16
2467  0008 2004          	jra	L1131
2468  000a               L7031:
2469                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2471  000a e60a          	ld	a,(10,x)
2472  000c a4ef          	and	a,#239
2473  000e               L1131:
2474  000e e70a          	ld	(10,x),a
2475                     ; 842 }
2478  0010 81            	ret	
2667                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2667                     ; 955 {
2668                     .text:	section	.text,new
2669  0000               _I2C_ITConfig:
2671       fffffffe      OFST: set -2
2674                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2676                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2678                     ; 960   if (NewState != DISABLE)
2680  0000 7b05          	ld	a,(OFST+7,sp)
2681  0002 2706          	jreq	L3141
2682                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2684  0004 e60a          	ld	a,(10,x)
2685  0006 1a04          	or	a,(OFST+6,sp)
2687  0008 2005          	jra	L5141
2688  000a               L3141:
2689                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2691  000a 7b04          	ld	a,(OFST+6,sp)
2692  000c 43            	cpl	a
2693  000d e40a          	and	a,(10,x)
2694  000f               L5141:
2695  000f e70a          	ld	(10,x),a
2696                     ; 970 }
2699  0011 81            	ret	
2860                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2860                     ; 995 {
2861                     .text:	section	.text,new
2862  0000               _I2C_ReadRegister:
2864  0000 89            	pushw	x
2865  0001 5204          	subw	sp,#4
2866       00000004      OFST:	set	4
2869                     ; 996   __IO uint16_t tmp = 0;
2871  0003 5f            	clrw	x
2872  0004 1f03          	ldw	(OFST-1,sp),x
2874                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2876                     ; 1000   tmp = (uint16_t) I2Cx;
2878  0006 1e05          	ldw	x,(OFST+1,sp)
2879  0008 1f03          	ldw	(OFST-1,sp),x
2881                     ; 1001   tmp += I2C_Register;
2883  000a 7b09          	ld	a,(OFST+5,sp)
2884  000c 5f            	clrw	x
2885  000d 97            	ld	xl,a
2886  000e 1f01          	ldw	(OFST-3,sp),x
2888  0010 72fb03        	addw	x,(OFST-1,sp)
2889  0013 1f03          	ldw	(OFST-1,sp),x
2891                     ; 1004   return (*(__IO uint8_t *) tmp);
2893  0015 1e03          	ldw	x,(OFST-1,sp)
2894  0017 f6            	ld	a,(x)
2897  0018 5b06          	addw	sp,#6
2898  001a 81            	ret	
3148                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3148                     ; 1045 {
3149                     .text:	section	.text,new
3150  0000               _I2C_CheckEvent:
3152  0000 89            	pushw	x
3153  0001 5206          	subw	sp,#6
3154       00000006      OFST:	set	6
3157                     ; 1046   __IO uint16_t lastevent = 0x00;
3159  0003 5f            	clrw	x
3160  0004 1f04          	ldw	(OFST-2,sp),x
3162                     ; 1047   uint8_t flag1 = 0x00 ;
3164                     ; 1048   uint8_t flag2 = 0x00;
3166                     ; 1049   ErrorStatus status = ERROR;
3168                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3170                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3172  0006 1e0b          	ldw	x,(OFST+5,sp)
3173  0008 a30004        	cpw	x,#4
3174  000b 260a          	jrne	L5261
3175                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3177  000d 1e07          	ldw	x,(OFST+1,sp)
3178  000f e608          	ld	a,(8,x)
3179  0011 a404          	and	a,#4
3180  0013 5f            	clrw	x
3181  0014 97            	ld	xl,a
3183  0015 201a          	jra	L7261
3184  0017               L5261:
3185                     ; 1060     flag1 = I2Cx->SR1;
3187  0017 1e07          	ldw	x,(OFST+1,sp)
3188  0019 e607          	ld	a,(7,x)
3189  001b 6b03          	ld	(OFST-3,sp),a
3191                     ; 1061     flag2 = I2Cx->SR3;
3193  001d e609          	ld	a,(9,x)
3194  001f 6b06          	ld	(OFST+0,sp),a
3196                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3198  0021 5f            	clrw	x
3199  0022 7b03          	ld	a,(OFST-3,sp)
3200  0024 97            	ld	xl,a
3201  0025 1f01          	ldw	(OFST-5,sp),x
3203  0027 5f            	clrw	x
3204  0028 7b06          	ld	a,(OFST+0,sp)
3205  002a 97            	ld	xl,a
3206  002b 7b02          	ld	a,(OFST-4,sp)
3207  002d 01            	rrwa	x,a
3208  002e 1a01          	or	a,(OFST-5,sp)
3209  0030 01            	rrwa	x,a
3210  0031               L7261:
3211  0031 1f04          	ldw	(OFST-2,sp),x
3213                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3215  0033 1e04          	ldw	x,(OFST-2,sp)
3216  0035 01            	rrwa	x,a
3217  0036 140c          	and	a,(OFST+6,sp)
3218  0038 01            	rrwa	x,a
3219  0039 140b          	and	a,(OFST+5,sp)
3220  003b 01            	rrwa	x,a
3221  003c 130b          	cpw	x,(OFST+5,sp)
3222  003e 2604          	jrne	L1361
3223                     ; 1068     status = SUCCESS;
3225  0040 a601          	ld	a,#1
3228  0042 2001          	jra	L3361
3229  0044               L1361:
3230                     ; 1073     status = ERROR;
3232  0044 4f            	clr	a
3234  0045               L3361:
3235                     ; 1077   return status;
3239  0045 5b08          	addw	sp,#8
3240  0047 81            	ret	
3301                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3301                     ; 1096 {
3302                     .text:	section	.text,new
3303  0000               _I2C_GetLastEvent:
3305  0000 89            	pushw	x
3306  0001 5206          	subw	sp,#6
3307       00000006      OFST:	set	6
3310                     ; 1097   __IO uint16_t lastevent = 0;
3312  0003 5f            	clrw	x
3313  0004 1f05          	ldw	(OFST-1,sp),x
3315                     ; 1098   uint16_t flag1 = 0;
3317                     ; 1099   uint16_t flag2 = 0;
3319                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3321  0006 1e07          	ldw	x,(OFST+1,sp)
3322  0008 e608          	ld	a,(8,x)
3323  000a a504          	bcp	a,#4
3324  000c 2705          	jreq	L5661
3325                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3327  000e ae0004        	ldw	x,#4
3329  0011 2014          	jra	L7661
3330  0013               L5661:
3331                     ; 1108     flag1 = I2Cx->SR1;
3333  0013 e607          	ld	a,(7,x)
3334  0015 5f            	clrw	x
3335  0016 97            	ld	xl,a
3336  0017 1f01          	ldw	(OFST-5,sp),x
3338                     ; 1109     flag2 = I2Cx->SR3;
3340  0019 1e07          	ldw	x,(OFST+1,sp)
3341  001b e609          	ld	a,(9,x)
3342  001d 5f            	clrw	x
3343  001e 97            	ld	xl,a
3344  001f 1f03          	ldw	(OFST-3,sp),x
3346                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3348  0021 7b02          	ld	a,(OFST-4,sp)
3349  0023 01            	rrwa	x,a
3350  0024 1a01          	or	a,(OFST-5,sp)
3351  0026 01            	rrwa	x,a
3352  0027               L7661:
3353  0027 1f05          	ldw	(OFST-1,sp),x
3355                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3357  0029 1e05          	ldw	x,(OFST-1,sp)
3360  002b 5b08          	addw	sp,#8
3361  002d 81            	ret	
3614                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3614                     ; 1153 {
3615                     .text:	section	.text,new
3616  0000               _I2C_GetFlagStatus:
3618  0000 89            	pushw	x
3619  0001 89            	pushw	x
3620       00000002      OFST:	set	2
3623                     ; 1154   uint8_t tempreg = 0;
3625  0002 0f02          	clr	(OFST+0,sp)
3627                     ; 1155   uint8_t regindex = 0;
3629                     ; 1156   FlagStatus bitstatus = RESET;
3631                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3633                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3635  0004 7b07          	ld	a,(OFST+5,sp)
3636  0006 6b01          	ld	(OFST-1,sp),a
3638                     ; 1164   switch (regindex)
3641                     ; 1181     default:
3641                     ; 1182       break;
3642  0008 4a            	dec	a
3643  0009 2708          	jreq	L1761
3644  000b 4a            	dec	a
3645  000c 270b          	jreq	L3761
3646  000e 4a            	dec	a
3647  000f 270e          	jreq	L5761
3648  0011 2012          	jra	L7202
3649  0013               L1761:
3650                     ; 1167     case 0x01:
3650                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3652  0013 1e03          	ldw	x,(OFST+1,sp)
3653  0015 e607          	ld	a,(7,x)
3654                     ; 1169       break;
3656  0017 200a          	jp	LC002
3657  0019               L3761:
3658                     ; 1172     case 0x02:
3658                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3660  0019 1e03          	ldw	x,(OFST+1,sp)
3661  001b e608          	ld	a,(8,x)
3662                     ; 1174       break;
3664  001d 2004          	jp	LC002
3665  001f               L5761:
3666                     ; 1177     case 0x03:
3666                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3668  001f 1e03          	ldw	x,(OFST+1,sp)
3669  0021 e609          	ld	a,(9,x)
3670  0023               LC002:
3671  0023 6b02          	ld	(OFST+0,sp),a
3673                     ; 1179       break;
3675                     ; 1181     default:
3675                     ; 1182       break;
3677  0025               L7202:
3678                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3680  0025 7b08          	ld	a,(OFST+6,sp)
3681  0027 1502          	bcp	a,(OFST+0,sp)
3682  0029 2704          	jreq	L1302
3683                     ; 1189     bitstatus = SET;
3685  002b a601          	ld	a,#1
3688  002d 2001          	jra	L3302
3689  002f               L1302:
3690                     ; 1194     bitstatus = RESET;
3692  002f 4f            	clr	a
3694  0030               L3302:
3695                     ; 1197   return bitstatus;
3699  0030 5b04          	addw	sp,#4
3700  0032 81            	ret	
3754                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3754                     ; 1230 {
3755                     .text:	section	.text,new
3756  0000               _I2C_ClearFlag:
3758  0000 89            	pushw	x
3759  0001 89            	pushw	x
3760       00000002      OFST:	set	2
3763                     ; 1231   uint16_t flagpos = 0;
3765                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3767                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3769  0002 7b08          	ld	a,(OFST+6,sp)
3770  0004 5f            	clrw	x
3771  0005 02            	rlwa	x,a
3772  0006 1f01          	ldw	(OFST-1,sp),x
3774                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3776  0008 7b02          	ld	a,(OFST+0,sp)
3777  000a 43            	cpl	a
3778  000b 1e03          	ldw	x,(OFST+1,sp)
3779  000d e708          	ld	(8,x),a
3780                     ; 1239 }
3783  000f 5b04          	addw	sp,#4
3784  0011 81            	ret	
3858                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3858                     ; 1265 {
3859                     .text:	section	.text,new
3860  0000               _I2C_GetITStatus:
3862  0000 89            	pushw	x
3863  0001 5204          	subw	sp,#4
3864       00000004      OFST:	set	4
3867                     ; 1266   ITStatus bitstatus = RESET;
3869                     ; 1267   __IO uint8_t enablestatus = 0;
3871  0003 0f03          	clr	(OFST-1,sp)
3873                     ; 1268   uint16_t tempregister = 0;
3875                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3877                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3879  0005 7b09          	ld	a,(OFST+5,sp)
3880  0007 a407          	and	a,#7
3881  0009 5f            	clrw	x
3882  000a 97            	ld	xl,a
3883  000b 1f01          	ldw	(OFST-3,sp),x
3885                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3887  000d 1e05          	ldw	x,(OFST+1,sp)
3888  000f e60a          	ld	a,(10,x)
3889  0011 1402          	and	a,(OFST-2,sp)
3890  0013 6b03          	ld	(OFST-1,sp),a
3892                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3894  0015 7b09          	ld	a,(OFST+5,sp)
3895  0017 a430          	and	a,#48
3896  0019 97            	ld	xl,a
3897  001a 4f            	clr	a
3898  001b 02            	rlwa	x,a
3899  001c a30100        	cpw	x,#256
3900  001f 260e          	jrne	L1212
3901                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3903  0021 1e05          	ldw	x,(OFST+1,sp)
3904  0023 e607          	ld	a,(7,x)
3905  0025 150a          	bcp	a,(OFST+6,sp)
3906  0027 2716          	jreq	L1312
3908  0029 0d03          	tnz	(OFST-1,sp)
3909  002b 2712          	jreq	L1312
3910                     ; 1284       bitstatus = SET;
3912  002d 200c          	jp	LC004
3913                     ; 1289       bitstatus = RESET;
3914  002f               L1212:
3915                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3917  002f 1e05          	ldw	x,(OFST+1,sp)
3918  0031 e608          	ld	a,(8,x)
3919  0033 150a          	bcp	a,(OFST+6,sp)
3920  0035 2708          	jreq	L1312
3922  0037 0d03          	tnz	(OFST-1,sp)
3923  0039 2704          	jreq	L1312
3924                     ; 1298       bitstatus = SET;
3926  003b               LC004:
3928  003b a601          	ld	a,#1
3931  003d 2001          	jra	L7212
3932  003f               L1312:
3933                     ; 1303       bitstatus = RESET;
3936  003f 4f            	clr	a
3938  0040               L7212:
3939                     ; 1307   return  bitstatus;
3943  0040 5b06          	addw	sp,#6
3944  0042 81            	ret	
3999                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3999                     ; 1341 {
4000                     .text:	section	.text,new
4001  0000               _I2C_ClearITPendingBit:
4003  0000 89            	pushw	x
4004  0001 89            	pushw	x
4005       00000002      OFST:	set	2
4008                     ; 1342   uint16_t flagpos = 0;
4010                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4012                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4014  0002 7b08          	ld	a,(OFST+6,sp)
4015  0004 5f            	clrw	x
4016  0005 02            	rlwa	x,a
4017  0006 1f01          	ldw	(OFST-1,sp),x
4019                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4021  0008 7b02          	ld	a,(OFST+0,sp)
4022  000a 43            	cpl	a
4023  000b 1e03          	ldw	x,(OFST+1,sp)
4024  000d e708          	ld	(8,x),a
4025                     ; 1352 }
4028  000f 5b04          	addw	sp,#4
4029  0011 81            	ret	
4042                     	xdef	_I2C_ClearITPendingBit
4043                     	xdef	_I2C_GetITStatus
4044                     	xdef	_I2C_ClearFlag
4045                     	xdef	_I2C_GetFlagStatus
4046                     	xdef	_I2C_GetLastEvent
4047                     	xdef	_I2C_CheckEvent
4048                     	xdef	_I2C_ReadRegister
4049                     	xdef	_I2C_ITConfig
4050                     	xdef	_I2C_DMALastTransferCmd
4051                     	xdef	_I2C_DMACmd
4052                     	xdef	_I2C_CalculatePEC
4053                     	xdef	_I2C_TransmitPEC
4054                     	xdef	_I2C_GetPEC
4055                     	xdef	_I2C_PECPositionConfig
4056                     	xdef	_I2C_ReceiveData
4057                     	xdef	_I2C_SendData
4058                     	xdef	_I2C_Send7bitAddress
4059                     	xdef	_I2C_SMBusAlertConfig
4060                     	xdef	_I2C_FastModeDutyCycleConfig
4061                     	xdef	_I2C_AckPositionConfig
4062                     	xdef	_I2C_DualAddressCmd
4063                     	xdef	_I2C_OwnAddress2Config
4064                     	xdef	_I2C_AcknowledgeConfig
4065                     	xdef	_I2C_GenerateSTOP
4066                     	xdef	_I2C_GenerateSTART
4067                     	xdef	_I2C_ARPCmd
4068                     	xdef	_I2C_StretchClockCmd
4069                     	xdef	_I2C_SoftwareResetCmd
4070                     	xdef	_I2C_GeneralCallCmd
4071                     	xdef	_I2C_Cmd
4072                     	xdef	_I2C_Init
4073                     	xdef	_I2C_DeInit
4074                     	xref	_CLK_GetClockFreq
4075                     	xref.b	c_lreg
4076                     	xref.b	c_x
4095                     	xref	c_uitol
4096                     	xref	c_sdivx
4097                     	xref	c_lzmp
4098                     	xref	c_rtol
4099                     	xref	c_smul
4100                     	xref	c_lmul
4101                     	xref	c_lcmp
4102                     	xref	c_ltor
4103                     	xref	c_ludv
4104                     	end
