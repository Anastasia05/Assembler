.data
    sentence_p: .space 0x8
    word_counter: .long 0x0
    symbol_counter: .long 0x0

.text

.globl numberwords
.type numberwords, @function

.globl numbersymbols
.type numbersymbols, @function

numberwords:

    movq %rdi, sentence_p

    movl sentence_p, %ebx

    cycle:

            movb (%ebx), %dh
            cmp $0x20, %dh

            jne continue

            add $0x1, word_counter

        continue:

            add $0x1, %ebx
            cmp $0x0, (%ebx)
            jne cycle

    add $0x1, word_counter
    movl word_counter, %eax 
    
    ret


numbersymbols:
    
    movq %rdi, sentence_p

    movl sentence_p, %ebx

    cycle1:

            movb (%ebx), %dh
            cmp $0x20, %dh

            jne continue1

            movl symbol_counter, %ecx
            movl %ecx, (%rsi)
            add $0x4, %rsi
            movl $0x0, symbol_counter

            jmp after_space
            

        continue1:

            add $0x1, symbol_counter

        after_space:

            add $0x1, %ebx
            cmp $0x0, (%ebx)
            jne cycle1

            sub $0x1, symbol_counter
            movl symbol_counter, %ecx
            movl %ecx, (%rsi)
    
    ret
