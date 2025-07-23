# VG101 SU25 Midterm 2 CheatSheet

---

# **hw4**

## **ex1.c**

```c
#include <stdio.h>

int main()
{
    int month, day;
    int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int days_passed = 0;

    scanf("%d %d", &month, &day);

    for (int i = 0; i < month - 1; i++)
    {
        days_passed += days_in_month[i];
    }
    days_passed += day;

    printf("%d\n", 365 - days_passed);
    return 0;
}
```

### **Explanation**

* **`#include <stdio.h>`**: This header file is crucial for input and output operations, like `scanf()` and `printf()`.
* **`int days_in_month[]`**: An array used to store the number of days in each month. This array assumes a non-leap year (e.g., February has 28 days).
* **`scanf("%d %d", &month, &day)`**: `scanf()` is used to take user input. Here, two integers are read: `month` and `day`.
* **`for (int i = 0; i < month - 1; i++)`**: A loop used to accumulate the total days that have passed in the year before the specified month.
* **`printf("%d\n", 365 - days_passed)`**: The total days remaining in the year are printed, subtracting the days passed from 365.

**Key Takeaway**: The use of arrays, loops, and formatted input/output are key features of this code. The `scanf()` function is essential for input and the loop is used to accumulate values.

---

## **ex2.c**

```c
#include <stdio.h>

int main() 
{
    int n;
    scanf("%d", &n); // "%d" and &n for input

    if (n < 0) 
    {
        printf("I can not solve this problem with %d.\n", n); // %d for output of int
    } 
    else 
    {
        int sum = n * (n + 1) / 2; // Correct formula for sum 1+2+...+n
        printf("%d\n", sum);
    }
    return 0;
}
```

### **Explanation**

* **`int n;`**: A single integer `n` is declared to hold the input number.
* **`scanf("%d", &n);`**: Reads an integer value from the user.
* **`if (n < 0)`**: A simple conditional check that prevents the program from calculating a sum if the number is negative.
* **`n * (n + 1) / 2`**: This formula calculates the sum of the first `n` natural numbers. It uses the arithmetic progression formula.
* **`printf("%d\n", sum);`**: Prints the result of the sum.

**Key Takeaway**: The code focuses on basic input/output and implementing the formula for the sum of the first `n` natural numbers. It also demonstrates conditional logic.

---

## **ex3.c**

```c
#include <stdio.h>

int main() 
{
    int n;
    scanf("%d", &n);

    int twenties = n / 20;
    n = n % 20;
    int tens = n / 10;
    n = n % 10;
    int fives = n / 5;
    n = n % 5;
    int ones = n;

    printf("$20 bills: %d\n", twenties);
    printf("$10 bills: %d\n", tens);
    printf("$5 bills: %d\n", fives);
    printf("$1 bills: %d\n", ones);

    return 0;
}
```

### **Explanation**

* **`int twenties = n / 20;`**: This line calculates how many \$20 bills fit into the input `n`.
* **`n = n % 20;`**: The modulus operator is used to calculate the remaining amount after extracting the \$20 bills.
* **`scanf("%d", &n);`**: Accepts the total amount as input.
* **`printf()`**: Outputs the number of bills in \$20, \$10, \$5, and \$1 denominations.

**Key Takeaway**: This program focuses on using division and modulus to break down an amount into different denominations. The modulus operator is a key tool for this type of calculation.

---

## **ex4.c**

```c
#include <stdio.h>

int main() 
{
    int n, s, t;
    scanf("%d %d %d", &n, &s, &t);

    int solved = t / s;
    int left = n - solved;
    if (left < 0) left = 0;

    printf("%d\n", left);
    return 0;
}
```

### **Explanation**

* **`scanf("%d %d %d", &n, &s, &t);`**: Three integers are taken as input: `n`, `s`, and `t`.
* **`int solved = t / s;`**: The number of tasks that have been solved is calculated by dividing `t` by `s`.
* **`int left = n - solved;`**: The remaining number of tasks is computed.
* **`if (left < 0) left = 0;`**: Ensures that the number of remaining tasks does not go below zero.
* **`printf("%d\n", left);`**: The result is printed.

**Key Takeaway**: This code highlights the use of basic arithmetic operations and conditional checks to determine remaining tasks.

---

## **ex5.c**

```c
#include <stdio.h>

int main() 
{
    int a, b, c;
    char x, y;
    double result;
    int valid = 1;

    scanf("%d %d %d %c %c", &a, &b, &c, &x, &y);

    // a x b = temp
    double temp;
    switch (x) 
    {
        case '+': temp = a + b; break;
        case '-': temp = a - b; break;
        case '*': temp = a * b; break;
        case '/':
            if (b == 0) 
                valid = 0;
            else 
                temp = (double)a / b;
            break;
        default: valid = 0;
    }

    // temp y c
    if (valid == 1) 
    {
        switch (y) 
        {
            case '+': result = temp + c; break;
            case '-': result = temp - c; break;
            case '*': result = temp * c; break;
            case '/':
                if (c == 0) valid = 0;
                else result = temp / c;
                break;
            default: valid = 0;
        }
    }

    if (valid == 1)
        printf("%.2f\n", result);
    else
        printf("error\n");

    return 0;
}
```

