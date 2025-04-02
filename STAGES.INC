{45D3}PROCEDURE CheckDestroyed;
BEGIN
	IF g_stage = 2
	THEN BEGIN
		CASE (g_shootX + 2) OF
			1..15: BEGIN
				g_explosionX := 1;
				g_explosionY := 190;
			END;
			20..35: BEGIN
				g_explosionX := 21;
				g_explosionY := 190;
			END;
			40..55: BEGIN
				g_explosionX := 41;
				g_explosionY := 190;
			END;
			87..102: BEGIN
				g_explosionX := 88;
				g_explosionY := 175;
			END;
			129..144: BEGIN
				g_explosionX := 130;
				g_explosionY := 180;
			END;
			149..164: BEGIN
				g_explosionX := 150;
				g_explosionY := 180;
			END;
			219..234: BEGIN
				g_explosionX := 220;
				g_explosionY := 165;
			END;
			255..270: BEGIN
				g_explosionX := 256;
				g_explosionY := 190;
			END;
		END;

		g_enemyCount := g_enemyCount + 1;
		PutPic(D_1DF2, g_explosionX, g_explosionY);

		IF g_enemyCount = 8
		THEN BEGIN
			g_bStageCleared := TRUE;
			g_enemyCount := 0;
		END;
	END;

	IF g_stage = 3
	THEN BEGIN
		CASE (g_shootX + 2) OF
			21..35: BEGIN
				g_explosionX := 22;
				g_explosionY := 190;
			END;
			42..56: BEGIN
				g_explosionX := 43;
				g_explosionY := 190;
			END;
			66..88: BEGIN
				g_explosionX := 73;
				g_explosionY := 185;
				g_score := g_score + 15;
				g_bFuelBonus := TRUE;
			END;
			91..104: BEGIN
				g_explosionX := 92;
				g_explosionY := 180;
			END;
			107..132: BEGIN
				g_explosionX := 113;
				g_explosionY := 185;
				g_score := g_score + 15;
				g_bFuelBonus := TRUE;
			END;
			136..150: BEGIN
				g_explosionX := 137;
				g_explosionY := 190;
			END;
			198..213: BEGIN
				g_explosionX := 200;
				g_explosionY := 180;
				g_score := g_score + 40;
				g_bAA_On[1] := FALSE;
			END;
			234..248: BEGIN
				g_explosionX := 235;
				g_explosionY := 175;
			END;
		END;

		g_enemyCount := g_enemyCount + 1;
		PutPic(D_1DF2, g_explosionX, g_explosionY);

		IF g_enemyCount = 8
		THEN BEGIN
			g_bStageCleared := TRUE;
			g_enemyCount := 0;
		END;
	END;

	IF g_stage = 4
	THEN BEGIN
		CASE (g_shootX + 2) OF
			13..28: BEGIN
				g_explosionX := 15;
				g_explosionY := 180;
			END;
			55..72: BEGIN
				g_explosionX := 58;
				g_explosionY := 185;
				g_score := g_score + 40;
				g_bAA_On[1] := FALSE;
			END;
			76..95: BEGIN
				g_explosionX := 80;
				g_explosionY := 175;
				g_score := g_score + 15;
				g_bFuelBonus := TRUE;
			END;
			108..123: BEGIN
				g_explosionX := 110;
				g_explosionY := 175;
			END;
			128..143: BEGIN
				g_explosionX := 130;
				g_explosionY := 175;
			END;
			146..165: BEGIN
				g_explosionX := 150;
				g_explosionY := 175;
				g_score := g_score + 15;
				g_bFuelBonus := TRUE;
			END;
			181..196: BEGIN
				g_explosionX := 183;
				g_explosionY := 165;
			END;
			220..235: BEGIN
				g_explosionX := 222;
				g_explosionY := 180;
				g_barrierPower := g_barrierPower - 1;
				g_score := g_score + 20;
			END;
			250..265: BEGIN
				g_explosionX := 252;
				g_explosionY := 180;
				g_barrierPower := g_barrierPower - 1;
				g_score := g_score + 20;
			END;
			283..302: BEGIN
				g_explosionX := 287;
				g_explosionY := 190;
				g_score := g_score + 15;
				g_bFuelBonus := TRUE;
			END;
		END;

		g_enemyCount := g_enemyCount + 1;
		PutPic(D_1DF2, g_explosionX, g_explosionY);

		IF g_enemyCount = 10
		THEN BEGIN
			g_bStageCleared := TRUE;
			g_enemyCount := 0;
		END;
	END;

	IF g_stage = 5
	THEN BEGIN
		CASE (g_shootX + 2) OF
			12..29: BEGIN
				g_explosionX := 15;
				g_explosionY := 170;
				g_score := g_score + 40;
				g_bAA_On[1] := FALSE;
			END;
			64..82: BEGIN
				g_explosionX := 67;
				g_explosionY := 185;
				g_barrierPower := g_barrierPower - 1;
				g_score := g_score + 20;
			END;
			84..103: BEGIN
				g_explosionX := 87;
				g_explosionY := 175;
				g_score := g_score + 15;
				g_bFuelBonus := TRUE;
			END;
			104..120: BEGIN
				g_explosionX := 107;
				g_explosionY := 185;
				g_barrierPower := g_barrierPower - 1;
				g_score := g_score + 20;
			END;
			134..151: BEGIN
				g_explosionX := 137;
				g_explosionY := 175;
			END;
			154..171: BEGIN
				g_explosionX := 157;
				g_explosionY := 180;
			END;
			174..191: BEGIN
				g_explosionX := 177;
				g_explosionY := 175;
			END;
			197..214: BEGIN
				g_explosionX := 200;
				g_explosionY := 190;
			END;
			222..239: BEGIN
				g_explosionX := 225;
				g_explosionY := 190;
			END;
			260..285: BEGIN
				g_explosionX := 265;
				g_explosionY := 180;
				g_score := g_score + 15;
				g_bFuelBonus := TRUE;
			END;
			290..312: BEGIN
				g_explosionX := 295;
				g_explosionY := 180;
				g_barrierPower := g_barrierPower - 1;
				g_score := g_score + 20;
			END;
		END;

		g_enemyCount := g_enemyCount + 1;
		PutPic(D_1DF2, g_explosionX, g_explosionY);

		IF g_enemyCount = 11
		THEN BEGIN
			g_bStageCleared := TRUE;
			g_enemyCount := 0;
		END;
	END;

	IF g_stage = 6
	THEN BEGIN
		IF g_bBallDestroyed[1] = FALSE
		THEN BEGIN
			CASE (g_shootX + 2) OF
				1..19: BEGIN
					g_explosionX := 4;
					g_explosionY := 180;
					g_barrierPower := g_barrierPower - 1;
					g_score := g_score + 20;
				END;
				30..49: BEGIN
					g_explosionX := 34;
					g_explosionY := 170;
				END;
				57..78: BEGIN
					g_explosionX := 62;
					g_explosionY := 190;
					g_score := g_score + 40;
					g_bAA_On[1] := FALSE;
				END;
				90..109: BEGIN
					g_explosionX := 94;
					g_explosionY := 180;
				END;
				123..144: BEGIN
					g_explosionX := 128;
					g_explosionY := 175;
					g_barrierPower := g_barrierPower - 1;
					g_score := g_score + 20;
				END;
				160..179: BEGIN
					g_explosionX := 164;
					g_explosionY := 180;
				END;
				187..208: BEGIN
					g_explosionX := 192;
					g_explosionY := 190;
					g_score := g_score + 40;
					g_bAA_On[2] := FALSE;
				END;
				220..239: BEGIN
					g_explosionX := 224;
					g_explosionY := 170;
				END;
				280..299: BEGIN
					g_explosionX := 285;
					g_explosionY := 180;
					g_score := g_score + 15;
					g_bFuelBonus := TRUE;
				END;
				305..320: BEGIN
					g_explosionX := 307;
					g_explosionY := 180;
					g_score := g_score + 15;
					g_bFuelBonus := TRUE;
				END;
			END;
		END ELSE BEGIN
			g_explosionX := g_ball1X;
			g_explosionY := g_ball1Y;
			g_score := g_score + 25;
			g_bBallOn[1] := FALSE;
			g_bBallDestroyed[1] := FALSE;
		END;

		g_enemyCount := g_enemyCount + 1;
		PutPic(D_1DF2, g_explosionX, g_explosionY);

		IF g_enemyCount = 11
		THEN BEGIN
			g_bStageCleared := TRUE;
			g_enemyCount := 0;
		END;
	END;

	IF g_stage = 7
	THEN BEGIN
		IF (g_bBallDestroyed[1] = FALSE) AND (g_bBallDestroyed[2] = FALSE)
		THEN BEGIN
			CASE (g_shootX + 2) OF
				7..24: BEGIN
					g_explosionX := 10;
					g_explosionY := 180;
				END;
				65..86: BEGIN
					g_explosionX := 70;
					g_explosionY := 170;
					g_score := g_score + 40;
					g_bAA_On[1] := FALSE;
				END;
				90..105: BEGIN
					g_explosionX := 92;
					g_explosionY := 190;
					g_barrierPower := g_barrierPower - 1;
					g_score := g_score + 20;
				END;
				127..143: BEGIN
					g_explosionX := 130;
					g_explosionY := 165;
				END;
				160..179: BEGIN
					g_explosionX := 164;
					g_explosionY := 165;
				END;
				200..215: BEGIN
					g_explosionX := 202;
					g_explosionY := 190;
					g_barrierPower := g_barrierPower - 1;
					g_score := g_score + 20;
				END;
				239..262: BEGIN
					g_explosionX := 245;
					g_explosionY := 180;
					g_score := g_score + 15;
					g_bFuelBonus := TRUE;
				END;
				269..290: BEGIN
					g_explosionX := 272;
					g_explosionY := 170;
				END;
			END;
		END ELSE BEGIN
			IF g_bBallDestroyed[1] = TRUE
			THEN BEGIN
				g_explosionX := g_ball1X;
				g_explosionY := g_ball1Y;
				g_score := g_score + 25;
				g_bBallOn[1] := FALSE;
				g_bBallDestroyed[1] := FALSE;
			END;

			IF g_bBallDestroyed[2] = TRUE
			THEN BEGIN
				g_explosionX := g_ball2X;
				g_explosionY := g_ball2Y;
				g_score := g_score + 25;
				g_bBallOn[2] := FALSE;
				g_bBallDestroyed[2] := FALSE;
			END;
		END;

		g_enemyCount := g_enemyCount + 1;
		PutPic(D_1DF2, g_explosionX, g_explosionY);

		IF g_enemyCount = 10
		THEN BEGIN
			g_bStageCleared := TRUE;
			g_enemyCount := 0;
		END;
	END;

	IF g_stage = 8
	THEN BEGIN
		IF (g_bBallDestroyed[1] = FALSE) AND (g_bBallDestroyed[2] = FALSE)
		THEN BEGIN
			CASE (g_shootX + 2) OF
				47..70: BEGIN
					g_explosionX := 52;
					g_explosionY := 180;
					g_barrierPower := g_barrierPower - 1;
					g_score := g_score + 20;
				END;
				88..106: BEGIN
					g_explosionX := 92;
					g_explosionY := 170;
				END;
				128..150: BEGIN
					g_explosionX := 132;
					g_explosionY := 180;
					g_score := g_score + 40;
					g_bAA_On[1] := FALSE;
				END;
				168..186: BEGIN
					g_explosionX := 172;
					g_explosionY := 170;
				END;
				208..230: BEGIN
					g_explosionX := 212;
					g_explosionY := 180;
					g_score := g_score + 15;
					g_bFuelBonus := TRUE;
				END;
				248..266: BEGIN
					g_explosionX := 252;
					g_explosionY := 170;
				END;
				295..318: BEGIN
					g_explosionX := 300;
					g_explosionY := 180;
					g_barrierPower := g_barrierPower - 1;
					g_score := g_score + 20;
				END;
			END;
		END ELSE BEGIN
			IF g_bBallDestroyed[1] = TRUE
			THEN BEGIN
				g_explosionX := g_ball1X;
				g_explosionY := g_ball1Y;
				g_score := g_score + 25;
				g_bBallOn[1] := FALSE;
				g_bBallDestroyed[1] := FALSE;
			END;
			IF g_bBallDestroyed[2] = TRUE
			THEN BEGIN
				g_explosionX := g_ball2X;
				g_explosionY := g_ball2Y;
				g_score := g_score + 25;
				g_bBallOn[2] := FALSE;
				g_bBallDestroyed[2] := FALSE;
			END;
		END;

		g_enemyCount := g_enemyCount + 1;
		PutPic(D_1DF2, g_explosionX, g_explosionY);

		IF g_enemyCount = 9
		THEN BEGIN
			g_bStageCleared := TRUE;
			g_enemyCount := 0;
		END;
	END;
	g_doExplosion := TRUE;
