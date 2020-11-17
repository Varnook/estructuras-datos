; struct list {
;     struct Node* _head;
;     struct Node* _tail;
;     int _length;
; }

; |h|h|h|h|h|h|h|h|      _head: [base]
; |t|t|t|t|t|t|t|t|      _tail: [base + 8]
; |i|i|i|i|?|?|?|?|    _length: [base + 16]

; struct Node {
;     struct Node* prev;
;     int data;
;     struct Node* next;
; }

; |p|p|p|p|p|p|p|p|    prev : [base]
; |d|d|d|d|?|?|?|?|    data : [base + 8]
; |n|n|n|n|n|n|n|n|    next : [base + 16]


; | void deleteList(struct list* list)

deleteList:
	push rbp
	mov rbp, rsp
	push r12
	push r13

	mov r12, [rdi] ; r12 = list->_head

	.loop:
	cmp QWORD r12, 0
	je  .fin
	mov r13, [r12 + 16] ; r13 = list->_head->next
	mov rdi, r13
	call free
	mov r12, r13
	jmp .loop

	.fin:
	pop r13
	pop r12
	pop rbp
ret
