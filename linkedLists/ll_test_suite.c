#include "linkedLists.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TOTAL_TESTS 8

#define FUNC_NAME printf("%s\n", __func__);

#define compareListAndLength(list, array, length) \
	if (compareList(&list, array)) {			  \
		printFailedList(&list, array, length);    \
		testFail = 1;}							  \
	if (compareLength(&list, length)) {				  \
		printFailedLength(&list, length);		  \
		testFail = 1;}							  

int compareList(struct list* list, int* array) {
	int res = 0;

	struct Node* listIter = list->_head;
	int arrPos = 0;

	while(!res && listIter) {

		if (array[arrPos] != listIter->data)
			res = 1;

		arrPos++;
		listIter = listIter->next;
	}
	
	return res;
}

int compareLength(struct list* list, const int expectedLength) {
	return !(list->_length == expectedLength);
}

void printArray(const int* array, const int length) {
	
	if (array[0]) {
		printf("[");

		for (int i = 0; i < length; i++)
				printf("%d, ", array[i]);

		printf("\b\b]");

	} else {
		printf("[ ]");
	}
}

void printList(const struct list* list) {
	
	if (list->_head) {
		printf("{");

		_PTRiterate(iterator, list)
			printf("%d, ", iterator->data);

		printf("\b\b}");

	} else {
		printf("{ }");
	}
}

void printFailedList(const struct list* list, const int* array, const int arrayLen) {
	printf("Wrong list;\n\tGot: "); 
	printList(list);
	printf("\n");
	printf("\tExpected: ");
	printArray(array, arrayLen);
	printf("\n");
}

void printFailedLength(const struct list* list, const int expectedLength) {
	printf("Got: %d\n", list->_length);
	printf("Expected: %d\n", expectedLength);
}


int emptyList_test () {
	FUNC_NAME

	int testFail = 0;

	struct list l = NEW_LIST;
	int array[0];

	compareListAndLength(l, array, 0);

	deleteList(&l);
	return testFail;
}

int insertOne_test() {
	FUNC_NAME

	int testFail = 0;

	struct list 
		l1 = NEW_LIST,
		l2 = NEW_LIST;

	int array[1] = {1};

	append(&l1, 1);
	prepend(&l2, 1);

	compareListAndLength(l1, array, 1);
	compareListAndLength(l2, array, 1);

	deleteList(&l1);
	deleteList(&l2);
	return testFail;
}

int insertMany_test() {
	FUNC_NAME

	int testFail = 0;

	struct list
		l1 = NEW_LIST,
		l2 = NEW_LIST,
		l3 = NEW_LIST,
		l4 = NEW_LIST;

	int array[5] = {1, 2, 3, 4 ,5};
	
	append(&l1, 3);
	prepend(&l1, 2);
	append(&l1, 4);
	prepend(&l1, 1);
	append(&l1, 5);

	compareListAndLength(l1, array, 5);
	
	prepend(&l2, 3);
	prepend(&l2, 2);
	append(&l2, 4);
	prepend(&l2, 1);
	append(&l2, 5);

	compareListAndLength(l2, array, 5);
	
	l3 = copyList(&l1);

	compareListAndLength(l3, array, 5);
	
	createFromArray(&l4, array, 5);

	compareListAndLength(l4, array, 5);

	deleteList(&l1);
	deleteList(&l2);
	deleteList(&l3);
	deleteList(&l4);
	return testFail;
}

int searchNth_test () {
	FUNC_NAME

	int testFail = 0;

	struct list
		l1 = NEW_LIST;

	int array[5] = {1, 2, 3, 4 ,5};

	createFromArray(&l1, array, 5);

	int i = 0;
	iterate(iter, l1) {
		if (nthValue(&l1, i) != i + 1) {
			printf("Expected %d in position %d\nGot: %d\n", i + 1, i, iter->data);	
			testFail = 1;
		}
		i++;
	}

	printf("Testing out of range value:\n");

	if (nthValue(&l1, 6) != -1) {
		printf("Expected -1\nGot: %d\n", nthValue(&l1, 6));
		testFail = 1;
	}
	
	printf("\n");

	deleteList(&l1);
	return testFail;
}

