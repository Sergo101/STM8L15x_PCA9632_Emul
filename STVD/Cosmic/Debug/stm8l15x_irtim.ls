   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 97 void IRTIM_DeInit(void)
  50                     ; 98 {
  52                     .text:	section	.text,new
  53  0000               _IRTIM_DeInit:
  57                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  59  0000 725f52ff      	clr	21247
  60                     ; 100 }
  63  0004 81            	ret	
 118                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
 118                     ; 109 {
 119                     .text:	section	.text,new
 120  0000               _IRTIM_Cmd:
 124                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 126                     ; 114   if (NewState ==   DISABLE)
 128  0000 4d            	tnz	a
 129  0001 2605          	jrne	L74
 130                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 132  0003 721152ff      	bres	21247,#0
 135  0007 81            	ret	
 136  0008               L74:
 137                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
 139  0008 721052ff      	bset	21247,#0
 140                     ; 122 }
 143  000c 81            	ret	
 179                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 179                     ; 131 {
 180                     .text:	section	.text,new
 181  0000               _IRTIM_HighSinkODCmd:
 185                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 187                     ; 136   if (NewState == DISABLE)
 189  0000 4d            	tnz	a
 190  0001 2605          	jrne	L17
 191                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 193  0003 721352ff      	bres	21247,#1
 196  0007 81            	ret	
 197  0008               L17:
 198                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
 200  0008 721252ff      	bset	21247,#1
 201                     ; 144 }
 204  000c 81            	ret	
 228                     ; 168 FunctionalState IRTIM_GetStatus(void)
 228                     ; 169 {
 229                     .text:	section	.text,new
 230  0000               _IRTIM_GetStatus:
 234                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 236  0000 c652ff        	ld	a,21247
 237  0003 a401          	and	a,#1
 240  0005 81            	ret	
 265                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
 265                     ; 179 {
 266                     .text:	section	.text,new
 267  0000               _IRTIM_GetHighSinkODStatus:
 271                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 273  0000 c652ff        	ld	a,21247
 274  0003 a402          	and	a,#2
 277  0005 81            	ret	
 290                     	xdef	_IRTIM_GetHighSinkODStatus
 291                     	xdef	_IRTIM_GetStatus
 292                     	xdef	_IRTIM_HighSinkODCmd
 293                     	xdef	_IRTIM_Cmd
 294                     	xdef	_IRTIM_DeInit
 313                     	end
