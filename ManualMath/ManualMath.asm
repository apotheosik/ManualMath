;Chris Sequeira
;lab9

;hardware specifications
.586
.model flat, stdcall
.stack 4096

;MIPS ASSEMBLY 

;libraries
includelib libcmt.lib
;from stdio.h
includelib legacy_stdio_definitions.lib 

;extern: not our function, defined elsewhere
;NEAR: 
extern printf:NEAR
extern scanf:NEAR

ExitProcess PROTO, dwExitCode: DWORD

.data
;define variables

me db "Chris Sequeira ", 0

prompt db "Enter a value: ", 0
input dd 0

prompt2 db "Enter a second value: ", 0
input2 dd 0

sq dd 0
sq2 dd 0
sqsum dd 0
sqsumprint db "The sum of squares is %d", 0Ah, 0

address dd 0
bytesum dd 0
addressprint db "The sum of bytes is %d" , 0

format db "%d", 0


.code
main PROC c

	;print name
	push offset me
	call printf
	add esp, 4

	;scan in integer 
	push offset prompt
	call printf
	add esp, 4
	push offset input
	push offset format
	call scanf
	add esp, 8

	;scan second integer
	push offset prompt2
	call printf
	add esp, 4
	push offset input2
	push offset format
	call scanf
	add esp, 8

	;square input
	;put value to eax
	mov eax, input
	mul eax
	mov ebx, eax

	;square input2
	;put value to eax
	mov eax, input2
	mul eax

	;sum squares and output
	add eax, ebx
	;output
	push eax
	push offset sqsumprint
	call printf
	add esp, 8

	;Byte addition
	mov eax, offset input
	mov ebx, 0
	mov ecx, 0
	mov bl, BYTE PTR [eax]
	add ecx, ebx
	mov ebx, 0
	mov bl, BYTE PTR [eax+1]
	add ecx, ebx
	mov ebx, 0
	mov bl, BYTE PTR [eax+2]
	add ecx, ebx
	mov ebx, 0
	mov bl, BYTE PTR [eax+3]
	add ecx, ebx
	mov ebx, 0

	;push bytesum
	push ecx
	push offset addressprint
	call printf

	INVOKE ExitProcess, 0
	main ENDP
END