### **Explanation**

* **`switch (x)`**: A switch-case structure is used to perform different arithmetic operations based on the input character `x`. It handles addition, subtraction, multiplication, and division.
* **`if (b == 0)` and `if (c == 0)`**: These checks ensure that division by zero does not occur.
* **`valid` flag**: This variable tracks whether the operations are valid or not. If any error occurs (e.g., division by zero or invalid operator), it is set to 0.
* **`printf("%.2f\n", result)`**: Prints the result formatted to 2 decimal places.

**Key Takeaway**: The use of the `switch-case` statement for decision-making and the `valid` flag to handle errors are central to this code. The program emphasizes arithmetic operations and error handling.

---

### **General Key Concepts Highlighted**

1. **Input and Output**: Every program uses `scanf()` for input and `printf()` for output.
2. **Conditional Statements**: `if`, `else`, and `switch` are used for decision-making based on conditions.
3. **Loops**: In `ex1.c`, a `for` loop is used to iterate over an array.
4. **Modulus Operator**: In `ex3.c`, the modulus operator (`%`) is used for calculating remainders when dividing amounts into denominations.
5. **Arithmetic Operations**: Simple operations like addition, subtraction, multiplication, and division are used throughout these programs.


---

# **hw5**

## **ex1.c**

```c
#include <stdio.h>
#include <string.h>

int main() 
{
    char num[1100]; // for 10^1000 digits
    scanf("%1099s", num);
    int len = strlen(num);
    int is_palindrome = 1;
    for (int i = 0; i < len / 2; ++i) 
    {
        if (num[i] != num[len - 1 - i]) 
        {
            is_palindrome = 0;
            break;
        }
    }
    if (is_palindrome) 
        printf("true\n");
    else 
        printf("false\n");

    return 0;
}
```

### **Explanation**

* **`#include <stdio.h>` and `#include <string.h>`**: These headers are required for input/output operations and string handling (like `strlen()` and string comparison).
* **`char num[1100];`**: An array is created to store a very large number (up to $10^{1000}$).
* **`scanf("%1099s", num);`**: Reads a string input of up to 1099 characters into `num`.
* **`strlen(num)`**: Calculates the length of the string using `strlen()`.
* **Palindrome Check**: The program compares characters from the beginning and end to check if the string is a palindrome. If any mismatch is found, it sets `is_palindrome` to 0 and breaks the loop.
* **`printf()`**: Based on the palindrome check, it prints `true` or `false`.

**Key Takeaway**: This program uses string manipulation functions (`strlen()`) and conditionals to check for palindromes in large strings.

---

## **ex2.c**

```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int main() 
{
    int l, r;
    int arr[6]; // max input 5 numbers

    scanf("%d %d",&l,&r);
    int temp, count = 0;

    while (scanf("%d", &temp) != EOF) // read until end of input of the second line
    {
        arr[count] = temp;
        count = count + 1;
    }

    double area = 0, i = l;

    while (i <= r)
    {
        double height = 0;
        for (int j = 0; j < count; j++)
        {
            height = height + arr[j] * pow(i, count - j - 1);
        }
        area = area + (double)(height * 0.01);
        i = i + 0.01;
    }

    printf("%d\n", (int) area);

}
```

### **Explanation**

* **`#include <stdio.h>`, `#include <stdlib.h>`, `#include <math.h>`, `#include <time.h>`**: Required libraries for input/output, math operations (like `pow()`), and time functions.
* **`scanf("%d %d",&l,&r);`**: Takes two integers, `l` and `r`, as input representing the left and right boundaries.
* **`arr[6];`**: Array to store up to 5 coefficients for a polynomial.
* **`scanf("%d", &temp)`**: Reads the coefficients of the polynomial until EOF.
* **Polynomial Evaluation**: Uses the formula to evaluate a polynomial at each `i` between `l` and `r` with a step of 0.01. The `pow(i, count - j - 1)` calculates powers for each term in the polynomial.
* **Integration Approximation**: The area under the curve is approximated using Riemann sums with small steps (`i + 0.01`).

**Key Takeaway**: This code demonstrates polynomial evaluation and numerical integration using basic loops and `pow()` for power calculations.

---

## **ex3.c**

