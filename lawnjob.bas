10 REM LAWN JOB - MIKE BUHIDAR JR.
16 GOTO11000
17 DIMP(15):P(1)=-40:P(2)=40:P(4)=-1:P(8)=1
20 RN=0:SC=0:CO=54272:HC=0:GOSUB2000:GOSUB200:TI$="000000":GOSUB300
120 BO=128:BC=13:PE=PEEK(56320):JV=15-(PEAND15)
125 IFP=5THENSC=SC+.050001:SC$=STR$(SC):SC$=MID$(SC$,2,4)
127 PRINTTAB(10);SC$;TAB(32);MIDS(TI$,3,2)":";RIGHT$(TI$,2)"{CU}"
130 PP=OP+P(JV):DN=PEEK(PP):P=PEEK(PP+CO)AND15:IFDN<>128THEN400
137 IFJV=0ORJV=5ORJV=6ORJV=9ORJV=10THEN120
140 POKEOP,IO:POKEOP+CO,IC:POKEPP+CO,1:POKEPP,JV+130:OP=PP
145 IO=BO:IC=BC
150 GOTO120
200 REM SOUND INIT.
203 OP=1843:POKEOP,131:POKEOP+CO,1:IO=32:IC=1
210 S=54272:FORA=STOS+24:POKEA,0:NEXT:POKES+24,15:POKES+5,63:POKES+6,255
220 POKES+4,65:POKES+3,10:POKES+2,255:RETURN 
300 REM START MOWER 
305 PRINT"{WH}"TAB(32);MID$(TI$,3,2)":"RIGHT$(TI$,2):PRINT"{CU}{CU}"
310 JV=PEEK(56320):FR=(JVAND16):FORIT=0TO250:NEXT:IFFR=16THEN305 
315 YN=INT(RND(1)*6)+1:IFYN=1THEN340 
320 FORTT=2TO0STEP-1:POKES+1,TT:FORBB=255TO0STEP-5:POKES,BB:POKES,0:NEXT:NEXT 
330 POKES+1,0:GOTO305
340 FORCC=1TO3:POKES+1,CC:FORHH=0TO100:NEXT:NEXT:RETURN 
400 REM COLLISION 
410 IFDN=130THEN500 
420 IFDN=129THEN520 
430 IFDN=133AND(PEAND16)<>16THEN540
450 GOTO120 
500 REM HIT ROCK 
505 FORBC=15TO0STEP-1:POKE53280,BC:NEXT 
510 POKEOP,JV+130:FORB=4TO0STEP-.05:POKES+1,B:NEXT:RN=RN+1:GOSUB300:GOTO120
520 REM WALK ON SIDEWALK 
530 BO=129:BC=15:GOTO137 
540 REM CHECK FOR COMPLETE JOB
545 LL=0:PRINT"{CU}(CU}(CU}LOOKING OVER YOUR WORK." 
546 FORGG=1TO0:POKES+1,GG:FORYY=255TO0STEP-1:POKES,YY:NEXT:NEXT:POKES+1,0 
550 FORV=1024TO2023:PV=PEEK(V+CO)AND15:GOSUB560:NEXT 
552 IFLL=MMTHEN600 
555 PRINT"{CU}    YOU HAVE NOT FINISHED THE JOB!" 
556 FORG=0TO3000:NEXT:PRINT"{CU}                                      {CD}{CD}" 
558 GOSUB300:GOTO120
560 IFPV=5THENLL=LL+1 
570 RETURN 
600 REM END OF GAME
605 FS=VAL(SC$)-VAL(TI$)/100-.50*RN:IFFS>HSTHENHS=FS
610 POKES+1,0:POKE53281,0:PRINT"{SC}{WH}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}"
615 IFFS<0THEN700 
620 PRINTTAB(6)"GREAT JOB, YOU EARNED $";FS 
625 PRINT:PRINTTAB(10)"HIGHEST EARNING $";HS
630 PRINT"{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CY}";:PRINTTAB(8)"PRESS TRIGGER TO PLAY AGAIN" 
640 AA=PEEK(56320)AND16:IFAA=0THEN20 
650 GOTO640 
700 PRINT"{CU} YOUR EXPENSES OUTWEIGHED YOUR EARNING!" 
710 PRINTTAB(5)"FIND ANOTHER WAY TO EARN MONEY!":GOTO630
2000 REM INITIALAZATION OF SCREEN 
2003 POKE53281,0:POKE53280,0:POKE53265,PEEK(53265)AND239
2005 PRINT"{SC}{WH}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}":PRINTTAB(2)"SCORE:  0"TAB(25)"TIME:  "; 
2010 POKE53281,5:POKE53280,0:POKE53281,9 
2015 FORB5=1464TO1783:POKEB5,128:POKEB5+CO,5:NEXT 
2016 FORC2=1247TO1447STEP40:POKEC2,128:POKEC2+CO,5:NEXT 
2017 FORC3=1248TO1448STEP40:POKEC3,128:POKEC3+CO,5:NEXT 
2018 FORC4=1249TO1449STEP4O:POKEC4,128:POKEC4+CO,5:NEXT 
2019 FORC5=1250TO1450STEP40:POKEC5,128:POKEC5+CO,5:NEXT 
2020 FORC6=1310TO1326:POKEC6,128:POKEC6+CO,5:NEXT 
2021 FORC7=1350TO1366:POKEC7,128:POKEC7+CO,5:NEXT 
2022 FORC8=1390TO1406:POKEC8,128:POKEC8+CO,5:NEXT 
2023 FORC9=1430TO1446:POKEC9,128:POKEC9+CO,5:NEXT 
2029 FORA1=1864TO1903:POKEA1,69:POKEA1+CO,0:NEXT 
2030 FORA2=1784TO1823:POKEA2,129:POKEA2+CO,15:NEXT 
2040 FORA3=1323TO1801STEP40:POKEA3,129:POKEA3+CO,15:NEXT 
2050 FORA4=1324TO1328:POKEA4,129:POKEA4+CO,15:NEXT 
2060 POKE1288,129:POKE1288+CO,15:FORZ1=1247TO1250:POKEZ1,133:POKEZ1+CO,12:NEXT
2070 FORA5=1028TO1148STEP40:POKEA5,116:POKEA5+CO,HC:NEXT 
2080 POKE1188,76:POKE1188+CO,HC 
2090 FORA6=1189TO1210:POKEA6,111:POKEA6+CO,HC:NEXT 
3000 FORA7=1251TO1451STEP40:POKEA7,116:POKEA7+CO,HC:NEXT 
3010 FORA8=1211TO1055STEP-39:POKEA8,78:POKEA8+CO,HC:NEXT 
3020 FORA9=1492TO1499:POKEA9,111:POKEA9+CO,HC:NEXT 
3030 POKE1491,76:POKE1491+CO,HC:POKE1496,76:POKE1496+CO,HC 
3040 FORB1=1056TO1456STEP40:POKEB1,116:POKEB1+CO,HC:NEXT 
3050 POKE1500,122:POKE1500+CO,HC 
3060 FORB2=1060TO1460STEP40:POKEB2,106:POKEB2+CO,HC:NEXT 
3070 FORB3=1271TO1285:POKEB3,67:POKEB3+CO,12:NEXT 
3080 POKE1270,74:POKE1270+CO,12:POKE1286,75:POKE1286+CO,12 
3090 POKE1230,93:POKE1230+CO,12:POKE1246,93:POKE1246+CO,12 
3100 FORB4=1231TO12A5STEP2:POKEB4,135:POKEB4+CO,7:NEXT 
3110 FORB6=1024TO1424STEP40:POKEB6,128:POKEB6+CO,5:NEXT
3120 FORB7=1025TO1425STEP40:POKEB7,128:POKEB7+CO,5:NEXT 
3130 FORB8=1026TO1426STEP40:POKEB8,128:POKEB8+CO,5:NEXT 
3140 FORB9=1027TO1427STEP40:POKEB9,128:POKEB9+CO,5:NEXT 
3150 FORB9=1228TO1428STEP40:POKEB9,128:POKEB9+CO,5:NEXT 
3160 FORC1=1229TO1429STEP40:POKEC1,128:POKEC1+CO,5:NEXT 
3170 FORD1=1061TO1461STEP40:POKED1,128:POKED1+CO,5:NEXT 
3180 FORD2=1062TO1462STEP40:POKED2,128:POKED2+CO,5:NEXT 
3190 FORD3=1063TO1463STEP40:POKED3,128:POKED3+CO,5:NEXT 
3195 FORE1=1024TO1744STEP40:POKEE1,72:POKEE1+CO,1:NEXT 
3197 FORE2=1063TO1783STEP40:POKEE2,71:POKEE2+CO,1:NEXT
3199 MM=INT(RND(1)*10)+10 
3200 FORTT=1TOMM 
3210 RP=INT(RND(1)*1000)+1024
3220 IFPEEK(RP)<>128THEN3210 
3221 IFPEEK(RP-1)=130THEN3210 
3222 IFPEEK(RP+1)=130THEN3210 
3223 IFPEEK(RP+39)=130THEN321O 
3224 IFPEEK(RP+41)=130THEN3210 
3225 IFPEEK(RP-41)=130THEN3210 
3226 IFPEEK(RP-39)=130THEN3210 
3230 POKERP,130:NEXTTT 
4000 POKE53265,PEEK(53265)OR16 
9999 RETURN 
11000 REM REDEFINE CHARACTERS 
11001 IFPEEK(12288)=60THEN11045 
11004 POKE53280,0:POKE53281,0:PRINT"{SC}"
11005 PRINTTAB(16)"{LG}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}LAWN JOB":PRINTTAB(19)"{WH}{CD}BY" 
11006 PRINTTAB(12)"{CD}MIKE BUHIDAR JR."
11007 PRINT"{CY}{CD}{CD}{CD}{CD}{CD}{CD}{CD}{CD}REDEFINING CHARACTERS, PLEASE WAIT..."
11010 PRINTCHR$(142):POKE52,48:POKE56,48:CLR:POKE56334,PEEK(56334)AND254
11020 POKE1,PEEK(1)AND251 
11025 FORCH=0TO1023:POKECH+12288,PEEK(CH+53248):NEXT 
11030 FORCD=0TO87:READD:POKECD+13312,D:NEXT 
11040 POKE1,PEEK(1)OR4:POKE56334,PEEK(56334)OR1 
11045 POKE53272,(PEEK(53272)AND240)+12 
11050 GOTO17 
12000 REM DATA FOR CHARACTERS 
12010 DATA173,255,219,254,183,253,111,255 
12020 DATA255,255,255,255,255,255,255,255 
12030 DATA255,239,231,227,195,193,126,255 
12040 DATA255,231,231,189,36,126,102,60 
12050 DATA60,102,126,36,189,231,231,255 
12060 DATA255,255,255,255,255,255,255,255 
12070 DATA240,230,255,149,149,255,230,240 
12080 DATA0,28,54,28,8,42,28,0 
12090 DATA0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
12110 DATA15,103,255,169,169,255,103,15 