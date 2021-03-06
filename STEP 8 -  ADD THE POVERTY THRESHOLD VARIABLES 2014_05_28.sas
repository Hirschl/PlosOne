*STEP 8 - ADD THE POVERTY THRESHOLD VARIABLES;

LIBNAME PSID "U:\1Projects\PSID\WAVE37\WORKFILES";


*import the poverty threshold excel file;

PROC IMPORT OUT= PSID.PT 
            DATAFILE= "U:\1Projects\PSID\WAVE37\SOURCEFILES\Poverty Threshold - Dataset.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="Sheet1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

** create PSID.MERGEPT;
** begin with the 1968 pt base year where all other year's PTs will be appended.  rename it as mergept;

DATA PTYEAR1968 
(KEEP =
PT1_1968 		
PT1_LT65_1968 	
PT1_GE65_1968  	
PT2_1968 		
PT2_LT65_1968  	
PT2_GE65_1968  	
PT3_1968 		
PT4_1968 		
PT5_1968 		
PT6_1968 		
PT7P_1968		
PT7_1968 		
PT8_1968 		
PT9P_1968		
PTAVGCPO_1968 	
);
SET PSID.PT;
WHERE PTYEAR = 1968;
PT1_1968 		= PT1	;
PT1_LT65_1968 	= PT1_LT65;
PT1_GE65_1968  	= PT1_GE65;
PT2_1968 		= PT2	;		
PT2_LT65_1968  	= PT2_LT65;
PT2_GE65_1968  	= PT2_GE65;
PT3_1968 		= PT3	;
PT4_1968 		= PT4	;
PT5_1968 		= PT5	;
PT6_1968 		= PT6	;
PT7P_1968		= PT7P 	;
PT7_1968 		= PT7	;
PT8_1968 		= PT8	;
PT9P_1968		= PT9P	;
PTAVGCPO_1968 	= PTAVGCPO;
RUN;

DATA PSID.MERGEPT;
SET PTYEAR1968;
RUN;

**create the 1969 to 2011 pts, and merge each year's PT to MERGEPT;

%MACRO PT;

%DO I = 1969 %TO 2011 ;
DATA PTYEAR&I 
(KEEP =
PT1_&I 		
PT1_LT65_&I 	
PT1_GE65_&I  	
PT2_&I 		
PT2_LT65_&I  	
PT2_GE65_&I  	
PT3_&I 		
PT4_&I 		
PT5_&I 		
PT6_&I 		
PT7P_&I		
PT7_&I 		
PT8_&I 		
PT9P_&I		
PTAVGCPO_&I 	
);
SET PSID.PT;
WHERE PTYEAR = &I;
PT1_&I 		= PT1	;
PT1_LT65_&I 	= PT1_LT65;
PT1_GE65_&I  	= PT1_GE65;
PT2_&I 		= PT2	;		
PT2_LT65_&I  	= PT2_LT65;
PT2_GE65_&I  	= PT2_GE65;
PT3_&I 		= PT3	;
PT4_&I 		= PT4	;
PT5_&I 		= PT5	;
PT6_&I 		= PT6	;
PT7P_&I		= PT7P 	;
PT7_&I 		= PT7	;
PT8_&I 		= PT8	;
PT9P_&I		= PT9P	;
PTAVGCPO_&I 	= PTAVGCPO;
RUN;

DATA PSID.MERGEPT;
MERGE PSID.MERGEPT PTYEAR&I;
RUN;

%END;
%MEND PT;
%PT


**add the poverty threshold variables;


PROC SQL;
CREATE TABLE HOUSEHOLDHEADSELECTEDVARSPTW AS
SELECT *
FROM PSID.HOUSEHOLDHEADSELECTEDVARSYRBORNW, (SELECT * FROM PSID.MERGEPT)
ORDER BY ER30001, ER30002;
QUIT;

*RESULTS:  73,140 OBSERVATIONS REMAINING;


%MACRO FAMINC;

DATA PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW (DROP = PT1_1968--PTAVGCPO_2011);
SET HOUSEHOLDHEADSELECTEDVARSPTW;

%DO I = 1968 %TO 1997; 

	 IF NUMINFU&I = 1 THEN PT&I = PT1_&I;
ELSE IF NUMINFU&I = 2 THEN PT&I = PT2_&I;
ELSE IF NUMINFU&I = 3 THEN PT&I = PT3_&I;
ELSE IF NUMINFU&I = 4 THEN PT&I = PT4_&I;
ELSE IF NUMINFU&I = 5 THEN PT&I = PT5_&I;
ELSE IF NUMINFU&I = 6 THEN PT&I = PT6_&I;
ELSE IF NUMINFU&I = 7 THEN PT&I = PT7_&I;
ELSE IF NUMINFU&I = 8 THEN PT&I = PT8_&I;
ELSE IF NUMINFU&I GE 9 THEN PT&I = PT9P_&I;

POVERTY05_&I = 0;
POVERTY10_&I = 0;
POVERTY125_&I = 0;
POVERTY15_&I = 0;


/*IT'S EITHER TOTFAMINC = . OR NUMINFU = . THEREFORE PT = .*/

IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < (0.5*PT&I) THEN POVERTY05_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < PT&I THEN POVERTY10_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < (1.25*PT&I) THEN POVERTY125_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < (1.5*PT&I) THEN POVERTY15_&I = 1;

AFFLUENCE08_&I = 0;
AFFLUENCE09_&I = 0;
AFFLUENCE10_&I = 0;
AFFLUENCE11_&I = 0;
AFFLUENCE12_&I = 0;

IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (8*PT&I)  THEN AFFLUENCE08_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (9*PT&I)  THEN AFFLUENCE09_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (10*PT&I) THEN AFFLUENCE10_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (11*PT&I) THEN AFFLUENCE11_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (12*PT&I) THEN AFFLUENCE12_&I = 1;

IF TOTFAMINC&I = . OR  NUMINFU&I = . THEN 
	DO;
		POVERTY05_&I = .;
		POVERTY10_&I = .;
		POVERTY125_&I = .;
		POVERTY15_&I = .;
		AFFLUENCE08_&I = .;
		AFFLUENCE09_&I = .;
		AFFLUENCE10_&I = .;
		AFFLUENCE11_&I = .;
		AFFLUENCE12_&I = .;
	END;

%END;

%DO I = 1999 %TO 2011 %BY 2;

	 IF NUMINFU&I  = 1 THEN PT&I = PT1_&I;
ELSE IF NUMINFU&I  = 2 THEN PT&I = PT2_&I;
ELSE IF NUMINFU&I  = 3 THEN PT&I = PT3_&I;
ELSE IF NUMINFU&I  = 4 THEN PT&I = PT4_&I;
ELSE IF NUMINFU&I  = 5 THEN PT&I = PT5_&I;
ELSE IF NUMINFU&I  = 6 THEN PT&I = PT6_&I;
ELSE IF NUMINFU&I  = 7 THEN PT&I = PT7_&I;
ELSE IF NUMINFU&I  = 8 THEN PT&I = PT8_&I;
ELSE IF NUMINFU&I GE 9 THEN PT&I = PT9P_&I;

/*HERE YOU CAN INSERT A CODE THAT WHILL CHECK IF THE PERSON IS CENSORED --EG DIED THAT YEAR OR MOVED OUT
WHAT VARIABLE THOUGH?*/

POVERTY05_&I = 0;
POVERTY10_&I = 0;
POVERTY125_&I = 0;
POVERTY15_&I = 0;

IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < (0.5*PT&I) THEN POVERTY05_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < PT&I THEN POVERTY10_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < (1.25*PT&I) THEN POVERTY125_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I < (1.5*PT&I) THEN POVERTY15_&I = 1;

AFFLUENCE08_&I = 0;
AFFLUENCE09_&I = 0;
AFFLUENCE10_&I = 0;
AFFLUENCE11_&I = 0;
AFFLUENCE12_&I = 0;

IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (8*PT&I)  THEN AFFLUENCE08_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (9*PT&I)  THEN AFFLUENCE09_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (10*PT&I) THEN AFFLUENCE10_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (11*PT&I) THEN AFFLUENCE11_&I = 1;
IF TOTFAMINC&I NE . AND NUMINFU&I NE . AND TOTFAMINC&I GE (12*PT&I) THEN AFFLUENCE12_&I = 1;


IF TOTFAMINC&I = . OR  NUMINFU&I = . THEN 
	DO;
		POVERTY05_&I = .;
		POVERTY10_&I = .;
		POVERTY125_&I = .;
		POVERTY15_&I = .;
		AFFLUENCE08_&I = .;
		AFFLUENCE09_&I = .;
		AFFLUENCE10_&I = .;
		AFFLUENCE11_&I = .;
		AFFLUENCE12_&I = .;
	END;

%END;

NUMINFU2004 = INT(MEAN(NUMINFU2003,NUMINFU2005));

	 IF NUMINFU2004  = 1 THEN PT2004 = PT1_2004;
ELSE IF NUMINFU2004  = 2 THEN PT2004 = PT2_2004;
ELSE IF NUMINFU2004  = 3 THEN PT2004 = PT3_2004;
ELSE IF NUMINFU2004  = 4 THEN PT2004 = PT4_2004;
ELSE IF NUMINFU2004  = 5 THEN PT2004 = PT5_2004;
ELSE IF NUMINFU2004  = 6 THEN PT2004 = PT6_2004;
ELSE IF NUMINFU2004  = 7 THEN PT2004 = PT7_2004;
ELSE IF NUMINFU2004  = 8 THEN PT2004 = PT8_2004;
ELSE IF NUMINFU2004 GE 9 THEN PT2004 = PT9P_2004;

RUN;

%MEND FAMINC;
%FAMINC;
*RESULTS:  61,585 OBSERVATIONS REMAINING;


DATA PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW;
SET PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW;

