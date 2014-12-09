/*STEP 12 EVENT HISTORY ANLAYSIS FILE 2;

1/13/2013
Hi Florio, Mark and I have been working on the percentile income distribution data you sent, and it has been going well. Great work!

We do have an additional request, only for the four PSID cut point sets that you created (percentile 80, percentile 90, percentile 95 and percentile 99).

For each of these four files, create two event history files in person-year format, so there is one record for year that every person is in the data, from age 25 - 60. 

File 1: this will be an event history file where someone stays in the file until they hit the percentile target. If they fail to hit the target they are censored (event = 0) in final year. For these folks, event = 0 is for all years.

When someone hits the target, the are coded event = 1, then that is their last record in the data. Covariates should be entry year when the person turned 25 and entered the data set, age, whether person is married, race, education, number of children, and whether they have work disability. These covariates should be present on every person-year of data.

File 2: this file will be the same as the event history file, except that people stay in the data after they hit the target - something we term a "density file." Thus the person will contribute person years to the file after event = 1, and continuing until 2011, or they until hit age 60.

Covariates are the same.

Let me know if you want to talk, or anything.

Have started playing ball at noon at Barton - having fun & awaiting our season. Glad your foot is healed.

tom 
*/


%LET SY = 25;

LIBNAME PSID "U:\1Projects\PSID\WAVE37\WORKFILES";
LIBNAME PSIDDL&SY "U:\1Projects\PSID\WAVE37\DENSITYLOGIT&SY";
LIBNAME PSIDLT&SY "U:\1Projects\PSID\WAVE37\LIFETABLES&SY";

%LET POVAFF = POVERTY05 POVERTY10 POVERTY15 POVERTY125 AFFLUENCE08 AFFLUENCE10 AFFLUENCE12 WELFARE FAMINC30 FAMINC40 
			  FAMINC50 P15WELFY50 UNEMPLOYMENT P15WY50UNE FAMINC100K FAMINC150K FAMINC200K FOODSTAMPS GAIN30 GAIN40 
			  GAIN50 FAMINC250K HOMEOWNER HE25K HE50K HE100K HE200K AFFLUENCE09 AFFLUENCE11 FAMINCGT80P 
			  FAMINCGT90P FAMINCGT95P FAMINCGT99P SAEZ90P SAEZ95P SAEZ99P FAMINCLT1P FAMINCLT5P FAMINCLT10P FAMINCLT20P;

%MACRO PAF;

%DO I = 37 %TO 40;

%LET PA = %SCAN(&POVAFF,&I);

DATA DURATION_&PA
(KEEP = ER30001 ER30002 ENTRYYEAR &PA._1968-&PA._1997 &PA._1999 &PA._2001 &PA._2003 &PA._2005 &PA._2007 &PA._2009 &PA._2011);
RETAIN ER30001 ER30002 ENTRYYEAR &PA._1968-&PA._1997 &PA._1999 &PA._2001 &PA._2003 &PA._2005 &PA._2007 &PA._2009 &PA._2011;
SET PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW;
ENTRYYEAR = HYBRID_INDIVYEAROFBIRTH + &SY;
IF ENTRYYEAR GE 1968 AND ENTRYYEAR LE 2011;
RUN;

PROC TRANSPOSE DATA = DURATION_&PA OUT = DURATION_&PA._A (RENAME = (COL1 = &PA.STATUS));
BY ER30001 ER30002 ENTRYYEAR;
RUN;

DATA DURATION_&PA._A;
SET  DURATION_&PA._A;
%IF &I<4 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,11,4) * 1;
%END;
%IF &I = 4 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 5 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 6 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 7 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 8 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,9,4) * 1;
%END;
%IF &I = 9 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,10,4) * 1;
%END;
%IF &I = 10 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,10,4) * 1;
%END;
%IF &I = 11 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,10,4) * 1;
%END;
%IF &I = 12 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 13 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,14,4) * 1;
%END;
%IF &I = 14 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 15 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 16 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 17 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 18 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 19 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,8,4) * 1;
%END;
%IF &I = 20 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,8,4) * 1;
%END;
%IF &I = 21 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,8,4) * 1;
%END;
%IF &I = 22 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 23 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,11,4) * 1;
%END;
%IF &I = 24 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,7,4) * 1;
%END;
%IF &I = 25 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,7,4) * 1;
%END;
%IF &I = 26 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,8,4) * 1;
%END;
%IF &I = 27 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,8,4) * 1;
%END;
%IF &I = 28 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 29 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 30 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 31 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 32 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 33 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 34 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,9,4) * 1;
%END;
%IF &I = 35 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,9,4) * 1;
%END;
%IF &I = 36 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,9,4) * 1;
%END;
%IF &I = 37 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 38 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,12,4) * 1;
%END;
%IF &I = 39 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
%IF &I = 40 %THEN %DO;
SURVEYYEAR = SUBSTR(_NAME_,13,4) * 1;
%END;
BY ER30001 ER30002 ENTRYYEAR;
IF ENTRYYEAR LE SURVEYYEAR;
RUN;

