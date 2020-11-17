	.file	"linkedLists.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	_mergeSortArr.part.0, @function
_mergeSortArr.part.0:
.LFB33:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r15d, esi
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	mov	r13, rdi
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	mov	r12d, esi
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	ebx, esi
	shr	ebx, 31
	add	ebx, esi
	sar	ebx
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	movsx	rax, ebx
	sub	r15d, ebx
	mov	QWORD PTR 24[rsp], rax
	sal	rax, 2
	mov	rdi, rax
	mov	QWORD PTR 8[rsp], rax
	call	malloc@PLT
	mov	rbp, rax
	movsx	rax, r15d
	lea	rdi, 0[0+rax*4]
	mov	QWORD PTR 16[rsp], rax
	call	malloc@PLT
	mov	r14, rax
	cmp	r12d, 1
	jle	.L5
	lea	eax, -1[rbx]
	mov	rsi, r13
	mov	rdi, rbp
	lea	rdx, 4[0+rax*4]
	call	memcpy@PLT
.L5:
	test	r15d, r15d
	jle	.L4
	mov	rdx, QWORD PTR 16[rsp]
	mov	rsi, QWORD PTR 8[rsp]
	mov	rdi, r14
	sal	rdx, 2
	add	rsi, r13
	call	memcpy@PLT
.L4:
	cmp	ebx, 1
	je	.L6
	cmp	ebx, 2
	je	.L43
	mov	esi, ebx
	mov	rdi, rbp
	call	_mergeSortArr.part.0
	cmp	r15d, 1
	je	.L10
	cmp	r15d, 2
	je	.L44
.L11:
	mov	esi, r15d
	mov	rdi, r14
	call	_mergeSortArr.part.0
.L10:
	test	r15d, r15d
	jle	.L22
	cmp	r12d, 1
	jle	.L22
.L21:
	xor	edx, edx
	xor	eax, eax
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L45:
	mov	DWORD PTR [rsi], r10d
	add	eax, 1
	cmp	ebx, edx
	jle	.L13
.L46:
	cmp	r15d, eax
	jle	.L13
.L16:
	movsx	rsi, eax
	mov	r10d, DWORD PTR [r14+rsi*4]
	movsx	rsi, edx
	mov	edi, DWORD PTR 0[rbp+rsi*4]
	lea	esi, [rdx+rax]
	movsx	rsi, esi
	lea	rsi, 0[r13+rsi*4]
	cmp	edi, r10d
	jg	.L45
	add	edx, 1
	mov	DWORD PTR [rsi], edi
	cmp	ebx, edx
	jg	.L46
.L13:
	cmp	ebx, edx
	je	.L18
	jle	.L20
	movsx	rsi, edx
	cdqe
	sub	ebx, 1
	add	rax, rsi
	sub	ebx, edx
	lea	rsi, 0[rbp+rsi*4]
	lea	rdi, 0[r13+rax*4]
	lea	rdx, 4[0+rbx*4]
	call	memcpy@PLT
.L20:
	mov	rdi, rbp
	call	free@PLT
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	rdi, r14
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
	mov	eax, DWORD PTR 4[rbp]
	mov	edx, DWORD PTR 0[rbp]
	cmp	eax, edx
	jge	.L6
	movd	xmm0, eax
	movd	xmm1, edx
	punpckldq	xmm0, xmm1
	movq	QWORD PTR 0[rbp], xmm0
.L6:
	cmp	r15d, 1
	je	.L21
	cmp	r15d, 2
	jne	.L11
.L44:
	mov	eax, DWORD PTR 4[r14]
	mov	edx, DWORD PTR [r14]
	cmp	eax, edx
	jge	.L10
	movd	xmm0, eax
	movd	xmm2, edx
	punpckldq	xmm0, xmm2
	movq	QWORD PTR [r14], xmm0
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L18:
	cmp	r15d, eax
	jle	.L20
	mov	rcx, QWORD PTR 24[rsp]
	lea	r9d, -1[r15]
	movsx	rdx, eax
	sub	r9d, eax
	lea	rsi, [r14+rdx*4]
	add	rcx, rdx
	lea	r9, 4[0+r9*4]
	lea	rdi, 0[r13+rcx*4]
	mov	rdx, r9
	call	memcpy@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L22:
	xor	edx, edx
	xor	eax, eax
	jmp	.L13
	.cfi_endproc
.LFE33:
	.size	_mergeSortArr.part.0, .-_mergeSortArr.part.0
	.p2align 4
	.globl	deleteList
	.type	deleteList, @function
deleteList:
.LFB22:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	mov	rbx, QWORD PTR [rdi]
	test	rbx, rbx
	je	.L47
	mov	rbp, rdi
	.p2align 4,,10
	.p2align 3
