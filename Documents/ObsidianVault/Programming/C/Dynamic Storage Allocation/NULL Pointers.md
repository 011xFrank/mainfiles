 >**Date Created** : 08-07-2024
--- 
---
- A Null pointer is basically a pointer to nothing.
- When a memory allocation function is called, there’s always a possibility that it won’t be able to locate a block of memory large enough to satisfy our request and if that happens, the function will return a _null pointer_.
- After we’ve stored the function’s return value in a pointer variable, we must test to see if it’s a null pointer.
>[!NOTE]
>It’s the programmer’s responsibility to test the return value of any memory allocation function and take appropriate action if it’s a null pointer. Otherwise the program may crash or behave unpredictably.
- The null pointer is represented by a macro named _NULL_ belonging to the _stdlib.h library_
- Malloc's return value may be tested in the following way:
```C
#include <stdio.h>
#include <stdlib.h>


int main(void) {
    char* i = malloc(20);

    if (i == NULL) {
        printf("[!] : Error Allocating Memory for pointer <i>\n");
    }

    exit(0);
}
```

---
---
## References :
1. 