PROC TRANSPOSE DATA = DURATION_&PA._A OUT = DURATION_&PA._B PREFIX = &PA._;
BY ER30001 ER30002 ENTRYYEAR;
ID SURVEYYEAR;
RUN;

DATA DURATION_&PA._C ;
MERGE DURATION_&PA._B (IN = A) PSID.HOUSEHOLDHEADSELECTEDVARSYBPTW
(KEEP =  
ER30001--V3
MARSTAT1968--MARSTAT2011  
EDUC1968-EDUC1997 EDUC1999--EDUC2011
DISABILITY1968--DISABILITY2011 
AGE1968--AGE2011
OCCUPATIONA1968--OCCUPATIONA2011 
COREINDIV_WT1968--COREINDIV_WT2011
NUMCHILD1968--NUMCHILD2011
HYBRID_CALCULATEDAGE1968-HYBRID_CALCULATEDAGE1997 HYBRID_CALCULATEDAGE1999 HYBRID_CALCULATEDAGE2001 HYBRID_CALCULATEDAGE2003 HYBRID_CALCULATEDAGE2005 HYBRID_CALCULATEDAGE2007 HYBRID_CALCULATEDAGE2009 HYBRID_CALCULATEDAGE2011
)
;
BY  ER30001 ER30002;
IF A = 1;
RUN;

DATA DURATION_&PA._C ;
SET DURATION_&PA._C ;

MARSTAT1994 = MARSTAT1993;
MARSTAT1995 = MARSTAT1993;
MARSTAT1996 = MARSTAT1993;
MARSTAT1997 = MARSTAT1999;

DISABILITY1969 = DISABILITY1968;
DISABILITY1970 = DISABILITY1972;
DISABILITY1971 = DISABILITY1972;

OCCUPATIONA1994 = OCCUPATIONA1993;
OCCUPATIONA1995 = OCCUPATIONA1993;
OCCUPATIONA1996 = OCCUPATIONA1999;
OCCUPATIONA1997 = OCCUPATIONA1999;

RUN;

DATA PSIDDL&SY..&PA._&SY._DL_B 
(DROP = _NAME_ I &PA._1968-&PA._1997 &PA._1999 &PA._2001 &PA._2003 &PA._2005 &PA._2007 &PA._2009 &PA._2011);
SET DURATION_&PA._C;

