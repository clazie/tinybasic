10 REM "engine code, the pins of the Arduino motor shield"
20 DA=12: SA=3: BA=9
30 DB=13: SB=11: BB=8
40 TP=4: EP=5
100 REM "set the pins, Dx is direction, Bx is break"
110 PINM DA,1: PINM BA,1
120 PINM DB,1: PINM BB,1
130 AWRITE SA,0: AWRITE SB,0
140 PINM TP, 1: PINM EP, 0
200 REM "some parameters, TT is step time, S is speed ie voltage"
210 TT=5
220 S=140
1000 REM "Test code"
1010 INPUT A$
1020 GOSUB 8000: REM "call the turtle"
1030 GOTO 1000
8000 REM "The turtle code: A$ has a set of commands"
8010 REM "Commands f,b,r,l and single digits for the distance"
8020 REM "Prepare, set the speed and directions and hit the break"
8030 DWRITE BA,1: DWRITE BB,1
8040 AWRITE SA,S: AWRITE SB,S
8050 DWRITE DA,0: DWRITE DB,0
8100 REM "every character in A$ is a command"
8110 WHILE LEN(A$)>0
8120 C=A$: A$=A$(2)
8130 IF C=>"0" AND C<="9" THEN TT=C-"0": CONT
8140 SWITCH C
8150 CASE "e": END
8160 CASE "f": DWRITE DA,0: DWRITE DB,0
8170 CASE "b": DWRITE DA,1: DWRITE DB,1
8180 CASE "l": DWRITE DA,0: DWRITE DB,1
8190 CASE "r": DWRITE DA,1: DWRITE DB,0
8200 SWEND
8300 REM "drive a bit, TT says how long"
8310 DWRITE BA,0: DWRITE BB,0
8320 DELAY 100+TT*100
8330 DWRITE BA,1: DWRITE BB,1
8400 REM "Report the distance"
8410 DWRITE TP,0: PULSE TP,10
8420 E=PULSE(EP,1,100)/29*100/2
8430 PRINT "Distance:",E
8500 WEND
8900 RETURN
