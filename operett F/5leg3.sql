SELECT *
FROM alkoto INNER JOIN kapcsolat ON alkoto.id = kapcsolat.alkotoid;

-- de nem baj, ha három táblával dolgoztál! Nem szükséges, de áttekinthetőbb 3-mal dolgozni.

SELECT *
FROM alkoto INNER JOIN kapcsolat ON alkoto.id = kapcsolat.alkotoid
WHERE tipus="zene"
;


SELECT nev, Count(*)
FROM alkoto INNER JOIN kapcsolat ON alkoto.id = kapcsolat.alkotoid
WHERE tipus="zene"
GROUP BY nev 
;

SELECT nev, Count(*)
FROM alkoto INNER JOIN kapcsolat ON alkoto.id = kapcsolat.alkotoid
WHERE tipus="zene"
GROUP BY nev 
ORDER BY Count(*) DESC
;

SELECT TOP 3 nev, Count(*)
FROM alkoto INNER JOIN kapcsolat ON alkoto.id = kapcsolat.alkotoid
WHERE tipus="zene"
GROUP BY nev 
ORDER BY Count(*) DESC
;
