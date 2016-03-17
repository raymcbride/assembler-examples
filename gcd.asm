;
; Stack Frame:
;
;
;		b		[EBP+12]
;		a		[EBP+8]
;		RA		[EBP+4]
;	EBP ->	Callers EBP	[EBP]
;	ESP -> 	local rv	[EBP-4]
;
;
.486                 	; Make 80486 instructions available
.MODEL USE32 SMALL   	; 32 bit addressing, addessses specified by offset only 
.CODE                	; Assemble in the code segment
PUBLIC _gcd        	; Borland C requires public assembler names to start with an
                     	; underscore. The underscore is not used in the C program
_gcd PROC

;prologue
PUSH EBP
MOV EBP, ESP
SUB ESP, 4

;body
MOV EAX, [EBP+8]
MOV EBX, [EBP+12]
CMP EBX, 0
JNZ elselab
MOV [EBP-4], EAX
JMP endiflab

elselab:

MOV EDX, 0
DIV EBX
PUSH EDX
PUSH EBX
CALL _gcd
ADD ESP, 8
MOV [EBP-4], EAX




endiflab:
;epilogue
MOV [EBP-4], EAX
MOV ESP, EBP
POP EBP
RET

END