void main() 
{
PORTA = 0;//clear PORTA   
PORTD = 0;//clear PORTD  
TRISD = 0;//configure PORTA  as output
TRISA = 0;//configure PORTD  as output

    	PORTA.B3 = 1;// enable the 1st digit from left (DIS3) by setting 3rd bit of PORTA register
    	PORTD = 0x79;// Letter E; turn on a-d-e-f-g segments PORTD = 0b01111001
}

