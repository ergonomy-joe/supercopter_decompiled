PROGRAM SUPERCOP;

{
	0.05: 7C CC CC CC CC 4C
	0.95: 80 33 33 33 33 73
	1.1 : 81 CC CC CC CC 0C
}

{$I GRAPH.P}

TYPE
	t_0C8 = ARRAY[0..$c7] OF BYTE;
	t_190 = ARRAY[0..$18f] OF BYTE;
	t_0A0 = ARRAY[0..$9f] OF BYTE;
	t_028 = ARRAY[0..$27] OF BYTE;
	t_0B4 = ARRAY[0..$b3] OF BYTE;
	t_BB8 = ARRAY[0..$bb7] OF BYTE;
	t_4000 = ARRAY[0..$3fff] OF BYTE;

VAR
	D_0260:REAL;
	D_0266:REAL;
	D_026C:INTEGER;
	D_026E:INTEGER;
	D_0270:INTEGER;
	D_0272:INTEGER;
	D_0274:INTEGER;
	D_0276:INTEGER;
	D_0278:INTEGER;
	D_027A:INTEGER;
	D_027C:INTEGER;
	D_027E:INTEGER;
	D_0280:INTEGER;
	D_0282:INTEGER;
	__0284:INTEGER;
	D_0286:INTEGER;
	D_0288:INTEGER;
	D_028A:INTEGER;
	D_028C:INTEGER;
	D_028E:INTEGER;
	D_0290:INTEGER;
	D_0292:INTEGER;
	D_0294:INTEGER;
	D_0296:INTEGER;
	D_0298:INTEGER;
	D_029A:INTEGER;
	D_029C:INTEGER;
	D_029E:INTEGER;
	D_02A0:INTEGER;
	D_02A2:INTEGER;
	D_02A4:INTEGER;
	D_02A6:INTEGER;
	D_02A8:INTEGER;
	D_02AA:INTEGER;
	D_02AC:INTEGER;
	D_02AE:INTEGER;
	D_02B0:INTEGER;
	D_02B2:INTEGER;
	D_02B4:INTEGER;
	D_02B6:INTEGER;
	D_02B8:INTEGER;
	D_02BA:INTEGER;
	D_02BC:INTEGER;
	D_02BE:INTEGER;
	D_02C0:INTEGER;
	D_02C2:t_0C8;
	D_038A:t_0C8;
	D_0452:t_0C8;
	D_051A:t_0C8;
	D_05E2:t_0C8;
	D_06AA:t_0C8;
	D_0772:t_0C8;
	D_083A:t_0C8;
	D_0902:t_0C8;
	D_09CA:t_0C8;
	D_0A92:t_0C8;
	D_0B5A:t_0C8;
	D_0C22:t_0C8;
	D_0CEA:t_0C8;
	D_0DB2:t_0C8;
	D_0E7A:t_0C8;
	D_0F42:t_190;
	D_10D2:t_190;
	D_1262:t_190;
	D_13F2:t_190;
	D_1582:t_190;
	D_1712:t_0C8;
	D_17DA:t_0C8;
	D_18A2:ARRAY[0..$4af] OF BYTE;{TODO check size}
	D_1D52:t_0A0;
	D_1DF2:t_0A0;
	D_1E92:t_0A0;
	D_1F32:t_0A0;
	D_1FD2:t_0A0;
	D_2072:t_0A0;
	D_2112:t_0A0;
	D_21B2:t_0A0;
	D_2252:t_0A0;
	D_22F2:t_0A0;
	D_2392:t_028;
	D_23BA:t_028;
	D_23E2:t_0B4;
	D_2496:t_0B4;
	D_254A:t_0B4;
	D_25FE:t_0B4;
	D_26B2:t_0B4;
	D_2766:t_190;
	D_28F6:t_190;
	D_2A86:t_190;
	D_2C16:t_190;
	D_2DA6:t_190;
	D_2F36:t_BB8;
	D_3AEE:t_BB8;
	D_46A6:t_BB8;
	D_525E:t_BB8;
	D_5E16:t_BB8;
	D_69CE:t_BB8;
	D_7586:t_BB8;
	D_813E:CHAR;
	D_813F:CHAR;
	D_8140:CHAR;
	D_8141:REAL;
	D_8147:REAL;
	D_814D:REAL;
	D_8153:REAL;
	D_8159:REAL;
	D_815F:REAL;
	D_8165:REAL;
	D_816B:REAL;
	D_8171:BYTE;
	D_8172:BYTE;
	D_8173:BYTE;
	D_8174:BYTE;
	D_8175:BYTE;
	D_8176:BYTE;
	D_8177:BYTE;
	D_8178:BYTE;
	D_8179:BYTE;
	D_817A:BYTE;
	D_817B:BYTE;
	D_817C:BYTE;
	D_817D:BYTE;
	D_817E:BYTE;
	D_817F:BYTE;
	D_8180:BYTE;
	D_8181:BYTE;
	D_8182:BYTE;
	D_8183:BYTE;
	D_8184:BYTE;
	D_8185:BYTE;
	D_8186:BYTE;
	D_8187:BYTE;
	D_8188:INTEGER;
	D_818A:INTEGER;
	D_818C:INTEGER;
	D_818E:INTEGER;
	D_8190:INTEGER;
	D_8192:INTEGER;
	D_8194:INTEGER;
	D_8196:INTEGER;
	D_8198:INTEGER;
	D_819A:INTEGER;
	D_819C:INTEGER;
	D_819E:INTEGER;
	D_81A0:INTEGER;
	D_81A2:INTEGER;
	D_81A4:INTEGER;
	D_81A6:INTEGER;
	D_81A8:INTEGER;
	D_81AA:INTEGER;
	D_81AC:INTEGER;
	D_81AE:INTEGER;
	D_81B0:INTEGER;
	D_81B2:INTEGER;
	D_81B4:INTEGER;
	D_81B6:INTEGER;
	D_81B8:INTEGER;
	D_81BA:INTEGER;
	D_81BC:INTEGER;
	D_81BE:INTEGER;
	D_81C0:INTEGER;
	D_81C2:ARRAY[1..$1d] OF INTEGER;
	D_81FC:ARRAY[1..$1d] OF INTEGER;
	D_8236:ARRAY[1..$f] OF INTEGER;
	D_8254:ARRAY[1..$f] OF INTEGER;
	__8272:ARRAY[0..$31f] OF BYTE;
	D_8592:INTEGER;
	__8594:INTEGER;
	D_8596:INTEGER;
	__8598:INTEGER;
	D_859A:t_4000;
	D_C59A:FILE OF t_4000;
	D_C5E6:FILE OF t_0C8;
	D_C632:FILE OF t_190;
	D_C67E:FILE OF t_0A0;
	D_C6CA:FILE OF t_028;
	D_C716:FILE OF t_0B4;
	D_C762:FILE OF t_BB8;
{c7ae}

{MELODY}
PROCEDURE C_41AD;
LABEL C_45C0;
BEGIN
	D_81FC[1] := $5dc DIV 10;
	D_81FC[2] := $1f4 DIV 10;
	D_81FC[3] := $7d0 DIV 10;
	D_81FC[4] := $5dc DIV 10;
	D_81FC[5] := $9C4 DIV 10;
	D_81FC[6] := $3E8 DIV 10;
	D_81FC[7] := $9C4 DIV 10;
	D_81FC[8] := $5DC DIV 10;
	D_81FC[9] := $4E2 DIV 10;
	D_81FC[$a] := $9C4 DIV 10;
	D_81FC[$b] := $7D0 DIV 10;
	D_81FC[$c] := $5DC DIV 10;
	D_81FC[$d] := $5DC DIV 10;
	D_81FC[$e] := $4E2 DIV 10;
	D_81FC[$f] := $9C4 DIV 10;
	D_81FC[$10] := $7D0 DIV 10;
	D_81FC[$11] := $7D0 DIV 10;
	D_81FC[$12] := $5DC DIV 10;
	D_81FC[$13] := $DAC DIV 10;
	D_81FC[$14] := $5DC DIV 10;
	D_81FC[$15] := $9C4 DIV 10;
	D_81FC[$16] := $4E2 DIV 10;
	D_81FC[$17] := $9C4 DIV 10;
	D_81FC[$18] := $5DC DIV 10;
	D_81FC[$19] := $9C4 DIV 10;
	D_81FC[$1a] := $64 DIV 10;
	D_81FC[$1b] := $9C4 DIV 10;
	D_81FC[$1c] := $1194 DIV 10;
	D_81FC[$1d] := $9C4 DIV 10;

	D_81C2[1] := $B9;
	D_81C2[2] := 0;
	D_81C2[3] := $C4;
	D_81C2[4] := $D0;
	D_81C2[5] := $DC;
	D_81C2[6] := 0;
	D_81C2[7] := $106;
	D_81C2[8] := $F7;
	D_81C2[9] := $C4;
	D_81C2[$a] := $DC;
	D_81C2[$b] := 0;
	D_81C2[$c] := $106;
	D_81C2[$d] := $F7;
	D_81C2[$e] := $C4;
	D_81C2[$f] := $DC;
	D_81C2[$10] := 0;
	D_81C2[$11] := $C4;
	D_81C2[$12] := $F7;
	D_81C2[$13] := $B9;
	D_81C2[$14] := 0;
	D_81C2[$15] := $A5;
	D_81C2[$16] := 0;
	D_81C2[$17] := $93;
	D_81C2[$18] := $A5;
	D_81C2[$19] := $8B;
	D_81C2[$1a] := 0;
	D_81C2[$1b] := $6E;
	D_81C2[$1c] := $7B;
	D_81C2[$1d] := 0;

	D_8236[1] := $3DC; D_8254[1] := $DAC DIV 10;
	D_8236[2] := $49A; D_8254[2] := $DAC DIV 10;
	D_8236[3] := $5C8; D_8254[3] := $DAC DIV 10;
	D_8236[4] := $6E0; D_8254[4] := $EA6 DIV 10;
	D_8236[5] := $67D; D_8254[5] := $1388 DIV 10;
	D_8236[6] := 0; D_8254[6] := $9C4 DIV 10;
	D_8236[7] := $5C8; D_8254[7] := $ABE DIV 10;
	D_8236[8] := $527; D_8254[8] := $DAC DIV 10;
	D_8236[9] := $455; D_8254[9] := $BB8 DIV 10;
	D_8236[$a] := $49A; D_8254[$a] := $FA0 DIV 10;
	D_8236[$b] := $5C8; D_8254[$b] := $CB2 DIV 10;
	D_8236[$c] := $6E0; D_8254[$c] := $FA0 DIV 10;
	D_8236[$d] := $8A9; D_8254[$d] := $1194 DIV 10;
	D_8236[$e] := $7B8; D_8254[$e] := $2710 DIV 10;
	D_8236[$f] := 0; D_8254[$f] := $DAC DIV 10;
	
	FOR D_8596 := 1 TO 2
	DO FOR D_8592 := 1 TO $1D
	DO BEGIN
		IF D_81C2[D_8592] <> 0
		THEN BEGIN {4530}
			IF KEYPRESSED
			THEN GOTO C_45C0;{C_45C6}
			SOUND(D_81C2[D_8592]);
			DELAY(D_81FC[D_8592]);
		END ELSE BEGIN
			NOSOUND;
			DELAY(D_81FC[D_8592]);
		END;
	END;
	FOR D_8592 := 1 TO $F
	DO BEGIN
		IF D_8236[D_8592] <> 0
		THEN BEGIN{45A5}
			IF KEYPRESSED
			THEN GOTO C_45C0;{C_45CB}
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

