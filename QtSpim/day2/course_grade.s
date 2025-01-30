# This program just jumps through all possible grades checking them and 
# either jumping to the next grade, or printing an output and jumping
# to the end

.text 0x00400000

li $v0, 4
la $a0, ask_for_grade
syscall 

li $v0, 5
syscall 

move $t0, $v0 

A:
    blt $t0, 90, B 

    li $v0, 4
    la $a0, A_grade
    syscall 

    j end

B:
    blt $t0, 80, C

    li $v0, 4
    la $a0, B_grade
    syscall 

    j end

C:
    blt $t0, 70, SS

    li $v0, 4
    la $a0, C_grade
    syscall 

    j end

SS:
    li $v0, 4
    la $a0, SS_grade
    syscall 

    j end

end:
    li $v0, 10
    syscall

.data 
    ask_for_grade: .asciiz "What is your grade: "
    A_grade: .asciiz "You got an A"
    B_grade: .asciiz "You got a B"
    C_grade: .asciiz "You got a C"
    SS_grade: .asciiz "Summer school for you!"