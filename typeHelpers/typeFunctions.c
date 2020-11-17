#include "typeFunctions.h"

cmp_g* getCmp(tipo t) {
	switch (t) {
		case TipoInt:
			return (cmp_g*)&cmp_int;
			break;
		case TipoFloat:
			return (cmp_g*)&cmp_float;
			break;
		case TipoChar:
			return (cmp_g*)&cmp_char;
			break;
		case TipoStr:
			return (cmp_g*)&cmp_str;
			break;
		default:
			break;
	}
	return 0;
}

cpy_g* getCpy(tipo t) {
	switch (t) {
		case TipoInt:
			return (cpy_g*)&cpy_int;
			break;
		case TipoFloat:
			return (cpy_g*)&cpy_float;
			break;
		case TipoChar:
			return (cpy_g*)&cpy_char;
			break;
		case TipoStr:
			return (cpy_g*)&cpy_str;
			break;
		default:
			break;
	}
	return 0;
}

del_g* getDel(tipo t) {
	switch (t) {
		case TipoInt:
			return (del_g*)&del_int;
			break;
		case TipoFloat:
			return (del_g*)&del_float;
			break;
		case TipoChar:
			return (del_g*)&del_char;
			break;
		case TipoStr:
			return (del_g*)&del_str;
			break;
		default:
			break;
	}
	return 0;
}


//---- Int ----\\

int cmp_int(int* a, int* b) {
	if (*a < *b) return -1;
	if (*a > *b) return  1;
	return 0;
}

int* cpy_int(int* a) {
	int* res = malloc(sizeof(int));
	*res = *a;
	return res;
}

void del_int(int* a) {
	free(a);
}

//--- Float ---\\

int cmp_float(float* a, float* b) {
	if (*a < *b) return -1;
	if (*a > *b) return  1;
	return 0;
}

float* cpy_float(float* a) {
	float* res = malloc(sizeof(float));
	*res = *a;
	return res;
}

void del_float(float* a) {
	free(a);
}

//--- Char ---\\

int cmp_char(char* a, char* b) {
	if (*a < *b) return -1;
	if (*a > *b) return  1;
	return 0;
}

char* cpy_char(char* a) {
	char* res = malloc(sizeof(char));
	*res = *a;
	return res;
}

void del_char(char* a) {
	free(a);
}

//-- String --\\

// devuelve la longitud del string sin el caracter nulo
int stringLen(char* a) {
	int res = 0;
	char it = a[res];

	while (it != '\0') {
		res++;
		it = a[res];
	}

	return res;
}

int cmp_str(char* a, char* b) {
	int aLen = stringLen(a);
	int bLen = stringLen(b);

	int menorLen = aLen < bLen ? aLen : bLen;

	for (int i = 0; i < menorLen; i++) {
		if (a[i] < b[i]) return -1;
		if (a[i] > b[i]) return  1;
	}

	if (aLen < bLen) return -1;
	if (aLen > bLen) return  1;
	return 0;
}

char* cpy_str(char* a) {
	int   len = stringLen(a);
	char* res = malloc(sizeof(char) * ++len);

	for (int i = 0; i < len; i++)
		res[i] = a[i];

	return res;
}

void del_str(char* a) {
	free(a);
}
