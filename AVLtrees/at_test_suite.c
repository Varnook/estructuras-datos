#include "AVLtrees.h"
#include <stdio.h>


int main() {
	struct AVLtree tree;

	for (int i = 0; i < 20; i++){
		insert(&tree, random());
	}
	printf("%d\n", tree.size);
	deleteTree(&tree);
	return 0;
}
