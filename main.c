/**
  ******************************************************************************
  * @file    I2C/I2C_TwoBoards/I2C_JoystickPlay/Slave/main.c
  * @author  MCD Application Team
  * @version V1.5.2
  * @date    30-September-2014
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
	
	������ ��������� ��������� ������ pca9632
	��� ������ ������ ���������� �� ���� i2c ������������ ��� ����:
	PA5 - A0
	PA4 - A1
	
	���������� ����������� ���������� ���������� ��������.
	����� SLEEP, INVERT
	������� LEDOUT
	�������� ���������� �������� PWM0 - PWM3
	�������������� ��������� ��� �������� ������ ���������� ��������.
	�������� � ������������ � �������� �� PCA9632
	
	��������� ���������� �� ����������!
	������� � ��������� �������� ���������� �� ����� ������ �� ������ ���������� 
	
	� ������ �������� ���������� ����������� ����� ��������� PCA9632
	�� ��������� �� ���� ����������� PCA9632 �� ���� ��-�� ����������� 
	����������� i2c
	
	������ ��� �������������:
	LED0 - PD0 (tim3_ch2)
	LED1 - PD1 (tim1_ch3)
	LED2 - PD2 (tim1_ch1)
	LED3 - PD4 (tim1_ch2)
  */ 

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x.h"
//#include "stm8_eval.h"
#include "stm8l15x_wwdg.h"
#include "stm8l15x_usart.h"
#include "main.h"
#include "stdio.h"

/** @addtogroup STM8L15x_StdPeriph_Examples
  * @{
  */

/** @addtogroup I2C_TwoBoards
  * @{
  */

/** @addtogroup I2C_JoystickPlay
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define TIM1_PERIOD             10200
#define TIM1_PRESCALER              0
#define TIM1_REPTETION_COUNTER      0

#ifndef PUTCHAR_PROTOTYPE
#define PUTCHAR_PROTOTYPE char putchar (char c)
#define GETCHAR_PROTOTYPE char getchar (void)
#endif
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

uint8_t slave_address;

__IO uint8_t Config_reg [13];

__IO uint8_t Slave_Buffer_Rx[255];

__IO uint8_t Rx_size;

__IO uint8_t CommunicationEnd = 0x00;

__IO uint8_t i2c_buff [16];

uint16_t bright;
extern uint32_t a;

uint8_t en_blink_led0;
uint8_t en_blink_led1;
uint8_t en_blink_led2;
uint8_t en_blink_led3;

uint32_t baudrate = 14400UL;

/* Private function prototypes -----------------------------------------------*/
static void CLK_Config(void);
static void GPIO_Config(void);
static void TIM1_Config(void);
static void TIM3_Config(void);

static void I2C_Data_To_Registers (void); 
static void Update_Control (void); 
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
  uint8_t i = 0;
  
  /* CLK configuration -------------------------------------------*/
  CLK_Config(); 

	/* GPIO configuration -------------------------------------------*/
  GPIO_Config(); 
  
	/* TIM1 configuration -------------------------------------------*/
  TIM1_Config();
	
	/* TIM3 configuration -------------------------------------------*/
  TIM3_Config();
	
	/* Read config pin state and set i2c address*/
	slave_address = 0;
	if (GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_4)) {
		slave_address = slave_address | 0b10;
	}
	if (GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_5)) {
		slave_address = slave_address | 0b01;
	}
	slave_address = (slave_address | 0b1100000) <<1;
	slave_address = 0b1100010 << 1;
	//slave_address = 0b1001001<<1;
  I2C_DeInit(I2C1);
  /* Initialize I2C peripheral */

  I2C_Init(I2C1, 400000, slave_address,
           I2C_Mode_I2C, I2C_DutyCycle_2,
           I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);


  /* Enable Error Interrupt*/
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
	
	/* EVAL COM (USARTx) configuration -----------------------------------------*/
  /* USART configured as follow:
        - BaudRate = 115200 baud  
        - Word Length = 8 Bits
        - One Stop Bit
        - No parity
        - Receive and transmit enabled
        - USART Clock disabled
  */
	USART_DeInit(USART1);
	a = 1000;
			while (a) a--;
  USART_Init(USART1, (uint32_t)115200, USART_WordLength_8b, USART_StopBits_1,
                   USART_Parity_No, USART_Mode_Rx | USART_Mode_Tx );
	
	/* Enable the USART Receive interrupt: this interrupt is generated when the USART
    receive data register is not empty */
  USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
	
	USART_Cmd (USART1, ENABLE);

  /* Enable general interrupts */
  enableInterrupts();
  /*Main Loop */
	
	Set_LED1 (5000);
	a = 100000;
			while (a) a--;
	Set_LED1 (0);
	
