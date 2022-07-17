/**
 *	Codigo para realizar as logicas da programacao da central
 *
 *	LEMBRAR DE TROCAR AS VARIAVEIS DE LEITURA COMO AS LOGICAS
 *	DO "DO{}WHILE();", POIS ESTAO PARA LEITURA DE BOTAO, E NAO DO TECLADO
 * */

#define F_CPU 16000000

#include <avr/io.h>
#include <util/delay.h>

void alterar_senha();
void habilitar_sensor();
void associar_sensor_zona();

int main()
{
	DDRB |= (1<<PB5); //Visualizacao do led (debug)
	PORTB = 0x00;
	
	DDRC |= 0x00; // Coloca os pinos A0 e A1 como entradas
	PORTC |= 0x03; //Ativa os PULL-UPS 
	
	for(;;)
	{
		//alterar_senha();
		//habilitar_sensor();
		//associar_sensor_zona();
	}// FIM DO LOOP

	return 0;
}

/**
 *	@brief Altera a senha da central
 * */
void alterar_senha()
{
	uint8_t leitura = 0x00; //Variavel para ler as portas
   
    leitura = PINC;

    PORTB ^= (1<<PB5);
	//Verifica se pressionou a tecla "P"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x01) == 0x01);

    //Laço de colocar a senha ATUAL

	//Verifica se pressinou "A"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x02) == 0x02);

	//Verifica se pressionou as teclas de "2"
	do
	{
		leitura = PINC;
	}while((leitura & 0x01) == 0x01);


	//Verifica se pressionou as teclas de "0" ate "3"
	do
	{
		leitura = PINC;
	}while((leitura & 0x02) == 0x02);

	//Laço para colocar a NOVA SENHA
	
	//Verifica se pressionou as teclas de "E"
	do
	{
		leitura = PINC;
	}while((leitura & 0x01) == 0x01);

    PORTB ^= (1<<PB5);
    _delay_ms(1000);
}

/**
 *	@brief Habilita/Desabilita sensor
 * */
void habilitar_sensor()
{
	uint8_t leitura = 0x00;

	leitura = PINC;
	
	PORTB |= (1<<PB5);
	//Verifica se pressionou a tecla "P"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x01) == 0x01);

	//Laço para colocar a senha ATUAL

	//Verifica se pressionou a tecla "A"
    do
    {
    	leitura = PINC;
		//	Falta colocar a logica para desabilitar sensor
		//o lugar de pressionar "A" o usuario pressiona "D"
    }while((leitura & 0x02) == 0x02);

	//Verifica se pressionou a tecla "2"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x01) == 0x01);

	//Verifica se pressionou a tecla de "0" ate "7"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x02) == 0x02);

	//Verifica se pressionou a tecla "E"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x01) == 0x01);

	PORTB &= ~(1<<PB5);
	_delay_ms(1000);

}


/**
 *	@brief Associa um sensor a uma zona
 * */
void associar_sensor_zona()
{
	uint8_t leitura = 0x00;
	leitura = PINC;

	PORTB |= (1<<PB5);
	//Verifica se pressionou a tecla "P"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x01) == 0x01);

	//Laco para colocar a senha ATUAL

	//Verifica se pressionou a tecla "A"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x02) == 0x02);

	//Verifica se pressionou a tecla "4"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x01) == 0x01);

	//Verifica se pressionou a tecla de "0" ate "7"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x02) == 0x02);

	//Verifica se pressionou a tecla de "1" ate "3"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x01) == 0x01);


	//Verifica se pressionou a tecla "E"
    do
    {
    	leitura = PINC;
    }while((leitura & 0x02) == 0x02);

	PORTB ^= (1<<PB5);
	_delay_ms(1000);
}


