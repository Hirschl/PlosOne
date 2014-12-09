LIBNAME INDIV "U:\1Projects\PSID\WAVE37\SOURCEFILES\IND2011ER";

/*This is the FINAL program.  It will create individual data file for each year from 1968 to 2011*/

/*************************************************************************
   Label           : Panel Study of Income Dynamics:  1968-2011 Individual Data File
   Rows            : 73251
   Columns         : 1499
   ASCII File Date : December 5, 2013
*************************************************************************/
%LET YEAR = 1968	1969	1970	1971	1972	1973	1974	1975	1976	1977	
			1978	1979	1980	1981	1982	1983	1984	1985	1986	1987	
			1988	1989	1990	1991	1992	1993	1994	1995	1996	1997	
			1999	2001	2003	2005	2007	2009 	2011;

*CREATE THE LIBNAMES;
%MACRO MYLIB;
%DO J = 1 %TO 37;
%LET I = %SCAN(&YEAR,&J) ;

LIBNAME FAM&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\fam&I";
LIBNAME IND&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\IND&I.ER";

%END;
%MEND MYLIB;
%MYLIB;

**THE INDIVIDUAL FILES FOR 1968 TO 2011 WILL BE CREATED BELOW;
**BUT THE SUMMARY VARIABLES INCLUDED IN THE 1968 INDIVIDUAL FILE WILL BE REMOVED, THEN PLACED IN A SEPARATE SAS DATA FILE.  
SEE BELOW;


%MACRO INDIV;

%DO J = 1 %TO 37;
%LET I = %SCAN(&YEAR,&J);
*LIBNAME IND&I "U:\1Projects\PSID\WAVE37\SOURCEFILES\&I\IND&I.ER";

