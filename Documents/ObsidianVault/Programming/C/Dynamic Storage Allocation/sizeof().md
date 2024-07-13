 >**Date Created** : 08-07-2024
--- 
---
- sizeof is a standard unary operator that returns the number of bytes needed for storing its argument.
- For example, the following returns the number of bytes needed for storing an int variable:
```C
sizeof (int)
```
- The argument to sizeof is either a type or a variable.
>  If it is a type (like int or float or double), it must be enclosed in parentheses.
>  If it is a variable or a type defined using typedef, the parentheses are optional.
- sizeof is used mainly for writing portable code, where the code depends on the number of bytes needed for storing various data types.e.g
> an integer may occupy 2 bytes on one machine but 4 bytes on another.
> Using sizeof (int) (instead of 2 or 4) in your program ensures that the program will work on either machine.
- sizeof is used quite often with the functions **[[malloc()]]** and **[[calloc()]]**.e.g
```C
double *dp = malloc(sizeof (double));
float *fp = calloc(10, sizeof (float));
Node *np = malloc(sizeof (Node));
```
---
---
## References :
1. 