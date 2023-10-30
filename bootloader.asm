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

	mov al, "D"
	mov cx, 10
	call PutChar
	hlt ; halt the system

MovCursor: ; dh: row, 
		   ; dl: col
	mov ah, 0x2
	mov bh, 0x0

	int 0x10
	ret

PutChar: ; al: character to write 
		 ; cx: repeat count
	mov ah, 0xe
	int 0x10
	ret

; We have to be 512 bytes. Clear the rest of the bytes with 0
times 510 - ($-$$) db 0
dw 0xAA55