Config_reg[MODE1] = 0b10010001;
	
	printf("\n\rPCA9632 V 1.0\n\r");
  printf("\n\rInertGas Medical\n\r");
	
  while (1)
  {	

			if(CommunicationEnd == 0x01) //upload data from i2c buffer and update pwm 
			{
				//I2C_Data_To_Registers();
			
				Update_Control ();
				CommunicationEnd = 0;
				
				
			}
			
			if (i2c_buff [0]) 
			{
				printf ("%X %X %X %X %X %X \n\r", i2c_buff [1],i2c_buff [2],(uint16_t)i2c_buff [3],(uint16_t)i2c_buff [4], 
				(int16_t)i2c_buff [5],(int16_t)i2c_buff [6] );
				i2c_buff [0] = 0;
			}
  }
}

/**
  * @brief Retargets the C library printf function to the USART.
  * @param[in] c Character to send
  * @retval char Character sent
  * @par Required preconditions:
  * - None
  */
PUTCHAR_PROTOTYPE
{
  /* Write a character to the USART */
  USART_SendData8(USART1, c);
  /* Loop until the end of transmission */
  while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);

  return (c);
}
/**
  * @brief Retargets the C library scanf function to the USART.
  * @param[in] None
  * @retval char Character to Read
  * @par Required preconditions:
  * - None
  */
GETCHAR_PROTOTYPE
{
  int c = 0;
  /* Loop until the Read data register flag is SET */
  while (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == RESET);
    c = USART_ReceiveData8(USART1);
    return (c);
  }

/**
  * @brief  Configure peripherals Clock   
  * @param  None
  * @retval None
  */
static void CLK_Config(void)
{
	//������������� ������������ �������� ���� � 1
	CLK_SYSCLKDivConfig (CLK_SYSCLKDiv_1); 
	
	/* I2C  clock Enable*/
  CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
	
  /* Enable TIM1 clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
	
	/* Enable TIM3 clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
	
	/* Enable USART1 clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
}

/**
  * @brief  Configure TIM Channels GPIO 
  * @param  None
  * @retval None
  */
static void GPIO_Config(void)
{
	SYSCFG->RMPCR1	|= 0b01 << 4;	//reconfig USART Pins from PC2,3 to PA2,3
	
	/*GPIO configuration as HiZ for USART: PA2, PA3 */
	GPIO_Init(GPIOA, GPIO_Pin_2 , GPIO_Mode_Out_OD_HiZ_Fast);
	
	/* Configure USART Tx as alternate function push-pull  (software pull up)*/
  GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);

  /* Configure USART Rx as alternate function push-pull  (software pull up)*/
  GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
	
  /* GPIOD configuration: TIM1 channel 1 (PD2), channel 2 (PD4) and channel 3 (PD1), TIM3 channel 2(PD0) */
  GPIO_Init(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
	
	/*GPIO configuration as input choosing pca9632 i2c address: PA4 - A1, PA5 - A0*/
	GPIO_Init(GPIOA, GPIO_Pin_1 | GPIO_Pin_4 | GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
	
	/*GPIO configuration as input choosing pca9632 i2c address: PA4 - A1, PA5 - A0*/
	GPIO_Init(GPIOC, GPIO_Pin_0 | GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
	
	/* Configure I2C as alternate function push-pull  (software pull up)*/
  GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_0, ENABLE);

  /* Configure I2C as alternate function push-pull  (software pull up)*/
  GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_1, ENABLE);
	
	/*Reset pin pull-up GPIO configuration*/
	GPIO_Init(GPIOA, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
}

/**
  * @brief  Configure TIM1 peripheral 
  * @param  None
  * @retval None
  */
static void TIM1_Config(void)
{
  /*
  - TIM1CLK = 16 MHz
  - TIM1 counter clock = TIM1CLK / TIM1_PRESCALER+1 = 2 MHz/1+1 = 1 MHz
  */
  /* Time base configuration */
  TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);

  /*��������� ��� ������ ������� 1*/
  TIM1_OC1Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
               0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
               TIM1_OCNIdleState_Set);
  TIM1_OC1PreloadConfig(DISABLE);

 /*��������� ��� ������ ������� 1*/
  TIM1_OC2Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
               0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
               TIM1_OCNIdleState_Set);
  TIM1_OC2PreloadConfig(ENABLE);

  /*��������� ��� ������ ������� 1*/
  TIM1_OC3Init(TIM1_OCMode_PWM1, TIM1_OutputState_Enable, TIM1_OutputNState_Disable,
               0, TIM1_OCPolarity_High, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,
               TIM1_OCNIdleState_Set);
  TIM1_OC3PreloadConfig(ENABLE);

  TIM1_ARRPreloadConfig(ENABLE);

  /* TIM1 Interrupt enable */
  enableInterrupts();

  /* Enable TIM1 outputs */
  TIM1_CtrlPWMOutputs(ENABLE);
  /* TIM1 enable counter */
  TIM1_Cmd(ENABLE);
}

