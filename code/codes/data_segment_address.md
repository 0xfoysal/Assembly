mov ax, @data; এখানে @data হলো আমাদের .data segment-এর address।
```
.data
    num db 10
```
Assembler যখন program তৈরি করে, তখন .data segment-এর একটি address থাকে।
instruction will - mov ax, @data. </br> .data segment-এর address → AX register-এ রাখো।
```
@data
   ↓
  AX
```
এখন AX-এর মধ্যে .data segment-এর address আছে।
এই address-টি DS register-এ দিতে হবে।
```
AX
 ↓
DS
```
AX-এর value → DS register-এ copy করো।

কেন DS দরকার?
8086-এ DS (Data Segment) register বলে দেয় program-এর data কোথায় আছে
```
Shortcut মনে রাখার নিয়ম:
@data → AX → DS
```
অর্থাৎ:
.data segment-এর address → AX → DS
এটাই এই দুই লাইনের মূল কাজ।


mov ah, 9
এখানে AH register-এ 9 রাখা হচ্ছে। DOS int 21h-এর ক্ষেত্রে:
```
AH = 09h ; মানে string display function।
```
AH = 9 → DOS-কে বলা হচ্ছে, "আমি একটি string display করতে চাই।"


lea dx, m
LEA = Load Effective Address and m is stirng name
```
.data
    m db 'Hello World$'
```
lea dx, m মানে: </br>
m যেখানে memory-তে আছে, সেই address DX register-এ রাখো।
Easily we want to say
```
m (string)
   ↓ address
  DX
```
⚠️ এখানে string-এর actual text DX-এ যাচ্ছে না; string-এর memory address DX-এ যাচ্ছে।
flow is
```
m = "Hello World$"
       ↓
lea dx, m
       ↓
DX = m-এর address
       ↓
AH = 09h
       ↓
int 21h
       ↓
DOS string display করে
       ↓
Hello World
```
⭐ গুরুত্বপূর্ণ
AH = 09h দিয়ে string print করার সময় string-এর শেষে অবশ্যই $ থাকতে হয়।
m db 'Hello World$'
এখানে $ হলো string-এর ending marker। DOS $ দেখলে বুঝে যে string শেষ।

remainder shortcut
```
AH = 9       → String print function
DX = address → কোন string print করবে
INT 21h      → DOS function execute
```
so
```
mov ah,9 → কী কাজ?
lea dx,m → কোন data?
int 21h → কাজটি execute করো।
```



