.L48:
	mov	rdi, rbx
	mov	rbx, QWORD PTR 16[rbx]
	call	free@PLT
	mov	QWORD PTR 0[rbp], rbx
	test	rbx, rbx
	jne	.L48
.L47:
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	deleteList, .-deleteList
	.p2align 4
	.globl	copyList
	.type	copyList, @function
copyList:
.LFB23:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	mov	r13, rdi
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 8
	.cfi_def_cfa_offset 64
	mov	rbx, QWORD PTR [rsi]
	test	rbx, rbx
	je	.L58
	mov	ebp, 1
	xor	eax, eax
	xor	r12d, r12d
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L67:
	test	r14, r14
	je	.L55
	mov	QWORD PTR [rax], r14
	mov	edx, ebp
	add	ebp, 1
	mov	QWORD PTR 16[r14], rax
	mov	rbx, QWORD PTR 16[rbx]
	test	rbx, rbx
	je	.L54
.L57:
	mov	r15d, DWORD PTR 8[rbx]
	mov	edi, 24
	mov	r14, rax
	call	malloc@PLT
	mov	DWORD PTR 8[rax], r15d
	mov	QWORD PTR 16[rax], 0
	test	r12, r12
	jne	.L67
.L55:
	mov	rbx, QWORD PTR 16[rbx]
	mov	edx, ebp
	mov	QWORD PTR [rax], 0
	mov	r12, rax
	add	ebp, 1
	test	rbx, rbx
	jne	.L57
.L54:
	movq	xmm0, r12
	movq	xmm1, rax
	mov	DWORD PTR 16[r13], edx
	mov	rax, r13
	punpcklqdq	xmm0, xmm1
	movups	XMMWORD PTR 0[r13], xmm0
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_restore_state
	xor	eax, eax
	xor	r12d, r12d
	xor	edx, edx
	jmp	.L54
	.cfi_endproc
.LFE23:
	.size	copyList, .-copyList
	.p2align 4
	.globl	createFromArray
	.type	createFromArray, @function
createFromArray:
.LFB24:
	.cfi_startproc
	test	edx, edx
	jle	.L79
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	eax, DWORD PTR 16[rdi]
	mov	rbx, rdi
	lea	ebp, 1[rax]
	lea	r13d, 0[rbp+rdx]
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L83:
	mov	rdx, QWORD PTR 8[rbx]
	test	rdx, rdx
	je	.L70
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR 16[rdx], rax
.L71:
	mov	DWORD PTR 16[rbx], ebp
	add	ebp, 1
	add	r12, 4
	mov	QWORD PTR 8[rbx], rax
	cmp	ebp, r13d
	je	.L82
.L72:
	mov	r14d, DWORD PTR [r12]
	mov	edi, 24
	call	malloc@PLT
	cmp	QWORD PTR [rbx], 0
	mov	DWORD PTR 8[rax], r14d
	mov	QWORD PTR 16[rax], 0
	jne	.L83
.L70:
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR [rbx], rax
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L82:
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L79:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE24:
	.size	createFromArray, .-createFromArray
	.p2align 4
	.globl	append
	.type	append, @function
append:
.LFB25:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ebp, esi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	mov	edi, 24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	cmp	QWORD PTR [rbx], 0
	mov	DWORD PTR 8[rax], ebp
	mov	QWORD PTR 16[rax], 0
	je	.L85
	mov	rdx, QWORD PTR 8[rbx]
	test	rdx, rdx
	je	.L85
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR 16[rdx], rax
	add	DWORD PTR 16[rbx], 1
	mov	QWORD PTR 8[rbx], rax
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
	mov	QWORD PTR [rax], 0
	add	DWORD PTR 16[rbx], 1
	mov	QWORD PTR [rbx], rax
	mov	QWORD PTR 8[rbx], rax
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	append, .-append
	.p2align 4
	.globl	prepend
	.type	prepend, @function
prepend:
.LFB26:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ebp, esi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	mov	edi, 24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	mov	rdx, QWORD PTR [rbx]
	mov	DWORD PTR 8[rax], ebp
	mov	QWORD PTR [rax], 0
	test	rdx, rdx
	je	.L92
	cmp	QWORD PTR 8[rbx], 0
	je	.L92
	mov	QWORD PTR 16[rax], rdx
	mov	QWORD PTR [rdx], rax
	add	DWORD PTR 16[rbx], 1
	mov	QWORD PTR [rbx], rax
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	.cfi_restore_state
	mov	QWORD PTR 16[rax], 0
	add	DWORD PTR 16[rbx], 1
	mov	QWORD PTR 8[rbx], rax
	mov	QWORD PTR [rbx], rax
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	prepend, .-prepend
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"return Nth value: index not in range of list, returning -1"
	.text
	.p2align 4
	.globl	nthValue
	.type	nthValue, @function
