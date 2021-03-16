SELECT *
FROM urhajos;

----------------------------

SELECT orszag, Count(*)
FROM urhajos
GROUP BY orszag
;

----------------------------

SELECT orszag, Count(*) as db
FROM urhajos
GROUP BY orszag
ORDER BY Count(*) DESC
;