PROCEDURE C_45D3;
BEGIN
	IF D_0294 = 2
	THEN BEGIN{else 46FE}
		CASE (D_0272 + 2) OF
			1..15: BEGIN
				D_0276 := 1;
				D_0278 := $be;
			END;
			$14..$23: BEGIN
				D_0276 := $15;
				D_0278 := $be;
			END;
			$28..$37: BEGIN
				D_0276 := $29;
				D_0278 := $be;
			END;
			$57..$66: BEGIN
				D_0276 := $58;
				D_0278 := $af;
			END;
			$81..$90: BEGIN
				D_0276 := $82;
				D_0278 := $b4;
			END;
			$95..$a4: BEGIN
				D_0276 := $96;
				D_0278 := $b4;
			END;
			$db..$ea: BEGIN
				D_0276 := $dc;
				D_0278 := $a5;
			END;
			$ff..$10e: BEGIN
				D_0276 := $100;
				D_0278 := $be;
			END;
		END;
		D_8188 := D_8188 + 1;
		PutPic(D_1DF2, D_0276, D_0278);
		IF D_8188 = 8
		THEN BEGIN
			D_8172 := 1;
			D_8188 := 0;
		END;
	END;
	IF D_0294 = 3
	THEN BEGIN{else 484F}
		CASE (D_0272 + 2) OF
			$15..$23: BEGIN
				D_0276 := $16;
				D_0278 := $be;
			END;
			$2a..$38: BEGIN
				D_0276 := $2b;
				D_0278 := $be;
			END;
			$42..$58: BEGIN
				D_0276 := $49;
				D_0278 := $b9;
				D_0290 := D_0290 + $f;
				D_8174 := 1
			END;
			$5b..$68: BEGIN
				D_0276 := $5c;
				D_0278 := $b4;
			END;
			$6b..$84: BEGIN
				D_0276 := $71;
				D_0278 := $b9;
				D_0290 := D_0290 + $f;
				D_8174 := 1;
			END;
			$88..$96: BEGIN
				D_0276 := $89;
				D_0278 := $be;
			END;
			$c6..$d5: BEGIN
				D_0276 := $c8;
				D_0278 := $b4;
				D_0290 := D_0290 + $28;
				D_8175 := 0;
			END;
			$ea..$f8: BEGIN
				D_0276 := $eb;
				D_0278 := $af;
			END;
		END;
		D_8188 := D_8188 + 1;
		PutPic(D_1DF2, D_0276, D_0278);
		IF D_8188 = 8
		THEN BEGIN
			D_8172 := 1;
			D_8188 := 0;
		END;
	END;
	IF D_0294 = 4
	THEN BEGIN{else 4A0B}
		CASE (D_0272 + 2) OF
			$d..$1c: BEGIN
				D_0276 := $f;
				D_0278 := $b4;
			END;
			$37..$48: BEGIN
				D_0276 := $3a;
				D_0278 := $b9;
				D_0290 := D_0290 + $28;
				D_8175 := 0;
			END;
			$4c..$5f: BEGIN
				D_0276 := $50;
				D_0278 := $af;
				D_0290 := D_0290 + $f;
				D_8174 := 1;
			END;
			$6c..$7b: BEGIN
				D_0276 := $6e;
				D_0278 := $af;
			END;
			$80..$8f: BEGIN
				D_0276 := $82;
				D_0278 := $af;
			END;
			$92..$a5: BEGIN
				D_0276 := $96;
				D_0278 := $af;
				D_0290 := D_0290 + $f;
				D_8174 := 1;
			END;
			$b5..$c4: BEGIN
				D_0276 := $b7;
				D_0278 := $a5;
			END;
			$dc..$eb: BEGIN
				D_0276 := $de;
				D_0278 := $b4;
				D_029C := D_029C - 1;
				D_0290 := D_0290 + $14;
			END;
			$fa..$109: BEGIN
				D_0276 := $fc;
				D_0278 := $b4;
				D_029C := D_029C - 1;
				D_0290 := D_0290 + $14;
			END;
			$11b..$12e: BEGIN
				D_0276 := $11f;
				D_0278 := $be;
				D_0290 := D_0290 + $f;
				D_8174 := 1;
			END;
		END;
		D_8188 := D_8188 + 1;
		PutPic(D_1DF2, D_0276, D_0278);
		IF D_8188 = $a
		THEN BEGIN
			D_8172 := 1;
			D_8188 := 0;
		END;
	END;
	IF D_0294 = 5
	THEN BEGIN{else 4BE6}
		CASE (D_0272 + 2) OF
			$c..$1d: BEGIN
				D_0276 := $f;
				D_0278 := $aa;
				D_0290 := D_0290 + $28;
				D_8175 := 0;
			END;
			$40..$52: BEGIN
				D_0276 := $43;
				D_0278 := $b9;
				D_029C := D_029C - 1;
				D_0290 := D_0290 + $14;
			END;
			$54..$67: BEGIN
				D_0276 := $57;
				D_0278 := $af;
				D_0290 := D_0290 + $f;
				D_8174 := 1;
			END;
			$68..$78: BEGIN
				D_0276 := $6b;
				D_0278 := $b9;
				D_029C := D_029C - 1;
				D_0290 := D_0290 + $14;
			END;
			$86..$97: BEGIN
				D_0276 := $89;
				D_0278 := $af;
			END;
			$9a..$ab: BEGIN
				D_0276 := $9d;
				D_0278 := $b4;
			END;
			$ae..$bf: BEGIN
				D_0276 := $b1;
				D_0278 := $af;
			END;
			$c5..$d6: BEGIN
				D_0276 := $c8;
				D_0278 := $be;
			END;
			$de..$ef: BEGIN
				D_0276 := $e1;
				D_0278 := $be;
			END;
			$104..$11d: BEGIN
				D_0276 := $109;
				D_0278 := $b4;
				D_0290 := D_0290 + $f;
				D_8174 := 1;
			END;
			$122..$138: BEGIN
				D_0276 := $127;
				D_0278 := $b4;
				D_029C := D_029C - 1;
				D_0290 := D_0290 + $14;
			END;
		END;
		D_8188 := D_8188 + 1;
		PutPic(D_1DF2, D_0276, D_0278);
		IF D_8188 = $b
		THEN BEGIN
			D_8172 := 1;
			D_8188 := 0;
		END;
	END;
	IF D_0294 = 6
	THEN BEGIN{else 4DD3}
		IF D_8181 = 0
		THEN BEGIN{else 4D7C}
			CASE (D_0272 + 2) OF
				1..$13: BEGIN
					D_0276 := 4;
					D_0278 := $b4;
					D_029C := D_029C - 1;
					D_0290 := D_0290 + $14;
				END;
				$1e..$31: BEGIN
					D_0276 := $22;
					D_0278 := $aa;
				END;
				$39..$4e: BEGIN
					D_0276 := $3e;
					D_0278 := $be;
					D_0290 := D_0290 + $28;
					D_8175 := 0;
				END;
				$5a..$6d: BEGIN
					D_0276 := $5e;
					D_0278 := $b4;
				END;
				$7b..$90: BEGIN
					D_0276 := $80;
					D_0278 := $af;
					D_029C := D_029C - 1;
					D_0290 := D_0290 + $14;
				END;
				$a0..$b3: BEGIN
					D_0276 := $a4;
					D_0278 := $b4;
				END;
				$bb..$d0: BEGIN
					D_0276 := $c0;
					D_0278 := $be;
					D_0290 := D_0290 + $28;
					D_8176 := 0;
				END;
				$dc..$ef: BEGIN
					D_0276 := $e0;
					D_0278 := $aa;
				END;
				$118..$12b: BEGIN
					D_0276 := $11d;
					D_0278 := $b4;
					D_0290 := D_0290 + $f;
					D_8174 := 1;
				END;
				$131..$140: BEGIN
					D_0276 := $133;
					D_0278 := $b4;
					D_0290 := D_0290 + $f;
					D_8174 := 1;
				END;
			END;
		END ELSE BEGIN{goto 4D9D}
			D_0276 := D_02A6;
			D_0278 := D_02A8;
			D_0290 := D_0290 + $19;
			D_817F := 0;
			D_8181 := 0;
		END;
		D_8188 := D_8188 + 1;
		PutPic(D_1DF2, D_0276, D_0278);
		IF D_8188 = $b
		THEN BEGIN
			D_8172 := 1;
			D_8188 := 0;
		END;
	END;
	IF D_0294 = 7
	THEN BEGIN{else 4FBF}
		IF (D_8181 = 0) AND (D_8182 = 0)
		THEN BEGIN{else 4F2D}
			CASE (D_0272 + 2) OF
				7..$18: BEGIN
					D_0276 := $a;
					D_0278 := $b4;
				END;
				$41..$56: BEGIN
					D_0276 := $46;
					D_0278 := $aa;
					D_0290 := D_0290 + $28;
					D_8175 := 0;
				END;
				$5a..$69: BEGIN
					D_0276 := $5c;
					D_0278 := $be;
					D_029C := D_029C - 1;
					D_0290 := D_0290 + $14;
				END;
				$7f..$8f: BEGIN
					D_0276 := $82;
					D_0278 := $a5;
				END;
				$a0..$b3: BEGIN
					D_0276 := $a4;
					D_0278 := $a5;
				END;
				$c8..$d7: BEGIN
					D_0276 := $ca;
					D_0278 := $be;
					D_029C := D_029C - 1;
					D_0290 := D_0290 + $14;
				END;
				$ef..$106: BEGIN
					D_0276 := $f5;
					D_0278 := $b4;
					D_0290 := D_0290 + $f;
					D_8174 := 1;
				END;
				$10d..$122: BEGIN
					D_0276 := $110;
					D_0278 := $aa;
				END;
			END;
		END ELSE BEGIN{goto 4F89}
			IF D_8181 = 1
			THEN BEGIN
				D_0276 := D_02A6;
				D_0278 := D_02A8;
				D_0290 := D_0290 + $19;
				D_817F := 0;
				D_8181 := 0;
			END;
			IF D_8182 = 1
			THEN BEGIN
				D_0276 := D_02AE;
				D_0278 := D_02B0;
				D_0290 := D_0290 + $19;
				D_8180 := 0;
				D_8182 := 0;
			END;
		END;
		D_8188 := D_8188 + 1;
		PutPic(D_1DF2, D_0276, D_0278);
		IF D_8188 = $a
		THEN BEGIN
			D_8172 := 1;
			D_8188 := 0;
		END;
	END;
	IF D_0294 = 8
	THEN BEGIN{else 518F}
		IF (D_8181 = 0) AND (D_8182 = 0)
		THEN BEGIN{else 50FD}
			CASE (D_0272 + 2) OF
				$2f..$46: BEGIN
					D_0276 := $34;
					D_0278 := $b4;
					D_029C := D_029C - 1;
					D_0290 := D_0290 + $14;
				END;
				$58..$6a: BEGIN
					D_0276 := $5c;
					D_0278 := $aa;
				END;
				$80..$96: BEGIN
					D_0276 := $84;
					D_0278 := $b4;
					D_0290 := D_0290 + $28;
					D_8175 := 0;
				END;
				$a8..$ba: BEGIN
					D_0276 := $ac;
					D_0278 := $aa;
				END;
				$d0..$e6: BEGIN
					D_0276 := $d4;
					D_0278 := $b4;
					D_0290 := D_0290 + $f;
					D_8174 := 1;
				END;
				$f8..$10a: BEGIN
					D_0276 := $fc;
					D_0278 := $aa;
				END;
				$127..$13e: BEGIN
					D_0276 := $12c;
					D_0278 := $b4;
					D_029C := D_029C - 1;
					D_0290 := D_0290 + $14;
				END;
			END;
		END ELSE BEGIN{goto 5159}
			IF D_8181 = 1
			THEN BEGIN
				D_0276 := D_02A6;
				D_0278 := D_02A8;
				D_0290 := D_0290 + $19;
				D_817F := 0;
				D_8181 := 0;
			END;
			IF D_8182 = 1
			THEN BEGIN
				D_0276 := D_02AE;
				D_0278 := D_02B0;
				D_0290 := D_0290 + $19;
				D_8180 := 0;
				D_8182 := 0;
			END;
		END;
		D_8188 := D_8188 + 1;
		PutPic(D_1DF2, D_0276, D_0278);
		IF D_8188 = 9
		THEN BEGIN
			D_8172 := 1;
			D_8188 := 0;
		END;
	END;
	D_8173 := 1;