ARRAY PAF  (37) &PA._1968-&PA._1997 &PA._1999 &PA._2001 &PA._2003 &PA._2005 &PA._2007 &PA._2009 &PA._2011 ;
ARRAY PAFF (37) &PA.1968-&PA.1997 &PA.1999 &PA.2001 &PA.2003 &PA.2005 &PA.2007 &PA.2009 &PA.2011;
ARRAY DISA (37) DISABILITY1968-DISABILITY1997 DISABILITY1999 DISABILITY2001 DISABILITY2003 DISABILITY2005 DISABILITY2007 DISABILITY2009 DISABILITY2011;
ARRAY EDUC (37) EDUC1968-EDUC1997 EDUC1999 EDUC2001 EDUC2003 EDUC2005 EDUC2007 EDUC2009 EDUC2011;
ARRAY OCCU (37) OCCUPATIONA1968-OCCUPATIONA1997 OCCUPATIONA1999 OCCUPATIONA2001 OCCUPATIONA2003 OCCUPATIONA2005 OCCUPATIONA2007 OCCUPATIONA2009 OCCUPATIONA2011;
ARRAY CORE (37) COREINDIV_WT1968-COREINDIV_WT1997 COREINDIV_WT1999 COREINDIV_WT2001 COREINDIV_WT2003 COREINDIV_WT2005 COREINDIV_WT2007 COREINDIV_WT2009 COREINDIV_WT2011;
ARRAY MARS (37) MARSTAT1968-MARSTAT1997 MARSTAT1999 MARSTAT2001 MARSTAT2003 MARSTAT2005 MARSTAT2007 MARSTAT2009 MARSTAT2011;
ARRAY AGER (37) AGE1968-AGE1997 AGE1999 AGE2001 AGE2003 AGE2005 AGE2007 AGE2009 AGE2011;
ARRAY NUMC (37) NUMCHILD1968-NUMCHILD1997 NUMCHILD1999 NUMCHILD2001 NUMCHILD2003 NUMCHILD2005 NUMCHILD2007 NUMCHILD2009 NUMCHILD2011;
ARRAY HAGE (37) HYBRID_CALCULATEDAGE1968-HYBRID_CALCULATEDAGE1997 HYBRID_CALCULATEDAGE1999 HYBRID_CALCULATEDAGE2001 HYBRID_CALCULATEDAGE2003 HYBRID_CALCULATEDAGE2005 HYBRID_CALCULATEDAGE2007 HYBRID_CALCULATEDAGE2009 HYBRID_CALCULATEDAGE2011;

ARRAY YR (31:37) _TEMPORARY_ (1999 2001 2003 2005 2007 2009 2011);

*create a copy of paf vars. the copy (paff) will be the one that will be processed/used in calucating duration/status;
DO I= 1 to 37;
   PAFF(I) = PAF(I);
END;


*determine the start of the wave;

YEARENTERED = ENTRYYEAR;

	 IF YEARENTERED = 1998 THEN YEARENTERED = 1999;
ELSE IF YEARENTERED = 2000 THEN YEARENTERED = 2001;
ELSE IF YEARENTERED = 2002 THEN YEARENTERED = 2003;
ELSE IF YEARENTERED = 2004 THEN YEARENTERED = 2005;
ELSE IF YEARENTERED = 2006 THEN YEARENTERED = 2007;
ELSE IF YEARENTERED = 2008 THEN YEARENTERED = 2009;
ELSE IF YEARENTERED = 2010 THEN YEARENTERED = 2011;

ARRAY EY (37) _TEMPORARY_ (1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980
									      1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 
										  1991 1992 1993 1994 1995 1996 1997 1999 2001 2003 2005 2007 2009 2011);
DO I = 1 TO 37;
	IF EY(I) = YEARENTERED THEN WAVESTART = I;
END;

*determine the end of the wave;

DO I= WAVESTART TO 37;
   IF I < 37 AND PAF(I) EQ . AND PAF(I+1) EQ . THEN
	 DO;
		WAVEEND = I-1; 
	    GOTO EXITWE;
	 END;
   ELSE IF I = 37 AND &PA._2009 NE . AND &PA._2011 EQ . THEN 
	 DO; 
		WAVEEND = 36;
	    GOTO EXITWE;
	 END;
   ELSE IF I = 37 AND &PA._2009 NE . AND &PA._2011 NE . THEN 
	 DO; 
		WAVEEND = 37;
	    GOTO EXITWE;
	 END;
   ELSE IF I = 37 AND &PA._2009 EQ . AND &PA._2011 NE . THEN 
	 DO; 
		WAVEEND = 37;
	    GOTO EXITWE;
	 END;
END;
EXITWE:

IF WAVEEND = . AND WAVEEND LT WAVESTART THEN DELETE;

*declare everything from waveend+1 to 37 as missing;
DO I= WAVEEND+1 TO 37;
   PAFF(I) = .;
END;

NUMMISSING = 0;
DO I= 1 TO 37;
   IF PAFF(I) = . THEN NUMMISSING = NUMMISSING + 1;
END;
IF NUMMISSING = 37 THEN DELETE;

DROP NUMMISSING;

*calculates duration until first pa was experienced AND also calculates status whether pa was experienced (1) or not (0);

