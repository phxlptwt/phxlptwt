# VG101 25SU Midterm 2 Code Syntax

## Basics & Values

### Table of Format Specifiers

| Data Type            | Format Specifier        | Example          |
| -------------------- | ----------------------- | ---------------- |
| `int`                | `%d`, `%i`              | `100`            |
| `unsigned int`       | `%u`                    | `42`             |
| `long`               | `%ld`                   | `1234567890`     |
| `unsigned long`      | `%lu`                   | `1234567890`     |
| `long long`          | `%lld`                  | `12345678901234` |
| `unsigned long long` | `%llu`                  | `12345678901234` |
| `float`              | `%f`, `%e`, `%g`        | `3.140000`       |
| `double`             | `%f`, `%e`, `%g`, `%lf` | `3.141593`       |
| `char`               | `%c`                    | `A`              |
| `string`             | `%s`                    | `"Hello"`        |
| `pointer`            | `%p`                    | `0x7fffd6f9b9b0` |
| `boolean` (0 or 1)   | `%d`                    | `0` or `1`       |
| `size_t`             | `%zu`                   | `100`            |

### Operators

#### Arithmetic Operators

Operator | Purpose
:---: | :---:
| + | Addition
| - | Subtraction
| * | Multiplication
| / | Division
| % | Modulo
| == | Equal to
| != | Not equal to
| > | Greater than
| < | Less than
| >= | Greater than or equal to
| <= | Less than or equal to
| ! | NOT
| && | Logical AND
| &#124;&#124; | Logical OR
| += | Addition
| -= | Subtraction
| *= | Multiplication
| /= | Division
| %= | Modulo
| &= | Bitwise AND
| &#124;= | Bitwise Inclusive OR
| ^= | Exclusive OR
| <<= | Shift Left
| >>= | Shift Right
| ++ | Addition
| -- | Subtraction
| *= | Multiplication
| /= | Division
| %= | Modulo
| &= | Bitwise AND
| &#124;= | Bitwise Inclusive OR
| ^= | Exclusive OR
| <<= | Shift Left
| >>= | Shift Right
| & | Bitwise AND
| &#124; | Bitwise Inclusive OR
| ^ | Exclusive OR
| ~ | Unary complement (bit inversion)
| << | Shift Left
| >> | Shift Right
| () | Cast
| ? : | Conditional
| & | Memory Address
| * | Pointer


### C Math `#include math.h`

