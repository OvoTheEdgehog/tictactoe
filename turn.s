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
  firstMove:

  
  
  jr    $ra