RETAIN COMPUTEDAGE &PA.DURATION;
COMPUTEDAGE=24;
&PA.DURATION=0;
&PA.STATUS = 0;
DO I= WAVESTART TO WAVEEND;
    IF PAFF(I) IN (.,0) AND I LE 30 THEN
	 DO;
	 	WAVE = I;
		SURVEY = EY(I);
		&PA._ACTUALVALUE = PAFF(I);
		DISABILITY = DISA(I); 
		EDUCATION = EDUC(I);
		OCCUPATION = OCCU(I); 
		NUMCHILD = NUMC(I);
		MARSTAT = MARS(I);
		COREWEIGHT = CORE(I);
		HYBRID_CALCULATEDAGE = HAGE(I);
		AGEOFR = AGER(I);
		COMPUTEDAGE = COMPUTEDAGE + 1;
		&PA.DURATION = &PA.DURATION + 1;
		&PA.STATUS =0;
		OUTPUT;
	 END;
	ELSE IF PAFF(I) IN (.,0) AND I > 30 THEN
      DO; 
	 	WAVE = I;
		SURVEY = EY(I);
		&PA._ACTUALVALUE = PAFF(I);
		DISABILITY = DISA(I); 
		EDUCATION = EDUC(I);
		OCCUPATION = OCCU(I); 
		NUMCHILD = NUMC(I);
		MARSTAT = MARS(I);
		COREWEIGHT = CORE(I);
		HYBRID_CALCULATEDAGE = HAGE(I);
		AGEOFR = AGER(I);
		COMPUTEDAGE = COMPUTEDAGE + 2;
		IF ENTRYYEAR IN (1999, 2001, 2003, 2005, 2007, 2009, 2011) AND WAVESTART = I THEN COMPUTEDAGE = COMPUTEDAGE - 1;
	    &PA.DURATION = &PA.DURATION + 2;
		IF ENTRYYEAR IN (1999, 2001, 2003, 2005, 2007, 2009, 2011) AND WAVESTART = I THEN &PA.DURATION = &PA.DURATION - 1;
		&PA.STATUS =0;
		OUTPUT;
	  END;
	ELSE IF PAFF(I) EQ 1 AND I LE 30 THEN
	 DO;
		WAVE = I;
		SURVEY = EY(I);
		&PA._ACTUALVALUE = PAFF(I);
		DISABILITY = DISA(I); 
		EDUCATION = EDUC(I);
		OCCUPATION = OCCU(I); 
		NUMCHILD = NUMC(I);
		MARSTAT = MARS(I);
		COREWEIGHT = CORE(I);
		HYBRID_CALCULATEDAGE = HAGE(I);
		AGEOFR = AGER(I);
		COMPUTEDAGE = COMPUTEDAGE + 1;
		&PA.DURATION = &PA.DURATION + 1;
		&PA.STATUS = 1;
		OUTPUT;
	 END;
	ELSE IF PAFF(I) EQ 1 AND I > 30 THEN
	 DO;
		WAVE = I;
		SURVEY = EY(I);
		&PA._ACTUALVALUE = PAFF(I);
		DISABILITY = DISA(I); 
		EDUCATION = EDUC(I);
		OCCUPATION = OCCU(I); 
		NUMCHILD = NUMC(I);
		MARSTAT = MARS(I);
		COREWEIGHT = CORE(I);
		HYBRID_CALCULATEDAGE = HAGE(I);
		AGEOFR = AGER(I);
		COMPUTEDAGE = COMPUTEDAGE + 2;
		IF ENTRYYEAR IN (1999, 2001, 2003, 2005, 2007, 2009, 2011) AND WAVESTART = I THEN COMPUTEDAGE = COMPUTEDAGE - 1;
		&PA.DURATION = &PA.DURATION + 2;
		IF ENTRYYEAR IN (1999, 2001, 2003, 2005, 2007, 2009, 2011) AND WAVESTART = I THEN &PA.DURATION = &PA.DURATION - 1;
		&PA.STATUS = 1;
		OUTPUT;
	 END;
END;

RUN;

PROC SORT DATA = PSIDDL&SY..&PA._&SY._DL_B ;
BY ER30001 ER30002;
RUN;

DATA PSIDDL&SY..&PA._&SY._DL_B;
SET PSIDDL&SY..&PA._&SY._DL_B;
/*REMOVE LATINOS*/
IF ER30001 < 7000;

RUN;


*SELECTED VARIABLES;

