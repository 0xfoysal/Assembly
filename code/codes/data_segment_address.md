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


