	.file	"linkedLists.c"
	.intel_syntax noprefix
	.text
	.globl	deleteList
	.type	deleteList, @function
deleteList:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	push	rdx
	.cfi_def_cfa_offset 32
	mov	rbp, QWORD PTR [rdi]
.L2:
	test	rbp, rbp
	je	.L6
	mov	rdi, QWORD PTR [rbx]
	mov	rbp, QWORD PTR 16[rdi]
	call	free@PLT
	mov	QWORD PTR [rbx], rbp
	jmp	.L2
.L6:
	pop	rax
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6:
	.size	deleteList, .-deleteList
	.globl	append
	.type	append, @function
append:
.LFB9:
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
	push	rdx
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	cmp	QWORD PTR [rbx], 0
	mov	DWORD PTR 8[rax], ebp
	mov	QWORD PTR 16[rax], 0
	je	.L8
	mov	rdx, QWORD PTR 8[rbx]
	test	rdx, rdx
	je	.L8
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR 16[rdx], rax
	jmp	.L9
.L8:
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR [rbx], rax
.L9:
	inc	DWORD PTR 16[rbx]
	mov	QWORD PTR 8[rbx], rax
	pop	rax
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9:
	.size	append, .-append
	.globl	copyList
	.type	copyList, @function
copyList:
.LFB7:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	sub	rsp, 32
	.cfi_def_cfa_offset 64
	mov	rbx, QWORD PTR [rsi]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	mov	QWORD PTR [rsp], 0
	mov	rbp, rsp
	mov	QWORD PTR 8[rsp], 0
	mov	DWORD PTR 16[rsp], 0
.L15:
	test	rbx, rbx
	je	.L19
	mov	esi, DWORD PTR 8[rbx]
	mov	rdi, rbp
	call	append
	mov	rbx, QWORD PTR 16[rbx]
	jmp	.L15
.L19:
	mov	rax, QWORD PTR 16[rsp]
	movups	xmm0, XMMWORD PTR [rsp]
	mov	QWORD PTR 16[r12], rax
	movups	XMMWORD PTR [r12], xmm0
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	add	rsp, 32
	.cfi_def_cfa_offset 32
	mov	rax, r12
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7:
	.size	copyList, .-copyList
	.globl	createFromArray
	.type	createFromArray, @function
createFromArray:
.LFB8:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	r13, rsi
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	ebp, edx
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xor	ebx, ebx
	push	rcx
	.cfi_def_cfa_offset 48
.L21:
	cmp	ebp, ebx
	jle	.L24
	mov	esi, DWORD PTR 0[r13+rbx*4]
	mov	rdi, r12
	inc	rbx
	call	append
	jmp	.L21
.L24:
	pop	rax
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	createFromArray, .-createFromArray
	.globl	prepend
	.type	prepend, @function
prepend:
.LFB10:
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
	push	rdx
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	mov	rdx, QWORD PTR [rbx]
	mov	DWORD PTR 8[rax], ebp
	mov	QWORD PTR [rax], 0
	test	rdx, rdx
	je	.L26
	cmp	QWORD PTR 8[rbx], 0
	je	.L26
	mov	QWORD PTR 16[rax], rdx
	mov	QWORD PTR [rdx], rax
	jmp	.L27
.L26:
	mov	QWORD PTR 16[rax], 0
	mov	QWORD PTR 8[rbx], rax
.L27:
	inc	DWORD PTR 16[rbx]
	mov	QWORD PTR [rbx], rax
	pop	rax
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE10:
	.size	prepend, .-prepend
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"return Nth value: index not in range of list, returning -1"
	.text
	.globl	nthValue
	.type	nthValue, @function
nthValue:
.LFB11:
	.cfi_startproc
	test	esi, esi
	js	.L33
	mov	eax, DWORD PTR 16[rdi]
	cmp	eax, esi
	jle	.L33
	mov	edx, eax
	sar	edx
	cmp	edx, esi
	jle	.L34
	mov	rdx, QWORD PTR [rdi]
	xor	eax, eax