```c
#include <stdio.h>
#include <string.h>

int main()
{
    char sentence[10001];
    int word_count = 0;
    int char_count = 0;
    
    if (fgets(sentence, sizeof(sentence), stdin) == NULL)
    {
        return 1;
    }
    int len = strlen(sentence);
    if (sentence[len - 1] == '\n')
    {
        sentence[len - 1] = '\0';
        len--;
    }
    int in_word = 0;
    for (int i = 0; i < len; i++)
    {
        if (sentence[i] != ' ')
        {
            char_count++;
            if (!in_word)
            {
                word_count++;
                in_word = 1;
            }
        }
        else
        {
            in_word = 0;
        }
    }
    if (word_count == 0)
    {
        printf("0.0\n");
    }
    else
    {
        printf("%.1f\n", (double)char_count / word_count);
    }
    return 0;
}
```

### **Explanation**

* **`fgets(sentence, sizeof(sentence), stdin)`**: Reads an entire line of input safely, handling newlines.
* **`strlen(sentence)`**: Calculates the length of the string.
* **Word and Character Counting**: The program iterates through the string, counting non-space characters and words. It uses a flag (`in_word`) to ensure words are counted properly.
* **Average Word Length**: The program calculates the average number of characters per word and prints the result with one decimal place.

**Key Takeaway**: This program shows how to handle string input safely and calculates the average word length in a sentence.

---

## **ex4.c**

```c
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main()
{
    char password[21];
    if (scanf("%20s", password) != 1)
    {
        printf("false\n");
        return 0;
    }
    
    int len = strlen(password);
    int has_digit = 0;
    int has_upper = 0;
    int has_lower = 0;
    int has_special = 0;

    if (len < 8)
    {
        printf("false\n");
        return 0;
    }
    for (int i = 0; i < len; i++)
    {
        if (isdigit(password[i]))
        {
            has_digit = 1;
        }
        else if (isupper(password[i]))
        {
            has_upper = 1;
        }
        else if (islower(password[i]))
        {
            has_lower = 1;
        }
        else if (isgraph(password[i]) && !isalpha(password[i]) && !isdigit(password[i]))
        {
            has_special = 1;
        }
    }
    if (has_digit && has_upper && has_lower && has_special)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    return 0;
}
```

### **Explanation**

* **`#include <string.h>`, `#include <ctype.h>`**: Libraries for string handling and character classification functions.
* **`isdigit()`, `isupper()`, `islower()`, `isgraph()`**: These functions check the type of characters (digit, uppercase, lowercase, and special characters).
* **Password Validation**: Checks if the password meets the conditions (at least 8 characters, contains digits, uppercase, lowercase, and special characters).
* **`printf()`**: Outputs whether the password is valid or not.

**Key Takeaway**: This code validates a password based on multiple criteria using built-in character classification functions.

---

## **ex5.c**

```c
#include <stdio.h>
#include <string.h>

int is_circular_shift(char *s, char *t)
{
    int len_s = strlen(s);
    int len_t = strlen(t);

    if (len_s != len_t)
    {
        return 0;
    }

    strcat(s, s);

    if (strstr(s, t) != NULL)
    {
        return 1;
    }
    return 0;
}

int main()
{
    char s[201];
    char t[201];
    scanf("%s", s);
    scanf("%s", t);
    
    if (is_circular_shift(s, t))
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    return 0;
}
```

### **Explanation**

* **`strcat(s, s)`**: Concatenates `s` with itself, which helps in checking if `t` is a circular shift of `s`.
* **`strstr(s, t)`**: This function searches for the substring `t` in `s`. If found, the function returns a pointer to the first occurrence.
* **Circular Shift Check**: The program checks if `t` is a circular shift of `s` by concatenating `s` with itself and then searching for `t` within the resulting string.

**Key Takeaway**: The `strcat()` and `strstr()` functions are key to checking for circular shifts in strings.

---

## **ex6.c**

```c
#include <stdio.h>
#include <string.h>

int is_valid(const char *str)
{
    char stack[51];
    int top = -1;

    for (int i = 0; str[i] != '\0'; i++)
    {
        char ch = str[i];
        if (ch == '(' || ch == '{' || ch == '[')
        {
            stack[++top] = ch;
        }
        else if (ch == ')' || ch == '}' || ch == ']')
        {
            if (top < 0)
            {
                return 0;
            }

            char open = stack[top--];

            if ((ch == ')' && open != '(') ||
                (ch == '}' && open != '{') ||
                (ch == ']' && open != '['))
            {
                return 0;
            }
        }
    }
    return top == -1;
}

int main()
{
    char str[52];

    if (fgets(str, sizeof(str), stdin) == NULL)
    {
        printf("true\n");
        return 0;
    }

    str[strcspn(str, "\n")] = '\0';

    if (is_valid(str))
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    return 0;
}
```

### **Explanation**

* **`stack[]`**: Used to track opening brackets during traversal of the string.
* **Bracket Matching**: The program uses a stack to ensure that each opening bracket has a corresponding closing bracket, maintaining the correct order.
* **`fgets()` and `strcspn()`**: Safely reads input and removes the newline character at the end.

**Key Takeaway**: This program uses a stack to validate balanced parentheses/brackets, a common technique in syntax checking.

---

### **General Key Concepts Highlighted**

