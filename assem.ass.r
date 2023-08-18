.model small
.stack 100h

.data
    matNumber db "PSC1808996$"

.code
    mov ax, @data
    mov ds, ax

    ; Pushing the Mat Number onto the stack
    mov si, offset matNumber
    pusha        ; Save registers
    push si      ; Push the offset of matNumber onto the stack
    call printString ; Call a procedure to print the Mat Number from the stack
    popa         ; Restore registers

    ; Popping the Mat Number from the stack
    pop si       ; Pop the offset of matNumber from the stack
    pusha        ; Save registers
    mov si, offset matNumber  ; Load the offset of matNumber into si
    call printString ; Call a procedure to print the Mat Number from the offset
    popa         ; Restore registers

    mov ah, 4Ch
    int 21h

printString proc
    mov ah, 09h     ; DOS function to print a string
    mov dx, si      ; Load offset of the string to print
    int 21h         ; Call DOS interrupt
    ret
printString endp
end