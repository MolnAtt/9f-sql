SELECT *
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
;


SELECT nev Count(*)
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY nev
;



SELECT nev, Count(*)
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY nev
HAVING Count(*)>1
;


---- még nincs kész!!!