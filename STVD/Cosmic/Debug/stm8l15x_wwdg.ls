   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  66                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  66                     ; 120 {
  68                     .text:	section	.text,new
  69  0000               _WWDG_Init:
  71  0000 89            	pushw	x
  72       00000000      OFST:	set	0
  75                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  77                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  79  0001 357f50d4      	mov	20692,#127
  80                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  82  0005 9e            	ld	a,xh
  83  0006 aa80          	or	a,#128
  84  0008 c750d3        	ld	20691,a
  85                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  87  000b 7b02          	ld	a,(OFST+2,sp)
  88  000d a47f          	and	a,#127
  89  000f c750d4        	ld	20692,a
  90                     ; 127 }
  93  0012 85            	popw	x
  94  0013 81            	ret	
 136                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 136                     ; 136 {
 137                     .text:	section	.text,new
 138  0000               _WWDG_SetWindowValue:
 140  0000 88            	push	a
 141       00000001      OFST:	set	1
 144                     ; 137   __IO uint8_t tmpreg = 0;
 146  0001 0f01          	clr	(OFST+0,sp)
 148                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 150                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 152  0003 a47f          	and	a,#127
 153  0005 1a01          	or	a,(OFST+0,sp)
 154  0007 6b01          	ld	(OFST+0,sp),a
 156                     ; 146   WWDG->WR = tmpreg;
 158  0009 7b01          	ld	a,(OFST+0,sp)
 159  000b c750d4        	ld	20692,a
 160                     ; 147 }
 163  000e 84            	pop	a
 164  000f 81            	ret	
 196                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 196                     ; 157 {
 197                     .text:	section	.text,new
 198  0000               _WWDG_SetCounter:
 202                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 204                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 206  0000 a47f          	and	a,#127
 207  0002 c750d3        	ld	20691,a
 208                     ; 164 }
 211  0005 81            	ret	
 243                     ; 187 void WWDG_Enable(uint8_t Counter)
 243                     ; 188 {
 244                     .text:	section	.text,new
 245  0000               _WWDG_Enable:
 249                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 251                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 253  0000 aa80          	or	a,#128
 254  0002 c750d3        	ld	20691,a
 255                     ; 192 }
 258  0005 81            	ret	
 281                     ; 216 uint8_t WWDG_GetCounter(void)
 281                     ; 217 {
 282                     .text:	section	.text,new
 283  0000               _WWDG_GetCounter:
 287                     ; 218   return(WWDG->CR);
 289  0000 c650d3        	ld	a,20691
 292  0003 81            	ret	
 315                     ; 226 void WWDG_SWReset(void)
 315                     ; 227 {
 316                     .text:	section	.text,new
 317  0000               _WWDG_SWReset:
 321                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 323  0000 358050d3      	mov	20691,#128
 324                     ; 229 }
 327  0004 81            	ret	
 340                     	xdef	_WWDG_SWReset
 341                     	xdef	_WWDG_GetCounter
 342                     	xdef	_WWDG_Enable
 343                     	xdef	_WWDG_SetCounter
 344                     	xdef	_WWDG_SetWindowValue
 345                     	xdef	_WWDG_Init
 364                     	end
