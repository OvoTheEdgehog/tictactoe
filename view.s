.data
  .globl drawBoard
  .globl field1
  .globl field2
  .globl field3
  .globl field4
  .globl field5
  .globl field6
  .globl field7
  .globl field8
  .globl field9
  
  
row: .asciiz "---|---|---"
X: .asciiz "X"
O: .asciiz "O"
vertical: .asciiz "   |   |   "
verticalborder: .asciiz " | "
emptyfield: .asciiz " "
field1: .asciiz " "
field2: .asciiz " "
field3: .asciiz " "
field4: .asciiz " "
field5: .asciiz " "
field6: .asciiz " "
field7: .asciiz " "
field8: .asciiz " "
field9: .asciiz " "

.text
# $a0  Spielfeldadresse
drawBoard:
  # TODO
addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall
  
  li $v0, 4
 la $a0, vertical
 syscall

addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall

li $v0,4
la $a0, emptyfield
syscall

li $v0,4
la $a0, field1
syscall

li $v0,4
la $a0, verticalborder
syscall

li $v0,4
la $a0, field2
syscall

li $v0,4
la $a0, verticalborder
syscall

li $v0,4
la $a0, field3
syscall

addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall

 li $v0, 4
 la $a0, row
 syscall
 
addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall

li $v0,4
la $a0, emptyfield
syscall

li $v0,4
la $a0, field4
syscall

li $v0,4
la $a0, verticalborder
syscall

li $v0,4
la $a0, field5
syscall

li $v0,4
la $a0, verticalborder
syscall

li $v0,4
la $a0, field6
syscall


addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall


 li $v0, 4
 la $a0, row
 syscall
 
addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall

li $v0,4
la $a0, emptyfield
syscall

li $v0,4
la $a0, field7
syscall

li $v0,4
la $a0, verticalborder
syscall

li $v0,4
la $a0, field8
syscall

li $v0,4
la $a0, verticalborder
syscall

li $v0,4
la $a0, field9
syscall

addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall
 
 li $v0, 4
 la $a0, vertical
 syscall
 
 addi $a0, $0 0xA
addi $v0, $0, 0xB
syscall

 li $v0, 10
 syscall
    
  jr $ra

