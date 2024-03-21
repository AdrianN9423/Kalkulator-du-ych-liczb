section .data
    tekst1 db "Podaj pierwsza liczbe: ", 0
    dl_tekst1 equ $-tekst1
    tekst2 db "Podaj druga liczbe: ", 0
    dl_tekst2 equ $-tekst2

section .bss
    liczba1 resb 5
    liczba2 resb 5 

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, tekst1
    mov edx, dl_tekst1
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, liczba1
    mov edx, 5
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, tekst2
    mov edx, dl_tekst2
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, liczba2
    mov edx, 5
    int 0x80

    mov eax, 1
    int 0x80