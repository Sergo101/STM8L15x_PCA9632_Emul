   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  17                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  17                     ; 97 {
  18                     	scross	off
  19  0000               _GPIO_DeInit:
  21                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
  22  0000 6f04          	clr	(4,x)
  23                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
  24  0002 7f            	clr	(x)
  25                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
  26  0003 6f02          	clr	(2,x)
  27                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
  28  0005 6f03          	clr	(3,x)
  29                     ; 102 }
  30  0007 81            	ret	
  32                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
  32                     ; 134 {
  33  0008               _GPIO_Init:
  34  0008 89            	pushw	x
  35       00000000      OFST:	set	0
  37                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
  38                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
  39                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
  40  0009 7b05          	ld	a,(OFST+5,sp)
  41  000b 43            	cpl	a
  42  000c e404          	and	a,(4,x)
  43  000e e704          	ld	(4,x),a
  44                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
  45  0010 7b06          	ld	a,(OFST+6,sp)
  46  0012 2a16          	jrpl	L3
  47                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
  48  0014 a510          	bcp	a,#16
  49  0016 2705          	jreq	L5
  50                     ; 153       GPIOx->ODR |= GPIO_Pin;
  51  0018 f6            	ld	a,(x)
  52  0019 1a05          	or	a,(OFST+5,sp)
  54  001b 2004          	jra	L7
  55  001d               L5:
  56                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
  57  001d 7b05          	ld	a,(OFST+5,sp)
  58  001f 43            	cpl	a
  59  0020 f4            	and	a,(x)
  60  0021               L7:
  61  0021 f7            	ld	(x),a
  62                     ; 159     GPIOx->DDR |= GPIO_Pin;
  63  0022 1e01          	ldw	x,(OFST+1,sp)
  64  0024 e602          	ld	a,(2,x)
  65  0026 1a05          	or	a,(OFST+5,sp)
  67  0028 2005          	jra	L11
  68  002a               L3:
  69                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
  70  002a 7b05          	ld	a,(OFST+5,sp)
  71  002c 43            	cpl	a
  72  002d e402          	and	a,(2,x)
  73  002f               L11:
  74  002f e702          	ld	(2,x),a
  75                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
  76  0031 7b06          	ld	a,(OFST+6,sp)
  77  0033 a540          	bcp	a,#64
  78  0035 2706          	jreq	L31
  79                     ; 172     GPIOx->CR1 |= GPIO_Pin;
  80  0037 e603          	ld	a,(3,x)
  81  0039 1a05          	or	a,(OFST+5,sp)
  83  003b 2005          	jra	L51
  84  003d               L31:
  85                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
  86  003d 7b05          	ld	a,(OFST+5,sp)
  87  003f 43            	cpl	a
  88  0040 e403          	and	a,(3,x)
  89  0042               L51:
  90  0042 e703          	ld	(3,x),a
  91                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
  92  0044 7b06          	ld	a,(OFST+6,sp)
  93  0046 a520          	bcp	a,#32
  94  0048 2706          	jreq	L71
  95                     ; 184     GPIOx->CR2 |= GPIO_Pin;
  96  004a e604          	ld	a,(4,x)
  97  004c 1a05          	or	a,(OFST+5,sp)
  99  004e 2005          	jra	L12
 100  0050               L71:
 101                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 102  0050 7b05          	ld	a,(OFST+5,sp)
 103  0052 43            	cpl	a
 104  0053 e404          	and	a,(4,x)
 105  0055               L12:
 106  0055 e704          	ld	(4,x),a
 107                     ; 190 }
 108  0057 85            	popw	x
 109  0058 81            	ret	
 111                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 111                     ; 210 {
 112  0059               _GPIO_ExternalPullUpConfig:
 113       fffffffe      OFST: set -2
 115                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 116                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 117                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 118  0059 7b04          	ld	a,(OFST+6,sp)
 119  005b 2706          	jreq	L32
 120                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 121  005d e603          	ld	a,(3,x)
 122  005f 1a03          	or	a,(OFST+5,sp)
 124  0061 2005          	jra	L52
 125  0063               L32:
 126                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 127  0063 7b03          	ld	a,(OFST+5,sp)
 128  0065 43            	cpl	a
 129  0066 e403          	and	a,(3,x)
 130  0068               L52:
 131  0068 e703          	ld	(3,x),a
 132                     ; 222 }
 133  006a 81            	ret	
 135                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 135                     ; 249 {
 136  006b               _GPIO_Write:
 137       fffffffe      OFST: set -2
 139                     ; 250   GPIOx->ODR = GPIO_PortVal;
 140  006b 7b03          	ld	a,(OFST+5,sp)
 141  006d f7            	ld	(x),a
 142                     ; 251 }
 143  006e 81            	ret	
 145                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 145                     ; 271 {
 146  006f               _GPIO_WriteBit:
 147       fffffffe      OFST: set -2
 149                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 150                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 151                     ; 276   if (GPIO_BitVal != RESET)
 152  006f 7b04          	ld	a,(OFST+6,sp)
 153  0071 2705          	jreq	L72
 154                     ; 278     GPIOx->ODR |= GPIO_Pin;
 155  0073 f6            	ld	a,(x)
 156  0074 1a03          	or	a,(OFST+5,sp)
 158  0076 2004          	jra	L13
 159  0078               L72:
 160                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 161  0078 7b03          	ld	a,(OFST+5,sp)
 162  007a 43            	cpl	a
 163  007b f4            	and	a,(x)
 164  007c               L13:
 165  007c f7            	ld	(x),a
 166                     ; 285 }
 167  007d 81            	ret	
 169                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 169                     ; 304 {
 170  007e               _GPIO_SetBits:
 171       fffffffe      OFST: set -2
 173                     ; 305   GPIOx->ODR |= GPIO_Pin;
 174  007e f6            	ld	a,(x)
 175  007f 1a03          	or	a,(OFST+5,sp)
 176  0081 f7            	ld	(x),a
 177                     ; 306 }
 178  0082 81            	ret	
 180                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 180                     ; 325 {
 181  0083               _GPIO_ResetBits:
 182       fffffffe      OFST: set -2
 184                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 185  0083 7b03          	ld	a,(OFST+5,sp)
 186  0085 43            	cpl	a
 187  0086 f4            	and	a,(x)
 188  0087 f7            	ld	(x),a
 189                     ; 327 }
 190  0088 81            	ret	
 192                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 192                     ; 337 {
 193  0089               _GPIO_ToggleBits:
 194       fffffffe      OFST: set -2
 196                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 197  0089 f6            	ld	a,(x)
 198  008a 1803          	xor	a,(OFST+5,sp)
 199  008c f7            	ld	(x),a
 200                     ; 339 }
 201  008d 81            	ret	
 203                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 203                     ; 348 {
 204  008e               _GPIO_ReadInputData:
 206                     ; 349   return ((uint8_t)GPIOx->IDR);
 207  008e e601          	ld	a,(1,x)
 209  0090 81            	ret	
 211                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 211                     ; 359 {
 212  0091               _GPIO_ReadOutputData:
 214                     ; 360   return ((uint8_t)GPIOx->ODR);
 215  0091 f6            	ld	a,(x)
 217  0092 81            	ret	
 219                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 219                     ; 379 {
 220  0093               _GPIO_ReadInputDataBit:
 221       fffffffe      OFST: set -2
 223                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 224  0093 e601          	ld	a,(1,x)
 225  0095 1403          	and	a,(OFST+5,sp)
 227  0097 81            	ret	
 229                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 229                     ; 390 {
 230  0098               _GPIO_ReadOutputDataBit:
 231       fffffffe      OFST: set -2
 233                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
 234  0098 f6            	ld	a,(x)
 235  0099 1403          	and	a,(OFST+5,sp)
 237  009b 81            	ret	
 239                     	xdef	_GPIO_ReadOutputDataBit
 240                     	xdef	_GPIO_ReadInputDataBit
 241                     	xdef	_GPIO_ReadOutputData
 242                     	xdef	_GPIO_ReadInputData
 243                     	xdef	_GPIO_ToggleBits
 244                     	xdef	_GPIO_ResetBits
 245                     	xdef	_GPIO_SetBits
 246                     	xdef	_GPIO_WriteBit
 247                     	xdef	_GPIO_Write
 248                     	xdef	_GPIO_ExternalPullUpConfig
 249                     	xdef	_GPIO_Init
 250                     	xdef	_GPIO_DeInit
 251                     	end
