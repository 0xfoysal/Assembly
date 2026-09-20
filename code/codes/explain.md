# 8086 Assembly Language

My personal notes and practice while learning **8086 Assembly Language**.

---

## 1. Basic Program Structure

```asm
.model small
.stack 100h
.code
```

### `.model small`

Defines the memory model of the program.

```asm
.model small
```

`small` memory model means:

* One code segment
* One data segment
* Each segment can be up to 64 KB

---

### `.stack 100h`

Allocates memory for the **stack**.

```asm
.stack 100h
```

`100h` is hexadecimal.

```text
100h = 256 bytes
```

The stack is commonly used by:

* `PUSH`
* `POP`
* `CALL`
* `RET`

---

### `.code`

Indicates the beginning of the **code section**.

```asm
.code
```

The executable instructions of the program are written inside this section.

---

## 2. Registers

Registers are small, fast storage locations inside the CPU.

### General Purpose Registers

| Register | Name        | Common Use               |
| -------- | ----------- | ------------------------ |
| AX       | Accumulator | Arithmetic, input/output |
| BX       | Base        | Base addressing          |
| CX       | Counter     | Loops                    |
| DX       | Data        | Input/output, data       |

Each 16-bit register can be divided into two 8-bit registers.

```text
AX → AH + AL
BX → BH + BL
CX → CH + CL
DX → DH + DL
```

Example:

```asm
mov al, 5
mov ah, 2
```

Here:

* `AL` = lower 8 bits of `AX`
* `AH` = higher 8 bits of `AX`

---

## 3. MOV Instruction

`MOV` is used to copy data from one location to another.

Syntax:

```asm
mov destination, source
```

Example:

```asm
mov ax, 10
mov bx, ax
```

After execution:

```text
AX = 10
BX = 10
```

The original value in `AX` is not removed.

---

## 4. Immediate Value

An immediate value is a constant value written directly in an instruction.

Example:

```asm
mov ax, 10
mov bl, 5
```

Here:

```text
10 → immediate value
5  → immediate value
```

Hexadecimal example:

```asm
mov ax, 3fh
```

`3Fh` is a hexadecimal value.

---

## 5. Register Operand

A register operand means the instruction uses a CPU register.

Example:

```asm
mov ax, bx
```

Here:

```text
BX → source
AX → destination
```

The value of `BX` is copied into `AX`.

---

## 6. Memory Operand

A memory operand accesses data stored in memory.

Example:

```asm
mov ax, [1234h]
```

The brackets `[]` mean that the value is being accessed from a memory address.

```text
[1234h] → memory location
AX      → destination register
```

---

## 7. INT 21h

`INT 21h` is a DOS interrupt used to perform various operating-system services.

Example:

```asm
mov ah, 1
int 21h
```

Here:

```text
AH = 01h → keyboard input
INT 21h  → execute DOS service
```

Another example:

```asm
mov ah, 4ch
int 21h
```

This terminates the program.

---

## 8. Taking Character Input

To read one character from the keyboard:

```asm
mov ah, 1
int 21h
```

The entered character is returned in:

```text
AL
```

Example:

```asm
mov ah, 1
int 21h
mov bl, al
```

Explanation:

```text
mov ah, 1
```

Selects DOS function `01h`.

```text
int 21h
```

Waits for keyboard input.

```text
mov bl, al
```

Copies the entered character from `AL` into `BL`.

---

## 9. Displaying a Character

To display one character:

```asm
mov ah, 2
mov dl, 'A'
int 21h
```

Explanation:

```text
AH = 02h → display character function
DL = 'A' → character to display
INT 21h  → execute DOS service
```

The character that should be displayed must be placed in `DL`.

---

## 10. Complete Input and Output Example

```asm
.model small
.stack 100h
.code

main proc

    mov ah, 1
    int 21h

    mov bl, al

    mov ah, 2
    mov dl, bl
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
```

### Program Flow

```text
Keyboard Input
      ↓
    AL
      ↓
    BL
      ↓
    DL
      ↓
Display Character
```

---

## 11. ADD Instruction

`ADD` is used for addition.

Syntax:

```asm
add destination, source
```

Example:

```asm
mov al, 5
add al, 3
```

Result:

```text
AL = 8
```

---

## 12. SUB Instruction

`SUB` is used for subtraction.

Example:

```asm
mov al, 10
sub al, 3
```

Result:

```text
AL = 7
```

---

## 13. INC Instruction

`INC` increases a value by `1`.

Example:

```asm
mov ax, 5
inc ax
```

Result:

```text
AX = 6
```

---

## 14. DEC Instruction

`DEC` decreases a value by `1`.

Example:

```asm
mov ax, 5
dec ax
```

Result:

```text
AX = 4
```

---

## 15. CMP Instruction

`CMP` compares two values.

Example:

```asm
cmp ax, bx
```

`CMP` internally performs:

```text
AX - BX
```

but does not store the result.

Instead, it changes the CPU flags.

---

## 16. JMP Instruction

`JMP` is used to jump to another location in the program.

Example:

```asm
jmp start
```

Example:

```asm
start:
    mov ax, 5
    jmp start
```

This creates an infinite loop.

---

## 17. Conditional Jump

Conditional jumps depend on CPU flags.

Common conditional jumps:

| Instruction   | Meaning                      |
| ------------- | ---------------------------- |
| `JE` / `JZ`   | Jump if Equal / Zero         |
| `JNE` / `JNZ` | Jump if Not Equal / Not Zero |
| `JG`          | Jump if Greater              |
| `JL`          | Jump if Less                 |
| `JGE`         | Jump if Greater or Equal     |
| `JLE`         | Jump if Less or Equal        |

Example:

```asm
cmp ax, bx
je equal
```

If `AX == BX`, execution jumps to `equal`.

---

## 18. Zero Flag (ZF)

The **Zero Flag (ZF)** indicates whether an arithmetic or comparison result is zero.

Example:

```asm
cmp ax, bx
```

If:

```text
AX = BX
```

then the result of the comparison is zero and:

```text
ZF = 1
```

Otherwise:

```text
ZF = 0
```

Commonly used with:

```asm
JE
JZ
JNE
JNZ
```

---

## 19. Sign Flag (SF)

The **Sign Flag (SF)** indicates the sign of a result.

For signed operations:

```text
SF = 0 → positive
SF = 1 → negative
```

Example:

```asm
mov al, 5
sub al, 8
```

The result is negative in signed interpretation, so `SF` becomes `1`.

---

## 20. Stack

The stack is a LIFO structure:

```text
Last In → First Out
```

Common instructions:

```asm
push ax
pop ax
```

Example:

```asm
mov ax, 10
push ax

mov ax, 20
pop ax
```

After `POP`:

```text
AX = 10
```

---

## 21. Procedure

A procedure is a reusable block of code.

Example:

```asm
main proc

    ; instructions

main endp
```

A procedure can be called using:

```asm
call procedure_name
```

and returned from using:

```asm
ret
```

---

## 22. Comments

Comments are ignored by the assembler and are used to explain code.

In Assembly:

```asm
; This is a comment
```

Example:

```asm
mov ah, 1      ; Select keyboard input
int 21h        ; Execute DOS interrupt
```

---

## 23. Number Systems

### Decimal

```asm
mov ax, 10
```

### Hexadecimal

```asm
mov ax, 0ah
```

### Binary

```asm
mov ax, 1010b
```

Common suffixes:

```text
Decimal      → no suffix
Hexadecimal  → h
Binary       → b
```

Examples:

```text
10
0Ah
1010b
```

All represent the same value:

```text
10 decimal
```

---

## 24. Basic Program Exit

A common way to terminate a DOS Assembly program is:

```asm
mov ah, 4ch
int 21h
```

Here:

```text
AH = 4Ch → terminate program
INT 21h  → execute DOS service
```

---

## Learning Roadmap

```text
8086 Basics
    ↓
Registers
    ↓
Memory
    ↓
MOV
    ↓
Input / Output
    ↓
Arithmetic
    ↓
Flags
    ↓
CMP
    ↓
Jumps
    ↓
Loops
    ↓
Stack
    ↓
Procedures
    ↓
Reverse Engineering
```

---

## Goal

My goal is to build a strong foundation in **8086 Assembly Language, low-level programming, and reverse engineering** through practical examples and hands-on exercises.