nthValue:
.LFB27:
	.cfi_startproc
	test	esi, esi
	js	.L99
	mov	edx, DWORD PTR 16[rdi]
	cmp	edx, esi
	jle	.L99
	mov	eax, edx
	sar	eax
	cmp	eax, esi
	jle	.L115
	mov	rax, QWORD PTR [rdi]
	xor	edx, edx
	test	esi, esi
	je	.L103
	.p2align 4,,10
	.p2align 3
.L102:
	add	edx, 1
	mov	rax, QWORD PTR 16[rax]
	cmp	esi, edx
	jne	.L102
.L103:
	mov	eax, DWORD PTR 8[rax]
	ret
	.p2align 4,,10
	.p2align 3
.L115:
	sub	edx, 1
	mov	rax, QWORD PTR 8[rdi]
	cmp	esi, edx
	jge	.L103
	.p2align 4,,10
	.p2align 3
.L104:
	sub	edx, 1
	mov	rax, QWORD PTR [rax]
	cmp	esi, edx
	jne	.L104
	mov	eax, DWORD PTR 8[rax]
	ret
.L99:
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	lea	rdi, .LC0[rip]
	xor	eax, eax
	call	printf@PLT
	mov	eax, -1
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	nthValue, .-nthValue
	.p2align 4
	.globl	findValue
	.type	findValue, @function
findValue:
.LFB28:
	.cfi_startproc
	mov	rax, QWORD PTR [rdi]
	xor	r8d, r8d
	test	rax, rax
	jne	.L117
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L119:
	mov	rax, QWORD PTR 16[rax]
	add	r8d, 1
	test	rax, rax
	je	.L116
.L117:
	cmp	DWORD PTR 8[rax], esi
	jne	.L119
.L116:
	mov	eax, r8d
	ret
	.cfi_endproc
.LFE28:
	.size	findValue, .-findValue
	.p2align 4
	.globl	joinLists
	.type	joinLists, @function
joinLists:
.LFB29:
	.cfi_startproc
	mov	rax, QWORD PTR [rsi]
	mov	rdx, QWORD PTR 8[rdi]
	mov	QWORD PTR 16[rdx], rax
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR 8[rsi]
	mov	QWORD PTR 8[rdi], rax
	mov	eax, DWORD PTR 16[rsi]
	add	DWORD PTR 16[rdi], eax
	ret
	.cfi_endproc
.LFE29:
	.size	joinLists, .-joinLists
	.p2align 4
	.globl	mergeLists
	.type	mergeLists, @function
mergeLists:
.LFB30:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	rbp, QWORD PTR [rsi]
	mov	r12, QWORD PTR [rdx]
	mov	QWORD PTR 8[rsp], rdi
	test	rbp, rbp
	je	.L145
	test	r12, r12
	je	.L145
	mov	r15d, 1
	xor	ebx, ebx
	xor	r13d, r13d
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L186:
	call	malloc@PLT
	mov	ecx, DWORD PTR 4[rsp]
	mov	QWORD PTR 16[rax], 0
	mov	DWORD PTR 8[rax], ecx
	test	r13, r13
	je	.L129
	test	rbx, rbx
	je	.L129
	mov	QWORD PTR [rax], rbx
	mov	QWORD PTR 16[rbx], rax
.L130:
	mov	rbp, QWORD PTR 16[rbp]
	mov	edx, r15d
	mov	rbx, rax
	add	r15d, 1
	test	rbp, rbp
	je	.L127
.L187:
	test	r12, r12
	je	.L127
.L134:
	mov	ecx, DWORD PTR 8[rbp]
	mov	r14d, DWORD PTR 8[r12]
	mov	edi, 24
	cmp	ecx, r14d
	mov	DWORD PTR 4[rsp], ecx
	jle	.L186
	call	malloc@PLT
	mov	DWORD PTR 8[rax], r14d
	mov	QWORD PTR 16[rax], 0
	test	r13, r13
	je	.L132
	test	rbx, rbx
	je	.L132
	mov	QWORD PTR [rax], rbx
	mov	QWORD PTR 16[rbx], rax
.L133:
	mov	edx, r15d
	mov	r12, QWORD PTR 16[r12]
	mov	rbx, rax
	add	r15d, 1
	test	rbp, rbp
	jne	.L187
.L127:
	lea	r15d, 1[rdx]
	test	rbp, rbp
	jne	.L141
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L188:
	test	r12, r12
	je	.L139
	mov	QWORD PTR [rax], r12
	mov	edx, r15d
	add	r15d, 1
	mov	QWORD PTR 16[r12], rax
	mov	rbp, QWORD PTR 16[rbp]
	test	rbp, rbp
	je	.L138
