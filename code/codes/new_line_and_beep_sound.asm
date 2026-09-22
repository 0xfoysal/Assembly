.model small
.stack 100h
.code 

main proc
     
     mov ah,1
     int 21h
     mov bl,al
     
     mov ah,2   ; Character display function
     mov dl,10  ; Line Feed (LF)
     int 21h    ; something todo or Execute DOS function
     mov dl,13  ; Line Feed that means new line
     int 21h    ; call the function -> ah where put number working them     
     
     mov ah,1
     int 21h
     mov bh,al
     
     mov ah,2
     mov dl,bl
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,2
     mov dl,bh
     int 21h
     
     
     
     
     
     
     
     exit:
     mov ah,4ch
     int 21h
     main endp
end main
     
     
