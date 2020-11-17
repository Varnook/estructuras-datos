#include "typeFunctions.h"
#include <stdio.h>

int main() {
	char* a = "hola";
	cpy_g* copiar = getCpy(TipoStr);
	cmp_g* compar = getCmp(TipoStr);
	char* b = copiar(a);
	int x = compar(a, b);
	char c[4] = "hoka";
	char d[4] = "holb";
	int y = compar(a, c);
	int z = compar(a, d);
	printf("%s\n%s\n0?: %d, 1?: %d, -1?: %d\n", a, b, x, y, z);
	del_g* delete = getDel(TipoStr);
	delete(b);
	return 0;
}
