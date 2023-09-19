   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
  17                     ; 100 {
  18                     	scross	off
  19  0000               _RST_GetFlagStatus:
  21                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
  22                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
  23  0000 c450b1        	and	a,20657
  24  0003 2702          	jreq	L6
  25  0005 a601          	ld	a,#1
  26  0007               L6:
  28  0007 81            	ret	
  30                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
  30                     ; 121 {
  31  0008               _RST_ClearFlag:
  33                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
  34                     ; 125   RST->SR = (uint8_t)RST_Flag;
  35  0008 c750b1        	ld	20657,a
  36                     ; 126 }
  37  000b 81            	ret	
  39                     ; 149 void RST_GPOutputEnable(void)
  39                     ; 150 {
  40  000c               _RST_GPOutputEnable:
  42                     ; 152   RST->CR = RST_CR_MASK;
  43  000c 35d050b0      	mov	20656,#208
  44                     ; 153 }
  45  0010 81            	ret	
  47                     	xdef	_RST_GPOutputEnable
  48                     	xdef	_RST_ClearFlag
  49                     	xdef	_RST_GetFlagStatus
  50                     	end