END;

{2}
PROCEDURE C_519C;
BEGIN
	PutPic(D_2F36, 0, $c8);
	PutPic(D_1D52, 1, $be);
	PutPic(D_1D52, $15, $be);
	PutPic(D_1D52, $29, $be);
	PutPic(D_1D52, $58, $af);
	PutPic(D_1D52, $82, $b4);
	PutPic(D_1D52, $96, $b4);
	PutPic(D_1D52, $dc, $a5);
	PutPic(D_1D52, $100, $be);
END;

{3}
PROCEDURE C_5270;
BEGIN
	D_8175 := 1;
	D_818A := $82;
	D_818C := $a5;
	D_818E := $c3;
	D_8190 := $f5;
	D_8192 := $118;
	D_8194 := $c8;
	D_8196 := $b0;
	PutPic(D_3AEE, 0, $c8);
	PutPic(D_1D52, $16, $be);
	PutPic(D_1D52, $2b, $be);
	PutPic(D_1D52, $5c, $b4);
	PutPic(D_1D52, $89, $be);
	PutPic(D_1D52, $eb, $af);
	PutPic(D_1712, $49, $b9);
	PutPic(D_1712, $71, $b9);
	PutPic(D_21B2, $c8, $b4);
	PutPic(D_2112, $c8, $b0);
END;

{4}
PROCEDURE C_538A;
BEGIN

	D_8175 := 1;
	D_8179 := 1;
	D_818A := 5;
	D_818C := $19;
	D_818E := $37;
	D_8190 := $69;
	D_8192 := $7D;
	D_8194 := $3A;
	D_8196 := $B5;
	D_027A := $f2;
	D_026E := 0;
	D_029C := 3;
	PutPic(D_46A6, 0, $c8);
	PutPic(D_1D52, $f, $b4);
	PutPic(D_1D52, $6e, $af);
	PutPic(D_1D52, $82, $af);
	PutPic(D_1712, $96, $af);
	PutPic(D_1D52, $b7, $a5);
	PutPic(D_1712, $50, $af);
	PutPic(D_1712, $11f, $be);
	PutPic(D_21B2, $3a, $b9);
	PutPic(D_2112, $3a, $b5);
	PutPic(D_17DA, $de, $b4);
	PutPic(D_17DA, $fc, $b4);
	PutPic(D_10D2, $f2, $a4);
	Draw(0, $9e, $23, $9e, 3);
	Draw($5a, $9e, $d2, $9e, 3);
END;

{5}
PROCEDURE C_5538;
BEGIN

	D_8175 := 1;
	D_8179 := 1;
	D_818A := $190;
	D_818C := $A;
	D_818E := $28;
	D_8190 := $46;
	D_8192 := $73;
	D_8194 := $f;
	D_8196 := $A6;
	D_027A := $32;
	D_026E := 0;
	D_029C := 4;
	PutPic(D_525E, 0, $c8);
	PutPic(D_1D52, $89, $af);
	PutPic(D_1D52, $9d, $b4);
	PutPic(D_1D52, $b1, $af);
	PutPic(D_1D52, $c8, $be);
	PutPic(D_1D52, $e1, $be);
	PutPic(D_1712, $57, $af);
	PutPic(D_1712, $109, $b4);
	PutPic(D_21B2, $f, $aa);
	PutPic(D_2112, $f, $a6);
	PutPic(D_17DA, $43, $b9);
	PutPic(D_17DA, $6b, $b9);
	PutPic(D_17DA, $127, $b4);
	PutPic(D_10D2, $32, $a4);
	Draw($34, $9e, $11d,$9e, 3);
END;

{6}
PROCEDURE C_56DF;
BEGIN

	D_028C := $b;
	D_8175 := 1;
	D_8176 := 1;
	D_8179 := 1;
	D_818A := 2;
	D_818C := $14;
	D_818E := $39;
	D_8190 := $64;
	D_8192 := $82;
	D_81A4 := $64;
	D_81A6 := $8C;
	D_81A8 := $BB;
	D_81AA := $DC;
	D_81AC := $ff;
	D_8194 := $3E;
	D_8196 := $BA;
	D_81AE := $c0;
	D_81B0 := $ba;
	D_027A := $87;
	D_026E := 0;
	D_029C := 3;
	D_02A2 := $113;
	D_02A4 := $B3;
	D_028A := $64;
	D_0286 := $82;
	D_0288 := $12C;
	D_817F := 1;
	D_8181 := 0;
	D_02A6 := D_02A2;
	D_02A8 := D_02A4;
	D_0280 := $ffff;
	D_0282 := $ffff;
	PutPic(D_5E16, 0, $c8);
	PutPic(D_1D52, $22, $aa);
	PutPic(D_1D52, $5e, $b4);
	PutPic(D_1D52, $a4, $b4);
	PutPic(D_1D52, $e0, $aa);
	PutPic(D_17DA, 4, $b4);
	PutPic(D_17DA, $80, $af);
	PutPic(D_21B2, $3e, $be);
	PutPic(D_2112, $3e, $ba);
	PutPic(D_21B2, $c0, $be);
	PutPic(D_2112, $c0, $ba);
	PutPic(D_10D2, $87, $a4);
	PutPic(D_1712, $11d, $b4);
	PutPic(D_1712, $133, $b4);
END;