DATA IND&I..IND&I.ER ; 
   ATTRIB 
  %IF &I = 1968 %THEN %DO; 
	  ER30000   LABEL="RELEASE NUMBER"                                   format=f1.
  %END;
      ER30001   LABEL="1968 INTERVIEW NUMBER"                            format=f4.
      ER30002   LABEL="PERSON NUMBER                         68"         format=f3.
  %IF &I = 1968 %THEN %DO; 
 	  ER30003   LABEL="RELATIONSHIP TO HEAD                  68"         format=f1.
      ER30004   LABEL="AGE OF INDIVIDUAL                     68"         format=f3.
      ER30005   LABEL="MARR PAIRS INDICATOR                  68"         format=f1.
      ER30006   LABEL="WHETHER MOVED IN                      68"         format=f1.
      ER30007   LABEL="MONTH MOVED IN                        68"         format=f2.
      ER30008   LABEL="YEAR MOVED IN                         68"         format=f4.
      ER30009   LABEL="IN SCHOOL                             68"         format=f1.
      ER30010   LABEL="YRS SCHL COMPL                        68"         format=f2.
      ER30011   LABEL="TYPE OF INCOME                        68"         format=f1.
      ER30012   LABEL="MONEY INCOME IND                      68"         format=f4.
      ER30013   LABEL="HOURS WORKED IND                      68"         format=f4.
      ER30014   LABEL="SHARE EXPENSES                        68"         format=f1.
      ER30015   LABEL="LIKELY TO MOVE                        68"         format=f1.
      ER30016   LABEL="EXTRA EARNER NR.                      68"         format=f1.
      ER30017   LABEL="TYPE OF IND RECORD                    68"         format=f2.
      ER30018   LABEL="WHY NONRESPONSE                       68"         format=f2.
      ER30019   LABEL="INDIVIDUAL WEIGHT                     68"         format=f4.1
 %END;	
 %IF &I = 1969 %THEN %DO; 
      ER30020   LABEL="1969 INTERVIEW NUMBER"                            format=f4.
      ER30021   LABEL="SEQUENCE NUMBER                       69"         format=f2.
      ER30022   LABEL="RELATIONSHIP TO HEAD                  69"         format=f1.
      ER30023   LABEL="AGE OF INDIVIDUAL                     69"         format=f3.
      ER30024   LABEL="MARR PAIRS INDICATOR                  69"         format=f1.
      ER30025   LABEL="WHETHER MOVED IN/OUT                  69"         format=f1.
      ER30026   LABEL="MONTH MOVED IN/OUT                    69"         format=f2.
      ER30027   LABEL="YEAR MOVED IN/OUT                     69"         format=f4.
      ER30028   LABEL="STOPPED SCHOOL                        69"         format=f1.
      ER30029   LABEL="HRS/WK HOUSEWRK                       69"         format=f2.
      ER30030   LABEL="DISABLED OR RQ CARE                   69"         format=f1.
      ER30031   LABEL="RESPONDENT?                           69"         format=f1.
      ER30032   LABEL="TYPE OF INCOME                        69"         format=f1.
      ER30033   LABEL="MONEY INCOME                          69"         format=f5.
      ER30034   LABEL="HRS WORKED IN 68                      69"         format=f4.
      ER30035   LABEL="SHARE EXPENSES                        69"         format=f1.
      ER30036   LABEL="LIKELY TO MOVE OUT                    69"         format=f1.
      ER30037   LABEL="MO S/O FAM FORMED                     69"         format=f2.
      ER30038   LABEL="YR S/O FAM FORMED                     69"         format=f4.
      ER30039   LABEL="MAIN FAM ID FOR S/O                   69"         format=f4.
      ER30040   LABEL="TYPE OF IND RECORD                    69"         format=f2.
      ER30041   LABEL="WHY NONRESPONSE                       69"         format=f2.
      ER30042   LABEL="INDIVIDUAL WEIGHT                     69"         format=f4.1
 %END;	
 %IF &I = 1970 %THEN %DO; 
      ER30043   LABEL="1970 INTERVIEW NUMBER"                            format=f4.
      ER30044   LABEL="SEQUENCE NUMBER                       70"         format=f2.
      ER30045   LABEL="RELATIONSHIP TO HEAD                  70"         format=f1.
      ER30046   LABEL="AGE OF INDIVIDUAL                     70"         format=f3.
      ER30047   LABEL="MARR PAIRS INDICATOR                  70"         format=f1.
      ER30048   LABEL="WHETHER MOVED IN/OUT                  70"         format=f1.
      ER30049   LABEL="MONTH MOVED IN/OUT                    70"         format=f2.
      ER30050   LABEL="YEAR MOVED IN/OUT                     70"         format=f4.
      ER30051   LABEL="STOPPED SCHOOL                        70"         format=f1.
      ER30052   LABEL="GRADE FINISHED                        70"         format=f2.
      ER30053   LABEL="HRS/WK HOUSEWK                        70"         format=f2.
      ER30054   LABEL="DISABLED OR RQ CARE                   70"         format=f1.
      ER30055   LABEL="RESPONDENT?                           70"         format=f1.
      ER30056   LABEL="TYPE OF INCOME                        70"         format=f1.
      ER30057   LABEL="MONEY INCOME                          70"         format=f5.
      ER30058   LABEL="HOURS WORKED                          70"         format=f4.
      ER30059   LABEL="SHARE EXPENSES                        70"         format=f1.
      ER30060   LABEL="LIKELY TO MOVE OUT                    70"         format=f1.
      ER30061   LABEL="MO S/O FAM FORMED                     70"         format=f2.
      ER30062   LABEL="YR S/O FAM FORMED                     70"         format=f4.
      ER30063   LABEL="MAIN FAM ID FOR S/O                   70"         format=f4.
      ER30064   LABEL="TYPE OF IND RECORD                    70"         format=f2.
      ER30065   LABEL="WHY NONRESPONSE                       70"         format=f2.
      ER30066   LABEL="INDIVIDUAL WEIGHT                     70"         format=f4.1
 %END;	
 %IF &I = 1971 %THEN %DO; 
      ER30067   LABEL="1971 INTERVIEW NUMBER"                            format=f4.
      ER30068   LABEL="SEQUENCE NUMBER                       71"         format=f2.
      ER30069   LABEL="RELATIONSHIP TO HEAD                  71"         format=f1.
      ER30070   LABEL="AGE OF INDIVIDUAL                     71"         format=f3.
      ER30071   LABEL="MARR PAIRS INDICATOR                  71"         format=f1.
      ER30072   LABEL="WHETHER MOVED IN/OUT                  71"         format=f1.
      ER30073   LABEL="MONTH MOVED IN/OUT                    71"         format=f2.
      ER30074   LABEL="YEAR MOVED IN/OUT                     71"         format=f4.
      ER30075   LABEL="STOPPED SCHOOL                        71"         format=f1.
      ER30076   LABEL="GRADE FINISHED                        71"         format=f2.
      ER30077   LABEL="HRS/WK HSWK                           71"         format=f2.
      ER30078   LABEL="DISABLED OR REQ CR                    71"         format=f1.
      ER30079   LABEL="RESPONDENT?                           71"         format=f1.
      ER30080   LABEL="TYPE OF INCOME                        71"         format=f1.
      ER30081   LABEL="MONEY INCOME                          71"         format=f5.
      ER30082   LABEL="HOURS WORKED                          71"         format=f4.
      ER30083   LABEL="SHARE EXPENSES                        71"         format=f1.
      ER30084   LABEL="LIKELY TO MOVE OUT                    71"         format=f1.
      ER30085   LABEL="MO S/O FAM FORMED                     71"         format=f2.
      ER30086   LABEL="YR S/O FAM FORMED                     71"         format=f4.
      ER30087   LABEL="MAIN FAM ID FOR S/O                   71"         format=f4.
      ER30088   LABEL="TYPE OF IND RECORD                    71"         format=f2.
      ER30089   LABEL="WHY NONRESPONSE                       71"         format=f2.
      ER30090   LABEL="INDIVIDUAL WEIGHT                     71"         format=f4.1
 %END;	
 %IF &I = 1972 %THEN %DO; 
      ER30091   LABEL="1972 INTERVIEW NUMBER"                            format=f4.
      ER30092   LABEL="SEQUENCE NUMBER                       72"         format=f2.
      ER30093   LABEL="RELATIONSHIP TO HEAD                  72"         format=f1.
      ER30094   LABEL="AGE OF INDIVIDUAL                     72"         format=f3.
      ER30095   LABEL="MARR PAIRS INDICATOR                  72"         format=f1.
      ER30096   LABEL="WHETHER MOVED IN/OUT                  72"         format=f1.
      ER30097   LABEL="MONTH MOVED IN/OUT                    72"         format=f2.
      ER30098   LABEL="YEAR MOVED IN/OUT                     72"         format=f4.
      ER30099   LABEL="STOPPED SCHOOL                        72"         format=f1.
      ER30100   LABEL="GRADE FINISHED                        72"         format=f2.
      ER30101   LABEL="WHO DID WORK?                         72"         format=f1.
      ER30102   LABEL="HRS/WK HSWRK                          72"         format=f2.
      ER30103   LABEL="DISABLED OR REQ CR                    72"         format=f1.
      ER30104   LABEL="RESPONDENT?                           72"         format=f1.
      ER30105   LABEL="TYPE OF INCOME                        72"         format=f1.
      ER30106   LABEL="MONEY INCOME                          72"         format=f5.
      ER30107   LABEL="HOURS WORKED                          72"         format=f4.
      ER30108   LABEL="SHARE EXPENSES?                       72"         format=f1.
      ER30109   LABEL="LIKELY TO MOVE OUT                    72"         format=f1.
      ER30110   LABEL="COMPLETED EDUCATION                   72"         format=f2.
      ER30111   LABEL="MO S/O FAM FORMED                     72"         format=f2.
      ER30112   LABEL="YR S/O FAM FORMED                     72"         format=f4.
      ER30113   LABEL="MAIN FAM ID FOR S/O                   72"         format=f4.
      ER30114   LABEL="TYPE OF IND RECORD                    72"         format=f2.
      ER30115   LABEL="WHY NONRESPONSE                       72"         format=f2.
      ER30116   LABEL="INDIVIDUAL WEIGHT                     72"         format=f4.1
 %END;	
 %IF &I = 1973 %THEN %DO; 
      ER30117   LABEL="1973 INTERVIEW NUMBER"                            format=f4.
      ER30118   LABEL="SEQUENCE NUMBER                       73"         format=f2.
      ER30119   LABEL="RELATIONSHIP TO HEAD                  73"         format=f1.
      ER30120   LABEL="AGE OF INDIVIDUAL                     73"         format=f3.
      ER30121   LABEL="MARR PAIRS INDICATOR                  73"         format=f1.
      ER30122   LABEL="WHETHER MOVED IN/OUT                  73"         format=f1.
      ER30123   LABEL="MONTH MOVED IN/OUT                    73"         format=f2.
      ER30124   LABEL="YEAR MOVED IN/OUT                     73"         format=f4.
      ER30125   LABEL="STOPPED SCHOOL                        73"         format=f1.
      ER30126   LABEL="GRADE FINISHED                        73"         format=f2.
      ER30127   LABEL="HR/WK HOUSEWORK                       73"         format=f2.
      ER30128   LABEL="RESPONDENT?                           73"         format=f1.
      ER30129   LABEL="TYPE OF INCOME                        73"         format=f1.
      ER30130   LABEL="MONEY INCOME                          73"         format=f5.
      ER30131   LABEL="HOURS WORKED                          73"         format=f4.
      ER30132   LABEL="MO S/O FAM FORMED                     73"         format=f2.
      ER30133   LABEL="YR S/O FAM FORMED                     73"         format=f4.
      ER30134   LABEL="MAIN FAM ID FOR S/O                   73"         format=f4.
      ER30135   LABEL="TYPE OF IND RECORD                    73"         format=f2.
      ER30136   LABEL="WHY NONRESPONSE                       73"         format=f2.
      ER30137   LABEL="INDIVIDUAL WEIGHT                     73"         format=f4.1
 %END;	
 %IF &I = 1974 %THEN %DO; 
      ER30138   LABEL="1974 INTERVIEW NUMBER"                            format=f4.
      ER30139   LABEL="SEQUENCE NUMBER                       74"         format=f2.
      ER30140   LABEL="RELATIONSHIP TO HEAD                  74"         format=f1.
      ER30141   LABEL="AGE OF INDIVIDUAL                     74"         format=f3.
      ER30142   LABEL="MARR PAIRS INDICATOR                  74"         format=f1.
      ER30143   LABEL="WHETHER MOVED IN/OUT                  74"         format=f1.
      ER30144   LABEL="MONTH MOVED IN/OUT                    74"         format=f2.
      ER30145   LABEL="YEAR MOVED IN/OUT                     74"         format=f4.
      ER30146   LABEL="STOP SCHOOL?                          74"         format=f1.
      ER30147   LABEL="HIGHEST GRADE                         74"         format=f2.
      ER30148   LABEL="HRS/WK HOUSEWORK                      74"         format=f2.
      ER30149   LABEL="RESPONDENT?                           74"         format=f1.
      ER30150   LABEL="TYPE OF INCOME                        74"         format=f1.
      ER30151   LABEL="WTR WELFARE INCOME                    74"         format=f1.
      ER30152   LABEL="TOTAL MONEY INCOME                    74"         format=f5.
      ER30153   LABEL="TOT ANN HRS                           74"         format=f4.
      ER30154   LABEL="MO S/O FAM FORMED                     74"         format=f2.
      ER30155   LABEL="YR S/O FAM FORMED                     74"         format=f4.
      ER30156   LABEL="MAIN FAM ID FOR S/O                   74"         format=f4.
      ER30157   LABEL="TYPE OF IND RECORD                    74"         format=f2.
      ER30158   LABEL="WHY NONRESPONSE                       74"         format=f2.
      ER30159   LABEL="INDIVIDUAL WEIGHT                     74"         format=f4.1
 %END;	
 %IF &I = 1975 %THEN %DO; 
	  ER30160   LABEL="1975 INTERVIEW NUMBER"                            format=f4.
      ER30161   LABEL="SEQUENCE NUMBER                       75"         format=f2.
      ER30162   LABEL="RELATIONSHIP TO HEAD                  75"         format=f1.
      ER30163   LABEL="AGE OF INDIVIDUAL                     75"         format=f3.
      ER30164   LABEL="MARR PAIRS INDICATOR                  75"         format=f1.
      ER30165   LABEL="WHETHER MOVED IN/OUT                  75"         format=f1.
      ER30166   LABEL="MONTH MOVED IN/OUT                    75"         format=f2.
      ER30167   LABEL="YEAR MOVED IN/OUT                     75"         format=f4.
      ER30168   LABEL="STOPPED SCHOOL?                       75"         format=f1.
      ER30169   LABEL="HIGHEST GRAD FINISHED                 75"         format=f2.
      ER30170   LABEL="RESPONDENT?                           75"         format=f1.
      ER30171   LABEL="LABOR/ASSET TYPE INC                  75"         format=f1.
      ER30172   LABEL="TRANSFER TYPE INC                     75"         format=f1.
      ER30173   LABEL="TAXABLE INCOME                        75"         format=f5.
      ER30174   LABEL="ACC TAXABLE Y                         75"         format=f1.
      ER30175   LABEL="TRANSFER INCOME                       75"         format=f5.
      ER30176   LABEL="ACC TRANSFER Y                        75"         format=f1.
      ER30177   LABEL="HRS WORKED IN 74                      75"         format=f4.
      ER30178   LABEL="ACC HRS WORKED IN 74                  75"         format=f1.
      ER30179   LABEL="HRS UNEMP IN 74                       75"         format=f4.
      ER30180   LABEL="ACC HRS UNEMPLOYED                    75"         format=f1.
      ER30181   LABEL="COMPLETED EDUCATION                   75"         format=f2.
      ER30182   LABEL="MO S/O FAM FORMED                     75"         format=f2.
      ER30183   LABEL="YR S/O FAM FORMED                     75"         format=f4.
      ER30184   LABEL="MAIN FAM ID FOR S/O                   75"         format=f4.
      ER30185   LABEL="TYPE OF IND RECORD                    75"         format=f2.
      ER30186   LABEL="WHY NONRESPONSE                       75"         format=f2.
      ER30187   LABEL="INDIVIDUAL WEIGHT                     75"         format=f4.1
 %END;	
 %IF &I = 1976 %THEN %DO; 
      ER30188   LABEL="1976 INTERVIEW NUMBER"                            format=f4.
      ER30189   LABEL="SEQUENCE NUMBER                       76"         format=f2.
      ER30190   LABEL="RELATIONSHIP TO HEAD                  76"         format=f1.
      ER30191   LABEL="AGE OF INDIVIDUAL                     76"         format=f3.
      ER30192   LABEL="MARR PAIRS INDICATOR                  76"         format=f1.
      ER30193   LABEL="WHETHER MOVED IN/OUT                  76"         format=f1.
      ER30194   LABEL="MONTH MOVED IN/OUT                    76"         format=f2.
      ER30195   LABEL="YEAR MOVED IN/OUT                     76"         format=f4.
      ER30196   LABEL="STOP SCHOOL?                          76"         format=f1.
      ER30197   LABEL="HIGHEST GRADE FINISH                  76"         format=f2.
      ER30198   LABEL="HRS HOUSEWORK/WK                      76"         format=f2.
      ER30199   LABEL="EXTRA CARE?                           76"         format=f1.
      ER30200   LABEL="RESPONDENT?                           76"         format=f1.
      ER30201   LABEL="TAXABLE Y SOURCE                      76"         format=f1.
      ER30202   LABEL="TOTAL TAXABLE Y                       76"         format=f5.
      ER30203   LABEL="ACC TAXABLE Y                         76"         format=f1.
      ER30204   LABEL="HRS WRKED LAST YR                     76"         format=f4.
      ER30205   LABEL="ACC IND WRK HRS                       76"         format=f1.
      ER30206   LABEL="HRS UNEMP LAST YR                     76"         format=f4.
      ER30207   LABEL="ACC IND UNEMP HRS                     76"         format=f1.
      ER30208   LABEL="TRANSFER Y SOURCE                     76"         format=f1.
      ER30209   LABEL="TOTAL TRANSFER Y                      76"         format=f5.
      ER30210   LABEL="ACC TRANSFER Y                        76"         format=f1.
      ER30211   LABEL="MO S/O FAM FORMED                     76"         format=f2.
      ER30212   LABEL="YR S/O FAM FORMED                     76"         format=f4.
      ER30213   LABEL="MAIN FAM ID FOR S/O                   76"         format=f4.
      ER30214   LABEL="TYPE OF IND RECORD                    76"         format=f2.
      ER30215   LABEL="WHY NONRESPONSE                       76"         format=f2.
      ER30216   LABEL="INDIVIDUAL WEIGHT                     76"         format=f4.1
 %END;	
 %IF &I = 1977 %THEN %DO; 
      ER30217   LABEL="1977 INTERVIEW NUMBER"                            format=f4.
      ER30218   LABEL="SEQUENCE NUMBER                       77"         format=f2.
      ER30219   LABEL="RELATIONSHIP TO HEAD                  77"         format=f1.
      ER30220   LABEL="AGE OF INDIVIDUAL                     77"         format=f3.
      ER30221   LABEL="MARR PAIRS INDICATOR                  77"         format=f1.
      ER30222   LABEL="WHETHER MOVED IN/OUT                  77"         format=f1.
      ER30223   LABEL="MONTH MOVED IN/OUT                    77"         format=f2.
      ER30224   LABEL="YEAR MOVED IN/OUT                     77"         format=f4.
      ER30225   LABEL="STOP SCHOOL?                          77"         format=f1.
      ER30226   LABEL="HIGHEST GRADE FINISH                  77"         format=f2.
      ER30227   LABEL="HRS HOUSEWORK/WK                      77"         format=f2.
      ER30228   LABEL="NEEDS EXTRA CARE?                     77"         format=f1.
      ER30229   LABEL="RESPONDENT?                           77"         format=f1.
      ER30230   LABEL="TAXABLE Y SOURCE                      77"         format=f1.
      ER30231   LABEL="TOTAL TAXABLE Y                       77"         format=f5.
      ER30232   LABEL="ACC TAXABLE Y                         77"         format=f1.
      ER30233   LABEL="HRS WORKED LAST YR                    77"         format=f4.
      ER30234   LABEL="ACC WORK HRS                          77"         format=f1.
      ER30235   LABEL="HRS UNEMP LAST YR                     77"         format=f4.
      ER30236   LABEL="ACC UNEMP HRS                         77"         format=f1.
      ER30237   LABEL="TRANSFER Y SOURCE                     77"         format=f2.
      ER30238   LABEL="TOTAL TRANSFER Y                      77"         format=f5.
      ER30239   LABEL="ACC TRANSFER Y                        77"         format=f1.
      ER30240   LABEL="MO S/O FAM FORMED                     77"         format=f2.
      ER30241   LABEL="YR S/O FAM FORMED                     77"         format=f4.
      ER30242   LABEL="MAIN FAM ID FOR S/O                   77"         format=f4.
      ER30243   LABEL="TYPE OF IND RECORD                    77"         format=f2.
      ER30244   LABEL="WHY NONRESPONSE                       77"         format=f2.
      ER30245   LABEL="INDIVIDUAL WEIGHT                     77"         format=f4.1
 %END;	
 %IF &I = 1978 %THEN %DO; 
      ER30246   LABEL="1978 INTERVIEW NUMBER"                            format=f4.
      ER30247   LABEL="SEQUENCE NUMBER                       78"         format=f2.
      ER30248   LABEL="RELATIONSHIP TO HEAD                  78"         format=f1.
      ER30249   LABEL="AGE OF INDIVIDUAL                     78"         format=f3.
      ER30250   LABEL="MARR PAIRS INDICATOR                  78"         format=f1.
      ER30251   LABEL="WHETHER MOVED IN/OUT                  78"         format=f1.
      ER30252   LABEL="MONTH MOVED IN/OUT                    78"         format=f2.
      ER30253   LABEL="YEAR MOVED IN/OUT                     78"         format=f4.
      ER30254   LABEL="STOP SCHOOL?                          78"         format=f1.
      ER30255   LABEL="HIGHEST GRADE FINISH                  78"         format=f2.
      ER30256   LABEL="HRS HOUSEWORK/WK                      78"         format=f2.
      ER30257   LABEL="LOOKING FOR WORK?                     78"         format=f1.
      ER30258   LABEL="LOOKING LAST 4 WKS?                   78"         format=f1.
      ER30259   LABEL="WHETHER HEALTH LIMIT                  78"         format=f1.
      ER30260   LABEL="HOW MUCH LIMIT?                       78"         format=f1.
      ER30261   LABEL="# YEARS WITH CONDITN                  78"         format=f2.
      ER30262   LABEL="CONDITN BETTER OR                     78"         format=f1.
      ER30263   LABEL="NEED EXTRA CARE?                      78"         format=f1.
      ER30264   LABEL="MEAN EXTRA COSTS?                     78"         format=f1.
      ER30265   LABEL="ARE COSTS SMALL OR                    78"         format=f1.
      ER30266   LABEL="RESPONDENT?                           78"         format=f1.
      ER30267   LABEL="TYPE TAXABLE INCOM                    78"         format=f1.
      ER30268   LABEL="TOTAL TAXABLE INCOM                   78"         format=f5.
      ER30269   LABEL="ACC TOT TAXBL INC                     78"         format=f1.
      ER30270   LABEL="HOURS WORKED IN 77                    78"         format=f4.
      ER30271   LABEL="ACC TOT HRS WRKD 77                   78"         format=f1.
      ER30272   LABEL="TOT HRS UNEMPLYD 77                   78"         format=f4.
      ER30273   LABEL="ACC TOT HRS UNEMP 77                  78"         format=f1.
      ER30274   LABEL="TYPE TRANSFR INCOM                    78"         format=f2.
      ER30275   LABEL="TOTAL TRANSFR INCOM                   78"         format=f5.
      ER30276   LABEL="ACC TOT TRANF INCOME                  78"         format=f1.
      ER30277   LABEL="MO S/O FAM FORMED                     78"         format=f2.
      ER30278   LABEL="YR S/O FAM FORMED                     78"         format=f4.
      ER30279   LABEL="MAIN FAM ID FOR S/O                   78"         format=f4.
      ER30280   LABEL="TYPE OF IND RECORD                    78"         format=f2.
      ER30281   LABEL="WHY NONRESPONSE                       78"         format=f2.
      ER30282   LABEL="INDIVIDUAL WEIGHT                     78"         format=f4.1
 %END;	
 %IF &I = 1979 %THEN %DO; 
      ER30283   LABEL="1979 INTERVIEW NUMBER"                            format=f4.
      ER30284   LABEL="SEQUENCE NUMBER                       79"         format=f2.
      ER30285   LABEL="RELATIONSHIP TO HEAD                  79"         format=f1.
      ER30286   LABEL="AGE OF INDIVIDUAL                     79"         format=f3.
      ER30287   LABEL="MARR PAIRS INDICATOR                  79"         format=f1.
      ER30288   LABEL="WHETHER MOVED IN/OUT                  79"         format=f1.
      ER30289   LABEL="MONTH MOVED IN/OUT                    79"         format=f2.
      ER30290   LABEL="YEAR MOVED IN/OUT                     79"         format=f4.
      ER30291   LABEL="HRS HSWRK                             79"         format=f2.
      ER30292   LABEL="RESPONDENT?                           79"         format=f1.
      ER30293   LABEL="EMPL STATUS                           79"         format=f1.
      ER30294   LABEL="K4 STUDENT?                           79"         format=f1.
      ER30295   LABEL="K48 # WKS IN SCHOOL                   79"         format=f2.
      ER30296   LABEL="K49 EDUCATION                         79"         format=f2.
      ER30297   LABEL="TYPE TAXABLE INCOME                   79"         format=f1.
      ER30298   LABEL="TOT TAXABLE INCOME                    79"         format=f5.
      ER30299   LABEL="ACC TOT TXBL INC                      79"         format=f1.
      ER30300   LABEL="TOT HRS WRKD 78                       79"         format=f4.
      ER30301   LABEL="ACC TOT HRS WRKD                      79"         format=f1.
      ER30302   LABEL="TOT HRS UNEMP 78                      79"         format=f4.
      ER30303   LABEL="ACC TOT HRS UNEMP                     79"         format=f1.
      ER30304   LABEL="TYPE TRANSFER INC                     79"         format=f2.
      ER30305   LABEL="TOT TRANSFER INC                      79"         format=f5.
      ER30306   LABEL="ACC TOT TRANS INC                     79"         format=f1.
      ER30307   LABEL="MO S/O FAM FORMED                     79"         format=f2.
      ER30308   LABEL="YR S/O FAM FORMED                     79"         format=f4.
      ER30309   LABEL="MAIN FAM ID FOR S/O                   79"         format=f4.
      ER30310   LABEL="TYPE OF IND RECORD                    79"         format=f2.
      ER30311   LABEL="WHY NONRESPONSE                       79"         format=f2.
      ER30312   LABEL="INDIVIDUAL WEIGHT                     79"         format=f4.1
 %END;	
 %IF &I = 1980 %THEN %DO; 
      ER30313   LABEL="1980 INTERVIEW NUMBER"                            format=f4.
      ER30314   LABEL="SEQUENCE NUMBER                       80"         format=f2.
      ER30315   LABEL="RELATIONSHIP TO HEAD                  80"         format=f1.
      ER30316   LABEL="AGE OF INDIVIDUAL                     80"         format=f3.
      ER30317   LABEL="MARR PAIRS INDICATOR                  80"         format=f1.
      ER30318   LABEL="WHETHER MOVED IN/OUT                  80"         format=f1.
      ER30319   LABEL="MONTH MOVED IN/OUT                    80"         format=f2.
      ER30320   LABEL="YEAR MOVED IN/OUT                     80"         format=f4.
      ER30321   LABEL="HR/WEEK HOUSEWORK                     80"         format=f2.
      ER30322   LABEL="RESPONDENT?                           80"         format=f1.
      ER30323   LABEL="1980 EMPL STATUS                      80"         format=f1.
      ER30324   LABEL="IND A STUDENT?                        80"         format=f1.
      ER30325   LABEL="WEEKS IN SCHOOL(K51)?                 80"         format=f2.
      ER30326   LABEL="EDUCATION ATTAINED                    80"         format=f2.
      ER30327   LABEL="TYPE TAXABLE Y 1979                   80"         format=f1.
      ER30328   LABEL="1979 TOT TAXABLE Y                    80"         format=f5.
      ER30329   LABEL="ACC TOT TAXABLE Y 79                  80"         format=f1.
      ER30330   LABEL="HOURS WORKED IN 1979                  80"         format=f4.
      ER30331   LABEL="ACC HOURS WORKED 1979                 80"         format=f1.
      ER30332   LABEL="HOURS UNEMP IN 1979                   80"         format=f4.
      ER30333   LABEL="ACC HOURS UNEMP 1979                  80"         format=f1.
      ER30334   LABEL="TYPE TRANSFER Y 79                    80"         format=f2.
      ER30335   LABEL="TOTAL TRANSFER Y 79                   80"         format=f5.
      ER30336   LABEL="ACC TRANSFER Y 79                     80"         format=f1.
      ER30337   LABEL="MO S/O FAM FORMED                     80"         format=f2.
      ER30338   LABEL="YR S/O FAM FORMED                     80"         format=f4.
      ER30339   LABEL="MAIN FAM ID FOR S/O                   80"         format=f4.
      ER30340   LABEL="TYPE OF IND RECORD                    80"         format=f2.
      ER30341   LABEL="WHY NONRESPONSE                       80"         format=f2.
      ER30342   LABEL="INDIVIDUAL WEIGHT                     80"         format=f4.1
 %END;	
 %IF &I = 1981 %THEN %DO; 
      ER30343   LABEL="1981 INTERVIEW NUMBER"                            format=f4.
      ER30344   LABEL="SEQUENCE NUMBER                       81"         format=f2.
      ER30345   LABEL="RELATIONSHIP TO HEAD                  81"         format=f1.
      ER30346   LABEL="AGE OF INDIVIDUAL                     81"         format=f3.
      ER30347   LABEL="MARR PAIRS INDICATOR                  81"         format=f1.
      ER30348   LABEL="WHETHER MOVED IN/OUT                  81"         format=f1.
      ER30349   LABEL="MONTH MOVED IN/OUT                    81"         format=f2.
      ER30350   LABEL="YEAR MOVED IN/OUT                     81"         format=f4.
      ER30351   LABEL="HR/WEEK ON HOUSEWRK                   81"         format=f2.
      ER30352   LABEL="RESPONDENT?                           81"         format=f1.
      ER30353   LABEL="EMPLOYMENT STAT                       81"         format=f1.
      ER30354   LABEL="WHETHER STUDENT                       81"         format=f1.
      ER30355   LABEL="# WEEKS IN SCHOOL                     81"         format=f2.
      ER30356   LABEL="COMPLETED EDUC                        81"         format=f2.
      ER30357   LABEL="TYPE TXBL INCOME 1980                 81"         format=f1.
      ER30358   LABEL="TOT TXBL INCOME 80                    81"         format=f5.
      ER30359   LABEL="ACC TOT TXBL Y 80                     81"         format=f1.
      ER30360   LABEL="ANN WORK HRS 80                       81"         format=f4.
      ER30361   LABEL="ACC ANN WRK HRS 80                    81"         format=f1.
      ER30362   LABEL="ANN UNEMP HRS 80                      81"         format=f4.
      ER30363   LABEL="ACC ANN UNEMP HR 80                   81"         format=f1.
      ER30364   LABEL="TYPE TRANSFER Y 80                    81"         format=f2.
      ER30365   LABEL="TOT TRANSFER Y 80                     81"         format=f5.
      ER30366   LABEL="ACC TOT TRNSFR Y 80                   81"         format=f1.
      ER30367   LABEL="MONTH S/O FAM FORMED                  81"         format=f2.
      ER30368   LABEL="YEAR S/O FAM FORMED                   81"         format=f4.
      ER30369   LABEL="MAIN FAM ID FOR S/O                   81"         format=f4.
      ER30370   LABEL="TYPE OF IND RECORD                    81"         format=f2.
      ER30371   LABEL="WHY NONRESPONSE                       81"         format=f2.
      ER30372   LABEL="INDIVIDUAL WEIGHT                     81"         format=f4.1
 %END;	
 %IF &I = 1982 %THEN %DO; 
      ER30373   LABEL="1982 INTERVIEW NUMBER"                            format=f4.
      ER30374   LABEL="SEQUENCE NUMBER                       82"         format=f2.
      ER30375   LABEL="RELATIONSHIP TO HEAD                  82"         format=f1.
      ER30376   LABEL="AGE OF INDIVIDUAL                     82"         format=f3.
      ER30377   LABEL="MARR PAIRS INDICATOR                  82"         format=f1.
      ER30378   LABEL="WHETHER MOVED IN/OUT                  82"         format=f1.
      ER30379   LABEL="MONTH MOVED IN/OUT                    82"         format=f2.
      ER30380   LABEL="YEAR MOVED IN/OUT                     82"         format=f4.
      ER30381   LABEL="RESPONDENT?                           82"         format=f1.
      ER30382   LABEL="EMPLOYMENT STATUS                     82"         format=f1.
      ER30383   LABEL="WHETHER STUDENT                       82"         format=f1.
      ER30384   LABEL="COMPLETED EDUCATION                   82"         format=f2.
      ER30385   LABEL="TYPE TXBL INCOME 81                   82"         format=f1.
      ER30386   LABEL="TOT TXBL INCOME 81                    82"         format=f5.
      ER30387   LABEL="ACC TOT TXBL Y 81                     82"         format=f1.
      ER30388   LABEL="ANN WORK HRS 81                       82"         format=f4.
      ER30389   LABEL="ACC ANN WRK HRS 81                    82"         format=f1.
      ER30390   LABEL="TYPE TRANSFER Y 81                    82"         format=f2.
      ER30391   LABEL="TOT TRANSFER Y 81                     82"         format=f5.
      ER30392   LABEL="ACC TOT TRNSFR Y 81                   82"         format=f1.
      ER30393   LABEL="MONTH S/O FAM FORMED                  82"         format=f2.
      ER30394   LABEL="YEAR S/O FAM FORMED                   82"         format=f4.
      ER30395   LABEL="MAIN FAM ID FOR S/O                   82"         format=f4.
      ER30396   LABEL="TYPE OF IND RECORD                    82"         format=f2.
      ER30397   LABEL="WHY NONRESPONSE                       82"         format=f2.
      ER30398   LABEL="INDIVIDUAL WEIGHT                     82"         format=f4.1
 %END;	
 %IF &I = 1983 %THEN %DO; 
      ER30399   LABEL="1983 INTERVIEW NUMBER"                            format=f4.
      ER30400   LABEL="SEQUENCE NUMBER                       83"         format=f2.
      ER30401   LABEL="RELATIONSHIP TO HEAD                  83"         format=f2.
      ER30402   LABEL="AGE OF INDIVIDUAL                     83"         format=f3.
      ER30403   LABEL="MONTH IND BORN                        83"         format=f2.
      ER30404   LABEL="YEAR IND BORN                         83"         format=f4.
      ER30405   LABEL="MARR PAIRS INDICATOR                  83"         format=f1.
      ER30406   LABEL="WHETHER MOVED IN/OUT                  83"         format=f1.
      ER30407   LABEL="MONTH MOVED IN/OUT                    83"         format=f2.
      ER30408   LABEL="YEAR MOVED IN/OUT                     83"         format=f4.
      ER30409   LABEL="WEEKLY HOUSEWORK                      83"         format=f2.
      ER30410   LABEL="RESPONDENT?                           83"         format=f1.
      ER30411   LABEL="EMPLOYMENT STATUS                     83"         format=f1.
      ER30412   LABEL="WHETHER STUDENT                       83"         format=f1.
      ER30413   LABEL="COMPLETED EDUCATION                   83"         format=f2.
      ER30414   LABEL="TYPE TXBL INCOME 82                   83"         format=f1.
      ER30415   LABEL="TOT TXBL INCOME 82                    83"         format=f6.
      ER30416   LABEL="ACC TOT TXBL Y 82                     83"         format=f1.
      ER30417   LABEL="ANN WORK HRS 82                       83"         format=f4.
      ER30418   LABEL="ACC ANN WRK HRS 82                    83"         format=f1.
      ER30419   LABEL="TYPE TRANSFER Y 82                    83"         format=f2.
      ER30420   LABEL="TOT TRANSFER Y 82                     83"         format=f5.
      ER30421   LABEL="ACC TOT TRNSFR Y 82                   83"         format=f1.
      ER30422   LABEL="MONTH S/O FAM FORMED                  83"         format=f2.
      ER30423   LABEL="YEAR S/O FAM FORMED                   83"         format=f4.
      ER30424   LABEL="MAIN FAM ID FOR S/O                   83"         format=f4.
      ER30425   LABEL="AGE FROM BIRTH DATE                   83"         format=f2.
      ER30426   LABEL="TYPE OF IND RECORD                    83"         format=f2.
      ER30427   LABEL="WHY NONRESPONSE                       83"         format=f2.
      ER30428   LABEL="INDIVIDUAL WEIGHT                     83"         format=f4.1
 %END;	
 %IF &I = 1984 %THEN %DO; 
      ER30429   LABEL="1984 INTERVIEW NUMBER"                            format=f4.
      ER30430   LABEL="SEQUENCE NUMBER                       84"         format=f2.
      ER30431   LABEL="RELATIONSHIP TO HEAD                  84"         format=f2.
      ER30432   LABEL="AGE OF INDIVIDUAL                     84"         format=f3.
      ER30433   LABEL="MONTH IND BORN                        84"         format=f2.
      ER30434   LABEL="YEAR IND BORN                         84"         format=f4.
      ER30435   LABEL="MARR PAIRS INDICATOR                  84"         format=f1.
      ER30436   LABEL="WHETHER MOVED IN/OUT                  84"         format=f1.
      ER30437   LABEL="MONTH MOVED IN/OUT                    84"         format=f2.
      ER30438   LABEL="YEAR MOVED IN/OUT                     84"         format=f4.
      ER30439   LABEL="WEEKLY HOUSEWORK                      84"         format=f2.
      ER30440   LABEL="RESPONDENT?                           84"         format=f1.
      ER30441   LABEL="EMPLOYMENT STAT                       84"         format=f1.
      ER30442   LABEL="WHETHER STUDENT                       84"         format=f1.
      ER30443   LABEL="COMPLETED EDUC                        84"         format=f2.
      ER30444   LABEL="TYPE TXBL INCOME                      84"         format=f1.
      ER30445   LABEL="TOT TXBL INCOME                       84"         format=f6.
      ER30446   LABEL="ACC TOT TXBL Y                        84"         format=f1.
      ER30447   LABEL="ANN WORK HRS                          84"         format=f4.
      ER30448   LABEL="ACC ANN WRK HRS                       84"         format=f1.
      ER30449   LABEL="TYPE TRANSFER Y                       84"         format=f2.
      ER30450   LABEL="F33 TYPE SOC SEC RCD                  84"         format=f1.
      ER30451   LABEL="F34 AMT SOC SEC RCD                   84"         format=f5.
      ER30452   LABEL="F34 ACC SOC SEC AMT                   84"         format=f1.
      ER30453   LABEL="TOT TRANSFER EXC SS                   84"         format=f5.
      ER30454   LABEL="ACC TOT TRANSFER Y                    84"         format=f1.
      ER30455   LABEL="SUM SS+TRANSFER Y                     84"         format=f5.
      ER30456   LABEL="MONTH S/O FAM FORMED                  84"         format=f2.
      ER30457   LABEL="YEAR S/O FAM FORMED                   84"         format=f4.
      ER30458   LABEL="MAIN FAM ID FOR S/O                   84"         format=f4.
      ER30459   LABEL="AGE FROM BIRTH DATE                   84"         format=f2.
      ER30460   LABEL="TYPE OF IND RECORD                    84"         format=f2.
      ER30461   LABEL="WHY NONRESPONSE                       84"         format=f2.
      ER30462   LABEL="INDIVIDUAL WEIGHT                     84"         format=f4.1
 %END;	
 %IF &I = 1985 %THEN %DO; 
      ER30463   LABEL="1985 INTERVIEW NUMBER"                            format=f4.
      ER30464   LABEL="SEQUENCE NUMBER                       85"         format=f2.
      ER30465   LABEL="RELATIONSHIP TO HEAD                  85"         format=f2.
      ER30466   LABEL="AGE OF INDIVIDUAL                     85"         format=f3.
      ER30467   LABEL="MONTH IND BORN                        85"         format=f2.
      ER30468   LABEL="YEAR IND BORN                         85"         format=f4.
      ER30469   LABEL="MARR PAIRS INDICATOR                  85"         format=f1.
      ER30470   LABEL="WHETHER MOVED IN/OUT                  85"         format=f1.
      ER30471   LABEL="MONTH MOVED IN/OUT                    85"         format=f2.
      ER30472   LABEL="YEAR MOVED IN/OUT                     85"         format=f4.
      ER30473   LABEL="WEEKLY HOUSEWORK                      85"         format=f2.
      ER30474   LABEL="EMPLOYMENT STAT                       85"         format=f1.
      ER30475   LABEL="F88 MO LAST IN SCH                    85"         format=f2.
      ER30476   LABEL="F88 YR LAST IN SCH                    85"         format=f4.
      ER30477   LABEL="WHETHER STUDENT                       85"         format=f1.
      ER30478   LABEL="COMPLETED EDUCATION                   85"         format=f2.
      ER30479   LABEL="TYPE TXBL INCOME                      85"         format=f1.
      ER30480   LABEL="TOT TXBL INCOME                       85"         format=f6.
      ER30481   LABEL="ACC TOT TXBL INCOME                   85"         format=f1.
      ER30482   LABEL="ANN WORK HRS                          85"         format=f4.
      ER30483   LABEL="ACC ANN WRK HRS                       85"         format=f1.
      ER30484   LABEL="TYPE TRANSFER Y                       85"         format=f2.
      ER30485   LABEL="K31 TYPE SOC SEC RCD                  85"         format=f1.
      ER30486   LABEL="K33 AMT SOC SEC RCD                   85"         format=f5.
      ER30487   LABEL="K33 ACC SOC SEC AMT                   85"         format=f1.
      ER30488   LABEL="TOT TRANSFR EXC SS                    85"         format=f5.
      ER30489   LABEL="ACC TOT TRNSFR EXC SS                 85"         format=f1.
      ER30490   LABEL="TOTAL TRNSFR INCOME                   85"         format=f5.
      ER30491   LABEL="MONTH S/O FAM FORMED                  85"         format=f2.
      ER30492   LABEL="YEAR S/O FAM FORMED                   85"         format=f4.
      ER30493   LABEL="MAIN FAM ID FOR S/O                   85"         format=f4.
      ER30494   LABEL="AGE FROM BIRTH DATE                   85"         format=f2.
      ER30495   LABEL="TYPE OF IND RECORD                    85"         format=f2.
      ER30496   LABEL="WHY NONRESPONSE                       85"         format=f2.
      ER30497   LABEL="INDIVIDUAL WEIGHT                     85"         format=f4.1
 %END;	
 %IF &I = 1986 %THEN %DO; 
      ER30498   LABEL="1986 INTERVIEW NUMBER"                            format=f4.
      ER30499   LABEL="SEQUENCE NUMBER                       86"         format=f2.
      ER30500   LABEL="RELATIONSHIP TO HEAD                  86"         format=f2.
      ER30501   LABEL="AGE OF INDIVIDUAL                     86"         format=f3.
      ER30502   LABEL="MONTH IND BORN                        86"         format=f2.
      ER30503   LABEL="YEAR IND BORN                         86"         format=f4.
      ER30504   LABEL="MARR PAIRS INDICATOR                  86"         format=f1.
      ER30505   LABEL="WHETHER MOVED IN/OUT                  86"         format=f1.
      ER30506   LABEL="MONTH MOVED IN/OUT                    86"         format=f2.
      ER30507   LABEL="YEAR MOVED IN/OUT                     86"         format=f4.
      ER30508   LABEL="WEEKLY HOUSEWORK                      86"         format=f2.
      ER30509   LABEL="EMPLOYMENT STAT                       86"         format=f1.
      ER30510   LABEL="G88 MO LAST IN SCH                    86"         format=f2.
      ER30511   LABEL="G88 YR LAST IN SCH                    86"         format=f4.
      ER30512   LABEL="WHETHER STUDENT                       86"         format=f1.
      ER30513   LABEL="COMPLETED EDUCATION                   86"         format=f2.
      ER30514   LABEL="TYPE TXBL INCOME                      86"         format=f1.
      ER30515   LABEL="TOT TXBL INCOME                       86"         format=f6.
      ER30516   LABEL="ACC TOT TXBL INCOME                   86"         format=f1.
      ER30517   LABEL="ANN WORK HRS                          86"         format=f4.
      ER30518   LABEL="ACC ANN WRK HRS                       86"         format=f1.
      ER30519   LABEL="TYPE TRANSFER Y                       86"         format=f2.
      ER30520   LABEL="G31 TYPE SOC SEC RCD                  86"         format=f1.
      ER30521   LABEL="G34 AMT SOC SEC RCD                   86"         format=f5.
      ER30522   LABEL="G34 ACC SOC SEC AMT                   86"         format=f1.
      ER30523   LABEL="TOT TRANSFR EXC SS                    86"         format=f5.
      ER30524   LABEL="ACC TOT TRNSFR EXC SS                 86"         format=f1.
      ER30525   LABEL="TOTAL TRNSFR INCOME                   86"         format=f5.
      ER30526   LABEL="H32/35 WTR MEDICAID                   86"         format=f1.
      ER30527   LABEL="H1/37/69 HLTH STATUS                  86"         format=f1.
      ER30528   LABEL="MONTH S/O FAM FORMED                  86"         format=f2.
      ER30529   LABEL="YEAR S/O FAM FORMED                   86"         format=f4.
      ER30530   LABEL="MAIN FAM ID FOR S/O                   86"         format=f4.
      ER30531   LABEL="AGE FROM BIRTH DATE                   86"         format=f2.
      ER30532   LABEL="TYPE OF IND RECORD                    86"         format=f2.
      ER30533   LABEL="WHY NONRESPONSE                       86"         format=f2.
      ER30534   LABEL="INDIVIDUAL WEIGHT                     86"         format=f4.1
 %END;	
 %IF &I = 1987 %THEN %DO; 
	  ER30535   LABEL="1987 INTERVIEW NUMBER"                            format=f4.
      ER30536   LABEL="SEQUENCE NUMBER                       87"         format=f2.
      ER30537   LABEL="RELATIONSHIP TO HEAD                  87"         format=f2.
      ER30538   LABEL="AGE OF INDIVIDUAL                     87"         format=f3.
      ER30539   LABEL="MONTH IND BORN                        87"         format=f2.
      ER30540   LABEL="YEAR IND BORN                         87"         format=f4.
      ER30541   LABEL="MARR PAIRS INDICATOR                  87"         format=f1.
      ER30542   LABEL="WHETHER MOVED IN/OUT                  87"         format=f1.
      ER30543   LABEL="MONTH MOVED IN/OUT                    87"         format=f2.
      ER30544   LABEL="YEAR MOVED IN/OUT                     87"         format=f4.
      ER30545   LABEL="EMPLOYMENT STAT                       87"         format=f1.
      ER30546   LABEL="G88 MO LAST IN SCH                    87"         format=f2.
      ER30547   LABEL="G88 YR LAST IN SCH                    87"         format=f4.
      ER30548   LABEL="WHETHER STUDENT                       87"         format=f1.
      ER30549   LABEL="COMPLETED EDUCATION                   87"         format=f2.
      ER30550   LABEL="TYPE TXBL INCOME                      87"         format=f1.
      ER30551   LABEL="TOT TXBL INCOME                       87"         format=f6.
      ER30552   LABEL="ACC TOT TXBL INCOME                   87"         format=f1.
      ER30553   LABEL="ANN WORK HRS                          87"         format=f4.
      ER30554   LABEL="ACC ANN WRK HRS                       87"         format=f1.
      ER30555   LABEL="TYPE TRANSFER Y                       87"         format=f2.
      ER30556   LABEL="G33 TYPE SOC SEC RCD                  87"         format=f1.
      ER30557   LABEL="G34 AMT SOC SEC RCD                   87"         format=f5.
      ER30558   LABEL="G34 ACC SOC SEC AMT                   87"         format=f1.
      ER30559   LABEL="TOT TRANSFR EXC SS                    87"         format=f5.
      ER30560   LABEL="ACC TOT TRNSFR EXC SS                 87"         format=f1.
      ER30561   LABEL="TOTAL TRNSFR INCOME                   87"         format=f5.
      ER30562   LABEL="H11 HD MED COVERAGE?                  87"         format=f1.
      ER30563   LABEL="MONTH S/O FAM FORMED                  87"         format=f2.
      ER30564   LABEL="YEAR S/O FAM FORMED                   87"         format=f4.
      ER30565   LABEL="MAIN FAM ID FOR S/O                   87"         format=f4.
      ER30566   LABEL="AGE FROM BIRTH DATE                   87"         format=f2.
      ER30567   LABEL="TYPE OF IND RECORD                    87"         format=f2.
      ER30568   LABEL="WHY NONRESPONSE                       87"         format=f2.
      ER30569   LABEL="INDIVIDUAL WEIGHT                     87"         format=f4.1
 %END;	
 %IF &I = 1988 %THEN %DO; 
      ER30570   LABEL="1988 INTERVIEW NUMBER"                            format=f4.
      ER30571   LABEL="SEQUENCE NUMBER                       88"         format=f2.
      ER30572   LABEL="RELATION TO HEAD                      88"         format=f2.
      ER30573   LABEL="AGE OF INDIVIDUAL                     88"         format=f3.
      ER30574   LABEL="MONTH INDIVIDUAL BORN                 88"         format=f2.
      ER30575   LABEL="YEAR INDIVIDUAL BORN                  88"         format=f4.
      ER30576   LABEL="MARITAL INDICATOR-IND                 88"         format=f1.
      ER30577   LABEL="MOVED IN/OUT                          88"         format=f1.
      ER30578   LABEL="MONTH MOVED IN/OUT                    88"         format=f2.
      ER30579   LABEL="YEAR MOVED IN/OUT                     88"         format=f4.
      ER30580   LABEL="EMPLOYMENT STAT-IND                   88"         format=f1.
      ER30581   LABEL="G88 MO LAST IN SCH-IND                88"         format=f2.
      ER30582   LABEL="G88 YR LAST IN SCH-IND                88"         format=f4.
      ER30583   LABEL="WHETHER STUDENT-IND                   88"         format=f1.
      ER30584   LABEL="COMPLETED EDUC-IND                    88"         format=f2.
      ER30585   LABEL="TYPE TXBL INCOME                      88"         format=f1.
      ER30586   LABEL="TOT TXBL INCOME-IND                   88"         format=f6.
      ER30587   LABEL="ACC TOT TXBL Y-IND                    88"         format=f1.
      ER30588   LABEL="ANN WORK HRS-IND                      88"         format=f4.
      ER30589   LABEL="ACC ANN WRK HRS-IND                   88"         format=f1.
      ER30590   LABEL="TYPE TRANSFER Y-IND                   88"         format=f2.
      ER30591   LABEL="G31 TYPE SOC SEC RCD                  88"         format=f1.
      ER30592   LABEL="G34 AMT SOC SEC RCD                   88"         format=f5.
      ER30593   LABEL="G34 ACC SOC SEC AMT                   88"         format=f1.
      ER30594   LABEL="TOT TRNSFR EXC SS-IND                 88"         format=f5.
      ER30595   LABEL="ACC TOT TRNSFR Y-IND                  88"         format=f1.
      ER30596   LABEL="TOTAL TRNSFR Y-IND                    88"         format=f5.
      ER30597   LABEL="H5 OFUM MED COVERAGE?                 88"         format=f1.
      ER30598   LABEL="H13 OFUM HEALTH GOOD                  88"         format=f1.
      ER30599   LABEL="MONTH S/O FAM FORMED                  88"         format=f2.
      ER30600   LABEL="YEAR S/O FAM FORMED                   88"         format=f4.
      ER30601   LABEL="MAIN FAM ID FOR S/O                   88"         format=f4.
      ER30602   LABEL="AGE FROM BIRTH DATE                   88"         format=f2.
      ER30603   LABEL="TYPE OF IND RECORD                    88"         format=f2.
      ER30604   LABEL="WHY NONRESPONSE                       88"         format=f2.
      ER30605   LABEL="INDIVIDUAL WEIGHT                     88"         format=f4.1
 %END;	
 %IF &I = 1989 %THEN %DO; 
      ER30606   LABEL="1989 INTERVIEW NUMBER"                            format=f4.
      ER30607   LABEL="SEQUENCE NUMBER                       89"         format=f2.
      ER30608   LABEL="RELATION TO HEAD                      89"         format=f2.
      ER30609   LABEL="AGE OF INDIVIDUAL                     89"         format=f3.
      ER30610   LABEL="MONTH INDIVIDUAL BORN                 89"         format=f2.
      ER30611   LABEL="YEAR INDIVIDUAL BORN                  89"         format=f4.
      ER30612   LABEL="MARITAL INDICATOR-IND                 89"         format=f1.
      ER30613   LABEL="MOVED IN/OUT                          89"         format=f1.
      ER30614   LABEL="MONTH MOVED IN/OUT                    89"         format=f2.
      ER30615   LABEL="YEAR MOVED IN/OUT                     89"         format=f4.
      ER30616   LABEL="EMPLOYMENT STAT-IND                   89"         format=f1.
      ER30617   LABEL="G88 MO LAST IN SCH-IND                89"         format=f2.
      ER30618   LABEL="G88 YR LAST IN SCH-IND                89"         format=f4.
      ER30619   LABEL="WHETHER STUDENT-IND                   89"         format=f1.
      ER30620   LABEL="COMPLETED EDUC-IND                    89"         format=f2.
      ER30621   LABEL="TYPE TXBL INCOME                      89"         format=f1.
      ER30622   LABEL="TOT TXBL INCOME-IND                   89"         format=f6.
      ER30623   LABEL="ACC TOT TXBL Y-IND                    89"         format=f1.
      ER30624   LABEL="ANN WORK HRS-IND                      89"         format=f4.
      ER30625   LABEL="ACC ANN WRK HRS-IND                   89"         format=f1.
      ER30626   LABEL="TYPE TRANSFER Y-IND                   89"         format=f2.
      ER30627   LABEL="G31 TYPE SOC SEC RCD                  89"         format=f1.
      ER30628   LABEL="G34 AMT SOC SEC RCD                   89"         format=f5.
      ER30629   LABEL="G34 ACC SOC SEC AMT                   89"         format=f1.
      ER30630   LABEL="TOT TRNSFR EXC SS-IND                 89"         format=f5.
      ER30631   LABEL="ACC TOT TRNSFR Y-IND                  89"         format=f1.
      ER30632   LABEL="TOTAL TRNSFR Y-IND                    89"         format=f5.
      ER30633   LABEL="H5 OFUM MED COVERAGE?                 89"         format=f1.
      ER30634   LABEL="H13 OFUM HEALTH GOOD                  89"         format=f1.
      ER30635   LABEL="MONTH S/O FAM FORMED                  89"         format=f2.
      ER30636   LABEL="YEAR S/O FAM FORMED                   89"         format=f4.
      ER30637   LABEL="MAIN FAM ID FOR S/O                   89"         format=f4.
      ER30638   LABEL="AGE FROM BIRTH DATE                   89"         format=f2.
      ER30639   LABEL="TYPE OF IND RECORD                    89"         format=f2.
      ER30640   LABEL="WHY NONRESPONSE                       89"         format=f2.
      ER30641   LABEL="INDIVIDUAL WEIGHT                     89"         format=f4.1
 %END;	
 %IF &I = 1990 %THEN %DO; 
      ER30642   LABEL="1990 INTERVIEW NUMBER"                            format=f5.
      ER30643   LABEL="SEQUENCE NUMBER                       90"         format=f2.
      ER30644   LABEL="RELATION TO HEAD                      90"         format=f2.
      ER30645   LABEL="AGE OF INDIVIDUAL                     90"         format=f3.
      ER30646   LABEL="MONTH INDIVIDUAL BORN                 90"         format=f2.
      ER30647   LABEL="YEAR INDIVIDUAL BORN                  90"         format=f4.
      ER30648   LABEL="MARITAL INDICATOR-IND                 90"         format=f1.
      ER30649   LABEL="MOVED IN/OUT                          90"         format=f1.
      ER30650   LABEL="MONTH MOVED IN/OUT                    90"         format=f2.
      ER30651   LABEL="YEAR MOVED IN/OUT                     90"         format=f4.
      ER30652   LABEL="IS IND TEMPLE INFORMANT               90"         format=f1.
      ER30653   LABEL="EMPLOYMENT STAT-IND                   90"         format=f1.
      ER30654   LABEL="G88 MO LAST IN SCH-IND                90"         format=f2.
      ER30655   LABEL="G88 YR LAST IN SCH-IND                90"         format=f4.
      ER30656   LABEL="WHETHER STUDENT-IND                   90"         format=f1.
      ER30657   LABEL="COMPLETED EDUC-IND                    90"         format=f2.
      ER30658   LABEL="TYPE TXBL INCOME                      90"         format=f1.
      ER30659   LABEL="TOT TXBL INCOME-IND                   90"         format=f6.
      ER30660   LABEL="ACC TOT TXBL Y-IND                    90"         format=f1.
      ER30661   LABEL="ANN WORK HRS-IND                      90"         format=f4.
      ER30662   LABEL="ACC ANN WRK HRS-IND                   90"         format=f1.
      ER30663   LABEL="TYPE TRANSFER Y-IND                   90"         format=f2.
      ER30664   LABEL="G31 TYPE SOC SEC RCD                  90"         format=f1.
      ER30665   LABEL="G34 AMT SOC SEC RCD                   90"         format=f5.
      ER30666   LABEL="G34 ACC SOC SEC AMT                   90"         format=f1.
      ER30667   LABEL="TOT TRNSFR EXC SS-IND                 90"         format=f5.
      ER30668   LABEL="ACC TOT TRNSFR Y-IND                  90"         format=f1.
      ER30669   LABEL="TOTAL TRNSFR Y-IND                    90"         format=f5.
      ER30670   LABEL="H5 OFUM MED COVERAGE?                 90"         format=f1.
      ER30671   LABEL="H13 OFUM HEALTH GOOD                  90"         format=f1.
      ER30672   LABEL="K2 LIVE OUT US 1YR+                   90"         format=f1.
      ER30673   LABEL="K3 LIVE IN US IN 1968                 90"         format=f1.
      ER30674   LABEL="K4 YR PERMANENT IN US                 90"         format=f4.
      ER30675   LABEL="K5 MOTHER IN US IN 1968               90"         format=f1.
      ER30676   LABEL="K6 FATHER IN US IN 1968               90"         format=f1.
      ER30677   LABEL="MONTH S/O FAM FORMED                  90"         format=f2.
      ER30678   LABEL="YEAR S/O FAM FORMED                   90"         format=f4.
      ER30679   LABEL="MAIN FAM ID FOR S/O                   90"         format=f5.
      ER30680   LABEL="AGE FROM BIRTH DATE                   90"         format=f2.
      ER30681   LABEL="FOLLOW STATUS                         90"         format=f1.
      ER30682   LABEL="RETND SELF ADMIN QNAIRE               90"         format=f1.
      ER30683   LABEL="MEDICARE PERMISSION                   90"         format=f1.
      ER30684   LABEL="TYPE OF IND RECORD                    90"         format=f2.
      ER30685   LABEL="WHY NONRESPONSE                       90"         format=f2.
      ER30686   LABEL="CORE IND WEIGHT                       90"         format=f7.3
      ER30687   LABEL="LATINO IND WEIGHT                     90"         format=f5.3
      ER30688   LABEL="COMBINED IND WEIGHT                   90"         format=f7.3
 %END;	
 %IF &I = 1991 %THEN %DO; 
      ER30689   LABEL="1991 INTERVIEW NUMBER"                            format=f4.
      ER30690   LABEL="SEQUENCE NUMBER                       91"         format=f2.
      ER30691   LABEL="RELATION TO HEAD                      91"         format=f2.
      ER30692   LABEL="AGE OF INDIVIDUAL                     91"         format=f3.
      ER30693   LABEL="MONTH INDIVIDUAL BORN                 91"         format=f2.
      ER30694   LABEL="YEAR INDIVIDUAL BORN                  91"         format=f4.
      ER30695   LABEL="MARITAL INDICATOR-IND                 91"         format=f1.
      ER30696   LABEL="MOVED IN/OUT                          91"         format=f1.
      ER30697   LABEL="MONTH MOVED IN/OUT                    91"         format=f2.
      ER30698   LABEL="YEAR MOVED IN/OUT                     91"         format=f4.
      ER30699   LABEL="EMPLOYMENT STAT-IND                   91"         format=f1.
      ER30700   LABEL="G88 MO LAST IN SCH-IND                91"         format=f2.
      ER30701   LABEL="G88 YR LAST IN SCH-IND                91"         format=f4.
      ER30702   LABEL="WHETHER STUDENT-IND                   91"         format=f1.
      ER30703   LABEL="COMPLETED EDUC-IND                    91"         format=f2.
      ER30704   LABEL="TYPE TXBL INCOME                      91"         format=f1.
      ER30705   LABEL="TOT LABOR INCOME-IND                  91"         format=f6.
      ER30706   LABEL="ACC TOT LABOR Y-IND                   91"         format=f1.
      ER30707   LABEL="TOT ASSET INCOME-IND                  91"         format=f6.
      ER30708   LABEL="ACC TOT ASSET Y-IND                   91"         format=f1.
      ER30709   LABEL="ANN WORK HRS-IND                      91"         format=f4.
      ER30710   LABEL="ACC ANN WRK HRS-IND                   91"         format=f1.
      ER30711   LABEL="TYPE TRANSFER Y-IND                   91"         format=f2.
      ER30712   LABEL="G31 TYPE SOC SEC RCD                  91"         format=f1.
      ER30713   LABEL="G34 AMT SOC SEC RCD                   91"         format=f5.
      ER30714   LABEL="G34 ACC SOC SEC AMT                   91"         format=f1.
      ER30715   LABEL="TOT TRNSFR EXC SS-IND                 91"         format=f5.
      ER30716   LABEL="ACC TOT TRNSFR Y-IND                  91"         format=f1.
      ER30717   LABEL="TOTAL TRNSFR Y-IND                    91"         format=f5.
      ER30718   LABEL="H5 IND MED COVERAGE?                  91"         format=f1.
      ER30719   LABEL="H13 OFUM HEALTH GOOD                  91"         format=f1.
      ER30720   LABEL="MONTH S/O FAM FORMED                  91"         format=f2.
      ER30721   LABEL="YEAR S/O FAM FORMED                   91"         format=f4.
      ER30722   LABEL="MAIN FAM ID FOR S/O                   91"         format=f5.
      ER30723   LABEL="AGE FROM BIRTH DATE                   91"         format=f2.
      ER30724   LABEL="FOLLOW STATUS                         91"         format=f1.
      ER30725   LABEL="MEDICARE PERMISSION                   91"         format=f1.
      ER30726   LABEL="WHETHER ELIG PARENT                   91"         format=f1.
      ER30727   LABEL="WHETHER HEALTH SUPP RECD              91"         format=f1.
      ER30728   LABEL="TYPE OF IND RECORD                    91"         format=f2.
      ER30729   LABEL="WHY NONRESPONSE                       91"         format=f2.
      ER30730   LABEL="CORE IND WEIGHT                       91"         format=f7.3
      ER30731   LABEL="LATINO IND WEIGHT                     91"         format=f5.3
      ER30732   LABEL="COMBINED IND WEIGHT                   91"         format=f7.3
 %END;	
 %IF &I = 1992 %THEN %DO; 
      ER30733   LABEL="1992 INTERVIEW NUMBER"                            format=f4.
      ER30734   LABEL="SEQUENCE NUMBER                       92"         format=f2.
      ER30735   LABEL="RELATION TO HEAD                      92"         format=f2.
      ER30736   LABEL="AGE OF INDIVIDUAL                     92"         format=f3.
      ER30737   LABEL="MONTH IND BORN                        92"         format=f2.
      ER30738   LABEL="YEAR IND BORN                         92"         format=f4.
      ER30739   LABEL="MARR PAIRS INDICATOR                  92"         format=f1.
      ER30740   LABEL="MOVED IN/OUT                          92"         format=f1.
      ER30741   LABEL="MONTH MOVED IN/OUT                    92"         format=f2.
      ER30742   LABEL="YEAR MOVED IN/OUT                     92"         format=f4.
      ER30743   LABEL="TEMPLE INFORMNT HD                    92"         format=f1.
      ER30744   LABEL="EMPLOYMENT STAT                       92"         format=f1.
      ER30745   LABEL="G88 MO LAST IN SCH                    92"         format=f2.
      ER30746   LABEL="G88 YR LAST IN SCH                    92"         format=f4.
      ER30747   LABEL="WHETHER STUDENT                       92"         format=f1.
      ER30748   LABEL="COMPLETED EDUCATION                   92"         format=f2.
      ER30749   LABEL="TYPE TXBL INC BUILT                   92"         format=f1.
      ER30750   LABEL="TOT LABOR INCOME                      92"         format=f6.
      ER30751   LABEL="ACC TOT LABOR INCOME                  92"         format=f1.
      ER30752   LABEL="TOT ASSET INCOME                      92"         format=f6.
      ER30753   LABEL="ACC TOT ASSET INCOME                  92"         format=f1.
      ER30754   LABEL="ANN WORK HRS                          92"         format=f4.
      ER30755   LABEL="ACC ANN WRK HRS                       92"         format=f1.
      ER30756   LABEL="TYPE TRANSFER Y BUILT                 92"         format=f2.
      ER30757   LABEL="G33 TYPE SOC SEC RCD                  92"         format=f1.
      ER30758   LABEL="G34 AMT SOC SEC RCD                   92"         format=f5.
      ER30759   LABEL="G34 ACC SOC SEC AMT                   92"         format=f1.
      ER30760   LABEL="TOT TRANSFR EXC SS                    92"         format=f5.
      ER30761   LABEL="ACC TOT TRNSFR EXC SS                 92"         format=f1.
      ER30762   LABEL="TOTAL TRNSFR INCOME                   92"         format=f5.
      ER30763   LABEL="H25 IND MED COVERAGE?                 92"         format=f1.
      ER30764   LABEL="H53 OFUM HEALTH GOOD                  92"         format=f1.
      ER30765   LABEL="K2 OUT US 1968+ HD                    92"         format=f1.
      ER30766   LABEL="K3 IN US 1968 HD                      92"         format=f1.
      ER30767   LABEL="K4 YR IN US HD                        92"         format=f4.
      ER30768   LABEL="K5 MOTHER IN US 68 HD                 92"         format=f1.
      ER30769   LABEL="K6 FATHER IN US 68 HD                 92"         format=f1.
      ER30770   LABEL="H6A BATHING                           92"         format=f1.
      ER30771   LABEL="H6B DRESSING                          92"         format=f1.
      ER30772   LABEL="H6C EATING                            92"         format=f1.
      ER30773   LABEL="H6D GET OUT OF BED/CHAIR              92"         format=f1.
      ER30774   LABEL="H6E WALKING                           92"         format=f1.
      ER30775   LABEL="H6F GET OUTSIDE                       92"         format=f1.
      ER30776   LABEL="H6G USE/GET TO TOILET                 92"         format=f1.
      ER30777   LABEL="H7 CKPT                               92"         format=f1.
      ER30778   LABEL="H8 GET HELP W ACTIVITIES              92"         format=f1.
      ER30779   LABEL="H9 PROB PREPARE MEALS                 92"         format=f1.
      ER30780   LABEL="H10 B/C OF HEALTH?                    92"         format=f1.
      ER30781   LABEL="H11 PROB SHOP PERS ITEM               92"         format=f1.
      ER30782   LABEL="H12 B/C OF HEALTH?                    92"         format=f1.
      ER30783   LABEL="H13 PROB MANAGE MONEY                 92"         format=f1.
      ER30784   LABEL="H14 B/C OF HEALTH?                    92"         format=f1.
      ER30785   LABEL="H15 PROB USE PHONE                    92"         format=f1.
      ER30786   LABEL="H16 B/C OF HEALTH?                    92"         format=f1.
      ER30787   LABEL="H17 PROB HEAVY HOUSEWORK              92"         format=f1.
      ER30788   LABEL="H18 B/C OF HEALTH?                    92"         format=f1.
      ER30789   LABEL="H19 PROB LIGHT HOUSEWORK              92"         format=f1.
      ER30790   LABEL="H20 B/C OF HEALTH?                    92"         format=f1.
      ER30791   LABEL="H21 HOME HLTH CARE  1991              92"         format=f1.
      ER30792   LABEL="H22 IN NURSING HOME 1991              92"         format=f1.
      ER30793   LABEL="H23 #WKS IN NURSING HOME              92"         format=f2.
      ER30794   LABEL="H24 IN NURS HOME BEFR 91              92"         format=f1.
      ER30795   LABEL="MONTH S/O FAM FORMED                  92"         format=f2.
      ER30796   LABEL="YEAR S/O FAM FORMED                   92"         format=f4.
      ER30797   LABEL="MAIN FAM ID FOR S/O                   92"         format=f5.
      ER30798   LABEL="AGE FROM BIRTH DATE                   92"         format=f2.
      ER30799   LABEL="FOLLOW STATUS                         92"         format=f1.
      ER30800   LABEL="MEDICARE PERMISSION                   92"         format=f1.
      ER30801   LABEL="TYPE OF IND RECORD                    92"         format=f2.
      ER30802   LABEL="WHY NONRESPONSE                       92"         format=f2.
      ER30803   LABEL="CORE IND WEIGHT                       92"         format=f7.3
      ER30804   LABEL="LATINO IND WEIGHT                     92"         format=f5.3
      ER30805   LABEL="COMBINED IND WEIGHT                   92"         format=f7.3
 %END;	
 %IF &I = 1993 %THEN %DO; 
      ER30806   LABEL="1993 INTERVIEW NUMBER"                            format=f5.
      ER30807   LABEL="SEQUENCE NUMBER                       93"         format=f2.
      ER30808   LABEL="RELATION TO HEAD                      93"         format=f2.
      ER30809   LABEL="AGE OF INDIVIDUAL                     93"         format=f3.
      ER30810   LABEL="MONTH INDIVIDUAL BORN                 93"         format=f2.
      ER30811   LABEL="YEAR INDIVIDUAL BORN                  93"         format=f4.
      ER30812   LABEL="MARITAL PAIRS INDICATOR               93"         format=f1.
      ER30813   LABEL="MOVED IN/OUT                          93"         format=f1.
      ER30814   LABEL="MONTH MOVED IN/OUT                    93"         format=f2.
      ER30815   LABEL="YEAR MOVED IN/OUT                     93"         format=f4.
      ER30816   LABEL="EMPLOYMENT STATUS                     93"         format=f1.
      ER30817   LABEL="G88 MO LAST IN SCHOOL                 93"         format=f2.
      ER30818   LABEL="G88 YR LAST IN SCHOOL                 93"         format=f4.
      ER30819   LABEL="WHETHER STUDENT                       93"         format=f1.
      ER30820   LABEL="YRS COMPLETED EDUCATION               93"         format=f2.
      ER30821   LABEL="TOTAL LABOR INCOME                    93"         format=f6.
      ER30822   LABEL="TOTAL ASSET INCOME                    93"         format=f7.
      ER30823   LABEL="TOTAL ANNUAL WORK HRS                 93"         format=f4.
      ER30824   LABEL="TYPE TRANSFER INCOME                  93"         format=f2.
      ER30825   LABEL="TOTAL TRANSFER INCOME                 93"         format=f6.
      ER30826   LABEL="HAS MEDICAL COVERAGE?                 93"         format=f1.
      ER30827   LABEL="HEALTH GOOD?                          93"         format=f1.
      ER30828   LABEL="H6A BATHING                           93"         format=f1.
      ER30829   LABEL="H6B DRESSING                          93"         format=f1.
      ER30830   LABEL="H6C EATING                            93"         format=f1.
      ER30831   LABEL="H6D GET OUT OF BED/CHAIR              93"         format=f1.
      ER30832   LABEL="H6E WALKING                           93"         format=f1.
      ER30833   LABEL="H6F GET OUTSIDE                       93"         format=f1.
      ER30834   LABEL="H6G USE/GET TO TOILET                 93"         format=f1.
      ER30835   LABEL="H7 CKPT                               93"         format=f1.
      ER30836   LABEL="H8 GET HELP W ACTIVITIES              93"         format=f1.
      ER30837   LABEL="H9 PROB PREPARE MEALS                 93"         format=f1.
      ER30838   LABEL="H10 B/C OF HEALTH?                    93"         format=f1.
      ER30839   LABEL="H11 PROB SHOP PERS ITEM               93"         format=f1.
      ER30840   LABEL="H12 B/C OF HEALTH?                    93"         format=f1.
      ER30841   LABEL="H13 PROB MANAGE MONEY                 93"         format=f1.
      ER30842   LABEL="H14 B/C OF HEALTH?                    93"         format=f1.
      ER30843   LABEL="H15 PROB USE PHONE                    93"         format=f1.
      ER30844   LABEL="H16 B/C OF HEALTH?                    93"         format=f1.
      ER30845   LABEL="H17 PROB HEAVY HOUSEWORK              93"         format=f1.
      ER30846   LABEL="H18 B/C OF HEALTH?                    93"         format=f1.
      ER30847   LABEL="H19 PROB LIGHT HOUSEWORK              93"         format=f1.
      ER30848   LABEL="H20 B/C OF HEALTH?                    93"         format=f1.
      ER30849   LABEL="H21 HOME HLTH CARE  1992              93"         format=f1.
      ER30850   LABEL="H22 IN NURSING HOME 1992              93"         format=f1.
      ER30851   LABEL="H23 #WKS IN NURSING HOME              93"         format=f2.
      ER30852   LABEL="H24 IN NURS HOME BEFR 92              93"         format=f1.
      ER30853   LABEL="WTR HCB RECORD FOR SELF               93"         format=f1.
      ER30854   LABEL="WTR HCB RECORD FOR DAD                93"         format=f1.
      ER30855   LABEL="WTR HCB RECORD FOR MOM                93"         format=f1.
      ER30856   LABEL="MONTH S/O FAM FORMED                  93"         format=f2.
      ER30857   LABEL="YEAR S/O FAM FORMED                   93"         format=f4.
      ER30858   LABEL="MAIN FAM ID FOR S/O                   93"         format=f5.
      ER30859   LABEL="FOLLOW STATUS                         93"         format=f1.
      ER30860   LABEL="WHY FOLLOWABLE                        93"         format=f1.
      ER30861   LABEL="MEDICARE PERMISSION                   93"         format=f1.
      ER30862   LABEL="TYPE OF IND RECORD                    93"         format=f2.
      ER30863   LABEL="WHY NONRESPONSE                       93"         format=f2.
      ER30864   LABEL="CORE IND WEIGHT                       93"         format=f7.3
      ER30865   LABEL="LATINO IND WEIGHT                     93"         format=f5.3
      ER30866   LABEL="COMBINED IND WEIGHT                   93"         format=f7.3
 %END;	
 %IF &I = 1968 %THEN %DO; 
      ER31987   LABEL="WHETHER IN US IN 1968"                            format=f1.
      ER31988   LABEL="ETHNICITY ELIGIBILITY FOR LNPS"                   format=f1.
      ER31989   LABEL="ETHNICITY OF LNPS SAMPLING AREA"                  format=f1.
      ER31990   LABEL="MEXICAN LATINO STRATUM"                           format=f2.
      ER31991   LABEL="MEXICAN LATINO SECU"                              format=f1.
      ER31992   LABEL="PUERTO RICAN LATINO STRATUM"                      format=f2.
      ER31993   LABEL="PUERTO RICAN LATINO SECU"                         format=f1.
      ER31994   LABEL="CUBAN LATINO STRATUM"                             format=f1.
      ER31995   LABEL="CUBAN LATINO SECU"                                format=f1.
      ER31996   LABEL="SAMPLING ERROR STRATUM"                           format=f2.
      ER31997   LABEL="SAMPLING ERROR CLUSTER"                           format=f1.
      ER32000   LABEL="SEX OF INDIVIDUAL"                                format=f1.
      ER32001   LABEL="WTR ALWAYS IN RESPONDING FAMILY UNIT"             format=f1.
      ER32002   LABEL="WTR EVER CODED INSTITUTIONAL"                     format=f1.
      ER32003   LABEL="WTR ORIGINAL SAMPLE/BORN IN/MOVED IN"             format=f1.
      ER32004   LABEL="WTR EVER MOVED OUT OF FU OR DIED"                 format=f1.
      ER32005   LABEL="WTR EVER OUT OF STUDY 1 YEAR OR MORE"             format=f1.
      ER32006   LABEL="WHETHER SAMPLE OR NONSAMPLE"                      format=f1.
      ER32007   LABEL="YEAR OF MOST RECENT NONRESPONSE"                  format=f4.
      ER32008   LABEL="YEAR FIRST BECAME NONRESPONSE"                    format=f4.
      ER32009   LABEL="1968 ID OF MOTHER"                                format=f4.
      ER32010   LABEL="PERSON # OF MOTHER"                               format=f3.
      ER32011   LABEL="YEAR MOTHER BORN"                                 format=f4.
      ER32012   LABEL="TOTAL # CHILDREN BORN TO MOTHER"                  format=f2.
      ER32013   LABEL="ORDER OF BIRTH TO MOTHER"                         format=f2.
      ER32014   LABEL="BIRTH WEIGHT OF THIS INDIVIDUAL"                  format=f3.
      ER32015   LABEL="MARITAL STATUS OF MOTHER AT BIRTH"                format=f1.
      ER32016   LABEL="1968 ID OF FATHER"                                format=f4.
      ER32017   LABEL="PERSON # OF FATHER"                               format=f3.
      ER32018   LABEL="YEAR FATHER BORN"                                 format=f4.
      ER32019   LABEL="TOTAL # CHILDREN BORN TO FATHER"                  format=f2.
      ER32020   LABEL="ORDER OF BIRTH TO FATHER"                         format=f2.
      ER32021   LABEL="YEAR BIRTH INFO MOST RECENTLY UPDATED"            format=f4.
      ER32022   LABEL="# LIVE BIRTHS TO THIS INDIVIDUAL"                 format=f2.
      ER32023   LABEL="MONTH 1ST/ONLY CHILD BORN"                        format=f2.
      ER32024   LABEL="YEAR 1ST/ONLY CHILD BORN"                         format=f4.
      ER32025   LABEL="MONTH YOUNGEST CHILD BORN"                        format=f2.
      ER32026   LABEL="YEAR YOUNGEST CHILD BORN"                         format=f4.
      ER32027   LABEL="MONTH 2ND YOUNGEST CHILD BORN"                    format=f2.
      ER32028   LABEL="YEAR 2ND YOUNGEST CHILD BORN"                     format=f4.
      ER32029   LABEL="MONTH 3RD YOUNGEST CHILD BORN"                    format=f2.
      ER32030   LABEL="YEAR 3RD YOUNGEST CHILD BORN"                     format=f4.
      ER32031   LABEL="MONTH 4TH YOUNGEST CHILD BORN"                    format=f2.
      ER32032   LABEL="YEAR 4TH YOUNGEST CHILD BORN"                     format=f4.
      ER32033   LABEL="YEAR MARITAL INFO MOST RECENTLY UPDATED"          format=f4.
      ER32034   LABEL="# MARRIAGES OF THIS INDIVIDUAL"                   format=f2.
      ER32035   LABEL="MONTH FIRST/ONLY MARRIAGE BEGAN"                  format=f2.
      ER32036   LABEL="YEAR FIRST/ONLY MARRIAGE BEGAN"                   format=f4.
      ER32037   LABEL="STATUS OF FIRST/ONLY MARRIAGE"                    format=f1.
      ER32038   LABEL="MONTH FIRST/ONLY MARRIAGE ENDED"                  format=f2.
      ER32039   LABEL="YEAR FIRST/ONLY MARRIAGE ENDED"                   format=f4.
      ER32040   LABEL="MONTH SEPARATED FIRST/ONLY MARRIAGE"              format=f2.
      ER32041   LABEL="YEAR SEPARATED FIRST/ONLY MARRIAGE"               format=f4.
      ER32042   LABEL="MONTH MOST RECENT MARRIAGE BEGAN"                 format=f2.
      ER32043   LABEL="YEAR MOST RECENT MARRIAGE BEGAN"                  format=f4.
      ER32044   LABEL="STATUS OF MOST RECENT MARRIAGE"                   format=f1.
      ER32045   LABEL="MONTH MOST RECENT MARRIAGE ENDED"                 format=f2.
      ER32046   LABEL="YEAR MOST RECENT MARRIAGE ENDED"                  format=f4.
      ER32047   LABEL="MONTH SEPARATED MOST RECENT MARRIAGE"             format=f2.
      ER32048   LABEL="YEAR SEPARATED MOST RECENT MARRIAGE"              format=f4.
      ER32049   LABEL="LAST KNOWN MARITAL STATUS"                        format=f1.
      ER32050   LABEL="YEAR OF DEATH"                                    format=f4.
 %END;	
 %IF &I = 1994 %THEN %DO; 
      ER33101   LABEL="1994 INTERVIEW NUMBER"                            format=f5.
      ER33102   LABEL="SEQUENCE NUMBER                       94"         format=f2.
      ER33103   LABEL="RELATION TO HEAD                      94"         format=f2.
      ER33104   LABEL="AGE OF INDIVIDUAL                     94"         format=f3.
      ER33105   LABEL="MONTH INDIVIDUAL BORN                 94"         format=f2.
      ER33106   LABEL="YEAR INDIVIDUAL BORN                  94"         format=f4.
      ER33107   LABEL="MARITAL PAIRS INDICAT                 94"         format=f1.
      ER33108   LABEL="MOVED IN/OUT                          94"         format=f1.
      ER33109   LABEL="MONTH MOVED IN/OUT                    94"         format=f2.
      ER33110   LABEL="YEAR MOVED IN/OUT                     94"         format=f4.
      ER33111   LABEL="EMPLOYMENT STATUS                     94"         format=f1.
      ER33112   LABEL="G88 MO LAST IN SCHOOL                 94"         format=f2.
      ER33113   LABEL="G88 YR LAST IN SCHOOL                 94"         format=f4.
      ER33114   LABEL="WHETHER STUDENT                       94"         format=f1.
      ER33115   LABEL="YRS COMPLETED EDUC                    94"         format=f2.
      ER33116   LABEL="HAS MEDICAL COVERAGE?                 94"         format=f1.
      ER33117   LABEL="HEALTH GOOD?                          94"         format=f1.
      ER33118   LABEL="MEDICARE PERMISSION                   94"         format=f1.
      ER33119   LABEL="CORE INDIVIDUAL LONGITUDINAL WEIGHT  94"          format=f7.3
      ER33120   LABEL="LAT IND WEIGHT NUMBER 1               94"         format=f6.3
      ER33121   LABEL="COMBO IND WT NUMBER 1                 94"         format=f7.3
      ER33122   LABEL="MONTH S/O FAM FORMED                  94"         format=f2.
      ER33123   LABEL="YEAR S/O FAM FORMED                   94"         format=f4.
      ER33124   LABEL="MAIN FAM ID FOR S/O                   94"         format=f5.
      ER33125   LABEL="FOLLOW STATUS                         94"         format=f1.
      ER33126   LABEL="TYPE OF IND RECORD                    94"         format=f2.
      ER33127   LABEL="WHY NONRESPONSE                       94"         format=f2.
      ER33128   LABEL="H1 HEALTH STATUS                      94"         format=f1.
      ER33129   LABEL="H6A BATHING                           94"         format=f1.
      ER33130   LABEL="H6B DRESSING                          94"         format=f1.
      ER33131   LABEL="H6C EATING                            94"         format=f1.
      ER33132   LABEL="H6D GET OUT OF BED/CHAIR              94"         format=f1.
      ER33133   LABEL="H6E WALKING                           94"         format=f1.
      ER33134   LABEL="H6F GET OUTSIDE                       94"         format=f1.
      ER33135   LABEL="H6G USE/GET TO TOILET                 94"         format=f1.
      ER33136   LABEL="H7 CKPT                               94"         format=f1.
      ER33137   LABEL="H8 GET HELP W ACTIVITIES              94"         format=f1.
      ER33138   LABEL="H9 PROB PREPARE MEALS                 94"         format=f1.
      ER33139   LABEL="H10 B/C OF HEALTH?                    94"         format=f1.
      ER33140   LABEL="H11 PROB SHOP PERS ITEM               94"         format=f1.
      ER33141   LABEL="H12 B/C OF HEALTH?                    94"         format=f1.
      ER33142   LABEL="H13 PROB MANAGE MONEY                 94"         format=f1.
      ER33143   LABEL="H14 B/C OF HEALTH?                    94"         format=f1.
      ER33144   LABEL="H15 PROB USE PHONE                    94"         format=f1.
      ER33145   LABEL="H16 B/C OF HEALTH?                    94"         format=f1.
      ER33146   LABEL="H17 PROB HEAVY HOUSEWORK              94"         format=f1.
      ER33147   LABEL="H18 B/C OF HEALTH?                    94"         format=f1.
      ER33148   LABEL="H19 PROB LIGHT HOUSEWORK              94"         format=f1.
      ER33149   LABEL="H20 B/C OF HEALTH?                    94"         format=f1.
      ER33150   LABEL="WHY FOLLOWABLE                        94"         format=f2.
 %END;	
 %IF &I = 1995 %THEN %DO; 
      ER33201   LABEL="1995 INTERVIEW NUMBER"                            format=f5.
      ER33202   LABEL="SEQUENCE NUMBER                       95"         format=f2.
      ER33203   LABEL="RELATION TO HEAD                      95"         format=f2.
      ER33204   LABEL="AGE OF INDIVIDUAL                     95"         format=f3.
      ER33205   LABEL="MONTH INDIVIDUAL BORN                 95"         format=f2.
      ER33206   LABEL="YEAR INDIVIDUAL BORN                  95"         format=f4.
      ER33207   LABEL="MARITAL PAIRS INDICATOR               95"         format=f1.
      ER33208   LABEL="WHETHER MOVED IN/OUT                  95"         format=f1.
      ER33209   LABEL="MONTH MOVED IN/OUT                    95"         format=f2.
      ER33210   LABEL="YEAR MOVED IN/OUT                     95"         format=f4.
      ER33211   LABEL="EMPLOYMENT STATUS                     95"         format=f1.
      ER33212   LABEL="MONTH LAST IN SCHOOL                  95"         format=f2.
      ER33213   LABEL="YEAR LAST IN SCHOOL                   95"         format=f4.
      ER33214   LABEL="WHETHER STUDENT                       95"         format=f1.
      ER33215   LABEL="YEARS COMPLETED EDUCATION             95"         format=f2.
      ER33216   LABEL="HAS MEDICAL COVERAGE?                 95"         format=f1.
      ER33217   LABEL="HEALTH GOOD?                          95"         format=f1.
      ER33218   LABEL="MEDICARE PERMISSION                   95"         format=f1.
      ER33219   LABEL="RELATIONSHIP TO RESPONDENT            95"         format=f3.
      ER33220   LABEL="M3 CURRENTLY ATTENDING SCHOOL         95"         format=f1.
      ER33221   LABEL="M5 FULL-TIME OR PART-TIME STUDENT     95"         format=f1.
      ER33222   LABEL="M6 WHAT GRADE                         95"         format=f2.
      ER33223   LABEL="M6A GRADUATE, GED, OR NEITHER         95"         format=f1.
      ER33224   LABEL="M7 MONTH LAST ATTENDED SCHOOL         95"         format=f2.
      ER33225   LABEL="M7 YEAR LAST ATTENDED SCHOOL          95"         format=f4.
      ER33226   LABEL="M9 LAST ENROLLED FULL OR PART TIME    95"         format=f1.
      ER33227   LABEL="M10 HIGHEST GRADE OR YEAR COMPLETED   95"         format=f2.
      ER33228   LABEL="M11A RECEIVED GED                     95"         format=f1.
      ER33229   LABEL="M12 HIGH SCHOOL GRAD, GED, OR NEITHER 95"         format=f1.
      ER33230   LABEL="M14 EVER ATTEND PRIVATE SCHOOL K-12   95"         format=f1.
      ER33231   LABEL="M14A EVER ATTEND PRIVATE SCHOOL K-12  95"         format=f1.
      ER33232   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 1   95"         format=f2.
      ER33233   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 2   95"         format=f2.
      ER33234   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 3   95"         format=f2.
      ER33235   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 4   95"         format=f2.
      ER33236   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 5   95"         format=f2.
      ER33237   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 6   95"         format=f2.
      ER33238   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 7   95"         format=f2.
      ER33239   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 8   95"         format=f2.
      ER33240   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 9   95"         format=f2.
      ER33241   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 10  95"         format=f2.
      ER33242   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 11  95"         format=f2.
      ER33243   LABEL="M15 GRADE ATTENDED PRIVATE SCHOOL 12  95"         format=f2.
      ER33244   LABEL="M16 NON-RELIG, CATHOLIC, ANOTHER REL  95"         format=f1.
      ER33245   LABEL="M17 ATTENDED SPEC CLASS/SCHL GIFTED   95"         format=f1.
      ER33246   LABEL="M18 REPEAT GRADE/SCHOOL RECOMMENDED   95"         format=f1.
      ER33247   LABEL="M19 WHICH GRADE REPEATED 1            95"         format=f2.
      ER33248   LABEL="M19 WHICH GRADE REPEATED 2            95"         format=f2.
      ER33249   LABEL="M19 WHICH GRADE REPEATED 3            95"         format=f2.
      ER33250   LABEL="M19 WHICH GRADE REPEATED 4            95"         format=f2.
      ER33251   LABEL="M19 WHICH GRADE REPEATED 5            95"         format=f2.
      ER33252   LABEL="M19 WHICH GRADE REPEATED 6            95"         format=f2.
      ER33253   LABEL="M19 WHICH GRADE REPEATED 7            95"         format=f2.
      ER33254   LABEL="M19 WHICH GRADE REPEATED 8            95"         format=f2.
      ER33255   LABEL="M19 WHICH GRADE REPEATED 9            95"         format=f2.
      ER33256   LABEL="M19 WHICH GRADE REPEATED 10           95"         format=f2.
      ER33257   LABEL="M19 WHICH GRADE REPEATED 11           95"         format=f2.
      ER33258   LABEL="M19 WHICH GRADE REPEATED 12           95"         format=f2.
      ER33259   LABEL="M20 EVER CLASSIFIED NEED SPECIAL ED   95"         format=f1.
      ER33260   LABEL="M21 LEARN DISAB PERCEPT/SPEECH IMPAIR 95"         format=f1.
      ER33261   LABEL="M22 EVER ENROLLED IN HEAD START       95"         format=f1.
      ER33262   LABEL="M23 HOW OLD 1ST ATTEND HEAD START     95"         format=f1.
      ER33263   LABEL="M24 TOTAL MONTHS ATTENDED HEAD START  95"         format=f1.
      ER33264   LABEL="M25 OTHER NURSERY PRESCHOOL DAY CARE  95"         format=f1.
      ER33265   LABEL="M26 SUSPENDED OR EXPELLED FROM SCHOOL 95"         format=f1.
      ER33266   LABEL="M27 EVER BOOKED/CHARGED BREAKING LAW  95"         format=f1.
      ER33267   LABEL="M28 SPENT TIME IN CORRECTIONS INST    95"         format=f1.
      ER33268   LABEL="M29 TIMES SENT TO YOUTH CORRECT INST  95"         format=f2.
      ER33269   LABEL="M30 TIMES SENT TO ADULT CORRECT INST  95"         format=f2.
      ER33270   LABEL="M31 MONTH LAST RELEASED               95"         format=f2.
      ER33271   LABEL="M31 YEAR LAST RELEASED                95"         format=f4.
      ER33272   LABEL="M33 TIMES FAM ASKED TALK SCHOOL BEHAV 95"         format=f1.
      ER33273   LABEL="M34 PARTICIPATE EXTRACURRICULAR ACT   95"         format=f1.
      ER33274   LABEL="M34A HOW OFTEN PARTIC EXTRACUR ACT    95"         format=f1.
      ER33275   LABEL="CORE INDIVIDUAL LONGITUDINAL WEIGHT   95"         format=f7.3
      ER33276   LABEL="LATINO IND WEIGHT NUMBER 1            95"         format=f6.3
      ER33277   LABEL="COMBINED IND WEIGHT NUMBER 1          95"         format=f7.3
      ER33278   LABEL="MONTH S/O FAM FORMED                  95"         format=f2.
      ER33279   LABEL="YEAR S/O FAM FORMED                   95"         format=f4.
      ER33280   LABEL="MAIN FAM ID FOR S/O                   95"         format=f5.
      ER33281   LABEL="FOLLOW STATUS                         95"         format=f1.
      ER33282   LABEL="TYPE OF IND RECORD                    95"         format=f2.
      ER33283   LABEL="WHY NONRESPONSE                       95"         format=f2.
      ER33284   LABEL="H1 HEALTH STATUS                      95"         format=f1.
      ER33285   LABEL="H6A BATHING                           95"         format=f1.
      ER33286   LABEL="H6B DRESSING                          95"         format=f1.
      ER33287   LABEL="H6C EATING                            95"         format=f1.
      ER33288   LABEL="H6D GET OUT OF BED/CHAIR              95"         format=f1.
      ER33289   LABEL="H6E WALKING                           95"         format=f1.
      ER33290   LABEL="H6F GET OUTSIDE                       95"         format=f1.
      ER33291   LABEL="H6G USE/GET TO TOILET                 95"         format=f1.
      ER33292   LABEL="H7 CKPT                               95"         format=f1.
      ER33293   LABEL="H8 GET HELP W ACTIVITIES              95"         format=f1.
      ER33294   LABEL="H9 PROB PREPARE MEALS                 95"         format=f1.
      ER33294A  LABEL="H10 B/C OF HEALTH?                    95"         format=f1.
      ER33295   LABEL="H11 PROB SHOP PERS ITEM               95"         format=f1.
      ER33295A  LABEL="H12 B/C OF HEALTH?                    95"         format=f1.
      ER33296   LABEL="H13 PROB MANAGE MONEY                 95"         format=f1.
      ER33296A  LABEL="H14 B/C OF HEALTH?                    95"         format=f1.
      ER33297   LABEL="H15 PROB USE PHONE                    95"         format=f1.
      ER33297A  LABEL="H16 B/C OF HEALTH?                    95"         format=f1.
      ER33298   LABEL="H17 PROB HEAVY HOUSEWORK              95"         format=f1.
      ER33298A  LABEL="H18 B/C OF HEALTH?                    95"         format=f1.
      ER33299   LABEL="H19 PROB LIGHT HOUSEWORK              95"         format=f1.
      ER33299A  LABEL="H20 B/C OF HEALTH?                    95"         format=f1.
      ER33299B  LABEL="WHY FOLLOWABLE                        95"         format=f2.
 %END;	
 %IF &I = 1996 %THEN %DO; 
      ER33301   LABEL="1996 INTERVIEW NUMBER"                            format=f4.
      ER33302   LABEL="SEQUENCE NUMBER                       96"         format=f2.
      ER33303   LABEL="RELATION TO HEAD                      96"         format=f2.
      ER33304   LABEL="AGE OF INDIVIDUAL                     96"         format=f3.
      ER33305   LABEL="MONTH INDIVIDUAL BORN                 96"         format=f2.
      ER33306   LABEL="YEAR INDIVIDUAL BORN                  96"         format=f4.
      ER33307   LABEL="MARITAL PAIRS INDICATOR               96"         format=f1.
      ER33308   LABEL="WHETHER MOVED IN/OUT                  96"         format=f1.
      ER33309   LABEL="MONTH MOVED IN/OUT                    96"         format=f2.
      ER33310   LABEL="YEAR MOVED IN/OUT                     96"         format=f4.
      ER33311   LABEL="EMPLOYMENT STATUS                     96"         format=f1.
      ER33312   LABEL="MONTH LAST IN SCHOOL                  96"         format=f2.
      ER33313   LABEL="YEAR LAST IN SCHOOL                   96"         format=f4.
      ER33314   LABEL="WHETHER STUDENT                       96"         format=f1.
      ER33315   LABEL="YEARS COMPLETED EDUCATION             96"         format=f2.
      ER33316   LABEL="HAS MEDICAL COVERAGE?                 96"         format=f1.
      ER33317   LABEL="HEALTH GOOD?                          96"         format=f1.
      ER33318   LABEL="CORE INDIVIDUAL LONGITUDINAL WEIGHT   96"         format=f7.3
      ER33319   LABEL="MONTH S/O FAM FORMED                  96"         format=f2.
      ER33320   LABEL="YEAR S/O FAM FORMED                   96"         format=f4.
      ER33321   LABEL="MAIN FAM ID FOR S/O                   96"         format=f5.
      ER33322   LABEL="FOLLOW STATUS                         96"         format=f1.
      ER33323   LABEL="WHY FOLLOWABLE                        96"         format=f2.
      ER33324   LABEL="TYPE OF IND RECORD                    96"         format=f2.
      ER33325   LABEL="WHY NONRESPONSE                       96"         format=f2.
      ER33326   LABEL="H1 HEALTH STATUS                      96"         format=f1.
      ER33327   LABEL="H6A BATHING                           96"         format=f1.
      ER33328   LABEL="H6B DRESSING                          96"         format=f1.
      ER33329   LABEL="H6C EATING                            96"         format=f1.
      ER33330   LABEL="H6D GET OUT OF BED/CHAIR              96"         format=f1.
      ER33331   LABEL="H6E WALKING                           96"         format=f1.
      ER33332   LABEL="H6F GET OUTSIDE                       96"         format=f1.
      ER33333   LABEL="H6G USE/GET TO TOILET                 96"         format=f1.
      ER33334   LABEL="H7 CKPT                               96"         format=f1.
      ER33335   LABEL="H8 GET HELP W ACTIVITIES              96"         format=f1.
      ER33336   LABEL="H9 PROB PREPARE MEALS                 96"         format=f1.
      ER33337   LABEL="H10 B/C OF HEALTH?                    96"         format=f1.
      ER33338   LABEL="H11 PROB SHOP PERS ITEM               96"         format=f1.
      ER33339   LABEL="H12 B/C OF HEALTH?                    96"         format=f1.
      ER33340   LABEL="H13 PROB MANAGE MONEY                 96"         format=f1.
      ER33341   LABEL="H14 B/C OF HEALTH?                    96"         format=f1.
      ER33342   LABEL="H15 PROB USE PHONE                    96"         format=f1.
      ER33343   LABEL="H16 B/C OF HEALTH?                    96"         format=f1.
      ER33344   LABEL="H17 PROB HEAVY HOUSEWORK              96"         format=f1.
      ER33345   LABEL="H18 B/C OF HEALTH?                    96"         format=f1.
      ER33346   LABEL="H19 PROB LIGHT HOUSEWORK              96"         format=f1.
      ER33347   LABEL="H20 B/C OF HEALTH?                    96"         format=f1.
 %END;	
 %IF &I = 1997 %THEN %DO; 
      ER33401   LABEL="1997 INTERVIEW NUMBER"                            format=f5.
      ER33402   LABEL="SEQUENCE NUMBER                       97"         format=f2.
      ER33403   LABEL="RELATION TO HEAD                      97"         format=f2.
      ER33404   LABEL="AGE OF INDIVIDUAL                     97"         format=f3.
      ER33405   LABEL="MONTH INDIVIDUAL BORN                 97"         format=f2.
      ER33406   LABEL="YEAR INDIVIDUAL BORN                  97"         format=f4.
      ER33407   LABEL="MARITAL PAIRS INDICATOR               97"         format=f1.
      ER33408   LABEL="WHETHER MOVED IN/OUT                  97"         format=f1.
      ER33409   LABEL="MONTH MOVED IN/OUT                    97"         format=f2.
      ER33410   LABEL="YEAR MOVED IN/OUT                     97"         format=f4.
      ER33411   LABEL="EMPLOYMENT STATUS                     97"         format=f1.
      ER33412   LABEL="MONTH LAST IN SCHOOL                  97"         format=f2.
      ER33413   LABEL="YEAR LAST IN SCHOOL                   97"         format=f4.
      ER33414   LABEL="WHETHER STUDENT                       97"         format=f1.
      ER33415   LABEL="YEARS COMPLETED EDUCATION             97"         format=f2.
      ER33416   LABEL="HAS MEDICAL COVERAGE?                 97"         format=f1.
      ER33417   LABEL="HEALTH GOOD?                          97"         format=f1.
      ER33418   LABEL="WHETHER ELIGIBLE FOR CDS              97"         format=f1.
      ER33419   LABEL="WHETHER SELECTED FOR CDS              97"         format=f1.
      ER33420   LABEL="RESULT OF CDS INTERVIEW               97"         format=f2.
      ER33421   LABEL="ES1 STATE WHERE BORN                  97"         format=f2.
      ER33422   LABEL="ES1 COUNTY/COUNTRY WHERE BORN         97"         format=f3.
      ER33423   LABEL="ES2 WHETHER LIVED IN US IN 1968       97"         format=f1.
      ER33424   LABEL="ES3 WTR US CITIZEN OUT OF US IN 68    97"         format=f1.
      ER33425   LABEL="ES4 WHETHER MOM LIVED IN US IN 1968   97"         format=f1.
      ER33426   LABEL="ES5 WTR MOM US CITIZEN OUT OF US IN 6897"         format=f1.
      ER33427   LABEL="ES6 WHETHER DAD LIVED IN US IN 1968   97"         format=f1.
      ER33428   LABEL="ES7 WTR DAD US CITIZEN OUT OF US IN 6897"         format=f1.
      ER33429   LABEL="ES8 WTR IN US SINCE JAN 1, 1995       97"         format=f1.
      ER33430   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   97"         format=f7.3
      ER33431   LABEL="MONTH S/O FAM FORMED                  97"         format=f2.
      ER33432   LABEL="YEAR S/O FAM FORMED                   97"         format=f4.
      ER33433   LABEL="MAIN FAM ID FOR S/O                   97"         format=f5.
      ER33434   LABEL="FOLLOW STATUS                         97"         format=f1.
      ER33435   LABEL="WHY FOLLOWABLE                        97"         format=f2.
      ER33436   LABEL="TYPE OF IND RECORD                    97"         format=f2.
      ER33437   LABEL="WHY NONRESPONSE                       97"         format=f2.
      ER33438   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT  97"         format=f6.
 %END;	
 %IF &I = 1999 %THEN %DO; 
      ER33501   LABEL="1999 INTERVIEW NUMBER"                            format=f5.
      ER33502   LABEL="SEQUENCE NUMBER                       99"         format=f2.
      ER33503   LABEL="RELATION TO HEAD                      99"         format=f2.
      ER33504   LABEL="AGE OF INDIVIDUAL                     99"         format=f3.
      ER33505   LABEL="MONTH INDIVIDUAL BORN                 99"         format=f2.
      ER33506   LABEL="YEAR INDIVIDUAL BORN                  99"         format=f4.
      ER33507   LABEL="MARITAL PAIRS INDICATOR               99"         format=f1.
      ER33508   LABEL="WHETHER MOVED IN/OUT                  99"         format=f1.
      ER33509   LABEL="MONTH MOVED IN/OUT                    99"         format=f2.
      ER33510   LABEL="YEAR MOVED IN/OUT                     99"         format=f4.
      ER33511   LABEL="RESPONDENT?                           99"         format=f1.
      ER33512   LABEL="EMPLOYMENT STATUS                     99"         format=f1.
      ER33513   LABEL="MONTH LAST IN SCHOOL                  99"         format=f2.
      ER33514   LABEL="YEAR LAST IN SCHOOL                   99"         format=f4.
      ER33515   LABEL="WHETHER STUDENT                       99"         format=f1.
      ER33516   LABEL="YEARS COMPLETED EDUCATION             99"         format=f2.
      ER33517   LABEL="HEALTH GOOD?                          99"         format=f1.
      ER33518   LABEL="H61 TYPE HEALTH INSURANCE MENTION 1   99"         format=f2.
      ER33519   LABEL="H61 TYPE HEALTH INSURANCE MENTION 2   99"         format=f2.
      ER33520   LABEL="H61 TYPE HEALTH INSURANCE MENTION 3   99"         format=f2.
      ER33521   LABEL="H61 TYPE HEALTH INSURANCE MENTION 4   99"         format=f2.
      ER33522   LABEL="H62 MOS COVERED BY INSURANCE IN 97    99"         format=f2.
      ER33523   LABEL="H62A MOS COVERED BY INSURANCE IN 98   99"         format=f2.
      ER33524   LABEL="KL33A/ES1 STATE WHERE BORN            99"         format=f2.
      ER33525   LABEL="KL33A/ES1 COUNTY/COUNTRY WHERE BORN   99"         format=f3.
      ER33526   LABEL="KL33E/ES2/ES10 WTR LIVED IN US IN 68  99"         format=f1.
      ER33527   LABEL="KL33F/ES3/ES11 CITZN OUT OF US IN 68  99"         format=f1.
      ER33528   LABEL="ES4/ES12 WTR MOM LIVED IN US IN 1968  99"         format=f1.
      ER33529   LABEL="ES5/ES13 MOM CITIZEN OUT OF US IN 68  99"         format=f1.
      ER33530   LABEL="ES6/ES14 WTR DAD LIVED IN US IN 1968  99"         format=f1.
      ER33531   LABEL="ES7/ES15 DAD CITIZEN OUT OF US IN 68  99"         format=f1.
      ER33532   LABEL="KL33G/ES8/ES16 WTR IN US SINCE 1/1/97 99"         format=f1.
      ER33533   LABEL="R8 WTR RECEIVED SSI IN 1997           99"         format=f1.
      ER33534   LABEL="R12 WTR RECEIVED CHILD SUPPORT IN 97  99"         format=f1.
      ER33535   LABEL="R16 WTR RECEIVED HELP FROM RELS IN 97 99"         format=f1.
      ER33536   LABEL="R20 WTR RECEIVED OTHER HELP IN 1997   99"         format=f1.
      ER33537   LABEL="R48A WTR STOPPED WELFARE IN 1997      99"         format=f1.
      ER33538   LABEL="R58A WTR STOPPED FOOD STAMPS IN 1997  99"         format=f1.
      ER33539   LABEL="MONTH S/O FAM FORMED                  99"         format=f2.
      ER33540   LABEL="YEAR S/O FAM FORMED                   99"         format=f4.
      ER33541   LABEL="MAIN FAM ID FOR S/O                   99"         format=f5.
      ER33542   LABEL="FOLLOW STATUS                         99"         format=f1.
      ER33543   LABEL="WHY FOLLOWABLE                        99"         format=f2.
      ER33544   LABEL="TYPE OF IND RECORD                    99"         format=f2.
      ER33545   LABEL="WHY NONRESPONSE                       99"         format=f2.
      ER33546   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   99"         format=f7.3
      ER33547   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT 99"          format=f5.
 %END;	
 %IF &I = 2001 %THEN %DO; 
      ER33601   LABEL="2001 INTERVIEW NUMBER"                            format=f4.
      ER33602   LABEL="SEQUENCE NUMBER                       01"         format=f2.
      ER33603   LABEL="RELATION TO HEAD                      01"         format=f2.
      ER33604   LABEL="AGE OF INDIVIDUAL                     01"         format=f3.
      ER33605   LABEL="MONTH INDIVIDUAL BORN                 01"         format=f2.
      ER33606   LABEL="YEAR INDIVIDUAL BORN                  01"         format=f4.
      ER33607   LABEL="MARITAL PAIRS INDICATOR               01"         format=f1.
      ER33608   LABEL="WHETHER MOVED IN/OUT                  01"         format=f1.
      ER33609   LABEL="MONTH MOVED IN/OUT                    01"         format=f2.
      ER33610   LABEL="YEAR MOVED IN/OUT                     01"         format=f4.
      ER33611   LABEL="RESPONDENT?                           01"         format=f1.
      ER33612   LABEL="EMPLOYMENT STATUS                     01"         format=f1.
      ER33613   LABEL="MONTH LAST IN SCHOOL                  01"         format=f2.
      ER33614   LABEL="YEAR LAST IN SCHOOL                   01"         format=f4.
      ER33615   LABEL="WHETHER STUDENT                       01"         format=f1.
      ER33616   LABEL="YEARS COMPLETED EDUCATION             01"         format=f2.
      ER33617   LABEL="HEALTH GOOD?                          01"         format=f1.
      ER33618   LABEL="H61 TYPE HEALTH INSURANCE MENTION 1   01"         format=f2.
      ER33619   LABEL="H61 TYPE HEALTH INSURANCE MENTION 2   01"         format=f2.
      ER33620   LABEL="H61 TYPE HEALTH INSURANCE MENTION 3   01"         format=f2.
      ER33621   LABEL="H61 TYPE HEALTH INSURANCE MENTION 4   01"         format=f2.
      ER33622   LABEL="H62 MOS COVERED BY INSURANCE IN 99    01"         format=f2.
      ER33623   LABEL="H62A MOS COVERED BY INSURANCE IN 00   01"         format=f2.
      ER33624   LABEL="R8 WTR RECEIVED SSI IN 1999           01"         format=f1.
      ER33625   LABEL="R12 WTR RECEIVED CHILD SUPPORT IN 99  01"         format=f1.
      ER33626   LABEL="R16 WTR RECEIVED HELP FROM RELS IN 99 01"         format=f1.
      ER33627   LABEL="R20 WTR RECEIVED OTHER HELP IN 1999   01"         format=f1.
      ER33628   LABEL="R48A WTR STOPPED WELFARE IN 1999      01"         format=f1.
      ER33629   LABEL="R58A WTR STOPPED FOOD STAMPS IN 1999  01"         format=f1.
      ER33630   LABEL="MONTH S/O FAM FORMED                  01"         format=f2.
      ER33631   LABEL="YEAR S/O FAM FORMED                   01"         format=f4.
      ER33632   LABEL="MAIN FAM ID FOR S/O                   01"         format=f5.
      ER33633   LABEL="FOLLOW STATUS                         01"         format=f1.
      ER33634   LABEL="WHY FOLLOWABLE                        01"         format=f2.
      ER33635   LABEL="TYPE OF IND RECORD                    01"         format=f2.
      ER33636   LABEL="WHY NONRESPONSE                       01"         format=f2.
      ER33637   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   01"         format=f7.3
      ER33638   LABEL="RESULT OF CDS INTERVIEW               01"         format=f2.
      ER33639   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT  01"         format=f5.
 %END;	
 %IF &I = 2003 %THEN %DO; 
      ER33701   LABEL="2003 INTERVIEW NUMBER"                            format=f5.
      ER33702   LABEL="SEQUENCE NUMBER                       03"         format=f2.
      ER33703   LABEL="RELATION TO HEAD                      03"         format=f2.
      ER33704   LABEL="AGE OF INDIVIDUAL                     03"         format=f3.
      ER33705   LABEL="MONTH INDIVIDUAL BORN                 03"         format=f2.
      ER33706   LABEL="YEAR INDIVIDUAL BORN                  03"         format=f4.
      ER33707   LABEL="MARITAL PAIRS INDICATOR               03"         format=f1.
      ER33708   LABEL="WHETHER MOVED IN/OUT                  03"         format=f1.
      ER33709   LABEL="MONTH MOVED IN/OUT                    03"         format=f2.
      ER33710   LABEL="YEAR MOVED IN/OUT                     03"         format=f4.
      ER33711   LABEL="RESPONDENT?                           03"         format=f1.
      ER33712   LABEL="EMPLOYMENT STATUS                     03"         format=f1.
      ER33713   LABEL="MONTH LAST IN SCHOOL                  03"         format=f2.
      ER33714   LABEL="YEAR LAST IN SCHOOL                   03"         format=f4.
      ER33715   LABEL="WHETHER STUDENT                       03"         format=f1.
      ER33716   LABEL="YEARS COMPLETED EDUCATION             03"         format=f2.
      ER33717   LABEL="HEALTH GOOD?                          03"         format=f1.
      ER33718   LABEL="H61 TYPE HEALTH INSURANCE MENTION 1   03"         format=f2.
      ER33719   LABEL="H61 TYPE HEALTH INSURANCE MENTION 2   03"         format=f2.
      ER33720   LABEL="H61 TYPE HEALTH INSURANCE MENTION 3   03"         format=f2.
      ER33721   LABEL="H61 TYPE HEALTH INSURANCE MENTION 4   03"         format=f2.
      ER33722   LABEL="H62 MOS COVERED BY INSURANCE IN 01    03"         format=f2.
      ER33723   LABEL="H62A MOS COVERED BY INSURANCE IN 02   03"         format=f2.
      ER33724   LABEL="R2 WTR RECEIVED TANF IN 2001          03"         format=f1.
      ER33725   LABEL="R12 WTR RECEIVED CHILD SUPPORT IN 01  03"         format=f1.
      ER33726   LABEL="R16 WTR RECEIVED HELP FROM RELS IN 01 03"         format=f1.
      ER33727   LABEL="R20 WTR RECEIVED OTHER HELP IN 2001   03"         format=f1.
      ER33728   LABEL="R48A WTR STOPPED WELFARE IN 2001      03"         format=f1.
      ER33729   LABEL="R58A WTR STOPPED FOOD STAMPS IN 2001  03"         format=f1.
      ER33730   LABEL="R78A WTR REC MEAL FOR ELDERLY IN 2002 03"         format=f1.
      ER33731   LABEL="R80A WTR REC SCHOOL LUNCH IN 2002     03"         format=f1.
      ER33732   LABEL="R81A WTR REC SCHOOL BREAKFAST IN 2002 03"         format=f1.
      ER33733   LABEL="MONTH S/O FAM FORMED                  03"         format=f2.
      ER33734   LABEL="YEAR S/O FAM FORMED                   03"         format=f4.
      ER33735   LABEL="MAIN FAM ID FOR S/O                   03"         format=f5.
      ER33736   LABEL="FOLLOW STATUS                         03"         format=f1.
      ER33737   LABEL="WHY FOLLOWABLE                        03"         format=f2.
      ER33738   LABEL="TYPE OF IND RECORD                    03"         format=f2.
      ER33739   LABEL="WHY NONRESPONSE                       03"         format=f2.
      ER33740   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   03"         format=f7.3
      ER33741   LABEL="M13D WTR DECIDER FOR CHARITABLE GIVNG 03"         format=f1.
      ER33742   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT  03"         format=f5.
 %END;	
 %IF &I = 2005 %THEN %DO; 
      ER33801   LABEL="2005 INTERVIEW NUMBER"                            format=f5.
      ER33802   LABEL="SEQUENCE NUMBER                       05"         format=f2.
      ER33803   LABEL="RELATION TO HEAD                      05"         format=f2.
      ER33804   LABEL="AGE OF INDIVIDUAL                     05"         format=f3.
      ER33805   LABEL="MONTH INDIVIDUAL BORN                 05"         format=f2.
      ER33806   LABEL="YEAR INDIVIDUAL BORN                  05"         format=f4.
      ER33807   LABEL="MARITAL PAIRS INDICATOR               05"         format=f1.
      ER33808   LABEL="WHETHER MOVED IN/OUT                  05"         format=f1.
      ER33809   LABEL="MONTH MOVED IN/OUT                    05"         format=f2.
      ER33810   LABEL="YEAR MOVED IN/OUT                     05"         format=f4.
      ER33811   LABEL="RESPONDENT?                           05"         format=f1.
      ER33812   LABEL="WTR COVERED BY TANF PAYMENTS IN 2004  05"         format=f1.
      ER33813   LABEL="EMPLOYMENT STATUS                     05"         format=f1.
      ER33814   LABEL="MONTH LAST IN SCHOOL                  05"         format=f2.
      ER33815   LABEL="YEAR LAST IN SCHOOL                   05"         format=f4.
      ER33816   LABEL="WHETHER STUDENT                       05"         format=f1.
      ER33817   LABEL="YEARS COMPLETED EDUCATION             05"         format=f2.
      ER33818   LABEL="HEALTH GOOD?                          05"         format=f1.
      ER33819   LABEL="H61 TYPE HEALTH INSURANCE MENTION 1   05"         format=f2.
      ER33820   LABEL="H61 TYPE HEALTH INSURANCE MENTION 2   05"         format=f2.
      ER33821   LABEL="H61 TYPE HEALTH INSURANCE MENTION 3   05"         format=f2.
      ER33822   LABEL="H61 TYPE HEALTH INSURANCE MENTION 4   05"         format=f2.
      ER33823   LABEL="H61A WTR STATE INSURNCE PLAN FOR KIDS 05"         format=f1.
      ER33824   LABEL="H61B MOS COVERED BY INSURANCE IN 03   05"         format=f2.
      ER33825   LABEL="H61C MOS COVERED BY INSURANCE IN 04   05"         format=f2.
      ER33826   LABEL="WHETHER MEDICARE NUMBER GIVEN         05"         format=f1.
      ER33827   LABEL="R17 WTR RECEIVED ASSET INCOME IN 03   05"         format=f1.
      ER33828   LABEL="R21 WTR RECEIVED SOCL SECURITY IN 03  05"         format=f1.
      ER33829   LABEL="R26 WTR RECEIVED NON-VA PENSION IN 03 05"         format=f1.
      ER33830   LABEL="R30 WTR RECEIVED VA PENSION IN 2003   05"         format=f1.
      ER33831   LABEL="R34 WTR RECEIVED UNEMP COMP IN 2003   05"         format=f1.
      ER33832   LABEL="R38 WTR RECEIVED WORKERS COMP IN 2003 05"         format=f1.
      ER33833   LABEL="R42 WTR RECEIVED TANF/GA IN 2003      05"         format=f1.
      ER33834   LABEL="R48 WTR RECEIVED SSI IN 2003          05"         format=f1.
      ER33835   LABEL="R52 WTR RECEIVED OTHER WELFARE IN 03  05"         format=f1.
      ER33836   LABEL="R56 WTR RECEIVED CHILD SUPPORT IN 03  05"         format=f1.
      ER33837   LABEL="R60 WTR RECD HELP FRM RELS/OTRS IN 03 05"         format=f1.
      ER33838   LABEL="M13D WTR DECIDER FOR CHARITABLE GIVNG 05"         format=f1.
      ER33839   LABEL="MONTH S/O FAM FORMED                  05"         format=f2.
      ER33840   LABEL="YEAR S/O FAM FORMED                   05"         format=f4.
      ER33841   LABEL="MAIN FAM ID FOR S/O                   05"         format=f5.
      ER33842   LABEL="FOLLOW STATUS                         05"         format=f1.
      ER33843   LABEL="WHY FOLLOWABLE                        05"         format=f2.
      ER33844   LABEL="WTR ELGBLE FOR CDS TRANSITN TO ADULT  05"         format=f1.
      ER33845   LABEL="RESULT OF CDS TRANS-ADULT IW ATTEMPT  05"         format=f2.
      ER33846   LABEL="TYPE OF IND RECORD                    05"         format=f2.
      ER33847   LABEL="WHY NONRESPONSE                       05"         format=f2.
      ER33848   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   05"         format=f7.3
      ER33849   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT  05"         format=f5.
 %END;	
 %IF &I = 2007 %THEN %DO; 
      ER33901   LABEL="2007 INTERVIEW NUMBER"                            format=f5.
      ER33902   LABEL="SEQUENCE NUMBER                       07"         format=f2.
      ER33903   LABEL="RELATION TO HEAD                      07"         format=f2.
      ER33904   LABEL="AGE OF INDIVIDUAL                     07"         format=f3.
      ER33905   LABEL="MONTH INDIVIDUAL BORN                 07"         format=f2.
      ER33906   LABEL="YEAR INDIVIDUAL BORN                  07"         format=f4.
      ER33907   LABEL="MARITAL PAIRS INDICATOR               07"         format=f1.
      ER33908   LABEL="WHETHER MOVED IN/OUT                  07"         format=f1.
      ER33909   LABEL="MONTH MOVED IN/OUT                    07"         format=f2.
      ER33910   LABEL="YEAR MOVED IN/OUT                     07"         format=f4.
      ER33911   LABEL="RESPONDENT?                           07"         format=f1.
      ER33912   LABEL="WTR COVERED BY TANF PAYMENTS IN 2006  07"         format=f1.
      ER33913   LABEL="EMPLOYMENT STATUS                     07"         format=f1.
      ER33914   LABEL="MONTH LAST IN SCHOOL                  07"         format=f2.
      ER33915   LABEL="YEAR LAST IN SCHOOL                   07"         format=f4.
      ER33916   LABEL="WHETHER STUDENT                       07"         format=f1.
      ER33917   LABEL="YEARS COMPLETED EDUCATION             07"         format=f2.
      ER33918   LABEL="HEALTH GOOD?                          07"         format=f1.
      ER33919   LABEL="H61 TYPE HEALTH INSURANCE MENTION 1   07"         format=f2.
      ER33920   LABEL="H61 TYPE HEALTH INSURANCE MENTION 2   07"         format=f2.
      ER33921   LABEL="H61 TYPE HEALTH INSURANCE MENTION 3   07"         format=f2.
      ER33922   LABEL="H61 TYPE HEALTH INSURANCE MENTION 4   07"         format=f2.
      ER33923   LABEL="H61A WTR STATE INSURNCE PLAN FOR KIDS 07"         format=f1.
      ER33924   LABEL="H61B MOS COVERED BY INSURANCE IN 05   07"         format=f2.
      ER33925   LABEL="H61C MOS COVERED BY INSURANCE IN 06   07"         format=f2.
      ER33926   LABEL="WHETHER MEDICARE NUMBER GIVEN         07"         format=f1.
      ER33927   LABEL="R17 WTR RECEIVED ASSET INCOME IN 05   07"         format=f1.
      ER33928   LABEL="R21 WTR RECEIVED SOCL SECURITY IN 05  07"         format=f1.
      ER33929   LABEL="R26 WTR RECEIVED NON-VA PENSION IN 05 07"         format=f1.
      ER33930   LABEL="R30 WTR RECEIVED VA PENSION IN 2005   07"         format=f1.
      ER33931   LABEL="R34 WTR RECEIVED UNEMP COMP IN 2005   07"         format=f1.
      ER33932   LABEL="R38 WTR RECEIVED WORKERS COMP IN 2005 07"         format=f1.
      ER33933   LABEL="R42 WTR RECEIVED TANF/GA IN 2005      07"         format=f1.
      ER33934   LABEL="R48 WTR RECEIVED SSI IN 2005          07"         format=f1.
      ER33935   LABEL="R52 WTR RECEIVED OTHER WELFARE IN 05  07"         format=f1.
      ER33936   LABEL="R56 WTR RECEIVED CHILD SUPPORT IN 05  07"         format=f1.
      ER33937   LABEL="R60 WTR RECD HELP FRM RELS/OTRS IN 05 07"         format=f1.
      ER33938   LABEL="R64 WTR RECD AMT ANYTHING ELSE IN 05  07"         format=f1.
      ER33939   LABEL="MONTH S/O FAM FORMED                  07"         format=f2.
      ER33940   LABEL="YEAR S/O FAM FORMED                   07"         format=f4.
      ER33941   LABEL="MAIN FAM ID FOR S/O                   07"         format=f5.
      ER33942   LABEL="FOLLOW STATUS                         07"         format=f1.
      ER33943   LABEL="WHY FOLLOWABLE                        07"         format=f2.
      ER33944   LABEL="WTR ELGBLE FOR CDS/TA                 07"         format=f1.
      ER33945   LABEL="RESULT OF CDS/TA IW ATTEMPT           07"         format=f2.
      ER33946   LABEL="WTR INCLUDED IN ATTRITOR PRJCT 2007   07"         format=f1.
      ER33947   LABEL="ATTRITOR PROJECT SOURCE IN 2007       07"         format=f1.
      ER33948   LABEL="TYPE OF IND RECORD                    07"         format=f2.
      ER33949   LABEL="WHY NONRESPONSE                       07"         format=f2.
      ER33950   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   07"         format=f7.3
      ER33951   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT  07"         format=f5.
 %END;	
 %IF &I = 2009 %THEN %DO; 
      ER34001   LABEL="2009 INTERVIEW NUMBER"                            format=f5.
      ER34002   LABEL="SEQUENCE NUMBER                       09"         format=f2.
      ER34003   LABEL="RELATION TO HEAD                      09"         format=f2.
      ER34004   LABEL="AGE OF INDIVIDUAL                     09"         format=f3.
      ER34005   LABEL="MONTH INDIVIDUAL BORN                 09"         format=f2.
      ER34006   LABEL="YEAR INDIVIDUAL BORN                  09"         format=f4.
      ER34007   LABEL="MARITAL PAIRS INDICATOR               09"         format=f1.
      ER34008   LABEL="WHETHER MOVED IN/OUT                  09"         format=f1.
      ER34009   LABEL="MONTH MOVED IN/OUT                    09"         format=f2.
      ER34010   LABEL="YEAR MOVED IN/OUT                     09"         format=f4.
      ER34011   LABEL="RESPONDENT?                           09"         format=f1.
      ER34012   LABEL="SN 1ST PERSON WHO HELPED WITH IW      09"         format=f2.
      ER34013   LABEL="SN 2ND PERSON WHO HELPED WITH IW      09"         format=f2.
      ER34014   LABEL="SN 3RD PERSON WHO HELPED WITH IW      09"         format=f2.
      ER34015   LABEL="WTR COVERED BY TANF PAYMENTS IN 2008  09"         format=f1.
      ER34016   LABEL="EMPLOYMENT STATUS                     09"         format=f1.
      ER34017   LABEL="MONTH LAST IN SCHOOL                  09"         format=f2.
      ER34018   LABEL="YEAR LAST IN SCHOOL                   09"         format=f4.
      ER34019   LABEL="WHETHER STUDENT                       09"         format=f1.
      ER34020   LABEL="YEARS COMPLETED EDUCATION             09"         format=f2.
      ER34021   LABEL="HEALTH GOOD?                          09"         format=f1.
      ER34022   LABEL="H61 TYPE HEALTH INSURANCE MENTION 1   09"         format=f2.
      ER34023   LABEL="H61 TYPE HEALTH INSURANCE MENTION 2   09"         format=f2.
      ER34024   LABEL="H61 TYPE HEALTH INSURANCE MENTION 3   09"         format=f2.
      ER34025   LABEL="H61 TYPE HEALTH INSURANCE MENTION 4   09"         format=f2.
      ER34026   LABEL="H61A WTR STATE INSURNCE PLAN FOR KIDS 09"         format=f1.
      ER34027   LABEL="H61B MOS COVERED BY INSURANCE IN 07   09"         format=f2.
      ER34028   LABEL="H61C MOS COVERED BY INSURANCE IN 08   09"         format=f2.
      ER34029   LABEL="WHETHER MEDICARE NUMBER GIVEN         09"         format=f1.
      ER34030   LABEL="G33 TYPE SOC SEC RCD                  09"         format=f1.
      ER34031   LABEL="G34 AMT SOC SEC RCD                   09"         format=f5.
      ER34032   LABEL="G34 ACC SOC SEC AMT                   09"         format=f1.
      ER34033   LABEL="MONTH S/O FAM FORMED                  09"         format=f2.
      ER34034   LABEL="YEAR S/O FAM FORMED                   09"         format=f4.
      ER34035   LABEL="MAIN FAM ID FOR S/O                   09"         format=f5.
      ER34036   LABEL="FOLLOW STATUS                         09"         format=f1.
      ER34037   LABEL="WHY FOLLOWABLE                        09"         format=f2.
      ER34038   LABEL="WTR ELGBLE FOR CDS/TA                 09"         format=f1.
      ER34039   LABEL="RESULT OF CDS/TA IW ATTEMPT           09"         format=f2.
      ER34040   LABEL="WTR ELIGIBLE FOR DUST                 09"         format=f1.
      ER34041   LABEL="WTR SELECTED FOR DUST                 09"         format=f1.
      ER34042   LABEL="RESULT OF DUST IW                     09"         format=f2.
      ER34043   LABEL="TYPE OF IND RECORD                    09"         format=f2.
      ER34044   LABEL="WHY NONRESPONSE                       09"         format=f2.
      ER34045   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   09"         format=f7.3
      ER34046   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT  09"         format=f5.
 %END;	
 %IF &I = 2011 %THEN %DO; 
      ER34101   LABEL="2011 INTERVIEW NUMBER"                            format=f5.
      ER34102   LABEL="SEQUENCE NUMBER                       11"         format=f2.
      ER34103   LABEL="RELATION TO HEAD                      11"         format=f2.
      ER34104   LABEL="AGE OF INDIVIDUAL                     11"         format=f3.
      ER34105   LABEL="MONTH INDIVIDUAL BORN                 11"         format=f2.
      ER34106   LABEL="YEAR INDIVIDUAL BORN                  11"         format=f4.
      ER34107   LABEL="MARITAL PAIRS INDICATOR               11"         format=f1.
      ER34108   LABEL="WHETHER MOVED IN/OUT                  11"         format=f1.
      ER34109   LABEL="MONTH MOVED IN/OUT                    11"         format=f2.
      ER34110   LABEL="YEAR MOVED IN/OUT                     11"         format=f4.
      ER34111   LABEL="RESPONDENT?                           11"         format=f1.
      ER34112   LABEL="SN 1ST PERSON WHO HELPED WITH IW      11"         format=f2.
      ER34113   LABEL="SN 2ND PERSON WHO HELPED WITH IW      11"         format=f2.
      ER34114   LABEL="SN 3RD PERSON WHO HELPED WITH IW      11"         format=f2.
      ER34115   LABEL="WTR COVERED BY TANF PAYMENTS IN 2010  11"         format=f1.
      ER34116   LABEL="EMPLOYMENT STATUS                     11"         format=f1.
      ER34117   LABEL="MONTH LAST IN SCHOOL                  11"         format=f2.
      ER34118   LABEL="YEAR LAST IN SCHOOL                   11"         format=f4.
      ER34119   LABEL="YEARS COMPLETED EDUCATION             11"         format=f2.
      ER34120   LABEL="HEALTH GOOD?                          11"         format=f1.
      ER34121   LABEL="H61 TYPE HEALTH INSURANCE MENTION 1   11"         format=f2.
      ER34122   LABEL="H61 TYPE HEALTH INSURANCE MENTION 2   11"         format=f2.
      ER34123   LABEL="H61 TYPE HEALTH INSURANCE MENTION 3   11"         format=f2.
      ER34124   LABEL="H61 TYPE HEALTH INSURANCE MENTION 4   11"         format=f2.
      ER34125   LABEL="H61A WTR STATE INSURNCE PLAN FOR KIDS 11"         format=f1.
      ER34126   LABEL="H61B MOS COVERED BY INSURANCE IN 09   11"         format=f2.
      ER34127   LABEL="H61C MOS COVERED BY INSURANCE IN 10   11"         format=f2.
      ER34128   LABEL="H61D WTR COVERED BY INSURANCE NOW     11"         format=f1.
      ER34129   LABEL="H61E TYPE CURRENT HEALTH INS MEN 1    11"         format=f2.
      ER34130   LABEL="H61E TYPE CURRENT HEALTH INS MEN 2    11"         format=f2.
      ER34131   LABEL="H61E TYPE CURRENT HEALTH INS MEN 3    11"         format=f2.
      ER34132   LABEL="H61F SN 1ST PERSON EMP PROVIDES INS   11"         format=f2.
      ER34133   LABEL="H61F SN 2ND PERSON EMP PROVIDES INS   11"         format=f2.
      ER34134   LABEL="H61G SN 1ST PERSON POLICY HOLDER      11"         format=f2.
      ER34135   LABEL="H61G SN 2ND PERSON POLICY HOLDER      11"         format=f2.
      ER34136   LABEL="WHETHER MEDICARE NUMBER GIVEN         11"         format=f1.
      ER34137   LABEL="G33A WTR SOC SEC TYPE DISABILITY      11"         format=f1.
      ER34138   LABEL="G33A WTR SOC SEC TYPE RETIREMENT      11"         format=f1.
      ER34139   LABEL="G33A WTR SOC SEC TYPE SURVIVOR        11"         format=f1.
      ER34140   LABEL="G33A WTR SOC SEC TYPE DEP OF DISABLED 11"         format=f1.
      ER34141   LABEL="G33A WTR SOC SEC TYPE DEP OF RETIRED  11"         format=f1.
      ER34142   LABEL="G33A WTR SOC SEC TYPE OTHER           11"         format=f1.
      ER34143   LABEL="G34 AMT SOC SEC RCD                   11"         format=f5.
      ER34144   LABEL="G34 ACC SOC SEC AMT                   11"         format=f1.
      ER34145   LABEL="MONTH S/O FAM FORMED                  11"         format=f2.
      ER34146   LABEL="YEAR S/O FAM FORMED                   11"         format=f4.
      ER34147   LABEL="MAIN FAM ID FOR S/O                   11"         format=f5.
      ER34148   LABEL="FOLLOW STATUS                         11"         format=f1.
      ER34149   LABEL="WHY FOLLOWABLE                        11"         format=f2.
      ER34150   LABEL="WTR ELGBLE FOR CDS/TA                 11"         format=f1.
      ER34151   LABEL="RESULT OF CDS/TA IW ATTEMPT           11"         format=f2.
      ER34152   LABEL="TYPE OF IND RECORD                    11"         format=f2.
      ER34153   LABEL="WHY NONRESPONSE                       11"         format=f2.
      ER34154   LABEL="CORE/IMM INDIVIDUAL LONGITUDINAL WT   11"         format=f7.3
      ER34155   LABEL="CORE/IMM INDIVIDUAL CROSS-SECTION WT  11"         format=f5.
 %END;	
   ;
   INFILE 'U:\1Projects\PSID\WAVE37\SOURCEFILES\IND2011ER\IND2011ER.txt' LRECL = 3345 ; 
   INPUT 
 %IF &I = 1968 %THEN %DO; 
	  ER30000         1 - 1         
 %END;
	  ER30001         2 - 5         ER30002         6 - 8 
 %IF &I = 1968 %THEN %DO; 
      ER30003         9 - 9         ER30004        10 - 12        ER30005        13 - 13   
      ER30006        14 - 14        ER30007        15 - 16        ER30008        17 - 20   
      ER30009        21 - 21        ER30010        22 - 23        ER30011        24 - 24   
      ER30012        25 - 28        ER30013        29 - 32        ER30014        33 - 33   
      ER30015        34 - 34        ER30016        35 - 35        ER30017        36 - 37   
      ER30018        38 - 39        ER30019        40 - 43        
 %END;
 %IF &I = 1969 %THEN %DO; 
	  ER30020        44 - 47   
      ER30021        48 - 49        ER30022        50 - 50        ER30023        51 - 53   
      ER30024        54 - 54        ER30025        55 - 55        ER30026        56 - 57   
      ER30027        58 - 61        ER30028        62 - 62        ER30029        63 - 64   
      ER30030        65 - 65        ER30031        66 - 66        ER30032        67 - 67   
      ER30033        68 - 72        ER30034        73 - 76        ER30035        77 - 77   
      ER30036        78 - 78        ER30037        79 - 80        ER30038        81 - 84   
      ER30039        85 - 88        ER30040        89 - 90        ER30041        91 - 92   
      ER30042        93 - 96        
 %END;
 %IF &I = 1970 %THEN %DO; 
	  ER30043        97 - 100       ER30044       101 - 102  
      ER30045       103 - 103       ER30046       104 - 106       ER30047       107 - 107  
      ER30048       108 - 108       ER30049       109 - 110       ER30050       111 - 114  
      ER30051       115 - 115       ER30052       116 - 117       ER30053       118 - 119  
      ER30054       120 - 120       ER30055       121 - 121       ER30056       122 - 122  
      ER30057       123 - 127       ER30058       128 - 131       ER30059       132 - 132  
      ER30060       133 - 133       ER30061       134 - 135       ER30062       136 - 139  
      ER30063       140 - 143       ER30064       144 - 145       ER30065       146 - 147  
      ER30066       148 - 151       
 %END;
 %IF &I = 1971 %THEN %DO; 
	  ER30067       152 - 155       ER30068       156 - 157  
      ER30069       158 - 158       ER30070       159 - 161       ER30071       162 - 162  
      ER30072       163 - 163       ER30073       164 - 165       ER30074       166 - 169  
      ER30075       170 - 170       ER30076       171 - 172       ER30077       173 - 174  
      ER30078       175 - 175       ER30079       176 - 176       ER30080       177 - 177  
      ER30081       178 - 182       ER30082       183 - 186       ER30083       187 - 187  
      ER30084       188 - 188       ER30085       189 - 190       ER30086       191 - 194  
      ER30087       195 - 198       ER30088       199 - 200       ER30089       201 - 202  
      ER30090       203 - 206       
 %END;
 %IF &I = 1972 %THEN %DO; 
	  ER30091       207 - 210       ER30092       211 - 212  
      ER30093       213 - 213       ER30094       214 - 216       ER30095       217 - 217  
      ER30096       218 - 218       ER30097       219 - 220       ER30098       221 - 224  
      ER30099       225 - 225       ER30100       226 - 227       ER30101       228 - 228  
      ER30102       229 - 230       ER30103       231 - 231       ER30104       232 - 232  
      ER30105       233 - 233       ER30106       234 - 238       ER30107       239 - 242  
      ER30108       243 - 243       ER30109       244 - 244       ER30110       245 - 246  
      ER30111       247 - 248       ER30112       249 - 252       ER30113       253 - 256  
      ER30114       257 - 258       ER30115       259 - 260       ER30116       261 - 264
 %END;
 %IF &I = 1973 %THEN %DO; 
      ER30117       265 - 268       ER30118       269 - 270       ER30119       271 - 271  
      ER30120       272 - 274       ER30121       275 - 275       ER30122       276 - 276  
      ER30123       277 - 278       ER30124       279 - 282       ER30125       283 - 283  
      ER30126       284 - 285       ER30127       286 - 287       ER30128       288 - 288  
      ER30129       289 - 289       ER30130       290 - 294       ER30131       295 - 298  
      ER30132       299 - 300       ER30133       301 - 304       ER30134       305 - 308  
      ER30135       309 - 310       ER30136       311 - 312       ER30137       313 - 316  
 %END;
 %IF &I = 1974 %THEN %DO; 
	  ER30138       317 - 320 	    ER30139       321 - 322       ER30140       323 - 323  
      ER30141       324 - 326       ER30142       327 - 327       ER30143       328 - 328  
      ER30144       329 - 330       ER30145       331 - 334       ER30146       335 - 335  
      ER30147       336 - 337       ER30148       338 - 339       ER30149       340 - 340  
      ER30150       341 - 341       ER30151       342 - 342       ER30152       343 - 347  
      ER30153       348 - 351       ER30154       352 - 353       ER30155       354 - 357  
      ER30156       358 - 361       ER30157       362 - 363       ER30158       364 - 365  
      ER30159       366 - 369       
 %END;
 %IF &I = 1975 %THEN %DO; 
	  ER30160       370 - 373       ER30161       374 - 375  
      ER30162       376 - 376       ER30163       377 - 379       ER30164       380 - 380  
      ER30165       381 - 381       ER30166       382 - 383       ER30167       384 - 387  
      ER30168       388 - 388       ER30169       389 - 390       ER30170       391 - 391  
      ER30171       392 - 392       ER30172       393 - 393       ER30173       394 - 398  
      ER30174       399 - 399       ER30175       400 - 404       ER30176       405 - 405  
      ER30177       406 - 409       ER30178       410 - 410       ER30179       411 - 414  
      ER30180       415 - 415       ER30181       416 - 417       ER30182       418 - 419  
      ER30183       420 - 423       ER30184       424 - 427       ER30185       428 - 429  
      ER30186       430 - 431       ER30187       432 - 435       
 %END;
 %IF &I = 1976 %THEN %DO; 
	  ER30188       436 - 439  
      ER30189       440 - 441       ER30190       442 - 442       ER30191       443 - 445  
      ER30192       446 - 446       ER30193       447 - 447       ER30194       448 - 449  
      ER30195       450 - 453       ER30196       454 - 454       ER30197       455 - 456  
      ER30198       457 - 458       ER30199       459 - 459       ER30200       460 - 460  
      ER30201       461 - 461       ER30202       462 - 466       ER30203       467 - 467  
      ER30204       468 - 471       ER30205       472 - 472       ER30206       473 - 476  
      ER30207       477 - 477       ER30208       478 - 478       ER30209       479 - 483  
      ER30210       484 - 484       ER30211       485 - 486       ER30212       487 - 490  
      ER30213       491 - 494       ER30214       495 - 496       ER30215       497 - 498  
      ER30216       499 - 502       
 %END;
 %IF &I = 1977 %THEN %DO; 
	  ER30217       503 - 506       ER30218       507 - 508  
      ER30219       509 - 509       ER30220       510 - 512       ER30221       513 - 513  
      ER30222       514 - 514       ER30223       515 - 516       ER30224       517 - 520  
      ER30225       521 - 521       ER30226       522 - 523       ER30227       524 - 525  
      ER30228       526 - 526       ER30229       527 - 527       ER30230       528 - 528  
      ER30231       529 - 533       ER30232       534 - 534       ER30233       535 - 538  
      ER30234       539 - 539       ER30235       540 - 543       ER30236       544 - 544  
      ER30237       545 - 546       ER30238       547 - 551       ER30239       552 - 552  
      ER30240       553 - 554       ER30241       555 - 558       ER30242       559 - 562  
      ER30243       563 - 564       ER30244       565 - 566       ER30245       567 - 570  
 %END;
 %IF &I = 1978 %THEN %DO; 
      ER30246       571 - 574       ER30247       575 - 576       ER30248       577 - 577  
      ER30249       578 - 580       ER30250       581 - 581       ER30251       582 - 582  
      ER30252       583 - 584       ER30253       585 - 588       ER30254       589 - 589  
      ER30255       590 - 591       ER30256       592 - 593       ER30257       594 - 594  
      ER30258       595 - 595       ER30259       596 - 596       ER30260       597 - 597  
      ER30261       598 - 599       ER30262       600 - 600       ER30263       601 - 601  
      ER30264       602 - 602       ER30265       603 - 603       ER30266       604 - 604  
      ER30267       605 - 605       ER30268       606 - 610       ER30269       611 - 611  
      ER30270       612 - 615       ER30271       616 - 616       ER30272       617 - 620  
      ER30273       621 - 621       ER30274       622 - 623       ER30275       624 - 628  
      ER30276       629 - 629       ER30277       630 - 631       ER30278       632 - 635  
      ER30279       636 - 639       ER30280       640 - 641       ER30281       642 - 643  
      ER30282       644 - 647       
 %END;
 %IF &I = 1979 %THEN %DO; 
	  ER30283       648 - 651       ER30284       652 - 653  
      ER30285       654 - 654       ER30286       655 - 657       ER30287       658 - 658  
      ER30288       659 - 659       ER30289       660 - 661       ER30290       662 - 665  
      ER30291       666 - 667       ER30292       668 - 668       ER30293       669 - 669  
      ER30294       670 - 670       ER30295       671 - 672       ER30296       673 - 674  
      ER30297       675 - 675       ER30298       676 - 680       ER30299       681 - 681  
      ER30300       682 - 685       ER30301       686 - 686       ER30302       687 - 690  
      ER30303       691 - 691       ER30304       692 - 693       ER30305       694 - 698  
      ER30306       699 - 699       ER30307       700 - 701       ER30308       702 - 705  
      ER30309       706 - 709       ER30310       710 - 711       ER30311       712 - 713  
      ER30312       714 - 717       
 %END;
 %IF &I = 1980 %THEN %DO; 
	  ER30313       718 - 721       ER30314       722 - 723  
      ER30315       724 - 724       ER30316       725 - 727       ER30317       728 - 728  
      ER30318       729 - 729       ER30319       730 - 731       ER30320       732 - 735  
      ER30321       736 - 737       ER30322       738 - 738       ER30323       739 - 739  
      ER30324       740 - 740       ER30325       741 - 742       ER30326       743 - 744  
      ER30327       745 - 745       ER30328       746 - 750       ER30329       751 - 751  
      ER30330       752 - 755       ER30331       756 - 756       ER30332       757 - 760  
      ER30333       761 - 761       ER30334       762 - 763       ER30335       764 - 768  
      ER30336       769 - 769       ER30337       770 - 771       ER30338       772 - 775  
      ER30339       776 - 779       ER30340       780 - 781       ER30341       782 - 783  
      ER30342       784 - 787       
 %END;
 %IF &I = 1981 %THEN %DO; 
	  ER30343       788 - 791       ER30344       792 - 793  
      ER30345       794 - 794       ER30346       795 - 797       ER30347       798 - 798  
      ER30348       799 - 799       ER30349       800 - 801       ER30350       802 - 805  
      ER30351       806 - 807       ER30352       808 - 808       ER30353       809 - 809  
      ER30354       810 - 810       ER30355       811 - 812       ER30356       813 - 814  
      ER30357       815 - 815       ER30358       816 - 820       ER30359       821 - 821  
      ER30360       822 - 825       ER30361       826 - 826       ER30362       827 - 830  
      ER30363       831 - 831       ER30364       832 - 833       ER30365       834 - 838  
      ER30366       839 - 839       ER30367       840 - 841       ER30368       842 - 845  
      ER30369       846 - 849       ER30370       850 - 851       ER30371       852 - 853  
      ER30372       854 - 857       
 %END;
 %IF &I = 1982 %THEN %DO; 
	  ER30373       858 - 861       ER30374       862 - 863  
      ER30375       864 - 864       ER30376       865 - 867       ER30377       868 - 868  
      ER30378       869 - 869       ER30379       870 - 871       ER30380       872 - 875  
      ER30381       876 - 876       ER30382       877 - 877       ER30383       878 - 878  
      ER30384       879 - 880       ER30385       881 - 881       ER30386       882 - 886  
      ER30387       887 - 887       ER30388       888 - 891       ER30389       892 - 892  
      ER30390       893 - 894       ER30391       895 - 899       ER30392       900 - 900  
      ER30393       901 - 902       ER30394       903 - 906       ER30395       907 - 910  
      ER30396       911 - 912       ER30397       913 - 914       ER30398       915 - 918  
 %END;
 %IF &I = 1983 %THEN %DO; 
	  ER30399       919 - 922       ER30400       923 - 924       ER30401       925 - 926  
      ER30402       927 - 929       ER30403       930 - 931       ER30404       932 - 935  
      ER30405       936 - 936       ER30406       937 - 937       ER30407       938 - 939  
      ER30408       940 - 943       ER30409       944 - 945       ER30410       946 - 946  
      ER30411       947 - 947       ER30412       948 - 948       ER30413       949 - 950  
      ER30414       951 - 951       ER30415       952 - 957       ER30416       958 - 958  
      ER30417       959 - 962       ER30418       963 - 963       ER30419       964 - 965  
      ER30420       966 - 970       ER30421       971 - 971       ER30422       972 - 973  
      ER30423       974 - 977       ER30424       978 - 981       ER30425       982 - 983  
      ER30426       984 - 985       ER30427       986 - 987       ER30428       988 - 991  
 %END;
 %IF &I = 1984 %THEN %DO; 
      ER30429       992 - 995       ER30430       996 - 997       ER30431       998 - 999  
      ER30432      1000 - 1002      ER30433      1003 - 1004      ER30434      1005 - 1008 
      ER30435      1009 - 1009      ER30436      1010 - 1010      ER30437      1011 - 1012 
      ER30438      1013 - 1016      ER30439      1017 - 1018      ER30440      1019 - 1019 
      ER30441      1020 - 1020      ER30442      1021 - 1021      ER30443      1022 - 1023 
      ER30444      1024 - 1024      ER30445      1025 - 1030      ER30446      1031 - 1031 
      ER30447      1032 - 1035      ER30448      1036 - 1036      ER30449      1037 - 1038 
      ER30450      1039 - 1039      ER30451      1040 - 1044      ER30452      1045 - 1045 
      ER30453      1046 - 1050      ER30454      1051 - 1051      ER30455      1052 - 1056 
      ER30456      1057 - 1058      ER30457      1059 - 1062      ER30458      1063 - 1066 
      ER30459      1067 - 1068      ER30460      1069 - 1070      ER30461      1071 - 1072 
      ER30462      1073 - 1076      
 %END;
 %IF &I = 1985 %THEN %DO; 
	  ER30463      1077 - 1080      ER30464      1081 - 1082 
      ER30465      1083 - 1084      ER30466      1085 - 1087      ER30467      1088 - 1089 
      ER30468      1090 - 1093      ER30469      1094 - 1094      ER30470      1095 - 1095 
      ER30471      1096 - 1097      ER30472      1098 - 1101      ER30473      1102 - 1103 
      ER30474      1104 - 1104      ER30475      1105 - 1106      ER30476      1107 - 1110 
      ER30477      1111 - 1111      ER30478      1112 - 1113      ER30479      1114 - 1114 
      ER30480      1115 - 1120      ER30481      1121 - 1121      ER30482      1122 - 1125 
      ER30483      1126 - 1126      ER30484      1127 - 1128      ER30485      1129 - 1129 
      ER30486      1130 - 1134      ER30487      1135 - 1135      ER30488      1136 - 1140 
      ER30489      1141 - 1141      ER30490      1142 - 1146      ER30491      1147 - 1148 
      ER30492      1149 - 1152      ER30493      1153 - 1156      ER30494      1157 - 1158 
      ER30495      1159 - 1160      ER30496      1161 - 1162      ER30497      1163 - 1166 
 %END;
 %IF &I = 1986 %THEN %DO; 
      ER30498      1167 - 1170      ER30499      1171 - 1172      ER30500      1173 - 1174 
      ER30501      1175 - 1177      ER30502      1178 - 1179      ER30503      1180 - 1183 
      ER30504      1184 - 1184      ER30505      1185 - 1185      ER30506      1186 - 1187 
      ER30507      1188 - 1191      ER30508      1192 - 1193      ER30509      1194 - 1194 
      ER30510      1195 - 1196      ER30511      1197 - 1200      ER30512      1201 - 1201 
      ER30513      1202 - 1203      ER30514      1204 - 1204      ER30515      1205 - 1210 
      ER30516      1211 - 1211      ER30517      1212 - 1215      ER30518      1216 - 1216 
      ER30519      1217 - 1218      ER30520      1219 - 1219      ER30521      1220 - 1224 
      ER30522      1225 - 1225      ER30523      1226 - 1230      ER30524      1231 - 1231 
      ER30525      1232 - 1236      ER30526      1237 - 1237      ER30527      1238 - 1238 
      ER30528      1239 - 1240      ER30529      1241 - 1244      ER30530      1245 - 1248 
      ER30531      1249 - 1250      ER30532      1251 - 1252      ER30533      1253 - 1254 
      ER30534      1255 - 1258      
 %END;
 %IF &I = 1987 %THEN %DO; 
	  ER30535      1259 - 1262      ER30536      1263 - 1264 
      ER30537      1265 - 1266      ER30538      1267 - 1269      ER30539      1270 - 1271 
      ER30540      1272 - 1275      ER30541      1276 - 1276      ER30542      1277 - 1277 
      ER30543      1278 - 1279      ER30544      1280 - 1283      ER30545      1284 - 1284 
      ER30546      1285 - 1286      ER30547      1287 - 1290      ER30548      1291 - 1291 
      ER30549      1292 - 1293      ER30550      1294 - 1294      ER30551      1295 - 1300 
      ER30552      1301 - 1301      ER30553      1302 - 1305      ER30554      1306 - 1306 
      ER30555      1307 - 1308      ER30556      1309 - 1309      ER30557      1310 - 1314 
      ER30558      1315 - 1315      ER30559      1316 - 1320      ER30560      1321 - 1321 
      ER30561      1322 - 1326      ER30562      1327 - 1327      ER30563      1328 - 1329 
      ER30564      1330 - 1333      ER30565      1334 - 1337      ER30566      1338 - 1339 
      ER30567      1340 - 1341      ER30568      1342 - 1343      ER30569      1344 - 1347 
 %END;
 %IF &I = 1988 %THEN %DO; 
      ER30570      1348 - 1351      ER30571      1352 - 1353      ER30572      1354 - 1355 
      ER30573      1356 - 1358      ER30574      1359 - 1360      ER30575      1361 - 1364 
      ER30576      1365 - 1365      ER30577      1366 - 1366      ER30578      1367 - 1368 
      ER30579      1369 - 1372      ER30580      1373 - 1373      ER30581      1374 - 1375 
      ER30582      1376 - 1379      ER30583      1380 - 1380      ER30584      1381 - 1382 
      ER30585      1383 - 1383      ER30586      1384 - 1389      ER30587      1390 - 1390 
      ER30588      1391 - 1394      ER30589      1395 - 1395      ER30590      1396 - 1397 
      ER30591      1398 - 1398      ER30592      1399 - 1403      ER30593      1404 - 1404 
      ER30594      1405 - 1409      ER30595      1410 - 1410      ER30596      1411 - 1415 
      ER30597      1416 - 1416      ER30598      1417 - 1417      ER30599      1418 - 1419 
      ER30600      1420 - 1423      ER30601      1424 - 1427      ER30602      1428 - 1429 
      ER30603      1430 - 1431      ER30604      1432 - 1433      ER30605      1434 - 1437 
 %END;
 %IF &I = 1989 %THEN %DO; 
      ER30606      1438 - 1441      ER30607      1442 - 1443      ER30608      1444 - 1445 
      ER30609      1446 - 1448      ER30610      1449 - 1450      ER30611      1451 - 1454 
      ER30612      1455 - 1455      ER30613      1456 - 1456      ER30614      1457 - 1458 
      ER30615      1459 - 1462      ER30616      1463 - 1463      ER30617      1464 - 1465 
      ER30618      1466 - 1469      ER30619      1470 - 1470      ER30620      1471 - 1472 
      ER30621      1473 - 1473      ER30622      1474 - 1479      ER30623      1480 - 1480 
      ER30624      1481 - 1484      ER30625      1485 - 1485      ER30626      1486 - 1487 
      ER30627      1488 - 1488      ER30628      1489 - 1493      ER30629      1494 - 1494 
      ER30630      1495 - 1499      ER30631      1500 - 1500      ER30632      1501 - 1505 
      ER30633      1506 - 1506      ER30634      1507 - 1507      ER30635      1508 - 1509 
      ER30636      1510 - 1513      ER30637      1514 - 1517      ER30638      1518 - 1519 
      ER30639      1520 - 1521      ER30640      1522 - 1523      ER30641      1524 - 1527 
 %END;
 %IF &I = 1990 %THEN %DO; 
      ER30642      1528 - 1532      ER30643      1533 - 1534      ER30644      1535 - 1536 
      ER30645      1537 - 1539      ER30646      1540 - 1541      ER30647      1542 - 1545 
      ER30648      1546 - 1546      ER30649      1547 - 1547      ER30650      1548 - 1549 
      ER30651      1550 - 1553      ER30652      1554 - 1554      ER30653      1555 - 1555 
      ER30654      1556 - 1557      ER30655      1558 - 1561      ER30656      1562 - 1562 
      ER30657      1563 - 1564      ER30658      1565 - 1565      ER30659      1566 - 1571 
      ER30660      1572 - 1572      ER30661      1573 - 1576      ER30662      1577 - 1577 
      ER30663      1578 - 1579      ER30664      1580 - 1580      ER30665      1581 - 1585 
      ER30666      1586 - 1586      ER30667      1587 - 1591      ER30668      1592 - 1592 
      ER30669      1593 - 1597      ER30670      1598 - 1598      ER30671      1599 - 1599 
      ER30672      1600 - 1600      ER30673      1601 - 1601      ER30674      1602 - 1605 
      ER30675      1606 - 1606      ER30676      1607 - 1607      ER30677      1608 - 1609 
      ER30678      1610 - 1613      ER30679      1614 - 1618      ER30680      1619 - 1620 
      ER30681      1621 - 1621      ER30682      1622 - 1622      ER30683      1623 - 1623 
      ER30684      1624 - 1625      ER30685      1626 - 1627      ER30686      1628 - 1634 
      ER30687      1635 - 1639      ER30688      1640 - 1646      
 %END;
 %IF &I = 1991 %THEN %DO; 
	  ER30689      1647 - 1650 
      ER30690      1651 - 1652      ER30691      1653 - 1654      ER30692      1655 - 1657 
      ER30693      1658 - 1659      ER30694      1660 - 1663      ER30695      1664 - 1664 
      ER30696      1665 - 1665      ER30697      1666 - 1667      ER30698      1668 - 1671 
      ER30699      1672 - 1672      ER30700      1673 - 1674      ER30701      1675 - 1678 
      ER30702      1679 - 1679      ER30703      1680 - 1681      ER30704      1682 - 1682 
      ER30705      1683 - 1688      ER30706      1689 - 1689      ER30707      1690 - 1695 
      ER30708      1696 - 1696      ER30709      1697 - 1700      ER30710      1701 - 1701 
      ER30711      1702 - 1703      ER30712      1704 - 1704      ER30713      1705 - 1709 
      ER30714      1710 - 1710      ER30715      1711 - 1715      ER30716      1716 - 1716 
      ER30717      1717 - 1721      ER30718      1722 - 1722      ER30719      1723 - 1723 
      ER30720      1724 - 1725      ER30721      1726 - 1729      ER30722      1730 - 1734 
      ER30723      1735 - 1736      ER30724      1737 - 1737      ER30725      1738 - 1738 
      ER30726      1739 - 1739      ER30727      1740 - 1740      ER30728      1741 - 1742 
      ER30729      1743 - 1744      ER30730      1745 - 1751      ER30731      1752 - 1756 
      ER30732      1757 - 1763      
 %END;
 %IF &I = 1992 %THEN %DO; 
	  ER30733      1764 - 1767      ER30734      1768 - 1769 
      ER30735      1770 - 1771      ER30736      1772 - 1774      ER30737      1775 - 1776 
      ER30738      1777 - 1780      ER30739      1781 - 1781      ER30740      1782 - 1782 
      ER30741      1783 - 1784      ER30742      1785 - 1788      ER30743      1789 - 1789 
      ER30744      1790 - 1790      ER30745      1791 - 1792      ER30746      1793 - 1796 
      ER30747      1797 - 1797      ER30748      1798 - 1799      ER30749      1800 - 1800 
      ER30750      1801 - 1806      ER30751      1807 - 1807      ER30752      1808 - 1813 
      ER30753      1814 - 1814      ER30754      1815 - 1818      ER30755      1819 - 1819 
      ER30756      1820 - 1821      ER30757      1822 - 1822      ER30758      1823 - 1827 
      ER30759      1828 - 1828      ER30760      1829 - 1833      ER30761      1834 - 1834 
      ER30762      1835 - 1839      ER30763      1840 - 1840      ER30764      1841 - 1841 
      ER30765      1842 - 1842      ER30766      1843 - 1843      ER30767      1844 - 1847 
      ER30768      1848 - 1848      ER30769      1849 - 1849      ER30770      1850 - 1850 
      ER30771      1851 - 1851      ER30772      1852 - 1852      ER30773      1853 - 1853 
      ER30774      1854 - 1854      ER30775      1855 - 1855      ER30776      1856 - 1856 
      ER30777      1857 - 1857      ER30778      1858 - 1858      ER30779      1859 - 1859 
      ER30780      1860 - 1860      ER30781      1861 - 1861      ER30782      1862 - 1862 
      ER30783      1863 - 1863      ER30784      1864 - 1864      ER30785      1865 - 1865 
      ER30786      1866 - 1866      ER30787      1867 - 1867      ER30788      1868 - 1868 
      ER30789      1869 - 1869      ER30790      1870 - 1870      ER30791      1871 - 1871 
      ER30792      1872 - 1872      ER30793      1873 - 1874      ER30794      1875 - 1875 
      ER30795      1876 - 1877      ER30796      1878 - 1881      ER30797      1882 - 1886 
      ER30798      1887 - 1888      ER30799      1889 - 1889      ER30800      1890 - 1890 
      ER30801      1891 - 1892      ER30802      1893 - 1894      ER30803      1895 - 1901 
      ER30804      1902 - 1906      ER30805      1907 - 1913      
 %END;
 %IF &I = 1993 %THEN %DO; 
	  ER30806      1914 - 1918 
      ER30807      1919 - 1920      ER30808      1921 - 1922      ER30809      1923 - 1925 
      ER30810      1926 - 1927      ER30811      1928 - 1931      ER30812      1932 - 1932 
      ER30813      1933 - 1933      ER30814      1934 - 1935      ER30815      1936 - 1939 
      ER30816      1940 - 1940      ER30817      1941 - 1942      ER30818      1943 - 1946 
      ER30819      1947 - 1947      ER30820      1948 - 1949      ER30821      1950 - 1955 
      ER30822      1956 - 1962      ER30823      1963 - 1966      ER30824      1967 - 1968 
      ER30825      1969 - 1974      ER30826      1975 - 1975      ER30827      1976 - 1976 
      ER30828      1977 - 1977      ER30829      1978 - 1978      ER30830      1979 - 1979 
      ER30831      1980 - 1980      ER30832      1981 - 1981      ER30833      1982 - 1982 
      ER30834      1983 - 1983      ER30835      1984 - 1984      ER30836      1985 - 1985 
      ER30837      1986 - 1986      ER30838      1987 - 1987      ER30839      1988 - 1988 
      ER30840      1989 - 1989      ER30841      1990 - 1990      ER30842      1991 - 1991 
      ER30843      1992 - 1992      ER30844      1993 - 1993      ER30845      1994 - 1994 
      ER30846      1995 - 1995      ER30847      1996 - 1996      ER30848      1997 - 1997 
      ER30849      1998 - 1998      ER30850      1999 - 1999      ER30851      2000 - 2001 
      ER30852      2002 - 2002      ER30853      2003 - 2003      ER30854      2004 - 2004 
      ER30855      2005 - 2005      ER30856      2006 - 2007      ER30857      2008 - 2011 
      ER30858      2012 - 2016      ER30859      2017 - 2017      ER30860      2018 - 2018 
      ER30861      2019 - 2019      ER30862      2020 - 2021      ER30863      2022 - 2023 
      ER30864      2024 - 2030      ER30865      2031 - 2035      ER30866      2036 - 2042 
 %END;
 %IF &I = 1968 %THEN %DO; 
      ER31987      2043 - 2043      ER31988      2044 - 2044      ER31989      2045 - 2045 
      ER31990      2046 - 2047      ER31991      2048 - 2048      ER31992      2049 - 2050 
      ER31993      2051 - 2051      ER31994      2052 - 2052      ER31995      2053 - 2053 
      ER31996      2054 - 2055      ER31997      2056 - 2056      ER32000      2057 - 2057 
      ER32001      2058 - 2058      ER32002      2059 - 2059      ER32003      2060 - 2060 
      ER32004      2061 - 2061      ER32005      2062 - 2062      ER32006      2063 - 2063 
      ER32007      2064 - 2067      ER32008      2068 - 2071      ER32009      2072 - 2075 
      ER32010      2076 - 2078      ER32011      2079 - 2082      ER32012      2083 - 2084 
      ER32013      2085 - 2086      ER32014      2087 - 2089      ER32015      2090 - 2090 
      ER32016      2091 - 2094      ER32017      2095 - 2097      ER32018      2098 - 2101 
      ER32019      2102 - 2103      ER32020      2104 - 2105      ER32021      2106 - 2109 
      ER32022      2110 - 2111      ER32023      2112 - 2113      ER32024      2114 - 2117 
      ER32025      2118 - 2119      ER32026      2120 - 2123      ER32027      2124 - 2125 
      ER32028      2126 - 2129      ER32029      2130 - 2131      ER32030      2132 - 2135 
      ER32031      2136 - 2137      ER32032      2138 - 2141      ER32033      2142 - 2145 
      ER32034      2146 - 2147      ER32035      2148 - 2149      ER32036      2150 - 2153 
      ER32037      2154 - 2154      ER32038      2155 - 2156      ER32039      2157 - 2160 
      ER32040      2161 - 2162      ER32041      2163 - 2166      ER32042      2167 - 2168 
      ER32043      2169 - 2172      ER32044      2173 - 2173      ER32045      2174 - 2175 
      ER32046      2176 - 2179      ER32047      2180 - 2181      ER32048      2182 - 2185 
      ER32049      2186 - 2186      ER32050      2187 - 2190      
 %END;
 %IF &I = 1994 %THEN %DO; 
	  ER33101      2191 - 2195 
      ER33102      2196 - 2197      ER33103      2198 - 2199      ER33104      2200 - 2202 
      ER33105      2203 - 2204      ER33106      2205 - 2208      ER33107      2209 - 2209 
      ER33108      2210 - 2210      ER33109      2211 - 2212      ER33110      2213 - 2216 
      ER33111      2217 - 2217      ER33112      2218 - 2219      ER33113      2220 - 2223 
      ER33114      2224 - 2224      ER33115      2225 - 2226      ER33116      2227 - 2227 
      ER33117      2228 - 2228      ER33118      2229 - 2229      ER33119      2230 - 2236 
      ER33120      2237 - 2242      ER33121      2243 - 2249      ER33122      2250 - 2251 
      ER33123      2252 - 2255      ER33124      2256 - 2260      ER33125      2261 - 2261 
      ER33126      2262 - 2263      ER33127      2264 - 2265      ER33128      2266 - 2266 
      ER33129      2267 - 2267      ER33130      2268 - 2268      ER33131      2269 - 2269 
      ER33132      2270 - 2270      ER33133      2271 - 2271      ER33134      2272 - 2272 
      ER33135      2273 - 2273      ER33136      2274 - 2274      ER33137      2275 - 2275 
      ER33138      2276 - 2276      ER33139      2277 - 2277      ER33140      2278 - 2278 
      ER33141      2279 - 2279      ER33142      2280 - 2280      ER33143      2281 - 2281 
      ER33144      2282 - 2282      ER33145      2283 - 2283      ER33146      2284 - 2284 
      ER33147      2285 - 2285      ER33148      2286 - 2286      ER33149      2287 - 2287 
      ER33150      2288 - 2289      
 %END;
 %IF &I = 1995 %THEN %DO; 
	  ER33201      2290 - 2294      ER33202      2295 - 2296 
      ER33203      2297 - 2298      ER33204      2299 - 2301      ER33205      2302 - 2303 
      ER33206      2304 - 2307      ER33207      2308 - 2308      ER33208      2309 - 2309 
      ER33209      2310 - 2311      ER33210      2312 - 2315      ER33211      2316 - 2316 
      ER33212      2317 - 2318      ER33213      2319 - 2322      ER33214      2323 - 2323 
      ER33215      2324 - 2325      ER33216      2326 - 2326      ER33217      2327 - 2327 
      ER33218      2328 - 2328      ER33219      2329 - 2331      ER33220      2332 - 2332 
      ER33221      2333 - 2333      ER33222      2334 - 2335      ER33223      2336 - 2336 
      ER33224      2337 - 2338      ER33225      2339 - 2342      ER33226      2343 - 2343 
      ER33227      2344 - 2345      ER33228      2346 - 2346      ER33229      2347 - 2347 
      ER33230      2348 - 2348      ER33231      2349 - 2349      ER33232      2350 - 2351 
      ER33233      2352 - 2353      ER33234      2354 - 2355      ER33235      2356 - 2357 
      ER33236      2358 - 2359      ER33237      2360 - 2361      ER33238      2362 - 2363 
      ER33239      2364 - 2365      ER33240      2366 - 2367      ER33241      2368 - 2369 
      ER33242      2370 - 2371      ER33243      2372 - 2373      ER33244      2374 - 2374 
      ER33245      2375 - 2375      ER33246      2376 - 2376      ER33247      2377 - 2378 
      ER33248      2379 - 2380      ER33249      2381 - 2382      ER33250      2383 - 2384 
      ER33251      2385 - 2386      ER33252      2387 - 2388      ER33253      2389 - 2390 
      ER33254      2391 - 2392      ER33255      2393 - 2394      ER33256      2395 - 2396 
      ER33257      2397 - 2398      ER33258      2399 - 2400      ER33259      2401 - 2401 
      ER33260      2402 - 2402      ER33261      2403 - 2403      ER33262      2404 - 2404 
      ER33263      2405 - 2405      ER33264      2406 - 2406      ER33265      2407 - 2407 
      ER33266      2408 - 2408      ER33267      2409 - 2409      ER33268      2410 - 2411 
      ER33269      2412 - 2413      ER33270      2414 - 2415      ER33271      2416 - 2419 
      ER33272      2420 - 2420      ER33273      2421 - 2421      ER33274      2422 - 2422 
      ER33275      2423 - 2429      ER33276      2430 - 2435      ER33277      2436 - 2442 
      ER33278      2443 - 2444      ER33279      2445 - 2448      ER33280      2449 - 2453 
      ER33281      2454 - 2454      ER33282      2455 - 2456      ER33283      2457 - 2458 
      ER33284      2459 - 2459      ER33285      2460 - 2460      ER33286      2461 - 2461 
      ER33287      2462 - 2462      ER33288      2463 - 2463      ER33289      2464 - 2464 
      ER33290      2465 - 2465      ER33291      2466 - 2466      ER33292      2467 - 2467 
      ER33293      2468 - 2468      ER33294      2469 - 2469      ER33294A     2470 - 2470 
      ER33295      2471 - 2471      ER33295A     2472 - 2472      ER33296      2473 - 2473 
      ER33296A     2474 - 2474      ER33297      2475 - 2475      ER33297A     2476 - 2476 
      ER33298      2477 - 2477      ER33298A     2478 - 2478      ER33299      2479 - 2479 
      ER33299A     2480 - 2480      ER33299B     2481 - 2482      
 %END;
 %IF &I = 1996 %THEN %DO; 
	  ER33301      2483 - 2486 
      ER33302      2487 - 2488      ER33303      2489 - 2490      ER33304      2491 - 2493 
      ER33305      2494 - 2495      ER33306      2496 - 2499      ER33307      2500 - 2500 
      ER33308      2501 - 2501      ER33309      2502 - 2503      ER33310      2504 - 2507 
      ER33311      2508 - 2508      ER33312      2509 - 2510      ER33313      2511 - 2514 
      ER33314      2515 - 2515      ER33315      2516 - 2517      ER33316      2518 - 2518 
      ER33317      2519 - 2519      ER33318      2520 - 2526      ER33319      2527 - 2528 
      ER33320      2529 - 2532      ER33321      2533 - 2537      ER33322      2538 - 2538 
      ER33323      2539 - 2540      ER33324      2541 - 2542      ER33325      2543 - 2544 
      ER33326      2545 - 2545      ER33327      2546 - 2546      ER33328      2547 - 2547 
      ER33329      2548 - 2548      ER33330      2549 - 2549      ER33331      2550 - 2550 
      ER33332      2551 - 2551      ER33333      2552 - 2552      ER33334      2553 - 2553 
      ER33335      2554 - 2554      ER33336      2555 - 2555      ER33337      2556 - 2556 
      ER33338      2557 - 2557      ER33339      2558 - 2558      ER33340      2559 - 2559 
      ER33341      2560 - 2560      ER33342      2561 - 2561      ER33343      2562 - 2562 
      ER33344      2563 - 2563      ER33345      2564 - 2564      ER33346      2565 - 2565 
      ER33347      2566 - 2566      
 %END;
 %IF &I = 1997 %THEN %DO; 
	  ER33401      2567 - 2571      ER33402      2572 - 2573 
      ER33403      2574 - 2575      ER33404      2576 - 2578      ER33405      2579 - 2580 
      ER33406      2581 - 2584      ER33407      2585 - 2585      ER33408      2586 - 2586 
      ER33409      2587 - 2588      ER33410      2589 - 2592      ER33411      2593 - 2593 
      ER33412      2594 - 2595      ER33413      2596 - 2599      ER33414      2600 - 2600 
      ER33415      2601 - 2602      ER33416      2603 - 2603      ER33417      2604 - 2604 
      ER33418      2605 - 2605      ER33419      2606 - 2606      ER33420      2607 - 2608 
      ER33421      2609 - 2610      ER33422      2611 - 2613      ER33423      2614 - 2614 
      ER33424      2615 - 2615      ER33425      2616 - 2616      ER33426      2617 - 2617 
      ER33427      2618 - 2618      ER33428      2619 - 2619      ER33429      2620 - 2620 
      ER33430      2621 - 2627      ER33431      2628 - 2629      ER33432      2630 - 2633 
      ER33433      2634 - 2638      ER33434      2639 - 2639      ER33435      2640 - 2641 
      ER33436      2642 - 2643      ER33437      2644 - 2645      ER33438      2646 - 2651 
 %END;
 %IF &I = 1999 %THEN %DO; 
      ER33501      2652 - 2656      ER33502      2657 - 2658      ER33503      2659 - 2660 
      ER33504      2661 - 2663      ER33505      2664 - 2665      ER33506      2666 - 2669 
      ER33507      2670 - 2670      ER33508      2671 - 2671      ER33509      2672 - 2673 
      ER33510      2674 - 2677      ER33511      2678 - 2678      ER33512      2679 - 2679 
      ER33513      2680 - 2681      ER33514      2682 - 2685      ER33515      2686 - 2686 
      ER33516      2687 - 2688      ER33517      2689 - 2689      ER33518      2690 - 2691 
      ER33519      2692 - 2693      ER33520      2694 - 2695      ER33521      2696 - 2697 
      ER33522      2698 - 2699      ER33523      2700 - 2701      ER33524      2702 - 2703 
      ER33525      2704 - 2706      ER33526      2707 - 2707      ER33527      2708 - 2708 
      ER33528      2709 - 2709      ER33529      2710 - 2710      ER33530      2711 - 2711 
      ER33531      2712 - 2712      ER33532      2713 - 2713      ER33533      2714 - 2714 
      ER33534      2715 - 2715      ER33535      2716 - 2716      ER33536      2717 - 2717 
      ER33537      2718 - 2718      ER33538      2719 - 2719      ER33539      2720 - 2721 
      ER33540      2722 - 2725      ER33541      2726 - 2730      ER33542      2731 - 2731 
      ER33543      2732 - 2733      ER33544      2734 - 2735      ER33545      2736 - 2737 
      ER33546      2738 - 2744      ER33547      2745 - 2749      
 %END;
 %IF &I = 2001 %THEN %DO; 
	  ER33601      2750 - 2753 
      ER33602      2754 - 2755      ER33603      2756 - 2757      ER33604      2758 - 2760 
      ER33605      2761 - 2762      ER33606      2763 - 2766      ER33607      2767 - 2767 
      ER33608      2768 - 2768      ER33609      2769 - 2770      ER33610      2771 - 2774 
      ER33611      2775 - 2775      ER33612      2776 - 2776      ER33613      2777 - 2778 
      ER33614      2779 - 2782      ER33615      2783 - 2783      ER33616      2784 - 2785 
      ER33617      2786 - 2786      ER33618      2787 - 2788      ER33619      2789 - 2790 
      ER33620      2791 - 2792      ER33621      2793 - 2794      ER33622      2795 - 2796 
      ER33623      2797 - 2798      ER33624      2799 - 2799      ER33625      2800 - 2800 
      ER33626      2801 - 2801      ER33627      2802 - 2802      ER33628      2803 - 2803 
      ER33629      2804 - 2804      ER33630      2805 - 2806      ER33631      2807 - 2810 
      ER33632      2811 - 2815      ER33633      2816 - 2816      ER33634      2817 - 2818 
      ER33635      2819 - 2820      ER33636      2821 - 2822      ER33637      2823 - 2829 
      ER33638      2830 - 2831      ER33639      2832 - 2836      
 %END;
 %IF &I = 2003 %THEN %DO; 
	  ER33701      2837 - 2841 
      ER33702      2842 - 2843      ER33703      2844 - 2845      ER33704      2846 - 2848 
      ER33705      2849 - 2850      ER33706      2851 - 2854      ER33707      2855 - 2855 
      ER33708      2856 - 2856      ER33709      2857 - 2858      ER33710      2859 - 2862 
      ER33711      2863 - 2863      ER33712      2864 - 2864      ER33713      2865 - 2866 
      ER33714      2867 - 2870      ER33715      2871 - 2871      ER33716      2872 - 2873 
      ER33717      2874 - 2874      ER33718      2875 - 2876      ER33719      2877 - 2878 
      ER33720      2879 - 2880      ER33721      2881 - 2882      ER33722      2883 - 2884 
      ER33723      2885 - 2886      ER33724      2887 - 2887      ER33725      2888 - 2888 
      ER33726      2889 - 2889      ER33727      2890 - 2890      ER33728      2891 - 2891 
      ER33729      2892 - 2892      ER33730      2893 - 2893      ER33731      2894 - 2894 
      ER33732      2895 - 2895      ER33733      2896 - 2897      ER33734      2898 - 2901 
      ER33735      2902 - 2906      ER33736      2907 - 2907      ER33737      2908 - 2909 
      ER33738      2910 - 2911      ER33739      2912 - 2913      ER33740      2914 - 2920 
      ER33741      2921 - 2921      ER33742      2922 - 2926      
 %END;
 %IF &I = 2005 %THEN %DO; 
	  ER33801      2927 - 2931 
      ER33802      2932 - 2933      ER33803      2934 - 2935      ER33804      2936 - 2938 
      ER33805      2939 - 2940      ER33806      2941 - 2944      ER33807      2945 - 2945 
      ER33808      2946 - 2946      ER33809      2947 - 2948      ER33810      2949 - 2952 
      ER33811      2953 - 2953      ER33812      2954 - 2954      ER33813      2955 - 2955 
      ER33814      2956 - 2957      ER33815      2958 - 2961      ER33816      2962 - 2962 
      ER33817      2963 - 2964      ER33818      2965 - 2965      ER33819      2966 - 2967 
      ER33820      2968 - 2969      ER33821      2970 - 2971      ER33822      2972 - 2973 
      ER33823      2974 - 2974      ER33824      2975 - 2976      ER33825      2977 - 2978 
      ER33826      2979 - 2979      ER33827      2980 - 2980      ER33828      2981 - 2981 
      ER33829      2982 - 2982      ER33830      2983 - 2983      ER33831      2984 - 2984 
      ER33832      2985 - 2985      ER33833      2986 - 2986      ER33834      2987 - 2987 
      ER33835      2988 - 2988      ER33836      2989 - 2989      ER33837      2990 - 2990 
      ER33838      2991 - 2991      ER33839      2992 - 2993      ER33840      2994 - 2997 
      ER33841      2998 - 3002      ER33842      3003 - 3003      ER33843      3004 - 3005 
      ER33844      3006 - 3006      ER33845      3007 - 3008      ER33846      3009 - 3010 
      ER33847      3011 - 3012      ER33848      3013 - 3019      ER33849      3020 - 3024 
 %END;
 %IF &I = 2007 %THEN %DO; 
      ER33901      3025 - 3029      ER33902      3030 - 3031      ER33903      3032 - 3033 
      ER33904      3034 - 3036      ER33905      3037 - 3038      ER33906      3039 - 3042 
      ER33907      3043 - 3043      ER33908      3044 - 3044      ER33909      3045 - 3046 
      ER33910      3047 - 3050      ER33911      3051 - 3051      ER33912      3052 - 3052 
      ER33913      3053 - 3053      ER33914      3054 - 3055      ER33915      3056 - 3059 
      ER33916      3060 - 3060      ER33917      3061 - 3062      ER33918      3063 - 3063 
      ER33919      3064 - 3065      ER33920      3066 - 3067      ER33921      3068 - 3069 
      ER33922      3070 - 3071      ER33923      3072 - 3072      ER33924      3073 - 3074 
      ER33925      3075 - 3076      ER33926      3077 - 3077      ER33927      3078 - 3078 
      ER33928      3079 - 3079      ER33929      3080 - 3080      ER33930      3081 - 3081 
      ER33931      3082 - 3082      ER33932      3083 - 3083      ER33933      3084 - 3084 
      ER33934      3085 - 3085      ER33935      3086 - 3086      ER33936      3087 - 3087 
      ER33937      3088 - 3088      ER33938      3089 - 3089      ER33939      3090 - 3091 
      ER33940      3092 - 3095      ER33941      3096 - 3100      ER33942      3101 - 3101 
      ER33943      3102 - 3103      ER33944      3104 - 3104      ER33945      3105 - 3106 
      ER33946      3107 - 3107      ER33947      3108 - 3108      ER33948      3109 - 3110 
      ER33949      3111 - 3112      ER33950      3113 - 3119      ER33951      3120 - 3124 
 %END;
 %IF &I = 2009 %THEN %DO; 
      ER34001      3125 - 3129      ER34002      3130 - 3131      ER34003      3132 - 3133 
      ER34004      3134 - 3136      ER34005      3137 - 3138      ER34006      3139 - 3142 
      ER34007      3143 - 3143      ER34008      3144 - 3144      ER34009      3145 - 3146 
      ER34010      3147 - 3150      ER34011      3151 - 3151      ER34012      3152 - 3153 
      ER34013      3154 - 3155      ER34014      3156 - 3157      ER34015      3158 - 3158 
      ER34016      3159 - 3159      ER34017      3160 - 3161      ER34018      3162 - 3165 
      ER34019      3166 - 3166      ER34020      3167 - 3168      ER34021      3169 - 3169 
      ER34022      3170 - 3171      ER34023      3172 - 3173      ER34024      3174 - 3175 
      ER34025      3176 - 3177      ER34026      3178 - 3178      ER34027      3179 - 3180 
      ER34028      3181 - 3182      ER34029      3183 - 3183      ER34030      3184 - 3184 
      ER34031      3185 - 3189      ER34032      3190 - 3190      ER34033      3191 - 3192 
      ER34034      3193 - 3196      ER34035      3197 - 3201      ER34036      3202 - 3202 
      ER34037      3203 - 3204      ER34038      3205 - 3205      ER34039      3206 - 3207 
      ER34040      3208 - 3208      ER34041      3209 - 3209      ER34042      3210 - 3211 
      ER34043      3212 - 3213      ER34044      3214 - 3215      ER34045      3216 - 3222 
      ER34046      3223 - 3227      
 %END;
 %IF &I = 2011 %THEN %DO; 
	  ER34101      3228 - 3232      ER34102      3233 - 3234 
      ER34103      3235 - 3236      ER34104      3237 - 3239      ER34105      3240 - 3241 
      ER34106      3242 - 3245      ER34107      3246 - 3246      ER34108      3247 - 3247 
      ER34109      3248 - 3249      ER34110      3250 - 3253      ER34111      3254 - 3254 
      ER34112      3255 - 3256      ER34113      3257 - 3258      ER34114      3259 - 3260 
      ER34115      3261 - 3261      ER34116      3262 - 3262      ER34117      3263 - 3264 
      ER34118      3265 - 3268      ER34119      3269 - 3270      ER34120      3271 - 3271 
      ER34121      3272 - 3273      ER34122      3274 - 3275      ER34123      3276 - 3277 
      ER34124      3278 - 3279      ER34125      3280 - 3280      ER34126      3281 - 3282 
      ER34127      3283 - 3284      ER34128      3285 - 3285      ER34129      3286 - 3287 
      ER34130      3288 - 3289      ER34131      3290 - 3291      ER34132      3292 - 3293 
      ER34133      3294 - 3295      ER34134      3296 - 3297      ER34135      3298 - 3299 
      ER34136      3300 - 3300      ER34137      3301 - 3301      ER34138      3302 - 3302 
      ER34139      3303 - 3303      ER34140      3304 - 3304      ER34141      3305 - 3305 
      ER34142      3306 - 3306      ER34143      3307 - 3311      ER34144      3312 - 3312 
      ER34145      3313 - 3314      ER34146      3315 - 3318      ER34147      3319 - 3323 
      ER34148      3324 - 3324      ER34149      3325 - 3326      ER34150      3327 - 3327 
      ER34151      3328 - 3329      ER34152      3330 - 3331      ER34153      3332 - 3333 
      ER34154      3334 - 3340      ER34155      3341 - 3345 
 %END;
 ;
