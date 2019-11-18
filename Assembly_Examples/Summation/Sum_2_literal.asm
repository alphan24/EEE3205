AA EQU 0X50; Define address for first number
BB EQU 0X60; Define address for second number
CC EQU 0X70; Define address for result
ORG 0x06; Start adrress for program memory
MOVLW 0x1F; 0x1F -> Wreg (move literal value 0x1F to Wreg)
MOVWF AA; Wreg -> AA register (Move content of Wreg to the file register at AA Address)
MOVLW 0x0C; 0x1F -> Wreg (move literal value 0x0C to Wreg)
MOVWF BB;Wreg -> BB register (Move content of Wreg to the file register at AA Address)
MOVF AA,W;AA register -> Wreg (Move content of file register at AA Address to the Wreg )
ADDWF BB,W;Wreg + BB -> Wreg (Sum current value of Wreg and value of file register at BB Address then write the result to the Wreg)
MOVWF CC; Wreg -> CC register (Move content of Wreg to the file register at AA Address)
END
