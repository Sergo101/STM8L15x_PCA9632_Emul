   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 97 void IRTIM_DeInit(void)
  17                     ; 98 {
  18                     	scross	off
  19  0000               _IRTIM_DeInit:
  21                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  22  0000 725f52ff      	clr	21247
  23                     ; 100 }
  24  0004 81            	ret	
  26                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
  26                     ; 109 {
  27  0005               _IRTIM_Cmd:
  29                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
  30                     ; 114   if (NewState ==   DISABLE)
  31  0005 4d            	tnz	a
  32  0006 2605          	jrne	L3
  33                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
  34  0008 721152ff      	bres	21247,#0
  36  000c 81            	ret	
  37  000d               L3:
  38                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
  39  000d 721052ff      	bset	21247,#0
  40                     ; 122 }
  41  0011 81            	ret	
  43                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
  43                     ; 131 {
  44  0012               _IRTIM_HighSinkODCmd:
  46                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
  47                     ; 136   if (NewState == DISABLE)
  48  0012 4d            	tnz	a
  49  0013 2605          	jrne	L7
  50                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
  51  0015 721352ff      	bres	21247,#1
  53  0019 81            	ret	
  54  001a               L7:
  55                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
  56  001a 721252ff      	bset	21247,#1
  57                     ; 144 }
  58  001e 81            	ret	
  60                     ; 168 FunctionalState IRTIM_GetStatus(void)
  60                     ; 169 {
  61  001f               _IRTIM_GetStatus:
  63                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
  64  001f c652ff        	ld	a,21247
  65  0022 a401          	and	a,#1
  67  0024 81            	ret	
  69                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
  69                     ; 179 {
  70  0025               _IRTIM_GetHighSinkODStatus:
  72                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
  73  0025 c652ff        	ld	a,21247
  74  0028 a402          	and	a,#2
  76  002a 81            	ret	
  78                     	xdef	_IRTIM_GetHighSinkODStatus
  79                     	xdef	_IRTIM_GetStatus
  80                     	xdef	_IRTIM_HighSinkODCmd
  81                     	xdef	_IRTIM_Cmd
  82                     	xdef	_IRTIM_DeInit
  83                     	end
