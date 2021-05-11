.data
  .globl takeTurn
.text
# - Argumente -
# a0: erste Spielfeldadresse
# a1: ASCII Zeichen des aktuellen Spielers
# a2: ASCII Zeichen der Zeile
# a3: ASCII Zeichen der Spalte
# - Verhalten -
# Setzt das Zeichen des Spielers in $a1 auf die Position Zeile $a2, Spalte $a3, falls dies ein gueltiger Zug ist
# - Rueckgabe -
# Ist der eingegebene Zug ungueltig, wird 1 zurueckgegeben. Das Spielfeld bleibt unveraendert.
# Ist der Zug gueltig, wird 0 zurueckgegeben
#
takeTurn:
  # TODO
 ########################### a1 wird gemoved zu irgend nem s ->  
 Zeile1:
 bne $a2 30 Zeile2
 la $a2, ($a1)
 b Z1Spalte1
 
 Z1Spalte1:
 bne $a3, 30 Z1Spalte2
 la $a3, ($a1)
 sw $a3, field1
   b Gueltig
   
 Z1Spalte2:
 bne $a3, 31 Z1Spalte3
 la $a3, ($a1)
 sw $a3, field2
  b Gueltig
  
 Z1Spalte3:
 bne $a3, 32 Ungueltig
 la $a3, ($a1)
 sw $a3, field3
 b Gueltig
 
 
 Zeile2:
 bne $a2 31 Zeile3
 la $a2, ($a1)
 b Z2Spalte1
 
 Z2Spalte1:
 bne $a3, 30 Z2Spalte2
 la $a3, ($a1)
 sw $a3, field4
 b Gueltig
 
 Z2Spalte2:
 bne $a3, 31 Z2Spalte3
 la $a3, ($a1)
 sw $a3, field5
 b Gueltig
 
 Z2Spalte3:
 bne $a3, 32 Ungueltig
 la $a3, ($a1)
 sw $a3, field6
 b Gueltig
 
 
 Zeile3:
 bne $a2, 32 Ungueltig
 la $a2, ($a1)
 b Z3Spalte1
 
 Z3Spalte1:
 bne $a3, 30 Z3Spalte2
 la $a3, ($a1)
 sw $a3, field7
 b Gueltig
 
 Z3Spalte2:
 bne $a3, 31 Z3Spalte3
 la $a3, ($a1)
 sw $a3, field8
 b Gueltig
 
 Z3Spalte3:
 bne $a3, 32 Ungueltig
 la $a3, ($a1)
 sw $a3, field9
 b Gueltig
 
 
 Gueltig:
li $v0, 4
li $s5, 0
syscall
Ungueltig:
li $v0, 4
li $s5, 1
syscall

 
End:
li $v0, 10
syscall
  
  
  jr    $ra