{7}
PROCEDURE C_58E1;
BEGIN
	D_028C := $A;
	D_8175 := 1;
	D_8179 := 1;
	D_818A := 2;
	D_818C := $14;
	D_818E := $3C;
	D_8190 := $6C;
	D_8192 := $8A;
	D_8194 := $46;
	D_8196 := $A6;
	D_027A := $98;
	D_026E := 0;
	D_029C := 3;
	D_02A2 := $127;
	D_02A4 := $A9;
	D_028A := $64;
	D_0286 := $C8;
	D_0288 := $131;
	D_817F := 1;
	D_8181 := 0;
	D_02A6 := D_02A2;
	D_02A8 := D_02A4;
	D_0280 := $ffff;
	D_0282 := $ffff;
	D_02AA := $28;
	D_02AC := $B3;
	D_02BA := $64;
	D_02B6 := $1E;
	D_02B8 := $64;
	D_8180 := 1;
	D_8182 := 0;
	D_02AE := D_02AA;
	D_02B0 := D_02AC;
	D_02B2 := $ffff;
	D_02B4 := $ffff;
	PutPic(D_69CE, 0, $c8);
	PutPic(D_1D52, $a, $b4);
	PutPic(D_1D52, $82, $a5);
	PutPic(D_1D52, $a4, $a5);
	PutPic(D_1D52, $110, $aa);
	PutPic(D_17DA, $5c, $be);
	PutPic(D_17DA, $ca, $be);
	PutPic(D_21B2, $46, $aa);
	PutPic(D_2112, $46, $a6);
	PutPic(D_10D2, $98, $a4);
	PutPic(D_1712, $f5, $b4);
END;

{8}
PROCEDURE C_5AB3;
BEGIN

	D_028C := 9;
	D_8175 := 1;
	D_8179 := 1;
	D_8183 := 1;
	D_818A := $f;
	D_818C := $5F;
	D_818E := $7D;
	D_8190 := $AF;
	D_8192 := $D2;
	D_8194 := $84;
	D_8196 := $B0;
	D_027A := $50;
	D_026E := 0;
	D_029C := 3;
	D_02A2 := $122;
	D_02A4 := $A0;
	D_028A := $64;
	D_0286 := $E6;
	D_0288 := $12C;
	D_817F := 1;
	D_8181 := 0;
	D_02A6 := D_02A2;
	D_02A8 := D_02A4;
	D_0280 := $ffff;
	D_0282 := $ffff;
	D_02AA := $19;
	D_02AC := $A9;
	D_02BA := $64;
	D_02B6 := $f;
	D_02B8 := $64;
	D_8180 := 1;
	D_8182 := 0;
	D_02AE := D_02AA;
	D_02B0 := D_02AC;
	D_02B2 := $ffff;
	D_02B4 := $ffff;
	PutPic(D_7586, 0, $c8);
	PutPic(D_1D52, $5c, $aa);
	PutPic(D_1D52, $ac, $aa);
	PutPic(D_1D52, $fc, $aa);
	PutPic(D_17DA, $34, $b4);
	PutPic(D_17DA, $12c, $b4);
	PutPic(D_21B2, $84, $b4);
	PutPic(D_2112, $84, $b0);
	PutPic(D_10D2, $50, $a4);
	PutPic(D_1712, $d4, $b4);
END;

{LOAD GAME}
PROCEDURE C_5C75;
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
	WRITE('.'); READ(D_C762, D_2F36);
	WRITE('.'); READ(D_C762, D_3AEE);
	WRITE('.'); READ(D_C762, D_46A6);
	WRITE('.'); READ(D_C762, D_525E);
	WRITE('.'); READ(D_C762, D_5E16);
	WRITE('.'); READ(D_C762, D_69CE);
	WRITE('.'); READ(D_C762, D_7586);
	CLOSE(D_C762);
END;