IF POVERTY15_1968 NE . OR WELFARE_1968 NE . OR FAMINC50_1968 NE . THEN P15WELFY50_1968 = SUM(POVERTY15_1968,WELFARE_1968,FAMINC50_1968)>0;
IF POVERTY15_1969 NE . OR WELFARE_1969 NE . OR FAMINC50_1969 NE . THEN P15WELFY50_1969 = SUM(POVERTY15_1969,WELFARE_1969,FAMINC50_1969)>0;
IF POVERTY15_1970 NE . OR WELFARE_1970 NE . OR FAMINC50_1970 NE . THEN P15WELFY50_1970 = SUM(POVERTY15_1970,WELFARE_1970,FAMINC50_1970)>0;
IF POVERTY15_1971 NE . OR WELFARE_1971 NE . OR FAMINC50_1971 NE . THEN P15WELFY50_1971 = SUM(POVERTY15_1971,WELFARE_1971,FAMINC50_1971)>0;
IF POVERTY15_1972 NE . OR WELFARE_1972 NE . OR FAMINC50_1972 NE . THEN P15WELFY50_1972 = SUM(POVERTY15_1972,WELFARE_1972,FAMINC50_1972)>0;
IF POVERTY15_1973 NE . OR WELFARE_1973 NE . OR FAMINC50_1973 NE . THEN P15WELFY50_1973 = SUM(POVERTY15_1973,WELFARE_1973,FAMINC50_1973)>0;
IF POVERTY15_1974 NE . OR WELFARE_1974 NE . OR FAMINC50_1974 NE . THEN P15WELFY50_1974 = SUM(POVERTY15_1974,WELFARE_1974,FAMINC50_1974)>0;
IF POVERTY15_1975 NE . OR WELFARE_1975 NE . OR FAMINC50_1975 NE . THEN P15WELFY50_1975 = SUM(POVERTY15_1975,WELFARE_1975,FAMINC50_1975)>0;
IF POVERTY15_1976 NE . OR WELFARE_1976 NE . OR FAMINC50_1976 NE . THEN P15WELFY50_1976 = SUM(POVERTY15_1976,WELFARE_1976,FAMINC50_1976)>0;
IF POVERTY15_1977 NE . OR WELFARE_1977 NE . OR FAMINC50_1977 NE . THEN P15WELFY50_1977 = SUM(POVERTY15_1977,WELFARE_1977,FAMINC50_1977)>0;
IF POVERTY15_1978 NE . OR WELFARE_1978 NE . OR FAMINC50_1978 NE . THEN P15WELFY50_1978 = SUM(POVERTY15_1978,WELFARE_1978,FAMINC50_1978)>0;
IF POVERTY15_1979 NE . OR WELFARE_1979 NE . OR FAMINC50_1979 NE . THEN P15WELFY50_1979 = SUM(POVERTY15_1979,WELFARE_1979,FAMINC50_1979)>0;
IF POVERTY15_1980 NE . OR WELFARE_1980 NE . OR FAMINC50_1980 NE . THEN P15WELFY50_1980 = SUM(POVERTY15_1980,WELFARE_1980,FAMINC50_1980)>0;
IF POVERTY15_1981 NE . OR WELFARE_1981 NE . OR FAMINC50_1981 NE . THEN P15WELFY50_1981 = SUM(POVERTY15_1981,WELFARE_1981,FAMINC50_1981)>0;
IF POVERTY15_1982 NE . OR WELFARE_1982 NE . OR FAMINC50_1982 NE . THEN P15WELFY50_1982 = SUM(POVERTY15_1982,WELFARE_1982,FAMINC50_1982)>0;
IF POVERTY15_1983 NE . OR WELFARE_1983 NE . OR FAMINC50_1983 NE . THEN P15WELFY50_1983 = SUM(POVERTY15_1983,WELFARE_1983,FAMINC50_1983)>0;
IF POVERTY15_1984 NE . OR WELFARE_1984 NE . OR FAMINC50_1984 NE . THEN P15WELFY50_1984 = SUM(POVERTY15_1984,WELFARE_1984,FAMINC50_1984)>0;
IF POVERTY15_1985 NE . OR WELFARE_1985 NE . OR FAMINC50_1985 NE . THEN P15WELFY50_1985 = SUM(POVERTY15_1985,WELFARE_1985,FAMINC50_1985)>0;
IF POVERTY15_1986 NE . OR WELFARE_1986 NE . OR FAMINC50_1986 NE . THEN P15WELFY50_1986 = SUM(POVERTY15_1986,WELFARE_1986,FAMINC50_1986)>0;
IF POVERTY15_1987 NE . OR WELFARE_1987 NE . OR FAMINC50_1987 NE . THEN P15WELFY50_1987 = SUM(POVERTY15_1987,WELFARE_1987,FAMINC50_1987)>0;
IF POVERTY15_1988 NE . OR WELFARE_1988 NE . OR FAMINC50_1988 NE . THEN P15WELFY50_1988 = SUM(POVERTY15_1988,WELFARE_1988,FAMINC50_1988)>0;
IF POVERTY15_1989 NE . OR WELFARE_1989 NE . OR FAMINC50_1989 NE . THEN P15WELFY50_1989 = SUM(POVERTY15_1989,WELFARE_1989,FAMINC50_1989)>0;
IF POVERTY15_1990 NE . OR WELFARE_1990 NE . OR FAMINC50_1990 NE . THEN P15WELFY50_1990 = SUM(POVERTY15_1990,WELFARE_1990,FAMINC50_1990)>0;
IF POVERTY15_1991 NE . OR WELFARE_1991 NE . OR FAMINC50_1991 NE . THEN P15WELFY50_1991 = SUM(POVERTY15_1991,WELFARE_1991,FAMINC50_1991)>0;
IF POVERTY15_1992 NE . OR WELFARE_1992 NE . OR FAMINC50_1992 NE . THEN P15WELFY50_1992 = SUM(POVERTY15_1992,WELFARE_1992,FAMINC50_1992)>0;
IF POVERTY15_1993 NE . OR WELFARE_1993 NE . OR FAMINC50_1993 NE . THEN P15WELFY50_1993 = SUM(POVERTY15_1993,WELFARE_1993,FAMINC50_1993)>0;
IF POVERTY15_1994 NE . OR WELFARE_1994 NE . OR FAMINC50_1994 NE . THEN P15WELFY50_1994 = SUM(POVERTY15_1994,WELFARE_1994,FAMINC50_1994)>0;
IF POVERTY15_1995 NE . OR WELFARE_1995 NE . OR FAMINC50_1995 NE . THEN P15WELFY50_1995 = SUM(POVERTY15_1995,WELFARE_1995,FAMINC50_1995)>0;
IF POVERTY15_1996 NE . OR WELFARE_1996 NE . OR FAMINC50_1996 NE . THEN P15WELFY50_1996 = SUM(POVERTY15_1996,WELFARE_1996,FAMINC50_1996)>0;
IF POVERTY15_1997 NE . OR WELFARE_1997 NE . OR FAMINC50_1997 NE . THEN P15WELFY50_1997 = SUM(POVERTY15_1997,WELFARE_1997,FAMINC50_1997)>0;
IF FAMINC50_1998 NE . THEN P15WELFY50_1998 = FAMINC50_1998;
IF POVERTY15_1999 NE . OR WELFARE_1999 NE . OR FAMINC50_1999 NE . THEN P15WELFY50_1999 = SUM(POVERTY15_1999,WELFARE_1999,FAMINC50_1999)>0;
IF FAMINC50_2000 NE . THEN P15WELFY50_2000 = FAMINC50_2000;
IF POVERTY15_2001 NE . OR WELFARE_2001 NE . OR FAMINC50_2001 NE . THEN P15WELFY50_2001 = SUM(POVERTY15_2001,WELFARE_2001,FAMINC50_2001)>0;
IF FAMINC50_2002 NE . THEN P15WELFY50_2002 = FAMINC50_2002;
IF POVERTY15_2003 NE . OR WELFARE_2003 NE . OR FAMINC50_2003 NE . THEN P15WELFY50_2003 = SUM(POVERTY15_2003,WELFARE_2003,FAMINC50_2003)>0;
IF POVERTY15_2005 NE . OR WELFARE_2005 NE . OR FAMINC50_2005 NE . THEN P15WELFY50_2005 = SUM(POVERTY15_2005,WELFARE_2005,FAMINC50_2005)>0;
IF POVERTY15_2007 NE . OR WELFARE_2007 NE . OR FAMINC50_2007 NE . THEN P15WELFY50_2007 = SUM(POVERTY15_2007,WELFARE_2007,FAMINC50_2007)>0;
IF POVERTY15_2009 NE . OR WELFARE_2009 NE . OR FAMINC50_2009 NE . THEN P15WELFY50_2009 = SUM(POVERTY15_2009,WELFARE_2009,FAMINC50_2009)>0;
IF POVERTY15_2011 NE . OR WELFARE_2011 NE . OR FAMINC50_2011 NE . THEN P15WELFY50_2011 = SUM(POVERTY15_2011,WELFARE_2011,FAMINC50_2011)>0;