1. **String Manipulation**: Functions like `strlen()`, `strcat()`, and `strstr()` are widely used for string handling.
2. **Character Classification**: `isdigit()`, `isupper()`, `islower()`, `isgraph()` help classify characters.
3. **Data Structures**: The use of stacks for matching parentheses/brackets in `ex6.c` is a common technique.
4. **Looping and Conditional Logic**: Used throughout for various checks and calculations.


---

# **lab7**

## **ex1.c**

```c
#include <stdio.h>
#include <limits.h>

int main() {
    // this is printing the size of each data type

    printf("Size of char: %zu byte(s)\n", sizeof(char));
    printf("Size of int: %zu byte(s)\n", sizeof(int));
    printf("Size of float: %zu byte(s)\n", sizeof(float));
    printf("Size of double: %zu byte(s)\n", sizeof(double));
    printf("Size of long double: %zu byte(s)\n", sizeof(long double));
    printf("Size of long: %zu byte(s)\n", sizeof(long));
    printf("Size of long long: %zu byte(s)\n", sizeof(long long));
    printf("Size of unsigned int: %zu byte(s)\n", sizeof(unsigned int));

    // this is maximum and minimum values of int and char
    printf("\nINT_MIN: %d\n", INT_MIN);
    printf("INT_MAX: %d\n", INT_MAX);
    printf("CHAR_BIT: %d\n", CHAR_BIT);

    return 0;
}
```

### **Explanation**

* **`sizeof()`**: This operator is used to determine the size of various data types (like `char`, `int`, `float`, etc.) in bytes. This is important for memory management and system architecture understanding.
* **`INT_MIN`, `INT_MAX`, `CHAR_BIT`**: These constants from `<limits.h>` provide the minimum and maximum values of an integer, as well as the number of bits in a `char`.

**Key Takeaway**: This code demonstrates how to check the size of data types in C using `sizeof()` and shows system-specific constants for integer limits and the bit size of a `char`.

---

## **ex2.c**

```c
#include <stdio.h>

int main() 
{
    int cmd, a, b, c;
    
    scanf("%d %d %d %d", &cmd, &a, &b, &c);
    switch(cmd) 
    {
        case 0:
            printf("OMG It's 0 \\(^o^)/ %%%\n");
            break;
        case 1:
            b = a + c;
            // this is command 4
            printf("%d\n", b + 2 * c);
            break;
        case 2: 
        {
            int temp = a;
            a = b;
            b = temp;
            printf("a and b swapped\n");
            // this is command 5
            printf("%d\n", a - b + c);
            break;
        }
        case 3: 
            if (a > 0)
            {
                c = a;
            }
            else
            {
                c = 0;
            }
            // then command 2
            {
                int temp = a;
                a = b;
                b = temp;
                printf("a and b swapped\n");
                // perform command 5
                printf("%d\n", a - b + c);
            }
            break;
        case 4:
            printf("%d\n", b + 2 * c);
            break;
        case 5:
            printf("%d\n", a - b + c);
            break;
        default:
            printf("Invalid command.\n");
    }
    return 0;
}
```

### **Explanation**

* **`switch()` statement**: This control flow statement executes different code blocks based on the value of `cmd`. It's used for menu-driven programs or when you need to handle multiple distinct options.
* **Command Cases**: The program handles different commands by modifying values and performing different calculations. Case 3 even performs multiple operations in a nested block.
* **`scanf()`**: Takes four integers as input to control the switch-case logic.

**Key Takeaway**: The `switch()` statement allows multiple cases to be handled efficiently, and `scanf()` is used to take user input for control flow.

---

## **ex3.c**

```c
#include <stdio.h>

int main() 
{
    float num1, num2, result;
    char op;
    scanf("%f %c %f", &num1, &op, &num2);
    // checking for the operation symbols
    switch(op) 
    {
        case '+':
            result = num1 + num2;
            printf("%.2f\n", result);
            break;
        case '-':
            result = num1 - num2;
            printf("%.2f\n", result);
            break;
        case '*':
            result = num1 * num2;
            printf("%.2f\n", result);
            break;
        case '/':
            if(num2 == 0) {
                printf("Error: Division by zero is not allowed!\n");
            } else {
                result = num1 / num2;
                printf("%.2f\n", result);
            }
            break;
        default:
            printf("Error: Invalid operator!\n");
    }
    return 0;
}
```

### **Explanation**

* **`switch()` for Arithmetic Operations**: The program performs arithmetic operations based on the operator input (`+`, `-`, `*`, `/`).
* **Division by Zero Check**: Before performing division, it checks if the divisor is zero to prevent runtime errors.
* **`scanf()`**: Takes two float numbers and a character for the operation.

**Key Takeaway**: This example demonstrates using `switch()` for handling different arithmetic operations, with error handling for invalid input and division by zero.

---

## **ex4a.c**