| **Function**         | **Description**                                                    |
|----------------------|--------------------------------------------------------------------|
| `ceil(x)`            | Returns the smallest integer larger than or equal to x.            |
| `floor(x)`           | Returns the largest integer smaller than or equal to x.            |
| `fabs(x)`            | Returns the absolute value of x.                                   |
| `sqrt(x)`            | Returns the square root of x.                                      |
| `cbrt(x)`            | Returns the cube root of x.                                        |
| `pow(x, y)`          | Returns the value of x raised to the power y.                       |
| `exp(x)`             | Returns the value of e (Euler's Number) raised to the power x.     |
| `fmod(x, y)`         | Returns the remainder of x divided by y.                           |
| `log(x)`             | Returns the natural logarithm of x.                                |
| `log10(x)`           | Returns the common logarithm of x.                                 |
| `cos(x)`             | Returns the cosine of the radian angle x.                          |
| `sin(x)`             | Returns the sine of the radian angle x.                            |
| `tan(x)`             | Returns the tangent of the radian angle x.                         |


### ASCII Code
Refer to attached datasheet from MATLAB documentation.

### `do {...} while ()` vs `while`

| Aspect              | `while` Loop                                                                  | `do-while` Loop                                                             |
| ------------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| **Condition Check** | Checked **before** the loop starts.                                           | Checked **after** the loop body runs.                                       |
| **First Iteration** | Might **not execute** if the condition is false initially.                    | **Executes at least once**, even if the condition is false initially.       |
| **Usage**           | Used when you want to repeat code only if the condition is true at the start. | Used when the loop must execute at least once, regardless of the condition. |
| **Exit Condition**  | Loops only while the condition is true.                                       | Loops while the condition is true, but always runs at least once.           |


### Array vs Pointers

#### **1. Array Definition**

When you define an array, you specify a fixed size for the array and allocate contiguous memory for all the elements. The array itself holds the actual data.

Example:

```c
int arr[5];  // Array of 5 integers
```

* The memory for `arr` is allocated on the stack (in most cases) or in static memory.
* The name `arr` is treated as a pointer to the first element of the array (`arr` is the same as `&arr[0]`).

#### **2. Pointer Definition**

A pointer is a variable that holds the address of a memory location, which can point to any data type. Pointers are flexible, and you can change what they point to during runtime.

Example:

```c
int *ptr;  // Pointer to an integer
```

* The pointer `ptr` holds the address of an integer variable.
* You need to allocate memory explicitly using functions like `malloc()` or `calloc()` if you want dynamic memory allocation.

#### **Key Differences**

1. **Memory Allocation**:

   * **Array**: Memory is automatically allocated for all elements when the array is defined. **The size of the array must be known at compile time**.
   * **Pointer**: A pointer does not allocate memory for data directly. It only holds an address. You must allocate memory using dynamic memory functions like `malloc()` or `calloc()` for the pointer to point to valid memory.

2. **Fixed Size vs. Dynamic**:

   * **Array**: Once defined, the size of the array is fixed.
   * **Pointer**: You can allocate memory dynamically, so the size of the memory block a pointer points to can change at runtime.

3. **Array Name as Pointer**:

   * The name of the array (`arr`) is treated as a pointer to the first element (`&arr[0]`).

#### **Example: Array vs Pointer**

```c
#include <stdio.h>

int main() {
    // Array definition
    int arr[5] = {1, 2, 3, 4, 5};

    // Pointer definition
    int *ptr;
    ptr = arr;  // Pointer points to the first element of arr

    // Accessing array elements using both array and pointer
    printf("Array[0]: %d\n", arr[0]);  // Access array using array syntax
    printf("Pointer[0]: %d\n", ptr[0]);  // Access array using pointer syntax

    // Incrementing the pointer
    ptr++;  // Move the pointer to the next element in the array
    printf("Pointer[1]: %d\n", ptr[0]);  // Access the next element using pointer

    return 0;
}
```

#### **Key Observations in the Example:**

* **Array and Pointer Behavior**: In the example above, the array `arr` and the pointer `ptr` behave similarly when accessing the first element. However, when we increment the pointer (`ptr++`), it advances to the next memory location, while the array remains fixed in size.
* **Pointer Arithmetic**: The pointer can be incremented (`ptr++`), and it will automatically move to the next element in the array. This is similar to how arrays are indexed (e.g., `arr[1]`).

#### **When to Use Arrays vs Pointers**

* **Use Arrays**: When the size of the data structure is known ahead of time and is fixed, arrays are a convenient choice.
* **Use Pointers**: When you need more flexibility, such as dynamically allocated memory or passing large data structures to functions without copying them, pointers are preferred.

### Pass by Value vs by Reference

When passing into a function with an argument of simple data types such as `int`, `char` or `float`, the function creates a copy of the value of the variable (refer to `int size` argument), as such is known as **Pass by Value**.

``` c
void printArray(int data[], int size) 
{
    printf("Array contents: [ ");

    for (int i = 0; i < size; i++)
        printf("%d ", data[i]);
    
    printf("]\n");
}
```
However, as `int data[]` is an integer pointer to the location of some array `data[0]`, it passes the address to the function, therefore, **Pass by Reference** (changing the global value of the array). Similar things occur when a pointer to a variable is passed: `int *ptr`


## Commmand Line Arguments

To do this, we use a special version of the main function: `int main(int argc, char *argv[])`.

### `argc` (Argument Count): 
An `int` that stores the number of command-line arguments. This number includes the name of the program itself, so `argc` is always at least 1.

### `argv` (Argument Vector):
An array of char arrays. Each string in the array is one of the arguments.
- `argv[0]` is always the name of your program.
- `argv[1]` is the first argument you type after the program name.
- `argv[2]` is the second argument, and so on.

Since `argv` always passes as a `char` array, if you want to get the `int` or other types, you may use `atoi()` or other type-casting functions.

Example:

```c
#include <stdio.h>

int main(int argc, char *argv[]) {
    // First, print the number of arguments found.
    printf("Argument Count (argc): %d\n", argc);
    printf("------------------------------\n");

    // Now, loop through the array of strings and print each one.
    printf("Argument Vector (argv):\n");
    for (int i = 0; i < argc; i++) {
        printf("argv[%d] ---> %s\n", i, argv[i]);
    }
    
    return 0;
}
```

## Pointers

In C, **pointers** are powerful tools that allow direct access to memory, enabling more flexible and efficient handling of data. Understanding pointers is crucial for tasks such as dynamic memory allocation, working with arrays, passing large data structures to functions, and managing memory manually.

### **1. Basic Pointer Concepts**

1. **Pointer Declaration and Initialization**:
   A pointer holds the memory address of a variable. The declaration of a pointer uses the `*` symbol.

   ```c
   int *ptr;  // Declares a pointer to an int
   ```

2. **Dereferencing**:
   Dereferencing a pointer (`*ptr`) allows access to the value stored at the address the pointer is pointing to.

   ```c
   int x = 5;
   int *ptr = &x;  // ptr stores the address of x
   printf("%d", *ptr);  // Dereferencing ptr to get the value of x (output: 5)
   ```

3. **Address-of Operator (`&`)**:
   The `&` operator is used to get the address of a variable.

   ```c
   int x = 5;
   int *ptr = &x;  // ptr holds the address of x
   ```

4. **Pointer Initialization with `NULL`**:
   It's a good practice to initialize pointers to `NULL` when they are declared to avoid accessing undefined memory.

   ```c
   int *ptr = NULL;
   ```

---

### **2. Pointer Arithmetic**

Pointers can be incremented or decremented to navigate through memory. When you add or subtract from a pointer, the operation is done in terms of the size of the data type the pointer is pointing to.

1. **Pointer Increment**:
   When you increment a pointer, it moves to the next element of the type it is pointing to.

   ```c
   int arr[] = {1, 2, 3};
   int *ptr = arr;
   printf("%d\n", *(ptr + 1));  // Dereferencing ptr + 1 gives arr[1] = 2
   ```

2. **Pointer Difference**:
   The difference between two pointers points to the number of elements of the data type between them.

   ```c
   int *ptr1 = &arr[0];
   int *ptr2 = &arr[2];
   printf("%ld\n", ptr2 - ptr1);  // Outputs: 2 (because there are 2 elements between ptr1 and ptr2)
   ```

3. **Pointer to Pointer**:
   A pointer can point to another pointer. This is known as a "pointer to pointer" (double pointer).

   ```c
   int x = 5;
   int *ptr = &x;
   int **ptr2 = &ptr;  // ptr2 is a pointer to ptr
   printf("%d\n", **ptr2);  // Dereferencing twice gives the value of x: 5
   ```
4. **Generic Pointer**

    In C, a "generic pointer" is a `void*` (void pointer), which is a pointer that can point to any data type. Since it lacks type information, it must be cast to a specific type before dereferencing.

    ```c
    void *pv = &d;  // Generic pointer
    double *pdbl = pv;  // Cast to correct pointer type
    printf("d via pdbl = %f\n", *pdbl);
    ```
---

### **3. Pointers and Arrays**

In C, the name of an array is a pointer to the first element of the array. This means that you can use pointers to manipulate arrays directly.

1. **Array and Pointer Equivalence**:
   Array names in C decay to pointers to their first elements when used in expressions.

   ```c
   int arr[] = {1, 2, 3};
   int *ptr = arr;  // Equivalent to int *ptr = &arr[0];
   printf("%d\n", *(ptr + 1));  // Outputs: 2 (the second element in the array)
   ```

2. **Pointer Arithmetic with Arrays**:
   You can use pointer arithmetic to access array elements.

   ```c
   int *ptr = arr;
   for (int i = 0; i < 3; i++) {
       printf("%d ", *(ptr + i));  // Outputs the elements of the array
   }
   ```

---

### **4. Dynamic Memory Allocation**

Pointers are essential for dynamic memory allocation, which allows you to allocate memory at runtime.

1. **`malloc()`**: Allocates memory for a specific number of bytes and returns a pointer to the allocated memory. If allocation fails, it returns `NULL`.

   ```c
   int *ptr = malloc(sizeof(int) * 5);  // Allocates memory for 5 integers
   if (ptr == NULL) {
       printf("Memory allocation failed.\n");
   }
   ```

2. **`calloc()`**: Allocates memory for an array of elements and initializes them to zero.

   ```c
   int *ptr = calloc(5, sizeof(int));  // Allocates and zeros memory for 5 integers
   ```

3. **`realloc()`**: Resizes previously allocated memory (by `malloc()` or `calloc()`) to a new size.

   ```c
   ptr = realloc(ptr, sizeof(int) * 10);  // Resizes the memory block to hold 10 integers
   ```

4. **`free()`**: Deallocates previously allocated memory. This is important to prevent memory leaks.

   ```c
   free(ptr);  // Frees the memory allocated to ptr
   ```

---

### **5. Functions and Pointers**

Pointers are often used when passing large data structures to functions. By passing a pointer, you avoid copying the data, making the program more efficient.

1. **Passing Arrays to Functions**:
   Arrays are always passed as pointers to functions, meaning any changes made to the array in the function will affect the original array.

   ```c
   void increment(int *arr, int size) {
       for (int i = 0; i < size; i++) {
           arr[i] += 1;  // Modifies the original array
       }
   }

   int main() {
       int arr[] = {1, 2, 3};
       increment(arr, 3);  // Passes the array to the function
       printf("%d\n", arr[0]);  // Outputs: 2
   }
   ```

2. **Function Returning a Pointer**:
   A function can return a pointer, but it’s important to ensure that the memory is valid (i.e., it’s not pointing to local variables).

   ```c
   int* createArray(int size) {
       int *arr = malloc(sizeof(int) * size);
       if (arr == NULL) {
           return NULL;
       }
       return arr;
   }

   int main() {
       int *arr = createArray(5);
       if (arr != NULL) {
           // Use arr
           free(arr);
       }
   }
   ```

---

### **6. Example: Using Pointers Effectively in `ex1.c` (from previous files)**

In `ex1.c`, where dynamic memory and pointer manipulation were used for creating a `Student` structure:

```c
typedef struct {
    char *name;
    int id;
    float gpa;
} Student;

Student* createStudent(const char *name, int id, float gpa) {
    Student *student = malloc(sizeof(Student));
    student->name = malloc(strlen(name) + 1);  // Allocate memory for the name
    strcpy(student->name, name);  // Copy the name into the allocated memory
    student->id = id;
    student->gpa = gpa;
    return student;
}
```

In this example:

* **Memory Allocation**: Pointers are used to dynamically allocate memory for the `Student` structure and the student's name.
* **Memory Deallocation**: The program ensures that memory is properly freed after use using `free()`.

---

### **7. Advanced Pointer Concepts**

1. **Pointer to Pointer**:
   A pointer can point to another pointer. This is useful for managing dynamic arrays or modifying pointers in functions.

   ```c
   int x = 5;
   int *ptr = &x;
   int **ptr2 = &ptr;  // Pointer to ptr
   printf("%d\n", **ptr2);  // Dereferencing twice to get x (output: 5)
   ```

2. **Function Pointers**:
   A pointer can also point to functions, allowing for dynamic function calls. This is useful for implementing callback functions.

   ```c
   void printMessage() {
       printf("Hello, world!\n");
   }

   int main() {
       void (*funcPtr)() = printMessage;  // Pointer to function
       funcPtr();  // Call the function via the pointer
   }
   ```

---

### **Conclusion**

* **Pointers** are essential for dynamic memory management, passing data efficiently, and working with arrays or large structures.
* Understanding **pointer arithmetic**, **dynamic memory functions** (`malloc()`, `free()`), and **pointer-to-pointer** concepts will allow you to handle complex data structures and improve the performance of your C programs.

## Struct

When you need to represent complex data that involves multiple basic data types, you can use `struct` to group them together. This allows you to treat multiple related data items as a single unit.

### **Defining a `struct`**

```c
typedef struct {
    char name[32];
    int age;
} Person;
```

You can also use the `typedef` to make using `struct` more convenient.

### **Creating Struct Instances**

#### **Stack-Allocated Struct**

```c
Person p = {"Alice", 30};
Person *pp = &p;

printf("Stack: %s is %d years old\n", pp->name, pp->age);
```

#### **Heap-Allocated Struct**

```c
Person *hp = malloc(sizeof *hp);
strcpy(hp->name, "Bob");
hp->age = 25;
printf("Heap: %s is %d years old\n", hp->name, hp->age);
free(hp);
```

#### **Heap-Allocated Array of Structs**

```c
size_t n = 3;
Person *arr = malloc(n * sizeof *arr);

for (size_t i = 0; i < n; i++) {
    snprintf(arr[i].name, sizeof arr[i].name, "Person%zu", i + 1);
    arr[i].age = 20 + i;
}

for (size_t i = 0; i < n; i++) {
    printf("Array[%zu]: %s, age %d\n", i, arr[i].name, arr[i].age);
}

free(arr);
```

#### **Pointer Arithmetic with Struct Pointers**

```c
Person people[2] = {{"Carol", 22}, {"Dave", 23}};
Person *ptr = people;

printf("people[0]: %s\n", ptr->name);  // Access first element
ptr++;
printf("people[1]: %s\n", ptr->name);  // Access second element
```

### **Using Structs to Group Variables and Functions**

You can group functions related to a `struct` by passing a pointer to the `struct` as the first parameter of each function.

```c
typedef struct {
    char name[32];
    int score;
} Student;

Student* StudentNew(const char *name, int score) {
    Student *student = malloc(sizeof *student);
    strncpy(student->name, name, sizeof student->name - 1);
    student->score = score;
    return student;
}

void StudentPrint(const Student *student) {
    printf("Student: %s, Score: %d\n", student->name, student->score);
}

void StudentDelete(Student *student) {
    free(student);
}

int main(void) {
    Student *alice = StudentNew("Alice", 85);
    StudentPrint(alice);
    StudentDelete(alice);
    return 0;
}
```

---

## Header Differences

#### **`stdlib.h`**: Standard Library for General Utilities

The `stdlib.h` header in C provides functions for memory allocation, process control, conversions, and other general utilities. It is a core header used for various tasks beyond just input/output. **Functions under this section are used in OOP. Refer to OOP code for application.**

##### **Functions in `stdlib.h`**

1. **Memory Allocation and Deallocation**:

   * **`malloc(size_t size)`**: Allocates a block of memory of size `size` bytes and returns a pointer to it. If memory allocation fails, it returns `NULL`.

     ```c
     int *arr = malloc(5 * sizeof(int));  // Allocates memory for 5 integers
     ```

   * **`calloc(size_t num, size_t size)`**: Allocates memory for an array of `num` elements, each of size `size` bytes, and initializes all bits to zero. If memory allocation fails, it returns `NULL`.

     ```c
     int *arr = calloc(5, sizeof(int));  // Allocates memory for 5 integers, initializes to 0
     ```

   * **`realloc(void *ptr, size_t size)`**: Changes the size of the memory block pointed to by `ptr` to `size` bytes. It can increase or decrease the size of a previously allocated block.

     ```c
     arr = realloc(arr, 10 * sizeof(int));  // Resizes the allocated memory block
     ```

   * **`free(void *ptr)`**: Frees the memory previously allocated by `malloc()`, `calloc()`, or `realloc()`.

     ```c
     free(arr);  // Frees the allocated memory
     ```

2. **Process Control**:

   * **`exit(int status)`**: Terminates the program and returns the given `status` code to the operating system. By convention, a status of `0` usually means success.

     ```c
     exit(0);  // Exit the program with success status
     ```

   * **`abort()`**: Causes abnormal program termination. This function does not return and causes the program to terminate immediately.

     ```c
     abort();  // Abort program execution
     ```

3. **Conversion Functions**:

   * **`atoi(const char *str)`**: Converts a string to an integer (`int`). If the string cannot be converted, it returns 0.

     ```c
     int num = atoi("123");  // Converts string "123" to integer 123
     ```

   * **`atof(const char *str)`**: Converts a string to a floating-point number (`double`).

     ```c
     double num = atof("3.14");  // Converts string "3.14" to double 3.14
     ```

   * **`strtol(const char *str, char **endptr, int base)`**: Converts a string to a long integer (`long`). It allows for better error handling with `endptr` and supports different number bases (e.g., decimal, hexadecimal).

     ```c
     long num = strtol("123", NULL, 10);  // Converts string "123" to long 123 in decimal
     ```

   * **`strtod(const char *str, char **endptr)`**: Converts a string to a double.

     ```c
     double num = strtod("3.14", NULL);  // Converts string "3.14" to double 3.14
     ```

4. **Searching and Sorting**:

   * **`qsort(void *base, size_t num, size_t size, int (*compar)(const void *, const void *))`**: Sorts an array using a comparison function.

     ```c
     qsort(arr, 5, sizeof(int), compareFunction);  // Sorts an integer array
     ```

   * **`bsearch(const void *key, const void *base, size_t num, size_t size, int (*compar)(const void *, const void *))`**: Performs binary search on a sorted array.

     ```c
     int *result = bsearch(&key, arr, 5, sizeof(int), compareFunction);
     ```

5. **Random Number Generation**:

   * **`rand()`**: Generates a random number.

     ```c
     int random_value = rand();  // Generates a random integer
     ```

   * **`srand(unsigned int seed)`**: Seeds the random number generator, so that `rand()` produces different sequences each time.

     ```c
     srand(time(NULL));  // Seed random number generator with current time
     ```

6. **Other Utility Functions**:

   * **`system(const char *command)`**: Executes a system command (typically a shell command).

     ```c
     system("ls -l");  // List files in the current directory
     ```

---

#### **`string.h`**: String Manipulation Functions

The `string.h` header provides functions for manipulating C-style strings (arrays of characters) and performing memory operations.

##### **Functions in `string.h`**

1. **String Copying**:

   * **`strcpy(char *dest, const char *src)`**: Copies the string `src` to `dest`. The `dest` string must have enough space to hold the copied string, including the null terminator.

     ```c
     strcpy(dest, "Hello, world!");  // Copies the string to dest
     ```

   * **`strncpy(char *dest, const char *src, size_t n)`**: Copies up to `n` characters from `src` to `dest`. If `src` is shorter than `n`, it pads `dest` with null characters.

     ```c
     strncpy(dest, "Hello", 5);  // Copies up to 5 characters from "Hello"
     ```

2. **String Concatenation**:

   * **`strcat(char *dest, const char *src)`**: Appends the string `src` to the end of `dest`.

     ```c
     strcat(dest, " World!");  // Appends " World!" to dest
     ```

   * **`strncat(char *dest, const char *src, size_t n)`**: Appends up to `n` characters from `src` to `dest`.

     ```c
     strncat(dest, "!", 1);  // Appends one character from "!" to dest
     ```

3. **String Comparison**:

   * **`strcmp(const char *str1, const char *str2)`**: Compares two strings lexicographically. Returns 0 if equal, a negative value if `str1` is less, or a positive value if `str1` is greater.

     ```c
     int result = strcmp("apple", "banana");  // Compares the strings
     ```

   * **`strncmp(const char *str1, const char *str2, size_t n)`**: Compares up to `n` characters of two strings.

     ```c
     int result = strncmp("apple", "applepie", 5);  // Compares first 5 characters
     ```

4. **String Length**:

   * **`strlen(const char *str)`**: Returns the length of the string (not including the null terminator).

     ```c
     size_t len = strlen("Hello, World!");  // Returns 13
     ```

5. **String Searching**:

   * **`strchr(const char *str, int c)`**: Finds the first occurrence of character `c` in the string `str`.

     ```c
     char *result = strchr("Hello", 'e');  // Finds the first 'e'
     ```

   * **`strstr(const char *haystack, const char *needle)`**: Finds the first occurrence of the substring `needle` in the string `haystack`.

     ```c
     char *result = strstr("Hello, world!", "world");  // Finds "world"
     ```

6. **String Tokenization**:

   * **`strtok(char *str, const char *delim)`**: Splits `str` into tokens, using delimiters defined in `delim`. Each call to `strtok()` returns the next token.

     ```c
     char *token = strtok(str, ",");  // Splits str by commas
     ```

7. **Memory Functions**:

   * **`memcpy(void *dest, const void *src, size_t n)`**: Copies `n` bytes from `src` to `dest`.

     ```c
     memcpy(dest, src, 5);  // Copies first 5 bytes from src to dest
     ```

   * **`memmove(void *dest, const void *src, size_t n)`**: Similar to `memcpy()`, but safe for overlapping memory regions.

     ```c
     memmove(dest, src, 5);  // Moves 5 bytes from src to dest
     ```

   * **`memset(void *str, int c, size_t n)`**: Sets the first `n` bytes of `str` to the value `c`.

     ```c
     memset(str, 'A', 5);  // Sets first 5 bytes of str to 'A'
     ```

---

#### **Conclusion**

* **`stdlib.h`**: Provides a wide range of functions for memory management, process control, conversion, and utilities like random number generation and sorting.
* **`string.h`**: Focuses on string manipulation functions such as copying, concatenating, comparing, and tokenizing strings. It also includes memory manipulation functions that work with byte arrays.

## File Handling
File handling in C is performed using functions defined in the standard library `<stdio.h>`. Below are the key concepts, functions, and logic required for file handling in C, as well as their relevance to the files you've shared before.

### **Key Concepts in File Handling**

1. **Opening and Closing Files**:

   * A file must be opened before it can be read from or written to. After finishing operations on the file, it should be closed to free up resources.

2. **Reading and Writing Data**:

   * Functions exist to read from and write to files, whether as raw data (binary), formatted text, or strings.

3. **File Pointers**:

   * Files are accessed via **file pointers** (e.g., `FILE *fp`). These pointers represent the position within the file for read or write operations.

4. **File Modes**:

   * Files can be opened in different modes, such as:

     * **"r"**: Read-only (file must exist).
     * **"w"**: Write (creates or truncates the file).
     * **"a"**: Append (adds data to the end).
     * **"rb", "wb", "ab"**: Binary read, write, append modes.
     * **"r+", "w+", "a+"**: Read/write modes for both reading and writing.

5. **Error Handling**:

   * It's important to check whether the file was successfully opened and handle any errors appropriately.

### **Functions for File Handling in C**

1. **Opening a File**:

   ```c
   FILE *fopen(const char *filename, const char *mode);
   ```

   * `fopen()` opens a file in the specified mode and returns a file pointer (`FILE *`). If the file cannot be opened, it returns `NULL`.

   **Example**:

   ```c
   FILE *file = fopen("example.txt", "r");
   if (file == NULL) {
       printf("Error opening file!\n");
       return 1;
   }
   ```

2. **Closing a File**:

   ```c
   int fclose(FILE *fp);
   ```

   * `fclose()` closes an opened file. Always close a file after you're done with it to free resources.

   **Example**:

   ```c
   fclose(file);
   ```

3. **Reading from a File**:

   * **Reading a Single Character**:

     ```c
     int fgetc(FILE *fp);
     ```

     * `fgetc()` reads a single character from a file.

     **Example**:

     ```c
     char c = fgetc(file);
     while (c != EOF) {
         putchar(c);
         c = fgetc(file);
     }
     ```

   * **Reading a String**:

     ```c
     char *fgets(char *str, int n, FILE *fp);
     ```

     * `fgets()` reads a line of text (up to `n` characters or a newline) from the file.

     **Example**:

     ```c
     char line[256];
     while (fgets(line, sizeof(line), file)) {
         printf("%s", line);
     }
     ```

   * **Reading Formatted Data**:

     ```c
     int fscanf(FILE *fp, const char *format, ...);
     ```

     * `fscanf()` is used to read formatted input (similar to `scanf()` but from a file).

     **Example**:

     ```c
     int id;
     float gpa;
     fscanf(file, "%d %f", &id, &gpa);
     ```

4. **Writing to a File**:

   * **Writing Formatted Data**:

     ```c
     int fprintf(FILE *fp, const char *format, ...);
     ```

     * `fprintf()` writes formatted output to the file (similar to `printf()` but to a file).

     **Example**:

     ```c
     fprintf(file, "ID: %d, GPA: %.2f\n", id, gpa);
     ```

5. **Checking End of File**:

   * **`EOF`**: The `EOF` constant is used to check for the end of the file.
   * Functions like `fgetc()`, `fgets()`, and `fscanf()` return `EOF` when they reach the end of the file.

6. **File Positioning**:

   * **`ftell()`**: Returns the current file pointer position.
   * **`fseek()`**: Moves the file pointer to a specific position.

   **Example**:

   ```c
   long pos = ftell(file);
   fseek(file, 0, SEEK_SET);  // Move the file pointer back to the beginning.
   ```

### **Error Handling**

* **`ferror()`**: Checks if an error occurred during the last file operation.

  ```c
  int ferror(FILE *fp);
  ```

  **Example**:

  ```c
  if (ferror(file)) {
      printf("Error reading file\n");
  }
  ```

* **`feof()`**: Checks if the end of the file is reached.

  ```c
  int feof(FILE *fp);
  ```

  **Example**:

  ```c
  if (feof(file)) {
      printf("End of file reached\n");
  }
  ```

### **Memory Allocation for File Handling**

In the files you've uploaded before, dynamic memory allocation was used in conjunction with file handling. Here's how memory is often used for file operations:

* **Dynamically allocating memory for an array** or struct that will hold data read from a file.
* After reading the data, memory is freed to prevent memory leaks.

For example, in **ex1.c**, dynamic memory is used for creating a `Student` structure, and in **ex2.c**, dynamic memory is used for storing strings.

### **File Handling Example with Logic**

Here is an example of how you might implement a file-reading and writing program to store student data in a file and retrieve it based on a search.

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char name[256];
    int id;
    float gpa;
} Student;

