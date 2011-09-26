.model small
.stack 120h
.data
	a dw 2
	b dw 2
	c dw 2
	d dw 2
.code 
	start:
	mov AX, @DATA
	mov DS, AX

	mov AX, d  
	mov BX, a
	mul BX
	mov CX, AX
	mov AX, b
	mul BX
	add CX, AX

	mov AX, c
	mov DX, d
	mul DX
	mov BX, AX
	mov AX, b
	mov DX, d
	mul DX
	add BX, AX
	
	cmp CX, BX
	je first_if_true
	mov AX, a
	mov BX, d
	div BX
	mov BX, c
	div BX ;пишет ахинею в регистр AX
	jmp end_if
	
	first_if_true:
	mov BX, a
	mov CX, b
	cmp BX, CX
	jl second_if_true
	mov AX, c
	mul AX
	mov BX, a
	cmp 	BX, AX
	jl third_if_true
	mov AX, d
	mov BX, c
	xor AX, BX
	mov BX, a
	add AX, BX
	jmp end_if

	second_if_true:
	mov AX, a
	mov BX, a
	mul BX
	mul BX
	jmp end_if

	third_if_true:
	mov AX, d
	mul AX
	mov BX, AX
	mov AX, b
	mul AX
	add BX, AX
	mov AX, c
	mov CX, b
	or AX, CX	
	div BX
	
	end_if:
	mov AH,4CH
	int 21H ;выдает ошибку, код выхода 0
end start