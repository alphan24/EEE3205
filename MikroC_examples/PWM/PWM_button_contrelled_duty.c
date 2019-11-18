int duty = 0;//Define integer variable called duty with initial value of 0
void main() {
 PORTC = 0x00;//Clear PORTC
 TRISD = 0xff;//Set PORTD as Input
 PORTD = 0x00;//Clear PORTD
 PWM1_Init(5000);//Initiliaze pwm signal with 5KHz frequency at pin C2
 PWM1_Start();//Start pwm module
 while(1){//Create an infinite loop
                   if(PORTD.B0==1)//Check pin D0 is set or not? If set increase duty cycle by 5;
                   {
                    duty += 5;
                   }
                   else if(PORTD.B1==1)//Check pin D1 is set or not? If set decrease duty cycle by 5;
                   {
                    duty -= 5;
                   }
                   PWM1_Set_Duty(duty);
                   delay_ms(100);//Give 100ms delay
 }
}
