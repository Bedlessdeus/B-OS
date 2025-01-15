[org 0x7c00]
[bits 16]

mov bx, string

set_write:
	mov ah, 0x0e

set_read:
	mov ah, 0x00

execute_write:
	mov ah, 0x0e
	int 0x10

execute_read:
	mov ah, 0x00
	int 0x16

readInput:
	jmp execute_read
	jmp execute_write
	cmp al, '1'
	je die
	jmp readInput

printString:
	mov al, [bx] ; Move the current character into al
	cmp al, 0 ; Check if it is the null terminator (End of string)
	je terminate ; If it is, return
	jmp execute_write
	inc bx ; Move to the next character
	jmp printString ; Repeat for the next character

die:
	mov bx, string
	jmp printString
	jmp $

terminate:
	jmp $

string:
	db 'Exited', 0

times 510-($-$$) db 0
db 0x55, 0xaa