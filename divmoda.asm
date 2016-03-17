;Stack Frame:
;
;
;			&c	[EBP+16]
;			b	[EBP+12]
;			a	[EBP+8]
;			RA	[EBP+4]
; EBP -> 		Callers	[EBP]	
; ESP ->		local d	[EBP-4]
;

.486                 ; Make 80486 instructions available
.MODEL USE32 SMALL   ; 32 bit addressing, addessses specified by offset only
.CODE                ; Assemble in the code segment
PUBLIC _divmod          ; Borland C requires public assembler names to start with an
                     ; underscore. The underscore is not used in the C program
_divmod PROC

;prologue
PUSH EBP
MOV EBP, ESP
SUB ESP, 4

;body
MOV EAX, [EBP+8]
MOV EBX, [EBP+12]
MOV ECX, [EBP+16]
MOV EDX, 0
DIV EBX
MOV [ECX], EDX

;epilogue
MOV ESP, EBP
POP EBP
RET

_divmod ENDP
END
