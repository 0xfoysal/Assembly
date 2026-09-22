.model small
.stack 100h  

.data
num dw 1234h ; dw = define word

.code 
main proc  
    
    mov ax,@data
    mov ds,ax
    
    mov dl,'1'
    mov ah,2
    int 21h
    
    mov dl,'2'
    mov ah,2
    int 21h
    
    mov dl,'3'
    mov ah,2
    int 21h
    
    mov dl,'4'
    mov ah,2
    int 21h    
     
  
     exit:
     mov ah,4ch
     int 21h
     main endp
end main
     
