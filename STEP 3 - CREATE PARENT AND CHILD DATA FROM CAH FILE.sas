LIBNAME CAH "U:\1Projects\PSID\WAVE37\SOURCEFILES\cah85_11";
LIBNAME PSID "U:\1Projects\PSID\WAVE37\WORKFILES";
/*************************************************************************
   Label           : Childbirth and Adoption History 1985-2011
   Rows            : 124325
   Columns         : 31
   ASCII File Date : May 31, 2013
*************************************************************************/

DATA CAH.CAH85_11 ; 
   ATTRIB 
      CAH1      LABEL="RECORD TYPE"                                      format=f1.
      CAH2      LABEL="1968 INTERVIEW NUMBER OF PARENT"                  format=f4.
      CAH3      LABEL="PERSON NUMBER OF PARENT"                          format=f3.
      CAH4      LABEL="SEX OF PARENT"                                    format=f1.
      CAH5      LABEL="MONTH PARENT BORN"                                format=f2.
      CAH6      LABEL="YEAR PARENT BORN"                                 format=f4.
      CAH7      LABEL="MARITAL STATUS OF MOTHER WHEN IND BORN"           format=f1.
      CAH8      LABEL="BIRTH ORDER"                                      format=f2.
      CAH9      LABEL="1968 INTERVIEW NUMBER OF CHILD"                   format=f4.
      CAH10     LABEL="PERSON NUMBER OF CHILD"                           format=f3.
      CAH11     LABEL="SEX OF CHILD"                                     format=f1.
      CAH12     LABEL="MONTH CHILD BORN"                                 format=f2.
      CAH13     LABEL="YEAR CHILD BORN"                                  format=f4.
      CAH14     LABEL="BIRTH WEIGHT OF CHILD IN OUNCES"                  format=f3.
      CAH15     LABEL="STATE IN WHICH CHILD BORN"                        format=f2.
      CAH16     LABEL="WHERE CHILD WAS WHEN LAST REPORTED"               format=f1.
      CAH17     LABEL="MONTH CHILD MOVED OUT OR DIED"                    format=f2.
      CAH18     LABEL="YEAR CHILD MOVED OUT OR DIED"                     format=f4.
      CAH19     LABEL="HISPANICITY"                                      format=f1.
      CAH20     LABEL="RACE OF CHILD, 1ST MENTION"                       format=f1.
      CAH21     LABEL="RACE OF CHILD, 2ND MENTION"                       format=f1.
      CAH22     LABEL="RACE OF CHILD, 3RD MENTION"                       format=f1.
      CAH23     LABEL="PRIMARY ETHNIC GROUP OF CHILD"                    format=f1.
      CAH24     LABEL="SECONDARY ETHNIC GROUP OF CHILD, 1ST MEN"         format=f2.
      CAH25     LABEL="SECONDARY ETHNIC GROUP OF CHILD, 2ND MEN"         format=f2.
      CAH26     LABEL="YR MOST RECENTLY REPORTED NUMBER OF KIDS"         format=f4.
      CAH27     LABEL="YEAR MOST RECENTLY REPORTED THIS CHILD"           format=f4.
      CAH28     LABEL="NUMBER OF NATURAL OR ADOPTED CHILDREN"            format=f2.
      CAH29     LABEL="RELATIONSHIP TO ADOPTIVE PARENT"                  format=f2.
      CAH30     LABEL="NUMBER OF BIRTH OR ADOPTION RECORDS"              format=f2.
      CAH31     LABEL="RELEASE NUMBER"                                   format=f1.
   ;
   INFILE 'U:\1Projects\PSID\WAVE37\SOURCEFILES\cah85_11\CAH85_11.txt' LRECL = 68 ; 
   INPUT 
      CAH1            1 - 1         CAH2            2 - 5         CAH3            6 - 8    
      CAH4            9 - 9         CAH5           10 - 11        CAH6           12 - 15   
      CAH7           16 - 16        CAH8           17 - 18        CAH9           19 - 22   
      CAH10          23 - 25        CAH11          26 - 26        CAH12          27 - 28   
      CAH13          29 - 32        CAH14          33 - 35        CAH15          36 - 37   
      CAH16          38 - 38        CAH17          39 - 40        CAH18          41 - 44   
      CAH19          45 - 45        CAH20          46 - 46        CAH21          47 - 47   
      CAH22          48 - 48        CAH23          49 - 49        CAH24          50 - 51   
      CAH25          52 - 53        CAH26          54 - 57        CAH27          58 - 61   
      CAH28          62 - 63        CAH29          64 - 65        CAH30          66 - 67   
      CAH31          68 - 68   
   ;
RUN ;



DATA PSID.CAH85_11_PARENT (KEEP = ER30001 ER30002 CAH4SEX  CAH5MOBORN  CAH6YRBORN);
SET CAH.CAH85_11 ;
	ER30001 	= CAH2 ;
	ER30002		= CAH3 ;
	CAH4SEX		= CAH4 ;
	CAH5MOBORN	= CAH5 ;
	CAH6YRBORN	= CAH6 ;
RUN;

PROC SORT DATA =PSID.CAH85_11_PARENT NODUPKEY; 
BY ER30001 ER30002;
RUN;


DATA PSID.CAH85_11_CHILD;
SET CAH.CAH85_11;
   	ER30001 	= CAH9;
   	ER30002 	= CAH10;
RUN;
PROC SORT DATA = PSID.CAH85_11_CHILD NODUPKEY; 
BY ER30001 ER30002;
RUN;

DATA PSID.CAH85_11_PARENT_CHILD;
MERGE PSID.CAH85_11_PARENT PSID.CAH85_11_CHILD;
BY ER30001 ER30002;
IF CAH1 = . THEN YEARBORNINCAH = CAH6YRBORN;
ELSE IF CAH1 NE . THEN YEARBORNINCAH = CAH13;
RUN;

/*RESULTS:
NOTE: There were 46724 observations read from the data set PSID.CAH85_11_PARENT.
NOTE: There were 50786 observations read from the data set PSID.CAH85_11_CHILD.
NOTE: The data set PSID.CAH85_11_PARENT_CHILD has 75313 observations and 36 variables.
*/

PROC FREQ DATA = PSID.CAH85_11_PARENT_CHILD;
TABLE YEARBORNINCAH ;
RUN;


