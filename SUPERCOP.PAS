PROGRAM SUPERCOP;
{
	PROGRAMMED by Fred Rousseau
	DESIGN by Alex GOUVERNEUR
	
	probably compiled with Turbo Pascal verison 3.01A

	https://www.youtube.com/watch?v=4ZJ131Wi3Cc
}

{$I GRAPH.P}

CONST
	KBD_LEFT  = #75;
	KBD_RIGHT = #77;
	KBD_UP    = #72;
	KBD_DOWN  = #80;
	KBD_HOME  = #71;
	KBD_END   = #79;
	KBD_PGUP  = #73;
	KBD_PGDN  = #81;
	KBD_INS   = #82;

TYPE
	t_0C8 = ARRAY[0..$c7] OF BYTE;
	t_190 = ARRAY[0..$18f] OF BYTE;
	t_0A0 = ARRAY[0..$9f] OF BYTE;
	t_028 = ARRAY[0..$27] OF BYTE;
	t_0B4 = ARRAY[0..$b3] OF BYTE;
	t_BG = ARRAY[0..$bb7] OF BYTE;
	t_4000 = ARRAY[0..$3fff] OF BYTE;
	tAA_Canon = RECORD
		_thresholdX:ARRAY[1..5] OF INTEGER;
		_x,_y:INTEGER;
		_shootX,_shootY:INTEGER;
	END;

