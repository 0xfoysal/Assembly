
x86 Assembly — Short Notes
```
FLAGS
ZF = Zero Flag      → result = 0
SF = Sign Flag      → result is negative
CF = Carry Flag     → unsigned carry/borrow
OF = Overflow Flag  → signed overflow
```

Operand Types
```
Immediate → 0x3F
Register  → EAX
Memory    → [0x80542A], [EAX]
Offset    → [EAX+0x10]
SIB       → [EBX+EAX*4+0x10]

SIB = [Base + Index*Scale + Displacement]
Scale = 1, 2, 4, 8
```
Instructions
```
MOV  → copy data
       mov eax, ebx

ADD  → addition
       add eax, 5

SUB  → subtraction
       sub eax, 5

CMP  → compare (SUB without saving result)
       cmp eax, 5

TEST → AND for flags (result not saved)
       test eax, eax

JMP  → unconditional jump

JE/JZ   → ZF=1   (equal/zero)
JNE/JNZ → ZF=0   (not equal)

JG/JGE/JL/JLE → signed comparison
JA/JAE/JB/JBE → unsigned comparison

PUSH → put value on stack
POP  → remove value from stack

AND → bitwise AND
OR  → bitwise OR
XOR → bitwise XOR

xor eax, eax → EAX = 0
```

