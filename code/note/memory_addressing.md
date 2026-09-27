# x86 Assembly — Memory Addressing

## Instruction

```asm
mov eax, [ebp + ecx*2 + 4]
```

এই instruction-টি প্রথমে একটি **memory address** হিসাব করে। এরপর সেই address-এ থাকা **4-byte (DWORD) value** `EAX` register-এ নিয়ে আসে।

---

## Instruction-এর অংশগুলো

```text
[ ebp + ecx*2 + 4 ]
  │      │     │
  │      │     └── Offset = 4
  │      └──────── Index × Scale
  └─────────────── Base
```

| অংশ   | অর্থ                  |
| ----- | --------------------- |
| `EAX` | যেখানে value রাখা হবে |
| `EBP` | Base register         |
| `ECX` | Index register        |
| `2`   | Scale                 |
| `4`   | Offset / Displacement |
| `[ ]` | Memory access         |

---

1. EBP <br>
Base address হিসেবে কাজ করছে।

3. ECX * 2 <br>
ECX-কে 2 দিয়ে multiply করা হচ্ছে।

4. +4 <br>
শেষে 4 যোগ হচ্ছে।

5. [address] <br>
Calculated address-টাকে memory address হিসেবে ব্যবহার করছে।

7. mov eax <br>
Memory থেকে পাওয়া 4-byte value EAX-এ যাবে।


## কীভাবে কাজ করে?

প্রথমে CPU **Effective Address (EA)** হিসাব করে:

```text
EA = EBP + (ECX × 2) + 4
```

তারপর সেই address-এর memory থেকে value নিয়ে `EAX`-এ রাখে।

```text
EAX = [EBP + (ECX × 2) + 4]
```

---

## Example

ধরি:

```text
EBP = 0x1000
ECX = 3
```

প্রথমে address হিসাব করি:

```text
EA = EBP + (ECX × 2) + 4

EA = 0x1000 + (3 × 2) + 4

EA = 0x1000 + 6 + 4

EA = 0x100A
```

অর্থাৎ CPU শেষ পর্যন্ত memory address হিসেবে:

```text
0x100A
```

ব্যবহার করবে।

ধরি memory-তে:

```text
Address    Value
----------------------
0x100A     0x12345678
```

তাহলে:

```asm
mov eax, [ebp + ecx*2 + 4]
```

execute হওয়ার পরে:

```text
EAX = 0x12345678
```

---

## `[]` কেন ব্যবহার করা হয়েছে?

`[]` মানে হলো **memory-এর ভিতরের value access করা**।

### Bracket ছাড়া

```asm
mov eax, 0x100A
```

এর অর্থ:

```text
EAX = 0x100A
```

এখানে `0x100A` সরাসরি `EAX`-এ যাবে।

### Bracket সহ

```asm
mov eax, [0x100A]
```

এর অর্থ:

```text
EAX = 0x100A address-এ থাকা value
```

অর্থাৎ:

```text
Address 0x100A
      ↓
Memory-এর value
      ↓
EAX
```

---

## Base + Index × Scale + Offset

এই addressing mode-এর সাধারণ formula:

```text
Effective Address = Base + (Index × Scale) + Offset
```

আমাদের code-এ:

```text
Base   = EBP
Index  = ECX
Scale  = 2
Offset = 4
```

তাই:

```text
EA = EBP + (ECX × 2) + 4
```

---

## সহজভাবে মনে রাখার নিয়ম

```text
EBP       → Base
ECX       → Index
ECX × 2   → Scale
+ 4       → Offset
[ ]       → Memory access
EAX       → Result রাখার register
```

### পুরো Process

```text
mov eax, [ebp + ecx*2 + 4]
                ↓
      EBP + (ECX × 2) + 4
                ↓
        Effective Address
                ↓
       সেই memory access
                ↓
        4-byte value read
                ↓
              EAX
```

---

## গুরুত্বপূর্ণ বিষয়

```asm
mov eax, [ebp + ecx*2 + 4]
```

এখানে **calculated address সরাসরি EAX-এ যাচ্ছে না**।

প্রথমে:

```text
EBP + (ECX × 2) + 4
```

দিয়ে address বের হচ্ছে।

তারপর:

```text
[calculated address]
```

থেকে memory-এর value পড়ছে।

শেষে:

```text
EAX = memory-এর value
```

### এক লাইনে

> **Base + Index × Scale + Offset → Memory Address → Memory Value → EAX**
