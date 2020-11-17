#include "AVLtrees.h"
#include <bits/thread-shared-types.h>


int _nodesAreOrdered(struct Node* node) {
	int thisNode = 1,
		l_tree   = 1,
		r_tree   = 1;
	
	if (node) {

		if (node->root && node->data == node->root->data)
			thisNode = 0;

		if (node->l_ch && node->data < node->l_ch->data )
			thisNode = 0;

		if (node->r_ch && node->data > node->r_ch->data )
			thisNode = 0;
		
		l_tree = _nodesAreOrdered(node->l_ch);
		r_tree = _nodesAreOrdered(node->r_ch);
	}


	return (thisNode && l_tree && r_tree);
}

int _nodesAreBalanced(struct Node* node) {
	int isBalanced = 1,
		l_tree     = 1,
		r_tree     = 1;

	if (node && abs(_height(node->r_ch) - _height(node->l_ch)) > 1)
		isBalanced = 0;

	if (node->l_ch)
		l_tree = _nodesAreBalanced(node->l_ch);

	if (node->r_ch)
		r_tree = _nodesAreBalanced(node->r_ch);
	
	return (isBalanced && l_tree && r_tree);
}

int _countNodes(struct Node* node) {
	return node ? 1 + _countNodes(node->l_ch) + _countNodes(node->r_ch) : 0;
}

int _invariant(struct AVLtree* tree) {

	return (_nodesAreOrdered(tree->_head)  && 
			_nodesAreBalanced(tree->_head) &&
			(tree->size == _countNodes(tree->_head))
			
		   ) ? 1 : 0;
}


void _rotL(struct Node* node) {
	struct Node
		*rightChild = node->r_ch,
		*childs_LCh = node->r_ch->l_ch,
		*parent     = node->root;

	if (parent) {
		if (parent->data < node->data)
			parent->r_ch = rightChild;
		else
			parent->l_ch = rightChild;
	}
	
	if (childs_LCh)
		childs_LCh->root = node;

	rightChild->root = parent;

	node->root = rightChild;
	node->r_ch = childs_LCh;

	rightChild->l_ch = node;
}

void _rotR(struct Node* node) {
	struct Node
		*leftChild = node->l_ch,
		*childs_RC = node->l_ch->r_ch,
		*parent    = node->root;

	if (parent) {
		if (parent->data < node->data)
			parent->r_ch = leftChild;
		else
			parent->l_ch = leftChild;
	}

	if (childs_RC)
		childs_RC->root = node;
	
	leftChild->root = parent;

	node->root = leftChild;
	node->l_ch = childs_RC;

	leftChild->r_ch = node;
}

int _height(const struct Node* node) {
	int result = 0;

	if (node) {

		if (!node->l_ch && !node->r_ch)
			return 1;

		int l_he = _height(node->l_ch);
		int r_he = _height(node->r_ch);

		result = 1 + (MAX(l_he, r_he));
	}

	return result;
}



void _deleteNodes(struct Node* root) {
	if (root) {
		_deleteNodes(root->l_ch);
		_deleteNodes(root->r_ch);
		
		free(root);
	}
}

void deleteTree(struct AVLtree* tree) {
	_deleteNodes(tree->_head);
}

void insert(struct AVLtree* tree, const int value) {

	if (!tree->_head) {
		struct Node *newNode = malloc(sizeof(struct Node));
		newNode->data = value;        newNode->l_ch = NULL;
		newNode->root = NULL;         newNode->r_ch = NULL;

		tree->_head = newNode;
		tree->size  = 1;

		EVALUATE_INVARIANT(tree);
		return;
	}


	struct Node* iterator = tree->_head;

	int foundPosition = 0;
	while (!foundPosition && iterator->data != value) {
		
		if (iterator->data < value) {
			if (iterator->r_ch)
				iterator = iterator->r_ch;
			else 
				foundPosition++;
		
		} else {
			if (iterator->l_ch)
				iterator = iterator->l_ch;
			else
				foundPosition++;
		}
	}

	if (iterator->data != value) {

		struct Node *newNode = malloc(sizeof(struct Node));
		newNode->data = value;        newNode->l_ch = NULL;
		newNode->root = iterator;     newNode->r_ch = NULL;

		if (iterator->data < value)
			iterator->r_ch = newNode;
		else
			iterator->l_ch = newNode;

		iterator = newNode;
	} 

	else {
		EVALUATE_INVARIANT(tree);
		return;
	}


	int parentHeight  = _height(iterator->root),
		
		gndParHeight,
		
		parentBalance = (value < iterator->root->data) ?
			_height(iterator->root->r_ch) - 1          :
			1 - _height(iterator->root->l_ch)          ,
		
		gndParBalance;

	while (iterator->root->root) {

		struct Node
			*parent      = iterator->root,
		    *grandparent = iterator->root->root;

		if (grandparent->l_ch == parent) {
			int rightChildHeight = _height(grandparent->r_ch)  ;

			gndParHeight  = 1 + (MAX(parentHeight, rightChildHeight));
			gndParBalance = rightChildHeight - parentHeight    ;
		
		} else {
			int leftChildHeight = _height(grandparent->l_ch)  ;

			gndParHeight  = 1 + (MAX(parentHeight, leftChildHeight));
			gndParBalance = parentHeight - leftChildHeight    ;
		}

		if (!IS_BALANCED(gndParBalance))
			break;

		parentHeight  = gndParHeight;
		parentBalance = gndParBalance;

		iterator = iterator->root;
	}

	if (iterator->root->root) {

		int factors[2] = {gndParBalance, parentBalance};

		if (factors[0] >  1) {
			if (factors[1] > 0)
				_rotL(iterator->root->root);

			if (factors[1] < 0) {
				_rotR(iterator->root);
				_rotL(iterator->root);
			}
		}

		if (factors[0] < -1) {
			if (factors[1] < 0)
				_rotR(iterator->root->root);

			if (factors[1] > 0) {
				_rotL(iterator->root);
				_rotR(iterator->root);
			}
		}
	}

	while(iterator->root)
		iterator = iterator->root;

	tree->_head = iterator;
	tree->size++;

	EVALUATE_INVARIANT(tree);
}