END;

{519C}PROCEDURE InitStage_2;
BEGIN
	PutPic(g_BG1_2, 0, 200);

	PutPic(D_1D52, 1, 190);
	PutPic(D_1D52, 21, 190);
	PutPic(D_1D52, 41, 190);
	PutPic(D_1D52, 88, 175);
	PutPic(D_1D52, 130, 180);
	PutPic(D_1D52, 150, 180);
	PutPic(D_1D52, 220, 165);
	PutPic(D_1D52, 256, 190);
END;

{5270}PROCEDURE InitStage_3;
BEGIN
	g_bAA_On[1] := TRUE;

	g_AA_1._thresholdX[1] := 130;
	g_AA_1._thresholdX[2] := 165;
	g_AA_1._thresholdX[3] := 195;
	g_AA_1._thresholdX[4] := 245;
	g_AA_1._thresholdX[5] := 280;

	g_AA_1._x := 200;
	g_AA_1._y := 176;

	PutPic(g_BG3, 0, 200);

	PutPic(D_1D52, 22, 190);
	PutPic(D_1D52, 43, 190);
	PutPic(D_1D52, 92, 180);
	PutPic(D_1D52, 137, 190);
	PutPic(D_1D52, 235, 175);
	PutPic(D_1712, 73, 185);
	PutPic(D_1712, 113, 185);
	PutPic(D_21B2, 200, 180);
	PutPic(D_2112, 200, 176);
