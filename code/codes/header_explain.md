.model small
```
এখানে .model দিয়ে program-এর memory model নির্ধারণ করা হয়।

small মানে:
একটি Code Segment
একটি Data Segment
থাকবে।

সহজভাবে:
.model small = Program-এর code এবং data ছোট/আলাদা segment-এর মধ্যে থাকবে
```

.stack 100h
```
এখানে program-এর জন্য Stack memory নির্ধারণ করা হচ্ছে।
100h হলো hexadecimal value।
100h = 256 bytes
অর্থাৎ:
.stack 100h = Stack-এর জন্য 256 bytes memory reserve করা।
Stack সাধারণত temporary data, function call, return address ইত্যাদির জন্য ব্যবহৃত হয়।
```

.data
```
.data
name db 'Faisal$'
num  db 10

এখানে name এবং num হলো data/variable।
সহজভাবে: .data = যেখানে আমরা variable এবং অন্যান্য data রাখি।
```

.code
```
এখানে program-এর actual instructions/code লেখা হয়।
.code
main proc
    mov ah, 1
    int 21h
main endp
end main
mov, int, add, sub, cmp ইত্যাদি instruction সাধারণত .code section-এর মধ্যে থাকে।
সহজভাবে: যেখানে computer কী কাজ করবে সেই instruction লেখা হয়।
```
