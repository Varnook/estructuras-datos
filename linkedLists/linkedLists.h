#include <stdio.h>
#include <stdlib.h>

#define NEW_LIST {NULL, NULL, 0} 

#define iterate(iter, list) \
	for (struct Node* iter = list._head; iter; iter = iter->next)

#define _PTRiterate(iter, list) \
	for (struct Node* iter = list->_head; iter; iter = iter->next)


struct Node {
	struct Node* prev;
	int data;
	struct Node* next;
};

struct list{
	struct Node* _head;
	struct Node* _tail;
	int _length;
};


void deleteList(struct list* list);

struct list copyList(const struct list* toCopy);

void createFromArray(struct list* list, const int* array, const int arrayLen);

void append(struct list* list, const int value);

void prepend(struct list* list, const int value);

int nthValue(const struct list* list, const int n);

int findValue(const struct list* list, const int value);

void joinLists(struct list* firstL, struct list* seconL);

struct list mergeLists(const struct list* firstL, const struct list* seconL);

void mergeSort(struct list* list);

void _mergeSortArr(int* array, int arrLen);