```c
#include <stdio.h>

int main() 
{
    int N;
    scanf("%d", &N);
    printf("Number | Square\n");
    printf("------ | ------\n");
    for(int i = 1; i <= N; i++) 
    {
        printf("%-6d | %6d\n", i, i * i); // power 2 each index until N
    }
    return 0;
}
```

### **Explanation**

* **`for()` Loop**: The loop runs from `1` to `N`, printing each number and its square. The format `%-6d` and `%6d` ensures the columns are aligned.
* **`scanf()`**: Reads the integer `N` to determine how many numbers to print.

**Key Takeaway**: This program shows how to use a loop to print numbers and their squares, along with formatted output to make the table readable.

---

## **ex4b.c**

```c
#include <stdio.h>

int main() 
{
    int i = 10;
    printf("Countdown:\n");
    while(i > 0)
    {
        printf("%d...\n", i);
        i--;
    }
    printf("Blast Off!\n");
    return 0;
}
```

### **Explanation**

* **`while()` Loop**: The loop counts down from `10` to `1`, printing each number followed by a `...`, then prints "Blast Off!" after the countdown ends.

**Key Takeaway**: A `while()` loop is used to repeat an action (countdown in this case) until a condition is no longer true.

---

## **ex4c.c**

```c
#include <stdio.h>

int main() 
{
    int choice;
    do {
        printf("--- Menu ---\n");
        printf("1. Play Game\n");
        printf("2. View High Scores\n");
        printf("3. Exit\n");
        printf("");
        scanf("%d", &choice);
        switch(choice) {
            case 1:
                printf("Playing game...\n");
                break;
            case 2:
                printf("Viewing high scores...\n");
                break;
            case 3:
                printf("Exiting program. Goodbye!\n");
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    } while(choice != 3); // break if 3
    return 0;
}
```

### **Explanation**

* **`do-while()` Loop**: The program displays a menu and runs repeatedly until the user selects option `3` to exit.
* **`switch()` for Menu Options**: Based on the user's choice, different actions are performed (playing a game, viewing scores, or exiting).

**Key Takeaway**: This demonstrates a `do-while()` loop for menu-driven programs, ensuring the program continues running until the user chooses to exit.

---

## **ex5a.c**

```c
#include <stdio.h>

int main() 
{
    printf("Loop with break:\n");
    for(int i = 1; i <= 10; i++) 
    {
        if(i == 5) 
        {
            break; // break when 5
        }
        printf("%d\n", i);
    }
    printf("Loop terminated when number was 5.\n");
    return 0;
}
```

### **Explanation**

* **`break` in a Loop**: The loop iterates from `1` to `10` but exits early when `i` equals `5` using the `break` statement.

**Key Takeaway**: The `break` statement can be used to exit a loop prematurely based on a condition.

---

## **ex5b.c**

```c
#include <stdio.h>

int main()
{
    printf("Loop with continue (printing odd numbers):\n");
    for(int i = 1; i <= 10; i++)
    {
        if(i % 2 == 0) {
            continue; // skip even numbers
        }
        printf("%d\n", i);
    }
    return 0;
}
```

### **Explanation**

* **`continue` in a Loop**: The loop prints only odd numbers from `1` to `10`. If `i` is even, it skips the current iteration using the `continue` statement.

**Key Takeaway**: The `continue` statement is useful for skipping certain iterations in a loop based on a condition.

---

### **General Key Concepts Highlighted**

1. **Control Structures**: `switch`, `while`, `for`, `do-while`, `break`, and `continue` are explored for different types of flow control.
2. **Formatted Output**: The use of formatted printing (`%-6d`, `%6d`, `%.2f`) ensures clean and readable output.
3. **Error Handling**: Simple error handling is performed for cases like division by zero and invalid menu choices.
4. **Arithmetic Operations**: The program examples demonstrate basic arithmetic and conditional operations.


---

# **lab8**

## **ex1.c**

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int calculateSum(int a[], int n) 
{
    int sum = 0;
    for(int i = 0; i < n; i++) 
    {
        sum += a[i];
    }
    return sum;
}

int findMax(int a[], int n) 
{
    int max = a[0];
    for(int i = 1; i < n; i++) 
    {
        if(a[i] > max) 
            max = a[i];
    }
    return max;
}

int countEvens(int a[], int n) 
{
    int count = 0;
    for(int i = 0; i < n; i++) 
    {
        if(a[i] % 2 == 0) 
            count++;
    }
    return count;
}

