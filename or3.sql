SELECT *
FROM kreta
;

---------------------

SELECT *
FROM kreta
WHERE tanar = "Schőn Tímea"
;


---------------------

SELECT hanyadik
FROM kreta
WHERE tanar = "Schőn Tímea"
;



---------------------

SELECT MIN(hanyadik) as min, MAX(hanyadik) as max, AVG(hanyadik) as átlag, stdevp(hanyadik) as szórás 
FROM kreta
WHERE tanar = "Schőn Tímea"
;


---------------------
--- nem folytatás!

SELECT Tanar
FROM kreta
GROUP BY Tanar
;

-- ez most ugyanazt csinálja, mint a 

SELECT DISTINCT Tanar
FROM kreta
;

-----------------------
----- ez a folytatás


SELECT Tanar, MIN(hanyadik) as min, MAX(hanyadik) as max, AVG(hanyadik) as átlag, stdevp(hanyadik) as szórás 
FROM kreta
GROUP BY Tanar
;