int findValue_test() {
	FUNC_NAME
	
	int testFail = 0;

	struct list l1 = NEW_LIST;

	int array[5] = {1, 2, 3, 4, 5};

	createFromArray(&l1, array, 5);

	int i = 0;
	iterate(iter, l1) {

		int value = nthValue(&l1, i);

		if(findValue(&l1, value) != i) {
			printf("Expected %d to be found in position %d\nGot: %d\n", 
					iter->data, i, findValue(&l1, value));
			testFail = 1;
		}
		i++;
	}

	int not_in_list = 10;
	if(findValue(&l1, not_in_list) != 5) {
		printf("Expected %d to not be found (position should be 5)\nGot: %d\n", 
				not_in_list, findValue(&l1, not_in_list));
		testFail = 1;
	}

	printf("\n");

	deleteList(&l1);
	return testFail;
}

int joinLists_test() {
	FUNC_NAME
	
	int testFail = 0;

	struct list
		l1 = NEW_LIST,
		l2 = NEW_LIST;

	int arr1[5]  = {1, 2, 3, 4, 5},
		arr2[5]  = {6, 7, 8, 9, 0},
		arr3[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};

	createFromArray(&l1, arr1, 5);
	createFromArray(&l2, arr2, 5);

	joinLists(&l1, &l2);

	compareListAndLength(l1, arr3, 10);

	deleteList(&l1);

	return testFail;
}

int mergeLists_test() {
	FUNC_NAME
	
	int testFail = 0;

	struct list	l1 = NEW_LIST;
	struct list	l2 = NEW_LIST;

	int arr1[5]  = {0, 2, 4, 6, 8},
		arr2[5]  = {1, 3, 5, 7, 9},
		arr3[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

	createFromArray(&l1, arr1, 5);
	createFromArray(&l2, arr2, 5);

	struct list l3;

	l3 = mergeLists(&l1, &l2);

	compareListAndLength(l3, arr3, 10);

	deleteList(&l1);
	deleteList(&l2);
	deleteList(&l3);

	return testFail;
}

int mergeSort_test() {
	FUNC_NAME

	int testFail = 0;
	
	struct list	l1 = NEW_LIST;

	int arr1[10] = {6, 2, 0, 9, 8, 1, 5, 3, 7, 4},
		arr2[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

	createFromArray(&l1, arr1, 10);

	mergeSort(&l1);

	compareListAndLength(l1, arr2, 10);

	deleteList(&l1);

	struct list l2 = NEW_LIST;

	int unordered_size = 1000000;

	int arr3[unordered_size];
	for (int i = 0; i < unordered_size ; i++) {
		arr3[i] = random();
	}

	createFromArray(&l2, arr3, unordered_size);

	clock_t t;
	printf("Merge sort started, sorting %d elements\n", unordered_size);

	t = clock();
	mergeSort(&l2);
	t = clock() - t;

	double time = ((double)t) / CLOCKS_PER_SEC;

	printf("Merge sort finished after %fs\n", time);
	printf("Checking that the list is sorted, this might take a while\n");

	iterate(iter_l2, l2) {
		if(iter_l2->next && iter_l2->next->data < iter_l2->data) {
			testFail = 0;
			iter_l2 = NULL;
		}
	}

	if (testFail) {
		printArray(arr3, unordered_size);
		printf("\n");
		printList(&l2);
		printf("\n");
	}

	deleteList(&l2);

	return testFail;
}

int main() {

	int tests_failed = 0;

	int (*func[TOTAL_TESTS]) (void) = {emptyList_test, insertOne_test, insertMany_test,
									   searchNth_test, findValue_test, joinLists_test ,
									   mergeLists_test, mergeSort_test};

	for (int i = 0; i < TOTAL_TESTS; i++) {
		printf("Test #%d: ", i);

		if (func[i]())
			tests_failed++;
		else
			printf("Test success!\n\n");
	}

	printf("Tests failed: %d out of %d [%d%%]\n", tests_failed, TOTAL_TESTS, (tests_failed*100 / TOTAL_TESTS));

	return 0;
}
