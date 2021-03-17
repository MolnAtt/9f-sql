SELECT *
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid;

SELECT MONTH(igeny), SUM(mennyiseg)
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid
GROUP BY MONTH(igeny)
;


SELECT MONTH(igeny) as hónap, SUM(mennyiseg) as mennyiség
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid
GROUP BY MONTH(igeny)
;

SELECT MONTH(igeny) as hónap, SUM(mennyiseg) as mennyiség
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid
GROUP BY MONTH(igeny)
ORDER BY SUM(mennyiseg) DESC
;

SELECT TOP 1 MONTH(igeny) as hónap, SUM(mennyiseg) as mennyiség
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid
GROUP BY MONTH(igeny)
ORDER BY SUM(mennyiseg) DESC
;


SELECT TOP 1 MONTH(igeny) as hónap
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid
GROUP BY MONTH(igeny)
ORDER BY SUM(mennyiseg) DESC
;