static void TIM3_Config(void)
{
  /*
  - TIM3CLK = 16 MHz
  - TIM3 counter clock = TIM3CLK / TIM3_PRESCALER+1 = 16 MHz/1+1 = 8 MHz
  */
  /* Time base configuration */
  TIM3_TimeBaseInit(TIM1_PRESCALER, TIM3_CounterMode_Up, TIM1_PERIOD);

  /*��������� ��� ������ �3 �2
  */
  TIM3_OC2Init(TIM3_OCMode_PWM1, TIM3_OutputState_Enable, 0, TIM3_OCPolarity_High, TIM3_OCIdleState_Set);
  TIM3_OC2PreloadConfig(DISABLE);

  TIM3_ARRPreloadConfig(ENABLE);

  /* TIM3 Interrupt enable */
  enableInterrupts();

  /* Enable TIM3 outputs */
  TIM3_CtrlPWMOutputs(ENABLE);
  /* TIM3 enable counter */
  TIM3_Cmd(ENABLE);
}

static void I2C_Data_To_Registers (void){
	uint8_t A; //auto increment
	uint8_t D;	//control reg
	uint8_t i;
	
	A = Slave_Buffer_Rx[0] & 0b11100000; //������ ����� ���������� � ��������� �� ����� ������
	D = Slave_Buffer_Rx[0] & 0b00001111;
	
	printf ("Rx_size = %d\r", (int16_t)Rx_size);
	printf ("D = %d\r", (int16_t)D);
	for (i = 0; i < Rx_size; i++){
					printf ("buff = %x\r", (int16_t)Slave_Buffer_Rx[i]);
				}
		/* Realization of AUTO-INCREMENT functions PCA9632*/
		switch (A){
			
			case AUTO_INCREMENT_OFF: 
				Config_reg[D] = Slave_Buffer_Rx[1];
				break;
				
			case AUTO_INCREMENT_ALL:
				for (i = 1; i <= Rx_size; i++){
					Config_reg[D] = Slave_Buffer_Rx[i];
					printf ("reg %d = %d\r", (int16_t)D, (int16_t)Slave_Buffer_Rx[i]);
					D++;
						if (D > ALLCALLADR) D = MODE1;
				}
				break;
				
			case AUTO_INCREMENT_BRIGHTNESS:
				for (i = 1; i <= Rx_size; i++){
					Config_reg[D] = Slave_Buffer_Rx[i];
					D++;
						if (D > PWM3) D = PWM0;
				}
				break;
				
			case AUTO_INCREMENT_GCONTROL:
				for (i = 1; i <= Rx_size; i++){
					Config_reg[D] = Slave_Buffer_Rx[i];
					D++;
						if (D > GRPFREQ) D = GRPPWM;
				}
				break;
				
			case AUTO_INCREMENT_I_GCONTROL:
				for (i = 1; i <= Rx_size; i++){
					Config_reg[D] = Slave_Buffer_Rx[i];
					D++;
						if (D > GRPFREQ) D = PWM0;
				}
				break;
				
		}
}

