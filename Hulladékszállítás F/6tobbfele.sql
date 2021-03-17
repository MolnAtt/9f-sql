-- 1.mo: Két argumentumú relációval: R(x,y) jelentse azt, hogy x és y szállítások egyazon napon történtek, x papíros, y műanyagos.

SELECT *
FROM (szolgaltatas AS szolgaltatas_1 INNER JOIN naptar AS naptar_1 ON szolgaltatas_1.id = naptar_1.szolgid) INNER JOIN (szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid) ON naptar_1.datum = naptar.datum
;

SELECT *
FROM (szolgaltatas AS szolgaltatas_1 INNER JOIN naptar AS naptar_1 ON szolgaltatas_1.id = naptar_1.szolgid) INNER JOIN (szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid) ON naptar_1.datum = naptar.datum
WHERE szolgaltatas.tipus="mua" AND szolgaltatas_1.tipus="pa"
;

SELECT naptar.datum
FROM (szolgaltatas AS szolgaltatas_1 INNER JOIN naptar AS naptar_1 ON szolgaltatas_1.id = naptar_1.szolgid) INNER JOIN (szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid) ON naptar_1.datum = naptar.datum
WHERE szolgaltatas.tipus="mua" AND szolgaltatas_1.tipus="pa"
;

-- 2. mo: Metszet: két tábla metszetét vesszük egy harmadikban

SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
;


    -- papiros segédlekérdezés, elég a naptar azonosítójának megjelenítése
    SELECT naptar.datum
    FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
    WHERE tipus = "pa"
    ;

    -- műanyag segédlekérdezés, elég a szolgid megjelenítése
    SELECT naptar.datum
    FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
    WHERE tipus = "mua"
    ;

-- nem kell már inner join, mivel az allekérdezésekbe kellett csak ez.
SELECT *
FROM naptar
WHERE naptar.datum IN (SELECT naptar.datum FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid WHERE tipus = "pa")
  AND naptar.datum IN (SELECT naptar.datum FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid WHERE tipus = "mua")
;

SELECT naptar.datum
FROM naptar
WHERE naptar.datum IN (SELECT naptar.datum FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid WHERE tipus = "pa")
  AND naptar.datum IN (SELECT naptar.datum FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid WHERE tipus = "mua")
;

-- mivel minden duplán szerepelt, mert benne volt papirosan is és benne van muanyagosan is...
SELECT DISTINCT naptar.datum
FROM naptar
WHERE naptar.datum IN (SELECT naptar.datum FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid WHERE tipus = "pa")
  AND naptar.datum IN (SELECT naptar.datum FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid WHERE tipus = "mua")
;


-- 3. mo(??) Csoportosítással, Having Count-tal: Ez tűnik a legegyszerűbbnek, de szerintem ez most nem jó. Lásd lent.

SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
;

SELECT *
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "mua" or tipus = "pa"
;

SELECT naptar.datum, Count(*)
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "mua" or tipus = "pa"
GROUP BY naptar.datum
;

SELECT naptar.datum, Count(*)
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "mua" or tipus = "pa"
GROUP BY naptar.datum
HAVING Count(*)>1
;

SELECT naptar.datum
FROM szolgaltatas INNER JOIN naptar ON szolgaltatas.id = naptar.szolgid
WHERE tipus = "mua" or tipus = "pa"
GROUP BY naptar.datum
HAVING Count(*)>1
;

-- VIGYÁZAT! 
-- Ebben az adatbázisban ez most szintén 25 elemet ad vissza, 
-- de valójában megadhatók lennének úgy is az adatok, 
-- hogy ez ne működjön, mert a válogatás elve rossz!
-- Ha van olyan nap, amikor egyetlen egyszer sem gyűjtik be a műanyagot, 
-- de kétszer is begyűjtik a papírt, akkor be fog kerülni a fenti lekérdezésbe, 
-- holott nem felel meg a feladatnak!
