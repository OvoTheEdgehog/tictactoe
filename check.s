.data
   .globl testWin
win:		.word 1,2,3,4,5,6,7,8,9,1,4,7,2,5,8,3,6,9,1,5,9,3,5,7	
.text

# a0: die Spielfeldadresse
# a1: welcher Spieler auf Sieg geprueft werden soll 'X' oder 'O'
# return: 0, falls kein Sief, 1: falls Sieg
testWin:
  # TODO
  Move:
  gameOver:
		la $t1, win			
		add $t2, $a0, $zero		
		li $t0, 0			
		
		li $t8, 0			#max x zähler
		li $t9, 0			#imax o zähler
		
winGame:
		beq $t0, 8, noWin		
		
		li $t5, 0			
		li $t6, 0			

firstCheck:
		lw $t3, 0($t1)			
		addi $t3, $t3, -1		
		mul $t3, $t3, 4			
		add $t2, $t2, $t3		
		
		lw $t4, 0($t2)			
		
		sub $t2, $t2, $t3		
		
		bne $t4, 1, noX1
		addi $t5, $t5, 1		
noX1:

		bne $t4, 2, noO1
		addi $t6, $t6, 1		
noO1:

secondCheck:
		lw $t3, 4($t1)			
		addi $t3, $t3, -1		
		mul $t3, $t3, 4			
		add $t2, $t2, $t3		
		
		lw $t4, 0($t2)			
		
		sub $t2, $t2, $t3		
		
		bne $t4, 1, noX2
		addi $t5, $t5, 1		
noX2:

		bne $t4, 2, noO2
		addi $t6, $t6, 1		
noO2:

thirdCheck:
		lw $t3, 8($t1)			
		addi $t3, $t3, -1		
		mul $t3, $t3, 4			
		add $t2, $t2, $t3		
		
		lw $t4, 0($t2)			
		
		sub $t2, $t2, $t3		
		
		bne $t4, 1, noX3
		addi $t5, $t5, 1		
noX3:

		bne $t4, 2, noO3
		addi $t6, $t6, 1		
noO3:

		bne $t5, 3, xNoWin
		li $v0, 10			
		jr $ra
xNoWin:

		bne $t6, 3, oNoWin
		li $v0, -10			
		jr $ra
oNoWin:
		
		add $t1, $t1, 12		
		addi $t0, $t0, 1		
		
		j winGame

noWin:

tieGame:
		li $t0, 0			
		
tieCheck:
		beq $t0, 9, tie			
		
		lw $t3, 0($t2)			

		beqz $t3, notATie
		
		addi $t2, $t2, 4		
		addi $t0, $t0, 1		
		
		j tieCheck

tie:
		li $v0, 0			#0 falls Unentschieden
		jr $ra

notATie:
		la $t1, win			#Addresse von array mit wincombos
		add $t2, $a0, $zero		#
		li $t0, 0			#Counter
		
		li $s6, 0			#Punktezähler
		li $s7, 0			#Punktezähler
		
undone:
		beq $t0, 8, checked		
		
		li $t5, 0			
		li $t6, 0			

firstCheckT:
		lw $t3, 0($t1)			
		addi $t3, $t3, -1		
		mul $t3, $t3, 4			
		add $t2, $t2, $t3		
		
		lw $t4, 0($t2)			
		
		sub $t2, $t2, $t3		
		
		bne $t4, 1, noX1T
		addi $t5, $t5, 1		
noX1T:

		bne $t4, 2, noO1T
		addi $t6, $t6, 1		
noO1T:

secondCheckT:
		lw $t3, 4($t1)			
		addi $t3, $t3, -1		
		mul $t3, $t3, 4			
		add $t2, $t2, $t3		
		
		lw $t4, 0($t2)			
		
		sub $t2, $t2, $t3		
		
		bne $t4, 1, noX2T
		addi $t5, $t5, 1		
noX2T:

		bne $t4, 2, noO2T
		addi $t6, $t6, 1		
noO2T:

thirdCheckT:
		lw $t3, 8($t1)			
		addi $t3, $t3, -1		
		mul $t3, $t3, 4			
		add $t2, $t2, $t3		
		
		lw $t4, 0($t2)			
		
		sub $t2, $t2, $t3		
		
		bne $t4, 1, noX3T
		addi $t5, $t5, 1		
noX3T:

		bne $t4, 2, noO3T
		addi $t6, $t6, 1		
noO3T:

		mul $t8, $t5, $t6		
		add $t9, $t5, $t6		
		
		bnez $t8, prodNot0
		bne $t9, 2, sumNot2		
		bne $t5, 2, not2X		
		addi $v0, $zero, 7
		jr $ra
not2X:
		bne $t6, 2, sumNot2		
		addi $v0, $zero, -9
		jr $ra 
sumNot2:
		bne $t9, 1, prodNot0
		bne $t5, 1, not1X		
		addi $s6, $zero, 5
		j prodNot0
not1X:
		bne $t6, 1, prodNot0		
		addi $s6, $zero, -5		
prodNot0:
		
		bne $t8, 1, prodNot1		
		addi $s7, $zero, 1
prodNot1:					
		bne $t9, 3, notSum3		
		addi $s7, $zero, 1
notSum3:						
																	
		add $t1, $t1, 12		
		addi $t0, $t0, 1		
		
		j undone

checked:

		beqz $s6, lowerPoints		
		add $v0, $zero, $s6
		jr $ra
lowerPoints:
		add $v0, $zero, $s7
		jr $ra
  jr     $ra
 
 
