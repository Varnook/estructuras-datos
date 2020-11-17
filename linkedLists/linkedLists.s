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
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
.L2:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L3
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	deleteList, .-deleteList
	.globl	copyList
	.type	copyList, @function
copyList:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -32[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	jmp	.L5
.L6:
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR 8[rax]
	lea	rax, -32[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	append
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -40[rbp], rax
.L5:
	cmp	QWORD PTR -40[rbp], 0
	jne	.L6
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	mov	rax, QWORD PTR -56[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	copyList, .-copyList
	.globl	createFromArray
	.type	createFromArray, @function
createFromArray:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L10
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	append
	add	DWORD PTR -4[rbp], 1
.L10:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L11
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	createFromArray, .-createFromArray
	.globl	append
	.type	append, @function
append:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	edi, 24
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR -28[rbp]
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	je	.L13
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L13
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
	jmp	.L14
.L13:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
.L14:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 16[rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 16[rax], edx
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	append, .-append
	.globl	prepend
	.type	prepend, @function
prepend:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	edi, 24
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR -28[rbp]
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	je	.L16
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	je	.L16
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L17
.L16:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
.L17:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 16[rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 16[rax], edx
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	prepend, .-prepend
	.section	.rodata
	.align 8
.LC0:
	.string	"return Nth value: index not in range of list, returning -1"
	.text
	.globl	nthValue
	.type	nthValue, @function
nthValue:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	cmp	DWORD PTR -28[rbp], 0
	js	.L19
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 16[rax]
	cmp	DWORD PTR -28[rbp], eax
	jge	.L19
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cmp	DWORD PTR -28[rbp], eax
	jge	.L20
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	jmp	.L21
.L20:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
.L21:
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cmp	DWORD PTR -28[rbp], eax
	jge	.L22
	mov	DWORD PTR -16[rbp], 0
	jmp	.L23
.L24:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -16[rbp], 1
.L23:
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L24
	jmp	.L25
.L22:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 16[rax]
	sub	eax, 1
	mov	DWORD PTR -12[rbp], eax
	jmp	.L26
.L27:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	sub	DWORD PTR -12[rbp], 1
.L26:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jg	.L27
.L25:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	jmp	.L28
.L19:
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	nthValue, .-nthValue
	.globl	findValue
	.type	findValue, @function
findValue:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -12[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L30
.L32:
	add	DWORD PTR -12[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
.L30:
	cmp	QWORD PTR -8[rbp], 0
	je	.L31
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -28[rbp], eax
	jne	.L32
.L31:
	mov	eax, DWORD PTR -12[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	findValue, .-findValue
	.globl	joinLists
	.type	joinLists, @function
joinLists:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR [rdx]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 8[rdx]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 16[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 16[rax]
	add	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 16[rax], edx
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	joinLists, .-joinLists
	.globl	mergeLists
	.type	mergeLists, @function
mergeLists:
.LFB14:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	mov	QWORD PTR -72[rbp], rdx
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -32[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	jmp	.L36
.L39:
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR 8[rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	edx, eax
	jg	.L37
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR 8[rax]
	lea	rax, -32[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	append
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -48[rbp], rax
	jmp	.L36
.L37:
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR 8[rax]
	lea	rax, -32[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	append
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -40[rbp], rax
.L36:
	cmp	QWORD PTR -48[rbp], 0
	je	.L38
	cmp	QWORD PTR -40[rbp], 0
	jne	.L39
.L38:
	cmp	QWORD PTR -48[rbp], 0
	je	.L44
	jmp	.L41
.L42:
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR 8[rax]
	lea	rax, -32[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	append
	mov	rax, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -48[rbp], rax
.L41:
	cmp	QWORD PTR -48[rbp], 0
	jne	.L42
	jmp	.L43
.L45:
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR 8[rax]
	lea	rax, -32[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	append
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -40[rbp], rax
.L44:
	cmp	QWORD PTR -40[rbp], 0
	jne	.L45
.L43:
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L47
	call	__stack_chk_fail@PLT
.L47:
	mov	rax, QWORD PTR -56[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	mergeLists, .-mergeLists
	.globl	mergeSort
	.type	mergeSort, @function
mergeSort:
.LFB15:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	DWORD PTR -28[rbp], eax
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -32[rbp], 0
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	jmp	.L49
.L50:
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -32[rbp], 1
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -24[rbp], rax
.L49:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L50
	mov	edx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	_mergeSortArr
	mov	DWORD PTR -32[rbp], 0
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L51
.L52:
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 8[rax], edx
	add	DWORD PTR -32[rbp], 1
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -16[rbp], rax
.L51:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L52
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	mergeSort, .-mergeSort
	.globl	_mergeSortArr
	.type	_mergeSortArr, @function
_mergeSortArr:
.LFB16:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	DWORD PTR -60[rbp], esi
	cmp	DWORD PTR -60[rbp], 1
	je	.L72
	cmp	DWORD PTR -60[rbp], 2
	jne	.L56
	mov	rax, QWORD PTR -56[rbp]
	add	rax, 4
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jge	.L73
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -20[rbp], eax
	mov	rax, QWORD PTR -56[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -56[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -56[rbp]
	lea	rdx, 4[rax]
	mov	eax, DWORD PTR -20[rbp]
	mov	DWORD PTR [rdx], eax
	jmp	.L73
.L56:
	mov	eax, DWORD PTR -60[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR -28[rbp], eax
	mov	eax, DWORD PTR -60[rbp]
	sub	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -24[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -44[rbp], 0
	jmp	.L58
.L59:
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -44[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -16[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -44[rbp], 1
.L58:
	mov	eax, DWORD PTR -44[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L59
	mov	DWORD PTR -40[rbp], 0
	jmp	.L60
.L61:
	mov	edx, DWORD PTR -40[rbp]
	mov	eax, DWORD PTR -28[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -40[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -8[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -40[rbp], 1
.L60:
	mov	eax, DWORD PTR -40[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jl	.L61
	mov	edx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	_mergeSortArr
	mov	edx, DWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	_mergeSortArr
	mov	DWORD PTR -36[rbp], 0
	mov	DWORD PTR -32[rbp], 0
	jmp	.L62
.L65:
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jge	.L63
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR -36[rbp]
	mov	edx, DWORD PTR -32[rbp]
	add	edx, ecx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -56[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -32[rbp], 1
	jmp	.L62
.L63:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR -36[rbp]
	mov	edx, DWORD PTR -32[rbp]
	add	edx, ecx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -56[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -36[rbp], 1
.L62:
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jge	.L64
	mov	eax, DWORD PTR -32[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jl	.L65
.L64:
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jne	.L70
	jmp	.L67
.L68:
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR -36[rbp]
	mov	edx, DWORD PTR -32[rbp]
	add	edx, ecx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -56[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -32[rbp], 1
.L67:
	mov	eax, DWORD PTR -32[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jl	.L68
	jmp	.L69
.L71:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR -36[rbp]
	mov	edx, DWORD PTR -32[rbp]
	add	edx, ecx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -56[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -36[rbp], 1
.L70:
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L71
.L69:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L53
.L72:
	nop
	jmp	.L53
.L73:
	nop
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	_mergeSortArr, .-_mergeSortArr
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
