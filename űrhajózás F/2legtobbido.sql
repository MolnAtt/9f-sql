--- Mely táblákra van szükség?

SELECT *
FROM urhajos;


SELECT *
FROM urhajos
WHERE nem = "N"
ORDER BY urido DESC
;

SELECT TOP 1 *
FROM urhajos
WHERE nem = "N"
ORDER BY urido DESC
;


SELECT TOP 1 nev, urido
FROM urhajos
WHERE nem = "N"
ORDER BY urido DESC
;


