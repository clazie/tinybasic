5 REM "CHECKERS"
10 REM "Ported by Stefan in 2022"
15 REM
17 REM "Switch on MS style TAB"
18 SET 11,1
20 PRINT "THIS IS THE GAME OF CHECKERS.  THE COMPUTER IS X,"
25 PRINT "AND YOU ARE O.  THE COMPUTER WILL MOVE FIRST."
30 PRINT "SQUARES ARE REFERRED TO BY A COORDINATE SYSTEM."
35 PRINT "(0,0) IS THE LOWER LEFT CORNER"
40 PRINT "(0,7) IS THE UPPER LEFT CORNER"
45 PRINT "(7,0) IS THE LOWER RIGHT CORNER"
50 PRINT "(7,7) IS THE UPPER RIGHT CORNER"
55 PRINT "THE COMPUTER WILL TYPE '+TO' WHEN YOU HAVE ANOTHER"
60 PRINT "JUMP.  TYPE TWO NEGATIVE NUMBERS IF YOU CANNOT JUMP."
65 PRINT:PRINT:PRINT
80 DIM R(4+1),S(7+1,7+1):G=-1:R(0+1)=-99
90 DATA 1,0,1,0,0,0,-1,0,0,1,0,0,0,-1,0,-1,15
120 FOR X=0 TO 7:FOR Y=0 TO 7:READ J:IF J=15 THEN 180
160 S(X+1,Y+1)=J:GOTO 200
180 RESTORE:READ S(X+1,Y+1)
200 NEXT Y: NEXT X
230 FOR X=0 TO 7:FOR Y=0 TO 7:IF S(X+1,Y+1)>-1 THEN 350
310 IF S(X+1,Y+1)=-1 THEN FOR A=-1 TO 1 STEP 2:B=G:GOSUB 650:NEXT A
330 IF S(X+1,Y+1)=-2 THEN FOR A=-1 TO 1 STEP 2:FOR B=-1 TO 1 STEP 2:GOSUB 650:NEXT B: NEXT A
350 NEXT Y: NEXT X:GOTO 1140
650 U=X+A:V=Y+B:IF U<0 OR U>7 OR V<0 OR V>7 THEN 870
740 IF S(U+1,V+1)=0 THEN GOSUB 910:GOTO 870
770 IF S(U+1,V+1)<0 THEN 870
790 U=U+A:V=V+B:IF U<0 OR V<0 OR U>7 OR V>7 THEN 870
850 IF S(U+1,V+1)=0 THEN GOSUB 910
870 RETURN
910 IF V=0 AND S(X+1,Y+1)=-1 THEN Q=Q+2
920 IF ABS(Y-V)=2 THEN Q=Q+5
960 IF Y=7 THEN Q=Q-2
980 IF U=0 OR U=7 THEN Q=Q+1
1030 FOR C=-1 TO 1 STEP 2:IF U+C<0 OR U+C>7 OR V+G<0 THEN 1080
1035 IF S(U+C+1,V+G+1)<0 THEN Q=Q+1:GOTO 1080
1040 IF U-C<0 OR U-C>7 OR V-G>7 THEN 1080
1045 IF S(U+C+1,V+G+1)>0 AND(S(U-C+1,V-G+1)=0 OR(U-C=X AND V-G=Y))THEN Q=Q-2
1080 NEXT C:IF Q>R(0+1)THEN R(0+1)=Q:R(1+1)=X:R(2+1)=Y:R(3+1)=U:R(4+1)=V
1100 Q=0:RETURN
1140 IF R(0+1)=-99 THEN 1880
1230 PRINT "FROM ";R(1+1),R(2+1);" TO ";R(3+1),R(4+1);:R(0+1)=-99
1240 IF R(4+1)=0 THEN S(R(3+1)+1,R(4+1)+1)=-2:GOTO 1420
1250 S(R(3+1)+1,R(4+1)+1)=S(R(1+1)+1,R(2+1)+1)
1310 S(R(1+1)+1,R(2+1)+1)=0:IF ABS(R(1+1)-R(3+1))<>2 THEN 1420
1330 S((R(1+1)+R(3+1))/2+1,(R(2+1)+R(4+1))/2+1)=0
1340 X=R(3+1):Y=R(4+1):IF S(X+1,Y+1)=-1 THEN B=-2:FOR A=-2 TO 2 STEP 4:GOSUB 1370
1350 IF S(X+1,Y+1)=-2 THEN FOR A=-2 TO 2 STEP 4:FOR B=-2 TO 2 STEP 4:GOSUB 1370:NEXT B
1360 NEXT A:IF R(0+1)<>-99 THEN PRINT"TO ";R(3+1),R(4+1);:R(0+1)=-99:GOTO 1240
1365 GOTO 1420
1370 U=X+A:V=Y+B:IF U<0 OR U>7 OR V<0 OR V>7 THEN 1400
1380 IF S(U+1,V+1)=0 AND S(X+A/2+1,Y+B/2+1)>0 THEN GOSUB 910
1400 RETURN
1420 PRINT:PRINT:PRINT:FOR Y=7 TO 0 STEP-1:FOR X=0 TO 7:I=5*X: TAB I
1430 IF S(X+1,Y+1)=0 THEN PRINT".";
1470 IF S(X+1,Y+1)=1 THEN PRINT"O";
1490 IF S(X+1,Y+1)=-1 THEN PRINT"X";
1510 IF S(X+1,Y+1)=-2 THEN PRINT"X*";
1530 IF S(X+1,Y+1)=2 THEN PRINT"O*";
1550 NEXT X:PRINT" ":PRINT:NEXT Y:PRINT
1552 FOR L=0 TO 7
1554 FOR M=0 TO 7
1556 IF S(L+1,M+1)=1 OR S(L+1,M+1)=2 THEN Z=1
1558 IF S(L+1,M+1)=-1 OR S(L+1,M+1)=-2 THEN T=1
1560 NEXT M
1562 NEXT L
1564 IF Z<>1 THEN 1885
1566 IF T<>1 THEN 1880
1570 Z=0: T=0
1590 PRINT "FROM";: GOSUB 5000: E=TX: H=TY: X=E:Y=H:IF S(X+1,Y+1)<=0 THEN 1590
1670 PRINT "TO";: GOSUB 5000: A=TX: B=TY:X=A:Y=B
1680 IF S(X+1,Y+1)=0 AND ABS(A-E)<=2 AND ABS(A-E)=ABS(B-H)THEN 1700
1690 GOTO 1670
1700 I=46
1750 S(A+1,B+1)=S(E+1,H+1):S(E+1,H+1)=0:IF ABS(E-A)<>2 THEN 1810
1800 S((E+A)/2+1,(H+B)/2+1)=0
1802 PRINT "+TO";: GOSUB 5000: A1=TX: B1=TY:IF A1<0 THEN 1810
1804 IF S(A1+1,B1+1)<>0 OR ABS(A1-A)<>2 OR ABS(B1-B)<>2 THEN 1802
1806 E=A:H=B:A=A1:B=B1:I=I+15:GOTO 1750
1810 IF B=7 THEN S(A+1,B+1)=2
1830 GOTO 230
1880 PRINT: PRINT "YOU WIN.": END
1885 PRINT: PRINT "I WIN.": END
5000 REM "Subroutine to read two values"
5010 REM "They are loaded as string and split"
5020 INPUT N$ : IF N$="#" THEN END
5030 @S=0: TX=VAL(N$): IF @S THEN PRINT "ERROR": GOTO 5020
5040 TC=INSTR(N$, ","): IF NOT TC THEN PRINT "ERROR": GOTO 5020
5050 TY=VAL(N$(TC+1)): IF @S THEN PRINT "ERROR": GOTO 5020
5060 RETURN


