#Scott Ng
#CPSC 440-04
#Assignment 5
#Due Date: 02/28/18

.data	
      string:  .asciiz    "ABCDEFG"

.text
.globl main

main: 
      la $a0, string                 #loads string into argument0
      li $a1, 6                      #notes our string is 7 spaces
      
      li $t0, 0                      #setting our array[i] counter to 0

loop:
      lb $t1, string($t0)            #loading the corresponding byte (first is A, then B)
      beq $t1, 0, exit               #exits if string[i] = 0
      addi $t1, $t1, 0x20            #if not, add immediate 0x20 to lowercase the array[i] 
      sb $t1, string($t0)            #stores the lowercase array[i] back into the string
      addi $t0, $t0, 1               #increments counter
      j loop                         #jumps back to loop 

exit:
      li $v0, 10                     #loads exit statement
      syscall