VAR
	{0260}g_fPosX:REAL;
	{0266}g_fPosY:REAL;
	{026C}g_heliAnimCounter:INTEGER;{animation counter}
	{026E}g_barrierY:INTEGER;
	{0270}g_bkupBarrierY:INTEGER;
	{0272}g_shootX:INTEGER;
	{0274}g_shootY:INTEGER;
	{0276}g_explosionX:INTEGER;
	{0278}g_explosionY:INTEGER;
	{027A}g_barrierX:INTEGER;
	{027C}g_loopCount:INTEGER;
	{027E}g_difficulty:INTEGER;
	{-- --}
	{0280}g_ball1IncrX:INTEGER;
	{0282}g_ball1IncrY:INTEGER;
	__0284:INTEGER;
	{0286}g_ball1MinX:INTEGER;
	{0288}g_ball1MaxX:INTEGER;
	{028A}g_ball1MinY:INTEGER;
	D_028C:INTEGER;{set/unused: maybe related to ball #1?}
	{-- --}
	D_028E:INTEGER;{for explosion sfx}
	{0290}g_score:INTEGER;
	{0292}g_prevScore:INTEGER;
	{0294}g_stage:INTEGER;
	{0296}g_fuel:INTEGER;
	D_0298:INTEGER;{fuel:temp}
	{029A}g_lives:INTEGER;
	{029C}g_barrierPower:INTEGER;
	D_029E:INTEGER;
	D_02A0:INTEGER;
	{-- --}
	{02A2}g_ball1OriginX:INTEGER;
	{02A4}g_ball1OriginY:INTEGER;
	{02A6}g_ball1X:INTEGER;
	{02A8}g_ball1Y:INTEGER;
	{-- --}
	{02AA}g_Ball2OriginX:INTEGER;
	{02AC}g_Ball2OriginY:INTEGER;
	{02AE}g_ball2X:INTEGER;
	{02B0}g_ball2Y:INTEGER;
	{02B2}g_ball2IncrX:INTEGER;
	{02B4}g_ball2IncrY:INTEGER;
	{02B6}g_ball2MinX:INTEGER;
	{02B8}g_ball2MaxX:INTEGER;
	{02BA}g_ball2MinY:INTEGER;
	{-- --}
	D_02BC:INTEGER;
	{02BE}g_speedParam:INTEGER;
	{02C0}g_optDiff:INTEGER;
	{-- PICS --}
	D_02C2:t_0C8;{helico 16 - }
	D_038A:t_0C8;{helico 1 - facing right (1)}
	D_0452:t_0C8;{helico 2 - facing right (2)}
	D_051A:t_0C8;{helico 3 - facing right (3)}
	D_05E2:t_0C8;{helico 4 - facing left (1)}
	D_06AA:t_0C8;{helico 5 - facing left (2)}
	D_0772:t_0C8;{helico 6 - facing left (3)}
	D_083A:t_0C8;{helico 7 - rot facing right (1)}
	D_0902:t_0C8;{helico 8 - rot facing right (2)}
	D_09CA:t_0C8;{helico 9 - rot facing right (3)}
	D_0A92:t_0C8;{helico 10 - rot facing left (1)}
	D_0B5A:t_0C8;{helico 11 - rot facing left (2)}
	D_0C22:t_0C8;{helico 12 - rot facing left (3)}
	D_0CEA:t_0C8;{helico 13 - rot facing front (1)}
	D_0DB2:t_0C8;{helico 14 - rot facing front (2)}
	D_0E7A:t_0C8;{helico 15 - rot facing front (3)}
	D_0F42:t_190;{exp heli 6 - }
	D_10D2:t_190;{exp heli 7 - barrier (1)}
	D_1262:t_190;{exp heli 8 - barrier (2)}
	D_13F2:t_190;{exp heli 9 - barrier (3)}
	D_1582:t_190;{exp heli 10 - logo "LA CINQ"}
	D_1712:t_0C8;{helico 17 - oil}
	D_17DA:t_0C8;{helico 18 - }
	D_18A2:ARRAY[0..$4af] OF BYTE;{TODO check size}
	D_1D52:t_0A0;{jeep 1}
	D_1DF2:t_0A0;{jeep 2}
	D_1E92:t_0A0;{jeep 4}
	D_1F32:t_0A0;{jeep 5}
	D_1FD2:t_0A0;{jeep 7}
	D_2072:t_0A0;{jeep 8}
	D_2112:t_0A0;{jeep 6}
	D_21B2:t_0A0;{jeep 3}
	D_2252:t_0A0;{jeep 9}
	D_22F2:t_0A0;{jeep 10}
	D_2392:t_028;{bomb 1}
	D_23BA:t_028;{bomb 2}
	D_23E2:t_0B4;{exp jeep 1}
	D_2496:t_0B4;{exp jeep 2}
	D_254A:t_0B4;{exp jeep 3}
	D_25FE:t_0B4;{exp jeep 4}
	D_26B2:t_0B4;{exp jeep 5}
	D_2766:t_190;{exp heli 5}
	D_28F6:t_190;{exp heli 1}
	D_2A86:t_190;{exp heli 2}
	D_2C16:t_190;{exp heli 3}
	D_2DA6:t_190;{exp heli 4}
	{2F36}g_BG1_2:t_BG;
	{3AEE}g_BG3:t_BG;
	{46A6}g_BG4:t_BG;
	{525E}g_BG5:t_BG;
	{5E16}g_BG6:t_BG;
	{69CE}g_BG7:t_BG;
	{7586}g_BG8:t_BG;
	{-- --}
	{813E}g_char:CHAR;
	{813F}g_prevChar:CHAR;
	{8140}g_bkupChar:CHAR;
	{8141}g_fHeliDir:REAL;{why REAL instead of BOOL?}
	{8147}g_fExplAnimCounter:REAL;
	{814D}g_fHeliExplAnimCounter:REAL;
	{8153}g_fFuelCounter:REAL;
	{8159}g_fAAShoot1XIncr:REAL;
	{815F}g_fAAShoot1X:REAL;
	{8165}g_fAAShoot2XIncr:REAL;
	{816B}g_fAAShoot2X:REAL;
	{8171}g_bShootOn:BOOLEAN;
	{8172}g_bStageCleared:BOOLEAN;
	{8173}g_doExplosion:BOOLEAN;
	{8174}g_bFuelBonus:BOOLEAN;
	{-- --}
	{8175}g_bAA_On:ARRAY[1..2] OF BOOLEAN;
	{8177}g_bAA_ShootOn:ARRAY[1..2] OF BOOLEAN;
	{-- --}
	{8179}g_bBarrierdOn:BOOLEAN;
	{817A}g_bLooseLife :BOOLEAN;
	{817B}g_bSound:BOOLEAN;
	{817C}g_bIsP2_turn:BOOLEAN;
	{817D}g_bRotateLeft:BOOLEAN;
	{817E}g_bRotateRight:BOOLEAN;
	{817F}g_bBallOn:ARRAY[1..2] OF BOOLEAN;
	{8181}g_bBallDestroyed:ARRAY[1..2] OF BOOLEAN;
	{8183}g_bMovingBarrier:BOOLEAN;
	D_8184:BOOLEAN;
	{8185}g_2Players:BOOLEAN;
	{8186}g_P_gameOver:ARRAY[1..2] OF BOOLEAN;
	{8188}g_enemyCount:INTEGER;
	{818A}g_AA_1:tAA_Canon;
	{819C}g_P1_loopCount:INTEGER;
	{819E}g_P1_difficulty:INTEGER;
	{81A0}g_P2_loopCount:INTEGER;
	{81A2}g_P2_difficulty:INTEGER;
	{81A4}g_AA_2:tAA_Canon;
	{81B6}g_P_lives:ARRAY[1..2] OF INTEGER;
	{81BA}g_P_score:ARRAY[1..2] OF INTEGER;
	{81BE}g_P_stage:ARRAY[1..2] OF INTEGER;
	{-- melody --}
	D_81C2:ARRAY[1..29] OF INTEGER;
	D_81FC:ARRAY[1..29] OF INTEGER;
	D_8236:ARRAY[1..15] OF INTEGER;
	D_8254:ARRAY[1..15] OF INTEGER;
	__8272:ARRAY[0..$31f] OF BYTE;
	D_8592:INTEGER;
	__8594:INTEGER;
	D_8596:INTEGER;
	__8598:INTEGER;
	{-- --}
	D_859A:t_4000;
	{-- --}
	D_C59A:FILE OF t_4000;{image}
	D_C5E6:FILE OF t_0C8;{helico}
	D_C632:FILE OF t_190;{EXHE}
	D_C67E:FILE OF t_0A0;{JEEP}
	D_C6CA:FILE OF t_028;{BOMB}
	D_C716:FILE OF t_0B4;{EXPJEEP}
	D_C762:FILE OF t_BG;{TABLEAUX}
{__C7AE}

{41AD}PROCEDURE Melody;
LABEL C_45C0;
BEGIN
	D_81FC[1] := 1500 DIV 10;
	D_81FC[2] := 500 DIV 10;
	D_81FC[3] := 2000 DIV 10;
	D_81FC[4] := 1500 DIV 10;
	D_81FC[5] := 2500 DIV 10;
	D_81FC[6] := 1000 DIV 10;
	D_81FC[7] := 2500 DIV 10;
	D_81FC[8] := 1500 DIV 10;
	D_81FC[9] := 1250 DIV 10;
	D_81FC[10] := 2500 DIV 10;
	D_81FC[11] := 2000 DIV 10;
	D_81FC[12] := 1500 DIV 10;
	D_81FC[13] := 1500 DIV 10;
	D_81FC[14] := 1250 DIV 10;
	D_81FC[15] := 2500 DIV 10;
	D_81FC[16] := 2000 DIV 10;
	D_81FC[17] := 2000 DIV 10;
	D_81FC[18] := 1500 DIV 10;
	D_81FC[19] := 3500 DIV 10;
	D_81FC[20] := 1500 DIV 10;
	D_81FC[21] := 2500 DIV 10;
	D_81FC[22] := 1250 DIV 10;
	D_81FC[23] := 2500 DIV 10;
	D_81FC[24] := 1500 DIV 10;
	D_81FC[25] := 2500 DIV 10;
	D_81FC[26] := 100 DIV 10;
	D_81FC[27] := 2500 DIV 10;
	D_81FC[28] := 4500 DIV 10;
	D_81FC[29] := 2500 DIV 10;

	D_81C2[1] := 185;{E3}
	D_81C2[2] := 0;
	D_81C2[3] := 196;{G3}
	D_81C2[4] := 208;{G#3}
	D_81C2[5] := 220;{A3}
	D_81C2[6] := 0;
	D_81C2[7] := 262;{C4}
	D_81C2[8] := 247;{B3}
	D_81C2[9] := 196;{G3}
	D_81C2[10] := 220;{A3}
	D_81C2[11] := 0;
	D_81C2[12] := 262;{C4}
	D_81C2[13] := 247;{B3}
	D_81C2[14] := 196;{G3}
	D_81C2[15] := 220;{A3}
	D_81C2[16] := 0;
	D_81C2[17] := 196;{G3}
	D_81C2[18] := 247;{B3}
	D_81C2[19] := 185;{F#3}
	D_81C2[20] := 0;
	D_81C2[21] := 165;{E3}
	D_81C2[22] := 0;
	D_81C2[23] := 147;{D3}
	D_81C2[24] := 165;{E3}
	D_81C2[25] := 139;{C#3}
	D_81C2[26] := 0;
	D_81C2[27] := 110;{A2}
	D_81C2[28] := 123;{B2}
	D_81C2[29] := 0;

	D_8236[1] := 988; D_8254[1] := 3500 DIV 10;
	D_8236[2] := 1178; D_8254[2] := 3500 DIV 10;
	D_8236[3] := 1480; D_8254[3] := 3500 DIV 10;
	D_8236[4] := 1760; D_8254[4] := 3750 DIV 10;
	D_8236[5] := 1661; D_8254[5] := 5000 DIV 10;
	D_8236[6] := 0; D_8254[6] := 2500 DIV 10;
	D_8236[7] := 1480; D_8254[7] := 2750 DIV 10;
	D_8236[8] := 1319; D_8254[8] := 3500 DIV 10;
	D_8236[9] := 1109; D_8254[9] := 3000 DIV 10;
	D_8236[10] := 1178; D_8254[10] := 4000 DIV 10;
	D_8236[11] := 1480; D_8254[11] := 3250 DIV 10;
	D_8236[12] := 1760; D_8254[12] := 4000 DIV 10;
	D_8236[13] := 2217; D_8254[13] := 4500 DIV 10;
	D_8236[14] := 1976; D_8254[14] := 10000 DIV 10;
	D_8236[15] := 0; D_8254[15] := 3500 DIV 10;
	
	FOR D_8596 := 1 TO 2
	DO FOR D_8592 := 1 TO 29
	DO BEGIN
		IF D_81C2[D_8592] <> 0
		THEN BEGIN
			IF KEYPRESSED
			THEN GOTO C_45C0;
			SOUND(D_81C2[D_8592]);
			DELAY(D_81FC[D_8592]);
		END ELSE BEGIN
			NOSOUND;
			DELAY(D_81FC[D_8592]);
		END;
	END;

	FOR D_8592 := 1 TO 15
	DO BEGIN
		IF D_8236[D_8592] <> 0
		THEN BEGIN
			IF KEYPRESSED
			THEN GOTO C_45C0;
			SOUND(D_8236[D_8592]);
			DELAY(D_8254[D_8592]);
		END ELSE BEGIN
			NOSOUND;
			DELAY(D_8254[D_8592]);
		END;
	END;
C_45C0:
	NOSOUND;
END;

{$I STAGES.INC}

{5C75}PROCEDURE LoadResources;
BEGIN
	WRITE('LOAD GAME : ');

	ASSIGN(D_C5E6, 'helico.scr');
	RESET(D_C5E6);
	WRITE('.'); READ(D_C5E6, D_038A);
	WRITE('.'); READ(D_C5E6, D_0452);
	WRITE('.'); READ(D_C5E6, D_051A);
	WRITE('.'); READ(D_C5E6, D_05E2);
	WRITE('.'); READ(D_C5E6, D_06AA);
	WRITE('.'); READ(D_C5E6, D_0772);
	WRITE('.'); READ(D_C5E6, D_083A);
	WRITE('.'); READ(D_C5E6, D_0902);
	WRITE('.'); READ(D_C5E6, D_09CA);
	WRITE('.'); READ(D_C5E6, D_0A92);
	WRITE('.'); READ(D_C5E6, D_0B5A);
	WRITE('.'); READ(D_C5E6, D_0C22);
	WRITE('.'); READ(D_C5E6, D_0CEA);
	WRITE('.'); READ(D_C5E6, D_0DB2);
	WRITE('.'); READ(D_C5E6, D_0E7A);
	WRITE('.'); READ(D_C5E6, D_02C2);
	WRITE('.'); READ(D_C5E6, D_1712);
	WRITE('.'); READ(D_C5E6, D_17DA);
	CLOSE(D_C5E6);

	ASSIGN(D_C6CA, 'BOMB.scr');
	RESET(D_C6CA);
	WRITE('.'); READ(D_C6CA, D_2392);
	WRITE('.'); READ(D_C6CA, D_23BA);
	CLOSE(D_C6CA);

	ASSIGN(D_C67E, 'JEEP.scr');
	RESET(D_C67E);
	WRITE('.'); READ(D_C67E, D_1D52);
	WRITE('.'); READ(D_C67E, D_1DF2);
	WRITE('.'); READ(D_C67E, D_21B2);
	WRITE('.'); READ(D_C67E, D_1E92);
	WRITE('.'); READ(D_C67E, D_1F32);
	WRITE('.'); READ(D_C67E, D_2112);
	WRITE('.'); READ(D_C67E, D_1FD2);
	WRITE('.'); READ(D_C67E, D_2072);
	WRITE('.'); READ(D_C67E, D_2252);
	WRITE('.'); READ(D_C67E, D_22F2);
	CLOSE(D_C67E);

	ASSIGN(D_C716, 'EXPJEEP.scr');
	RESET(D_C716);
	WRITE('.'); READ(D_C716, D_23E2);
	WRITE('.'); READ(D_C716, D_2496);
	WRITE('.'); READ(D_C716, D_254A);
	WRITE('.'); READ(D_C716, D_25FE);
	WRITE('.'); READ(D_C716, D_26B2);
	CLOSE(D_C716);

	ASSIGN(D_C632, 'EXHE.scr');
	RESET(D_C632);
	WRITE('.'); READ(D_C632, D_28F6);
	WRITE('.'); READ(D_C632, D_2A86);
	WRITE('.'); READ(D_C632, D_2C16);
	WRITE('.'); READ(D_C632, D_2DA6);
	WRITE('.'); READ(D_C632, D_2766);
	WRITE('.'); READ(D_C632, D_0F42);
	WRITE('.'); READ(D_C632, D_10D2);
	WRITE('.'); READ(D_C632, D_1262);
	WRITE('.'); READ(D_C632, D_13F2);
	WRITE('.'); READ(D_C632, D_1582);
	CLOSE(D_C632);

	ASSIGN(D_C762, 'TABLEAUX.scr');
	RESET(D_C762);
	WRITE('.'); READ(D_C762, g_BG1_2);
	WRITE('.'); READ(D_C762, g_BG3);
	WRITE('.'); READ(D_C762, g_BG4);
	WRITE('.'); READ(D_C762, g_BG5);
	WRITE('.'); READ(D_C762, g_BG6);
	WRITE('.'); READ(D_C762, g_BG7);
	WRITE('.'); READ(D_C762, g_BG8);
	CLOSE(D_C762);
END;

{6458}PROCEDURE DrawHeliRotRight;
BEGIN
	IF g_bRotateLeft = TRUE
	THEN D_029E := D_02A0;
	{-- facing left --}
	IF D_029E < (D_02A0 DIV 3)
	THEN BEGIN
		IF g_heliAnimCounter = 1
		THEN PutPic(D_0A92, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 2
		THEN PutPic(D_0B5A, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 3
		THEN PutPic(D_0C22, TRUNC(g_fPosX), TRUNC(g_fPosY));
	END;
	{-- facing front --}
	IF
		(D_029E >= (D_02A0 DIV 3)) AND
		(D_029E < (2 * (D_02A0 DIV 3)))
	THEN BEGIN
		IF g_heliAnimCounter = 1
		THEN PutPic(D_0CEA, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 2
		THEN PutPic(D_0DB2, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 3
		THEN PutPic(D_0E7A, TRUNC(g_fPosX), TRUNC(g_fPosY));
	END;
	{-- facing right --}
	IF
		(D_029E >= (2 * (D_02A0 DIV 3))) AND
		(D_029E < D_02A0)
	THEN BEGIN
		IF g_heliAnimCounter = 1
		THEN PutPic(D_083A, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 2
		THEN PutPic(D_0902, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 3
		THEN PutPic(D_09CA, TRUNC(g_fPosX), TRUNC(g_fPosY));
	END;
	IF D_029E = D_02A0
	THEN BEGIN
		D_029E := 0;
		g_bRotateRight := FALSE;
	END;
END;

{66C4}PROCEDURE DrawHeliRotLeft;
BEGIN
	IF g_bRotateRight = TRUE
	THEN D_029E := D_02A0;
	{-- facing right --}
	IF D_029E < (D_02A0 DIV 3)
	THEN BEGIN
		IF g_heliAnimCounter = 1
		THEN PutPic(D_083A, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 2
		THEN PutPic(D_0902, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 3
		THEN PutPic(D_09CA, TRUNC(g_fPosX), TRUNC(g_fPosY));
	END;
	{-- facing front --}
	IF
		(D_029E >= (D_02A0 DIV 3)) AND
		(D_029E < (2 * (D_02A0 DIV 3)))
	THEN BEGIN
		IF g_heliAnimCounter = 1
		THEN PutPic(D_0CEA, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 2
		THEN PutPic(D_0DB2, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 3
		THEN PutPic(D_0E7A, TRUNC(g_fPosX), TRUNC(g_fPosY));
	END;
	{-- facing left --}
	IF
		(D_029E >= (2 * (D_02A0 DIV 3))) AND
		(D_029E < D_02A0)
	THEN BEGIN
		IF g_heliAnimCounter = 1
		THEN PutPic(D_0A92, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 2
		THEN PutPic(D_0B5A, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF g_heliAnimCounter = 3
		THEN PutPic(D_0C22, TRUNC(g_fPosX), TRUNC(g_fPosY));
	END;
	IF D_029E = D_02A0
	THEN BEGIN
		D_029E := 0;
		g_bRotateLeft := FALSE;
	END;
END;

{6930}PROCEDURE DrawHeliExplosion;
BEGIN
	g_fHeliExplAnimCounter := 1;
	WHILE g_fHeliExplAnimCounter < 5
	DO BEGIN
		IF TRUNC(g_fHeliExplAnimCounter) = 1
		THEN PutPic(D_28F6, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF TRUNC(g_fHeliExplAnimCounter) = 2
		THEN PutPic(D_2A86, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF TRUNC(g_fHeliExplAnimCounter) = 3
		THEN PutPic(D_2C16, TRUNC(g_fPosX), TRUNC(g_fPosY));
		IF TRUNC(g_fHeliExplAnimCounter) = 4
		THEN PutPic(D_2DA6, TRUNC(g_fPosX), TRUNC(g_fPosY));

		g_fHeliExplAnimCounter := g_fHeliExplAnimCounter + 0.05;
		IF g_bSound = TRUE THEN SOUND(50 + TRUNC(g_fHeliExplAnimCounter * 150));
		DELAY(2);
		IF g_bSound = TRUE THEN SOUND(110 + TRUNC(g_fHeliExplAnimCounter * 50));
		DELAY(2);
		NOSOUND;
		DELAY(2);
	END;
	PutPic(D_2766, TRUNC(g_fPosX), TRUNC(g_fPosY));
END;

LABEL C_6B3F;

BEGIN
	CLRSCR;
	HiRes;

	LoadResources;

	GraphColorMode;

	ASSIGN(D_C59A, 'image.scr');
	RESET(D_C59A);
	READ(D_C59A, D_859A);
	CLOSE(D_C59A);

C_6B3F:
	{-- SPLASH --}
	PutPic(D_859A, 0, 199);
	PutPic(D_1582, 290, 199);
	Melody;
	DELAY(1000);

	{-- --}
	g_fPosX := 205;
	g_fPosY := 155;
	g_lives := 5;

	GraphColorMode;
	GOTOXY(13, 1); WRITE(' OPTION SCREEN ');
	GOTOXY(13, 2); WRITE('***************');

	g_bSound := TRUE;
	g_difficulty := 0;
	g_optDiff := 1;
	g_2Players := FALSE;

	GOTOXY(10, 8); WRITE('(S)OUND : ON ');
	GOTOXY(10, 12); WRITE('(L)EVEL : NORMAL');
	GOTOXY(10, 16); WRITE('(P)LAYERS : ONE');
	GOTOXY(10, 20); WRITE('(E)XIT TO GAME');

	g_char := ' ';
	WHILE UPCASE(g_char) <> 'E'
	DO BEGIN
		IF KEYPRESSED
		THEN READ(KBD, g_char);

		IF UPCASE(g_char) = 'S'
		THEN BEGIN
			IF g_bSound = TRUE
			THEN BEGIN
				g_bSound := FALSE;
				GOTOXY(20, 8); WRITE('OFF');
			END ELSE BEGIN
				g_bSound := TRUE;
				GOTOXY(20, 8); WRITE('ON ');
			END;
			g_char := ' ';
		END;

		IF UPCASE(g_char) = 'L'
		THEN BEGIN
			g_optDiff := g_optDiff + 1;
			IF g_optDiff = 4
			THEN g_optDiff := 0;
			GOTOXY(20, 12);
			IF g_optDiff = 0
			THEN BEGIN
				WRITE('EASY  ');
				g_difficulty := 0;
				g_lives := 8;
			END;
			IF g_optDiff = 1
			THEN BEGIN
				WRITE('NORMAL');
				g_difficulty := 0;
				g_lives := 5;
			END;
			IF g_optDiff = 2
			THEN BEGIN
				WRITE('MEDIUM');
				g_difficulty := 1;
				g_lives := 5;
			END;
			IF g_optDiff = 3
			THEN BEGIN
				WRITE('HARD  ');
				g_difficulty := 2;
				g_lives := 5;
			END;
			g_char := ' ';
		END;

		IF UPCASE(g_char) = 'P'
		THEN BEGIN
			IF g_2Players = TRUE
			THEN BEGIN
				g_2Players := FALSE;
				GOTOXY(22, 16); WRITE('ONE');
			END ELSE BEGIN
				g_2Players := TRUE;
				GOTOXY(22, 16); WRITE('TWO');
			END;
			g_char := ' ';
		END;
	END;{WHILE}

	g_stage := 1;
	g_loopCount := 0;

	GraphColorMode;

	IF g_2Players = TRUE
	THEN BEGIN
		g_bIsP2_turn := FALSE;
		g_P_lives[1] := g_lives;
		g_P_lives[2] := g_lives;
		g_P_score[1] := 0;
		g_P_score[2] := 0;
		g_P1_loopCount := g_loopCount;
		g_P1_difficulty := g_difficulty;
		g_P2_loopCount := g_loopCount;
		g_P2_difficulty := g_difficulty;
		g_P_gameOver[1] := FALSE;
		g_P_gameOver[2] := FALSE;
		g_P_stage[1] := g_stage;
		g_P_stage[2] := g_stage;
		GOTOXY(16, 12); WRITE('PLAYER ONE');
		DELAY(1500);
	END;

	GraphColorMode;

	g_barrierY := 0;
	g_fHeliDir := 0;
	g_score := 0;
	g_prevScore := 0;
	g_heliAnimCounter := 0;
	g_barrierPower := 0;

	GOTOXY(1, 1); WRITE('SCORE ', g_score:4, ' OIL ');
	GOTOXY(24, 1); WRITE('LIFE ', g_lives);
	GOTOXY(32, 1); WRITE('FAST');
	FillPattern(120, 0, 181, 6, 3);

	g_bShootOn := FALSE;
	g_doExplosion := FALSE;
	g_bBarrierdOn := FALSE;
	g_bLooseLife := FALSE;
	g_char := KBD_HOME;
	g_prevChar := KBD_RIGHT;
	g_fFuelCounter := 200;
	g_fuel := 61;
	g_bAA_On[1] := FALSE;
	g_bAA_ShootOn[1] := FALSE;
	g_bRotateLeft := FALSE;
	g_bRotateRight := TRUE;
	g_bAA_On[2] := FALSE;
	g_bAA_ShootOn[2] := FALSE;
	g_bBallOn[1] := FALSE;
	g_bBallOn[2] := FALSE;
	g_bMovingBarrier := FALSE;
	D_8184 := FALSE;
	g_bStageCleared := TRUE;
	g_enemyCount := 0;
	g_fExplAnimCounter := 1;
	g_speedParam := 2;{slow}
	PutPic(g_BG1_2, 0, 193);

	WHILE g_fPosX < 322
	DO BEGIN
		IF g_fPosX < 1
		THEN g_fPosX := 1;

		{-- next level --}
		IF (g_fPosX > 287) AND (g_bStageCleared = TRUE)
		THEN BEGIN
			g_bAA_On[2] := FALSE;
			g_bAA_ShootOn[2] := FALSE;
			g_bAA_On[1] := FALSE;
			g_doExplosion := FALSE;
			g_bBarrierdOn := FALSE;
			g_bMovingBarrier := FALSE;
			g_bShootOn := FALSE;
			g_bAA_ShootOn[1] := FALSE;
			g_fExplAnimCounter := 1;
			g_bLooseLife  := FALSE;
			g_bRotateLeft := FALSE;
			g_bRotateRight := FALSE;
			g_fPosX := 1;
			g_barrierPower := 0;

			GetPic(D_18A2, 0, 0, 319, 8);
			GraphColorMode;
			PutPic(D_18A2, 0, 8);

			g_stage := g_stage + 1;
			IF g_stage > 8
			THEN g_stage := 1;

			IF g_stage = 1
			THEN BEGIN
				PutPic(g_BG1_2, 0, 193);
				g_loopCount := g_loopCount + 1;
				IF g_loopCount = 5
				THEN BEGIN
					g_loopCount := 0;
					g_difficulty := g_difficulty + 1;
					IF g_difficulty = 3
					THEN g_difficulty := 2;
				END;
			END;

			IF g_stage = 2 THEN InitStage_2;
			IF g_stage = 3 THEN InitStage_3;
			IF g_stage = 4 THEN InitStage_4;
			IF g_stage = 5 THEN InitStage_5;
			IF g_stage = 6 THEN InitStage_6;
			IF g_stage = 7 THEN InitStage_7;
			IF g_stage = 8 THEN InitStage_8;

			IF g_stage <> 1
			THEN g_bStageCleared := FALSE;
		END;
		{-- --}

		IF (g_fPosX > 287) AND (g_bStageCleared = FALSE)
		THEN g_fPosX := g_fPosX - 1;

		IF g_fPosY > 156
		THEN g_fPosY := 156;
		IF g_fPosY < 25
		THEN g_fPosY := 25;

		{-- animation counter --}
		g_heliAnimCounter := g_heliAnimCounter + 1;
		IF g_heliAnimCounter = 4
		THEN g_heliAnimCounter := 1;

		{-- --}
		IF KEYPRESSED
		THEN READ(KBD, g_char);

		{-- UP RIGHT --}
		IF g_char = KBD_PGUP
		THEN BEGIN
			IF g_prevChar IN [KBD_HOME,KBD_END,KBD_LEFT]
			THEN g_bRotateRight := TRUE
			ELSE BEGIN
				g_fPosY := g_fPosY - (1 / g_speedParam);
				g_fPosX := g_fPosX + (1 / g_speedParam);
			END;
			g_fHeliDir := 0;
			g_prevChar := g_char;
			g_bkupChar := g_char;
		END;
		{-- DOWN RIGHT --}
		IF g_char = KBD_PGDN
		THEN BEGIN
			IF g_prevChar IN [KBD_HOME,KBD_END,KBD_LEFT]
			THEN g_bRotateRight := TRUE
			ELSE BEGIN
				g_fPosY := g_fPosY + (1 / g_speedParam);
				g_fPosX := g_fPosX + (1 / g_speedParam);
			END;
			g_fHeliDir := 0;
			g_prevChar := g_char;
			g_bkupChar := g_char;
		END;
		{-- UP LEFT --}
		IF g_char = KBD_HOME
		THEN BEGIN
			IF g_prevChar IN [KBD_PGUP,KBD_PGDN,KBD_RIGHT]
			THEN g_bRotateLeft := TRUE
			ELSE BEGIN
				g_fPosY := g_fPosY - (1 / g_speedParam);
				g_fPosX := g_fPosX - (1 / g_speedParam);
			END;
			g_fHeliDir := 1;
			g_prevChar := g_char;
			g_bkupChar := g_char;
		END;
		{-- DOWN LEFT --}
		IF g_char = KBD_END
		THEN BEGIN
			IF g_prevChar IN [KBD_PGUP,KBD_PGDN,KBD_RIGHT]
			THEN g_bRotateLeft := TRUE
			ELSE BEGIN
				g_fPosY := g_fPosY + (1 / g_speedParam);
				g_fPosX := g_fPosX - (1 / g_speedParam);
			END;
			g_fHeliDir := 1;
			g_prevChar := g_char;
			g_bkupChar := g_char;
		END;
		{-- UP --}
		IF g_char = KBD_UP
		THEN BEGIN
			g_fPosY := g_fPosY - (1 / g_speedParam);
			g_bkupChar := g_char;
		END;
		{-- DOWN --}
		IF g_char = KBD_DOWN
		THEN BEGIN
			g_fPosY := g_fPosY + (1 / g_speedParam);
			g_bkupChar := g_char;
		END;
		{-- LEFT --}
		IF g_char = KBD_LEFT
		THEN BEGIN
			IF g_prevChar IN [KBD_PGUP,KBD_PGDN,KBD_RIGHT]
			THEN g_bRotateLeft := TRUE
			ELSE g_fPosX := g_fPosX - (1 / g_speedParam);
			g_fHeliDir := 1;
			g_prevChar := g_char;
			g_bkupChar := g_char;
		END;
		{-- RIGHT --}
		IF g_char = KBD_RIGHT
		THEN BEGIN
			IF g_prevChar IN [KBD_HOME,KBD_END,KBD_LEFT]
			THEN g_bRotateRight := TRUE
			ELSE g_fPosX := g_fPosX + (1 / g_speedParam);
			g_fHeliDir := 0;
			g_prevChar := g_char;
			g_bkupChar := g_char;
		END;

		{-- Stop --}
		IF g_char = KBD_INS
		THEN g_bkupChar := g_char;

		{-- Toggle speed --}
		IF UPCASE(g_char) = 'V'
		THEN BEGIN
			IF g_speedParam = 1
			THEN BEGIN
				g_speedParam := 2;{slow}
				GOTOXY(32, 1); WRITE('SLOW');
			END ELSE IF g_speedParam = 2
			THEN BEGIN
				g_speedParam := 1;{fast}
				GOTOXY(32, 1); WRITE('FAST');
			END;
			g_char := g_bkupChar;
		END;

		{-- Shoot --}
		IF g_char = ' '
		THEN BEGIN
			IF (g_bShootOn = FALSE) AND (g_fPosY < 150) AND (g_doExplosion = FALSE)
			THEN BEGIN
				g_bShootOn := TRUE;
				g_shootX := TRUNC(g_fPosX) + 10;
				IF g_fHeliDir = 0
				THEN g_shootX := g_shootX + 13;
				g_shootY := TRUNC(g_fPosY) + 2;
				g_char := g_bkupChar;
			END;
		END;

		{-- Draw Helicopter --}
		IF (g_bRotateRight = FALSE) AND (g_bRotateLeft = FALSE)
		THEN BEGIN
			{-- facing right --}
			IF g_fHeliDir = 0
			THEN BEGIN
				IF g_heliAnimCounter = 1
				THEN PutPic(D_038A, TRUNC(g_fPosX), TRUNC(g_fPosY));
				IF g_heliAnimCounter = 2
				THEN PutPic(D_0452, TRUNC(g_fPosX), TRUNC(g_fPosY));
				IF g_heliAnimCounter = 3
				THEN PutPic(D_051A, TRUNC(g_fPosX), TRUNC(g_fPosY));
			END;
			{-- facing left --}
			IF g_fHeliDir = 1
			THEN BEGIN
				IF g_heliAnimCounter = 1
				THEN PutPic(D_05E2, TRUNC(g_fPosX), TRUNC(g_fPosY));
				IF g_heliAnimCounter = 2
				THEN PutPic(D_06AA, TRUNC(g_fPosX), TRUNC(g_fPosY));
				IF g_heliAnimCounter = 3
				THEN PutPic(D_0772, TRUNC(g_fPosX), TRUNC(g_fPosY));
			END;
		END;

		IF g_bRotateRight = TRUE
		THEN BEGIN
			D_029E := D_029E + 1;
			D_02A0 := 45;
			DrawHeliRotRight;
		END;

		IF g_bRotateLeft = TRUE
		THEN BEGIN
			D_029E := D_029E + 1;
			D_02A0 := 45;
			DrawHeliRotLeft;
		END;

		{-----------}
		{-- SHOOT --}
		{-----------}
		IF g_bShootOn = TRUE
		THEN BEGIN
			IF g_fHeliDir = 1
			THEN g_shootX := g_shootX - 1
			ELSE g_shootX := g_shootX + 1;
			g_shootY := g_shootY + 1;

			IF
				(GetDotColor(g_shootX + 1, g_shootY + 1) = 2) OR
				(GetDotColor(g_shootX + 2, g_shootY + 1) = 2) OR
				(GetDotColor(g_shootX + 3, g_shootY + 1) = 2) OR
				(GetDotColor(g_shootX + 4, g_shootY - 2) = 2) OR
				(GetDotColor(g_shootX, g_shootY - 2) = 2)
			THEN BEGIN
				g_prevScore := g_score;
				PutPic(D_23BA, g_shootX, g_shootY);
				CheckDestroyed;
				g_bShootOn := FALSE;
				g_score := g_score + 10;
				GOTOXY(7, 1); WRITE(g_score:4);
				{-- extra life --}
				IF (g_prevScore DIV 1000) < (g_score DIV 1000)
				THEN BEGIN
					g_lives := g_lives + 1;
					g_prevScore := g_score;{???}
					GOTOXY(29, 1); WRITE(g_lives);
				END;
			END;

			IF
				(GetDotColor(g_shootX + 1, g_shootY + 1) = 3) OR
				(GetDotColor(g_shootX + 2, g_shootY + 1) = 3) OR
				(GetDotColor(g_shootX + 3, g_shootY + 1) = 3) OR
				(GetDotColor(g_shootX + 4, g_shootY - 2) = 3) OR
				(GetDotColor(g_shootX, g_shootY - 2) = 3)
			THEN BEGIN
				g_bShootOn := FALSE;
				PutPic(D_23BA, g_shootX, g_shootY);

				IF
					(g_bBallOn[1] = TRUE) AND
					(g_shootY < 156) AND
					(g_shootX >= (g_ball1X - 7)) AND (g_shootX <= (g_ball1X + 7)) AND
					(g_shootY >= (g_ball1Y - 7)) AND (g_shootY <= (g_ball1Y + 7))
				THEN BEGIN
					g_bBallDestroyed[1] := TRUE;
					g_prevScore := g_score;
					CheckDestroyed;
					g_score := g_score + 10;
					GOTOXY(7, 1); WRITE(g_score:4);
					{-- extra life --}
					IF (g_prevScore DIV 1000) < (g_score DIV 1000)
					THEN BEGIN
						g_lives := g_lives + 1;
						g_prevScore := g_score;{???}
						GOTOXY(29, 1); WRITE(g_lives);
					END;
				END;

				IF
					(g_bBallOn[2] = TRUE) AND
					(g_shootY < 156) AND
					(g_shootX >= (g_ball2X - 7)) AND (g_shootX <= (g_ball2X + 7)) AND
					(g_shootY >= (g_ball2Y - 7)) AND (g_shootY <= (g_ball2Y + 7))
				THEN BEGIN
					g_bBallDestroyed[2] := TRUE;
					g_prevScore := g_score;
					CheckDestroyed;
					g_score := g_score + 10;
					GOTOXY(7, 1); WRITE(g_score:4);
					{-- extra life --}
					IF (g_prevScore DIV 1000) < (g_score DIV 1000)
					THEN BEGIN
						g_lives := g_lives + 1;
						g_prevScore := g_score;{???}
						GOTOXY(29, 1); WRITE(g_lives);
					END;
				END;
			END;

			IF (g_shootY > 195) OR (g_shootX < 2) OR (g_shootX > 314)
			THEN BEGIN
				g_bShootOn := FALSE;
				PutPic(D_23BA, g_shootX, g_shootY);
			END;

			IF
				(g_bBarrierdOn = TRUE) AND
				(((g_shootX + 5) = g_barrierX) OR ((g_shootX - 1) = g_barrierX)) AND
				(g_shootY < 158)
			THEN BEGIN
				g_bShootOn := FALSE;
				PutPic(D_23BA, g_shootX, g_shootY);
			END;

			IF g_bShootOn = TRUE
			THEN PutPic(D_2392, g_shootX, g_shootY);
		END;

		{---------------}
		{-- EXPLOSION --}
		{---------------}
		IF g_doExplosion = TRUE
		THEN BEGIN
			IF TRUNC(g_fExplAnimCounter) = 1
			THEN PutPic(D_23E2, g_explosionX, g_explosionY);
			IF TRUNC(g_fExplAnimCounter) = 2
			THEN PutPic(D_2496, g_explosionX, g_explosionY);
			IF TRUNC(g_fExplAnimCounter) = 3
			THEN PutPic(D_254A, g_explosionX, g_explosionY);
			IF TRUNC(g_fExplAnimCounter) = 4
			THEN PutPic(D_25FE, g_explosionX, g_explosionY);
			IF TRUNC(g_fExplAnimCounter) = 5
			THEN BEGIN
				PutPic(D_26B2, g_explosionX, g_explosionY);
				g_fExplAnimCounter := 0.95;
				g_doExplosion := FALSE;
			END;
			g_fExplAnimCounter := g_fExplAnimCounter + 0.05;
		END;

		IF g_fExplAnimCounter > 1.1
		THEN BEGIN
			IF g_bSound = TRUE THEN SOUND(30 + D_028E);
			D_028E := D_028E + 1;
			DELAY(1);
		END ELSE BEGIN
			IF g_bShootOn = FALSE
			THEN BEGIN
				IF g_bSound = TRUE THEN SOUND(30);
				D_028E := 0;
				DELAY(1);
				IF g_bSound = TRUE THEN SOUND(32000);
				DELAY(1);
			END ELSE BEGIN
				IF g_bSound = TRUE THEN SOUND(1600 + D_028E);
				D_028E := D_028E + 50;
				DELAY(1);
			END;
		END;

		{-----------------}
		{-- MANAGE FUEL --}
		{-----------------}
		g_fFuelCounter := g_fFuelCounter - 1;
		{-- destroyed fuel tank --}
		IF g_bFuelBonus = TRUE
		THEN BEGIN
			D_0298 := g_fuel + 9;
			IF D_0298 > 60
			THEN D_0298 := 60;
			FillPattern(120 + g_fuel, 0, 120 + D_0298, 6, 3);
			g_fuel := D_0298 + 1;
			g_bFuelBonus := FALSE;
		END;
		{-- --}
		IF g_fFuelCounter = 0
		THEN BEGIN
			g_fuel := g_fuel - 1;
			Draw(120 + g_fuel, 0, 120 + g_fuel, 6, 2);
			g_fFuelCounter := 200;
		END;
		{-- low fuel warning --}
		IF (g_fuel = 10) AND (g_fFuelCounter = 199)
		THEN BEGIN
			SOUND(2000);
			DELAY(100);
		END;
		{-- --}
		IF (g_difficulty >= 1) AND (g_fFuelCounter = 133)
		THEN BEGIN
			g_fuel := g_fuel - 1;
			Draw(120 + g_fuel, 0, 120 + g_fuel, 6, 2);
		END;

		IF (g_difficulty >= 2) AND (g_fFuelCounter = 66)
		THEN BEGIN
			g_fuel := g_fuel - 1;
			Draw(120 + g_fuel, 0, 120 + g_fuel, 6, 2);
		END;
		{-- out of fuel --}
		IF g_fuel = 0
		THEN g_bLooseLife  := TRUE;

		{-----------------------------}
		{-- Anti Aircraft Cannon #1 --}
		{-----------------------------}
		IF g_bAA_On[1] = TRUE
		THEN BEGIN
			{-- _thresholdX[1] --}
			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[1]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[1] + 20)) AND
				(g_bAA_ShootOn[1] = TRUE)
			THEN PutPic(D_1E92, g_AA_1._x, g_AA_1._y);

			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[1]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[1] + 20)) AND
				(g_bAA_ShootOn[1] = FALSE)
			THEN BEGIN
				PutPic(D_1E92, g_AA_1._x, g_AA_1._y);
				g_fAAShoot1X := g_AA_1._x;
				g_AA_1._shootY := g_AA_1._y - 5;
				g_fAAShoot1XIncr := -2;
				g_bAA_ShootOn[1] := TRUE;
			END;

			{-- _thresholdX[2] --}
			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[2]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[2] + 20)) AND
				(g_bAA_ShootOn[1] = TRUE)
			THEN PutPic(D_1F32, g_AA_1._x, g_AA_1._y);

			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[2]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[2] + 20)) AND
				(g_bAA_ShootOn[1] = FALSE)
			THEN BEGIN
				PutPic(D_1F32, g_AA_1._x, g_AA_1._y);
				g_fAAShoot1X := g_AA_1._x + 2;
				g_AA_1._shootY := g_AA_1._y - 6;
				g_fAAShoot1XIncr := -1;
				g_bAA_ShootOn[1] := TRUE;
			END;

			{-- _thresholdX[3] --}
			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[3]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[3] + 20)) AND
				(g_bAA_ShootOn[1] = TRUE)
			THEN PutPic(D_2112, g_AA_1._x, g_AA_1._y);

			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[3]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[3] + 20)) AND
				(g_bAA_ShootOn[1] = FALSE)
			THEN BEGIN
				PutPic(D_2112, g_AA_1._x, g_AA_1._y);
				g_fAAShoot1X := g_AA_1._x + 5;
				g_AA_1._shootY := g_AA_1._y - 7;
				g_fAAShoot1XIncr := 0;
				g_bAA_ShootOn[1] := TRUE;
			END;

			{-- _thresholdX[4] --}
			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[4]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[4] + 20)) AND
				(g_bAA_ShootOn[1] = TRUE)
			THEN PutPic(D_2072, g_AA_1._x, g_AA_1._y);

			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[4]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[4] + 20)) AND
				(g_bAA_ShootOn[1] = FALSE)
			THEN BEGIN
				PutPic(D_2072, g_AA_1._x, g_AA_1._y);
				g_fAAShoot1X := g_AA_1._x + 8;
				g_AA_1._shootY := g_AA_1._y - 6;
				g_fAAShoot1XIncr := 1;
				g_bAA_ShootOn[1] := TRUE;
			END;

			{-- _thresholdX[5] --}
			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[5]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[5] + 20)) AND
				(g_bAA_ShootOn[1] = TRUE)
			THEN PutPic(D_1FD2, g_AA_1._x, g_AA_1._y);

			IF
				((TRUNC(g_fPosX) = g_AA_1._thresholdX[5]) OR (TRUNC(g_fPosX) = g_AA_1._thresholdX[5] + 20)) AND
				(g_bAA_ShootOn[1] = FALSE)
			THEN BEGIN
				PutPic(D_1FD2, g_AA_1._x, g_AA_1._y);
				g_fAAShoot1X := g_AA_1._x + 10;
				g_AA_1._shootY := g_AA_1._y - 5;
				g_fAAShoot1XIncr := 2;
				g_bAA_ShootOn[1] := TRUE;
			END;
		END;

		{---------------------------------}
		{-- Anti Aircrafe Projectile #1 --}
		{---------------------------------}
		IF g_bAA_ShootOn[1] = TRUE
		THEN BEGIN
			g_AA_1._shootX := ROUND(g_fAAShoot1X);
			Plot(g_AA_1._shootX, g_AA_1._shootY, 0);
			g_AA_1._shootY := g_AA_1._shootY - 2;
			g_fAAShoot1X := g_fAAShoot1X + g_fAAShoot1XIncr;
			{-- --}
			IF (g_fAAShoot1X > (g_fPosX + 14)) AND (g_AA_1._shootY < 158)
			THEN g_fAAShoot1X := g_fAAShoot1X - g_loopCount / 4;
			IF (g_fAAShoot1X < (g_fPosX + 14)) AND (g_AA_1._shootY < 158)
			THEN g_fAAShoot1X := g_fAAShoot1X + g_loopCount / 4;
			{-- --}
			g_AA_1._shootX := ROUND(g_fAAShoot1X);
			Plot(g_AA_1._shootX, g_AA_1._shootY, 1);

			IF
				(GetDotColor(g_AA_1._shootX, g_AA_1._shootY - 1) = 2) OR
				(GetDotColor(g_AA_1._shootX, g_AA_1._shootY - 2) = 2)
			THEN g_bLooseLife  := TRUE;

			IF (g_AA_1._shootY <= 12) OR (g_AA_1._shootX <= 2) OR (g_AA_1._shootX >= 318)
			THEN BEGIN
				Plot(g_AA_1._shootX, g_AA_1._shootY, 0);
				g_bAA_ShootOn[1] := FALSE;
			END;
		END;

		{-----------------------------}
		{-- Anti Aircraft Cannon #2 --}
		{-----------------------------}
		IF g_bAA_On[2] = TRUE
		THEN BEGIN
			{-- _thresholdX[1] --}
			IF
				((      g_fPosX  = g_AA_2._thresholdX[1]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[1] + 20)) AND
				(g_bAA_ShootOn[2] = TRUE)
			THEN PutPic(D_1E92, g_AA_2._x, g_AA_2._y);

			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[1]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[1] + 20)) AND
				(g_bAA_ShootOn[2] = FALSE)
			THEN BEGIN
				PutPic(D_1E92, g_AA_2._x, g_AA_2._y);
				g_fAAShoot2X := g_AA_2._x;
				g_AA_2._shootY := g_AA_2._y - 5;
				g_fAAShoot2XIncr := -2;
				g_bAA_ShootOn[2] := TRUE;
			END;

			{-- _thresholdX[2] --}
			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[2]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[2] + 20)) AND
				(g_bAA_ShootOn[2] = TRUE)
			THEN PutPic(D_1F32, g_AA_2._x, g_AA_2._y);

			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[2]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[2] + 20)) AND
				(g_bAA_ShootOn[2] = FALSE)
			THEN BEGIN
				PutPic(D_1F32, g_AA_2._x, g_AA_2._y);
				g_fAAShoot2X := g_AA_2._x + 2;
				g_AA_2._shootY := g_AA_2._y - 6;
				g_fAAShoot2XIncr := -1;
				g_bAA_ShootOn[2] := TRUE;
			END;

			{-- _thresholdX[3] --}
			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[3]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[3] + 20)) AND
				(g_bAA_ShootOn[2] = TRUE)
			THEN PutPic(D_2112, g_AA_2._x, g_AA_2._y);

			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[3]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[3] + 20)) AND
				(g_bAA_ShootOn[2] = FALSE)
			THEN BEGIN
				PutPic(D_2112, g_AA_2._x, g_AA_2._y);
				g_fAAShoot2X := g_AA_2._x + 5;
				g_AA_2._shootY := g_AA_1._y - 7;
				g_fAAShoot2XIncr := 0;
				g_bAA_ShootOn[2] := TRUE;
			END;

			{-- _thresholdX[4] --}
			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[4]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[4] + 20)) AND
				(g_bAA_ShootOn[2] = TRUE)
			THEN PutPic(D_2072, g_AA_2._x, g_AA_2._y);

			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[4]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[4] + 20)) AND
				(g_bAA_ShootOn[2] = FALSE)
			THEN BEGIN
				PutPic(D_2072, g_AA_2._x, g_AA_2._y);
				g_fAAShoot2X := g_AA_2._x + 8;
				g_AA_2._shootY := g_AA_2._y - 6;
				g_fAAShoot2XIncr := 1;
				g_bAA_ShootOn[2] := TRUE;
			END;

			{-- _thresholdX[5] --}
			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[5]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[5] + 20)) AND
				(g_bAA_ShootOn[2] = TRUE)
			THEN PutPic(D_1FD2, g_AA_2._x, g_AA_2._y);

			IF
				((TRUNC(g_fPosX) = g_AA_2._thresholdX[5]) OR (TRUNC(g_fPosX) = g_AA_2._thresholdX[5] + 20)) AND
				(g_bAA_ShootOn[2] = FALSE)
			THEN BEGIN
				PutPic(D_1FD2, g_AA_2._x, g_AA_2._y);
				g_fAAShoot2X := g_AA_2._x + 10;
				g_AA_2._shootY := g_AA_2._y - 5;
				g_fAAShoot2XIncr := 2;
				g_bAA_ShootOn[2] := TRUE;
			END;
		END;

		{---------------------------------}
		{-- Anti Aircrafe Projectile #2 --}
		{---------------------------------}
		IF g_bAA_ShootOn[2] = TRUE
		THEN BEGIN
			g_AA_2._shootX := ROUND(g_fAAShoot2X);
			Plot(g_AA_2._shootX, g_AA_2._shootY, 0);
			g_AA_2._shootY := g_AA_2._shootY - 2;
			g_fAAShoot2X := g_fAAShoot2X + g_fAAShoot2XIncr;
			{-- bug? why use "g_AA_1" instead of "g_AA_2"? --}
			IF (g_fAAShoot2X > (g_fPosX + 14)) AND (g_AA_1._shootY < 158)
			THEN g_fAAShoot2X := g_fAAShoot2X - g_loopCount / 4;
			IF (g_fAAShoot2X < (g_fPosX + 14)) AND (g_AA_1._shootY < 158)
			THEN g_fAAShoot2X := g_fAAShoot2X + g_loopCount / 4;
			{-- --}
			g_AA_2._shootX := ROUND(g_fAAShoot2X);
			Plot(g_AA_2._shootX, g_AA_2._shootY, 1);

			IF
				(GetDotColor(g_AA_2._shootX, g_AA_2._shootY - 1) = 2) OR
				(GetDotColor(g_AA_2._shootX, g_AA_2._shootY - 2) = 2)
			THEN g_bLooseLife  := TRUE;

			IF (g_AA_2._shootY <= 12) OR (g_AA_2._shootX <= 2) OR (g_AA_2._shootX >= 318)
			THEN BEGIN
				Plot(g_AA_2._shootX, g_AA_2._shootY, 0);
				g_bAA_ShootOn[2] := FALSE;
			END;
		END;

		{-------------}
		{-- BARRIER --}
		{-------------}
		{-- remove shield --}
		IF (g_bBarrierdOn = TRUE) AND (g_barrierPower = 2)
		THEN BEGIN
			Draw(0, 158, 319, 158, 0);
			g_barrierPower := 1;
		END;
		{-- remove all barriers --}
		IF (g_bBarrierdOn = TRUE) AND (g_barrierPower = 0)
		THEN BEGIN
			g_bBarrierdOn := FALSE;
			g_bMovingBarrier := FALSE;
			PutPic(D_0F42, g_barrierX, 164);
		END;

		IF (g_bMovingBarrier = TRUE) AND (g_bBarrierdOn = TRUE)
		THEN BEGIN
			IF
				((TRUNC(g_fPosX) = g_barrierX + 1) OR (TRUNC(g_fPosX) = g_barrierX + 30)) AND
				(g_fHeliDir = 0) AND
				(D_8184 = FALSE)
			THEN BEGIN
				IF g_barrierX < 161
				THEN BEGIN
					PutPic(D_0F42, g_barrierX, 164);
					g_barrierX := g_barrierX + 80;
					IF g_barrierY = 11
					THEN PutPic(D_10D2, g_barrierX, 164);
					IF g_barrierY = 23
					THEN PutPic(D_1262, g_barrierX, 164);
					IF g_barrierY = 35
					THEN PutPic(D_13F2, g_barrierX, 164);
					D_8184 := TRUE;
				END;
			END ELSE IF
				((TRUNC(g_fPosX) = g_barrierX - 58) OR ((TRUNC(g_fPosX) + 28) = g_barrierX)) AND
				(g_fHeliDir = 1) AND
				(D_8184 = FALSE)
			THEN BEGIN
				IF g_barrierX > 80
				THEN BEGIN
					PutPic(D_0F42, g_barrierX, 164);
					g_barrierX := g_barrierX - 80;
					IF g_barrierY = 11
					THEN PutPic(D_10D2, g_barrierX, 164);
					IF g_barrierY = 23
					THEN PutPic(D_1262, g_barrierX, 164);
					IF g_barrierY = 35
					THEN PutPic(D_13F2, g_barrierX, 164);
					D_8184 := TRUE;
				END;
			END ELSE IF
				(
					(TRUNC(g_fPosX) <> g_barrierX + 1) OR
					(TRUNC(g_fPosX) <> g_barrierX + 30) OR
					(TRUNC(g_fPosX) <> g_barrierX - 58) OR
					((TRUNC(g_fPosX) + 28) <> g_barrierX)
				) AND
				(D_8184 = TRUE)
			THEN BEGIN
				D_8184 := FALSE;
			END;
		END;

		IF g_bBarrierdOn = TRUE
		THEN BEGIN
			{-- animate barrier --}
			IF g_fFuelCounter = 66
			THEN BEGIN
				PutPic(D_10D2, g_barrierX, 164);
				g_barrierY := 11;
			END;
			IF g_fFuelCounter = 133
			THEN BEGIN
				PutPic(D_1262, g_barrierX, 164);
				g_barrierY := 23;
			END;
			IF g_fFuelCounter = 199
			THEN BEGIN
				PutPic(D_13F2, g_barrierX, 164);
				g_barrierY := 35;
			END;

			{-- collision test --}
			g_bkupBarrierY := g_barrierY;
			WHILE (g_barrierY < 160) AND (g_barrierY > 0)
			DO BEGIN
				IF
					(GetDotColor(g_barrierX, g_barrierY - 1) = 2) OR
					(GetDotColor(g_barrierX, g_barrierY + 4) = 2)
				THEN g_bLooseLife  := TRUE;
				g_barrierY := g_barrierY + 36;
			END;
			g_barrierY := g_bkupBarrierY;
		END;

		{----------------------------}
		{-- Bouncing projectile #1 --}
		{----------------------------}
		IF g_bBallOn[1] = TRUE
		THEN BEGIN
			PutPic(D_2252, g_ball1X, g_ball1Y);

			IF
				(GetDotColor(g_ball1X - 1, g_ball1Y + 1) = 2) OR
				(GetDotColor(g_ball1X - 1, g_ball1Y - 6) = 2) OR
				(GetDotColor(g_ball1X + 6, g_ball1Y + 1) = 2) OR
				(GetDotColor(g_ball1X + 6, g_ball1Y - 6) = 2)
			THEN BEGIN
				g_bLooseLife  := TRUE;
				PutPic(D_22F2, g_ball1X, g_ball1Y);
			END;

			IF (g_ball1X = g_ball1MinX) AND (g_ball1IncrX = -1)
			THEN BEGIN
				g_ball1MinX := RANDOM(150) + 10;
				g_ball1IncrX := 1;
			END;
			IF (g_ball1X = g_ball1MaxX) AND (g_ball1IncrX = 1)
			THEN BEGIN
				g_ball1MaxX := RANDOM(140) + 165;
				g_ball1IncrX := -1;
			END;
			IF (g_ball1Y = g_ball1MinY) AND (g_ball1IncrY = -1)
			THEN BEGIN
				g_ball1MinY := RANDOM(130) + 15;
				g_ball1IncrY := 1;
			END;
			IF (g_ball1Y = 156) AND (g_ball1IncrY = 1)
			THEN BEGIN
				g_ball1IncrY := -1;
				RANDOMIZE;
			END;
			g_ball1X := g_ball1X + g_ball1IncrX;
			g_ball1Y := g_ball1Y + g_ball1IncrY;
		END;

		{----------------------------}
		{-- Bouncing projectile #2 --}
		{----------------------------}
		IF (g_bBallOn[2] = TRUE) AND (g_bLooseLife  = FALSE)
		THEN BEGIN
			PutPic(D_2252, g_ball2X, g_ball2Y);

			IF
				(GetDotColor(g_ball2X - 1, g_ball2Y + 1) = 2) OR
				(GetDotColor(g_ball2X - 1, g_ball2Y - 6) = 2) OR
				(GetDotColor(g_ball2X + 6, g_ball2Y + 1) = 2) OR
				(GetDotColor(g_ball2X + 6, g_ball2Y - 6) = 2)
			THEN BEGIN
				g_bLooseLife  := TRUE;
				PutPic(D_22F2, g_ball2X, g_ball2Y);
			END;

			IF (g_ball2X = g_ball2MinX) AND (g_ball2IncrX = -1)
			THEN BEGIN
				g_ball2MinX := RANDOM(5) + 10;
				g_ball2IncrX := 1;
			END;
			IF (g_ball2X = g_ball2MaxX) AND (g_ball2IncrX = 1)
			THEN BEGIN
				g_ball2MaxX := RANDOM(140) + 165;
				g_ball2IncrX := -1;
			END;
			IF (g_ball2Y = g_ball2MinY) AND (g_ball2IncrY = -1)
			THEN BEGIN
				g_ball2MinY := RANDOM(130) + 15;
				g_ball2IncrY := 1;
			END;
			IF (g_ball2Y = 156) AND (g_ball2IncrY = 1)
			THEN BEGIN
				g_ball2IncrY := -1;
				RANDOMIZE;
			END;
			g_ball2X := g_ball2X + g_ball2IncrX;
			g_ball2Y := g_ball2Y + g_ball2IncrY;
		END;

		{------------------}
		{-- Loose a life --}
		{------------------}
		IF g_bLooseLife  = TRUE
		THEN BEGIN
			g_lives := g_lives - 1;
			NOSOUND;
			g_bRotateLeft := FALSE;
			g_bRotateRight := FALSE;

			IF g_lives > -1
			THEN BEGIN
				IF g_bAA_ShootOn[1] = TRUE
				THEN Plot(g_AA_1._shootX, g_AA_1._shootY, 0);

				IF g_bAA_ShootOn[2] = TRUE
				THEN Plot(g_AA_2._shootX, g_AA_2._shootY, 0);

				IF g_bShootOn = TRUE
				THEN PutPic(D_23BA, g_shootX, g_shootY);

				g_heliAnimCounter := 0;
				PutPic(D_0F42, g_barrierX, 164);

				IF g_bMovingBarrier = TRUE
				THEN g_barrierX := 80;

				D_02BC := TRUNC(g_fPosY);
				g_fPosY := TRUNC(g_fPosY);{???}
				WHILE g_fPosY < 156
				DO BEGIN
					g_fPosY := g_fPosY + 1;
					D_02A0 := (200 DIV (TRUNC(g_fPosY) + 10 - D_02BC)) * 3;
					D_029E := 0;
					g_bRotateLeft := TRUE;

					WHILE (g_bRotateLeft = TRUE) AND (g_fPosY < 156)
					DO BEGIN
						{-- animation counter --}
						g_heliAnimCounter := g_heliAnimCounter + 1;
						IF g_heliAnimCounter = 4
						THEN g_heliAnimCounter := 1;

						{-- --}
						D_029E := D_029E + 1;
						IF g_bSound = TRUE THEN SOUND(60 + 5 * TRUNC(g_fPosY));
						DELAY(3);
						IF g_bSound = TRUE THEN SOUND(910 - 5 * TRUNC(g_fPosY));
						DELAY(3);
						IF g_bSound = TRUE THEN SOUND(200 + TRUNC(g_fPosY));
						DELAY(3);
						IF g_bSound = TRUE THEN SOUND(910 - 5 * TRUNC(g_fPosY));
						DELAY(3);

						DrawHeliRotLeft;
						IF (D_029E MOD 3) = 0
						THEN g_fPosY := g_fPosY + 1;
					END;

					FOR D_029E := 1 TO 4
					DO BEGIN
						IF g_fPosY < 156
						THEN BEGIN
							IF g_bSound = TRUE THEN SOUND(60 + 5 * TRUNC(g_fPosY));
							DELAY(3);
							IF g_bSound = TRUE THEN SOUND(910 - 5 * TRUNC(g_fPosY));
							DELAY(3);
							IF g_bSound = TRUE THEN SOUND(200 + TRUNC(g_fPosY));
							DELAY(3);
							IF g_bSound = TRUE THEN SOUND(910 - 5 * TRUNC(g_fPosY));
							DELAY(3);

							{-- animation counter --}
							g_heliAnimCounter := g_heliAnimCounter + 1;
							IF g_heliAnimCounter = 4
							THEN g_heliAnimCounter := 1;

							{-- facing left --}
							IF g_heliAnimCounter = 1
							THEN PutPic(D_05E2, TRUNC(g_fPosX), TRUNC(g_fPosY));
							IF g_heliAnimCounter = 2
							THEN PutPic(D_06AA, TRUNC(g_fPosX), TRUNC(g_fPosY));
							IF g_heliAnimCounter = 3
							THEN PutPic(D_0772, TRUNC(g_fPosX), TRUNC(g_fPosY));

							IF (D_029E MOD 3) = 0
							THEN g_fPosY := g_fPosY + 1;
						END;
					END;

					FOR D_029E := 1 TO 4
					DO BEGIN
						IF g_fPosY < 156
						THEN BEGIN
							IF g_bSound = TRUE THEN SOUND(60 + 5 * TRUNC(g_fPosY));
							DELAY(3);
							IF g_bSound = TRUE THEN SOUND(910 - 5 * TRUNC(g_fPosY));
							DELAY(3);
							IF g_bSound = TRUE THEN SOUND(200 + TRUNC(g_fPosY));
							DELAY(3);
							IF g_bSound = TRUE THEN SOUND(910 - 5 * TRUNC(g_fPosY));
							DELAY(3);

							{-- animation counter --}
							g_heliAnimCounter := g_heliAnimCounter + 1;
							IF g_heliAnimCounter = 4
							THEN g_heliAnimCounter := 1;

							{-- facing right --}
							IF g_heliAnimCounter = 1
							THEN PutPic(D_038A, TRUNC(g_fPosX), TRUNC(g_fPosY));
							IF g_heliAnimCounter = 2
							THEN PutPic(D_0452, TRUNC(g_fPosX), TRUNC(g_fPosY));
							IF g_heliAnimCounter = 3
							THEN PutPic(D_051A, TRUNC(g_fPosX), TRUNC(g_fPosY));

							IF (D_029E MOD 3) = 0
							THEN g_fPosY := g_fPosY + 1;
						END;
					END;
				END;

				PutPic(D_02C2, TRUNC(g_fPosX), TRUNC(g_fPosY));
				DrawHeliExplosion;
				NOSOUND;
				DELAY(500);

				g_fPosX := 10;
				g_fPosY := 30;

				IF g_2Players = TRUE
				THEN BEGIN
					IF g_bIsP2_turn = FALSE
					THEN BEGIN
						g_P_lives[1] := g_lives;
						g_P_score[1] := g_score;
						g_P_stage[1] := g_stage;
						g_P1_loopCount := g_loopCount;
						g_P1_difficulty := g_difficulty;
						IF g_P_lives[2] <> 0
						THEN BEGIN
							g_lives := g_P_lives[2];
							g_score := g_P_score[2];
							g_stage := g_P_stage[2];
							g_bIsP2_turn := TRUE;
							g_loopCount := g_P2_loopCount;
							g_difficulty := g_P2_difficulty;
						END;
					END ELSE BEGIN
						g_P_lives[2] := g_lives;
						g_P_score[2] := g_score;
						g_P_stage[2] := g_stage;
						g_P2_loopCount := g_loopCount;
						g_P2_difficulty := g_difficulty;
						IF g_P_lives[1] <> 0
						THEN BEGIN
							g_lives := g_P_lives[1];
							g_score := g_P_score[1];
							g_stage := g_P_stage[1];
							g_bIsP2_turn := FALSE;
							g_loopCount := g_P1_loopCount;
							g_difficulty := g_P1_difficulty;
						END;
					END;
				END;

				g_char := KBD_INS;
			END;
			{-- --}
			IF g_2Players = FALSE
			THEN BEGIN
				IF g_lives > 0
				THEN BEGIN
					GraphColorMode;
					GOTOXY(16, 12); WRITE('PLAYER ONE');
					DELAY(1500);
					GraphColorMode;
				END;
				IF g_lives = 0
				THEN BEGIN
					GraphColorMode;
					GOTOXY(7, 6); WRITE('SCORE PLAYER ONE IS : ', g_score:4);
					{}
					GOTOXY(1, 12); WRITE('GAME OVER, WOULD YOU LIKE TO RESTART ?');
					READ(KBD, g_char);
					IF UPCASE(g_char) = 'Y'
					THEN GOTO C_6B3F
					ELSE BEGIN
						HiRes;
						HALT;
					END;
				END;
			END ELSE BEGIN
				IF (g_P_lives[1] = 0) AND (g_P_gameOver[1] = FALSE)
				THEN BEGIN
					GraphColorMode;
					g_P_gameOver[1] := TRUE;
					GOTOXY(10, 12); WRITE('PLAYER ONE GAME OVER');
					DELAY(1500);
					WRITE('                    ');
				END ELSE IF (g_P_lives[2] = 0) AND (g_P_gameOver[2] = FALSE)
				THEN BEGIN
					GraphColorMode;
					g_P_gameOver[2] := TRUE;
					GOTOXY(10, 12); WRITE('PLAYER TWO GAME OVER');
					DELAY(1500);
					WRITE('                    ');
				END;

				IF (g_P_lives[1] = 0) AND (g_P_lives[2] = 0)
				THEN BEGIN
					GraphColorMode;
					GOTOXY(7, 6); WRITE('SCORE PLAYER ONE IS : ', g_P_score[1]:4);
					GOTOXY(7, 8); WRITE('SCORE PLAYER TWO IS : ', g_P_score[2]:4);
					GOTOXY(1, 12); WRITE('GAME OVER, WOULD YOU LIKE TO RESTART ?');
					READ(KBD, g_char);
					IF UPCASE(g_char) = 'Y'
					THEN GOTO C_6B3F
					ELSE BEGIN
						HiRes;
						HALT;
					END;
				END;

				GraphColorMode;
				GOTOXY(16, 12);
				IF g_bIsP2_turn = FALSE
				THEN WRITE('PLAYER ONE');
				IF g_bIsP2_turn = TRUE
				THEN WRITE('PLAYER TWO');
				DELAY(1500);
				GraphColorMode;
			END;

			{-------------}
			{-- Restart --}
			{-------------}
			g_bBallOn[1] := FALSE;
			g_bBallOn[2] := FALSE;
			g_bAA_On[2] := FALSE;
			g_bAA_ShootOn[2] := FALSE;
			g_bAA_On[1] := FALSE;
			g_doExplosion := FALSE;
			g_bBarrierdOn := FALSE;
			g_bMovingBarrier := FALSE;
			g_bShootOn := FALSE;
			g_bAA_ShootOn[1] := FALSE;
			g_fExplAnimCounter := 1;
			g_bLooseLife  := FALSE;
			g_bRotateLeft := FALSE;
			g_bRotateRight := FALSE;
			g_fPosX := 1;
			g_barrierPower := 0;
			g_speedParam := 1;{fast}
			g_fFuelCounter := 200;
			g_fuel := 61;

			GOTOXY(1, 1); WRITE('SCORE ', g_score:4, ' OIL ');
			GOTOXY(24, 1); WRITE('LIFE ', g_lives);
			GOTOXY(32, 1); WRITE('FAST');
			FillPattern(120, 0, 181, 6, 3);
			g_enemyCount := 0;

			IF g_stage = 1
			THEN BEGIN
				PutPic(g_BG1_2, 0, 193);
				g_bStageCleared := TRUE;
			END;

			IF g_stage = 2 THEN InitStage_2;
			IF g_stage = 3 THEN InitStage_3;
			IF g_stage = 4 THEN InitStage_4;
			IF g_stage = 5 THEN InitStage_5;
			IF g_stage = 6 THEN InitStage_6;
			IF g_stage = 7 THEN InitStage_7;
			IF g_stage = 8 THEN InitStage_8;
		END;
	END;{WHILE}
END.
