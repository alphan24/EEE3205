AA EQU 0X50;Define address for first number
BB EQU 0X60;Define address for second number
CCL EQU 0X70;Define address for lower byte of result
CCH EQU 0X71;Define address for higher byte of result
PRODL EQU 0xFF3;Address of lower byte of PROD register
PRODH EQU 0xFF4;Address of higher byte of PROD register
ORG 0x06; Start adrress for program memory
MOVLW 0x16;0x16 -> Wreg (move literal value 0x16 to Wreg)
MOVWF AA;Wreg -> AA register (Move content of Wreg to the file register at AA Address)
MOVLW 0xFC; 0xFC -> Wreg (move literal value 0xFC to Wreg)
MOVWF BB;Wreg -> BB register (Move content of Wreg to the file register at AA Address)
; AA*BB -> CCL:CCH
;(Hexadecimal) 0x16*0xFC = 15A8
;(Decimal) 22*252 = 5544
MOVF AA,W;AA -> Wreg
MULWF BB;Wreg * BB -> PRODL:PRODH
MOVFF PRODL,CCL;PRODL -> CCL
MOVFF PRODH,CCH;PRODH -> CCH
END