static void Update_Control (void){
	uint8_t ledout0 = Config_reg[LEDOUT] & 0b11;
	uint8_t ledout1 = (Config_reg[LEDOUT] >> 2) & 0b11;
	uint8_t ledout2 = (Config_reg[LEDOUT] >> 4) & 0b11;
	uint8_t ledout3 = (Config_reg[LEDOUT] >> 6) & 0b11;
	
	uint16_t pwm0;
	uint16_t pwm1;
	uint16_t pwm2;
	uint16_t pwm3;
	
	
	if ( !((Config_reg [MODE1] >> 4) & 1) ){ //check for SLEEP mode bit & OFF when SLEEP = 0
	
		/*OUTPUT LOGIC INVERT functional BEGIN*/
		if ((Config_reg [MODE2] >> 4)&1) {
			pwm0 = Config_reg[PWM0] *40;
			pwm1 = Config_reg[PWM1] *40;
			pwm2 = Config_reg[PWM2] *40;
			pwm3 = Config_reg[PWM3] *40;
		}
		else {
			pwm0 = (255 - Config_reg[PWM0]) *40;
			pwm1 = (255 - Config_reg[PWM1]) *40;
			pwm2 = (255 - Config_reg[PWM2]) *40;
			pwm3 = (255 - Config_reg[PWM3]) *40;
		}
		/*OUTPUT LOGIC INVERT functional END*/
		
		/*LEDOUT register functional BEGIN*/
		switch (ledout0) {
			case 0b00:
				Set_LED0 (0);
				en_blink_led0 = 0;
				break;
			case 0b01:
				Set_LED0 (10200);
				en_blink_led0 = 0;
				break;
			case 0b10:
				Set_LED0 (pwm0);
				en_blink_led0 = 0;
				break;
			case 0b11:
				Set_LED0 (pwm0);
				en_blink_led0 = 1;
				break;
		}
		
		switch (ledout1) {
			case 0b00:
				Set_LED1 (0);
				en_blink_led1 = 0;
				break;
			case 0b01:
				Set_LED1 (10200);
				en_blink_led1 = 0;
				break;
			case 0b10:
				Set_LED1 (pwm1);
				en_blink_led1 = 0;
				break;
			case 0b11:
				Set_LED1 (pwm1);
				en_blink_led1 = 1;
				break;
		}
		
		switch (ledout2) {
			case 0b00:
				Set_LED2 (0);
				en_blink_led2 = 0;
				break;
			case 0b01:
				Set_LED2 (10200);
				en_blink_led2 = 0;
				break;
			case 0b10:
				Set_LED2 (pwm2);
				en_blink_led2 = 0;
				break;
			case 0b11:
				Set_LED2 (pwm2);
				en_blink_led2 = 1;
				break;
		}
		
		switch (ledout0) {
			case 0b00:
				Set_LED3 (0);
				en_blink_led3 = 0;
				break;
			case 0b01:
				Set_LED3 (10200);
				en_blink_led3 = 0;
				break;
			case 0b10:
				Set_LED3 (pwm3);
				en_blink_led3 = 0;
				break;
			case 0b11:
				Set_LED3 (pwm3);
				en_blink_led3 = 1;
				break;
		}
	}
	else {
		Set_LED0 (0);
		Set_LED1 (0);
		Set_LED2 (0);
		Set_LED3 (0);
	}
	/*LEDOUT register functional END*/
}


#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {}
}
#endif

/**
  * @}
  */

/**
  * @}
  */
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
