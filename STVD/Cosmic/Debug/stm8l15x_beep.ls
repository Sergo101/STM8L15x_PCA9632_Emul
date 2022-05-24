   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 92 void BEEP_DeInit(void)
  50                     ; 93 {
  52                     .text:	section	.text,new
  53  0000               _BEEP_DeInit:
  57                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  59  0000 725f50f0      	clr	20720
  60                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  62  0004 351f50f3      	mov	20723,#31
  63                     ; 96 }
  66  0008 81            	ret	
 131                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 131                     ; 106 {
 132                     .text:	section	.text,new
 133  0000               _BEEP_Init:
 135  0000 88            	push	a
 136       00000000      OFST:	set	0
 139                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 141                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 143  0001 c650f3        	ld	a,20723
 144  0004 a41f          	and	a,#31
 145  0006 a11f          	cp	a,#31
 146  0008 260c          	jrne	L15
 147                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 149  000a c650f3        	ld	a,20723
 150  000d a4e0          	and	a,#224
 151  000f c750f3        	ld	20723,a
 152                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 154  0012 721050f3      	bset	20723,#0
 155  0016               L15:
 156                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 158  0016 c650f3        	ld	a,20723
 159  0019 a43f          	and	a,#63
 160  001b c750f3        	ld	20723,a
 161                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 163  001e c650f3        	ld	a,20723
 164  0021 1a01          	or	a,(OFST+1,sp)
 165  0023 c750f3        	ld	20723,a
 166                     ; 122 }
 169  0026 84            	pop	a
 170  0027 81            	ret	
 225                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 225                     ; 131 {
 226                     .text:	section	.text,new
 227  0000               _BEEP_Cmd:
 231                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 233                     ; 135   if (NewState != DISABLE)
 235  0000 4d            	tnz	a
 236  0001 2705          	jreq	L101
 237                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 239  0003 721a50f3      	bset	20723,#5
 242  0007 81            	ret	
 243  0008               L101:
 244                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 246  0008 721b50f3      	bres	20723,#5
 247                     ; 145 }
 250  000c 81            	ret	
 286                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 286                     ; 179 {
 287                     .text:	section	.text,new
 288  0000               _BEEP_LSClockToTIMConnectCmd:
 292                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 294                     ; 183   if (NewState != DISABLE)
 296  0000 4d            	tnz	a
 297  0001 2705          	jreq	L321
 298                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 300  0003 721050f0      	bset	20720,#0
 303  0007 81            	ret	
 304  0008               L321:
 305                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 307  0008 721150f0      	bres	20720,#0
 308                     ; 193 }
 311  000c 81            	ret	
 358                     .const:	section	.text
 359  0000               L61:
 360  0000 000003e8      	dc.l	1000
 361                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 361                     ; 208 {
 362                     .text:	section	.text,new
 363  0000               _BEEP_LSICalibrationConfig:
 365  0000 5206          	subw	sp,#6
 366       00000006      OFST:	set	6
 369                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 371                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 373  0002 96            	ldw	x,sp
 374  0003 1c0009        	addw	x,#OFST+3
 375  0006 cd0000        	call	c_ltor
 377  0009 ae0000        	ldw	x,#L61
 378  000c cd0000        	call	c_ludv
 380  000f be02          	ldw	x,c_lreg+2
 381  0011 1f03          	ldw	(OFST-3,sp),x
 383                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 385  0013 c650f3        	ld	a,20723
 386  0016 a4e0          	and	a,#224
 387  0018 c750f3        	ld	20723,a
 388                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 390  001b 54            	srlw	x
 391  001c 54            	srlw	x
 392  001d 54            	srlw	x
 393  001e 1f05          	ldw	(OFST-1,sp),x
 395                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 397  0020 58            	sllw	x
 398  0021 58            	sllw	x
 399  0022 58            	sllw	x
 400  0023 1f01          	ldw	(OFST-5,sp),x
 402  0025 1e03          	ldw	x,(OFST-3,sp)
 403  0027 72f001        	subw	x,(OFST-5,sp)
 404  002a 1605          	ldw	y,(OFST-1,sp)
 405  002c 9058          	sllw	y
 406  002e 905c          	incw	y
 407  0030 cd0000        	call	c_imul
 409  0033 1605          	ldw	y,(OFST-1,sp)
 410  0035 9058          	sllw	y
 411  0037 9058          	sllw	y
 412  0039 bf00          	ldw	c_x,x
 413  003b 9058          	sllw	y
 414  003d 90b300        	cpw	y,c_x
 415  0040 7b06          	ld	a,(OFST+0,sp)
 416  0042 2504          	jrult	L741
 417                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 419  0044 a002          	sub	a,#2
 421  0046 2001          	jra	L151
 422  0048               L741:
 423                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 425  0048 4a            	dec	a
 426  0049               L151:
 427  0049 ca50f3        	or	a,20723
 428  004c c750f3        	ld	20723,a
 429                     ; 231 }
 432  004f 5b06          	addw	sp,#6
 433  0051 81            	ret	
 446                     	xdef	_BEEP_LSICalibrationConfig
 447                     	xdef	_BEEP_LSClockToTIMConnectCmd
 448                     	xdef	_BEEP_Cmd
 449                     	xdef	_BEEP_Init
 450                     	xdef	_BEEP_DeInit
 451                     	xref.b	c_lreg
 452                     	xref.b	c_x
 471                     	xref	c_imul
 472                     	xref	c_ludv
 473                     	xref	c_ltor
 474                     	end
