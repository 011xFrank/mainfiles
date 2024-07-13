 >**Date Created** : 08-07-2024
--- 
---
- It is used to free storage acquired by calls to **[[malloc()]]** and **[[calloc()]]**. Its prototype is as follows:
```C
void free(void *ptr);
```
- It releases the storage pointed to by _ptr_.
>[!NOTE]
>It is a fatal error to attempt to :
>1. free storage not obtained by a call to malloc or calloc 
>2. using pointers to memory that has been freed and freeing pointers twice.


---
---
## References :
1. 