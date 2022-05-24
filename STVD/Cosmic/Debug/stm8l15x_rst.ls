   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
 131                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 131                     ; 100 {
 133                     .text:	section	.text,new
 134  0000               _RST_GetFlagStatus:
 138                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 140                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 142  0000 c450b1        	and	a,20657
 143  0003 2702          	jreq	L01
 144  0005 a601          	ld	a,#1
 145  0007               L01:
 148  0007 81            	ret	
 183                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 183                     ; 121 {
 184                     .text:	section	.text,new
 185  0000               _RST_ClearFlag:
 189                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 191                     ; 125   RST->SR = (uint8_t)RST_Flag;
 193  0000 c750b1        	ld	20657,a
 194                     ; 126 }
 197  0003 81            	ret	
 220                     ; 149 void RST_GPOutputEnable(void)
 220                     ; 150 {
 221                     .text:	section	.text,new
 222  0000               _RST_GPOutputEnable:
 226                     ; 152   RST->CR = RST_CR_MASK;
 228  0000 35d050b0      	mov	20656,#208
 229                     ; 153 }
 232  0004 81            	ret	
 245                     	xdef	_RST_GPOutputEnable
 246                     	xdef	_RST_ClearFlag
 247                     	xdef	_RST_GetFlagStatus
 266                     	end
