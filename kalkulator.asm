section .data
    tekst1 db "Podaj pierwsza liczbe: ", 0
    dl_tekst1 equ $-tekst1
    tekst2 db "Podaj druga liczbe: ", 0
    dl_tekst2 equ $-tekst2
    tekst3 db "Wynik: ", 0
    dl_tekst3 equ $-tekst3

section .bss
    liczba1 resb 101
    liczba2 resb 101
    suma    resb 202

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
    mov edx, 101
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, tekst2
    mov edx, dl_tekst2
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, liczba2
    mov edx, 101
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, tekst3
    mov edx, dl_tekst3
    int 0x80

    xor esi, esi
    mov eax, liczba1
dlugosc_liczby:
    cmp byte [eax + esi], 0
    je koniec_dlugosc
    inc esi
    jmp dlugosc_liczby

koniec_dlugosc:
    xor edi, edi
    mov eax, 0
    mov ecx, 1
    
petla:
    cmp edi, esi
    je koniec
    movzx eax, byte[liczba1+edi]
    sub eax, '0'
    movzx ebx, byte[liczba2+edi]
    sub ebx, '0'
    adc eax, ebx

    cmp eax, 10
    jge odejmij_10

    add eax, '0'
    mov [suma+edi], eax

    int 0x80

    inc edi

    jmp petla

odejmij_10:
    dec edi
    movzx ebx, byte[suma+edi]
    sub ebx, '0'
    add ebx, ecx
    add ebx, '0'
    mov [suma+edi], ebx

    inc edi
    sub eax, 10
    add eax, '0'
    mov [suma+edi], eax
    int 0x80
    
    inc edi
    jmp petla

koniec:

    mov eax, 4
    mov ebx, 1
    mov ecx, suma
    mov edx, 202
    int 0x80

    mov eax, 1
    int 0x80