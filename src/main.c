/***************************************************************************//**
 *   @file   src\main.c
 *   @brief  This file contains the main function for MY sensors.
 *   @author Alex Zhang (zhangyuanchao@mysentech.com)
********************************************************************************
 * Copyright 2017(c) Minyuan Sensing Tech, Inc.
*******************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include <string.h>
#include "stm8s.h"
#include "i2c_master_poll.h"
//#include "ad7747.h"
#include "stdio.h"

#define UART1_PRINT

#ifdef UART1_PRINT
	#ifdef _RAISONANCE_
	#define PUTCHAR_PROTOTYPE int putchar (char c)
	#define GETCHAR_PROTOTYPE int getchar (void)
	#elif defined (_COSMIC_)
	#define PUTCHAR_PROTOTYPE char putchar (char c)
	#define GETCHAR_PROTOTYPE char getchar (void)
	#else /* _IAR_ */
	#define PUTCHAR_PROTOTYPE int putchar (int c)
	#define GETCHAR_PROTOTYPE int getchar (void)
	#endif /* _RAISONANCE_ */
#endif

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void CLK_Config(void);
static void UART1_Config(void);
static void GPIO_Config(void);
static void TIM1_Config(void); // Input capture - channel 2
static void TIM2_Config(void); // Set sample resolution
//void TIM3_Config(void); // Test freq output
//static void TIM4_Config(void); // Delay function
static void I2C_Config(void);
//void AD7747_write(unsigned char cmd);
//unsigned int AD7747_read_word(void);

volatile u16 TIM4_tout;
u8 dataBuf[8]= {0x0};
//unsigned int data = 12;
//u8 AD7747_addr = 0x48;

// Define sample resolution (Hz) = 5Hz
// Min = 0.5Hz
extern unsigned int SAMP_RES = 5;

extern uint16_t overflow_count_tim1 = 0;
extern uint16_t overflow_count_tim2 = 0;
//extern uint16_t overflow_count_tim4 = 0;
//uint16_t msTime = 0;
//void msDelay(uint16_t msTime);
extern unsigned int freq = 0;
extern unsigned int cap = 0;

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
	CLK_Config();
	GPIO_Config();
	UART1_Config();
	TIM4_Init();
	I2C_Master_Init();
	//TIM4_Config();
	//I2C_Config();
	
	
	//printf("AD7747 Init = %s\n", AD7747_Init());
//	printf("AD7747 = 0x%x\n", AD7747_read_word());
	
	TIM2_Config(); // Input capture - channel 2
	TIM1_Config(); // Set sample resolution
	printf("Begin capture...\n");
	
	// Enable all interrupts  
	enableInterrupts();
	
	delay(1000);
	//msDelay(1000);

  while (1)
  {

		set_tout_ms(10);

    if(tout()) 
		{
			memset(dataBuf, 0, 8);
			
      set_tout_ms(10);
      I2C_ReadRegister(0x00, 1, &dataBuf[0]);
			I2C_ReadRegister(0x07, 1, &dataBuf[1]);
			I2C_ReadRegister(0x0A, 1, &dataBuf[2]);
			I2C_ReadRegister(0x0B, 1, &dataBuf[3]);
			I2C_ReadRegister(0x0C, 1, &dataBuf[4]);
			//I2C_ReadRegister(0x00, 1, &dataBuf[5]);
    }
		
		printf("AD7747 Status 		0x00 = 0x%02x\n", (int)dataBuf[0]);
		printf("AD7747 Cap Setup 	0x07 = 0x%02x\n", (int)dataBuf[1]);
		printf("AD7747 Config 		0x0A = 0x%02x\n", (int)dataBuf[2]);
		printf("AD7747 Cap DAC A 	0x0B = 0x%02x\n", (int)dataBuf[3]);
		printf("AD7747 Cap DAC B 	0x0C = 0x%02x\n", (int)dataBuf[4]);
		delay(10);
		printf("\nDetected 555 Freq = %d Hz\n", freq-3);
		printf("555 Cap value = %d pF\n\n", cap);
		GPIO_WriteReverse(GPIOD, GPIO_PIN_2);
		//memset(dataBuf, 0, 8);
		//I2C_ReadRegister(0x01, 1, &dataBuf[0]);
		//I2C_ReadRegister(0x02, 1, &dataBuf[1]);
		//I2C_ReadRegister(0x03, 1, &dataBuf[2]);
		//data = AD7747_read_word();
		//printf("AD7747 = 0x%x\n", (int)AD7747_read_word());
		//printf("AD7747 = 0x%x\n", (int)dataBuf[1]);
		//printf("AD7747 = 0x%x\n", (int)dataBuf[2]);
		
		delay(1000);
		//msDelay(1000);
  }
}

/**
  * @brief  Configure system clock to run at 16Mhz
  * @param  None
  * @retval None
  */
static void CLK_Config(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(ENABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(DISABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // 16MHz
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);

	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE); // Has to enable for UART2 to work?
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	
	//CLK_CCOConfig(CLK_OUTPUT_MASTER);
	//CLK_CCOCmd(ENABLE);
}

static void UART1_Config(void)
{
	UART1_DeInit();
	UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	UART1_Cmd(ENABLE);
}

static void GPIO_Config(void)
{
	GPIO_DeInit(GPIOD);
	//GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOB);
	//GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
	//GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
	//GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
}

#ifdef TIM4_DELAY_2
static void TIM4_Config(void)
{	
	TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); //16M / 64 / 250 = 1k = 1ms
	//TIM4_ClearFlag(TIM4_FLAG_UPDATE);	
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_Cmd(ENABLE);
}

// approximately 1ms
void msDelay(uint16_t msTime)
{
	while (msTime != (overflow_count_tim4 - 1));
	overflow_count_tim4 = 0;
}

static void I2C_Config(void)
{
	I2C_DeInit();
	I2C_Init(100000, AD7747_addr, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, (CLK_GetClockFreq() / 16000000));
	I2C_Cmd(ENABLE);
}
#endif

static void TIM1_Config(void)
{	
	TIM1_DeInit();
	TIM1_TimeBaseInit(8, TIM1_COUNTERMODE_UP, 19, 0);	// 16M / 8 / 20 = 100k, 10us
	//TIM1_TimeBaseInit(128, TIM1_COUNTERMODE_UP, 6249, 0);	//10hz
	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV1, 1);
	//TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
	TIM1_ITConfig(TIM1_IT_CC1, ENABLE);
	TIM1_Cmd(ENABLE);
}

static void TIM2_Config(void)
{
	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_512, 31250/SAMP_RES-1); //16M / 512 / = 31250
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_Cmd(ENABLE);
}

#ifdef UART1_PRINT
PUTCHAR_PROTOTYPE
{
  /* Write a character to the UART1 */
  UART1_SendData8(c);
  /* Loop until the end of transmission */
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
  return (c);
}

/**
  * @brief Retargets the C library scanf function to the USART.
  * @param None
  * @retval char Character to Read
  */
GETCHAR_PROTOTYPE
{
#ifdef _COSMIC_
  char c = 0;
#else
  int c = 0;
#endif
  /* Loop until the Read data register flag is SET */
  while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
    c = UART1_ReceiveData8();
  return (c);
}
#endif

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
	//printf("Wrong parameters value: file %s on line %d\r\n", file, line);
  /* Infinite loop */
  while (1)
  {
  }
}
#endif
