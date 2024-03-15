// x = 0
@0 // value of x
D=A // D = 0
@x // address of x
M=D // x = 0

// y = 0
@0 // value of y
D=A // D = 0
@y // address of y
M=D // y = 0

// key = 0
@0 // value of key
D=A // D = 0
@key // address of key
M=D // key = 0

// LSYM = 130
@130 // value of LSYM
D=A // D = 130
@LSYM // address of LSYM
M=D // LSYM = 130

// USYM = 131
@131 // value of USYM
D=A // D = 131
@USYM // address of USYM
M=D // USYM = 131

// RSYM = 132
@132 // value of RSYM
D=A // D = 132
@RSYM // address of RSYM
M=D // RSYM = 132

// DSYM = 133 
@133 // value of DSYM
D=A // D = 133
@DSYM // address of DSYM
M=D // DSYM = 133

(LOOP) // infinite loop

@KBD // address of KBD
D=M // D = KBD
@NOT_PRESSED // go to NOT_PRESSED...
D;JEQ // ...if D = 0

@key // address of key
D=M-D // D = key - KBD
@SAME_KEY // go to SAME_KEY...
D;JEQ // ...if D = 0

@KBD // address of KBD
D=M // D = KBD
@key // address of key
M=D // key = KBD



// clear screen
@SCREEN
D=A

// add x to D
@x
D=D+M

@y
D=D+M
@R13 // use R13 as a temporary register
M=D  // store the result in R13

// set up a counter for the loop
@511 // 512-1 because we've already added y once
D=A
@R14 // use R14 as a counter
M=D

// start of the loop
(Y_LOOP)
@y
D=M

// add y to the result
@R13
M=M+D

// decrement the counter
@R14
M=M-1

// if the counter is not zero, go back to the start of the loop
@R14
D=M
@Y_LOOP
D;JNE

// now R13 contains y*512, add it to D
@R13
D=D+M

// now we have address of line we need to clear
@R13 // use R13 as a temporary register
M=D  // store the address in R13

// set up a counter for the loop
@16
D=A
@R14 // use R14 as a counter
M=D

// start of the loop
(CLEAR_LOOP)

// clear the pixel at the address stored in R13
@R13
A=M  // load the address into A
M=0  // set the memory at that address to 0

// add 512 to the address in R13
@32
D=A
@R13
M=M+D

// decrement the counter
@R14
M=M-1

// if the counter is not zero, go back to the start of the loop
@R14
D=M
@CLEAR_LOOP
D;JNE




@key // address of key
D=M // D = key
@USYM // M = USYM
D=D-M // D = key - USYM
@UP // go to UP...
D;JEQ // ...if D = 0 or key = USYM

@key
D=M
@DSYM
D=D-M
@DOWN
D;JEQ

@key
D=M
@LSYM
D=D-M
@LEFT
D;JEQ

@key
D=M
@RSYM
D=D-M
@RIGHT
D;JEQ

(UP)
@y
M=M-1
@END
0;JMP

(DOWN)
@y
M=M+1
@END
0;JMP

(LEFT)
@x
M=M-1
@END
0;JMP

(RIGHT)
@x
M=M+1
@END
0;JMP

(END)
// if x < 0, set x to 0
@x
D=M
@X_POSITIVE
D;JGE
@x
@0
D=A
@x
M=D
(X_POSITIVE)

// if x > 31, set x to 31
@x
D=M
@31
D=D-A
@X_INBOUND
D;JLE
@31
D=A
@x
M=D
(X_INBOUND)

// if x < 0, set x to 0
@y
D=M
@Y_POSITIVE
D;JGE
@0
D=A
@y
M=D
(Y_POSITIVE)

// if x > 15, set x to 15
@y
D=M
@15
D=D-A
@Y_INBOUND
D;JLE
@15
D=A
@y
M=D
(Y_INBOUND)

@SCREEN
D=A

// add x to D
@x
D=D+M

@y
D=D+M
@R13 // use R13 as a temporary register
M=D  // store the result in R13

// set up a counter for the loop
@511 // 512-1 because we've already added y once
D=A
@R14 // use R14 as a counter
M=D

// start of the loop
(Y_LOOP_DRAW)
@y
D=M

// add y to the result
@R13
M=M+D

// decrement the counter
@R14
M=M-1

// if the counter is not zero, go back to the start of the loop
@R14
D=M
@Y_LOOP_DRAW
D;JNE

// now R13 contains y*512, add it to D
@R13
D=D+M
@R13
M=D

@key // address of key
D=M // D = key
@USYM // M = USYM
D=D-M // D = key - USYM
@DRAW_UP // go to UP...
D;JEQ // ...if D = 0 or key = USYM

@key
D=M
@DSYM
D=D-M
@DRAW_DOWN
D;JEQ

@key
D=M
@LSYM
D=D-M
@DRAW_LEFT
D;JEQ

@key
D=M
@RSYM
D=D-M
@DRAW_RIGHT
D;JEQ



(DRAW_DOWN)

@2016
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@2064
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4104
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5064
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@15420
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@14316
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@20490
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@16962
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@12876
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@14364
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@20466
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@18834
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@14364
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5736
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4488
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@3696
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D


@REAL_END
0;JMP



(DRAW_UP)

@2016
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@2064
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4104
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4104
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@12300
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@14364
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@24570
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@20466
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@13260
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@15420
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@23514
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@22554
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@15420
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@6120
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4488
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@3696
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D


@REAL_END
0;JMP



(DRAW_LEFT)

@2016
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@2064
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4104
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4108
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@14450
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@16268
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@16168
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@6440
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@2056
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5648
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5088
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5312
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5312
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@3872
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@1056
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@960
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D


@REAL_END
0;JMP



(DRAW_RIGHT)

@2016
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@2064
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4104
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@12296
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@19996
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@12796
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5372
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@5272
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@4112
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@2152
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@1992
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@808
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@808
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@1264
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@1056
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D

@960
D=A
@R13
A=M
M=D
@32
D=A
@R13
M=M+D


@REAL_END
0;JMP



(NOT_PRESSED)
@0
D=A
@key
M=D
@REAL_END
0;JMP

(SAME_KEY)
@REAL_END
0;JMP

(REAL_END)
@LOOP
0;JMP