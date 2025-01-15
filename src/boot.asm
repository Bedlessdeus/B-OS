[org 0x7c00]
[bits 16]

mov bx, string

jmp readInput

set_write:
	mov ah, 0x0e
	ret

set_read:
	mov ah, 0x00
	ret

execute_write:
	mov ah, 0x0e
	int 0x10
	ret

execute_read:
	mov ah, 0x00
	int 0x16
	ret

readInput:
	call execute_read
	call execute_write
	cmp al, '1'
	je print_exit_term
	jmp readInput

printString:
	mov al, [bx] ; Move the current character into al
	cmp al, 0 ; Check if it is the null terminator (End of string)
	je terminate ; If it is, return
	call execute_write
	inc bx ; Move to the next character
	jmp printString ; Repeat for the next character

print_exit:
	mov bx, string
	call printString
	ret

print_exit_term:
	call print_exit
	jmp terminate

terminate:
	jmp $

string:
	db 'Exited', 0

times 510-($-$$) db 0
db 0x55, 0xaa