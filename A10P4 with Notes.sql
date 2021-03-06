--A10P4 


--List the names of pilots who have flown the most miles.

SELECT	P.EMP_LNAME, P.EMP_FNAME, F.CHAR_DISTANCE AS MILESFLOWN
FROM	PILOTDIM P INNER JOIN FACT F ON P.PILOTKEY = F.PILOTKEY 
WHERE	F.CHAR_DISTANCE =	(SELECT MAX(CHAR_DISTANCE)
							FROM FACT)

--List the revenue by model and month in ascending order.

SELECT	A.MOD_CODE, T.MONTH, ROUND(SUM(F.CHAR_FUEL_GALLONS * F.MOD_CHG_MILE),2) AS REVENUE 
FROM	AIRCRAFTDIM A INNER JOIN FACT F ON A.AIRCRAFTKEY = F.AIRCRAFTKEY 
		INNER JOIN TIMEDIM T ON F.TIMEKEY = T.TIMEKEY 
GROUP BY A.MOD_CODE, T.MONTH
ORDER BY A.MOD_CODE, T.MONTH