END;

{538A}PROCEDURE InitStage_4;
BEGIN
	g_bAA_On[1] := TRUE;
	g_bBarrierdOn := TRUE;

	g_AA_1._thresholdX[1] := 5;
	g_AA_1._thresholdX[2] := 25;
	g_AA_1._thresholdX[3] := 55;
	g_AA_1._thresholdX[4] := 105;
	g_AA_1._thresholdX[5] := 125;

	g_AA_1._x := 58;
	g_AA_1._y := 181;

	g_barrierX := 242;
	g_barrierY := 0;
	g_barrierPower := 3;

	PutPic(g_BG4, 0, 200);

	PutPic(D_1D52, 15, 180);
	PutPic(D_1D52, 110, 175);
	PutPic(D_1D52, 130, 175);
	PutPic(D_1712, 150, 175);
	PutPic(D_1D52, 183, 165);
	PutPic(D_1712, 80, 175);
	PutPic(D_1712, 287, 190);
	PutPic(D_21B2, 58, 185);
	PutPic(D_2112, 58, 181);
	PutPic(D_17DA, 222, 180);
	PutPic(D_17DA, 252, 180);
	PutPic(D_10D2, 242, 164);
	{-- force fields --}
	Draw(0, 158, 35, 158, 3);
	Draw(90, 158, 210, 158, 3);
