#include "linkedLists.h"

struct list newList(Tipo t) {
	struct list result = {NULL, NULL, t, 0};
	return result;
}

void deleteList(struct list* list) {
	struct Node* temp = list->head;
	del_g* deleteData = getDel(list->tipo);

	while(temp) {
		temp = list->head->next;
		deleteData(list->head->data);
		free(list->head);
		list->head = temp;
	}
}

struct list copyList(const struct list* toCopy) {
	struct list result = newList(toCopy->tipo);

	_PTRiterate(iter, toCopy)
		append(&result, iter->data);

	return result;
}

void createFromArray(struct list *list, const int* array, const int arrayLen) {
	for (int i = 0; i < arrayLen; i++)
		append(list, array[i]);
}

void append(struct list *list, void* value) {
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

void prepend(struct list *list, void* value) {
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

int nthValue(const struct list* list, const int n) {

	if (n >= 0 && n < list->length) {
		struct Node* iter = (n < list->length / 2) 
		? list->head : list->tail;

		if (n < (list->length / 2)) {
			for(int i = 0; i < n ; i++)
					   iter = iter->next;

		} else {
			for(int i = list->length - 1; i > n ; i--)
					   iter = iter->prev;
		}
		return iter->data;

	} else {
		printf("return Nth value: index not in range of list, returning -1");
		return -1;
	}
}

int findValue(const struct list* list, const int value) {
	int position = 0;
	struct Node* iter = list->_head;

	while(iter && iter->data != value) {
		position++;
		iter = iter->next;
	}

	return position;
}

void joinLists(struct list* firstL, struct list* seconL) {

	firstL->_tail->next = seconL->_head;
	seconL->_head->prev = firstL->_tail;

	firstL->_tail = seconL->_tail;
	firstL->_length += seconL->_length;
}

struct list mergeLists(const struct list* firstL, const struct list* seconL) {

	struct list result = NEW_LIST;
	
	struct Node
		*fstIter = firstL->_head,
		*sndIter = seconL->_head;
	
	while(fstIter && sndIter) {
		
		if(fstIter->data <= sndIter->data) {
			append(&result, fstIter->data);
			fstIter = fstIter->next;

		} else {
			append(&result, sndIter->data);
			sndIter = sndIter->next;
		}
	}

	if (fstIter) {
		for( ; fstIter; fstIter = fstIter->next)
			append(&result, fstIter->data);

	} else {
		for( ; sndIter; sndIter = sndIter->next)
			append(&result, sndIter->data);
	}

	return result;
}

void mergeSort(struct list* list) {
	
	int arrLen = list->_length;

	int* arrAux = malloc(sizeof(int) * arrLen);
	int arrIter = 0;

	_PTRiterate(lstIter, list) {
		arrAux[arrIter] = lstIter->data;
		arrIter++;
	}

	_mergeSortArr(arrAux, arrLen);

	arrIter = 0;

	_PTRiterate(lstIter, list) {
		lstIter->data = arrAux[arrIter];
		arrIter++;
	}
	free(arrAux);
}

void _mergeSortArr(int* array, int arrLen) {
	
	if (arrLen == 1)
		return;

	if (arrLen == 2) {
		if (array[1] < array[0]) {
			int temp = array[0];
			array[0] = array[1];
			array[1] = temp;
		}
		return;
	}

	int fst_mid = arrLen / 2, snd_mid = arrLen - fst_mid;

	int *fstArr = malloc(sizeof(int) * fst_mid);
	int *sndArr = malloc(sizeof(int) * snd_mid);

	for (int i = 0; i < fst_mid; i++)
		fstArr[i] = array[i];

	for (int i = 0; i < snd_mid; i++)
		sndArr[i] = array[i + fst_mid];

	_mergeSortArr(fstArr, fst_mid);
	_mergeSortArr(sndArr, snd_mid);
	
	// Merge part
	int	fstIt = 0, sndIt = 0;

	while (fstIt < fst_mid && sndIt < snd_mid) {

		if (sndArr[sndIt] < fstArr[fstIt]) {
			array[fstIt + sndIt] = sndArr[sndIt];
			sndIt++;

		} else {
			array[fstIt + sndIt] = fstArr[fstIt];
			fstIt++;
		}
	}

	if (fstIt == fst_mid) {

		while(sndIt < snd_mid) {
			array[fstIt + sndIt] = sndArr[sndIt];
			sndIt++;
		}

	} else {
		while(fstIt < fst_mid) {
			array[fstIt + sndIt] = fstArr[fstIt];
			fstIt++;
		}
	}
	free(fstArr);
	free(sndArr);
}