DATA PSIDDL&SY..&PA._&SY._DL_FILE2 
(KEEP = ER30001 ER30002 ENTRYYEAR YEARENTERED WAVESTART WAVEEND WAVE SURVEY &PA._ACTUALVALUE &PA.STATUS &PA.DURATION HYBRID_CALCULATEDAGE COMPUTEDAGE AGEOFR SEX MARSTAT INDIVRACE RACE RACEA EDUC EDUCATION NUMCHILD DISABILITY OCCUPATION COREWEIGHT);
RETAIN  ER30001 ER30002 ENTRYYEAR YEARENTERED WAVESTART WAVEEND  WAVE SURVEY &PA._ACTUALVALUE &PA.STATUS &PA.DURATION HYBRID_CALCULATEDAGE COMPUTEDAGE AGEOFR SEX MARSTAT INDIVRACE RACE RACEA EDUC EDUCATION NUMCHILD DISABILITY OCCUPATION COREWEIGHT;
MERGE PSIDDL&SY..&PA._&SY._DL_B (IN = A) PSIDLT&SY..COVARIATESAT&SY (KEEP = ER30001 ER30002 SEX INDIVRACE RACE RACEA EDUC);
BY ER30001 ER30002;
IF A = 1;
LABEL EDUC = "Education of Respondent at Age 25";
LABEL EDUCATION = "Education of Respondent (actual value, time-varying)";
LABEL AGEOFR = "Age of R (actual value, time-varying)";
LABEL COMPUTEDAGE = "Computed Age of R ";
LABEL INDIVRACE = "Race of R (use this)";
LABEL DISABILITY = "Disability (actual value, time-varying)"; 
LABEL OCCUPATION = "Occupation (actual value, time-varying)"; 
LABEL NUMCHILD = "Number of Children (actual value, time-varying)";
LABEL MARSTAT = "Marital Status(actual value, time-varying)";
LABEL COREWEIGHT = "Individual core weight (actual value, time-varying)";
LABEL ENTRYYEAR = "Computed Year R turned 25";
LABEL YEARENTERED= "Computed Year R turned 25, however, those born in 1998, 2000, 2002, 2004, 2006, 2008, 2010 are added 1. Used for computation only";
RUN;


PROC EXPORT DATA= PSIDDL&SY..&PA._&SY._DL_FILE2  
            OUTFILE= "U:\1Projects\PSID\WAVE37\DENSITYLOGIT&SY\&PA._&SY._DL_FILE2.sav" 
            DBMS=SPSS REPLACE;
RUN;


*FULL;

DATA PSIDDL&SY..&PA._&SY._DL_FILE2_FULL ;
MERGE PSIDDL&SY..&PA._&SY._DL_B (IN = A) PSIDLT&SY..COVARIATESAT&SY (KEEP = ER30001 ER30002 SEX INDIVRACE RACE RACEA EDUC);
BY ER30001 ER30002;
IF A = 1;
LABEL EDUC = "Education of Respondent at Age 25";
LABEL EDUCATION = "Education of Respondent (actual value, time-varying)";
LABEL AGEOFR = "Age of R (actual value, time-varying)";
LABEL COMPUTEDAGE = "Computed Age of R ";
LABEL INDIVRACE = "Race of R (use this)";
LABEL DISABILITY = "Disability (actual value, time-varying)"; 
LABEL OCCUPATION = "Occupation (actual value, time-varying)"; 
LABEL NUMCHILD = "Number of Children (actual value, time-varying)";
LABEL MARSTAT = "Marital Status(actual value, time-varying)";
LABEL COREWEIGHT = "Individual core weight (actual value, time-varying)";
LABEL ENTRYYEAR = "Computed Year R turned 25";
LABEL YEARENTERED= "Computed Year R turned 25, however, those born in 1998, 2000, 2002, 2004, 2006, 2008, 2010 are added 1. Used for computation only";
RUN;


PROC EXPORT DATA= PSIDDL&SY..&PA._&SY._DL_FILE2_FULL   
            OUTFILE= "U:\1Projects\PSID\WAVE37\DENSITYLOGIT&SY\&PA._&SY._DL_FILE2_FULL.sav" 
            DBMS=SPSS REPLACE;
RUN;


%END;
%MEND PAF;
%PAF; 