IF POVERTY15_1968 NE . OR WELFARE_1968 NE . OR FAMINC50_1968 NE . OR UNEMPLOYMENT_1968 NE . THEN P15WY50UNE_1968 = SUM(POVERTY15_1968,WELFARE_1968,FAMINC50_1968,UNEMPLOYMENT_1968)>0;
IF POVERTY15_1969 NE . OR WELFARE_1969 NE . OR FAMINC50_1969 NE . OR UNEMPLOYMENT_1969 NE . THEN P15WY50UNE_1969 = SUM(POVERTY15_1969,WELFARE_1969,FAMINC50_1969,UNEMPLOYMENT_1969)>0;
IF POVERTY15_1970 NE . OR WELFARE_1970 NE . OR FAMINC50_1970 NE . OR UNEMPLOYMENT_1970 NE . THEN P15WY50UNE_1970 = SUM(POVERTY15_1970,WELFARE_1970,FAMINC50_1970,UNEMPLOYMENT_1970)>0;
IF POVERTY15_1971 NE . OR WELFARE_1971 NE . OR FAMINC50_1971 NE . OR UNEMPLOYMENT_1971 NE . THEN P15WY50UNE_1971 = SUM(POVERTY15_1971,WELFARE_1971,FAMINC50_1971,UNEMPLOYMENT_1971)>0;
IF POVERTY15_1972 NE . OR WELFARE_1972 NE . OR FAMINC50_1972 NE . OR UNEMPLOYMENT_1972 NE . THEN P15WY50UNE_1972 = SUM(POVERTY15_1972,WELFARE_1972,FAMINC50_1972,UNEMPLOYMENT_1972)>0;
IF POVERTY15_1973 NE . OR WELFARE_1973 NE . OR FAMINC50_1973 NE . OR UNEMPLOYMENT_1973 NE . THEN P15WY50UNE_1973 = SUM(POVERTY15_1973,WELFARE_1973,FAMINC50_1973,UNEMPLOYMENT_1973)>0;
IF POVERTY15_1974 NE . OR WELFARE_1974 NE . OR FAMINC50_1974 NE . OR UNEMPLOYMENT_1974 NE . THEN P15WY50UNE_1974 = SUM(POVERTY15_1974,WELFARE_1974,FAMINC50_1974,UNEMPLOYMENT_1974)>0;
IF POVERTY15_1975 NE . OR WELFARE_1975 NE . OR FAMINC50_1975 NE . OR UNEMPLOYMENT_1975 NE . THEN P15WY50UNE_1975 = SUM(POVERTY15_1975,WELFARE_1975,FAMINC50_1975,UNEMPLOYMENT_1975)>0;
IF POVERTY15_1976 NE . OR WELFARE_1976 NE . OR FAMINC50_1976 NE . OR UNEMPLOYMENT_1976 NE . THEN P15WY50UNE_1976 = SUM(POVERTY15_1976,WELFARE_1976,FAMINC50_1976,UNEMPLOYMENT_1976)>0;
IF POVERTY15_1977 NE . OR WELFARE_1977 NE . OR FAMINC50_1977 NE . OR UNEMPLOYMENT_1977 NE . THEN P15WY50UNE_1977 = SUM(POVERTY15_1977,WELFARE_1977,FAMINC50_1977,UNEMPLOYMENT_1977)>0;
IF POVERTY15_1978 NE . OR WELFARE_1978 NE . OR FAMINC50_1978 NE . OR UNEMPLOYMENT_1978 NE . THEN P15WY50UNE_1978 = SUM(POVERTY15_1978,WELFARE_1978,FAMINC50_1978,UNEMPLOYMENT_1978)>0;
IF POVERTY15_1979 NE . OR WELFARE_1979 NE . OR FAMINC50_1979 NE . OR UNEMPLOYMENT_1979 NE . THEN P15WY50UNE_1979 = SUM(POVERTY15_1979,WELFARE_1979,FAMINC50_1979,UNEMPLOYMENT_1979)>0;
IF POVERTY15_1980 NE . OR WELFARE_1980 NE . OR FAMINC50_1980 NE . OR UNEMPLOYMENT_1980 NE . THEN P15WY50UNE_1980 = SUM(POVERTY15_1980,WELFARE_1980,FAMINC50_1980,UNEMPLOYMENT_1980)>0;
IF POVERTY15_1981 NE . OR WELFARE_1981 NE . OR FAMINC50_1981 NE . OR UNEMPLOYMENT_1981 NE . THEN P15WY50UNE_1981 = SUM(POVERTY15_1981,WELFARE_1981,FAMINC50_1981,UNEMPLOYMENT_1981)>0;
IF POVERTY15_1982 NE . OR WELFARE_1982 NE . OR FAMINC50_1982 NE . OR UNEMPLOYMENT_1982 NE . THEN P15WY50UNE_1982 = SUM(POVERTY15_1982,WELFARE_1982,FAMINC50_1982,UNEMPLOYMENT_1982)>0;
IF POVERTY15_1983 NE . OR WELFARE_1983 NE . OR FAMINC50_1983 NE . OR UNEMPLOYMENT_1983 NE . THEN P15WY50UNE_1983 = SUM(POVERTY15_1983,WELFARE_1983,FAMINC50_1983,UNEMPLOYMENT_1983)>0;
IF POVERTY15_1984 NE . OR WELFARE_1984 NE . OR FAMINC50_1984 NE . OR UNEMPLOYMENT_1984 NE . THEN P15WY50UNE_1984 = SUM(POVERTY15_1984,WELFARE_1984,FAMINC50_1984,UNEMPLOYMENT_1984)>0;
IF POVERTY15_1985 NE . OR WELFARE_1985 NE . OR FAMINC50_1985 NE . OR UNEMPLOYMENT_1985 NE . THEN P15WY50UNE_1985 = SUM(POVERTY15_1985,WELFARE_1985,FAMINC50_1985,UNEMPLOYMENT_1985)>0;
IF POVERTY15_1986 NE . OR WELFARE_1986 NE . OR FAMINC50_1986 NE . OR UNEMPLOYMENT_1986 NE . THEN P15WY50UNE_1986 = SUM(POVERTY15_1986,WELFARE_1986,FAMINC50_1986,UNEMPLOYMENT_1986)>0;
IF POVERTY15_1987 NE . OR WELFARE_1987 NE . OR FAMINC50_1987 NE . OR UNEMPLOYMENT_1987 NE . THEN P15WY50UNE_1987 = SUM(POVERTY15_1987,WELFARE_1987,FAMINC50_1987,UNEMPLOYMENT_1987)>0;
IF POVERTY15_1988 NE . OR WELFARE_1988 NE . OR FAMINC50_1988 NE . OR UNEMPLOYMENT_1988 NE . THEN P15WY50UNE_1988 = SUM(POVERTY15_1988,WELFARE_1988,FAMINC50_1988,UNEMPLOYMENT_1988)>0;
IF POVERTY15_1989 NE . OR WELFARE_1989 NE . OR FAMINC50_1989 NE . OR UNEMPLOYMENT_1989 NE . THEN P15WY50UNE_1989 = SUM(POVERTY15_1989,WELFARE_1989,FAMINC50_1989,UNEMPLOYMENT_1989)>0;
IF POVERTY15_1990 NE . OR WELFARE_1990 NE . OR FAMINC50_1990 NE . OR UNEMPLOYMENT_1990 NE . THEN P15WY50UNE_1990 = SUM(POVERTY15_1990,WELFARE_1990,FAMINC50_1990,UNEMPLOYMENT_1990)>0;
IF POVERTY15_1991 NE . OR WELFARE_1991 NE . OR FAMINC50_1991 NE . OR UNEMPLOYMENT_1991 NE . THEN P15WY50UNE_1991 = SUM(POVERTY15_1991,WELFARE_1991,FAMINC50_1991,UNEMPLOYMENT_1991)>0;
IF POVERTY15_1992 NE . OR WELFARE_1992 NE . OR FAMINC50_1992 NE . OR UNEMPLOYMENT_1992 NE . THEN P15WY50UNE_1992 = SUM(POVERTY15_1992,WELFARE_1992,FAMINC50_1992,UNEMPLOYMENT_1992)>0;
IF POVERTY15_1993 NE . OR WELFARE_1993 NE . OR FAMINC50_1993 NE . OR UNEMPLOYMENT_1993 NE . THEN P15WY50UNE_1993 = SUM(POVERTY15_1993,WELFARE_1993,FAMINC50_1993,UNEMPLOYMENT_1993)>0;
IF POVERTY15_1994 NE . OR WELFARE_1994 NE . OR FAMINC50_1994 NE . OR UNEMPLOYMENT_1994 NE . THEN P15WY50UNE_1994 = SUM(POVERTY15_1994,WELFARE_1994,FAMINC50_1994,UNEMPLOYMENT_1994)>0;
IF POVERTY15_1995 NE . OR WELFARE_1995 NE . OR FAMINC50_1995 NE . OR UNEMPLOYMENT_1995 NE . THEN P15WY50UNE_1995 = SUM(POVERTY15_1995,WELFARE_1995,FAMINC50_1995,UNEMPLOYMENT_1995)>0;
IF POVERTY15_1996 NE . OR WELFARE_1996 NE . OR FAMINC50_1996 NE . OR UNEMPLOYMENT_1996 NE . THEN P15WY50UNE_1996 = SUM(POVERTY15_1996,WELFARE_1996,FAMINC50_1996,UNEMPLOYMENT_1996)>0;
IF POVERTY15_1997 NE . OR WELFARE_1997 NE . OR FAMINC50_1997 NE . OR UNEMPLOYMENT_1997 NE . THEN P15WY50UNE_1997 = SUM(POVERTY15_1997,WELFARE_1997,FAMINC50_1997,UNEMPLOYMENT_1997)>0;
IF POVERTY15_1999 NE . OR WELFARE_1999 NE . OR FAMINC50_1999 NE . OR UNEMPLOYMENT_1999 NE . THEN P15WY50UNE_1999 = SUM(POVERTY15_1999,WELFARE_1999,FAMINC50_1999,UNEMPLOYMENT_1999)>0;
IF POVERTY15_2001 NE . OR WELFARE_2001 NE . OR FAMINC50_2001 NE . OR UNEMPLOYMENT_2001 NE . THEN P15WY50UNE_2001 = SUM(POVERTY15_2001,WELFARE_2001,FAMINC50_2001,UNEMPLOYMENT_2001)>0;
IF POVERTY15_2003 NE . OR WELFARE_2003 NE . OR FAMINC50_2003 NE . OR UNEMPLOYMENT_2003 NE . THEN P15WY50UNE_2003 = SUM(POVERTY15_2003,WELFARE_2003,FAMINC50_2003,UNEMPLOYMENT_2003)>0;
IF POVERTY15_2005 NE . OR WELFARE_2005 NE . OR FAMINC50_2005 NE . OR UNEMPLOYMENT_2005 NE . THEN P15WY50UNE_2005 = SUM(POVERTY15_2005,WELFARE_2005,FAMINC50_2005,UNEMPLOYMENT_2005)>0;
IF POVERTY15_2007 NE . OR WELFARE_2007 NE . OR FAMINC50_2007 NE . OR UNEMPLOYMENT_2007 NE . THEN P15WY50UNE_2007 = SUM(POVERTY15_2007,WELFARE_2007,FAMINC50_2007,UNEMPLOYMENT_2007)>0;
IF POVERTY15_2009 NE . OR WELFARE_2009 NE . OR FAMINC50_2009 NE . OR UNEMPLOYMENT_2009 NE . THEN P15WY50UNE_2009 = SUM(POVERTY15_2009,WELFARE_2009,FAMINC50_2009,UNEMPLOYMENT_2009)>0;
IF POVERTY15_2011 NE . OR WELFARE_2011 NE . OR FAMINC50_2011 NE . OR UNEMPLOYMENT_2011 NE . THEN P15WY50UNE_2011 = SUM(POVERTY15_2011,WELFARE_2011,FAMINC50_2011,UNEMPLOYMENT_2011)>0;