END;

{5538}PROCEDURE InitStage_5;
BEGIN
	g_bAA_On[1] := TRUE;
	g_bBarrierdOn := TRUE;

	g_AA_1._thresholdX[1] := 400;
	g_AA_1._thresholdX[2] := 10;
	g_AA_1._thresholdX[3] := 40;
	g_AA_1._thresholdX[4] := 70;
	g_AA_1._thresholdX[5] := 115;

	g_AA_1._x := 15;
	g_AA_1._y := 166;

	g_barrierX := 50;
	g_barrierY := 0;
	g_barrierPower := 4;

	PutPic(g_BG5, 0, 200);

	PutPic(D_1D52, 137, 175);
	PutPic(D_1D52, 157, 180);
	PutPic(D_1D52, 177, 175);
	PutPic(D_1D52, 200, 190);
	PutPic(D_1D52, 225, 190);
	PutPic(D_1712, 87, 175);
	PutPic(D_1712, 265, 180);
	PutPic(D_21B2, 15, 170);
	PutPic(D_2112, 15, 166);
	PutPic(D_17DA, 67, 185);
	PutPic(D_17DA, 107, 185);
	PutPic(D_17DA, 295, 180);
	PutPic(D_10D2, 50, 164);
	{-- force field --}
	Draw(52, 158, 285, 158, 3);
