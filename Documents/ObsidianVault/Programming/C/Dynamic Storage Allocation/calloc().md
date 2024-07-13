 >**Date Created** : 08-07-2024
--- 
---
- Function Prototype ->
```C
void *calloc(size_t num, size_t size);
```
> calloc allocates _num_ * _size_ bytes of memory and returns a pointer to the first byte.
> e.g calloc allocates enough memory for an array of _num_ objects each of size _size_.
- All bytes returned are initialized to 0.
- If calloc is unable to find the requested amount of storage, it returns NULL.
- To use the storage allocated, the pointer returned must be assigned to a pointer variable of the appropriate type.e.g : 
- assuming that cp is a character pointer, the following statement allocates 10 × 20 = 200 bytes of storage and stores the address of the first byte in cp:
```C
char *cp = (char *)calloc(10, 20);
```
- calloc is useful for allocating storage for arrays.
- If we do not know the size of a type, and even if we do, we should use _sizeof()_. see **[[sizeof()]]**
---
---
## References :
1. 