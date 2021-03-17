SELECT *
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid;


SELECT *
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid
WHERE tipus = "zold"
;

SELECT Count(*)
FROM szolgaltatas INNER JOIN lakig ON szolgaltatas.id = lakig.szolgid
WHERE tipus = "zold"
;