END;

{56DF}PROCEDURE InitStage_6;
BEGIN
	D_028C := 11;
	g_bAA_On[1] := TRUE;
	g_bAA_On[2] := TRUE;
	g_bBarrierdOn := TRUE;

	g_AA_1._thresholdX[1] := 2;
	g_AA_1._thresholdX[2] := 20;
	g_AA_1._thresholdX[3] := 57;
	g_AA_1._thresholdX[4] := 100;
	g_AA_1._thresholdX[5] := 130;

	g_AA_2._thresholdX[1] := 100;
	g_AA_2._thresholdX[2] := 140;
	g_AA_2._thresholdX[3] := 187;
	g_AA_2._thresholdX[4] := 220;
	g_AA_2._thresholdX[5] := 255;

	g_AA_1._x := 62;
	g_AA_1._y := 186;

	g_AA_2._x := 192;
	g_AA_2._y := 186;

	g_barrierX := 135;
	g_barrierY := 0;
	g_barrierPower := 3;

	{-- bouncing ball #1 --}
	g_ball1OriginX := 275;
	g_ball1OriginY := 179;
	g_ball1MinY := 100;
	g_ball1MinX := 130;
	g_ball1MaxX := 300;
	g_bBallOn[1] := TRUE;
	g_bBallDestroyed[1] := FALSE;
	g_ball1X := g_ball1OriginX;
	g_ball1Y := g_ball1OriginY;
	g_ball1IncrX := -1;
	g_ball1IncrY := -1;

	PutPic(g_BG6, 0, 200);

	PutPic(D_1D52, 34, 170);
	PutPic(D_1D52, 94, 180);
	PutPic(D_1D52, 164, 180);
	PutPic(D_1D52, 224, 170);
	PutPic(D_17DA, 4, 180);
	PutPic(D_17DA, 128, 175);
	PutPic(D_21B2, 62, 190);
	PutPic(D_2112, 62, 186);
	PutPic(D_21B2, 192, 190);
	PutPic(D_2112, 192, 186);
	PutPic(D_10D2, 135, 164);
	PutPic(D_1712, 285, 180);
	PutPic(D_1712, 307, 180);
END;

{58E1}PROCEDURE InitStage_7;
BEGIN
	D_028C := 10;
	g_bAA_On[1] := TRUE;
	g_bBarrierdOn := TRUE;

	g_AA_1._thresholdX[1] := 2;
	g_AA_1._thresholdX[2] := 20;
	g_AA_1._thresholdX[3] := 60;
	g_AA_1._thresholdX[4] := 108;
	g_AA_1._thresholdX[5] := 138;

	g_AA_1._x := 70;
	g_AA_1._y := 166;

	g_barrierX := 152;
	g_barrierY := 0;
	g_barrierPower := 3;

	{-- bouncing ball #1 --}
	g_ball1OriginX := 295;
	g_ball1OriginY := 169;
	g_ball1MinY := 100;
	g_ball1MinX := 200;
	g_ball1MaxX := 305;
	g_bBallOn[1] := TRUE;
	g_bBallDestroyed[1] := FALSE;
	g_ball1X := g_ball1OriginX;
	g_ball1Y := g_ball1OriginY;
	g_ball1IncrX := -1;
	g_ball1IncrY := -1;

	{-- bouncing ball #2 --}
	g_Ball2OriginX := 40;
	g_Ball2OriginY := 179;
	g_ball2MinY := 100;
	g_ball2MinX := 30;
	g_ball2MaxX := 100;
	g_bBallOn[2] := TRUE;
	g_bBallDestroyed[2] := FALSE;
	g_ball2X := g_Ball2OriginX;
	g_ball2Y := g_Ball2OriginY;
	g_ball2IncrX := -1;
	g_ball2IncrY := -1;

	PutPic(g_BG7, 0, 200);

	PutPic(D_1D52, 10, 180);
	PutPic(D_1D52, 130, 165);
	PutPic(D_1D52, 164, 165);
	PutPic(D_1D52, 272, 170);
	PutPic(D_17DA, 92, 190);
	PutPic(D_17DA, 202, 190);
	PutPic(D_21B2, 70, 170);
	PutPic(D_2112, 70, 166);
	PutPic(D_10D2, 152, 164);
	PutPic(D_1712, 245, 180);
END;

{5AB3}PROCEDURE InitStage_8;
BEGIN
	D_028C := 9;
	g_bAA_On[1] := TRUE;
	g_bBarrierdOn := TRUE;
	g_bMovingBarrier := TRUE;

	g_AA_1._thresholdX[1] := 15;
	g_AA_1._thresholdX[2] := 95;
	g_AA_1._thresholdX[3] := 125;
	g_AA_1._thresholdX[4] := 175;
	g_AA_1._thresholdX[5] := 210;

	g_AA_1._x := 132;
	g_AA_1._y := 176;

	g_barrierX := 80;
	g_barrierY := 0;
	g_barrierPower := 3;

	{-- bouncing ball #1 --}
	g_ball1OriginX := 290;
	g_ball1OriginY := 160;
	g_ball1MinY := 100;
	g_ball1MinX := 230;
	g_ball1MaxX := 300;
	g_bBallOn[1] := TRUE;
	g_bBallDestroyed[1] := FALSE;
	g_ball1X := g_ball1OriginX;
	g_ball1Y := g_ball1OriginY;
	g_ball1IncrX := -1;
	g_ball1IncrY := -1;

	{-- bouncing ball #2 --}
	g_Ball2OriginX := 25;
	g_Ball2OriginY := 169;
	g_ball2MinY := 100;
	g_ball2MinX := 15;
	g_ball2MaxX := 100;
	g_bBallOn[2] := TRUE;
	g_bBallDestroyed[2] := FALSE;
	g_ball2X := g_Ball2OriginX;
	g_ball2Y := g_Ball2OriginY;
	g_ball2IncrX := -1;
	g_ball2IncrY := -1;

	PutPic(g_BG8, 0, 200);

	PutPic(D_1D52, 92, 170);
	PutPic(D_1D52, 172, 170);
	PutPic(D_1D52, 252, 170);
	PutPic(D_17DA, 52, 180);
	PutPic(D_17DA, 300, 180);
	PutPic(D_21B2, 132, 180);
	PutPic(D_2112, 132, 176);
	PutPic(D_10D2, 80, 164);
	PutPic(D_1712, 212, 180);
END;