IF POVERTY15_1968 NE . OR WELFARE_1968 NE . OR UNEMPLOYMENT_1968 NE . THEN P15WUNE_1968 = SUM(POVERTY15_1968,WELFARE_1968,UNEMPLOYMENT_1968)>0;
IF POVERTY15_1969 NE . OR WELFARE_1969 NE . OR UNEMPLOYMENT_1969 NE . THEN P15WUNE_1969 = SUM(POVERTY15_1969,WELFARE_1969,UNEMPLOYMENT_1969)>0;
IF POVERTY15_1970 NE . OR WELFARE_1970 NE . OR UNEMPLOYMENT_1970 NE . THEN P15WUNE_1970 = SUM(POVERTY15_1970,WELFARE_1970,UNEMPLOYMENT_1970)>0;
IF POVERTY15_1971 NE . OR WELFARE_1971 NE . OR UNEMPLOYMENT_1971 NE . THEN P15WUNE_1971 = SUM(POVERTY15_1971,WELFARE_1971,UNEMPLOYMENT_1971)>0;
IF POVERTY15_1972 NE . OR WELFARE_1972 NE . OR UNEMPLOYMENT_1972 NE . THEN P15WUNE_1972 = SUM(POVERTY15_1972,WELFARE_1972,UNEMPLOYMENT_1972)>0;
IF POVERTY15_1973 NE . OR WELFARE_1973 NE . OR UNEMPLOYMENT_1973 NE . THEN P15WUNE_1973 = SUM(POVERTY15_1973,WELFARE_1973,UNEMPLOYMENT_1973)>0;
IF POVERTY15_1974 NE . OR WELFARE_1974 NE . OR UNEMPLOYMENT_1974 NE . THEN P15WUNE_1974 = SUM(POVERTY15_1974,WELFARE_1974,UNEMPLOYMENT_1974)>0;
IF POVERTY15_1975 NE . OR WELFARE_1975 NE . OR UNEMPLOYMENT_1975 NE . THEN P15WUNE_1975 = SUM(POVERTY15_1975,WELFARE_1975,UNEMPLOYMENT_1975)>0;
IF POVERTY15_1976 NE . OR WELFARE_1976 NE . OR UNEMPLOYMENT_1976 NE . THEN P15WUNE_1976 = SUM(POVERTY15_1976,WELFARE_1976,UNEMPLOYMENT_1976)>0;
IF POVERTY15_1977 NE . OR WELFARE_1977 NE . OR UNEMPLOYMENT_1977 NE . THEN P15WUNE_1977 = SUM(POVERTY15_1977,WELFARE_1977,UNEMPLOYMENT_1977)>0;
IF POVERTY15_1978 NE . OR WELFARE_1978 NE . OR UNEMPLOYMENT_1978 NE . THEN P15WUNE_1978 = SUM(POVERTY15_1978,WELFARE_1978,UNEMPLOYMENT_1978)>0;
IF POVERTY15_1979 NE . OR WELFARE_1979 NE . OR UNEMPLOYMENT_1979 NE . THEN P15WUNE_1979 = SUM(POVERTY15_1979,WELFARE_1979,UNEMPLOYMENT_1979)>0;
IF POVERTY15_1980 NE . OR WELFARE_1980 NE . OR UNEMPLOYMENT_1980 NE . THEN P15WUNE_1980 = SUM(POVERTY15_1980,WELFARE_1980,UNEMPLOYMENT_1980)>0;
IF POVERTY15_1981 NE . OR WELFARE_1981 NE . OR UNEMPLOYMENT_1981 NE . THEN P15WUNE_1981 = SUM(POVERTY15_1981,WELFARE_1981,UNEMPLOYMENT_1981)>0;
IF POVERTY15_1982 NE . OR WELFARE_1982 NE . OR UNEMPLOYMENT_1982 NE . THEN P15WUNE_1982 = SUM(POVERTY15_1982,WELFARE_1982,UNEMPLOYMENT_1982)>0;
IF POVERTY15_1983 NE . OR WELFARE_1983 NE . OR UNEMPLOYMENT_1983 NE . THEN P15WUNE_1983 = SUM(POVERTY15_1983,WELFARE_1983,UNEMPLOYMENT_1983)>0;
IF POVERTY15_1984 NE . OR WELFARE_1984 NE . OR UNEMPLOYMENT_1984 NE . THEN P15WUNE_1984 = SUM(POVERTY15_1984,WELFARE_1984,UNEMPLOYMENT_1984)>0;
IF POVERTY15_1985 NE . OR WELFARE_1985 NE . OR UNEMPLOYMENT_1985 NE . THEN P15WUNE_1985 = SUM(POVERTY15_1985,WELFARE_1985,UNEMPLOYMENT_1985)>0;
IF POVERTY15_1986 NE . OR WELFARE_1986 NE . OR UNEMPLOYMENT_1986 NE . THEN P15WUNE_1986 = SUM(POVERTY15_1986,WELFARE_1986,UNEMPLOYMENT_1986)>0;
IF POVERTY15_1987 NE . OR WELFARE_1987 NE . OR UNEMPLOYMENT_1987 NE . THEN P15WUNE_1987 = SUM(POVERTY15_1987,WELFARE_1987,UNEMPLOYMENT_1987)>0;
IF POVERTY15_1988 NE . OR WELFARE_1988 NE . OR UNEMPLOYMENT_1988 NE . THEN P15WUNE_1988 = SUM(POVERTY15_1988,WELFARE_1988,UNEMPLOYMENT_1988)>0;
IF POVERTY15_1989 NE . OR WELFARE_1989 NE . OR UNEMPLOYMENT_1989 NE . THEN P15WUNE_1989 = SUM(POVERTY15_1989,WELFARE_1989,UNEMPLOYMENT_1989)>0;
IF POVERTY15_1990 NE . OR WELFARE_1990 NE . OR UNEMPLOYMENT_1990 NE . THEN P15WUNE_1990 = SUM(POVERTY15_1990,WELFARE_1990,UNEMPLOYMENT_1990)>0;
IF POVERTY15_1991 NE . OR WELFARE_1991 NE . OR UNEMPLOYMENT_1991 NE . THEN P15WUNE_1991 = SUM(POVERTY15_1991,WELFARE_1991,UNEMPLOYMENT_1991)>0;
IF POVERTY15_1992 NE . OR WELFARE_1992 NE . OR UNEMPLOYMENT_1992 NE . THEN P15WUNE_1992 = SUM(POVERTY15_1992,WELFARE_1992,UNEMPLOYMENT_1992)>0;
IF POVERTY15_1993 NE . OR WELFARE_1993 NE . OR UNEMPLOYMENT_1993 NE . THEN P15WUNE_1993 = SUM(POVERTY15_1993,WELFARE_1993,UNEMPLOYMENT_1993)>0;
IF POVERTY15_1994 NE . OR WELFARE_1994 NE . OR UNEMPLOYMENT_1994 NE . THEN P15WUNE_1994 = SUM(POVERTY15_1994,WELFARE_1994,UNEMPLOYMENT_1994)>0;
IF POVERTY15_1995 NE . OR WELFARE_1995 NE . OR UNEMPLOYMENT_1995 NE . THEN P15WUNE_1995 = SUM(POVERTY15_1995,WELFARE_1995,UNEMPLOYMENT_1995)>0;
IF POVERTY15_1996 NE . OR WELFARE_1996 NE . OR UNEMPLOYMENT_1996 NE . THEN P15WUNE_1996 = SUM(POVERTY15_1996,WELFARE_1996,UNEMPLOYMENT_1996)>0;
IF POVERTY15_1997 NE . OR WELFARE_1997 NE . OR UNEMPLOYMENT_1997 NE . THEN P15WUNE_1997 = SUM(POVERTY15_1997,WELFARE_1997,UNEMPLOYMENT_1997)>0;
IF POVERTY15_1999 NE . OR WELFARE_1999 NE . OR UNEMPLOYMENT_1999 NE . THEN P15WUNE_1999 = SUM(POVERTY15_1999,WELFARE_1999,UNEMPLOYMENT_1999)>0;
IF POVERTY15_2001 NE . OR WELFARE_2001 NE . OR UNEMPLOYMENT_2001 NE . THEN P15WUNE_2001 = SUM(POVERTY15_2001,WELFARE_2001,UNEMPLOYMENT_2001)>0;
IF POVERTY15_2003 NE . OR WELFARE_2003 NE . OR UNEMPLOYMENT_2003 NE . THEN P15WUNE_2003 = SUM(POVERTY15_2003,WELFARE_2003,UNEMPLOYMENT_2003)>0;
IF POVERTY15_2005 NE . OR WELFARE_2005 NE . OR UNEMPLOYMENT_2005 NE . THEN P15WUNE_2005 = SUM(POVERTY15_2005,WELFARE_2005,UNEMPLOYMENT_2005)>0;
IF POVERTY15_2007 NE . OR WELFARE_2007 NE . OR UNEMPLOYMENT_2007 NE . THEN P15WUNE_2007 = SUM(POVERTY15_2007,WELFARE_2007,UNEMPLOYMENT_2007)>0;
IF POVERTY15_2009 NE . OR WELFARE_2009 NE . OR UNEMPLOYMENT_2009 NE . THEN P15WUNE_2009 = SUM(POVERTY15_2009,WELFARE_2009,UNEMPLOYMENT_2009)>0;
IF POVERTY15_2011 NE . OR WELFARE_2011 NE . OR UNEMPLOYMENT_2011 NE . THEN P15WUNE_2011 = SUM(POVERTY15_2011,WELFARE_2011,UNEMPLOYMENT_2011)>0;