int main(int argc, char* argv[]) 
{
    if(argc < 2) return 1;

    int n;
    scanf("%d", &n);
    int a[1000];
    for(int i = 0; i < n; i++) 
    {
        scanf("%d", &a[i]);
    }

    if(strcmp(argv[1], "sum") == 0)
        printf("%d\n", calculateSum(a, n));
    else if(strcmp(argv[1], "max") == 0)
        printf("%d\n", findMax(a, n));
    else if(strcmp(argv[1], "even") == 0)
        printf("%d\n", countEvens(a, n));
    
    return 0;
}
```

### **Explanation**

* **Command-line arguments (`argc` and `argv`)**: The program uses `argc` to check if the correct number of arguments have been passed. It processes the first argument (`argv[1]`) to determine whether to calculate the sum, maximum, or count even numbers from an array.
* **Helper Functions**: `calculateSum()`, `findMax()`, and `countEvens()` handle specific calculations based on the input array.
* **`scanf()`**: Reads an integer `n` and fills an array with `n` integers.
* **`strcmp()`**: Used to compare the command-line argument with specific strings (`"sum"`, `"max"`, `"even"`).

**Key Takeaway**: The program demonstrates the use of command-line arguments for functionality selection and array manipulation with helper functions.

---

## **ex2.c**

```c
#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool is_prime(int x)
{
    if (x < 2)
        return false;
    if (x == 2)
        return true;
    if (x % 2 == 0)
        return false;
    for (int i = 3; i <= (int)sqrt(x); i += 2)
    {
        if (x % i == 0)
            return false;
    }
    return true;
}

int main()
{
    int n;
    scanf("%d", &n);
    int num;
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &num);
        if (is_prime(num))
        {
            printf("Prime\n");
        }
        else
        {
            printf("Not Prime\n");
        }
    }
    return 0;
}
```

### **Explanation**

* **`is_prime()` Function**: This function checks whether a number is prime. It handles edge cases for numbers less than 2, even numbers, and uses a loop to check divisibility for odd numbers up to the square root of the number.
* **Prime Check Logic**: The main program loops through the input numbers and calls `is_prime()` to check if they are prime.
* **`scanf()`**: Reads the number of integers (`n`) to check, followed by `n` integers.

**Key Takeaway**: The program demonstrates prime number checking using an efficient method that avoids unnecessary checks for even numbers.

---

## **ex3.c**

```c
#include <stdio.h>
#include <string.h>

// in order of 0 to 9, for all their shapes (true and false if there is a shape)
const int segments[10][7] = {
    {1,1,1,1,1,1,0}, // 0
    {0,1,1,0,0,0,0}, // 1
    {1,1,0,1,1,0,1}, // 2
    {1,1,1,1,0,0,1}, // 3
    {0,1,1,0,0,1,1}, // 4
    {1,0,1,1,0,1,1}, // 5
    {1,0,1,1,1,1,1}, // 6
    {1,1,1,0,0,0,0}, // 7
    {1,1,1,1,1,1,1}, // 8
    {1,1,1,1,0,1,1}  // 9
};

int main()
{
    char number[32];
    scanf("%31s", number);
    int len = strlen(number);

    // ch
    // top
    for (int i = 0; i < len; i++)
    {
        int d = number[i] - '0';
        printf(" ");
        if (segments[d][0])
            printf("___");
        else
            printf("   ");
        printf("  ");
    }
    printf("\n");

    // middle
    for (int i = 0; i < len; i++)
    {
        int d = number[i] - '0';
        if (segments[d][5])
            printf("|");
        else
            printf(" ");
        if (segments[d][6])
            printf("___");
        else
            printf("   ");
        if (segments[d][1])
            printf("|");
        else
            printf(" ");
        printf(" ");
    }
    printf("\n");

    // bottom
    for (int i = 0; i < len; i++)
    {
        int d = number[i] - '0';
        if (segments[d][4])
            printf("|");
        else
            printf(" ");
        if (segments[d][3])
            printf("___");
        else
            printf("   ");
        if (segments[d][2])
            printf("|");
        else
            printf(" ");
        printf(" ");
    }
    printf("\n");
    
    return 0;
}
```

### **Explanation**

* **7-Segment Display Representation**: The program uses a 2D array `segments` where each digit (0-9) is represented by its segments in a 7-segment display.
* **Character Display**: The program loops through each digit of the input number and prints the corresponding segments for top, middle, and bottom parts of the 7-segment display.
* **`scanf()`**: Reads the input number (up to 31 characters long).

**Key Takeaway**: The program simulates a 7-segment display by mapping each digit to its respective segments and prints it out in a readable form.

---

### **General Key Concepts Highlighted**

1. **Arrays and Loops**: These are extensively used for storing and manipulating data (such as in the prime check and 7-segment display simulations).
2. **Command-Line Arguments**: In `ex1.c`, command-line arguments are used to control the program's behavior, demonstrating flexibility in handling input.
3. **Prime Checking**: Efficient methods for determining prime numbers using mathematical principles (e.g., checking divisibility only up to the square root).
4. **String Manipulation**: In `ex3.c`, the input number is handled as a string, and each character is processed to simulate a 7-segment display.


---

# **lab9**

## **ex1.c**

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char *name;
    int id;
    float gpa;
} Student;

Student* createStudent(const char *name, int id, float gpa) 
{
    Student *student = (Student*)malloc(sizeof(Student));
    if (student == NULL) 
    {
        return NULL;
    }
    
    student->name = (char*)malloc(strlen(name) + 1);
    if (student->name == NULL) 
    {
        free(student);
        return NULL;
    }
    
    strcpy(student->name, name);
    student->id = id;
    student->gpa = gpa;
    
    return student;
}

void printStudent(const Student *student) 
{
    if (student != NULL) 
    {
        printf("Name: %s, ID: %d, GPA: %.2f\n", student->name , student->id, student->gpa);
    }
}

void freeStudent(Student *student) 
{
    if (student != NULL) 
    {
        free(student->name);
        free(student);
    }
}

Student* readStudents(int *num_students_ptr)
{
    int num_students;
    scanf("%d", &num_students);

    Student **students = (Student **)malloc(num_students * sizeof(Student *));
    if (students == NULL)
    {
        return NULL;
    }

    for (int i = 0; i < num_students; i++)
    {
        char name[256];
        int id;
        float gpa;

        scanf("%s %d %f", name, &id, &gpa);

        students[i] = createStudent(name, id, gpa);
        if (students[i] == NULL) {
            for (int j = 0; j < i; j++) {
                freeStudent(students[j]);
            }
            free(students);
            return NULL;
        }
    }
    *num_students_ptr = num_students;
    return students;
}

Student* findStudentByName(Student **students, int count, const char *name) 
{
    for (int i = 0; i < count; i++) 
    {
        if (strcmp(students[i]->name, name) == 0) 
        {
            return students[i];
        }
    }
    return NULL;
}

int main() 
{
    int num_students;
    Student **students = readStudents(&num_students);
    
    if (students == NULL) 
    {
        printf("Failed to read students\n");
        return 1;
    }

    printf("Student Database:\n");
    for (int i = 0; i < num_students; i++) 
    {
        printStudent(students[i]);
    }

    char search_name[256];
    scanf("%s", search_name);

    printf("\nSearching for: %s\n", search_name);

    Student *found_student = findStudentByName(students, num_students, search_name);
    
    if (found_student != NULL) 
    {
        printf("Found Student: ");
        printStudent(found_student);
    } 
    else 
    {
        printf("Student %s not found.\n", search_name);
    }

    for (int i = 0; i < num_students; i++) 
    {
        freeStudent(students[i]);
    }
    
    free(students);
    
    return 0;
}
```