.L35:
	cmp	eax, esi
	je	.L37
	mov	rdx, QWORD PTR 16[rdx]
	inc	eax
	jmp	.L35
.L37:
	mov	eax, DWORD PTR 8[rdx]
	ret
.L33:
	push	rax
	.cfi_def_cfa_offset 16
	lea	rdi, .LC0[rip]
	xor	eax, eax
	call	printf@PLT
	or	eax, -1
	pop	rdx
	.cfi_def_cfa_offset 8
	ret
.L34:
	mov	rdx, QWORD PTR 8[rdi]
.L44:
	dec	eax
	cmp	eax, esi
	je	.L37
	mov	rdx, QWORD PTR [rdx]
	jmp	.L44
	.cfi_endproc
.LFE11:
	.size	nthValue, .-nthValue
	.globl	findValue
	.type	findValue, @function
findValue:
.LFB12:
	.cfi_startproc
	mov	rax, QWORD PTR [rdi]
	xor	r8d, r8d
.L46:
	test	rax, rax
	je	.L45
	cmp	DWORD PTR 8[rax], esi
	je	.L45
	mov	rax, QWORD PTR 16[rax]
	inc	r8d
	jmp	.L46
.L45:
	mov	eax, r8d
	ret
	.cfi_endproc
.LFE12:
	.size	findValue, .-findValue
	.globl	joinLists
	.type	joinLists, @function
joinLists:
.LFB13:
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
.LFE13:
	.size	joinLists, .-joinLists
	.globl	mergeLists
	.type	mergeLists, @function
mergeLists:
.LFB14:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 40
	.cfi_def_cfa_offset 80
	mov	rbx, QWORD PTR [rsi]
	mov	rbp, QWORD PTR [rdx]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	mov	QWORD PTR [rsp], 0
	mov	r13, rsp
	mov	QWORD PTR 8[rsp], 0
	mov	DWORD PTR 16[rsp], 0
.L52:
	test	rbx, rbx
	je	.L64
	test	rbp, rbp
	je	.L70
	mov	r8d, DWORD PTR 8[rbx]
	mov	esi, DWORD PTR 8[rbp]
	cmp	r8d, esi
	jg	.L53
	mov	esi, r8d
	mov	rdi, r13
	call	append
	mov	rbx, QWORD PTR 16[rbx]
	jmp	.L52
.L53:
	mov	rdi, r13
	call	append
	mov	rbp, QWORD PTR 16[rbp]
	jmp	.L52
.L70:
	test	rbx, rbx
	je	.L64
	mov	rbp, rsp
	jmp	.L58
.L64:
	mov	rbx, rsp
	jmp	.L57
.L58:
	mov	esi, DWORD PTR 8[rbx]
	mov	rdi, rbp
	call	append
	mov	rbx, QWORD PTR 16[rbx]
	test	rbx, rbx
	jne	.L58
.L60:
	mov	rax, QWORD PTR 16[rsp]
	movups	xmm0, XMMWORD PTR [rsp]
	mov	QWORD PTR 16[r12], rax
	movups	XMMWORD PTR [r12], xmm0
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	je	.L61
	call	__stack_chk_fail@PLT
.L57:
	test	rbp, rbp
	je	.L60
	mov	esi, DWORD PTR 8[rbp]
	mov	rdi, rbx
	call	append
	mov	rbp, QWORD PTR 16[rbp]
	jmp	.L57
.L61:
	add	rsp, 40
	.cfi_def_cfa_offset 40
	mov	rax, r12
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	mergeLists, .-mergeLists
	.globl	_mergeSortArr
	.type	_mergeSortArr, @function
_mergeSortArr:
.LFB16:
	.cfi_startproc
	cmp	esi, 1
	je	.L89
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
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	ebx, esi
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	cmp	esi, 2
	jne	.L73
	mov	edx, DWORD PTR 4[rdi]
	mov	eax, DWORD PTR [rdi]
	cmp	edx, eax
	jge	.L71
	mov	DWORD PTR [rdi], edx
	mov	DWORD PTR 4[rdi], eax
	jmp	.L71
