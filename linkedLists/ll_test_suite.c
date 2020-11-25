#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "test_suite_utils.h"
#ifndef LINKEDLISTS_H
#define LINKEDLISTS_H
#include "linkedLists.h"
#endif

#define TOTAL_TESTS 7

int emptyList_test () {
	FUNC_NAME

	int testFail = 0;

	List l = newList(TipoInt);
	int array[0];

	compareListAndLength(l, array, 0, &testFail);

	deleteList(&l);
	return testFail;
}

int insertOne_test() {
	FUNC_NAME

	int testFail = 0;

	struct list 
		l1 = newList(TipoInt),
		l2 = newList(TipoInt);

	int array[1] = {1};

	int uno = 1;
	append(&l1, &uno);
	prepend(&l2, &uno);

	compareListAndLength(l1, array, 1, &testFail);
	compareListAndLength(l2, array, 1, &testFail);

	deleteList(&l1);
	deleteList(&l2);
	return testFail;
}

int insertMany_test() {
	FUNC_NAME

	int testFail = 0;

	struct list
		l1 = newList(TipoInt),
		l2 = newList(TipoInt),
		l3 = newList(TipoInt);

	int array[5] = {1, 2, 3, 4 ,5};
	
	append(&l1,  &array[2]);
	prepend(&l1, &array[1]);
	append(&l1,  &array[3]);
	prepend(&l1, &array[0]);
	append(&l1,  &array[4]);

	compareListAndLength(l1, array, 5, &testFail);
	
	prepend(&l2, &array[2]);
	prepend(&l2, &array[1]);
	append(&l2,  &array[3]);
	prepend(&l2, &array[0]);
	append(&l2,  &array[4]);

	compareListAndLength(l2, array, 5, &testFail);
	
	l3 = copyList(&l1);

	compareListAndLength(l3, array, 5, &testFail);
	
	List l4 = createFromArray(TipoInt, array, 5);

	compareListAndLength(l4, array, 5, &testFail);

	deleteList(&l1);
	deleteList(&l2);
	deleteList(&l3);
	deleteList(&l4);
	return testFail;
}

int searchNth_test () {
	FUNC_NAME

	int testFail = 0;
	int array[5] = {1, 2, 3, 4 ,5};

	List l = createFromArray(TipoInt, array, 5);

	cmp_g* compValue = getCmp(TipoInt);

	int i = 0;
	int j;
	void* value;

	iterate(iter, l) {
		j = i + 1;
		value = nthValue(&l, i);
		if (compValue(value, &j)) {
			printf("Expected %d in position %d\nGot: %d\n", i + 1, i, *(int*)(iter->data));	
			testFail = 1;
		}
		i++;
		free(value);
	}

	printf("Testing out of range value:\n");

	value = nthValue(&l, 6);
	if (value) {
		printf("Expected NULL\nGot: %d\n", *(int*)value);
		testFail = 1;
	}
	
	printf("\n");

	free(value);
	deleteList(&l);
	return testFail;
}

int findValue_test() {
	FUNC_NAME
	
	int testFail = 0;
	int array[5] = {1, 2, 3, 4, 5};

	List l1 = createFromArray(TipoInt, array, 5);

	int i = 0;
	void* value;
	iterate(iter, l1) {
		value = nthValue(&l1, i);
		if(findValue(&l1, value) != i) {
			printf("Expected %d to be found in position %d\nGot: %d\n", 
					*(int*)(iter->data), i, findValue(&l1, value));
			testFail = 1;
		}
		i++;
		free(value);
	}

	int not_in_list = 10;
	if(findValue(&l1, &not_in_list) != 5) {
		printf("Expected %d to not be found (position should be 5)\nGot: %d\n", 
				not_in_list, findValue(&l1, &not_in_list));
		testFail = 1;
	}

	printf("\n");

	deleteList(&l1);
	return testFail;
}

int joinLists_test() {
	FUNC_NAME
	
	int testFail = 0;
	int arr1[5]  = {1, 2, 3, 4, 5},
		arr2[5]  = {6, 7, 8, 9, 0},
		arr3[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};

	List 
		l1 = createFromArray(TipoInt, arr1, 5),
		l2 = createFromArray(TipoInt, arr2, 5);

	joinLists(&l1, &l2);

	compareListAndLength(l1, arr3, 10, &testFail);

	deleteList(&l1);

	return testFail;
}

int mergeLists_test() {
	FUNC_NAME
	
	int testFail = 0;
	int arr1[5]  = {1, 2, 3, 4, 5},
		arr2[5]  = {6, 7, 8, 9, 0},
		arr3[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};

	List 
		l1 = createFromArray(TipoInt, arr1, 5),
		l2 = createFromArray(TipoInt, arr2, 5);

	mergeLists(&l1, &l2);

	compareListAndLength(l1, arr3, 10, &testFail);

	deleteList(&l1);

	return testFail;
}

int mergeSort_test() {
	FUNC_NAME

	int testFail = 0;
	
	int arr1[10] = {6, 2, 0, 9, 8, 1, 5, 3, 7, 4},
		arr2[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

	List l1 = createFromArray(TipoInt, arr1, 10);

	compareListAndLength(l1, arr2, 10, &testFail);

	deleteList(&l1);

	int unordered_size = 1000000;
	int arr3[unordered_size];
	for (int i = 0; i < unordered_size ; i++) {
		arr3[i] = random();
	}

	List l2 = createFromArray(TipoInt, arr3, unordered_size);

	clock_t t;
	printf("Merge sort started, sorting %d elements\n", unordered_size);

	t = clock();
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
		printArray(arr3, unordered_size, TipoInt);
		printf("\n");
		printList(&l2);
		printf("\n");
	}

	deleteList(&l2);

	return testFail;
}

int main() {

	int tests_failed = 0;

	int (*func[8]) (void) = {emptyList_test, insertOne_test, insertMany_test,
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
