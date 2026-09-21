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

এটি DOS-এর Interrupt 21h call করছে।
এর মাধ্যমে DOS-কে বলা হচ্ছে:
"AH-তে যে function number আছে, সেই কাজটি করো।
AH = 2
তাই int 21h → DL-এর character display করবে।
DL = 10. 
তাই Line Feed হবে।

