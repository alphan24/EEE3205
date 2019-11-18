int i;//Define integer variable i for For Loop
void main() {
 PORTC = 0x00;//Clear PORTC
 PWM1_Init(5000);//Initiliaze pwm signal with 5KHz frequency at pin C2
 PWM1_Start();//Start pwm module
 while(1){//Create an infinite loop
          for(i=0;i<255;i++){//Create For Loop for increasing duty cycle
           PWM1_Set_Duty(i);//Set Duty Cycle register to value of i variable
           delay_ms(100);//give 100ms delay
          }
          for(i=255;i>0;i--){//Create For Loop for decreasing duty cycle
           PWM1_Set_Duty(i);//Set Duty Cycle register to value of i variable
           delay_ms(100);//give 100ms delay
          }
 }
}