void writeStudentsToFile(const char *filename, Student *students, int num_students) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing\n");
        return;
    }

    for (int i = 0; i < num_students; i++) {
        fprintf(file, "%s %d %.2f\n", students[i].name, students[i].id, students[i].gpa);
    }

    fclose(file);
}

void readStudentsFromFile(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file for reading\n");
        return;
    }

    Student student;
    while (fscanf(file, "%s %d %f", student.name, &student.id, &student.gpa) == 3) {
        printf("Name: %s, ID: %d, GPA: %.2f\n", student.name, student.id, student.gpa);
    }

    fclose(file);
}

int main() {
    Student students[] = {
        {"Alice", 1, 3.5},
        {"Bob", 2, 3.8},
        {"Charlie", 3, 3.2}
    };

    const int num_students = 3;
    const char *filename = "students.txt";

    writeStudentsToFile(filename, students, num_students);
    readStudentsFromFile(filename);

    return 0;
}
```

### **Key Takeaways**

* **File operations**: Involves opening files, reading or writing data, and closing the files properly.
* **Memory management**: It's important to free memory allocated for dynamic data (e.g., arrays, strings) after use.
* **Error handling**: Always check if file operations succeed and handle errors accordingly.

### Example of Reading Lines from a File and Storing in an Array

This code snippet appears to be reading multiple strings from the user input and storing them dynamically in a two-dimensional array. Let's break it down step-by-step to understand each part:

#### **Code Breakdown**

```c
int c;
while ((c = getchar()) != '\n' && c != EOF);
```

* **`getchar()`**: This reads one character at a time from standard input (keyboard).
* The `while` loop keeps reading characters until either a newline (`'\n'`) or `EOF` (End of File) is encountered.
* Essentially, this loop is used to discard any leftover characters before starting to read the strings (if the program needs to handle additional characters before reading the input strings).

```c
char **arr = malloc(num_strings * sizeof(char *));
if (!arr)
    return NULL;
