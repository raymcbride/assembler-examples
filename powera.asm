;unsigned int power(unsigned int n, unsigned int k) // = n to the k

; Stack frame : 

;		k	second parameter 	[EBP+12]
;		n	first parameter		[EBP+8]
;		ra	return address		[EBP+4]
;	EBP ->	cl	callers EBP		[EBP]
;		p	local variable		[EBP-4]
;	ESP -> 	rv	local variable		[EBP-8]
	
.486                 	; Make 80486 instructions available
.MODEL USE32 SMALL   	; 32 bit addressing, addessses specified by offset only 
.CODE                	; Assemble in the code segment
PUBLIC _power        	; Borland C requires public assembler names to start with an
                     	; underscore. The underscore is not used in the C program
_power PROC
                     
;prologue
PUSH EBP		;store callers EBP
MOV EBP, ESP		;set own EBP
SUB ESP, 8		;space for 2 locals

;body
CMP dword ptr [EBP+12], 0	; if k!=0
JNZ elselab			;goto elselab
MOV dword ptr [EBP-8],1		; rv=1
JMP endlab			; goto endlab

elselab:

	;call sequence
	MOV EAX, [EBP+12]	;EAX = k
	DEC EAX			;EAX = k-1
	PUSH EAX		;push params k-1
	PUSH dword ptr [EBP+8]	;n
	CALL _power		;recursive call
	
	;return sequence
	ADD ESP, 8		;pop 2 params. power(n, k-1) is now ret val reg EAX
	MOV [EBP - 4], EAX 	;store recursive return value : p = power(n, k-1)
	
	;compute own return value
	MOV EAX, [EBP+8]	;EAX = n
	MOV EBX, [EBP-4] 	;EBX = p
	MUL EBX			;(EDX,EAX) = EAX * EBX = n * p
	MOV [EBP-8], EAX	; rv = n*p
	
;epilogue
endlab:
	MOV EAX, [EBP-8]	; return value into return value reg EAX
	MOV ESP, EBP		;make callers EBP the top of the stack
	POP EBP			;restore callers EBP
	RET			;return to caller
	
_power ENDP

END