TITLE Program Template(template.asm)

INCLUDE Irvine32.inc
INCLUDE macros.inc

.data
rply byte 0
md dword ?
score1 dword 0
randval dword 0
cor2 dword 0
cor1 dword 0
actual byte 20 dup(0)
coor dword ?
temp dword ?
letter byte 32, 65, 66, 67, 68, 69
arraych byte 49, 50, 51, 52, 53,
49, 50, 51, 52, 53,
54, 55, 56, 57, 48,
54, 55, 56, 57, 48
select byte 0
input1 byte 128 dup(0)
input2 byte 128 dup(0)

.code
main PROC
call randarray
_again :
call clrscr
mwrite "Dobrodosli u igru memorije"
call crlf
mwrite "1. mod: 4x5"
call crlf
mwrite "2. mod: 5x4"
call crlf
_begin :
mwrite "Izaberite mod : "
call readchar
mov select, al
call writechar
call crlf
cmp al, 49
je _4x5
cmp al, 50
je _5x4


mwrite "Nepostojeci mod!"
mov al, 7
call writechar
call crlf
jmp _begin

_5x4 :

mov md, 2

mov eax, 500
call delay
call clrscr
mov ebx, 0

_prvi_prikaz:

mov actual[ebx], 1
inc ebx
cmp ebx, 20
jne _prvi_prikaz
call screen_5x4
mov eax, 15000
call delay
mov ebx, 0

_zavrsen_prvi_prikaz :

mov actual[ebx], 0
inc ebx
cmp ebx, 20
jne _zavrsen_prvi_prikaz
mov eax, 500
call delay
call clrscr
call screen_5x4
call crlf
mwrite "Unesite zeljenu koordinatu:"

jmp _startup2

_4x5 :

mov md, 1

mov eax, 500
call delay
call clrscr
mov ebx, 0

_prvi_prikaz2:

mov actual[ebx], 1
inc ebx
cmp ebx, 20
jne _prvi_prikaz2
call screen_5x4
mov eax, 15000
call delay
mov ebx, 0

_zavrsen_prvi_prikaz2 :

mov actual[ebx], 0
inc ebx
cmp ebx, 20
jne _zavrsen_prvi_prikaz2
mov eax, 500
call delay
call clrscr
call screen_5x4
call crlf
mwrite "Unesite zeljenu koordinatu:"

_startup2 :

jmp _startup

_inval1 :

mwrite "Nije validan karakter!"
call crlf
mov al, 7
call writechar
call crlf
mwrite "Unesite zeljenu koordinatu:"
jmp _startup

_ara2 :

mwrite "Nije validan karakter!"
call crlf
mov al, 7
call writechar
call crlf
mwrite "Unesite zeljenu koordinatu:"

_startup :

mov ecx, sizeof input1
mov edx, offset input1
call readstring
cmp input1[0], 0
je _ara2
cmp input1[1], 0
je _ara2
cmp input1[2], 0
jne _ara2

mov esi, 0
mov edi, 0


cmp input1[edi], 'a'
je _A
cmp input1[edi], 'A'
je _A
cmp input1[edi], 'b'
je _B
cmp input1[edi], 'B'
je _B
cmp input1[edi], 'c'
je _C
cmp input1[edi], 'C'
je _C
cmp input1[edi], 'd'
je _D
cmp input1[edi], 'D'
je _D
cmp md, 2
je _greska
cmp input1[edi], 'e'
je _E
cmp input1[edi], 'E'
je _E

_greska :
jmp _ara2

_A :
add esi, 0
jmp _cont

_B :
add esi, 1
jmp _cont

_C :
add esi, 2
jmp _cont

_D :
add esi, 3
jmp _cont

_E :
add esi, 4
jmp _cont

_cont :
mov edi, 1


cmp input1[edi], 'a'
je _A1
cmp input1[edi], 'A'
je _A1
cmp input1[edi], 'b'
je _B1
cmp input1[edi], 'B'
je _B1
cmp input1[edi], 'c'
je _C1
cmp input1[edi], 'C'
je _C1
cmp input1[edi], 'd'
je _D1
cmp input1[edi], 'D'
je _D1
cmp md, 1
je _greska1
cmp input1[edi], 'e'
je _E1
cmp input1[edi], 'E'
je _E1

_greska1 :
jmp _inval1

_A1 :

add esi, 0
jmp _final1

_B1 :

add esi, 4
add esi, 2
sub esi, md
jmp _final1

_C1 :

add esi, 8
add esi, 2
sub esi, md
add esi, 2
sub esi, md
jmp _final1

_D1 :

add esi, 12
add esi, 2
sub esi, md
add esi, 2
sub esi, md
add esi, 2
sub esi, md
jmp _final1

_E1 :

add esi, 16
jmp _final1

_final1 :

mov cor1, esi
mov eax, cor1

cmp actual[esi], 1
je _err
mov actual[esi], 1
call screen_5x4
call crlf
mwrite "Unesite zeljenu koordinatu:"
jmp _secondary

_err :

mwrite "Vec ste uneli ovu koordinatu!"
mov al, 7
call writechar
call crlf
mwrite "Unesite zeljenu koordinatu:"
jmp _startup

_inval2 :

mwrite "Nije validan karakter!"
mov al, 7
call writechar
call crlf
mwrite "Unesite zeljenu koordinatu:"

_secondary :

mov edx, offset input2
mov ecx, sizeof input2 - 1

call readstring

cmp input2[0], 0
je _inval2
cmp input2[1], 0
je _inval2
cmp input2[2], 0
jne _inval2