*remove those indivdiuals that do not belong to a particular wave.  Sequence No. = 0 in the individual file for each wave
   tells users that this individual is not applicable in this family in that wave;
*note that sequence number here starts in 1969.  You cannot use 1968 sequence no. but instead for 1968, 
   use 1968 relationship to head = 0 which also eliminates individuals who do not belong to that wave.  
   For 1968 indiv file,  inapplicable individuals will be removed in the last data step below.;

  %IF &I = 1969 %THEN %DO;
  IF  ER30021 = 0 THEN DELETE;
  %END;	
  %IF &I = 1970 %THEN %DO; 
  IF  ER30044 = 0 THEN DELETE;
  %END;	
  %IF &I = 1971 %THEN %DO; 
  IF  ER30068 = 0 THEN DELETE;
  %END;	
  %IF &I = 1972 %THEN %DO; 
  IF  ER30092 = 0 THEN DELETE;
  %END;	
  %IF &I = 1973 %THEN %DO; 
  IF  ER30118 = 0 THEN DELETE;
  %END;	
  %IF &I = 1974 %THEN %DO;  
  IF  ER30139 = 0 THEN DELETE;
  %END;	
  %IF &I = 1975 %THEN %DO; 
  IF  ER30161 = 0 THEN DELETE;
  %END;	
  %IF &I = 1976 %THEN %DO; 
  IF  ER30189 = 0 THEN DELETE;
  %END;	
  %IF &I = 1977 %THEN %DO; 
  IF  ER30218 = 0 THEN DELETE;
  %END;	
  %IF &I = 1978 %THEN %DO; 
   IF  ER30247 = 0 THEN DELETE;
  %END;	
  %IF &I = 1979 %THEN %DO; 
  IF  ER30284 = 0 THEN DELETE;
  %END;	
  %IF &I = 1980 %THEN %DO; 
  IF  ER30314 = 0 THEN DELETE;
  %END;	
  %IF &I = 1981 %THEN %DO; 
  IF  ER30344 = 0 THEN DELETE;
  %END;	
  %IF &I = 1982 %THEN %DO; 
  IF  ER30374 = 0 THEN DELETE;
  %END;	
  %IF &I = 1983 %THEN %DO;  
  IF  ER30400 = 0 THEN DELETE;
  %END;	
  %IF &I = 1984 %THEN %DO;  
  IF  ER30430 = 0 THEN DELETE;
  %END;	
  %IF &I = 1985 %THEN %DO; 
  IF  ER30464 = 0 THEN DELETE;
  %END;	
  %IF &I = 1986 %THEN %DO;  
  IF  ER30499 = 0 THEN DELETE;
  %END;	
  %IF &I = 1987 %THEN %DO; 
  IF  ER30536 = 0 THEN DELETE;
  %END;	
  %IF &I = 1988 %THEN %DO;  
  IF  ER30571 = 0 THEN DELETE;
  %END;	
  %IF &I = 1989 %THEN %DO; 
  IF  ER30607 = 0 THEN DELETE;
  %END;	
  %IF &I = 1990 %THEN %DO; 
  IF  ER30643 = 0 THEN DELETE;
  %END;	
  %IF &I = 1991 %THEN %DO; 
  IF  ER30690 = 0 THEN DELETE;
  %END;	
  %IF &I = 1992 %THEN %DO; 
  IF  ER30734 = 0 THEN DELETE;
  %END;	
  %IF &I = 1993 %THEN %DO; 
  IF  ER30807 = 0 THEN DELETE;
  %END;	
  %IF &I = 1994 %THEN %DO; 
  IF  ER33102 = 0 THEN DELETE;
  %END;	
  %IF &I = 1995 %THEN %DO; 
  IF  ER33202 = 0 THEN DELETE;
  %END;	
  %IF &I = 1996 %THEN %DO; 
  IF  ER33302 = 0 THEN DELETE;
  %END;	
  %IF &I = 1997 %THEN %DO; 
  IF  ER33402 = 0 THEN DELETE;
  %END;	
  %IF &I = 1999 %THEN %DO; 
  IF  ER33502 = 0 THEN DELETE;
  %END;	
  %IF &I = 2001 %THEN %DO; 
  IF  ER33602 = 0 THEN DELETE;
  %END;	
  %IF &I = 2003 %THEN %DO; 
  IF  ER33702 = 0 THEN DELETE;
  %END;	
  %IF &I = 2005 %THEN %DO; 
  IF  ER33802 = 0 THEN DELETE;
  %END;	
  %IF &I = 2007 %THEN %DO; 
  IF  ER33902 = 0 THEN DELETE;
  %END;	
  %IF &I = 2009 %THEN %DO; 
  IF  ER34002 = 0 THEN DELETE;
  %END;
  %IF &I = 2011 %THEN %DO; 
  IF  ER34102 = 0 THEN DELETE;
  %END;

