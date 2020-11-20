#include "typeFunctions.h"

cmp_g* getCmp(Tipo t) {
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

cpy_g* getCpy(Tipo t) {
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

del_g* getDel(Tipo t) {
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

// TODO Evitar llamar a malloc y trabajar directo en la lista.
void _mergeSortInt(int* array, int arrLen) {
	
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

	_mergeSortInt(fstArr, fst_mid);
	_mergeSortInt(sndArr, snd_mid);
	
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

// TODO Evitar llamar a malloc y trabajar directo en la lista.
void _mergeSortFloat(float* array, int arrLen) {

	if (arrLen == 1)
		return;

	if (arrLen == 2) {
		if (array[1] < array[0]) {
			float temp = array[0];
			array[0] = array[1];
			array[1] = temp;
		}
		return;
	}

	int fst_mid = arrLen / 2, snd_mid = arrLen - fst_mid;

	float *fstArr = malloc(sizeof(float) * fst_mid);
	float *sndArr = malloc(sizeof(float) * snd_mid);

	for (int i = 0; i < fst_mid; i++)
		fstArr[i] = array[i];

	for (int i = 0; i < snd_mid; i++)
		sndArr[i] = array[i + fst_mid];

	_mergeSortFloat(fstArr, fst_mid);
	_mergeSortFloat(sndArr, snd_mid);
	
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
// TODO Evitar llamar a malloc y trabajar directo en la lista.
void _mergeSortChar(char* array, int arrLen) {
	
	if (arrLen == 1)
		return;

	if (arrLen == 2) {
		if (array[1] < array[0]) {
			char temp = array[0];
			array[0] = array[1];
			array[1] = temp;
		}
		return;
	}

	int fst_mid = arrLen / 2, snd_mid = arrLen - fst_mid;

	char *fstArr = malloc(sizeof(char) * fst_mid);
	char *sndArr = malloc(sizeof(char) * snd_mid);

	for (int i = 0; i < fst_mid; i++)
		fstArr[i] = array[i];

	for (int i = 0; i < snd_mid; i++)
		sndArr[i] = array[i + fst_mid];

	_mergeSortChar(fstArr, fst_mid);
	_mergeSortChar(sndArr, snd_mid);
	
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

// TODO ver que hacer con Str
void mergeSort(void* array, int arrLen, Tipo t) {
	switch (t) {
		case TipoInt:
			_mergeSortInt((int*) array, arrLen);
			break;
		case TipoFloat:
			_mergeSortFloat((float*) array, arrLen);
			break;
		case TipoChar:
			_mergeSortChar((char*) array, arrLen);
			break;
		case TipoStr:
			break;
	}
}
