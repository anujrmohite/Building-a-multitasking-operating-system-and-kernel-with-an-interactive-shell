org 0x0
bits 16

main:
	mov si, os_boot_msg
	call print
	hlt

halt:
	jmp halt         ; Infinite loop to stop execution

print:
	push si
	push ax
	push bx

print_loop:
	lodsb
	or al, al
	jz done_print
	mov ah, 0x0e
	mov bh, 0        ; Page number (usually 0)
	int 0x10         ; BIOS interrupt to print character in AL

	jmp print_loop

done_print:
	pop bx
	pop ax
	pop si
	ret

os_boot_msg: db "Hello from the kernel/main.asm, The OS has Booted", 0x0d, 0x0a, 0  ;
