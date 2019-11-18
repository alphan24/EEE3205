void main() 
{
PORTA = 0;//clear PORTA   
PORTD = 0;//clear PORTD  
TRISD = 0;//configure PORTA  as output
TRISA = 0;//configure PORTD  as output

    	
    	PORTD = 0x79;// Letter E; turn on a-d-e-f-g segments PORTD = 0b01111001
      while(1){//Create an infinite loop
        PORTA.B3 = 1;// enable the 1st digit from left (DIS3) by setting 3rd bit of PORTA register
        delay_ms(10);//Give 10ms delay
        PORTA.B2 = 1;// enable the 2nd digit from left (DIS2) by setting 2nd bit of PORTA register
        delay_ms(10);//Give 10ms delay
        PORTA.B1 = 1;// enable the 3rd digit from left (DIS1) by setting 1st bit of PORTA register
        delay_ms(10);//Give 10ms delay
      }
}

