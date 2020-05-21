	org 100h


section .text

	call	texto
	call	cursor
	call	phrase
	call	kbwait

	int 20h

texto: mov	ah,00h
       mov	al,03h
       int	10h
       ret

cursor: mov	ah,01h
	mov	ch,00000000b
	mov	cl,00001110b

	int	10h
	ret

w_char: mov	ah,09h
	mov	al,cl
	mov	bh,0h
	mov	bl,00001111b
	mov	cx,1h
	ret

kbwait: mov	ax,0000h
	int	16h
	ret

m_cursr:mov	ah,02h
	mov	dl,29d
	mov	dh,12d
	mov	bh,00h
	int	10h
	ret

phrase: mov	di,29d
lupi:   mov	cl,[msg+di-29d]
	call	m_cursr
	call	w_char
	inc	di
	cmp	di,len
	jb	lupi
	ret

section .data
msg	db	"Hola mundo"
len	equ	$-msg+29d