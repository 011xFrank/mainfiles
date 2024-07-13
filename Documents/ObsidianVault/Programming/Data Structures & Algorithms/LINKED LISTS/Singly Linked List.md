 >**Date Created** : 08-07-2024
--- 
---
- In a singly linked list, each node contains a pointer that points to the next node in the list. i.e :
![[singly-LL1.png]]
- _data_ can consist of one or more fields.
- _next_ points to the next node in the linked list.
- The last node of the list does not point to anything hence a special value called the _null pointer_ is assigned to the "next" field of the last node. see **[[NULL Pointers]]**
- We also need a pointer variable that points to the first item in the list. The _head_
- If the list is empty the value of head is null.
- Traversing a linked list is like a treasure hunt:
>You are told where the first item is by the _head pointer_. When you get to the first item, it directs you to where the second item is (_this is the purpose of next_). When you get to the second item, it tells you where the third item is (via next), and so on. When you get to the last item, its null pointer tells you that you are at the end of the hunt (the end of the list).

![[singly-LL2.png]]
### Creating a Node
- We will need to use a Structure to define the format of a node. see **[[Structures]]**
- The data component may consist of more than one field depending on what needs to be stored.
- The next component : 
> The next field is a pointer to a structure just like the on being defined.
```C
struct Node {
	int value;
	struct Node *next;
};
```
![[singly-LL3.png]]
### Building a Linked List
_Steps :_
1. Start with an empty list.
	- Making the head pointer point to NULL.
	```C
	struct Node* head = NULL;
	```
2. Create a new node:
	- Allocate storage for a new node
	- Fill node data.
	- Insert node into the list. 

**_PROGRAM_ **: Creating a Linked List of Integers

_step 1 :_
- create a node structure :
```C
typedef struct Node {
    int value;
    struct Node* next;
} Node, *NodePtr;
```

_step 2 :_
- start with an empty list:
```C
NodePtr head = NULL;
```

_step 3 :_
- In this case we will create a function that creates a node and adds it to the beginning of the list:
- Create a new node to add to the list;
```C
NodePtr createNode(NodePtr list, int val) {
    NodePtr new_node = (NodePtr)malloc(sizeof(Node));

    if (new_node == NULL) {
        printf("[!] : Error allocating memory for new_node\n");
        exit(EXIT_FAILURE);
    }
    
    new_node -> value = val;
    new_node -> next = list;
    list = new_node;

    return list;
}
```
- When we create a node, we’ll need a variable that can point to the node temporarily, until it’s been inserted into the list. in this case `new_node`
- We’ll use malloc to allocate memory for the new node, saving the return value in new_node.
- new_node now points to a block of memory just large enough to hold a node structure:
> ```C
> NodePtr new_node = (NodePtr)malloc(sizeof(Node));
> ```
![[singly-LL4.png]]
- Next we will store `val` data into the `value` member of the node. to access and modify the value member we have used the _right selection operator_. see **[[The -> operator]]**
> ```C
> new_node -> value = val;
> ```
![[singly-LL5.png]]
- We then insert the node to the beginning of the list. Then we will make the head point to the new node :
> ```C
> new_node -> next = list;
> list = new_node;
> ```
![[singly-LL6.png]]

- The function returns a pointer to the head node; Make sure to update the value of the head node after adding a new node to the list:
```C
int main(void) {
    NodePtr head = NULL;
    int val;

    while(1) {
        printf("Enter Value to insert : \n");
        scanf("%d", &val);

        if (!val) break;

        head = createNode(head, val);
    }
```

### Final Program :
```C
#include <stdio.h>
#include <stdlib.h>


typedef struct Node {
    int value;
    struct Node* next;
} Node, *NodePtr;


NodePtr createNode(NodePtr list, int val) {
    NodePtr new_node = (NodePtr)malloc(sizeof(Node));

    if (new_node == NULL) {
        printf("[!] : Error allocating memory for new_node\n");
        exit(EXIT_FAILURE);
    }
    
    new_node -> value = val;
    new_node -> next = list;
    list = new_node;

    return list;
}

void printList(NodePtr list) {
    NodePtr curr = list;

    while (curr != NULL) {
        printf("%d ", curr -> value);
        curr = curr -> next;
    }

    printf("\n");
}


int main(void) {
    NodePtr head = NULL;
    int val;

    while(1) {
        printf("Enter Value to insert : \n");
        scanf("%d", &val);

        if (!val) break;

        head = createNode(head, val);
    }


    printf("List Values : ");
    printList(head);


    exit(EXIT_SUCCESS);
}
```

---
## Singly Linked list Operations
