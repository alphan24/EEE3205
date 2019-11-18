AA EQU 0X50;Define address for first number
BB EQU 0X60;Define address for second number
CCL EQU 0X70;Define address for lower byte of result
CCH EQU 0X71;Define address for higher byte of result
DDL EQU 0x80;Define address for lower byte of 16bit_temprorary register
DDH EQU 0x81;Define address for higher byte of 16bit_temprorary register
TEMP EQU 0x90;Define address for 8bit__temprorary register
PRODL EQU 0xFF3;Address of lower byte of PROD register
PRODH EQU 0xFF4;Address of higher byte of PROD register
ORG 0x06; Start adrress for program memory
MOVLW 0x16;0x16 -> Wreg (move literal value 0x16 to Wreg)
MOVWF AA;Wreg -> AA register (Move content of Wreg to the file register at AA Address)
MOVLW 0xFC; 0xFC -> Wreg (move literal value 0xFC to Wreg)
MOVWF BB;Wreg -> BB register (Move content of Wreg to the file register at AA Address)
;Do the following mathematical operation 2*AA*BB+3*BB
;(Hexadecimal) 0x02*0x16*0xFC + 0x03*0xFC = 2E44
;(Decimal) 2*22*252 + 3*252 = 11844
MOVF AA,W;AA -> Wreg
MULWF BB;Wreg * BB -> PRODL:PRODH
MOVFF PRODL,CCL;PRODL -> CCL
MOVFF PRODH,CCH;PRODH -> CCH
MOVLW 0x02;0x02 -> Wreg
MULWF CCL;Wreg * CCL -> PRODL:PRODH
MOVFF PRODL,CCL;PRODL -> CCL
MOVFF PRODH,TEMP;PRODL -> TEMP
MOVLW 0x02;0x02 -> Wreg
MULWF CCH;Wreg * CCH -> PRODL:PRODH
MOVFF PRODL,CCH;PRODL -> CCH
MOVF TEMP,W;TEMP -> Wreg
ADDWF CCH,W;Wreg + DDH -> Wreg
MOVWF CCH;Wreg -> CCH
MOVLW 0x03;0x03 -> Wreg
MULWF BB;Wreg * BB -> PRODL:PRODH
MOVFF PRODL,DDL;PRODL -> CCL
MOVFF PRODH,DDH;PRODH -> CCH
MOVF CCL,W;CCL -> Wreg
ADDWF DDL,W;Wreg + DDL -> Wreg 
MOVWF CCL;Wreg -> CCL
BNC JUMP;If not carry go to JUMP
MOVLW 0x01;0x01 -> Wreg
ADDWF CCH,W;Wreg + CCH -> Wreg
MOVWF CCH;Wreg -> CCH
JUMP MOVF CCH,W;CCH -> Wreg
ADDWF DDH,W;Wreg + DDH -> Wreg 
MOVWF CCH;Wreg -> CCH
END


