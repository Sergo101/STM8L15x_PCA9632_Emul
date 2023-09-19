   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     .const:	section	.text
  18  0000               __vectab:
  19  0000 82            	dc.b	130
  21  0001 00            	dc.b	page(__stext)
  22  0002 0000          	dc.w	__stext
  23  0004 82            	dc.b	130
  25  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  26  0006 0000          	dc.w	f_TRAP_IRQHandler
  27  0008 82            	dc.b	130
  29  0009 00            	dc.b	page(f_NonHandledInterrupt)
  30  000a 0000          	dc.w	f_NonHandledInterrupt
  31  000c 82            	dc.b	130
  33  000d 00            	dc.b	page(f_FLASH_IRQHandler)
  34  000e 0000          	dc.w	f_FLASH_IRQHandler
  35  0010 82            	dc.b	130
  37  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
  38  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
  39  0014 82            	dc.b	130
  41  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
  42  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
  43  0018 82            	dc.b	130
  45  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
  46  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
  47  001c 82            	dc.b	130
  49  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
  50  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
  51  0020 82            	dc.b	130
  53  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
  54  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
  55  0024 82            	dc.b	130
  57  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
  58  0026 0000          	dc.w	f_EXTID_H_IRQHandler
  59  0028 82            	dc.b	130
  61  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
  62  002a 0000          	dc.w	f_EXTI0_IRQHandler
  63  002c 82            	dc.b	130
  65  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
  66  002e 0000          	dc.w	f_EXTI1_IRQHandler
  67  0030 82            	dc.b	130
  69  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
  70  0032 0000          	dc.w	f_EXTI2_IRQHandler
  71  0034 82            	dc.b	130
  73  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
  74  0036 0000          	dc.w	f_EXTI3_IRQHandler
  75  0038 82            	dc.b	130
  77  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
  78  003a 0000          	dc.w	f_EXTI4_IRQHandler
  79  003c 82            	dc.b	130
  81  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
  82  003e 0000          	dc.w	f_EXTI5_IRQHandler
  83  0040 82            	dc.b	130
  85  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
  86  0042 0000          	dc.w	f_EXTI6_IRQHandler
  87  0044 82            	dc.b	130
  89  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
  90  0046 0000          	dc.w	f_EXTI7_IRQHandler
  91  0048 82            	dc.b	130
  93  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
  94  004a 0000          	dc.w	f_LCD_AES_IRQHandler
  95  004c 82            	dc.b	130
  97  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
  98  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
  99  0050 82            	dc.b	130
 101  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
 102  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
 103  0054 82            	dc.b	130
 105  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
 106  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 107  0058 82            	dc.b	130
 109  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
 110  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
 111  005c 82            	dc.b	130
 113  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
 114  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 115  0060 82            	dc.b	130
 117  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
 118  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
 119  0064 82            	dc.b	130
 121  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
 122  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 123  0068 82            	dc.b	130
 125  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
 126  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
 127  006c 82            	dc.b	130
 129  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
 130  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
 131  0070 82            	dc.b	130
 133  0071 00            	dc.b	page(f_SPI1_IRQHandler)
 134  0072 0000          	dc.w	f_SPI1_IRQHandler
 135  0074 82            	dc.b	130
 137  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
 138  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 139  0078 82            	dc.b	130
 141  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
 142  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
 143  007c 82            	dc.b	130
 145  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
 146  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
 147                     	xdef	__vectab
 148                     	xref	f_I2C1_SPI2_IRQHandler
 149                     	xref	f_USART1_RX_TIM5_CC_IRQHandler
 150                     	xref	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 151                     	xref	f_SPI1_IRQHandler
 152                     	xref	f_TIM4_UPD_OVF_TRG_IRQHandler
 153                     	xref	f_TIM1_CC_IRQHandler
 154                     	xref	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 155                     	xref	f_TIM3_CC_USART3_RX_IRQHandler
 156                     	xref	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 157                     	xref	f_TIM2_CC_USART2_RX_IRQHandler
 158                     	xref	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 159                     	xref	f_ADC1_COMP_IRQHandler
 160                     	xref	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 161                     	xref	f_LCD_AES_IRQHandler
 162                     	xref	f_EXTI7_IRQHandler
 163                     	xref	f_EXTI6_IRQHandler
 164                     	xref	f_EXTI5_IRQHandler
 165                     	xref	f_EXTI4_IRQHandler
 166                     	xref	f_EXTI3_IRQHandler
 167                     	xref	f_EXTI2_IRQHandler
 168                     	xref	f_EXTI1_IRQHandler
 169                     	xref	f_EXTI0_IRQHandler
 170                     	xref	f_EXTID_H_IRQHandler
 171                     	xref	f_EXTIB_G_IRQHandler
 172                     	xref	f_EXTIE_F_PVD_IRQHandler
 173                     	xref	f_RTC_CSSLSE_IRQHandler
 174                     	xref	f_DMA1_CHANNEL2_3_IRQHandler
 175                     	xref	f_DMA1_CHANNEL0_1_IRQHandler
 176                     	xref	f_FLASH_IRQHandler
 177                     	xref	f_TRAP_IRQHandler
 178                     	xref	f_NonHandledInterrupt
 179                     	xref	__stext
 180                     	end
