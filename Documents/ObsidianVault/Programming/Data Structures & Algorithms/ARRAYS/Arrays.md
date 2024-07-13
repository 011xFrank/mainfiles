 >**Date Created** : 08-07-2024
--- 
---
- When values are stored in a one-dimensional array (_x[0]_ to _x[n]_), say), they can be thought of as being organized as a _linear list_.
- Consider each item in the list as a _node_
- A linear list means that the nodes are arranged in a linear order such that the following is true : 
	1. `x[0]` is the first node
	2. `x[n]` is the last node
	3. if `0 < k <= n` then `x[k]` is preceded by `x[k - 1]`
	4. if `0 <= k < n` then `x[k]` is followed by `x[k + 1]`
- Thus, given a node, the “next” node is assumed to be in the next location.
- The order of the nodes is the order in which they appear in the list.
- Accessing any given node is easy all we have to do is provide the appropriate index (subscript).
- In many situations, _we use an array for representing a linear list_.
- Array indexing starts from _0_:
> given an array _A_ of _n_ elements, the first element can be accessed by _A[0]_ and the last element is accessed by _A[n-1]_.
## _Limitations of Arrays_

- Consider the problem of inserting and deleting a new node between two existing nodes, x[k] and  x[k + 1] : 
> This can be done only if x[k + 1] and the nodes after it are moved to make room for the new node.
> Similarly, the deletion of x[k] involves the movement of the nodes x[k +1], x[k + 2], and so on

## _Implementing an array in C_
```C
#include <stdio.h>
#include <stdlib.h>


int main(void) {
    int a[10] = {1,2,3,4,5,6,7,8,9,10};
    /* Implementing an integer array */

    a[0] = 3; /* changing the first element of the integer array to 3 */

    printf("%d", a[2]); /* Accessing the third element in the array - Index Subscripting starts from 0 */


    exit(0);
}
```

---
---
## References :
1. see [[Intro to Linked Lists]]