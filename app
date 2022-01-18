;Application: gets a string input from keyboard and deletes the spaces and punctuations from it
;Only ALL CAPS string
.model small
.stack 100h
.data
msg1 db 10,13, 'Input (ALL CAPS): ','$'
msg2 db 10,13, 'Output: ','$'

aux     db ?
.code
  mov  ax, @data
  mov  ds, ax
  
  ;print msg1
  mov dx, offset msg1
  mov ah, 09h
  int 21h    
  mov  di, offset aux 
  
  mov cl,00  
  ;read input
  mov ah,01h

L1:
  int 21h
   
;check if return is pressed.
  cmp  al, 13
  je   finale
;check if there are ALL CAPS letters.
  cmp  al, 65
  jb   is_not_a_letter    ; caracter mai mic de 'A'.
  cmp  al, 90
  ja   is_not_a_letter    ; caracter mai mare de 'Z'.
;copy letter in aux.
  mov  [ di ], al
  inc  di               ; incrementing one position to read the next character
is_not_a_letter:
  inc  cl               
  jmp  L1

finale:  

  mov dx, offset msg2
  mov ah,09h
  int 21h  
  
  mov  [ di ], al        

;prints the output.  
  mov  dx, OFFSET aux
  mov  ah, 9
  int  21h

;end program.
  mov  ax, 4c00h
  int  21h

END
