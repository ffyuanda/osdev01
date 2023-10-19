; A Simple Bootloader
org 0x7c00
bits 16
start: jmp boot

;; constant and variable definitions
msg db "Welcome to My Operating System", 0ah, 0dh, 0h

boot:
	cli ; no interrupts
	cld ; all that we need to init
	call MovCursor
	hlt ; halt the system

MovCursor:
	mov dh, 0x0
	mov dl, 0x5
	mov ah, 0x2
	mov bh, 0x0

	int 0x10
	ret

; We have to be 512 bytes. Clear the rest of the bytes with 0
times 510 - ($-$$) db 0
dw 0xAA55