PROCEDURE C_6458;
BEGIN
	IF D_817D = 1
	THEN D_029E := D_02A0;
	IF D_029E < (D_02A0 DIV 3)
	THEN BEGIN{else 6515}
		IF D_026C = 1
		THEN PutPic(D_0A92, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 2
		THEN PutPic(D_0B5A, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 3
		THEN PutPic(D_0C22, TRUNC(D_0260), TRUNC(D_0266));
	END;
	IF
		(D_029E >= (D_02A0 DIV 3)) AND
		(D_029E < (2 * (D_02A0 DIV 3)))
	THEN BEGIN
		IF D_026C = 1
		THEN PutPic(D_0CEA, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 2
		THEN PutPic(D_0DB2, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 3
		THEN PutPic(D_0E7A, TRUNC(D_0260), TRUNC(D_0266));
	END;
	IF
		(D_029E >= (2 * (D_02A0 DIV 3))) AND
		(D_029E < D_02A0)
	THEN BEGIN
		IF D_026C = 1
		THEN PutPic(D_083A, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 2
		THEN PutPic(D_0902, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 3
		THEN PutPic(D_09CA, TRUNC(D_0260), TRUNC(D_0266));
	END;
	IF D_029E = D_02A0
	THEN BEGIN
		D_029E := 0;
		D_817E := 0;
	END;
END;

PROCEDURE C_66C4;
BEGIN
	IF D_817E = 1
	THEN D_029E := D_02A0;
	IF D_029E < (D_02A0 DIV 3)
	THEN BEGIN
		IF D_026C = 1
		THEN PutPic(D_083A, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 2
		THEN PutPic(D_0902, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 3
		THEN PutPic(D_09CA, TRUNC(D_0260), TRUNC(D_0266));
	END;
	IF
		(D_029E >= (D_02A0 DIV 3)) AND
		(D_029E < (2 * (D_02A0 DIV 3)))
	THEN BEGIN
		IF D_026C = 1
		THEN PutPic(D_0CEA, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 2
		THEN PutPic(D_0DB2, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 3
		THEN PutPic(D_0E7A, TRUNC(D_0260), TRUNC(D_0266));
	END;
	IF
		(D_029E >= (2 * (D_02A0 DIV 3))) AND
		(D_029E < D_02A0)
	THEN BEGIN
		IF D_026C = 1
		THEN PutPic(D_0A92, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 2
		THEN PutPic(D_0B5A, TRUNC(D_0260), TRUNC(D_0266));
		IF D_026C = 3
		THEN PutPic(D_0C22, TRUNC(D_0260), TRUNC(D_0266));
	END;
	IF D_029E = D_02A0
	THEN BEGIN
		D_029E := 0;
		D_817D := 0;
	END;
END;


PROCEDURE C_6930;
BEGIN
	D_814D := 1;
	WHILE D_814D < 5
	DO BEGIN
		IF TRUNC(D_814D) = 1
		THEN PutPic(D_28F6, TRUNC(D_0260), TRUNC(D_0266));
		IF TRUNC(D_814D) = 2
		THEN PutPic(D_2A86, TRUNC(D_0260), TRUNC(D_0266));
		IF TRUNC(D_814D) = 3
		THEN PutPic(D_2C16, TRUNC(D_0260), TRUNC(D_0266));
		IF TRUNC(D_814D) = 4
		THEN PutPic(D_2DA6, TRUNC(D_0260), TRUNC(D_0266));
		D_814D := D_814D + 0.05;
		IF D_817B = 1
		THEN SOUND($32 + TRUNC(D_814D * $96));
		DELAY(2);
		IF D_817B = 1
		THEN SOUND($6e + TRUNC(D_814D * $32));
		DELAY(2);
		NOSOUND;
		DELAY(2);
	END;
	PutPic(D_2766, TRUNC(D_0260), TRUNC(D_0266));
END;

LABEL C_6B3F;

BEGIN
	CLRSCR;
	HiRes;
	C_5C75;{LOAD GAME}
	GraphColorMode;
	ASSIGN(D_C59A, 'image.scr');
	RESET(D_C59A);
	READ(D_C59A, D_859A);
	CLOSE(D_C59A);
C_6B3F:
	PutPic(D_859A, 0, $c7);
	PutPic(D_1582, $122, $c7);
	C_41AD;{MELODY}
	DELAY($3e8);
	D_0260 := $cd;
	D_0266 := $9b;
	D_029A := 5;
	GraphColorMode;
	GOTOXY($d, 1);
	WRITE(' OPTION SCREEN ');
	GOTOXY($d, 2);
	WRITE('***************');
{6BEB}
	D_817B := 1;
	D_027E := 0;
	D_02C0 := 1;
	D_8185 := 0;
	GOTOXY($a, 8);
	WRITE('(S)OUND : ON ');
	GOTOXY($a, $c);
	WRITE('(L)EVEL : NORMAL');
	GOTOXY($a, $10);
	WRITE('(P)LAYERS : ONE');
	GOTOXY($a, $14);
	WRITE('(E)XIT TO GAME');
	D_813E := ' ';
{6C93}
	WHILE UPCASE(D_813E) <> 'E'
	DO BEGIN
		IF KEYPRESSED
		THEN READ(KBD, D_813E);

		IF UPCASE(D_813E) = 'S'
		THEN BEGIN
			IF D_817B = 1
			THEN BEGIN
				D_817B := 0;
				GOTOXY($14, 8);
				WRITE('OFF');
			END ELSE BEGIN
				D_817B := 1;
				GOTOXY($14, 8);
				WRITE('ON ');
			END;
			D_813E := ' ';
		END;

		IF UPCASE(D_813E) = 'L'
		THEN BEGIN
			D_02C0 := D_02C0 + 1;
			IF D_02C0 = 4
			THEN D_02C0 := 0;
			GOTOXY($14,$c);
			IF D_02C0 = 0
			THEN BEGIN
				WRITE('EASY  ');
				D_027E := 0;
				D_029A := 8;
			END;
			IF D_02C0 = 1
			THEN BEGIN
				WRITE('NORMAL');
				D_027E := 0;
				D_029A := 5;
			END;
			IF D_02C0 = 2
			THEN BEGIN
				WRITE('MEDIUM');
				D_027E := 1;
				D_029A := 5;
			END;
			IF D_02C0 = 3
			THEN BEGIN
				WRITE('HARD  ');
				D_027E := 2;
				D_029A := 5;
			END;
			D_813E := ' ';
		END;

		IF UPCASE(D_813E) = 'P'
		THEN BEGIN
			IF D_8185 = 1
			THEN BEGIN
				D_8185 := 0;
				GOTOXY($16, $10);
				WRITE('ONE');
			END ELSE BEGIN
				D_8185 := 1;
				GOTOXY($16, $10);
				WRITE('TWO');
			END;
			D_813E := ' ';
		END;
	END;
{6E55}
	D_0294 := 1;
	D_027C := 0;
	GraphColorMode;
	IF D_8185 = 1
	THEN BEGIN{else 6EE9}
		D_817C := 0;
		D_81B6 := D_029A;
		D_81B8 := D_029A;
		D_81BA := 0;
		D_81BC := 0;
		D_819C := D_027C;
		D_819E := D_027E;
		D_81A0 := D_027C;
		D_81A2 := D_027E;
		D_8186 := 0;
		D_8187 := 0;
		D_81BE := D_0294;
		D_81C0 := D_0294;
		GOTOXY($10, $c);
		WRITE('PLAYER ONE');
		DELAY($5dc);
	END;
	GraphColorMode;
	D_026E := 0;
	D_8141 := 0;
	D_0290 := 0;
	D_0292 := 0;
	D_026C := 0;
	D_029C := 0;
	GOTOXY(1, 1);
	WRITE('SCORE ', D_0290:4, ' OIL ');
	GOTOXY($18, 1);
	WRITE('LIFE ', D_029A);
	GOTOXY($20, 1);
	WRITE('FAST');
	FillPattern($78, 0, $b5, 6, 3);
	D_8171 := 0;
	D_8173 := 0;
	D_8179 := 0;
	D_817A := 0;
	D_813E := 'G';
	D_813F := 'M';
	D_8153 := $c8;
	D_0296 := $3d;
	D_8175 := 0;
	D_8177 := 0;
	D_817D := 0;
	D_817E := 1;
	D_8176 := 0;
	D_8178 := 0;
	D_817F := 0;
	D_8180 := 0;
	D_8183 := 0;
	D_8184 := 0;
	D_8172 := 1;
	D_8188 := 0;
	D_8147 := 1;
	D_02BE := 2;
	PutPic(D_2F36, 0, $c1);
{704D}
	WHILE D_0260 < $142
	DO BEGIN
		IF D_0260 < 1
		THEN D_0260 := 1;
		IF (D_0260 > $11f) AND (D_8172 = 1)
		THEN BEGIN{else 725B}
			D_8176 := 0;
			D_8178 := 0;
			D_8175 := 0;
			D_8173 := 0;
			D_8179 := 0;
			D_8183 := 0;
			D_8171 := 0;
			D_8177 := 0;
			D_8147 := 1;
			D_817A := 0;
			D_817D := 0;
			D_817E := 0;
			D_0260 := 1;
			D_029C := 0;
			GetPic(D_18A2, 0, 0, $13f, 8);
			GraphColorMode;
			PutPic(D_18A2, 0, 8);
			D_0294 := D_0294 + 1;
			IF D_0294 > 8
			THEN D_0294 := 1;
			IF D_0294 = 1
			THEN BEGIN{else 71BE}
				PutPic(D_2F36, 0, $c1);
				D_027C := D_027C + 1;
				IF D_027C = 5
				THEN BEGIN
					D_027C := 0;
					D_027E := D_027E + 1;
					IF D_027E = 3
					THEN D_027E := 2;
				END;
			END;
			IF D_0294 = 2
			THEN C_519C;
			IF D_0294 = 3
			THEN C_5270;
			IF D_0294 = 4
			THEN C_538A;
			IF D_0294 = 5
			THEN C_5538;
			IF D_0294 = 6
			THEN C_56DF;
			IF D_0294 = 7
			THEN C_58E1;
			IF D_0294 = 8
			THEN C_5AB3;
			IF D_0294 <> 1
			THEN D_8172 := 0;
		END;
{725B}
		IF (D_0260 > $11f) AND (D_8172 = 0)
		THEN D_0260 := D_0260 - 1;
		IF D_0266 > $9c
		THEN D_0266 := $9c;
		IF D_0266 < $19
		THEN D_0266 := $19;
		D_026C := D_026C + 1;
		IF D_026C = 4
		THEN D_026C := 1;
		IF KEYPRESSED
		THEN READ(KBD, D_813E);
		IF D_813E = 'I'
		THEN BEGIN
			IF D_813F IN ['G','O','K']
			THEN D_817E := 1
			ELSE BEGIN
{734E}
				D_0266 := D_0266 - (1 / D_02BE);
				D_0260 := D_0260 + (1 / D_02BE);
			END;
			D_8141 := 0;
			D_813F := D_813E;
			D_8140 := D_813E;
		END;
{73B0}
		IF D_813E = 'Q'
		THEN BEGIN
			IF D_813F IN ['G','O','K']
			THEN D_817E := 1
			ELSE BEGIN
				D_0266 := D_0266 + (1 / D_02BE);
				D_0260 := D_0260 + (1 / D_02BE);
			END;
			D_8141 := 0;
			D_813F := D_813E;
			D_8140 := D_813E;
		END;
{744B}
		IF D_813E = 'G'
		THEN BEGIN
			IF D_813F IN ['I','Q','M']
			THEN D_817D := 1
			ELSE BEGIN
				D_0266 := D_0266 - (1 / D_02BE);
				D_0260 := D_0260 - (1 / D_02BE);
			END;
			D_8141 := 1;
			D_813F := D_813E;
			D_8140 := D_813E;
		END;
{74E6}
		IF D_813E = 'O'
		THEN BEGIN
			IF D_813F IN ['I','Q','M']
			THEN D_817D := 1
			ELSE BEGIN
				D_0266 := D_0266 + (1 / D_02BE);
				D_0260 := D_0260 - (1 / D_02BE);
			END;
			D_8141 := 1;
			D_813F := D_813E;
			D_8140 := D_813E;
		END;
{7581}
		IF D_813E = 'H'
		THEN BEGIN
			D_0266 := D_0266 - (1 / D_02BE);
			D_8140 := D_813E;
		END;
		IF D_813E = 'P'
		THEN BEGIN
			D_0266 := D_0266 + (1 / D_02BE);
			D_8140 := D_813E;
		END;
		IF D_813E = 'K'
		THEN BEGIN
			IF D_813F IN ['I','Q','M']
			THEN D_817D := 1
			ELSE D_0260 := D_0260 - (1 / D_02BE);
			D_8141 := 1;
			D_813F := D_813E;
			D_8140 := D_813E;
		END;
{7668}
		IF D_813E = 'M'
		THEN BEGIN
			IF D_813F IN ['G','O','K']
			THEN D_817E := 1
			ELSE D_0260 := D_0260 + (1 / D_02BE);
			D_8141 := 0;
			D_813F := D_813E;
			D_8140 := D_813E;
		END;
{76E1}
		IF D_813E = 'R'
		THEN D_8140 := D_813E;
{76F6}
		IF UPCASE(D_813E) = 'V'
		THEN BEGIN
			IF D_02BE = 1
			THEN BEGIN
				D_02BE := 2;
				GOTOXY($20, 1);
				WRITE('SLOW');
			END ELSE IF D_02BE = 2
			THEN BEGIN
				D_02BE := 1;
				GOTOXY($20, 1);
				WRITE('FAST');
			END;
			D_813E := D_8140;
		END;
{7763}
		IF D_813E = ' '
		THEN BEGIN{else 77F7}
			IF (D_8171 = 0) AND (D_0266 < $96) AND (D_8173 = 0)
			THEN BEGIN{else 77F7}
				D_8171 := 1;
				D_0272 := TRUNC(D_0260) + $a;
				IF D_8141 = 0
				THEN D_0272 := D_0272 + $d;
				D_0274 := TRUNC(D_0266) + 2;
				D_813E := D_8140;
			END;
		END;
{77F7}
		IF (D_817E = 0) AND (D_817D = 0)
		THEN BEGIN{else 7962}
			IF D_8141 = 0
			THEN BEGIN{else 78C0}
				IF D_026C = 1
				THEN PutPic(D_038A, TRUNC(D_0260), TRUNC(D_0266));
				IF D_026C = 2
				THEN PutPic(D_0452, TRUNC(D_0260), TRUNC(D_0266));
				IF D_026C = 3
				THEN PutPic(D_051A, TRUNC(D_0260), TRUNC(D_0266));
			END;
			IF D_8141 = 1
			THEN BEGIN{else 7962}
				IF D_026C = 1
				THEN PutPic(D_05E2, TRUNC(D_0260), TRUNC(D_0266));
				IF D_026C = 2
				THEN PutPic(D_06AA, TRUNC(D_0260), TRUNC(D_0266));
				IF D_026C = 3
				THEN PutPic(D_0772, TRUNC(D_0260), TRUNC(D_0266));
			END;
		END;
{7962}
		IF D_817E = 1
		THEN BEGIN
			D_029E := D_029E + 1;
			D_02A0 := $2d;
			C_6458;
		END;
		IF D_817D = 1
		THEN BEGIN
			D_029E := D_029E + 1;
			D_02A0 := $2d;
			C_66C4;
		END;
		IF D_8171 = 1
		THEN BEGIN{else 7EF6}
			IF D_8141 = 1
			THEN D_0272 := D_0272 - 1
			ELSE D_0272 := D_0272 + 1;
			D_0274 := D_0274 + 1;
			IF
				(GetDotColor(D_0272 + 1, D_0274 + 1) = 2) OR
				(GetDotColor(D_0272 + 2, D_0274 + 1) = 2) OR
				(GetDotColor(D_0272 + 3, D_0274 + 1) = 2) OR
				(GetDotColor(D_0272 + 4, D_0274 - 2) = 2) OR
				(GetDotColor(D_0272, D_0274 - 2) = 2)
			THEN BEGIN{else 7B3D}
				D_0292 := D_0290;
				PutPic(D_23BA, D_0272, D_0274);
				C_45D3;
				D_8171 := 0;
				D_0290 := D_0290 + $a;
				GOTOXY(7, 1);
				WRITE(D_0290:4);
				IF (D_0292 DIV $3e8) < (D_0290 DIV $3e8)
				THEN BEGIN{else 7B3D}
					D_029A := D_029A + 1;
					D_0292 := D_0290;
					GOTOXY($1d, 1);
					WRITE(D_029A);
				END;
			END;
{7B3D}
			IF
				(GetDotColor(D_0272 + 1, D_0274 + 1) = 3) OR
				(GetDotColor(D_0272 + 2, D_0274 + 1) = 3) OR
				(GetDotColor(D_0272 + 3, D_0274 + 1) = 3) OR
				(GetDotColor(D_0272 + 4, D_0274 - 2) = 3) OR
				(GetDotColor(D_0272, D_0274 - 2) = 3)
			THEN BEGIN{else 7E1B}
				D_8171 := 0;
				PutPic(D_23BA, D_0272, D_0274);
				IF
					(D_817F = 1) AND
					(D_0274 < $9c) AND
					(D_0272 >= (D_02A6 - 7)) AND
					(D_0272 <= (D_02A6 + 7)) AND
					(D_0274 >= (D_02A8 - 7)) AND
					(D_0274 <= (D_02A8 + 7))
				THEN BEGIN{else 7D19}
					D_8181 := 1;
					D_0292 := D_0290;
					C_45D3;
					D_0290 := D_0290 + $a;
					GOTOXY(7, 1);
					WRITE(D_0290:4);
					IF (D_0292 DIV $3e8) < (D_0290 DIV $3e8)
					THEN BEGIN{else 7D19}
						D_029A := D_029A + 1;
						D_0292 := D_0290;
						GOTOXY($1d, 1);
						WRITE(D_029A);
					END;
				END;
{7D19}
				IF
					(D_8180 = 1) AND
					(D_0274 < $9c) AND
					(D_0272 >= (D_02AE - 7)) AND
					(D_0272 <= (D_02AE + 7)) AND
					(D_0274 >= (D_02B0 - 7)) AND
					(D_0274 <= (D_02B0 + 7))
				THEN BEGIN{else 7E1B}
					D_8182 := 1;
					D_0292 := D_0290;
					C_45D3;
					D_0290 := D_0290 + $a;
					GOTOXY(7, 1);
					WRITE(D_0290:4);
					IF (D_0292 DIV $3e8) < (D_0290 DIV $3e8)
					THEN BEGIN{7E1B}
						D_029A := D_029A + 1;
						D_0292 := D_0290;
						GOTOXY($1d, 1);
						WRITE(D_029A);
					END;
				END;
			END;
{7E1B}
			IF (D_0274 > $c3) OR (D_0272 < 2) OR (D_0272 > $13a)
			THEN BEGIN
				D_8171 := 0;
				PutPic(D_23BA, D_0272, D_0274);
			END;
			IF
				(D_8179 = 1) AND
				(((D_0272 + 5) = D_027A) OR ((D_0272 - 1) = D_027A)) AND
				(D_0274 < $9e)
			THEN BEGIN
				D_8171 := 0;
				PutPic(D_23BA, D_0272, D_0274);
			END;
			IF D_8171 = 1
			THEN PutPic(D_2392, D_0272, D_0274);
		END;
{7EF6}
		IF D_8173 = 1
		THEN BEGIN{else 7FFD}
			IF TRUNC(D_8147) = 1
			THEN PutPic(D_23E2, D_0276, D_0278);
			IF TRUNC(D_8147) = 2
			THEN PutPic(D_2496, D_0276, D_0278);
			IF TRUNC(D_8147) = 3
			THEN PutPic(D_254A, D_0276, D_0278);
			IF TRUNC(D_8147) = 4
			THEN PutPic(D_25FE, D_0276, D_0278);
			IF TRUNC(D_8147) = 5
			THEN BEGIN
				PutPic(D_26B2, D_0276, D_0278);
				D_8147 := 0.95;
				D_8173 := 0;
			END;
			D_8147 := D_8147 + 0.05;
		END;
		IF D_8147 > 1.1
		THEN BEGIN{else 803E}
			IF D_817B = 1
			THEN SOUND($1e + D_028E);
			D_028E := D_028E + 1;
			DELAY(1);
		END ELSE BEGIN{goto 80AC}
			IF D_8171 = 0
			THEN BEGIN{else 8086}
				IF D_817B = 1
				THEN SOUND($1e);
				D_028E := 0;
				DELAY(1);
				IF D_817B = 1
				THEN SOUND($7d00);
				DELAY(1);
			END ELSE BEGIN{goto 80AC}
				IF D_817B = 1
				THEN SOUND($640 + D_028E);
				D_028E := D_028E + $32;
				DELAY(1);
			END;
		END;
		D_8153 := D_8153 - 1;
		IF D_8174 = 1
		THEN BEGIN{else 811F}
			D_0298 := D_0296 + 9;
			IF D_0298 > $3c
			THEN D_0298 := $3c;
			FillPattern($78 + D_0296, 0, $78 + D_0298, 6, 3);
			D_0296 := D_0298 + 1;
			D_8174 := 0;
		END;
{811F}
		IF D_8153 = 0
		THEN BEGIN{else 8170}
			D_0296 := D_0296 - 1;
			Draw($78 + D_0296, 0, $78 + D_0296, 6, 2);
			D_8153 := $c8;
		END;
{8170}
		IF (D_0296 = $a) AND (D_8153 = $c7)
		THEN BEGIN{else 81A3}
			SOUND($7d0);
			DELAY($64);
		END;
{81A3}
		IF (D_027E >= 1) AND (D_8153 = $85)
		THEN BEGIN{else 81F8}
			D_0296 := D_0296 - 1;
			Draw($78 + D_0296, 0, $78 + D_0296, 6, 2);
		END;
{81F8}
		IF (D_027E >= 2) AND (D_8153 = $42)
		THEN BEGIN
			D_0296 := D_0296 - 1;
			Draw($78 + D_0296, 0, $78 + D_0296, 6, 2);
		END;
{824D}
		IF D_0296 = 0
		THEN D_817A := 1;
		IF D_8175 = 1
		THEN BEGIN{else 8722}
			IF
				((TRUNC(D_0260) = D_818A) OR (TRUNC(D_0260) = (D_818A + $14))) AND
				(D_8177 = 1)
			THEN PutPic(D_1E92, D_8194, D_8196);
			IF
				((TRUNC(D_0260) = D_818A) OR (TRUNC(D_0260) = D_818A + $14)) AND
				(D_8177 = 0)
			THEN BEGIN{else 835A}
				PutPic(D_1E92, D_8194, D_8196);
				D_815F := D_8194;
				D_819A := D_8196 - 5;
				D_8159 := -2;
				D_8177 := 1;
			END;
{835A}
			IF
				((TRUNC(D_0260) = D_818C) OR (TRUNC(D_0260) = (D_818C + $14))) AND
				(D_8177 = 1)
			THEN PutPic(D_1F32, D_8194, D_8196);
			IF
				((TRUNC(D_0260) = D_818C) OR (TRUNC(D_0260) = (D_818C + $14))) AND
				(D_8177 = 0)
			THEN BEGIN{else 844C}
				PutPic(D_1F32, D_8194, D_8196);
				D_815F := D_8194 + 2;
				D_819A := D_8196 - 6;
				D_8159 := -1;
				D_8177 := 1;
			END;
{844C}
			IF
				((TRUNC(D_0260) = D_818E) OR  (TRUNC(D_0260) = (D_818E + $14))) AND
				(D_8177 = 1)
			THEN PutPic(D_2112, D_8194, D_8196);
{84AE}
			IF
				((TRUNC(D_0260) = D_818E) OR (TRUNC(D_0260) = (D_818E + $14))) AND
				(D_8177 = 0)
			THEN BEGIN
				PutPic(D_2112, D_8194, D_8196);
				D_815F := D_8194 + 5;
				D_819A := D_8196 - 7;
				D_8159 := 0;
				D_8177 := 1;
			END;
{853E}
			IF
				((TRUNC(D_0260) = D_8190) OR (TRUNC(D_0260) = (D_8190 + $14))) AND
				(D_8177 = 1)
			THEN PutPic(D_2072, D_8194, D_8196);
			IF
				((TRUNC(D_0260) = D_8190) OR (TRUNC(D_0260) = (D_8190 + $14))) AND
				(D_8177 = 0)
			THEN BEGIN
				PutPic(D_2072, D_8194, D_8196);
				D_815F := D_8194 + 8;
				D_819A := D_8196 - 6;
				D_8159 := 1;
				D_8177 := 1;
			END;
{8630}
			IF
				((TRUNC(D_0260) = D_8192) OR (TRUNC(D_0260) = (D_8192 + $14))) AND
				(D_8177 = 1)
			THEN PutPic(D_1FD2, D_8194, D_8196);
			IF
				((TRUNC(D_0260) = D_8192) OR (TRUNC(D_0260) = (D_8192 + $14))) AND
				(D_8177 = 0)
			THEN BEGIN{else 8722}
				PutPic(D_1FD2, D_8194, D_8196);
				D_815F := D_8194 + $a;
				D_819A := D_8196 - 5;
				D_8159 := 2;
				D_8177 := 1;
			END;
		END;
{8722}
		IF D_8177 = 1
		THEN BEGIN{else 88D8}
			D_8198 := ROUND(D_815F);
			Plot(D_8198, D_819A, 0);
			D_819A := D_819A - 2;
			D_815F := D_815F + D_8159;
			IF
				(D_815F > (D_0260 + $e)) AND
				(D_819A < $9e)
			THEN D_815F := D_815F - D_027C / 4;
			IF
				(D_815F < (D_0260 + $e)) AND
				(D_819A < $9e)
			THEN D_815F := D_815F + D_027C / 4;
			D_8198 := ROUND(D_815F);
			Plot(D_8198, D_819A, 1);
			IF
				(GetDotColor(D_8198, D_819A - 1) = 2) OR
				(GetDotcolor(D_8198, D_819A - 2) = 2)
			THEN D_817A := 1;
			IF
				(D_819A <= $c) OR
				(D_8198 <= 2) OR
				(D_8198 >= $13e)
			THEN BEGIN{else 88D8}
				Plot(D_8198, D_819A, 0);
				D_8177 := 0;
			END;
		END;

{88D8}
		IF D_8176 = 1
		THEN BEGIN{else 8D98}
{88E5}
			IF
				((D_0260 = D_81A4) OR (TRUNC(D_0260) = (D_81A4 + $14))) AND
				(D_8178 = 1)
			THEN PutPic(D_1E92, D_81AE, D_81B0);
			IF
				((TRUNC(D_0260) = D_81A4) OR (TRUNC(D_0260) = (D_81A4 + $14))) AND
				(D_8178 = 0)
			THEN BEGIN
				PutPic(D_1E92, D_81AE, D_81B0);
				D_816B := D_81AE;
				D_81B4 := D_81B0 - 5;
				D_8165 := -2;
				D_8178 := 1;
			END;
{89D0}
			IF
				((TRUNC(D_0260) = D_81A6) OR (TRUNC(D_0260) = (D_81A6 + $14))) AND
				(D_8178 = 1)
			THEN PutPic(D_1F32, D_81AE, D_81B0);
			IF
				((TRUNC(D_0260) = D_81A6) OR (TRUNC(D_0260) = (D_81A6 + $14))) AND
				(D_8178 = 0)
			THEN BEGIN
				PutPic(D_1F32, D_81AE, D_81B0);
				D_816B := D_81AE + 2;
				D_81B4 := D_81B0 - 6;
				D_8165 := -1;
				D_8178 := 1;
			END;
{8AC2}
			IF
				((TRUNC(D_0260) = D_81A8) OR (TRUNC(D_0260) = (D_81A8 + $14))) AND
				(D_8178 = 1)
			THEN PutPic(D_2112, D_81AE, D_81B0);
			IF
				((TRUNC(D_0260) = D_81A8) OR (TRUNC(D_0260) = (D_81A8 + $14))) AND
				(D_8178 = 0)
			THEN BEGIN
				PutPic(D_2112, D_81AE, D_81B0);
				D_816B := D_81AE + 5;
				D_81B4 := D_8196 - 7;
				D_8165 := 0;
				D_8178 := 1;
			END;
{8BB4}
			IF
				((TRUNC(D_0260) = D_81AA) OR (TRUNC(D_0260) = (D_81AA + $14))) AND
				(D_8178 = 1)
			THEN PutPic(D_2072, D_81AE, D_81B0);
			IF
				((TRUNC(D_0260) = D_81AA) OR (TRUNC(D_0260) = (D_81AA + $14))) AND
				(D_8178 = 0)
			THEN BEGIN{else 8CA6}
				PutPic(D_2072, D_81AE, D_81B0);
				D_816B := D_81AE + 8;
				D_81B4 := D_81B0 - 6;
				D_8165 := 1;
				D_8178 := 1;
			END;
{8CA6}
			IF
				((TRUNC(D_0260) = D_81AC) OR (TRUNC(D_0260) = (D_81AC + $14))) AND
				(D_8178 = 1)
			THEN PutPic(D_1FD2, D_81AE, D_81B0);
			IF
				((TRUNC(D_0260) = D_81AC) OR (TRUNC(D_0260) = (D_81AC + $14))) AND
				(D_8178 = 0)
			THEN BEGIN{else 8CA6}
				PutPic(D_1FD2, D_81AE, D_81B0);
				D_816B := D_81AE + $a;
				D_81B4 := D_81B0 - 5;
				D_8165 := 2;
				D_8178 := 1;
			END;
		END;
{8D98}
		IF D_8178 = 1
		THEN BEGIN{else 8F4E}
			D_81B2 := ROUND(D_816B);
			Plot(D_81B2, D_81B4, 0);
			D_81B4 := D_81B4 - 2;
			D_816B := D_816B + D_8165;
			IF (D_816B > (D_0260 + $e)) AND (D_819A < $9e)
			THEN D_816B := D_816B - (D_027C / 4);
			IF (D_816B < (D_0260 + $e)) AND (D_819A < $9e)
			THEN D_816B := D_816B + (D_027C / 4);
			D_81B2 := ROUND(D_816B);
			Plot(D_81B2, D_81B4, 1);
			IF
				(GetDotColor(D_81B2, D_81B4 - 1) = 2) OR
				(GetDotColor(D_81B2, D_81B4 - 2) = 2)
			THEN D_817A := 1;
			IF (D_81B4 <= $c) OR (D_81B2 <= 2) OR (D_81B2 >= $13e)
			THEN BEGIN{else 8F4E}
				Plot(D_81B2, D_81B4, 0);
				D_8178 := 0;
			END;
		END;
{8F4E}
		IF (D_8179 = 1) AND (D_029C = 2)
		THEN BEGIN
			Draw(0, $9e, $13f, $9e, 0);
			D_029C := 1;
		END;
		IF (D_8179 = 1) AND (D_029C = 0)
		THEN BEGIN{else 8FDD}
			D_8179 := 0;
			D_8183 := 0;
			PutPic(D_0F42, D_027A, $a4);
		END;
{8FDD}
		IF (D_8183 = 1) AND (D_8179 = 1)
		THEN BEGIN{else 928D}
			IF
				((TRUNC(D_0260) = (D_027A + 1)) OR (TRUNC(D_0260) = (D_027A + $1e))) AND
				(D_8141 = 0) AND
				(D_8184 = 0)
			THEN BEGIN{else 9101}
				IF D_027A < $a1
				THEN BEGIN{else 90FE}
					PutPic(D_0F42, D_027A, $a4);
					D_027A := D_027A + $50;
					IF D_026E = $b
					THEN PutPic(D_10D2, D_027A, $a4);
					IF D_026E = $17
					THEN PutPic(D_1262, D_027A, $a4);
					IF D_026E = $23
					THEN PutPic(D_13F2, D_027A, $a4);
					D_8184 := 1;
				END;
				{goto 928D}
			END ELSE IF
				((TRUNC(D_0260) = (D_027A - $3a)) OR ((TRUNC(D_0260) + $1c) = D_027A)) AND
				(D_8141 = 1) AND
				(D_8184 = 0)
			THEN BEGIN{else 91FA}
				IF D_027A > $50
				THEN BEGIN{else 91F7}
					PutPic(D_0F42, D_027A, $a4);
					D_027A := D_027A - $50;
					IF D_026E = $b
					THEN PutPic(D_10D2, D_027A, $a4);
					IF D_026E = $17
					THEN PutPic(D_1262, D_027A, $a4);
					IF D_026E = $23
					THEN PutPic(D_13F2, D_027A, $a4);
					D_8184 := 1;
				END;
				{goto 928D}
			END ELSE IF
				(
					(TRUNC(D_0260) <> (D_027A + 1)) OR
					(TRUNC(D_0260) <> (D_027A + $1e)) OR
					(TRUNC(D_0260) <> (D_027A - $3a)) OR
					((TRUNC(D_0260) + $1c) <> D_027A)
				) AND
				(D_8184 = 1)
			THEN BEGIN
				D_8184 := 0;
			END;
		END;
{928D}
		IF D_8179 = 1
		THEN BEGIN{else 93B7}
			IF D_8153 = $42
			THEN BEGIN
				PutPic(D_10D2, D_027A, $a4);
				D_026E := $b;
			END;
			IF D_8153 = $85
			THEN BEGIN
				PutPic(D_1262, D_027A, $a4);
				D_026E := $17;
			END;
			IF D_8153 = $c7
			THEN BEGIN
				PutPic(D_13F2, D_027A, $a4);
				D_026E := $23;
			END;
			D_0270 := D_026E;
{9333}
			WHILE (D_026E < $a0) AND (D_026E > 0)
			DO BEGIN
				IF
					(GetDotColor(D_027A, D_026E - 1) = 2) OR
					(GetDotColor(D_027A, D_026E + 4) = 2)
				THEN D_817A := 1;
				D_026E := D_026E + $24;
			END;
{93B1}
			D_026E := D_0270;
		END;
{93B7}
		IF D_817F = 1
		THEN BEGIN{else 9573}
			PutPic(D_2252, D_02A6, D_02A8);
			IF
				(GetDotColor(D_02A6 - 1, D_02A8 + 1) = 2) OR
				(GetDotColor(D_02A6 - 1, D_02A8 - 6) = 2) OR
				(GetDotColor(D_02A6 + 6, D_02A8 + 1) = 2) OR
				(GetDotColor(D_02A6 + 6, D_02A8 - 6) = 2)
			THEN BEGIN
				D_817A := 1;
				PutPic(D_22F2, D_02A6, D_02A8);
			END;
			IF (D_02A6 = D_0286) AND (D_0280 = -1)
			THEN BEGIN
				D_0286 := RANDOM($96) + $a;
				D_0280 := 1;
			END;
			IF (D_02A6 = D_0288) AND (D_0280 = 1)
			THEN BEGIN
				D_0288 := RANDOM($8c) + $a5;
				D_0280 := -1;
			END;
			IF (D_02A8 = D_028A) AND (D_0282 = -1)
			THEN BEGIN
				D_028A := RANDOM($82) + $f;
				D_0282 := 1;
			END;
			IF (D_02A8 = $9c) AND (D_0282 = 1)
			THEN BEGIN
				D_0282 := -1;
				RANDOMIZE;
			END;
			D_02A6 := D_02A6 + D_0280;
			D_02A8 := D_02A8 + D_0282;
		END;
{9573}
		IF (D_8180 = 1) AND (D_817A = 0)
		THEN BEGIN{else 9749}
			PutPic(D_2252, D_02AE, D_02B0);
			IF
				(GetDotColor(D_02AE - 1, D_02B0 + 1) = 2) OR
				(GetDotColor(D_02AE - 1, D_02B0 - 6) = 2) OR
				(GetDotColor(D_02AE + 6, D_02B0 + 1) = 2) OR
				(GetDotColor(D_02AE + 6, D_02B0 - 6) = 2)
			THEN BEGIN
				D_817A := 1;
				PutPic(D_22F2, D_02AE, D_02B0);
			END;
			IF (D_02AE = D_02B6) AND (D_02B2 = -1)
			THEN BEGIN
				D_02B6 := RANDOM(5) + $a;
				D_02B2 := 1;
			END;
			IF (D_02AE = D_02B8) AND (D_02B2 = 1)
			THEN BEGIN
				D_02B8 := RANDOM($8c) + $a5;
				D_02B2 := -1;
			END;
			IF (D_02B0 = D_02BA) AND (D_02B4 = -1)
			THEN BEGIN
				D_02BA := RANDOM($82) + $f;
				D_02B4 := 1;
			END;
			IF (D_02B0 = $9c) AND (D_02B4 = 1)
			THEN BEGIN
				D_02B4 := -1;
				RANDOMIZE;
			END;
			D_02AE := D_02AE + D_02B2;
			D_02B0 := D_02B0 + D_02B4;
		END;
{9749}
		IF D_817A = 1
		THEN BEGIN{else A37F}
			D_029A := D_029A - 1;
			NOSOUND;
			D_817D := 0;
			D_817E := 0;
			IF D_029A > -1
			THEN BEGIN{else 9E45}
				IF D_8177 = 1
				THEN Plot(D_8198, D_819A, 0);
				IF D_8178 = 1
				THEN Plot(D_81B2, D_81B4, 0);
				IF D_8171 = 1
				THEN PutPic(D_23BA, D_0272, D_0274);
				D_026C := 0;
				PutPic(D_0F42, D_027A, $a4);
				IF D_8183 = 1
				THEN D_027A := $50;
				D_02BC := TRUNC(D_0266);
				D_0266 := TRUNC(D_0266);
				WHILE D_0266 < $9c
				DO BEGIN
					D_0266 := D_0266 + 1;
					D_02A0 := ($c8 DIV (TRUNC(D_0266) + $a - D_02BC)) * 3;
					D_029E := 0;
					D_817D := 1;
{988C}
					WHILE (D_817D = 1) AND (D_0266 < $9c)
					DO BEGIN
						D_026C := D_026C + 1;
						IF D_026C = 4
						THEN D_026C := 1;
						D_029E := D_029E + 1;
						IF D_817B = 1
						THEN SOUND($3c + 5 * TRUNC(D_0266));
						DELAY(3);
						IF D_817B = 1
						THEN SOUND($38e - 5 * TRUNC(D_0266));
						DELAY(3);
						IF D_817B = 1
						THEN SOUND($c8 + TRUNC(D_0266));
						DELAY(3);
						IF D_817B = 1
						THEN SOUND($38e - 5 * TRUNC(D_0266));
						DELAY(3);
						C_66C4;
						IF (D_029E MOD 3) = 0
						THEN D_0266 := D_0266 + 1;
					END;
{99C1}
					FOR D_029E := 1 TO 4
					DO BEGIN
						IF D_0266 < $9c
						THEN BEGIN{else 9B6F}
							IF D_817B = 1
							THEN SOUND($3c + 5 * TRUNC(D_0266));
							DELAY(3);
							IF D_817B = 1
							THEN SOUND($38e - 5 * TRUNC(D_0266));
							DELAY(3);
							IF D_817B = 1
							THEN SOUND($c8 + TRUNC(D_0266));
							DELAY(3);
							IF D_817B = 1
							THEN SOUND($38e - 5 * TRUNC(D_0266));
							DELAY(3);
							D_026C := D_026C + 1;
							IF D_026C = 4
							THEN D_026C := 1;
							IF D_026C = 1
							THEN PutPic(D_05E2, TRUNC(D_0260), TRUNC(D_0266));
							IF D_026C = 2
							THEN PutPic(D_06AA, TRUNC(D_0260), TRUNC(D_0266));
							IF D_026C = 3
							THEN PutPic(D_0772, TRUNC(D_0260), TRUNC(D_0266));
							IF (D_029E MOD 3) = 0
							THEN D_0266 := D_0266 + 1;
						END;
					END;
{9B7A}
					FOR D_029E := 1 TO 4
					DO BEGIN
						IF D_0266 < $9c
						THEN BEGIN{else 9D28}
							IF D_817B = 1
							THEN SOUND($3c + 5 * TRUNC(D_0266));
							DELAY(3);
							IF D_817B = 1
							THEN SOUND($38e - 5 * TRUNC(D_0266));
							DELAY(3);
							IF D_817B = 1
							THEN SOUND($c8 + TRUNC(D_0266));
							DELAY(3);
							IF D_817B = 1
							THEN SOUND($38e - 5 * TRUNC(D_0266));
							DELAY(3);
							D_026C := D_026C + 1;
							IF D_026C = 4
							THEN D_026C := 1;
							IF D_026C = 1
							THEN PutPic(D_038A, TRUNC(D_0260), TRUNC(D_0266));
							IF D_026C = 2
							THEN PutPic(D_0452, TRUNC(D_0260), TRUNC(D_0266));
							IF D_026C = 3
							THEN PutPic(D_051A, TRUNC(D_0260), TRUNC(D_0266));
							IF (D_029E MOD 3) = 0
							THEN D_0266 := D_0266 + 1;
						END;
					END;
				END;
{9D36}
				PutPic(D_02C2, TRUNC(D_0260), TRUNC(D_0266));
				C_6930;
				NOSOUND;
				DELAY($1f4);
				D_0260 := $a;
				D_0266 := $1e;
				IF D_8185 = 1
				THEN BEGIN{else 9E3F}
					IF D_817C = 0
					THEN BEGIN{else 9DF2}
						D_81B6 := D_029A;
						D_81BA := D_0290;
						D_81BE := D_0294;
						D_819C := D_027C;
						D_819E := D_027E;
						IF D_81B8 <> 0
						THEN BEGIN
							D_029A := D_81B8;
							D_0290 := D_81BC;
							D_0294 := D_81C0;
							D_817C := 1;
							D_027C := D_81A0;
							D_027E := D_81A2;
						END;
						{goto 9E3f}
					END ELSE BEGIN
						D_81B8 := D_029A;
						D_81BC := D_0290;
						D_81C0 := D_0294;
						D_81A0 := D_027C;
						D_81A2 := D_027E;
						IF D_81B6 <> 0
						THEN BEGIN
							D_029A := D_81B6;
							D_0290 := D_81BA;
							D_0294 := D_81BE;
							D_817C := 0;
							D_027C := D_819C;
							D_027E := D_819E;
						END;
					END;
				END;
				D_813E := 'R';
			END;
{9E45}
			IF D_8185 = 0
			THEN BEGIN{else 9F4D}
				IF D_029A > 0
				THEN BEGIN
					GraphColorMode;
					GOTOXY($10, $c);
					WRITE('PLAYER ONE');
					DELAY($5dc);
					GraphColorMode;
				END;
				IF D_029A = 0
				THEN BEGIN{else 9F4A}
					GraphColorMode;
					GOTOXY(7, 6);
					WRITE('SCORE PLAYER ONE IS : ', D_0290:4);
					GOTOXY(1, $c);
					WRITE('GAME OVER, WOULD YOU LIKE TO RESTART ?');
					READ(KBD, D_813E);
					IF UPCASE(D_813E) = 'Y'
					THEN GOTO C_6B3F
					ELSE BEGIN
						HiRes;
						HALT;
					END;
				END;
				{goto A1B7}
			END ELSE BEGIN
				IF (D_81B6 = 0) AND (D_8186 = 0)
				THEN BEGIN
					GraphColorMode;
					D_8186 := 1;
					GOTOXY($a, $c);
					WRITE('PLAYER ONE GAME OVER');
					DELAY($5dc);
					WRITE('                    ');
					{goto A050}
				END ELSE IF (D_81B8 = 0) AND (D_8187 = 0)
				THEN BEGIN{else A050}
					GraphColorMode;
					D_8187 := 1;
					GOTOXY($a, $c);
					WRITE('PLAYER TWO GAME OVER');
					DELAY($5dc);
					WRITE('                    ');
				END;
{A050}
				IF (D_81B6 = 0) AND (D_81B8 = 0)
				THEN BEGIN{else A153}
					GraphColorMode;
					GOTOXY(7, 6);
					WRITE('SCORE PLAYER ONE IS : ', D_81BA:4);
					GOTOXY(7, 8);
					WRITE('SCORE PLAYER TWO IS : ', D_81BC:4);
					GOTOXY(1, $c);
					WRITE('GAME OVER, WOULD YOU LIKE TO RESTART ?');
					READ(KBD, D_813E);
					IF UPCASE(D_813E) = 'Y'
					THEN GOTO C_6B3F
					ELSE BEGIN
						HiRes;
						HALT;
					END;
				END;

{A153}
				GraphColorMode;
				GOTOXY($10, $c);
				IF D_817C = 0
				THEN WRITE('PLAYER ONE');
				IF D_817C = 1
				THEN WRITE('PLAYER TWO');
				DELAY($5dc);
				GraphColorMode;
			END;
{A1B7}
			D_817F := 0;
			D_8180 := 0;
			D_8176 := 0;
			D_8178 := 0;
			D_8175 := 0;
			D_8173 := 0;
			D_8179 := 0;
			D_8183 := 0;
			D_8171 := 0;
			D_8177 := 0;
			D_8147 := 1;
			D_817A := 0;
			D_817D := 0;
			D_817E := 0;
			D_0260 := 1;
			D_029C := 0;
			D_02BE := 1;
			D_8153 := $c8;
			D_0296 := $3d;
			GOTOXY(1, 1);
			WRITE('SCORE ', D_0290:4, ' OIL ');
			GOTOXY($18, 1);
			WRITE('LIFE ', D_029A);
			GOTOXY($20, 1);
			WRITE('FAST');
			FillPattern($78, 0, $b5, 6, 3);
			D_8188 := 0;
			IF D_0294 = 1
			THEN BEGIN
				PutPic(D_2F36, 0, $c1);
				D_8172 := 1;
			END;
			IF D_0294 = 2
			THEN C_519C;
			IF D_0294 = 3
			THEN C_5270;
			IF D_0294 = 4
			THEN C_538A;
			IF D_0294 = 5
			THEN C_5538;
			IF D_0294 = 6
			THEN C_56DF;
			IF D_0294 = 7
			THEN C_58E1;
			IF D_0294 = 8
			THEN C_5AB3;
		END;
	END;
END.
