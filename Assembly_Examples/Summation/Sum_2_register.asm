AA EQU 0X50; Define address for first number
BB EQU 0X60; Define address for second number
CC EQU 0X70; Define address for result
ORG 0x06; Start adrress for program memory
MOVF AA,W;AA register -> Wreg (Move content of file register at AA Address to the Wreg )
ADDWF BB,W;Wreg + BB -> Wreg (Sum current value of Wreg and value of file register at BB Address then write the result to the Wreg)
MOVWF CC; Wreg -> CC register (Move content of Wreg to the file register at AA Address)
END
