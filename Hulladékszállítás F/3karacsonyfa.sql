SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
;

SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "zold" AND MONTH(datum) = 1
;

SELECT datum
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "zold" AND MONTH(datum) = 1
;
