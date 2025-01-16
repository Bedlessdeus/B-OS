[org 0x7c00]
[bits 16]

jmp start

buffer:
    times 12 db 0

string:
    db 'Exited', 0

start:
    mov bx, buffer
    mov cx, 12

readInput:
    call execute_read
    cmp al, 13
    je print_exit_term
    call execute_write
    mov [bx], al
    inc bx
    loop readInput

print_exit_term:
    call print_exit
    call print_buffer
    jmp terminate

print_exit:
    mov bx, string

printString:
    mov al, [bx]
    cmp al, 0
    je done_print
    call execute_write
    inc bx
    jmp printString

done_print:
    ret

print_buffer:
    mov bx, buffer
    mov cx, 12

print_buffer_loop:
    mov al, [bx]
    cmp al, 0
    je done_buffer
    call execute_write
    inc bx
    loop print_buffer_loop

done_buffer:
    ret

execute_write:
    mov ah, 0x0e
    int 0x10
    ret

execute_read:
    mov ah, 0x00
    int 0x16
    ret

terminate:
    jmp $

times 510-($-$$) db 0
dw 0xAA55