**canner and wolfe;

IF NETWORTH_1984 NE . THEN NW_1984 = (NETWORTH_1984 < (PT1984/4));
IF NETWORTH_1989 NE . THEN NW_1989 = (NETWORTH_1989 < (PT1989/4));
IF NETWORTH_1994 NE . THEN NW_1994 = (NETWORTH_1994 < (PT1994/4));
IF NETWORTH_1999 NE . THEN NW_1999 = (NETWORTH_1999 < (PT1999/4));
IF NETWORTH_2003 NE . THEN NW_2003 = (NETWORTH_2003 < (PT2003/4));
IF NETWORTH_2005 NE . THEN NW_2005 = (NETWORTH_2005 < (PT2005/4));
IF NETWORTH_2004 NE . THEN NW_2004 = (NETWORTH_2004 < (PT2004/4)); 
IF NETWORTH_2009 NE . THEN NW_2009 = (NETWORTH_2009 < (PT2009/4));

IF NWMINUSHE_1984 NE . THEN NWHE_1984 = (NWMINUSHE_1984 < (PT1984/4));
IF NWMINUSHE_1989 NE . THEN NWHE_1989 = (NWMINUSHE_1989 < (PT1989/4));
IF NWMINUSHE_1994 NE . THEN NWHE_1994 = (NWMINUSHE_1994 < (PT1994/4));
IF NWMINUSHE_1999 NE . THEN NWHE_1999 = (NWMINUSHE_1999 < (PT1999/4));
IF NWMINUSHE_2003 NE . THEN NWHE_2003 = (NWMINUSHE_2003 < (PT2003/4));
IF NWMINUSHE_2005 NE . THEN NWHE_2005 = (NWMINUSHE_2005 < (PT2005/4));
IF NWMINUSHE_2004 NE . THEN NWHE_2004 = (NWMINUSHE_2004 < (PT2004/4)); 
IF NWMINUSHE_2009 NE . THEN NWHE_2009 = (NWMINUSHE_2009 < (PT2009/4));

