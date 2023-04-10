;**************************** CONFIG *******************************************
List P=16F84A 
#include <p16f84a.inc>
    
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF		
;************************ PROGRAMMING ******************************************
    ORG	    0
INICIO
    BSF	    STATUS,RP0
    CLRF    TRISB					;PORTB output
    MOVLW   B'00011111'
    MOVWF   TRISA					;PORTA input
    BCF	    STATUS,RP0
START
    MOVF    PORTA,W					;Read PORTA -> W 
    ANDLW   B'00001111' 				;Set display

    CALL    SETDISPLAY					;Call SETDISPLAY 
    MOVWF   PORTB
    GOTO    START					;Loop 
;************************** FUNCTIONS ******************************************
SETDISPLAY                                                  
    ADDWF   PCL,F 

    RETLW   3FH						;0
    RETLW   06H						;1
    RETLW   5BH						;2
    RETLW   4FH						;3
    RETLW   66H						;4
    RETLW   6DH						;5
    RETLW   7DH						;6
    RETLW   07H						;7
    RETLW   7FH						;8
    RETLW   67H						;9
    RETLW   77H						;A
    RETLW   7CH						;B
    RETLW   39H						;C
    RETLW   5EH						;D
    RETLW   79H						;E
    RETLW   71H						;F 
    
    END