### **Explanation**

* **`Student` Structure**: A structure is used to store student information, including name, ID, and GPA.
* **Dynamic Memory Allocation**: Functions like `malloc()` are used to dynamically allocate memory for the student list and student names.
* **`createStudent()`**: This function dynamically allocates memory for a student and initializes the structure.
* **Search and Print**: The program allows searching for a student by name and prints their details using `findStudentByName()` and `printStudent()`.
* **Memory Management**: The program ensures that dynamically allocated memory is freed using `freeStudent()` and `free()`.

**Key Takeaway**: This program demonstrates the use of structures, dynamic memory allocation, and deallocation to manage a student database.

---

## **ex2.c**

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char **readStringArray(int *num_strings_ptr) 
{
    int num_strings;
    scanf("%d", &num_strings);
    
    int c;
    while ((c = getchar()) != '\n' && c != EOF);

    char **arr = malloc(num_strings * sizeof(char *));
    if (!arr) 
    {
        return NULL;
    }

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
        
        size_t len = strlen(buffer);
        if (len > 0 && buffer[len - 1] == '\n') 
        {
            buffer[len - 1] = '\0'; // Remove newline character
            len--;
        }

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
        strcpy(arr[i], buffer);     
    }

    *num_strings_ptr = num_strings;
    return arr;
}

void printStringArray(char **arr, int count, const char *header) 
{
    printf("%s\n", header);
    for (int i = 0; i < count; i++) 
    {
        printf("%s\n", arr[i]);
    }
}

int compareStrings(const void *a, const void *b) 
{
    return strcmp(*(const char **)a, *(const char **)b);
}

void freeStringArray(char **arr, int count) 
{
    for (int i = 0; i < count; i++) 
    {
        free(arr[i]);
    }
    free(arr);
}

int main() 
{
    int count;
    char **strings = readStringArray(&count);

    if (strings == NULL) 
    {
        return 1;
    }

    printStringArray(strings, count, "Original Strings:");

    qsort(strings, count, sizeof(char *), compareStrings);

    printf("\n");
    printStringArray(strings, count, "Sorted Strings:");

    freeStringArray(strings, count);

    return 0;
}
```

### **Explanation**

* **Dynamic String Array**: The program dynamically allocates an array of strings (`char **arr`) using `malloc()`.
* **`fgets()`**: This function is used to safely read strings, ensuring that the newline character is removed using `strcspn()`.
* **Sorting with `qsort()`**: The program uses the C standard library's `qsort()` function to sort the array of strings.
* **Memory Management**: Proper memory management is ensured by freeing allocated memory using `freeStringArray()`.

**Key Takeaway**: This program demonstrates dynamic memory allocation for arrays of strings and how to sort them using `qsort()`.

---

## **ex3.c**

```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *next;
} Node;

