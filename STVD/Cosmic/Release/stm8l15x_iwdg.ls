   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  17                     ; 129 {
  18                     	scross	off
  19  0000               _IWDG_WriteAccessCmd:
  21                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  22                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  23  0000 c750e0        	ld	20704,a
  24                     ; 133 }
  25  0003 81            	ret	
  27                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
  27                     ; 149 {
  28  0004               _IWDG_SetPrescaler:
  30                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
  31                     ; 152   IWDG->PR = IWDG_Prescaler;
  32  0004 c750e1        	ld	20705,a
  33                     ; 153 }
  34  0007 81            	ret	
  36                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
  36                     ; 163 {
  37  0008               _IWDG_SetReload:
  39                     ; 164   IWDG->RLR = IWDG_Reload;
  40  0008 c750e2        	ld	20706,a
  41                     ; 165 }
  42  000b 81            	ret	
  44                     ; 173 void IWDG_ReloadCounter(void)
  44                     ; 174 {
  45  000c               _IWDG_ReloadCounter:
  47                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
  48  000c 35aa50e0      	mov	20704,#170
  49                     ; 176 }
  50  0010 81            	ret	
  52                     ; 199 void IWDG_Enable(void)
  52                     ; 200 {
  53  0011               _IWDG_Enable:
  55                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
  56  0011 35cc50e0      	mov	20704,#204
  57                     ; 202 }
  58  0015 81            	ret	
  60                     	xdef	_IWDG_Enable
  61                     	xdef	_IWDG_ReloadCounter
  62                     	xdef	_IWDG_SetReload
  63                     	xdef	_IWDG_SetPrescaler
  64                     	xdef	_IWDG_WriteAccessCmd
  65                     	end
