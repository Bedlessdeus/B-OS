[org 0x7c00]

readInput:
	mov ah, 0
	int 0x16
	cmp al, '1'
	je end
	mov ah, 0x0e
	int 0x10
	jmp readInput

printString:
    mov ah, 0x0e
    mov bh, 0
    mov bl, 0x07
    int 0x10
    ret

end:
    mov si, "Test"
    jmp printString
	jmp $

times 510-($-$$) db 0
db 0x55, 0xaa