/**
  ******************************************************************************
  * @file    I2C/I2C_TwoBoards/I2C_JoystickPlay/Slave/main.h
  * @author  MCD Application Team
  * @version V1.5.2
  * @date    30-September-2014
  * @brief   Main program Declarations
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
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H


/* Define I2C Address mode ---------------------------------------------------*/
#define I2C_slave_7Bits_Address

/* Define Slave Address  ---------------------------------------------------*/
#ifdef I2C_slave_7Bits_Address
#define SLAVE_ADDRESS 0x30
#else
#define SLAVE_ADDRESS 0x330
#endif

#ifndef _PCA9632
#define _PCA9632
/*Define PCA9632 control registers*/
#define AUTO_INCREMENT_OFF							0

#define AUTO_INCREMENT_ALL							0b10000000
#define AUTO_INCREMENT_BRIGHTNESS				0b10100000
#define AUTO_INCREMENT_GCONTROL					0b11000000
#define AUTO_INCREMENT_I_GCONTROL				0b11100000

#define AUTO_INCREMENT_OFFSET						5

#define REGISTER_MASK										0b00001111

/*It also means offset 'config_reg' array*/
#define MODE1				0x00		//Mode register 1
#define MODE2				0x01		//Mode register2
#define PWM0				0x02		//brightness control LED0
#define PWM1				0x03		//brightness control LED1
#define PWM2				0x04		//brightness control LED2
#define PWM3				0x05		//brightness control LED3
#define GRPPWM			0x06		//group duty cycle control
#define GRPFREQ			0x07		//group frequency
#define LEDOUT			0x08		//LED output state
#define SUBADR1			0x09		//i2c subaddress 1
#define SUBADR2			0x0A		//i2c subaddress 2
#define SUBADR3			0x0B		//i2c subaddress 3
#define ALLCALLADR	0x0C		//LED all call i2c address

#define Set_LED0 TIM3_SetCompare2
#define Set_LED1 TIM1_SetCompare3
#define Set_LED2 TIM1_SetCompare1
#define Set_LED3 TIM1_SetCompare2

#endif

#endif /* __MAIN_H*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
