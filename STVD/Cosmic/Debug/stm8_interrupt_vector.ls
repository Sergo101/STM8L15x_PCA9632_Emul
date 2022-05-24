   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  22                     .const:	section	.text
  23  0000               __vectab:
  24  0000 82            	dc.b	130
  26  0001 00            	dc.b	page(__stext)
  27  0002 0000          	dc.w	__stext
  28  0004 82            	dc.b	130
  30  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  31  0006 0000          	dc.w	f_TRAP_IRQHandler
  32  0008 82            	dc.b	130
  34  0009 00            	dc.b	page(f_NonHandledInterrupt)
  35  000a 0000          	dc.w	f_NonHandledInterrupt
  36  000c 82            	dc.b	130
  38  000d 00            	dc.b	page(f_FLASH_IRQHandler)
  39  000e 0000          	dc.w	f_FLASH_IRQHandler
  40  0010 82            	dc.b	130
  42  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
  43  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
  44  0014 82            	dc.b	130
  46  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
  47  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
  48  0018 82            	dc.b	130
  50  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
  51  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
  52  001c 82            	dc.b	130
  54  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
  55  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
  56  0020 82            	dc.b	130
  58  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
  59  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
  60  0024 82            	dc.b	130
  62  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
  63  0026 0000          	dc.w	f_EXTID_H_IRQHandler
  64  0028 82            	dc.b	130
  66  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
  67  002a 0000          	dc.w	f_EXTI0_IRQHandler
  68  002c 82            	dc.b	130
  70  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
  71  002e 0000          	dc.w	f_EXTI1_IRQHandler
  72  0030 82            	dc.b	130
  74  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
  75  0032 0000          	dc.w	f_EXTI2_IRQHandler
  76  0034 82            	dc.b	130
  78  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
  79  0036 0000          	dc.w	f_EXTI3_IRQHandler
  80  0038 82            	dc.b	130
  82  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
  83  003a 0000          	dc.w	f_EXTI4_IRQHandler
  84  003c 82            	dc.b	130
  86  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
  87  003e 0000          	dc.w	f_EXTI5_IRQHandler
  88  0040 82            	dc.b	130
  90  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
  91  0042 0000          	dc.w	f_EXTI6_IRQHandler
  92  0044 82            	dc.b	130
  94  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
  95  0046 0000          	dc.w	f_EXTI7_IRQHandler
  96  0048 82            	dc.b	130
  98  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
  99  004a 0000          	dc.w	f_LCD_AES_IRQHandler
 100  004c 82            	dc.b	130
 102  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
 103  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 104  0050 82            	dc.b	130
 106  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
 107  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
 108  0054 82            	dc.b	130
 110  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
 111  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 112  0058 82            	dc.b	130
 114  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
 115  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
 116  005c 82            	dc.b	130
 118  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
 119  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 120  0060 82            	dc.b	130
 122  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
 123  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
 124  0064 82            	dc.b	130
 126  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
 127  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 128  0068 82            	dc.b	130
 130  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
 131  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
 132  006c 82            	dc.b	130
 134  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
 135  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
 136  0070 82            	dc.b	130
 138  0071 00            	dc.b	page(f_SPI1_IRQHandler)
 139  0072 0000          	dc.w	f_SPI1_IRQHandler
 140  0074 82            	dc.b	130
 142  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
 143  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 144  0078 82            	dc.b	130
 146  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
 147  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
 148  007c 82            	dc.b	130
 150  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
 151  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
 211                     	xdef	__vectab
 212                     	xref	f_I2C1_SPI2_IRQHandler
 213                     	xref	f_USART1_RX_TIM5_CC_IRQHandler
 214                     	xref	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 215                     	xref	f_SPI1_IRQHandler
 216                     	xref	f_TIM4_UPD_OVF_TRG_IRQHandler
 217                     	xref	f_TIM1_CC_IRQHandler
 218                     	xref	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 219                     	xref	f_TIM3_CC_USART3_RX_IRQHandler
 220                     	xref	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 221                     	xref	f_TIM2_CC_USART2_RX_IRQHandler
 222                     	xref	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 223                     	xref	f_ADC1_COMP_IRQHandler
 224                     	xref	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 225                     	xref	f_LCD_AES_IRQHandler
 226                     	xref	f_EXTI7_IRQHandler
 227                     	xref	f_EXTI6_IRQHandler
 228                     	xref	f_EXTI5_IRQHandler
 229                     	xref	f_EXTI4_IRQHandler
 230                     	xref	f_EXTI3_IRQHandler
 231                     	xref	f_EXTI2_IRQHandler
 232                     	xref	f_EXTI1_IRQHandler
 233                     	xref	f_EXTI0_IRQHandler
 234                     	xref	f_EXTID_H_IRQHandler
 235                     	xref	f_EXTIB_G_IRQHandler
 236                     	xref	f_EXTIE_F_PVD_IRQHandler
 237                     	xref	f_RTC_CSSLSE_IRQHandler
 238                     	xref	f_DMA1_CHANNEL2_3_IRQHandler
 239                     	xref	f_DMA1_CHANNEL0_1_IRQHandler
 240                     	xref	f_FLASH_IRQHandler
 241                     	xref	f_TRAP_IRQHandler
 242                     	xref	f_NonHandledInterrupt
 243                     	xref	__stext
 262                     	end
