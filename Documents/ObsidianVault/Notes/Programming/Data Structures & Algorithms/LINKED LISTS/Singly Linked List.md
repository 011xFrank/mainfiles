 >**Date Created** : 08-07-2024
--- 
---
## _1. Singly Linked List_
- In a singly linked list, each node contains a pointer that points to the next node in the list. i.e :
![[Pasted image 20240708171647.png|300]]
- The data can consist of one or more fields.
- next points to the next node in the linked list.
- The last node of the list does not point to anything hence a special value called the _null pointer_ is assigned to the "next" field of the last node.
- We also need a pointer variable that points to the first item in the list. The _head_
- If the list is empty the value of head is null.
![[Pasted image 20240708172851.png]]
- Traversing a linked list is like a treasure hunt:
>You are told where the first item is by the _head pointer_. When you get to the first item, it directs you to where the second item is (_this is the purpose of next_). When you get to the second item, it tells you where the third item is (via next), and so on. _When you get to the last item, its null pointer tells you that you are at the end of the hunt (the end of the list)._
### Implementing a Singly Linked List in C
- we will need to use a Structure to define the format of a node. see [[Structures]]
- The data component may consist of more than one field depending on what needs to be stored.
- The next component : 
> The next field is a pointer to a structure just like the on being defined.
```C
struct Node {
	int value;
	struct Node *next;
};
```
or
```C
typedef struct Node {
	int value;
	struct Node *next;
} Node, *NodePtr;
```
---
---
## References :
1. 