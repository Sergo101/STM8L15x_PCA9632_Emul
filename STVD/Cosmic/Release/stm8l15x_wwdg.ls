   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  17                     ; 120 {
  18                     	scross	off
  19  0000               _WWDG_Init:
  20  0000 89            	pushw	x
  21       00000000      OFST:	set	0
  23                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  24                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  25  0001 357f50d4      	mov	20692,#127
  26                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  27  0005 9e            	ld	a,xh
  28  0006 aa80          	or	a,#128
  29  0008 c750d3        	ld	20691,a
  30                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  31  000b 7b02          	ld	a,(OFST+2,sp)
  32  000d a47f          	and	a,#127
  33  000f c750d4        	ld	20692,a
  34                     ; 127 }
  35  0012 85            	popw	x
  36  0013 81            	ret	
  38                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
  38                     ; 136 {
  39  0014               _WWDG_SetWindowValue:
  40  0014 88            	push	a
  41       00000001      OFST:	set	1
  43                     ; 137   __IO uint8_t tmpreg = 0;
  44  0015 0f01          	clr	(OFST+0,sp)
  45                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  46                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
  47  0017 a47f          	and	a,#127
  48  0019 1a01          	or	a,(OFST+0,sp)
  49  001b 6b01          	ld	(OFST+0,sp),a
  50                     ; 146   WWDG->WR = tmpreg;
  51  001d 7b01          	ld	a,(OFST+0,sp)
  52  001f c750d4        	ld	20692,a
  53                     ; 147 }
  54  0022 84            	pop	a
  55  0023 81            	ret	
  57                     ; 156 void WWDG_SetCounter(uint8_t Counter)
  57                     ; 157 {
  58  0024               _WWDG_SetCounter:
  60                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
  61                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
  62  0024 a47f          	and	a,#127
  63  0026 c750d3        	ld	20691,a
  64                     ; 164 }
  65  0029 81            	ret	
  67                     ; 187 void WWDG_Enable(uint8_t Counter)
  67                     ; 188 {
  68  002a               _WWDG_Enable:
  70                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
  71                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  72  002a aa80          	or	a,#128
  73  002c c750d3        	ld	20691,a
  74                     ; 192 }
  75  002f 81            	ret	
  77                     ; 216 uint8_t WWDG_GetCounter(void)
  77                     ; 217 {
  78  0030               _WWDG_GetCounter:
  80                     ; 218   return(WWDG->CR);
  81  0030 c650d3        	ld	a,20691
  83  0033 81            	ret	
  85                     ; 226 void WWDG_SWReset(void)
  85                     ; 227 {
  86  0034               _WWDG_SWReset:
  88                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
  89  0034 358050d3      	mov	20691,#128
  90                     ; 229 }
  91  0038 81            	ret	
  93                     	xdef	_WWDG_SWReset
  94                     	xdef	_WWDG_GetCounter
  95                     	xdef	_WWDG_Enable
  96                     	xdef	_WWDG_SetCounter
  97                     	xdef	_WWDG_SetWindowValue
  98                     	xdef	_WWDG_Init
  99                     	end
