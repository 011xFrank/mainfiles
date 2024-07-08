 **Date Created** : 07-07-2024
 **Topics Covered ** : strlen(), strcat(), strncat(), strcmp(), strncmp(), strcpy(), strncpy()
 
---
---
## strlen()
Function Prototype ->
```C
size_t strlen(const char *s);
```
> strlen() returns the number of characters in _s_ up to, but not including, the first null character.

_Usage :_
```C
#include <string.h>


int main(void) {
    int len;
    
    len = strlen("1234");   /* length is 4 */
    len = strlen("12345");  /* length is 5 */
    len = strlen("string"); /* length is 6 */

    exit(0);
}
```
---
## strcat()
Function Prototype ->
```C
extern char *strcat (char *string1, const char *string2);
```
>  concatenate _string2_ to the end of _string1_.
- It is used for string concatenation.
- The contents pointed to by string2 are appended to the contents of the string pointed to by string1
- The function returns type char * (a pointer to a character), in this case a pointer to string1 is returned.
- It returns the value of its argument.

>[!NOTE]
\- strcat() does not perfom bound checking 
\- Preferable to use _strncat()_

_Usage :_
```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STR_LEN 20


int main(void) {
    char string1[STR_LEN + 1] = "string1";
    char *string2 = "string2";

    strcat(string1,string2);

    string1[STR_LEN] = '\0';

    exit(0);
}
```
---
## strncat()
Function Prototype ->
```C
extern char *strncat (char *string1, const char *string2, size_t n);
```
>  concatenate _n_ characters of _string2_ to end of _string1_.
- strncat() adds a third argument indicating the number of arguments to be concatenated.
- Appends _n_ characters of string2 to string1.


_Usage :_
```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STR_LEN 10


int main(void) {
    char string1[STR_LEN] = "string1";
    char *string2 = "string2";

    strncat(string1,string2, (sizeof(string1) - strlen(string1) - 1));
	string1[STR_LEN - 1] = '\0';

    printf("%s\n", string1); /* string1st */

    exit(0);
}
```

---
## strcmp()
Function Prototype ->
```C
int strcmp(const char *s1, const char *s2);
```
> strcmp() compares the strings _s1 and s2, returning a value less than, equal to, or greater than 0, depending on whether s1 is less than, equal to, or greater than s2._
- strcmp compares strings based on their lexicographic ordering, which resembles the way words are arranged in a dictionary.
- s1 is considered to be less than s2 if :
	>\- The first _i_ characters of s1 and s2 match, but the (i+1)st character of s1 is less than the (i+1)st character of s2. e.g : _"abc" is less than "bcd"_,_"abd" is less than "abe"_.
	\- All characters of s1 match s2, but s1 is shorter than s2. e.g _"abc" is less than "abcd"_.
- strcmp looks at the numerical codes that represent the characters.

>[!NOTE]
> Important Properties of the ASCII character set :
>- The characters in each of the sequences A–Z, a–z, and 0–9 have consecutive codes.
>- All upper-case letters have a lower numeric representation than all lower-case letters.
>- Spaces have a lower numerical representation than all printing characters:
>- Digits have a lower numerical representation than letters.
>>97 - 122 -> Lowercase letters
>>65 - 90  -> Uppercase letters
>>48 - 57  -> Digits
>>32 -> Space

_Usage :_
```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(void) {
    const char* string1 = "string1";
    const char* string2 = "string2";
    
    if (strcmp(string1, string2) == 0){}; /* Is string1 same as string2 */
    if (strcmp(string1, string2) < 0){};  /* Is string1 less than string2 */
    if (strcmp(string1, string2) > 0){};  /* Is string1 greater than string2 */
            
    exit(0);
}
```

- Other relational operators can be used as well. See [[Operators]]
- Also See _strncmp()_ : same as strcmp() but adds a third argument for number of characters to be compared.
---
## strcpy()

Function Prototype ->
```C
char *strcpy(char *s1, const char *s2);
```
> strcpy copies the string pointed to by s2 into the array pointed to by s1.
- The existence of strcpy compensates for the fact that we can’t use the assignment operator to copy strings.
- strcpy copies characters from s2 to s1 up to (and including) the first null character in s2
- strcpy returns s1 (a pointer to the destination string)

_Usage :_

```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STR_LEN 10


int main(void) {
    char dest_string[STR_LEN];
    const char* string1 = "string1";

    strcpy(dest_string, string1);

    printf("%s", dest_string);
    
            
    exit(0);
}
```

>[!NOTE]
>  strcpy has no way to check that the string pointed to by str2 will actually fit in the array pointed to by str1.
>  Calling the _strncpy()_ function is a safer, albeit slower, way to copy a string

---
## strncpy()

Function Prototype ->
```C
char *strcpy(char *s1, const char *s2, size_t n);
```
> strncpy() is similar to strcpy() but has a third argument that limits the number of characters that will be copied.

_Usage :_
```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STR_LEN 10


int main(void) {
    char dest_string[STR_LEN];
    const char* string1 = "string1";

    strncpy(dest_string, string1, (sizeof(string1) - 1));
    dest_string[STR_LEN - 1] = '\0';

    printf("%s", dest_string);
    
            
    exit(0);
}
```
`dest_string[STR_LEN - 1] = '\0';` ensures the destination sting is null terminated.

---
---
## References :
1. strcmp() - [[Operators]]