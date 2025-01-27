.data
req_days_msg: .asciiz "Number of days to convert: "
out_msg_1: .asciiz "Seconds in "
out_msg_2: .asciiz " days: "

.text 0x00400000

# Send message requsting number of days
li $v0, 4
la $a0, req_days_msg
syscall 

# Collect integer user inputs
li $v0, 5
syscall 
move $t0, $v0 

# Convert to seconds
mul $t1, $t0, 86400

# Send first half of output message
li $v0, 4
la $a0, out_msg_1
syscall 

# Send number of days in the output message
li $v0, 1
move $a0, $t1
syscall 

# Send second half of output message
li $v0, 4
la $a0, out_msg_2
syscall 

# Send number of seconds in that day
li $v0, 1
move $a0, $t1
syscall 

li $v0, 10
syscall