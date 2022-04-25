// Vzorový projekt 
#include "stm8s.h"
#include "milis.h"
#include <stdio.h>
#include "stm8_hd44780.h"
#include "delay.h"

#define IR_RX_1_PORT GPIOB
#define IR_RX_1_PIN GPIO_PIN_0

#define IR_RX_2_PORT GPIOB
#define IR_RX_2_PIN GPIO_PIN_1

int8_t speed = 0;

void setup(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //Nastavení vstupù a výstupù, rozbìhnutí hodin
init_milis();
GPIO_Init(LCD_RS_PORT, LCD_RS_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(LCD_RW_PORT, LCD_RW_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(LCD_E_PORT,LCD_E_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);

GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);

GPIO_Init(GPIOB, GPIO_PIN_1,GPIO_MODE_IN_FL_NO_IT);
GPIO_Init(GPIOB, GPIO_PIN_0,GPIO_MODE_IN_FL_NO_IT);



GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_OUT_PP_LOW_SLOW);

GPIO_Init(GPIOC,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(GPIOE, GPIO_PIN_4,GPIO_MODE_IN_FL_NO_IT);

UART1_DeInit();         // smažu starou konfiguraci
UART1_Init((uint32_t) 115200,
						UART1_WORDLENGTH_8D,
						UART1_STOPBITS_1,
						UART1_PARITY_NO,
						UART1_SYNCMODE_CLOCK_DISABLE,
						UART1_MODE_TXRX_ENABLE);
UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);   // povolí pøerušení UART1 Rx
enableInterrupts();
UART1_Cmd(ENABLE);  // povolí UART1
}

int zvuk = 0;
int8_t check_pruchod(void){
uint32_t cas = 0;
static int ready1=1;
static int ready2=1;
if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)!=RESET){
ready1 = 1;
}
if (GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)!=RESET){
ready2 = 1;
}
if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)==RESET && ready1 == 1){
cas = milis();
while ((milis() - cas)< 500){
if (GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)==RESET){
zvuk=1;
ready1=0;
return 1;
delay_ms(100);
break;
}
}
}

else if (GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)==RESET && ready2==1){
cas = milis();
while ((milis() - cas)< 500){
if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)==RESET){
zvuk=1;
ready2=0;
return -1;
delay_ms(100);
break;
}
}
}
}






void main(void){
	char text[32];
	int8_t check = 0;
	int8_t check_zvuk = 0;
	int8_t pruchody = 0;
	uint32_t timeA = 0;
	uint32_t timeB = 0;
	uint32_t timeC = 0;
	setup();
	lcd_init();
	while (1){
		if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)==RESET || GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)==RESET){
		GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
		}
		if ((milis() - timeA) > 70){
		timeA = milis();
		lcd_gotoxy(0 ,0);
		sprintf(text,"lidi uvnitr :%3d",pruchody+0);
		lcd_puts(text);	
		}
		
		if ((milis() - timeB ) > 30){
		timeB = milis();
		check = check_pruchod();
		if (check!=1 && check != -1 && check != 0 ){
		check=0;
		}
		pruchody += check;
		if (pruchody < 0){
		pruchody=0;
		}
		}
	if (zvuk == 1 && milis()-timeC > (100+speed*100)){
	timeC = milis();
	GPIO_WriteReverse(GPIOB,GPIO_PIN_2);
	check_zvuk ++;
	if (check_zvuk == 2){
		zvuk=0;
		check_zvuk=0;
	}
	}
}
}
INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
{
		char number;
    char c = UART1_ReceiveData8();
    UART1_SendData8(c);
		number= c - '0';
		if (number >=0 && number <=9){
		speed = number; 
		}
    
}

char putchar (char c)
{
  /* Write a character to the UART1 */
  UART1_SendData8(c);
  /* Loop until the end of transmission */
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

  return (c);
}

char getchar (void)
{
char c = 0;
while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
	c = UART1_ReceiveData8();
return (c);
}



// pod tímto komentáøem nic nemìòte 
#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
