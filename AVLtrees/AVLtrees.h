#include <stdlib.h>
#include <stdio.h>

#define CHECK_INVARIANT 1

#define EVALUATE_INVARIANT(tree)               \
	if (CHECK_INVARIANT && !_invariant(tree))  \
		printf("Function: %s is breaking the invariant\n", __func__);

#define MAX(a, b) ((a) < (b)) ? (b) : (a)
#define IS_BALANCED(x) (abs((x)) <= 1) ? 1 : 0

struct Node {
				struct Node* root;
					int data;
	struct Node* l_ch;		struct Node* r_ch;
};

struct AVLtree {
	struct Node* _head;
	int size;
};


int _nodesAreOrdered(struct Node* node);
int _nodesAreBalanced(struct Node* node);
int _countNodes(struct Node* node);
int _invariant(struct AVLtree* tree);


void _rotL(struct Node* node);

void _rotR(struct Node* node);

int _height(const struct Node* node);


//void printInorder(struct tree* tree);

void _deleteNodes(struct Node* root );
void deleteTree(struct AVLtree* tree);

void insert(struct AVLtree* tree, const int value);
