 >**Date Created** : 08-07-2024
--- 
---
- Function prototype ->
```C
void *malloc(size_t size);
```
>_size_t_ -> unsigned int/unsigned long.
 _size_ -> a positive integer.
- malloc allocates size bytes of memory and returns a pointer to the first byte.
- The storage is not initialized.
- If malloc is unable to find the requested amount of storage, it returns NULL. see **[[NULL Pointers]]**
>[!NOTE]
>It is important to verify that the requested storage has been successfully allocated when using malloc
- To use the storage allocated, the pointer returned must be assigned to a pointer variable of the appropriate type.

_Usage :_
```C
#include <stdio.h>
#include <stdlib.h>


int main(void) {
    char* i = malloc(20);

    if (i == NULL) {
        printf("[!] : Error During Memory Allocation of pointer <i>\n");
    }

    exit(0);
}
```
>[!NOTE]
>A pointer to one type may not be directly assigned to a pointer of another type
>However, assignment is possible if an explicit cast is used.


---
---
## References :
1. 