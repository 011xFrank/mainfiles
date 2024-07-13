 >**Date Created** : 09-07-2024
--- 
---
- known as _right arrow selection_
- Used for accessing a member of a structure
- The -> operator is a combination of the _*_ and _._ operators
- Given a node of a linked list :
> we can write: 
> ```C
> node -> value = 10;
> ```
> instead of:
> ```C
> (*node).value = 10;
> ```
-   it performs indirection on _node_ to locate the structure that it points to , then selects the member of the structure : _value_
- The -> operator produces an lvalue, so we can use it wherever an ordinary variable would be allowed.
- Values of the operator can also be used in function calls such as scanf() e.g:
>```C
>scanf("%d", &node->value); 
>```
---
---
## References :
1. 