#include "linkedLists.h"

List newList(Tipo t) {
	List result = {NULL, NULL, t, 0};
	return result;
}

void deleteList(List* list) {
	struct Node* temp = list->head;
	del_g* deleteData = getDel(list->tipo);

	while(temp) {
		temp = list->head->next;
		deleteData(list->head->data);
		free(list->head);
		list->head = temp;
	}
}

List copyList(const List* toCopy) {
	List result = newList(toCopy->tipo);

	_PTRiterate(iter, toCopy)
		append(&result, iter->data);

	return result;
}

List createFromArray(Tipo t, void* array, const int arrayLen) {
	List list = newList(t);
	for (int i = 0; i < arrayLen; i++)
		append(&list, array + i);
	return list;
}

void append(List *list, void* value) {
	cpy_g* copiarData = getCpy(list->tipo);

	struct Node* newTail = (struct Node*) malloc(sizeof(struct Node));
	newTail->data = copiarData(value);	
	newTail->next = NULL;

	if (list->head && list->tail) {
		newTail->prev = list->tail;
		list->tail->next = newTail;

	} else {
		newTail->prev = NULL;
		list->head = newTail;
	}
	
	list->tail = newTail;
	
	list->length++;
}

void prepend(List *list, void* value) {
	cpy_g* copiarData = getCpy(list->tipo);

	struct Node* newHead = (struct Node*)  malloc(sizeof(struct Node));
	newHead->data = copiarData(value);	
	newHead->prev = NULL;

	if (list->head && list->tail) {
		newHead->next = list->head;
		list->head->prev = newHead;

	} else {
		newHead->next = NULL;
		list->tail = newHead;
	}
	
	list->head = newHead;
	
	list->length++;
}

void* nthValue(const List* list, const int n) {

	if (n >= 0 && n < list->length) {
		struct Node* iter = 
			(n < list->length / 2) ? 
			list->head : list->tail;

		if (n < (list->length / 2)) {
			for(int i = 0; i < n ; i++)
					   iter = iter->next;

		} else {
			for(int i = list->length - 1; i > n ; i--)
					   iter = iter->prev;
		}
		cpy_g* copiarData = getCpy(list->tipo);
		return copiarData(iter->data);

	} else {
		printf("return Nth value: index not in range of list");
		return NULL;
	}
}

int findValue(const List* list, void* value) {
	int position = 0;
	struct Node* iter = list->head;

	cmp_g* compData = getCmp(list->tipo);

	while(iter && compData(iter->data, value)) {
		position++;
		iter = iter->next;
	}
	return position;
}

void joinLists(List* firstL, List* seconL) {

	firstL->tail->next = seconL->head;
	seconL->head->prev = firstL->tail;

	firstL->tail = seconL->tail;
	firstL->length += seconL->length;
}

void mergeLists(List* firstL, List* seconL) {
	struct Node
		*fstIter = firstL->head,
		*sndIter = seconL->head,
		*iter;

	cmp_g* compData = getCmp(firstL->tipo);
	
	firstL->length += seconL->length;

	if(compData(fstIter->data, sndIter->data) == 1) {
		firstL->head = sndIter;
		iter = sndIter;
	} else {
		iter = fstIter;
	}

	while(fstIter && sndIter) {
		
		if(compData(fstIter->data, sndIter->data) < 1) {
			iter->next = fstIter;
			fstIter->prev = iter;

			iter = fstIter;
			fstIter = fstIter->next;

		} else {
			iter->next = sndIter;
			sndIter->prev = iter;

			iter = sndIter;
			sndIter = sndIter->next;
		}
	}

	if (sndIter) {
		sndIter->prev = iter;
		iter->next = sndIter;
		for( ; sndIter->next; sndIter = sndIter->next);
		firstL->head = sndIter;
	}
}