.L141:
	mov	r14d, DWORD PTR 8[rbp]
	mov	edi, 24
	mov	r12, rbx
	call	malloc@PLT
	mov	DWORD PTR 8[rax], r14d
	mov	rbx, rax
	mov	QWORD PTR 16[rax], 0
	test	r13, r13
	jne	.L188
.L139:
	mov	rbp, QWORD PTR 16[rbp]
	mov	edx, r15d
	mov	QWORD PTR [rbx], 0
	mov	r13, rbx
	add	r15d, 1
	test	rbp, rbp
	jne	.L141
.L138:
	mov	rax, QWORD PTR 8[rsp]
	movq	xmm0, r13
	movq	xmm1, rbx
	punpcklqdq	xmm0, xmm1
	mov	DWORD PTR 16[rax], edx
	movups	XMMWORD PTR [rax], xmm0
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L129:
	.cfi_restore_state
	mov	QWORD PTR [rax], 0
	mov	r13, rax
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L132:
	mov	QWORD PTR [rax], 0
	mov	r13, rax
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L189:
	test	rbp, rbp
	je	.L142
	mov	QWORD PTR [rax], rbp
	mov	QWORD PTR 16[rbp], rax
.L143:
	mov	r12, QWORD PTR 16[r12]
	mov	edx, r15d
	add	r15d, 1
.L185:
	test	r12, r12
	je	.L138
	mov	r14d, DWORD PTR 8[r12]
	mov	edi, 24
	mov	rbp, rbx
	call	malloc@PLT
	mov	DWORD PTR 8[rax], r14d
	mov	rbx, rax
	mov	QWORD PTR 16[rax], 0
	test	r13, r13
	jne	.L189
.L142:
	mov	QWORD PTR [rbx], 0
	mov	r13, rbx
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L145:
	xor	edx, edx
	xor	ebx, ebx
	xor	r13d, r13d
	jmp	.L127
	.cfi_endproc
.LFE30:
	.size	mergeLists, .-mergeLists
	.p2align 4
	.globl	mergeSort
	.type	mergeSort, @function
mergeSort:
.LFB31:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	movsx	rdi, DWORD PTR 16[rdi]
	mov	r12, rdi
	sal	rdi, 2
	call	malloc@PLT
	mov	rbp, rax
	mov	rax, QWORD PTR [rbx]
	test	rax, rax
	je	.L191
	mov	rcx, rbp
	mov	rdx, rax
	.p2align 4,,10
	.p2align 3
.L192:
	mov	esi, DWORD PTR 8[rdx]
	mov	rdx, QWORD PTR 16[rdx]
	add	rcx, 4
	mov	DWORD PTR -4[rcx], esi
	test	rdx, rdx
	jne	.L192
	cmp	r12d, 1
	je	.L196
.L199:
	cmp	r12d, 2
	je	.L210
	mov	esi, r12d
	mov	rdi, rbp
	call	_mergeSortArr.part.0
	mov	rax, QWORD PTR [rbx]
.L195:
	test	rax, rax
	je	.L198
.L196:
	mov	rdx, rbp
	.p2align 4,,10
	.p2align 3
.L197:
	mov	ecx, DWORD PTR [rdx]
	add	rdx, 4
	mov	DWORD PTR 8[rax], ecx
	mov	rax, QWORD PTR 16[rax]
	test	rax, rax
	jne	.L197
.L198:
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rdi, rbp
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L210:
	.cfi_restore_state
	mov	edx, DWORD PTR 4[rbp]
	mov	ecx, DWORD PTR 0[rbp]
	cmp	edx, ecx
	jge	.L195
	movd	xmm0, edx
	movd	xmm1, ecx
	punpckldq	xmm0, xmm1
	movq	QWORD PTR 0[rbp], xmm0
	jmp	.L195
	.p2align 4,,10
	.p2align 3
.L191:
	cmp	r12d, 1
	jne	.L199
	jmp	.L198
	.cfi_endproc
.LFE31:
	.size	mergeSort, .-mergeSort
	.p2align 4
	.globl	_mergeSortArr
	.type	_mergeSortArr, @function
_mergeSortArr:
.LFB32:
	.cfi_startproc
	cmp	esi, 1
	je	.L211
	cmp	esi, 2
	je	.L217
	jmp	_mergeSortArr.part.0
	.p2align 4,,10
	.p2align 3
.L217:
	mov	eax, DWORD PTR 4[rdi]
	mov	edx, DWORD PTR [rdi]
	cmp	eax, edx
	jl	.L218
.L211:
	ret
	.p2align 4,,10
	.p2align 3
.L218:
	movd	xmm0, eax
	movd	xmm1, edx
	punpckldq	xmm0, xmm1
	movq	QWORD PTR [rdi], xmm0
	ret
	.cfi_endproc
.LFE32:
	.size	_mergeSortArr, .-_mergeSortArr
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