IF LIQUIDWEALTH_1984 NE . THEN LW_1984 = (LIQUIDWEALTH_1984  < (PT1984/4)); 
IF LIQUIDWEALTH_1989 NE . THEN LW_1989 = (LIQUIDWEALTH_1989  < (PT1989/4)); 
IF LIQUIDWEALTH_1994 NE . THEN LW_1994 = (LIQUIDWEALTH_1994  < (PT1994/4)); 
IF LIQUIDWEALTH_1999 NE . THEN LW_1999 = (LIQUIDWEALTH_1999  < (PT1999/4)); 
IF LIQUIDWEALTH_2003 NE . THEN LW_2003 = (LIQUIDWEALTH_2003  < (PT2003/4)); 
IF LIQUIDWEALTH_2005 NE . THEN LW_2005 = (LIQUIDWEALTH_2005  < (PT2005/4)); 
IF LIQUIDWEALTH_2004 NE . THEN LW_2004 = (LIQUIDWEALTH_2004  < (PT2004/4));  
IF LIQUIDWEALTH_2009 NE . THEN LW_2009 = (LIQUIDWEALTH_2009  < (PT2009/4)); 

RUN;

/*
NOTE: There were 73140 observations read from the data set PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW.
NOTE: The data set PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW has 73140 observations and 2951 variables.
*/

PROC FREQ DATA = PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW;
TABLE NUMINFU2004 PT2004;
RUN;
