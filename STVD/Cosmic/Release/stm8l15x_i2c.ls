   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
  17                     ; 142 {
  18                     	scross	off
  19  0000               _I2C_DeInit:
  21                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
  22  0000 7f            	clr	(x)
  23                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
  24  0001 6f01          	clr	(1,x)
  25                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
  26  0003 6f02          	clr	(2,x)
  27                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
  28  0005 6f03          	clr	(3,x)
  29                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
  30  0007 6f04          	clr	(4,x)
  31                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
  32  0009 6f05          	clr	(5,x)
  33                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
  34  000b 6f0a          	clr	(10,x)
  35                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
  36  000d 6f0b          	clr	(11,x)
  37                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
  38  000f 6f0c          	clr	(12,x)
  39                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
  40  0011 a602          	ld	a,#2
  41  0013 e70d          	ld	(13,x),a
  42                     ; 153 }
  43  0015 81            	ret	
  45                     .const:	section	.text
  46  0000               L01:
  47  0000 000f4240      	dc.l	1000000
  48  0004               L21:
  49  0004 000186a1      	dc.l	100001
  50  0008               L41:
  51  0008 00000004      	dc.l	4
  52                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
  52                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
  52                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
  52                     ; 187 {
  53                     	switch	.text
  54  0016               _I2C_Init:
  55  0016 89            	pushw	x
  56  0017 520c          	subw	sp,#12
  57       0000000c      OFST:	set	12
  59                     ; 188   uint32_t result = 0x0004;
  60                     ; 189   uint16_t tmpval = 0;
  61                     ; 190   uint8_t tmpccrh = 0;
  62  0019 0f07          	clr	(OFST-5,sp)
  63                     ; 191   uint8_t input_clock = 0;
  64                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
  65                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
  66                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
  67                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
  68                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
  69                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
  70                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
  71  001b cd0000        	call	_CLK_GetClockFreq
  73  001e ae0000        	ldw	x,#L01
  74  0021 cd0000        	call	c_ludv
  76  0024 b603          	ld	a,c_lreg+3
  77  0026 6b08          	ld	(OFST-4,sp),a
  78                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
  79  0028 1e0d          	ldw	x,(OFST+1,sp)
  80  002a e602          	ld	a,(2,x)
  81  002c a4c0          	and	a,#192
  82  002e e702          	ld	(2,x),a
  83                     ; 209   I2Cx->FREQR |= input_clock;
  84  0030 e602          	ld	a,(2,x)
  85  0032 1a08          	or	a,(OFST-4,sp)
  86  0034 e702          	ld	(2,x),a
  87                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
  88  0036 f6            	ld	a,(x)
  89  0037 a4fe          	and	a,#254
  90  0039 f7            	ld	(x),a
  91                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
  92  003a e60c          	ld	a,(12,x)
  93  003c a430          	and	a,#48
  94  003e e70c          	ld	(12,x),a
  95                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
  96  0040 6f0b          	clr	(11,x)
  97                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
  98  0042 96            	ldw	x,sp
  99  0043 1c0011        	addw	x,#OFST+5
 100  0046 cd0000        	call	c_ltor
 102  0049 ae0004        	ldw	x,#L21
 103  004c cd0000        	call	c_lcmp
 105  004f 2403cc00e0    	jrult	L3
 106                     ; 223     tmpccrh = I2C_CCRH_FS;
 107  0054 a680          	ld	a,#128
 108  0056 6b07          	ld	(OFST-5,sp),a
 109                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 110  0058 96            	ldw	x,sp
 111  0059 0d18          	tnz	(OFST+12,sp)
 112  005b 262e          	jrne	L5
 113                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 114  005d 1c0011        	addw	x,#OFST+5
 115  0060 cd0000        	call	c_ltor
 117  0063 a603          	ld	a,#3
 118  0065 cd0000        	call	c_smul
 120  0068 96            	ldw	x,sp
 121  0069 5c            	incw	x
 122  006a cd0000        	call	c_rtol
 124  006d 7b08          	ld	a,(OFST-4,sp)
 125  006f b703          	ld	c_lreg+3,a
 126  0071 3f02          	clr	c_lreg+2
 127  0073 3f01          	clr	c_lreg+1
 128  0075 3f00          	clr	c_lreg
 129  0077 ae0000        	ldw	x,#L01
 130  007a cd0000        	call	c_lmul
 132  007d 96            	ldw	x,sp
 133  007e 5c            	incw	x
 134  007f cd0000        	call	c_ludv
 136  0082 96            	ldw	x,sp
 137  0083 1c0009        	addw	x,#OFST-3
 138  0086 cd0000        	call	c_rtol
 141  0089 2032          	jra	L7
 142  008b               L5:
 143                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 144  008b 1c0011        	addw	x,#OFST+5
 145  008e cd0000        	call	c_ltor
 147  0091 a619          	ld	a,#25
 148  0093 cd0000        	call	c_smul
 150  0096 96            	ldw	x,sp
 151  0097 5c            	incw	x
 152  0098 cd0000        	call	c_rtol
 154  009b 7b08          	ld	a,(OFST-4,sp)
 155  009d b703          	ld	c_lreg+3,a
 156  009f 3f02          	clr	c_lreg+2
 157  00a1 3f01          	clr	c_lreg+1
 158  00a3 3f00          	clr	c_lreg
 159  00a5 ae0000        	ldw	x,#L01
 160  00a8 cd0000        	call	c_lmul
 162  00ab 96            	ldw	x,sp
 163  00ac 5c            	incw	x
 164  00ad cd0000        	call	c_ludv
 166  00b0 96            	ldw	x,sp
 167  00b1 1c0009        	addw	x,#OFST-3
 168  00b4 cd0000        	call	c_rtol
 170                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 171  00b7 7b07          	ld	a,(OFST-5,sp)
 172  00b9 aa40          	or	a,#64
 173  00bb 6b07          	ld	(OFST-5,sp),a
 174  00bd               L7:
 175                     ; 239     if (result < (uint16_t)0x01)
 176  00bd 96            	ldw	x,sp
 177  00be 1c0009        	addw	x,#OFST-3
 178  00c1 cd0000        	call	c_lzmp
 180  00c4 2608          	jrne	L11
 181                     ; 242       result = (uint16_t)0x0001;
 182  00c6 ae0001        	ldw	x,#1
 183  00c9 1f0b          	ldw	(OFST-1,sp),x
 184  00cb 5f            	clrw	x
 185  00cc 1f09          	ldw	(OFST-3,sp),x
 186  00ce               L11:
 187                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 188  00ce 7b08          	ld	a,(OFST-4,sp)
 189  00d0 97            	ld	xl,a
 190  00d1 a603          	ld	a,#3
 191  00d3 42            	mul	x,a
 192  00d4 a60a          	ld	a,#10
 193  00d6 cd0000        	call	c_sdivx
 195  00d9 5c            	incw	x
 196  00da 1f05          	ldw	(OFST-7,sp),x
 197                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 198  00dc 7b06          	ld	a,(OFST-6,sp)
 200  00de 2052          	jra	L31
 201  00e0               L3:
 202                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 203  00e0 96            	ldw	x,sp
 204  00e1 1c0011        	addw	x,#OFST+5
 205  00e4 cd0000        	call	c_ltor
 207  00e7 3803          	sll	c_lreg+3
 208  00e9 3902          	rlc	c_lreg+2
 209  00eb 3901          	rlc	c_lreg+1
 210  00ed 96            	ldw	x,sp
 211  00ee 3900          	rlc	c_lreg
 212  00f0 5c            	incw	x
 213  00f1 cd0000        	call	c_rtol
 215  00f4 7b08          	ld	a,(OFST-4,sp)
 216  00f6 b703          	ld	c_lreg+3,a
 217  00f8 3f02          	clr	c_lreg+2
 218  00fa 3f01          	clr	c_lreg+1
 219  00fc 3f00          	clr	c_lreg
 220  00fe ae0000        	ldw	x,#L01
 221  0101 cd0000        	call	c_lmul
 223  0104 96            	ldw	x,sp
 224  0105 5c            	incw	x
 225  0106 cd0000        	call	c_ludv
 227  0109 b602          	ld	a,c_lreg+2
 228  010b 97            	ld	xl,a
 229  010c b603          	ld	a,c_lreg+3
 230  010e cd0000        	call	c_uitol
 232  0111 96            	ldw	x,sp
 233  0112 1c0009        	addw	x,#OFST-3
 234  0115 cd0000        	call	c_rtol
 236                     ; 259     if (result < (uint16_t)0x0004)
 237  0118 96            	ldw	x,sp
 238  0119 1c0009        	addw	x,#OFST-3
 239  011c cd0000        	call	c_ltor
 241  011f ae0008        	ldw	x,#L41
 242  0122 cd0000        	call	c_lcmp
 244  0125 2408          	jruge	L51
 245                     ; 262       result = (uint16_t)0x0004;
 246  0127 ae0004        	ldw	x,#4
 247  012a 1f0b          	ldw	(OFST-1,sp),x
 248  012c 5f            	clrw	x
 249  012d 1f09          	ldw	(OFST-3,sp),x
 250  012f               L51:
 251                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 252  012f 7b08          	ld	a,(OFST-4,sp)
 253  0131 4c            	inc	a
 254  0132               L31:
 255  0132 1e0d          	ldw	x,(OFST+1,sp)
 256  0134 e70d          	ld	(13,x),a
 257                     ; 273   I2Cx->CCRL = (uint8_t)result;
 258  0136 7b0c          	ld	a,(OFST+0,sp)
 259  0138 e70b          	ld	(11,x),a
 260                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 261  013a 7b07          	ld	a,(OFST-5,sp)
 262  013c e70c          	ld	(12,x),a
 263                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 264  013e 7b17          	ld	a,(OFST+11,sp)
 265  0140 aa01          	or	a,#1
 266  0142 fa            	or	a,(x)
 267  0143 f7            	ld	(x),a
 268                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 269  0144 e601          	ld	a,(1,x)
 270  0146 1a19          	or	a,(OFST+13,sp)
 271  0148 e701          	ld	(1,x),a
 272                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 273  014a 7b16          	ld	a,(OFST+10,sp)
 274  014c e703          	ld	(3,x),a
 275                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 275                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 276  014e 1e15          	ldw	x,(OFST+9,sp)
 277  0150 4f            	clr	a
 278  0151 01            	rrwa	x,a
 279  0152 48            	sll	a
 280  0153 01            	rrwa	x,a
 281  0154 49            	rlc	a
 282  0155 a406          	and	a,#6
 283  0157 6b04          	ld	(OFST-8,sp),a
 284  0159 7b1a          	ld	a,(OFST+14,sp)
 285  015b aa40          	or	a,#64
 286  015d 1a04          	or	a,(OFST-8,sp)
 287  015f 1e0d          	ldw	x,(OFST+1,sp)
 288  0161 e704          	ld	(4,x),a
 289                     ; 286 }
 290  0163 5b0e          	addw	sp,#14
 291  0165 81            	ret	
 293                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 293                     ; 296 {
 294  0166               _I2C_Cmd:
 295       fffffffe      OFST: set -2
 297                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 298                     ; 301   if (NewState != DISABLE)
 299  0166 7b03          	ld	a,(OFST+5,sp)
 300  0168 2705          	jreq	L71
 301                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 302  016a f6            	ld	a,(x)
 303  016b aa01          	or	a,#1
 305  016d 2003          	jra	L12
 306  016f               L71:
 307                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 308  016f f6            	ld	a,(x)
 309  0170 a4fe          	and	a,#254
 310  0172               L12:
 311  0172 f7            	ld	(x),a
 312                     ; 311 }
 313  0173 81            	ret	
 315                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 315                     ; 321 {
 316  0174               _I2C_GeneralCallCmd:
 317       fffffffe      OFST: set -2
 319                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 320                     ; 326   if (NewState != DISABLE)
 321  0174 7b03          	ld	a,(OFST+5,sp)
 322  0176 2705          	jreq	L32
 323                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 324  0178 f6            	ld	a,(x)
 325  0179 aa40          	or	a,#64
 327  017b 2003          	jra	L52
 328  017d               L32:
 329                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 330  017d f6            	ld	a,(x)
 331  017e a4bf          	and	a,#191
 332  0180               L52:
 333  0180 f7            	ld	(x),a
 334                     ; 336 }
 335  0181 81            	ret	
 337                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 337                     ; 348 {
 338  0182               _I2C_GenerateSTART:
 339       fffffffe      OFST: set -2
 341                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 342                     ; 353   if (NewState != DISABLE)
 343  0182 7b03          	ld	a,(OFST+5,sp)
 344  0184 2706          	jreq	L72
 345                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 346  0186 e601          	ld	a,(1,x)
 347  0188 aa01          	or	a,#1
 349  018a 2004          	jra	L13
 350  018c               L72:
 351                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 352  018c e601          	ld	a,(1,x)
 353  018e a4fe          	and	a,#254
 354  0190               L13:
 355  0190 e701          	ld	(1,x),a
 356                     ; 363 }
 357  0192 81            	ret	
 359                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
 359                     ; 373 {
 360  0193               _I2C_GenerateSTOP:
 361       fffffffe      OFST: set -2
 363                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
 364                     ; 378   if (NewState != DISABLE)
 365  0193 7b03          	ld	a,(OFST+5,sp)
 366  0195 2706          	jreq	L33
 367                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
 368  0197 e601          	ld	a,(1,x)
 369  0199 aa02          	or	a,#2
 371  019b 2004          	jra	L53
 372  019d               L33:
 373                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 374  019d e601          	ld	a,(1,x)
 375  019f a4fd          	and	a,#253
 376  01a1               L53:
 377  01a1 e701          	ld	(1,x),a
 378                     ; 388 }
 379  01a3 81            	ret	
 381                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 381                     ; 398 {
 382  01a4               _I2C_SoftwareResetCmd:
 383       fffffffe      OFST: set -2
 385                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
 386                     ; 402   if (NewState != DISABLE)
 387  01a4 7b03          	ld	a,(OFST+5,sp)
 388  01a6 2706          	jreq	L73
 389                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
 390  01a8 e601          	ld	a,(1,x)
 391  01aa aa80          	or	a,#128
 393  01ac 2004          	jra	L14
 394  01ae               L73:
 395                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 396  01ae e601          	ld	a,(1,x)
 397  01b0 a47f          	and	a,#127
 398  01b2               L14:
 399  01b2 e701          	ld	(1,x),a
 400                     ; 412 }
 401  01b4 81            	ret	
 403                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 403                     ; 422 {
 404  01b5               _I2C_StretchClockCmd:
 405       fffffffe      OFST: set -2
 407                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
 408                     ; 426   if (NewState != DISABLE)
 409  01b5 7b03          	ld	a,(OFST+5,sp)
 410  01b7 2705          	jreq	L34
 411                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 412  01b9 f6            	ld	a,(x)
 413  01ba a47f          	and	a,#127
 415  01bc 2003          	jra	L54
 416  01be               L34:
 417                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
 418  01be f6            	ld	a,(x)
 419  01bf aa80          	or	a,#128
 420  01c1               L54:
 421  01c1 f7            	ld	(x),a
 422                     ; 437 }
 423  01c2 81            	ret	
 425                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 425                     ; 447 {
 426  01c3               _I2C_ARPCmd:
 427       fffffffe      OFST: set -2
 429                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
 430                     ; 451   if (NewState != DISABLE)
 431  01c3 7b03          	ld	a,(OFST+5,sp)
 432  01c5 2705          	jreq	L74
 433                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
 434  01c7 f6            	ld	a,(x)
 435  01c8 aa10          	or	a,#16
 437  01ca 2003          	jra	L15
 438  01cc               L74:
 439                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
 440  01cc f6            	ld	a,(x)
 441  01cd a4ef          	and	a,#239
 442  01cf               L15:
 443  01cf f7            	ld	(x),a
 444                     ; 462 }
 445  01d0 81            	ret	
 447                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
 447                     ; 472 {
 448  01d1               _I2C_AcknowledgeConfig:
 449       fffffffe      OFST: set -2
 451                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
 452                     ; 476   if (NewState != DISABLE)
 453  01d1 7b03          	ld	a,(OFST+5,sp)
 454  01d3 2706          	jreq	L35
 455                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
 456  01d5 e601          	ld	a,(1,x)
 457  01d7 aa04          	or	a,#4
 459  01d9 2004          	jra	L55
 460  01db               L35:
 461                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 462  01db e601          	ld	a,(1,x)
 463  01dd a4fb          	and	a,#251
 464  01df               L55:
 465  01df e701          	ld	(1,x),a
 466                     ; 486 }
 467  01e1 81            	ret	
 469                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
 469                     ; 495 {
 470  01e2               _I2C_OwnAddress2Config:
 471  01e2 89            	pushw	x
 472  01e3 88            	push	a
 473       00000001      OFST:	set	1
 475                     ; 496   uint8_t tmpreg = 0;
 476                     ; 499   tmpreg = I2Cx->OAR2;
 477  01e4 e605          	ld	a,(5,x)
 478                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
 479  01e6 a401          	and	a,#1
 480  01e8 6b01          	ld	(OFST+0,sp),a
 481                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
 482  01ea 7b06          	ld	a,(OFST+5,sp)
 483  01ec a4fe          	and	a,#254
 484  01ee 1a01          	or	a,(OFST+0,sp)
 485  01f0 6b01          	ld	(OFST+0,sp),a
 486                     ; 508   I2Cx->OAR2 = tmpreg;
 487  01f2 1e02          	ldw	x,(OFST+1,sp)
 488  01f4 e705          	ld	(5,x),a
 489                     ; 509 }
 490  01f6 5b03          	addw	sp,#3
 491  01f8 81            	ret	
 493                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 493                     ; 519 {
 494  01f9               _I2C_DualAddressCmd:
 495       fffffffe      OFST: set -2
 497                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
 498                     ; 523   if (NewState != DISABLE)
 499  01f9 7b03          	ld	a,(OFST+5,sp)
 500  01fb 2706          	jreq	L75
 501                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
 502  01fd e605          	ld	a,(5,x)
 503  01ff aa01          	or	a,#1
 505  0201 2004          	jra	L16
 506  0203               L75:
 507                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
 508  0203 e605          	ld	a,(5,x)
 509  0205 a4fe          	and	a,#254
 510  0207               L16:
 511  0207 e705          	ld	(5,x),a
 512                     ; 533 }
 513  0209 81            	ret	
 515                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
 515                     ; 546 {
 516  020a               _I2C_AckPositionConfig:
 517       fffffffe      OFST: set -2
 519                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
 520                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
 521  020a e601          	ld	a,(1,x)
 522  020c a4f7          	and	a,#247
 523  020e e701          	ld	(1,x),a
 524                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
 525  0210 e601          	ld	a,(1,x)
 526  0212 1a03          	or	a,(OFST+5,sp)
 527  0214 e701          	ld	(1,x),a
 528                     ; 554 }
 529  0216 81            	ret	
 531                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
 531                     ; 566 {
 532  0217               _I2C_SMBusAlertConfig:
 533       fffffffe      OFST: set -2
 535                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
 536                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
 537  0217 7b03          	ld	a,(OFST+5,sp)
 538  0219 2706          	jreq	L36
 539                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
 540  021b e601          	ld	a,(1,x)
 541  021d aa20          	or	a,#32
 543  021f 2004          	jra	L56
 544  0221               L36:
 545                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
 546  0221 e601          	ld	a,(1,x)
 547  0223 a4df          	and	a,#223
 548  0225               L56:
 549  0225 e701          	ld	(1,x),a
 550                     ; 581 }
 551  0227 81            	ret	
 553                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
 553                     ; 593 {
 554  0228               _I2C_FastModeDutyCycleConfig:
 555       fffffffe      OFST: set -2
 557                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 558                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
 559  0228 7b03          	ld	a,(OFST+5,sp)
 560  022a a140          	cp	a,#64
 561  022c 2606          	jrne	L76
 562                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
 563  022e e60c          	ld	a,(12,x)
 564  0230 aa40          	or	a,#64
 566  0232 2004          	jra	L17
 567  0234               L76:
 568                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
 569  0234 e60c          	ld	a,(12,x)
 570  0236 a4bf          	and	a,#191
 571  0238               L17:
 572  0238 e70c          	ld	(12,x),a
 573                     ; 608 }
 574  023a 81            	ret	
 576                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
 576                     ; 622 {
 577  023b               _I2C_Send7bitAddress:
 578  023b 89            	pushw	x
 579       00000000      OFST:	set	0
 581                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
 582                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
 583                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
 584  023c 7b06          	ld	a,(OFST+6,sp)
 585  023e 2706          	jreq	L37
 586                     ; 631     Address |= OAR1_ADD0_Set;
 587  0240 7b05          	ld	a,(OFST+5,sp)
 588  0242 aa01          	or	a,#1
 590  0244 2004          	jra	L57
 591  0246               L37:
 592                     ; 636     Address &= OAR1_ADD0_Reset;
 593  0246 7b05          	ld	a,(OFST+5,sp)
 594  0248 a4fe          	and	a,#254
 595  024a               L57:
 596  024a 6b05          	ld	(OFST+5,sp),a
 597                     ; 639   I2Cx->DR = Address;
 598  024c 1e01          	ldw	x,(OFST+1,sp)
 599  024e e706          	ld	(6,x),a
 600                     ; 640 }
 601  0250 85            	popw	x
 602  0251 81            	ret	
 604                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
 604                     ; 665 {
 605  0252               _I2C_SendData:
 606       fffffffe      OFST: set -2
 608                     ; 667   I2Cx->DR = Data;
 609  0252 7b03          	ld	a,(OFST+5,sp)
 610  0254 e706          	ld	(6,x),a
 611                     ; 668 }
 612  0256 81            	ret	
 614                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
 614                     ; 677 {
 615  0257               _I2C_ReceiveData:
 617                     ; 679   return ((uint8_t)I2Cx->DR);
 618  0257 e606          	ld	a,(6,x)
 620  0259 81            	ret	
 622                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
 622                     ; 706 {
 623  025a               _I2C_TransmitPEC:
 624       fffffffe      OFST: set -2
 626                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
 627                     ; 710   if (NewState != DISABLE)
 628  025a 7b03          	ld	a,(OFST+5,sp)
 629  025c 2706          	jreq	L77
 630                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
 631  025e e601          	ld	a,(1,x)
 632  0260 aa10          	or	a,#16
 634  0262 2004          	jra	L101
 635  0264               L77:
 636                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
 637  0264 e601          	ld	a,(1,x)
 638  0266 a4ef          	and	a,#239
 639  0268               L101:
 640  0268 e701          	ld	(1,x),a
 641                     ; 720 }
 642  026a 81            	ret	
 644                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
 644                     ; 730 {
 645  026b               _I2C_CalculatePEC:
 646       fffffffe      OFST: set -2
 648                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
 649                     ; 734   if (NewState != DISABLE)
 650  026b 7b03          	ld	a,(OFST+5,sp)
 651  026d 2705          	jreq	L301
 652                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
 653  026f f6            	ld	a,(x)
 654  0270 aa20          	or	a,#32
 656  0272 2003          	jra	L501
 657  0274               L301:
 658                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
 659  0274 f6            	ld	a,(x)
 660  0275 a4df          	and	a,#223
 661  0277               L501:
 662  0277 f7            	ld	(x),a
 663                     ; 744 }
 664  0278 81            	ret	
 666                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
 666                     ; 756 {
 667  0279               _I2C_PECPositionConfig:
 668       fffffffe      OFST: set -2
 670                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
 671                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
 672  0279 e601          	ld	a,(1,x)
 673  027b a4f7          	and	a,#247
 674  027d e701          	ld	(1,x),a
 675                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
 676  027f e601          	ld	a,(1,x)
 677  0281 1a03          	or	a,(OFST+5,sp)
 678  0283 e701          	ld	(1,x),a
 679                     ; 764 }
 680  0285 81            	ret	
 682                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
 682                     ; 773 {
 683  0286               _I2C_GetPEC:
 685                     ; 775   return (I2Cx->PECR);
 686  0286 e60e          	ld	a,(14,x)
 688  0288 81            	ret	
 690                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 690                     ; 804 {
 691  0289               _I2C_DMACmd:
 692       fffffffe      OFST: set -2
 694                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
 695                     ; 808   if (NewState != DISABLE)
 696  0289 7b03          	ld	a,(OFST+5,sp)
 697  028b 2706          	jreq	L701
 698                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
 699  028d e60a          	ld	a,(10,x)
 700  028f aa08          	or	a,#8
 702  0291 2004          	jra	L111
 703  0293               L701:
 704                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
 705  0293 e60a          	ld	a,(10,x)
 706  0295 a4f7          	and	a,#247
 707  0297               L111:
 708  0297 e70a          	ld	(10,x),a
 709                     ; 818 }
 710  0299 81            	ret	
 712                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 712                     ; 828 {
 713  029a               _I2C_DMALastTransferCmd:
 714       fffffffe      OFST: set -2
 716                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
 717                     ; 832   if (NewState != DISABLE)
 718  029a 7b03          	ld	a,(OFST+5,sp)
 719  029c 2706          	jreq	L311
 720                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
 721  029e e60a          	ld	a,(10,x)
 722  02a0 aa10          	or	a,#16
 724  02a2 2004          	jra	L511
 725  02a4               L311:
 726                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
 727  02a4 e60a          	ld	a,(10,x)
 728  02a6 a4ef          	and	a,#239
 729  02a8               L511:
 730  02a8 e70a          	ld	(10,x),a
 731                     ; 842 }
 732  02aa 81            	ret	
 734                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
 734                     ; 955 {
 735  02ab               _I2C_ITConfig:
 736       fffffffe      OFST: set -2
 738                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
 739                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
 740                     ; 960   if (NewState != DISABLE)
 741  02ab 7b05          	ld	a,(OFST+7,sp)
 742  02ad 2706          	jreq	L711
 743                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
 744  02af e60a          	ld	a,(10,x)
 745  02b1 1a04          	or	a,(OFST+6,sp)
 747  02b3 2005          	jra	L121
 748  02b5               L711:
 749                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
 750  02b5 7b04          	ld	a,(OFST+6,sp)
 751  02b7 43            	cpl	a
 752  02b8 e40a          	and	a,(10,x)
 753  02ba               L121:
 754  02ba e70a          	ld	(10,x),a
 755                     ; 970 }
 756  02bc 81            	ret	
 758                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
 758                     ; 995 {
 759  02bd               _I2C_ReadRegister:
 760  02bd 89            	pushw	x
 761  02be 5204          	subw	sp,#4
 762       00000004      OFST:	set	4
 764                     ; 996   __IO uint16_t tmp = 0;
 765  02c0 5f            	clrw	x
 766  02c1 1f03          	ldw	(OFST-1,sp),x
 767                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
 768                     ; 1000   tmp = (uint16_t) I2Cx;
 769  02c3 1e05          	ldw	x,(OFST+1,sp)
 770  02c5 1f03          	ldw	(OFST-1,sp),x
 771                     ; 1001   tmp += I2C_Register;
 772  02c7 7b09          	ld	a,(OFST+5,sp)
 773  02c9 5f            	clrw	x
 774  02ca 97            	ld	xl,a
 775  02cb 1f01          	ldw	(OFST-3,sp),x
 776  02cd 72fb03        	addw	x,(OFST-1,sp)
 777  02d0 1f03          	ldw	(OFST-1,sp),x
 778                     ; 1004   return (*(__IO uint8_t *) tmp);
 779  02d2 1e03          	ldw	x,(OFST-1,sp)
 780  02d4 f6            	ld	a,(x)
 782  02d5 5b06          	addw	sp,#6
 783  02d7 81            	ret	
 785                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
 785                     ; 1045 {
 786  02d8               _I2C_CheckEvent:
 787  02d8 89            	pushw	x
 788  02d9 5206          	subw	sp,#6
 789       00000006      OFST:	set	6
 791                     ; 1046   __IO uint16_t lastevent = 0x00;
 792  02db 5f            	clrw	x
 793  02dc 1f04          	ldw	(OFST-2,sp),x
 794                     ; 1047   uint8_t flag1 = 0x00 ;
 795                     ; 1048   uint8_t flag2 = 0x00;
 796                     ; 1049   ErrorStatus status = ERROR;
 797                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
 798                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
 799  02de 1e0b          	ldw	x,(OFST+5,sp)
 800  02e0 a30004        	cpw	x,#4
 801  02e3 260a          	jrne	L321
 802                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
 803  02e5 1e07          	ldw	x,(OFST+1,sp)
 804  02e7 e608          	ld	a,(8,x)
 805  02e9 a404          	and	a,#4
 806  02eb 5f            	clrw	x
 807  02ec 97            	ld	xl,a
 809  02ed 201a          	jra	L521
 810  02ef               L321:
 811                     ; 1060     flag1 = I2Cx->SR1;
 812  02ef 1e07          	ldw	x,(OFST+1,sp)
 813  02f1 e607          	ld	a,(7,x)
 814  02f3 6b03          	ld	(OFST-3,sp),a
 815                     ; 1061     flag2 = I2Cx->SR3;
 816  02f5 e609          	ld	a,(9,x)
 817  02f7 6b06          	ld	(OFST+0,sp),a
 818                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
 819  02f9 5f            	clrw	x
 820  02fa 7b03          	ld	a,(OFST-3,sp)
 821  02fc 97            	ld	xl,a
 822  02fd 1f01          	ldw	(OFST-5,sp),x
 823  02ff 5f            	clrw	x
 824  0300 7b06          	ld	a,(OFST+0,sp)
 825  0302 97            	ld	xl,a
 826  0303 7b02          	ld	a,(OFST-4,sp)
 827  0305 01            	rrwa	x,a
 828  0306 1a01          	or	a,(OFST-5,sp)
 829  0308 01            	rrwa	x,a
 830  0309               L521:
 831  0309 1f04          	ldw	(OFST-2,sp),x
 832                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
 833  030b 1e04          	ldw	x,(OFST-2,sp)
 834  030d 01            	rrwa	x,a
 835  030e 140c          	and	a,(OFST+6,sp)
 836  0310 01            	rrwa	x,a
 837  0311 140b          	and	a,(OFST+5,sp)
 838  0313 01            	rrwa	x,a
 839  0314 130b          	cpw	x,(OFST+5,sp)
 840  0316 2604          	jrne	L721
 841                     ; 1068     status = SUCCESS;
 842  0318 a601          	ld	a,#1
 844  031a 2001          	jra	L131
 845  031c               L721:
 846                     ; 1073     status = ERROR;
 847  031c 4f            	clr	a
 848  031d               L131:
 849                     ; 1077   return status;
 851  031d 5b08          	addw	sp,#8
 852  031f 81            	ret	
 854                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
 854                     ; 1096 {
 855  0320               _I2C_GetLastEvent:
 856  0320 89            	pushw	x
 857  0321 5206          	subw	sp,#6
 858       00000006      OFST:	set	6
 860                     ; 1097   __IO uint16_t lastevent = 0;
 861  0323 5f            	clrw	x
 862  0324 1f05          	ldw	(OFST-1,sp),x
 863                     ; 1098   uint16_t flag1 = 0;
 864                     ; 1099   uint16_t flag2 = 0;
 865                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
 866  0326 1e07          	ldw	x,(OFST+1,sp)
 867  0328 e608          	ld	a,(8,x)
 868  032a a504          	bcp	a,#4
 869  032c 2705          	jreq	L331
 870                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
 871  032e ae0004        	ldw	x,#4
 873  0331 2014          	jra	L531
 874  0333               L331:
 875                     ; 1108     flag1 = I2Cx->SR1;
 876  0333 e607          	ld	a,(7,x)
 877  0335 5f            	clrw	x
 878  0336 97            	ld	xl,a
 879  0337 1f01          	ldw	(OFST-5,sp),x
 880                     ; 1109     flag2 = I2Cx->SR3;
 881  0339 1e07          	ldw	x,(OFST+1,sp)
 882  033b e609          	ld	a,(9,x)
 883  033d 5f            	clrw	x
 884  033e 97            	ld	xl,a
 885  033f 1f03          	ldw	(OFST-3,sp),x
 886                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
 887  0341 7b02          	ld	a,(OFST-4,sp)
 888  0343 01            	rrwa	x,a
 889  0344 1a01          	or	a,(OFST-5,sp)
 890  0346 01            	rrwa	x,a
 891  0347               L531:
 892  0347 1f05          	ldw	(OFST-1,sp),x
 893                     ; 1115   return (I2C_Event_TypeDef)lastevent;
 894  0349 1e05          	ldw	x,(OFST-1,sp)
 896  034b 5b08          	addw	sp,#8
 897  034d 81            	ret	
 899                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
 899                     ; 1153 {
 900  034e               _I2C_GetFlagStatus:
 901  034e 89            	pushw	x
 902  034f 89            	pushw	x
 903       00000002      OFST:	set	2
 905                     ; 1154   uint8_t tempreg = 0;
 906  0350 0f02          	clr	(OFST+0,sp)
 907                     ; 1155   uint8_t regindex = 0;
 908                     ; 1156   FlagStatus bitstatus = RESET;
 909                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
 910                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
 911  0352 7b07          	ld	a,(OFST+5,sp)
 912  0354 6b01          	ld	(OFST-1,sp),a
 913                     ; 1164   switch (regindex)
 915                     ; 1181     default:
 915                     ; 1182       break;
 916  0356 4a            	dec	a
 917  0357 2708          	jreq	L731
 918  0359 4a            	dec	a
 919  035a 270b          	jreq	L141
 920  035c 4a            	dec	a
 921  035d 270e          	jreq	L341
 922  035f 2012          	jra	L151
 923  0361               L731:
 924                     ; 1167     case 0x01:
 924                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
 925  0361 1e03          	ldw	x,(OFST+1,sp)
 926  0363 e607          	ld	a,(7,x)
 927                     ; 1169       break;
 928  0365 200a          	jp	LC001
 929  0367               L141:
 930                     ; 1172     case 0x02:
 930                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
 931  0367 1e03          	ldw	x,(OFST+1,sp)
 932  0369 e608          	ld	a,(8,x)
 933                     ; 1174       break;
 934  036b 2004          	jp	LC001
 935  036d               L341:
 936                     ; 1177     case 0x03:
 936                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
 937  036d 1e03          	ldw	x,(OFST+1,sp)
 938  036f e609          	ld	a,(9,x)
 939  0371               LC001:
 940  0371 6b02          	ld	(OFST+0,sp),a
 941                     ; 1179       break;
 942                     ; 1181     default:
 942                     ; 1182       break;
 943  0373               L151:
 944                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
 945  0373 7b08          	ld	a,(OFST+6,sp)
 946  0375 1502          	bcp	a,(OFST+0,sp)
 947  0377 2704          	jreq	L351
 948                     ; 1189     bitstatus = SET;
 949  0379 a601          	ld	a,#1
 951  037b 2001          	jra	L551
 952  037d               L351:
 953                     ; 1194     bitstatus = RESET;
 954  037d 4f            	clr	a
 955  037e               L551:
 956                     ; 1197   return bitstatus;
 958  037e 5b04          	addw	sp,#4
 959  0380 81            	ret	
 961                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
 961                     ; 1230 {
 962  0381               _I2C_ClearFlag:
 963  0381 89            	pushw	x
 964  0382 89            	pushw	x
 965       00000002      OFST:	set	2
 967                     ; 1231   uint16_t flagpos = 0;
 968                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
 969                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
 970  0383 7b08          	ld	a,(OFST+6,sp)
 971  0385 5f            	clrw	x
 972  0386 02            	rlwa	x,a
 973  0387 1f01          	ldw	(OFST-1,sp),x
 974                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
 975  0389 7b02          	ld	a,(OFST+0,sp)
 976  038b 43            	cpl	a
 977  038c 1e03          	ldw	x,(OFST+1,sp)
 978  038e e708          	ld	(8,x),a
 979                     ; 1239 }
 980  0390 5b04          	addw	sp,#4
 981  0392 81            	ret	
 983                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
 983                     ; 1265 {
 984  0393               _I2C_GetITStatus:
 985  0393 89            	pushw	x
 986  0394 5204          	subw	sp,#4
 987       00000004      OFST:	set	4
 989                     ; 1266   ITStatus bitstatus = RESET;
 990                     ; 1267   __IO uint8_t enablestatus = 0;
 991  0396 0f03          	clr	(OFST-1,sp)
 992                     ; 1268   uint16_t tempregister = 0;
 993                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
 994                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
 995  0398 7b09          	ld	a,(OFST+5,sp)
 996  039a a407          	and	a,#7
 997  039c 5f            	clrw	x
 998  039d 97            	ld	xl,a
 999  039e 1f01          	ldw	(OFST-3,sp),x
1000                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
1001  03a0 1e05          	ldw	x,(OFST+1,sp)
1002  03a2 e60a          	ld	a,(10,x)
1003  03a4 1402          	and	a,(OFST-2,sp)
1004  03a6 6b03          	ld	(OFST-1,sp),a
1005                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
1006  03a8 7b09          	ld	a,(OFST+5,sp)
1007  03aa a430          	and	a,#48
1008  03ac 97            	ld	xl,a
1009  03ad 4f            	clr	a
1010  03ae 02            	rlwa	x,a
1011  03af a30100        	cpw	x,#256
1012  03b2 260e          	jrne	L751
1013                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
1014  03b4 1e05          	ldw	x,(OFST+1,sp)
1015  03b6 e607          	ld	a,(7,x)
1016  03b8 150a          	bcp	a,(OFST+6,sp)
1017  03ba 2716          	jreq	L761
1019  03bc 0d03          	tnz	(OFST-1,sp)
1020  03be 2712          	jreq	L761
1021                     ; 1284       bitstatus = SET;
1023  03c0 200c          	jp	LC003
1024                     ; 1289       bitstatus = RESET;
1025  03c2               L751:
1026                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
1027  03c2 1e05          	ldw	x,(OFST+1,sp)
1028  03c4 e608          	ld	a,(8,x)
1029  03c6 150a          	bcp	a,(OFST+6,sp)
1030  03c8 2708          	jreq	L761
1032  03ca 0d03          	tnz	(OFST-1,sp)
1033  03cc 2704          	jreq	L761
1034                     ; 1298       bitstatus = SET;
1035  03ce               LC003:
1036  03ce a601          	ld	a,#1
1038  03d0 2001          	jra	L561
1039  03d2               L761:
1040                     ; 1303       bitstatus = RESET;
1041  03d2 4f            	clr	a
1042  03d3               L561:
1043                     ; 1307   return  bitstatus;
1045  03d3 5b06          	addw	sp,#6
1046  03d5 81            	ret	
1048                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
1048                     ; 1341 {
1049  03d6               _I2C_ClearITPendingBit:
1050  03d6 89            	pushw	x
1051  03d7 89            	pushw	x
1052       00000002      OFST:	set	2
1054                     ; 1342   uint16_t flagpos = 0;
1055                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
1056                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
1057  03d8 7b08          	ld	a,(OFST+6,sp)
1058  03da 5f            	clrw	x
1059  03db 02            	rlwa	x,a
1060  03dc 1f01          	ldw	(OFST-1,sp),x
1061                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
1062  03de 7b02          	ld	a,(OFST+0,sp)
1063  03e0 43            	cpl	a
1064  03e1 1e03          	ldw	x,(OFST+1,sp)
1065  03e3 e708          	ld	(8,x),a
1066                     ; 1352 }
1067  03e5 5b04          	addw	sp,#4
1068  03e7 81            	ret	
1070                     	xdef	_I2C_ClearITPendingBit
1071                     	xdef	_I2C_GetITStatus
1072                     	xdef	_I2C_ClearFlag
1073                     	xdef	_I2C_GetFlagStatus
1074                     	xdef	_I2C_GetLastEvent
1075                     	xdef	_I2C_CheckEvent
1076                     	xdef	_I2C_ReadRegister
1077                     	xdef	_I2C_ITConfig
1078                     	xdef	_I2C_DMALastTransferCmd
1079                     	xdef	_I2C_DMACmd
1080                     	xdef	_I2C_CalculatePEC
1081                     	xdef	_I2C_TransmitPEC
1082                     	xdef	_I2C_GetPEC
1083                     	xdef	_I2C_PECPositionConfig
1084                     	xdef	_I2C_ReceiveData
1085                     	xdef	_I2C_SendData
1086                     	xdef	_I2C_Send7bitAddress
1087                     	xdef	_I2C_SMBusAlertConfig
1088                     	xdef	_I2C_FastModeDutyCycleConfig
1089                     	xdef	_I2C_AckPositionConfig
1090                     	xdef	_I2C_DualAddressCmd
1091                     	xdef	_I2C_OwnAddress2Config
1092                     	xdef	_I2C_AcknowledgeConfig
1093                     	xdef	_I2C_GenerateSTOP
1094                     	xdef	_I2C_GenerateSTART
1095                     	xdef	_I2C_ARPCmd
1096                     	xdef	_I2C_StretchClockCmd
1097                     	xdef	_I2C_SoftwareResetCmd
1098                     	xdef	_I2C_GeneralCallCmd
1099                     	xdef	_I2C_Cmd
1100                     	xdef	_I2C_Init
1101                     	xdef	_I2C_DeInit
1102                     	xref	_CLK_GetClockFreq
1103                     	xref.b	c_lreg
1104                     	xref.b	c_x
1105                     	xref	c_uitol
1106                     	xref	c_sdivx
1107                     	xref	c_lzmp
1108                     	xref	c_rtol
1109                     	xref	c_smul
1110                     	xref	c_lmul
1111                     	xref	c_lcmp
1112                     	xref	c_ltor
1113                     	xref	c_ludv
1114                     	end