RUN ;
%END;
%MEND INDIV;
%INDIV;

**CREATE THE 2011 SUMMARY FILE FROM THE IND1968.IND1968ER FILE.  INCLUDE ONLY THE SUMMARY VARIABLES AND ID VARS.  THEN REMOVE THE SUMMARY VARIABLES FROM THE 1968 INDVIDUAL FILE;

DATA IND1968.IND2011SUMMARY (KEEP =
	  ER30000
      ER30001   
      ER30002   
      ER31987   
      ER31988   
      ER31989   
      ER31990   
      ER31991   
      ER31992   
      ER31993   
      ER31994   
      ER31995   
      ER31996   
      ER31997   
      ER32000   
      ER32001   
      ER32002   
      ER32003   
      ER32004   
      ER32005   
      ER32006   
      ER32007   
      ER32008   
      ER32009   
      ER32010   
      ER32011   
      ER32012   
      ER32013   
      ER32014   
      ER32015   
      ER32016   
      ER32017   
      ER32018   
      ER32019   
      ER32020   
      ER32021   
      ER32022   
      ER32023   
      ER32024   
      ER32025   
      ER32026   
      ER32027   
      ER32028   
      ER32029   
      ER32030   
      ER32031   
      ER32032   
      ER32033   
      ER32034   
      ER32035   
      ER32036   
      ER32037   
      ER32038   
      ER32039   
      ER32040   
      ER32041   
      ER32042   
      ER32043   
      ER32044   
      ER32045   
      ER32046   
      ER32047   
      ER32048   
      ER32049   
      ER32050   
 );
 SET IND1968.IND1968ER;
 RUN;

