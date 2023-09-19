   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 92 void BEEP_DeInit(void)
  17                     ; 93 {
  18                     	scross	off
  19  0000               _BEEP_DeInit:
  21                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  22  0000 725f50f0      	clr	20720
  23                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  24  0004 351f50f3      	mov	20723,#31
  25                     ; 96 }
  26  0008 81            	ret	
  28                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
  28                     ; 106 {
  29  0009               _BEEP_Init:
  30  0009 88            	push	a
  31       00000000      OFST:	set	0
  33                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
  34                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
  35  000a c650f3        	ld	a,20723
  36  000d a41f          	and	a,#31
  37  000f a11f          	cp	a,#31
  38  0011 260c          	jrne	L3
  39                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
  40  0013 c650f3        	ld	a,20723
  41  0016 a4e0          	and	a,#224
  42  0018 c750f3        	ld	20723,a
  43                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
  44  001b 721050f3      	bset	20723,#0
  45  001f               L3:
  46                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
  47  001f c650f3        	ld	a,20723
  48  0022 a43f          	and	a,#63
  49  0024 c750f3        	ld	20723,a
  50                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
  51  0027 c650f3        	ld	a,20723
  52  002a 1a01          	or	a,(OFST+1,sp)
  53  002c c750f3        	ld	20723,a
  54                     ; 122 }
  55  002f 84            	pop	a
  56  0030 81            	ret	
  58                     ; 130 void BEEP_Cmd(FunctionalState NewState)
  58                     ; 131 {
  59  0031               _BEEP_Cmd:
  61                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
  62                     ; 135   if (NewState != DISABLE)
  63  0031 4d            	tnz	a
  64  0032 2705          	jreq	L5
  65                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
  66  0034 721a50f3      	bset	20723,#5
  68  0038 81            	ret	
  69  0039               L5:
  70                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
  71  0039 721b50f3      	bres	20723,#5
  72                     ; 145 }
  73  003d 81            	ret	
  75                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
  75                     ; 179 {
  76  003e               _BEEP_LSClockToTIMConnectCmd:
  78                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
  79                     ; 183   if (NewState != DISABLE)
  80  003e 4d            	tnz	a
  81  003f 2705          	jreq	L11
  82                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
  83  0041 721050f0      	bset	20720,#0
  85  0045 81            	ret	
  86  0046               L11:
  87                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
  88  0046 721150f0      	bres	20720,#0
  89                     ; 193 }
  90  004a 81            	ret	
  92                     .const:	section	.text
  93  0000               L41:
  94  0000 000003e8      	dc.l	1000
  95                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
  95                     ; 208 {
  96                     	switch	.text
  97  004b               _BEEP_LSICalibrationConfig:
  98  004b 5206          	subw	sp,#6
  99       00000006      OFST:	set	6
 101                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 102                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 103  004d 96            	ldw	x,sp
 104  004e 1c0009        	addw	x,#OFST+3
 105  0051 cd0000        	call	c_ltor
 107  0054 ae0000        	ldw	x,#L41
 108  0057 cd0000        	call	c_ludv
 110  005a be02          	ldw	x,c_lreg+2
 111  005c 1f03          	ldw	(OFST-3,sp),x
 112                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 113  005e c650f3        	ld	a,20723
 114  0061 a4e0          	and	a,#224
 115  0063 c750f3        	ld	20723,a
 116                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 117  0066 54            	srlw	x
 118  0067 54            	srlw	x
 119  0068 54            	srlw	x
 120  0069 1f05          	ldw	(OFST-1,sp),x
 121                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 122  006b 58            	sllw	x
 123  006c 58            	sllw	x
 124  006d 58            	sllw	x
 125  006e 1f01          	ldw	(OFST-5,sp),x
 126  0070 1e03          	ldw	x,(OFST-3,sp)
 127  0072 72f001        	subw	x,(OFST-5,sp)
 128  0075 1605          	ldw	y,(OFST-1,sp)
 129  0077 9058          	sllw	y
 130  0079 905c          	incw	y
 131  007b cd0000        	call	c_imul
 133  007e 1605          	ldw	y,(OFST-1,sp)
 134  0080 9058          	sllw	y
 135  0082 9058          	sllw	y
 136  0084 bf00          	ldw	c_x,x
 137  0086 9058          	sllw	y
 138  0088 90b300        	cpw	y,c_x
 139  008b 7b06          	ld	a,(OFST+0,sp)
 140  008d 2504          	jrult	L51
 141                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 142  008f a002          	sub	a,#2
 144  0091 2001          	jra	L71
 145  0093               L51:
 146                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 147  0093 4a            	dec	a
 148  0094               L71:
 149  0094 ca50f3        	or	a,20723
 150  0097 c750f3        	ld	20723,a
 151                     ; 231 }
 152  009a 5b06          	addw	sp,#6
 153  009c 81            	ret	
 155                     	xdef	_BEEP_LSICalibrationConfig
 156                     	xdef	_BEEP_LSClockToTIMConnectCmd
 157                     	xdef	_BEEP_Cmd
 158                     	xdef	_BEEP_Init
 159                     	xdef	_BEEP_DeInit
 160                     	xref.b	c_lreg
 161                     	xref.b	c_x
 162                     	xref	c_imul
 163                     	xref	c_ludv
 164                     	xref	c_ltor
 165                     	end
