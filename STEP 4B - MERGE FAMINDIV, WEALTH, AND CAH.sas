LIBNAME CAH "U:\1Projects\PSID\WAVE37\SOURCEFILES\cah85_11";
LIBNAME PSID "U:\1Projects\PSID\WAVE37\WORKFILES";

LIBNAME WEALTH84 "U:\1Projects\PSID\wlth1984";
LIBNAME WEALTH89 "U:\1Projects\PSID\wlth1989";
LIBNAME WEALTH94 "U:\1Projects\PSID\wlth1994";
LIBNAME WEALTH99 "U:\1Projects\PSID\wlth1999";
LIBNAME WEALTH03 "U:\1Projects\PSID\wlth2003";
LIBNAME WEALTH05 "U:\1Projects\PSID\wlth2005";

%MACRO MYLIB;
%DO J = 1 %TO 37 ;
%LET I = %SCAN(&YEAR,&J) ;

LIBNAME FAM&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\FAM&I";
LIBNAME IND&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\IND&I.ER";
LIBNAME FI&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\FI&I";

%END;
%MEND MYLIB;
%MYLIB;


%MACRO FAMINDFILES;
%LET YEAR = 1968	1969	1970	1971	1972	1973	1974	1975	1976	1977	1978	1979	1980	1981	1982	1983	1984	1985	1986	1987	1988	1989	1990	1991	1992	1993	1994	1995	1996	1997	1999	2001	2003	2005	2007	2009 2011;
%DO I = 1 %TO 37;
FI%SCAN(&YEAR,&I).FAMILYINDIV%SCAN(&YEAR,&I)
%END;
%MEND FAMINDFILES;

DATA PSID.FAMILYINDIVIDUALFILES;
MERGE IND1968.IND2011SUMMARY %FAMINDFILES;
BY ER30001 ER30002;
RUN;

*checks;

PROC FREQ DATA = PSID.FAMILYINDIVIDUALFILES;
TABLE ER30003 ER32000;
RUN;

PROC PRINT DATA =  PSID.FAMILYINDIVIDUALFILES;
VAR ER30001 ER30002 ER30003 ER32000;
WHERE ER32000 = .;
RUN;

/*results of the above run:

NOTE: There were 73251 observations read from the data set IND1968.IND2011SUMMARY.
NOTE: There were 18230 observations read from the data set FI1968.FAMILYINDIV1968.
NOTE: There were 17212 observations read from the data set FI1969.FAMILYINDIV1969.
NOTE: There were 17349 observations read from the data set FI1970.FAMILYINDIV1970.
NOTE: There were 17590 observations read from the data set FI1971.FAMILYINDIV1971.
NOTE: There were 18051 observations read from the data set FI1972.FAMILYINDIV1972.
NOTE: There were 18236 observations read from the data set FI1973.FAMILYINDIV1973.
NOTE: There were 18396 observations read from the data set FI1974.FAMILYINDIV1974.
NOTE: There were 18623 observations read from the data set FI1975.FAMILYINDIV1975.
NOTE: There were 18768 observations read from the data set FI1976.FAMILYINDIV1976.
NOTE: There were 18998 observations read from the data set FI1977.FAMILYINDIV1977.
NOTE: There were 19140 observations read from the data set FI1978.FAMILYINDIV1978.
NOTE: There were 19443 observations read from the data set FI1979.FAMILYINDIV1979.
NOTE: There were 19747 observations read from the data set FI1980.FAMILYINDIV1980.
NOTE: There were 19796 observations read from the data set FI1981.FAMILYINDIV1981.
NOTE: There were 20112 observations read from the data set FI1982.FAMILYINDIV1982.
NOTE: There were 20327 observations read from the data set FI1983.FAMILYINDIV1983.
NOTE: There were 20393 observations read from the data set FI1984.FAMILYINDIV1984.
NOTE: There were 20680 observations read from the data set FI1985.FAMILYINDIV1985.
NOTE: There were 20437 observations read from the data set FI1986.FAMILYINDIV1986.
NOTE: There were 20486 observations read from the data set FI1987.FAMILYINDIV1987.
NOTE: There were 20506 observations read from the data set FI1988.FAMILYINDIV1988.
NOTE: There were 20451 observations read from the data set FI1989.FAMILYINDIV1989.
NOTE: There were 28197 observations read from the data set FI1990.FAMILYINDIV1990.
NOTE: There were 27845 observations read from the data set FI1991.FAMILYINDIV1991.
NOTE: There were 29275 observations read from the data set FI1992.FAMILYINDIV1992.
NOTE: There were 29726 observations read from the data set FI1993.FAMILYINDIV1993.
NOTE: There were 31546 observations read from the data set FI1994.FAMILYINDIV1994.
NOTE: There were 29884 observations read from the data set FI1995.FAMILYINDIV1995.
NOTE: There were 23810 observations read from the data set FI1996.FAMILYINDIV1996.
NOTE: There were 19761 observations read from the data set FI1997.FAMILYINDIV1997.
NOTE: There were 20515 observations read from the data set FI1999.FAMILYINDIV1999.
NOTE: There were 21400 observations read from the data set FI2001.FAMILYINDIV2001.
NOTE: There were 22290 observations read from the data set FI2003.FAMILYINDIV2003.
NOTE: There were 22918 observations read from the data set FI2005.FAMILYINDIV2005.
NOTE: There were 23501 observations read from the data set FI2007.FAMILYINDIV2007.
NOTE: There were 24385 observations read from the data set FI2009.FAMILYINDIV2009.
NOTE: There were 24661 observations read from the data set FI2011.FAMILYINDIV2011.
NOTE: The data set PSID.FAMILYINDIVIDUALFILES has 73251 observations and 60493 variables.
NOTE: DATA statement used (Total process time):
      real time           33:51.19
      cpu time            29:52.67



*/


*combine the PSID.CAH85_11_PARENT_CHILD created in step 2a with the FAMILYINDIVIDUALFILES file;

DATA PSID.FAMILYINDIVIDUALFILESCAHWLTH;
MERGE PSID.FAMILYINDIVIDUALFILES (IN =A) PSID.CAH85_11_PARENT_CHILD;
BY ER30001 ER30002;
IF A = 1;
RUN;

/*results:
NOTE: There were 73251 observations read from the data set PSID.FAMILYINDIVIDUALFILES.
NOTE: There were 75313 observations read from the data set PSID.CAH85_11_PARENT_CHILD.
NOTE: The data set PSID.FAMILYINDIVIDUALFILESCAHWLTH has 73251 observations and 60528
      variables.

*/


PROC FREQ DATA = PSID.FAMILYINDIVIDUALFILESCAHWLTH;
TABLE YEARBORNINCAH ;
RUN;
