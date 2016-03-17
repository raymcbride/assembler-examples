; addita.asm
;int addit( unsigned int a, unsigned int b ) // returns  a + b
; {  int c = a+b;  return c; }
; 
;The Stack frame looks like :
;
;         value     b          [EBP + 12]   PARAMETERS WERE PUSHED RIGHT TO LEFT
;         value     a          [EBP + 8]
;         return    address    [EBP + 4]
;  EBP -> callers   EBP        [EBP]
;  ESP -> local var c          [EBP - 4]

; The Assembly program header
           
.486                 ; Make 80486 instructions available
.MODEL USE32 SMALL   ; 32 bit addressing, addessses specified by offset only 
.CODE                ; Assemble in the code segment
PUBLIC _addit        ; Borland C requires public assembler names to start with an
                     ; underscore. The underscore is not used in the C program

; The actual assembly code

_addit  PROC         ; Procedure start

   ; prologue
   PUSH EBP          ; Store callers EBP
   MOV  EBP, ESP     ; Set own EBP
   SUB  ESP, 4       ; Space for local variable c to hold return value

   ;body
   MOV  EAX,     [EBP + 8]  ; EAX = a
   MOV  EBX,     [EBP + 12] ; EBX = b           
   ADD  EAX,      EBX       ; EAX = a + b
   MOV [EBP - 4], EAX       ; c = a + b 
         
   ;epilogue
   MOV  EAX,     [EBP - 4]  ; EAX = return value (yes, EAX had this value already)        
   MOV  ESP,      EBP       ; make callers EBP top of stack
   POP  EBP                 ; restore callers EBP
   RET                      ; return to caller

_addit ENDP          ; End of procedure  

END                  ; End of source code 
