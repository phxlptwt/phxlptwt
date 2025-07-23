
# Abstract Data Types (ADT) in C: Stack, Queue, Linked List, and Binary Tree

## 1. Stack ADT

A stack follows the Last In, First Out (LIFO) principle. It is a collection of elements where elements are added and removed from the same end, called the "top".

### Definition

```c
typedef struct {
    int *array;
    int top;
    int size;
} Stack;
````

### Operations

```c
// stack.h
#ifndef STACK_H
#define STACK_H

typedef struct Stack Stack;

// Function prototypes
Stack* create_stack(int size);
void push(Stack *s, int value);
int pop(Stack *s);
int peek(Stack *s);
int is_empty(Stack *s);
void destroy_stack(Stack *s);

#endif
```

### Implementation

```c
// stack.c
#include "stack.h"
#include <stdlib.h>
#include <stdio.h>

struct Stack {
    int size;
    int *array;
    int top;
};

Stack* create_stack(int size) {
    Stack *s = malloc(sizeof(Stack));
    s->size = size;
    s->array = malloc(size * sizeof(int));
    s->top = -1;
    return s;
}

void push(Stack *s, int value) {
    if (s->top < s->size - 1) {
        s->array[++s->top] = value;
    } else {
        printf("Stack overflow\n");
    }
}

int pop(Stack *s) {
    if (s->top >= 0) {
        return s->array[s->top--];
    }
    return -1; // Stack underflow
}

int peek(Stack *s) {
    if (s->top >= 0) {
        return s->array[s->top];
    }
    return -1;
}

int is_empty(Stack *s) {
    return s->top == -1;
}

void destroy_stack(Stack *s) {
    free(s->array);
    free(s);
}
```

---

## 2. Queue ADT

A queue follows the First In, First Out (FIFO) principle. Elements are inserted at the rear and removed from the front.

### Definition

```c
typedef struct {
    int *array;
    int front;
    int rear;
    int size;
} Queue;
```

### Operations

```c
// queue.h
#ifndef QUEUE_H
#define QUEUE_H

typedef struct Queue Queue;

// Function prototypes
Queue* create_queue(int size);
void enqueue(Queue *q, int value);
int dequeue(Queue *q);
int front(Queue *q);
int is_empty_queue(Queue *q);
void destroy_queue(Queue *q);

#endif
```

### Implementation

```c
// queue.c
#include "queue.h"
#include <stdlib.h>
#include <stdio.h>

struct Queue {
    int size;
    int *array;
    int front;
    int rear;
};

Queue* create_queue(int size) {
    Queue *q = malloc(sizeof(Queue));
    q->size = size;
    q->array = malloc(size * sizeof(int));
    q->front = 0;
    q->rear = 0;
    return q;
}

void enqueue(Queue *q, int value) {
    if ((q->rear + 1) % q->size != q->front) {
        q->array[q->rear] = value;
        q->rear = (q->rear + 1) % q->size;
    } else {
        printf("Queue overflow\n");
    }
}

int dequeue(Queue *q) {
    if (q->front != q->rear) {
        int value = q->array[q->front];
        q->front = (q->front + 1) % q->size;
        return value;
    }
    return -1; // Queue underflow
}

int front(Queue *q) {
    if (q->front != q->rear) {
        return q->array[q->front];
    }
    return -1;
}

int is_empty_queue(Queue *q) {
    return q->front == q->rear;
}

void destroy_queue(Queue *q) {
    free(q->array);
    free(q);
}
```

---

## 3. Linked List ADT

A linked list is a linear data structure where elements (nodes) are stored in a sequence, and each node points to the next.

### Definition

```c
typedef struct Node {
    int data;
    struct Node* next;
} Node;

typedef struct {
    Node* head;
} LinkedList;
```

### Operations

```c
// linked_list.h
#ifndef LINKED_LIST_H
#define LINKED_LIST_H

typedef struct LinkedList LinkedList;
typedef struct Node Node;

// Function prototypes
LinkedList* create_linked_list();
void insert_front(LinkedList *list, int value);
void insert_end(LinkedList *list, int value);
void delete_node(LinkedList *list, int value);
void display_list(LinkedList *list);
void destroy_list(LinkedList *list);

#endif
```

### Implementation

```c
// linked_list.c
#include "linked_list.h"
#include <stdlib.h>
#include <stdio.h>

struct Node {
    int data;
    struct Node* next;
};

struct LinkedList {
    Node* head;
};

LinkedList* create_linked_list() {
    LinkedList* list = malloc(sizeof(LinkedList));
    list->head = NULL;
    return list;
}

