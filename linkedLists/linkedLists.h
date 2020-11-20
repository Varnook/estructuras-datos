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

typedef struct list{
	struct Node* head;
	struct Node* tail;
	Tipo tipo;
	int length;
} List;

List newList(Tipo t);

void deleteList(List* list);

List copyList(const List* toCopy);

List createFromArray(Tipo t, void* array, const int arrayLen);

void append(List* list, void* value);

void prepend(List* list, void* value);

void* nthValue(const List* list, const int n);

int findValue(const List* list, void* value);

void joinLists(List* firstL, List* seconL);

void mergeLists(List* firstL, List* seconL);
