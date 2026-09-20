.model small
.stack 100h
.code  
.data
m db 'I love Bangladesh$'

main proc  
    
    ; 1-> single key output
    ; 2-> single character output
    ; 9->character string output
     
     mov ax,@data ; .data segment-?? address AX-?
     mov ds,ax
     
     mov ah,9
     lea dx,m ; m is string name
     int 21h  ; call the load effective address
     
     
     ; int type taking input
     mov ah,1
     int 21h
     mov bl,al
             
     
     mov ah,2
     mov dl,bl
     int 21h

     
     exit:
     mov ah,4ch
     int 21h
     main endp
end main
     
     
