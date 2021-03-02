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


------- kerekítünk

SELECT Tanar, MIN(hanyadik) as min, MAX(hanyadik) as max, Round(AVG(hanyadik),2) as átlag, Round(stdevp(hanyadik),2) as szórás 
FROM kreta
GROUP BY Tanar
;


------- sorba rendezünk

SELECT Tanar, MIN(hanyadik) as min, MAX(hanyadik) as max, Round(AVG(hanyadik),2) as átlag, Round(stdevp(hanyadik),2) as szórás 
FROM kreta
GROUP BY Tanar
ORDER BY AVG(hanyadik)
;




----------- csak a nagy szórásúakat szedjük ki!


SELECT Tanar, MIN(hanyadik) as min, MAX(hanyadik) as max, Round(AVG(hanyadik),2) as átlag, Round(stdevp(hanyadik),2) as szórás 
FROM kreta
-- WHERE : csoportosítás előtti szűrés
GROUP BY Tanar
HAVING stdevp(hanyadik)>2
ORDER BY AVG(hanyadik)
;

------ ebben legyen benne minden

SELECT Tanar, MIN(hanyadik) as min, MAX(hanyadik) as max, Round(AVG(hanyadik),2) as átlag, Round(stdevp(hanyadik),2) as szórás 
FROM kreta
WHERE Tantargy ="mt" 
GROUP BY Tanar
HAVING stdevp(hanyadik)>2
ORDER BY AVG(hanyadik)
;
