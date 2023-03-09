#Autor:Diego Rodrigues Peireira

section .text
global _start

pop_eax_ret:
    pop eax
    ret

mov_eax_0x41_ret:
    mov eax, 0x41
    ret

mov_ecx_eax_ret:
    mov ecx, eax
    ret

mov_edx_4_ret:
    mov edx, 4
    ret

int_0x80:
    int 0x80

_start:
    ; write(1, 0x0804a000, 1)
    call pop_eax_ret   ; pop value into eax
    0x0804a000         ; address to write to
    call mov_eax_0x41_ret  ; move 0x41 into eax
    call mov_ecx_eax_ret   ; move eax into ecx
    call mov_edx_4_ret     ; move 4 into edx
    xor ebx, ebx      ; set ebx to 0
    inc ebx           ; set ebx to 1 (file descriptor for stdout)
    call int_0x80     ; call kernel write function
