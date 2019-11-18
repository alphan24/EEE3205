AA EQU 0X50; Define address for first number
BB EQU 0X60; Define address for second number
CCL EQU 0X70; Define address for lower portion of result
CCH EQU 0X71; Define address for higher portion of result
PRODL EQU 0xFF3;
PRODH EQU 0xFF4;
ORG 0x06; Start adrress for program memory
MOVLW 0x16;0x1F -> Wreg (move literal value 0x1F to Wreg)
MOVWF AA;Wreg -> AA register (Move content of Wreg to the file register at AA Address)
MOVLW 0xFC; 0x1F -> Wreg (move literal value 0x0C to Wreg)
MOVWF BB;Wreg -> BB register (Move content of Wreg to the file register at AA Address)
;Do the following mathematical operation 2*AA*BB+3*BB
;0x02*0x16*0xFC + 0x03*0xFC = 2E44
MOVLW 0x02;0x02 -> Wreg (move literal value 0x02 to Wreg)
MULWF AA;Wreg -> AA register (Move content of Wreg to the file register at AA Address)
MOVFF PRODL,CCL;PRODL -> CCL
MOVFF PRODH,CCH;PRODH -> CCH
MOVF CCL,W;CCL -> Wreg
MULWF BB;Wreg * BB -> PRODL:PRODH
MOVFF PRODL,CCL;PRODL -> CCL
MOVF CCH,W;CCH -> Wreg
MULWF BB;Wreg * BB -> PRODL:PRODH
MOVFF PRODL,CCH;PRODL -> CCH
MOVLW 0x03;0x03 -> Wreg (move literal value 0x03 to Wreg)
MULWF BB;Wreg * BB -> PRODL:PRODH
MOVF CCL,W;CCL -> Wreg
ADDWF PRODL,W;Wreg + PRODL -> Wreg
MOVWF CCL;Wreg -> CCL
MOVF CCH,W;CCH -> Wreg
ADDWF PRODL,W;Wreg + PRODL -> Wreg
MOVWF CCH;Wreg -> CCH
END