```

* **`malloc()`**: Allocates memory dynamically to hold `num_strings` number of `char*` pointers. This `arr` will be a dynamic array that can hold `num_strings` pointers to individual strings.
* If the memory allocation fails (i.e., `malloc()` returns `NULL`), the function will return `NULL`.

```c
for (int i = 0; i < num_strings; i++)
{
    char buffer[1024];
    if (fgets(buffer, sizeof(buffer), stdin) == NULL)
    {
        for (int j = 0; j < i; j++)
        {
            free(arr[j]);
        }
        free(arr);
        return NULL;
    }
```

* **`fgets()`**: This reads a string (including spaces) from the standard input (`stdin`) into the `buffer`. The function reads up to `sizeof(buffer) - 1` characters or until a newline or EOF is encountered.

  * **`stdin`** refers to the standard input stream, which by default is the keyboard.
  * If `fgets()` fails (i.e., `NULL` is returned), the program enters the error handling block and frees any previously allocated memory.

```c
    size_t len = strlen(buffer);
    if (len > 0 && buffer[len - 1] == '\n')
    {
        buffer[len - 1] = '\0'; // Remove newline character
        len--;
    }
```

* **`strlen(buffer)`**: Finds the length of the string in `buffer`.
* **Removing Newline**: If the string ends with a newline (`'\n'`), it is replaced with the null character (`'\0'`) to terminate the string properly without the extra newline.

```c
    arr[i] = malloc((len + 1) * sizeof(char));
    if (!arr[i])
    {
        for (int j = 0; j < i; j++)
        {
            free(arr[j]);
        }
        free(arr);
        return NULL;
    }
```

* **`malloc()`**: Dynamically allocates memory for the `i`-th string, sized to hold `len + 1` characters (the `+1` is for the null terminator `'\0'`).
* If memory allocation fails, it frees all previously allocated memory and returns `NULL`.

```c
    strcpy(arr[i], buffer);
```

* **`strcpy()`**: Copies the contents of `buffer` (the user input string) into `arr[i]`.

```c
*num_strings_ptr = num_strings;
return arr;
```

* **Setting `num_strings_ptr`**: The number of strings read is stored in `num_strings_ptr`.
* The function returns the dynamically allocated array of strings (`arr`).

#### **What is `stdin`?**

* **`stdin`** is a **file stream** that represents the standard input, usually the keyboard. It is predefined in C and used by functions like `fgets()` and `scanf()` to read user input.
* When you use functions like `fgets()` or `scanf()`, the data comes from `stdin` unless redirected.

#### **Summary of Logic**:

* **`getchar()`** is used to discard any unnecessary characters before reading input strings.
* The program allocates memory for an array of strings (`arr`), dynamically reading each string into a `buffer` using **`fgets()`**.
* It removes any newline character (`\n`) from the input strings to ensure proper formatting.
* Each string is copied into dynamically allocated memory (`arr[i]`), and the array of strings is returned.

#### **Memory Management**:

* Memory is dynamically allocated for the array of strings and each individual string.
* If any allocation fails, memory is freed to avoid leaks, and the function returns `NULL`.

This approach ensures that strings of unknown length can be handled, and memory is efficiently managed during the input process.


## String Manipulation

Below is an overview of the core concepts, library functions, and typical logic patterns you’ve already seen in your example files, all of which combine to let you manipulate C-strings (null-terminated character arrays) safely and effectively.

---

### 1. Fundamental Concepts

1. **C-String Representation**

   * A C-string is simply an array of `char` terminated by a null byte (`'\0'`).
   * You must always ensure there is space for that terminator when allocating or copying.

2. **Static vs. Dynamic Storage**

   * **Static**:

     ```c
     char buf[1024];
     ```

     You know the maximum length at compile time.
   * **Dynamic**:

     ```c
     char *s = malloc(len + 1);
     ```

     You determine length at runtime (e.g. after calling `strlen()`).

3. **Pointer vs. Array**

   * An array name (e.g. `char str[100]`) “decays” to `char*` in many contexts, but the storage size is fixed.
   * A `char*` can be `malloc`-ed, reallocated, and freed—allowing flexible string sizes.

4. **Buffer Overruns & Safety**

   * Always size inputs (e.g. `fgets(buf, sizeof buf, stdin)`).
   * Check lengths (`strlen`) before copying or concatenating.
   * Remove a trailing `'\n'` (as in your exercises) to avoid unexpected characters.

---

### 2. Key `<string.h>` Functions

| Function                                          | What it Does                                      | Example Use                            |
| ------------------------------------------------- | ------------------------------------------------- | -------------------------------------- |
| `size_t strlen(const char *s)`                    | Returns length (no `'\0'`).                       | `len = strlen(buf);`                   |
| `char *strcpy(char *d, const char *s)`            | Copies entire string (be sure `d` is big enough). | `strcpy(arr[i], buf);`                 |
| `char *strncpy(char *d, const char *s, size_t n)` | Copies up to `n` chars, may pad with `\0`.        | `strncpy(dest, src, n);`               |
| `char *strcat(char *d, const char *s)`            | Appends `s` onto end of `d`. Must have space.     | `strcat(s, s);` (circular-shift trick) |
| `int strcmp(const char *a, const char *b)`        | Lexicographic compare: 0 if equal.                | `if (strcmp(argv[1], "max")==0) ...`   |
| `char *strstr(const char *h, const char *n)`      | Finds substring `n` in `h`, or `NULL`.            | `if (strstr(big, small)) ...`          |
| `char *strchr(const char *s, int c)`              | Finds first occurrence of `c`.                    | `if (strchr(password, '!')) ...`       |
| `char *strtok(char *s, const char *delim)`        | Tokenizes string (destructive).                   | `tok = strtok(buf, " ,\n");`           |

---

### 3. Memory Functions from `<string.h>`

| Function                                          | What it Does                         | Example                       |
| ------------------------------------------------- | ------------------------------------ | ----------------------------- |
| `void *memcpy(void *d, const void *s, size_t n)`  | Copies `n` bytes (no overlap check). | `memcpy(dst, src, len);`      |
| `void *memmove(void *d, const void *s, size_t n)` | Copies `n` bytes, safe for overlap.  | `memmove(buf+1, buf, len);`   |
| `void *memset(void *s, int c, size_t n)`          | Fills `n` bytes with `c`.            | `memset(buf, 0, sizeof buf);` |

---

### 4. Typical String-Handling Logic Patterns

1. **Reading a Line Safely**

   ```c
   char buf[1024];
   if (fgets(buf, sizeof buf, stdin) == NULL)  /* handle EOF/error */;
   size_t len = strlen(buf);
   if (len && buf[len-1]=='\n') { buf[len-1]='\0'; len--; }
   ```

2. **Allocating Exactly-Sized Copy**

   ```c
   char *copy = malloc(len + 1);
   if (!copy) /* handle OOM */;
   strcpy(copy, buf);
   ```

3. **Comparing / Searching**

   ```c
   if (strcmp(s1, s2)==0)        /* equality */;
   if (strstr(text, pattern))    /* substring exists */;
   ```

4. **Concatenation / Building**

   ```c
   char *big = malloc(total_len + 1);
   strcpy(big, part1);
   strcat(big, part2);
   ```

5. **Tokenizing**

   ```c
   char *tok = strtok(buf, " ,;\n");
   while (tok) {
     process(tok);
     tok = strtok(NULL, " ,;\n");
   }
   ```

6. **Cleaning Up**

   * Free any `malloc`-ed blocks when done.
   * In multi-string arrays (e.g. `char **arr`), loop and `free(arr[i])`, then `free(arr)`.

---

### 5. Real-World Examples from Your Labs

* **Palindrome Check (`ex1.c` in hw5)**: used `strlen` and manual index comparison.
* **Circular-Shift (`ex5.c` in hw5)**: used `strcat(s, s)` + `strstr()` to test for rotation.
* **Dynamic String Array (`ex2.c` in lab9)**: combined `fgets()`, `strlen()`, `malloc()`, `strcpy()` and safe cleanup.
* **Password Validation (`ex4.c` in hw5)**: counted character classes with `isupper()`, `isdigit()`, etc.

---

### **Summary**

* **Always** treat C-strings as null-terminated arrays.
* Use **`<string.h>`** routines for length, copy, compare, search, concatenate, and tokenize.
* Combine with **`malloc`/`free`** (from `<stdlib.h>`) for flexible, dynamic storage.
* Guard every allocation and input to prevent buffer overruns and memory leaks.