Node* createNode(int data) 
{
    Node *new_node = (Node *)malloc(sizeof(Node));
    if (!new_node) 
    {
        return NULL;
    }
    new_node->data = data;
    new_node->next = NULL;
    return new_node;
}

Node* buildCircularList(int *num_elements_ptr)
{
    int num_elements;
    scanf("%d", &num_elements);

    if (num_elements == 0) 
    {
        *num_elements_ptr = 0;
        return NULL;
    }

    Node *head = NULL;
    Node *tail = NULL;

    for (int i = 0; i < num_elements; i++) 
    {
        int data;
        scanf("%d", &data);

        Node *new_node = createNode(data);
        if (!new_node) 
        {
            if (head != NULL) 
            {
                Node *current = head;
                do {
                    Node *temp = current;
                    current = current->next;
                    free(temp);
                } while (current != head);
            }
            return NULL;
        }

        if (head == NULL) 
        {
            head = new_node;
            tail = new_node;
            new_node->next = head; // Initialize circular link
        } 
        else 
        {
            tail->next = new_node;
            new_node->next = head; // Maintain circular link
            tail = new_node;
        }
    }
    *num_elements_ptr = num_elements;
    return head;
}

void insertAfter(Node *prev_node, int data_to_insert)
{
    if (prev_node == NULL) 
    {
        return;
    }

    Node *new_node = createNode(data_to_insert);
    if (!new_node) 
    {
        return;
    }
    new_node->next = prev_node->next;
    prev_node->next = new_node;
}

void printCircularList(const Node *head, int max_print_count) 
{
    if (head == NULL) 
    {
        printf("Empty list\n");
        return;
    }

    const Node *current = head;
    int count = 0;
    do {
        if (count > 0)
        {
            printf(" -> ");
        } 

        printf("%d", current->data);
        current = current->next;
        count++;
    } while (current != head && count < max_print_count);

    printf(" (repeats %d)\n", head->data);
}

void freeCircularList(Node **head) 
{
    if (*head == NULL) 
    {
        return;
    }

    Node *current = *head;
    Node *next;

    do {
        next = current->next;
        free(current);
        current = next;
    } while (current != *head);
    *head = NULL;
}

Node* findNodeWithData(Node *head, int data) 
{
    if (head == NULL) 
    {
        return NULL;
    }

    Node *current = head;
    do {
        if (current->data == data) 
        {
            return current;
        }
        current = current->next;
    } while (current != head);

    return NULL;
}

int main() 
{
    int num_elements;
    Node *head = buildCircularList(&num_elements);

    if (head == NULL && num_elements == 0) 
    {
        printf("Empty list\n");
        return 0;
    }

    if (head == NULL) 
    {
        printf("Failed to build list\n");
        return 1;
    }

    printf("Original Circular List (first %d elements): \n", num_elements);
    printCircularList(head, num_elements);

    int data_to_insert1, insert_after_element1;
    scanf("%d %d", &data_to_insert1, &insert_after_element1);


    Node *prev_node1 = findNodeWithData(head, insert_after_element1);
    if (prev_node1 != NULL) 
    {
        insertAfter(prev_node1, data_to_insert1);
    }

    printf("\nAfter insert 1: \n");
    printCircularList(head, num_elements + 1);

    int data_to_insert2, insert_after_element2;
    scanf("%d %d", &data_to_insert2, &insert_after_element2);

    Node *prev_node2 = findNodeWithData(head, insert_after_element2);
    if (prev_node2 != NULL)
    {
        insertAfter(prev_node2, data_to_insert2);
    }

    printf("\nAfter insert 2: \n");
    printCircularList(head, num_elements + 2);
    freeCircularList(&head);
    return 0;
}
```

### **Explanation**

* **Circular Linked List**: This code implements a circular linked list where the last node points back to the first node, forming a loop.
* **Dynamic Memory Management**: Memory is dynamically allocated for each node, and the list is freed properly after use.
* **Inserting After a Node**: The function `insertAfter()` inserts a new node after a specified node.
* **Circular List Printing**: The program prints the list in a circular fashion, ensuring that it doesn't print the same node infinitely.

**Key Takeaway**: This program demonstrates creating and managing a circular linked list, with functionality to insert nodes and free the list's memory.

---

### **General Key Concepts Highlighted**

1. **Dynamic Memory Allocation**: Memory is dynamically allocated for both arrays and linked list nodes.
2. **Circular Linked List**: Implementation of circular linked lists, demonstrating the concept of the last node pointing to the first.
3. **Searching and Insertion**: Functions to search for a node with specific data and insert a new node after an existing node.
4. **String Manipulation**: In **ex2.c**, memory is allocated for a dynamic array of strings, showcasing string handling and sorting.