mov esi, 0
mov edi, 0

cmp input2[edi], 'a'
je _A2
cmp input2[edi], 'A'
je _A2
cmp input2[edi], 'b'
je _B2
cmp input2[edi], 'B'
je _B2
cmp input2[edi], 'c'
je _C2
cmp input2[edi], 'C'
je _C2
cmp input2[edi], 'd'
je _D2
cmp input2[edi], 'D'
je _D2
cmp md, 2
je _greska2
cmp input2[edi], 'e'
je _E2
cmp input2[edi], 'E'
je _E2

_greska2 :
jmp _inval2

_A2 :

add esi, 0
jmp _cont2

_B2 :

add esi, 1
jmp _cont2

_C2 :

add esi, 2
jmp _cont2

_D2 :

add esi, 3
jmp _cont2

_E2 :

add esi, 4
jmp _cont2


_cont2 :
mov edi, 1

cmp input2[edi], 'a'
je _A3
cmp input2[edi], 'A'
je _A3
cmp input2[edi], 'b'
je _B3
cmp input2[edi], 'B'
je _B3
cmp input2[edi], 'c'
je _C3
cmp input2[edi], 'C'
je _C3
cmp input2[edi], 'd'
je _D3
cmp input2[edi], 'D'
je _D3
cmp md, 1
je _greska3
cmp input2[edi], 'e'
je _E3
cmp input2[edi], 'E'
je _E3

_greska3 :
jmp _inval2

_A3 :

add esi, 0
jmp _final2

_B3 :

add esi, 4
add esi, 2
sub esi, md
jmp _final2

_C3 :

add esi, 8
add esi, 2
sub esi, md
add esi, 2
sub esi, md
jmp _final2

_D3 :

add esi, 12
add esi, 2
sub esi, md
add esi, 2
sub esi, md
add esi, 2
sub esi, md
jmp _final2

_E3 :

add esi, 16
jmp _final2

_final2 :

mov cor2, esi
mov eax, cor2
cmp actual[esi], 1
je _err2
mov actual[esi], 1
call screen_5x4
jmp conti

_err2 :

mwrite "Vec ste uneli ovu koordinatu!"
mov al, 7
call writechar
call crlf
mwrite "Unesite zeljenu koordinatu:"
jmp _secondary

conti :

mov esi, cor1
mov edi, cor2
mov al, arraych[esi]
cmp al, arraych[edi]
je _yey
mov actual[esi], 0
mov actual[edi], 0
jmp _scor

_yey :

inc score1
jmp _skor

_scor :
mov eax, 4500
call delay

_skor :
mov eax, 500
call delay

call clrscr
call screen_5x4
call crlf
mwrite " Rezultat = "
mov eax, score1
call writedec
call crlf

cmp score1, 9
jg _ex1
mwrite "Unesite zeljenu koordinatu:"
jmp _startup2

_ex1 :

mwrite " Pobedili ste !!"
call _restart
cmp rply, 1
jne _qu
jmp _again

_qu :

exit
main ENDP


_restart PROC
call crlf
mwrite "Da li zelite da igrate ponovo? (D/N)"
call readchar

_h1 :

cmp al, 68
je _D
cmp al, 100
je _D

cmp al, 78
je _N
cmp al, 110
je _N
call crlf
mwrite "Nije validan karakter!"
call crlf
jmp _h1

_D :

mov rply, 1
mov score1, 0
mov edi, 0
mov ecx, 20

_lp1 :

	mov actual[edi], 0

	loop _lp1

	jmp _quit

	_N :

mov rply, 0
call crlf
mwrite "Hvala sto ste igrali..."



_quit :
	ret
	_restart ENDP

	screen_5x4 PROC

	call clrscr

	mwrite "Ucitavanje..."
	mov eax, 500
	call delay
	call clrscr
	mov esi, 0
	mov edi, 0

	cmp md, 2
	je _mod2
	mov ecx, 6
	jmp _mod1

	_mod2 :

mov ecx, 5

_mod1 :

	mov al, 32
	call writechar

	ispis_5x4 :

mov al, letter[esi]
call writechar
mov al, 32
call writechar
cmp esi, 0
je _preskok
mov al, 32
call writechar

_preskok :

inc esi
loop ispis_5x4

call crlf
call crlf

cmp md, 2
je _mode2
mov ecx, 4
jmp _mode1

_mode2 :

mov ecx, 5

_mode1 :

	mov edi, 1
	mov esi, 0

	l4 :

	mov temp, ecx
	mov al, letter[edi]
	call writechar
	mov al, 32
	call writechar
	inc edi

	cmp md, 2
	je _md2
	mov ecx, 5
	jmp _md1

	_md2 :

mov ecx, 4

_md1 :

	l3 :

	mov al, 32
	call writechar
	cmp actual[esi], 1
	jne _not_keep
	mov al, arraych[esi]
	call writechar
	mov al, 32
	call writechar
	jmp _after

	_not_keep :

mov al, 177
call writechar
mov al, 32
call writechar

_after :

inc esi
loop l3
call crlf
mov ecx, temp
call crlf
loop l4

ret

screen_5x4 ENDP

randarray PROC
mov ebx, 0
mov edi, 0

call randomize

_mesanje :

mov eax, 20
call RandomRange
mov randval, eax
mov esi, randval

mov dl, arraych[esi]
mov cl, arraych[edi]

mov arraych[edi], dl
mov arraych[esi], cl

inc edi
inc ebx
cmp ebx, 20
jne _mesanje

ret

randarray ENDP

END main