void insert_front(LinkedList *list, int value) {
    Node* new_node = malloc(sizeof(Node));
    new_node->data = value;
    new_node->next = list->head;
    list->head = new_node;
}

void insert_end(LinkedList *list, int value) {
    Node* new_node = malloc(sizeof(Node));
    new_node->data = value;
    new_node->next = NULL;

    if (list->head == NULL) {
        list->head = new_node;
    } else {
        Node* temp = list->head;
        while (temp->next) {
            temp = temp->next;
        }
        temp->next = new_node;
    }
}

void delete_node(LinkedList *list, int value) {
    Node* temp = list->head;
    Node* prev = NULL;

    if (temp != NULL && temp->data == value) {
        list->head = temp->next;
        free(temp);
        return;
    }

    while (temp != NULL && temp->data != value) {
        prev = temp;
        temp = temp->next;
    }

    if (temp == NULL) {
        printf("Node not found\n");
        return;
    }

    prev->next = temp->next;
    free(temp);
}

void display_list(LinkedList *list) {
    Node* temp = list->head;
    while (temp) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

void destroy_list(LinkedList *list) {
    Node* current = list->head;
    Node* next_node;
    while (current) {
        next_node = current->next;
        free(current);
        current = next_node;
    }
    free(list);
}
```

---

## 4. Binary Tree ADT

A binary tree is a tree data structure where each node has at most two children, referred to as the left child and the right child.

### Definition

```c
typedef struct TreeNode {
    int data;
    struct TreeNode* left;
    struct TreeNode* right;
} TreeNode;

typedef struct {
    TreeNode* root;
} BinaryTree;
```

### Operations

```c
// binary_tree.h
#ifndef BINARY_TREE_H
#define BINARY_TREE_H

typedef struct BinaryTree BinaryTree;
typedef struct TreeNode TreeNode;

// Function prototypes
BinaryTree* create_binary_tree();
void insert_binary_tree(BinaryTree *tree, int value);
void inorder_traversal(TreeNode* root);
void preorder_traversal(TreeNode* root);
void postorder_traversal(TreeNode* root);
TreeNode* search_binary_tree(BinaryTree *tree, int value);
void destroy_tree(TreeNode *root);

#endif
```

### Implementation

```c
// binary_tree.c
#include "binary_tree.h"
#include <stdlib.h>
#include <stdio.h>

struct TreeNode {
    int data;
    struct TreeNode* left;
    struct TreeNode* right;
};

struct BinaryTree {
    TreeNode* root;
};

BinaryTree* create_binary_tree() {
    BinaryTree* tree = malloc(sizeof(BinaryTree));
    tree->root = NULL;
    return tree;
}

TreeNode* insert_node(TreeNode* root, int value) {
    if (root == NULL) {
        TreeNode* new_node = malloc(sizeof(TreeNode));
        new_node->data = value;
        new_node->left = new_node->right = NULL;
        return new_node;
    }

    if (value < root->data) {
        root->left = insert_node(root->left, value);
    } else {
        root->right = insert_node(root->right, value);
    }

    return root;
}

void insert_binary_tree(BinaryTree *tree, int value) {
    tree->root = insert_node(tree->root, value);
}

void inorder_traversal(TreeNode* root) {
    if (root == NULL) return;
    inorder_traversal(root->left);
    printf("%d ", root->data);
    inorder_traversal(root->right);
}

void preorder_traversal(TreeNode* root) {
    if (root == NULL) return;
    printf("%d ", root->data);
    preorder_traversal(root->left);
    preorder_traversal(root->right);
}

void postorder_traversal(TreeNode* root) {
    if (root == NULL) return;
    postorder_traversal(root->left);
    postorder_traversal(root->right);
    printf("%d ", root->data);
}

TreeNode* search_binary_tree(BinaryTree *tree, int value) {
    TreeNode* current = tree->root;
    while (current != NULL) {
        if (current->data == value) {
            return current;
        } else if (value < current->data) {
            current = current->left;
        } else {
            current = current->right;
        }
    }
    return NULL;
}

void destroy_tree(TreeNode *root) {
    if (root != NULL) {
        destroy_tree(root->left);
        destroy_tree(root->right);
        free(root);
    }
}
```

Here is a **Hash Table (Hash Map)** ADT implementation in C, written in Markdown format. This includes both the interface and implementation of a hash table, with detailed operations.

---

# Hash Table (Hash Map) ADT in C

A **Hash Table** (also known as a **Hash Map**) is a data structure that maps keys to values using a hash function. The hash function computes an index into an array of buckets or slots, from which the desired value can be found. It is used to implement associative arrays, databases, and caches.

## Structure of a Hash Table

A hash table consists of an array of "buckets" or "slots" where the key-value pairs are stored. Each bucket holds a list of elements (in case of collisions). The hash function takes a key and computes an index, which is used to store and retrieve the value.

### Definition

```c
typedef struct {
    int size;           // Size of the hash table
    int *keys;          // Array to store keys
    int *values;        // Array to store values
    int *is_occupied;   // Flag to indicate whether a slot is occupied
} HashTable;
```

---

## Operations on a Hash Table

### 1. **Hash Function**

A **hash function** takes a key and returns an index in the hash table's array. In this case, a simple modulo function is used for demonstration, but more advanced hash functions can be used for better performance.

```c
int hash_function(int key, int table_size) {
    return key % table_size;
}
```

### 2. **Insert**

The **insert** function computes the hash of the key and places the key-value pair in the corresponding slot. If the slot is already occupied, we use **linear probing** to find the next available slot.

```c
void insert(HashTable *ht, int key, int value) {
    int index = hash_function(key, ht->size);

    // Linear probing for collision resolution
    while (ht->is_occupied[index]) {
        // If the key already exists, update the value
        if (ht->keys[index] == key) {
            ht->values[index] = value;
            return;
        }
        index = (index + 1) % ht->size;
    }

    // Insert the key-value pair
    ht->keys[index] = key;
    ht->values[index] = value;
    ht->is_occupied[index] = 1;
}
```

### 3. **Search**

The **search** function computes the hash of the key and checks the corresponding slot. If the slot is occupied and the key matches, the associated value is returned. If the key does not exist, it returns an indication that the key is not found.

```c
int search(HashTable *ht, int key) {
    int index = hash_function(key, ht->size);

    // Linear probing for collision resolution
    while (ht->is_occupied[index]) {
        if (ht->keys[index] == key) {
            return ht->values[index]; // Key found
        }
        index = (index + 1) % ht->size;
    }

    // Key not found
    return -1; // Assuming -1 indicates not found
}
```

### 4. **Delete**

The **delete** function removes a key-value pair by setting the slot as unoccupied. After deletion, the following slots are checked and appropriately rehashed to preserve the integrity of the table.

```c
void delete(HashTable *ht, int key) {
    int index = hash_function(key, ht->size);

    // Linear probing for collision resolution
    while (ht->is_occupied[index]) {
        if (ht->keys[index] == key) {
            ht->is_occupied[index] = 0; // Mark the slot as empty
            return;
        }
        index = (index + 1) % ht->size;
    }
}
```

### 5. **Resize (Optional)**

If the load factor (the ratio of the number of elements to the size of the hash table) becomes too high, it is common to resize the hash table. This operation increases the table size and rehashes all existing keys to their new positions.

```c
void resize(HashTable *ht) {
    int new_size = ht->size * 2;
    HashTable *new_ht = create_hash_table(new_size);

    for (int i = 0; i < ht->size; i++) {
        if (ht->is_occupied[i]) {
            insert(new_ht, ht->keys[i], ht->values[i]);
        }
    }

    // Free the old table and update the pointer
    free(ht->keys);
    free(ht->values);
    free(ht->is_occupied);

    ht->keys = new_ht->keys;
    ht->values = new_ht->values;
    ht->is_occupied = new_ht->is_occupied;
    ht->size = new_size;
}
```

---

## Example Usage

### Create Hash Table

```c
HashTable* create_hash_table(int size) {
    HashTable *ht = malloc(sizeof(HashTable));
    ht->size = size;
    ht->keys = malloc(size * sizeof(int));
    ht->values = malloc(size * sizeof(int));
    ht->is_occupied = malloc(size * sizeof(int));

    for (int i = 0; i < size; i++) {
        ht->is_occupied[i] = 0; // Initially, all slots are empty
    }

    return ht;
}
```

### Main Function

```c
int main() {
    HashTable *ht = create_hash_table(10);  // Create a hash table with size 10

    insert(ht, 1, 100);
    insert(ht, 2, 200);
    insert(ht, 3, 300);

    printf("Value for key 2: %d\n", search(ht, 2));  // Output: 200

    delete(ht, 2);
    printf("Value for key 2 after deletion: %d\n", search(ht, 2));  // Output: -1 (not found)

    free(ht->keys);
    free(ht->values);
    free(ht->is_occupied);
    free(ht);

    return 0;
}
```

---