**HERE WE REMOVE THE SUMMARY VARIABLES FROM THE 1968 INDVIDUAL FILE;

 DATA IND1968.IND1968ER (DROP =
 	  ER30000
      ER31987   
      ER31988   
      ER31989   
      ER31990   
      ER31991   
      ER31992   
      ER31993   
      ER31994   
      ER31995   
      ER31996   
      ER31997   
      ER32000   
      ER32001   
      ER32002   
      ER32003   
      ER32004   
      ER32005   
      ER32006   
      ER32007   
      ER32008   
      ER32009   
      ER32010   
      ER32011   
      ER32012   
      ER32013   
      ER32014   
      ER32015   
      ER32016   
      ER32017   
      ER32018   
      ER32019   
      ER32020   
      ER32021   
      ER32022   
      ER32023   
      ER32024   
      ER32025   
      ER32026   
      ER32027   
      ER32028   
      ER32029   
      ER32030   
      ER32031   
      ER32032   
      ER32033   
      ER32034   
      ER32035   
      ER32036   
      ER32037   
      ER32038   
      ER32039   
      ER32040   
      ER32041   
      ER32042   
      ER32043   
      ER32044   
      ER32045   
      ER32046   
      ER32047   
      ER32048   
      ER32049   
      ER32050   
 );
 SET IND1968.IND1968ER;
 IF  ER30003 = 0 THEN DELETE;
 RUN;



 *CHECK NUMBER OF OBS AND VARS PER WAVE OF INDIVIDUAL-LEVEL DATA VIS-A-VIS PSID DATA CENTER;


%MACRO CHECK;

%DO J = 1 %TO 37;
%LET I = %SCAN(&YEAR,&J);


PROC CONTENTS DATA = IND&I..IND&I.ER;
ODS OUTPUT ATTRIBUTES = ATTRIBUTES;
RUN;

DATA X (RENAME= (CVALUE2 = OBSERVATIONS));
SET ATTRIBUTES (KEEP = CVALUE2);
IF _N_ = 1;

DATA Y (RENAME= (CVALUE2 = VARIABLES));
SET ATTRIBUTES (KEEP = CVALUE2);
IF _N_ = 2;

DATA XY ;
LENGTH YEAR 8.;
MERGE X Y;
YEAR = &I;
RUN;

PROC APPEND BASE = INDIV.CHECKINDIV_NUMOBSVARS DATA = XY FORCE;
RUN;
%END;

PROC SORT DATA = INDIV.CHECKINDIV_NUMOBSVARS;
BY DESCENDING YEAR;
RUN;

%MEND CHECK;
%CHECK;

*NOTE:  RESULT OF THE ABOVE CHECK IS SPOT ON WITH PSID DATA CENTER VALUES;
