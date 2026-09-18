.model small
.stack 100h
.code

main proc

    mov ah,1 ; This puts 1 into the AH register. "DOS, I want to read one character from the keyboard."
    int 21h   ; DOS int 21h, the value in AH tells DOS which function you want.
    mov bl,al

    mov ah,1
    int 21h
    mov bh,al

    mov ah,2          ; display character 1st value
    mov dl,bl         ; DL = character to display
    int 21h

    mov ah,2
    mov dl,bh         ; display character 2nd value
    int 21h         


    exit:
    mov ah,4ch        ; exit program
    int 21h
    main endp
end main