.L73:
	mov	eax, esi
	mov	ecx, 2
	cdq
	idiv	ecx
	movsx	r15, eax
	lea	rdx, 0[0+r15*4]
	sub	ebx, r15d
	mov	r13, r15
	mov	rdi, rdx
	mov	QWORD PTR 8[rsp], rdx
	call	malloc@PLT
	movsx	rdi, ebx
	sal	rdi, 2
	mov	r14, rax
	call	malloc@PLT
	mov	rdx, QWORD PTR 8[rsp]
	mov	rdi, r14
	mov	rsi, rbp
	mov	r12, rax
	xor	eax, eax
	test	r15d, r15d
	movsx	rcx, eax
	cmovns	rcx, r15
	sal	rcx, 2
	test	ebx, ebx
	rep movsb
	cmovns	eax, ebx
	lea	rsi, 0[rbp+rdx]
	mov	rdi, r12
	movsx	rcx, eax
	sal	rcx, 2
	rep movsb
	mov	esi, r15d
	mov	rdi, r14
	call	_mergeSortArr
	mov	esi, ebx
	mov	rdi, r12
	call	_mergeSortArr
	xor	edx, edx
	xor	eax, eax
.L74:
	cmp	r13d, eax
	movsx	rsi, edx
	jle	.L81
	cmp	ebx, edx
	jle	.L81
	movsx	rcx, eax
	mov	edi, DWORD PTR [r12+rsi*4]
	mov	esi, DWORD PTR [r14+rcx*4]
	lea	ecx, [rdx+rax]
	movsx	rcx, ecx
	lea	rcx, 0[rbp+rcx*4]
	cmp	edi, esi
	jge	.L75
	mov	DWORD PTR [rcx], edi
	inc	edx
	jmp	.L74
.L75:
	mov	DWORD PTR [rcx], esi
	inc	eax
	jmp	.L74
.L81:
	cmp	r13d, eax
	je	.L79
	movsx	rdi, eax
	mov	ecx, r13d
	add	rsi, rdi
	sub	ecx, eax
	lea	rdx, 0[rbp+rsi*4]
	sal	rcx, 2
	lea	rsi, [r14+rdi*4]
	cmp	r13d, eax
	mov	eax, 0
	mov	rdi, rdx
	cmovl	rcx, rax
	jmp	.L92
.L79:
	mov	ecx, ebx
	add	r15, rsi
	lea	rsi, [r12+rsi*4]
	sub	ecx, edx
	lea	rax, 0[rbp+r15*4]
	sal	rcx, 2
	cmp	ebx, edx
	mov	edx, 0
	mov	rdi, rax
	cmovl	rcx, rdx
.L92:
	rep movsb
	mov	rdi, r14
	call	free@PLT
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	rdi, r12
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L71:
	.cfi_restore_state
	add	rsp, 24
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
.L89:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE16:
	.size	_mergeSortArr, .-_mergeSortArr
	.globl	mergeSort
	.type	mergeSort, @function
mergeSort:
.LFB15:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rdi
	push	rdx
	.cfi_def_cfa_offset 48
	movsx	rdi, DWORD PTR 16[rdi]
	mov	r13, rdi
	sal	rdi, 2
	call	malloc@PLT
	mov	rbp, rax
	mov	rax, QWORD PTR [rbx]
	mov	r12, rbp
	mov	rdx, rbp
.L94:
	test	rax, rax
	je	.L99
	mov	ecx, DWORD PTR 8[rax]
	add	rdx, 4
	mov	rax, QWORD PTR 16[rax]
	mov	DWORD PTR -4[rdx], ecx
	jmp	.L94
.L99:
	mov	esi, r13d
	mov	rdi, rbp
	call	_mergeSortArr
	mov	rax, QWORD PTR [rbx]
.L96:
	test	rax, rax
	je	.L100
	mov	edx, DWORD PTR [r12]
	add	r12, 4
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR 16[rax]
	jmp	.L96
.L100:
	pop	rax
	.cfi_def_cfa_offset 40
	mov	rdi, rbp
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE15:
	.size	mergeSort, .-mergeSort
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
