LIBNAME CAH "U:\1Projects\PSID\WAVE37\SOURCEFILES\cah85_11";
LIBNAME PSID "U:\1Projects\PSID\WAVE37\WORKFILES";

LIBNAME WEALTH84 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth1984";
LIBNAME WEALTH89 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth1989";
LIBNAME WEALTH94 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth1994";
LIBNAME WEALTH99 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth1999";
LIBNAME WEALTH01 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth2001";
LIBNAME WEALTH03 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth2003";
LIBNAME WEALTH05 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth2005";
LIBNAME WEALTH07 "U:\1Projects\PSID\WAVE37\SOURCEFILES\wlth2007";

%LET YEAR = 1968	1969	1970	1971	1972	1973	1974	1975	1976	1977	
			1978	1979	1980	1981	1982	1983	1984	1985	1986	1987	
			1988	1989	1990	1991	1992	1993	1994	1995	1996	1997	
			1999	2001	2003	2005	2007	2009 	2011;

%MACRO MYLIB;
%DO J = 1 %TO 37 ;
%LET I = %SCAN(&YEAR,&J) ;

LIBNAME FAM&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\fam&I";
LIBNAME IND&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\IND&I.ER";
LIBNAME FI&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\FI&I";

%END;
%MEND MYLIB;
%MYLIB;


%MACRO SY;

%LET AGE  = 25 35 45 55;

%DO J = 25 %TO 55 %BY 10 ;
%LET SY = &J;

LIBNAME PSID&SY "U:\1Projects\PSID\WAVE37\LIFETABLES&SY";

%END;
%MEND SY;
%SY;