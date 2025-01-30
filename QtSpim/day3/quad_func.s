.data
input_x_msg: .asciiz "Choose an X value: "
input_a_msg: .asciiz "Choose an A value: "
input_b_msg: .asciiz "Choose an B value: "
input_c_msg: .asciiz "Choose an C value: "
output: .asciiz "Your output: "

.text 0x00400000

main:
    # Collect x
    li $v0, 4
    la $a0, input_x_msg
    syscall 
    li $v0, 5
    syscall 
    move $s0, $v0 

    # Collect a
    li $v0, 4
    la $a0, input_a_msg
    syscall 
    li $v0, 5
    syscall 
    move $s1, $v0 

    # Collect b
    li $v0, 4
    la $a0, input_b_msg
    syscall 
    li $v0, 5
    syscall 
    move $s2, $v0 

    # Collect c
    li $v0, 4
    la $a0, input_c_msg
    syscall 
    li $v0, 5
    syscall 
    move $s3, $v0 

    # Move into arguments
    move $a0, $s0 
    move $a1, $s1 
    move $a2, $s2 
    move $a3, $s3 

    # Execute function and collect return value
    jal quad 
    move $s0, $v0 

    # output the return value
    li $v0, 4 
    la $a0, output
    syscall 

    li $v0, 1
    move $a0, $s0 
    syscall

end:
    li $v0, 10
    syscall 

quad:
    # We were told about this optimized
    # quadratic function, so I implemented
    # it here.
    # a0 - x, a1 - a, a2 - b, a3 - c
    # x(ax + b) + c
    mul $t1, $a0, $a1 # a*x
    add $t1, $t1, $a2 # (a*x) + b
    mul $t1, $t1, $a0 # ((a*x) + b) * x

    add $t0, $a3, $t1 # (((a*x) + b) * x) + c

    move $v0, $t0
    jr $ra