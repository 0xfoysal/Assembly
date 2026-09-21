mov dl, 10
এখানে DL register-এ 10 রাখা হচ্ছে।
Decimal 10 এর ASCII value হলো Line Feed (LF)।
```
10 (decimal) = 0Ah (hex)
```
এটি cursor-কে পরের লাইনে নিয়ে যায়।
সহজভাবে:
```
DL = 10
   ↓
Line Feed
   ↓
পরের লাইনে যাও
```


int 21h

এটি DOS-এর Interrupt 21h call করছে। এর মাধ্যমে DOS-কে বলা হচ্ছে:
"AH-তে যে function number আছে, সেই কাজটি করো। AH = 2 . তাই int 21h → DL-এর character display করবে। DL = 10. তাই Line Feed হবে।

```
mov ah, 9
lea dx, msg
int 21h

mov ah, 2
mov dl, 10
int 21h
```
এখানে প্রথমে msg print হবে, তারপর DL = 10 দেওয়ার কারণে cursor পরের লাইনে যাবে।
Note: DOS text-mode programming-এ Windows-এর Enter key-এর সম্পূর্ণ newline সাধারণত CR (13) + LF (10) দিয়ে করা হয়। তাই অনেক ক্ষেত্রে DL=13 এবং DL=10 দুটোই ব্যবহার করা হয়।
