#   def fun(a,b):
#       return a+b, a-b
#
#   a = 12
#   b = 8
#   c, d = fun(a,b)
#   print(a,b)

.data 
space: .asciiz " "

.text 0x00400000

main:
    li $s0, 12 # a
    li $s1, 8 # b

    move $a0, $s0
    move $a1, $s1

    jal fun

    move $s2, $v0 # c
    move $s3, $v0 # d 

    li $v0, 1
    move $a0, $s0
    syscall 

    li $v0, 4
    la $a0, space 
    syscall 

    li $v0, 1
    move $a0, $s1
    syscall 

end:
    li $v0, 10
    syscall 

fun:
    add $v0, $a0, $a1 
    sub $v1, $a0, $a1 
    jr $ra
    