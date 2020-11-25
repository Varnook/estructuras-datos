#include <stdlib.h>

typedef enum tipo_e {
	TipoInt   = 0,
	TipoFloat = 1,
	TipoChar  = 2,
} Tipo;

typedef int   (cmp_g) (void*, void*);
typedef void* (cpy_g) (void*);
typedef void  (del_g) (void*);

cmp_g* getCmp(Tipo t);
cpy_g* getCpy(Tipo t);
del_g* getDel(Tipo t);

int  cmp_int(int* a, int* b);
int* cpy_int(int* a);
void del_int(int* a);

int    cmp_float(float* a, float* b);
float* cpy_float(float* a);
void   del_float(float* a);

int   cmp_char(char* a, char* b);
char* cpy_char(char* a);
void  del_char(char* a);

void mergeSort(void* array, const int arrayLen, Tipo arrayType);
