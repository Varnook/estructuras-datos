#include <stdio.h>
#include "../typeHelpers/typeFunctions.h"

#define iterate(iter, list) \
	for (struct Node* iter = list.head; iter; iter = iter->next)

#define _PTRiterate(iter, list) \
	for (struct Node* iter = list->head; iter; iter = iter->next)


struct Node {
	struct Node* prev;
	void* data;
	struct Node* next;
};

struct list{
	struct Node* head;
	struct Node* tail;
	Tipo tipo;
	int length;
};

struct list newList(Tipo t);

void deleteList(struct list* list);

struct list copyList(const struct list* toCopy);

void createFromArray(struct list* list, void* array, const int arrayLen);

void append(struct list* list, void* value);

void prepend(struct list* list, void* value);

int nthValue(const struct list* list, const int n);

int findValue(const struct list* list, void* value);

void joinLists(struct list* firstL, struct list* seconL);

struct list mergeLists(const struct list* firstL, const struct list* seconL);

void mergeSort(struct list* list);

void _mergeSortArr(int* array, int arrLen);
