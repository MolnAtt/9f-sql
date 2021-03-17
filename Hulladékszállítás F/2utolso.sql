SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid;

SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "kom"
;


------- sorbarakással:

SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "kom"
ORDER BY datum DESC
;

SELECT TOP 1 *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "kom"
ORDER BY datum DESC
;


SELECT TOP 1 datum
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "kom"
ORDER BY datum DESC
;

----- LAST vagy MAX

SELECT MAX(datum)
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "kom"
;

SELECT LAST(datum)
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "kom"
;
