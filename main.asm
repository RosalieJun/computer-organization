###use chatGPT for assistance
.data
student_id: .string "s1121513\n"
str1: .string  "Input number A: " 
str2: .string  "Input number B: "
result: .string  "Partial Sum of Cubes = "
equal_sign: .string " = "
perfect_msg: .string "It is a perfect square number\n"
not_perfect_msg: .string "It is not a perfect square number\n"
newline: .string  "\n"
times: .string " * "

.text
.global __start

__start:
    ### Print student ID
    la a0, student_id
    li a7, 4
    ecall

    ### Prompt for number A
    la a0, str1
    li a7, 4
    ecall
    
    ### Read A
    li a7, 5
    ecall
    mv s1, a0  # Store A in s1
    
    ### Prompt for number B
    la a0, str2
    li a7, 4
    ecall
    
    ### Read B
    li a7, 5
    ecall
    mv s2, a0  # Store B in s2
    
    ### Ensure A ? B by swapping if necessary
    bge s1, s2, skip_swap
    mv t0, s1   # temp = A
    mv s1, s2   # A = B
    mv s2, t0   # B = temp
skip_swap:

    ### Initialize sum
    li s3, 0  ### sum = 0
    mv s0, s2 ### i = min(A, B)

loop:
    bgt s0, s1, done  ### if i > max(A, B), exit loop

    ### Compute cube: temp = i * i * i
    mul t0, s0, s0
    mul t0, t0, s0

    ### Add to sum
    add s3, s3, t0

    ### Increment i
    addi s0, s0, 1
    j loop

done:
    ### Print result message: "Partial Sum of Cubes ="
    la a0, result
    li a7, 4
    ecall

    ### Print sum
    mv a0, s3
    li a7, 1
    ecall

    ### Print newline after sum
    la a0, newline
    li a7, 4
    ecall

    ### Check if sum == 0
    beqz s3, handle_zero

    ### Check if sum is a perfect square
    li t0, 1       ### x = 1
    li t1, 0       ### temp

sqrt_loop:
    mul t1, t0, t0  ### temp = x * x
    beq t1, s3, is_perfect   ### If x * x == sum, it's a perfect square
    bgt t1, s3, not_square  ### If x * x > sum, it's NOT a perfect square
    addi t0, t0, 1           ### x++
    j sqrt_loop

handle_zero:
    ### Print "0 = 0 * 0"
    li a0, 0
    li a7, 1
    ecall

    la a0, equal_sign
    li a7, 4
    ecall

    li a0, 0
    li a7, 1
    ecall

    la a0, times
    li a7, 4
    ecall

    li a0, 0
    li a7, 1
    ecall

    la a0, newline
    li a7, 4
    ecall

    ### Print "It is a perfect square number"
    la a0, perfect_msg
    li a7, 4
    ecall
    j end_program

is_perfect:
    ### Print "sum = sqrt * sqrt"
    mv a0, s3
    li a7, 1
    ecall

    la a0, equal_sign
    li a7, 4
    ecall

    mv a0, t0
    li a7, 1
    ecall

    la a0, times
    li a7, 4
    ecall

    mv a0, t0
    li a7, 1
    ecall

    la a0, newline
    li a7, 4
    ecall

    ### Print "It is a perfect square number"
    la a0, perfect_msg
    li a7, 4
    ecall
    j end_program

not_square:  
    ### Print "It is not a perfect square number"
    la a0, not_perfect_msg
    li a7, 4
    ecall

end_program:
    li a7, 10
    ecall
