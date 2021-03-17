-- keressük azon küldetéseket, amelyekben férfiak és nők is részt vettek

-- 1. mo: 
-- 1. lépés: keressük ki a "férfias" küldetéseket
-- 2. lépés: keressük ki a "nőies" küldetéseket
-- 3. lépés: keressük ki azokat, amelyek ebben is és abban is benne vannak.

-- férfias küldétesid-k táblája:
SELECT DISTINCT kuldetesid
FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid
WHERE nem="F"
;


-- Nőies küldetésid-k táblája:
SELECT DISTINCT kuldetesid
FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid
WHERE nem="N"
;

SELECT Distinct megnevezes
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
WHERE kuldetesid IN (SELECT DISTINCT kuldetesid FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid WHERE nem="F")
  AND kuldetesid IN (SELECT DISTINCT kuldetesid FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid WHERE nem="N")
;


-- 2. mo: 
-- 1. lépés: keressük ki a "nőies" küldetéseket
-- 2. lépés: keressük ki közülük a "férfiakat" küldetéseket
-- ami marad, az a jó

SELECT DISTINCT megnevezes
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
WHERE nem = "N" 
  AND kuldetesid IN (SELECT DISTINCT kuldetesid FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid WHERE nem="F")
;


-- 3.mo: "Group by" küldetések ÉS neme alapján 
-- ötlet: a küldetéseket a bennük előforduló nemek száma szerint csoportosítjuk
-- ahol 2 jön ki countra, ott 2 nem is képviseltette magát.

-- próbálgatás, próbáljuk áttekinteni az adatokat...
SELECT *
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
ORDER BY megnevezes, nem
;


-- ebben küldetés-nem párok fognak megjelenni, és úgy ismerszik meg a férfinői küldetés, hogy egy küldetés kétszer is szerepelni fog benne!
SELECT DISTINCT megnevezes, nem
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
;

-- ezért az előző táblát felhasználjuk újra, ebben csoportosítunk küldetés alapján

SELECT megnevezes, Count(*)
FROM (SELECT DISTINCT megnevezes, nem FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid)
Group by megnevezes
;

SELECT megnevezes, Count(*)
FROM (SELECT DISTINCT megnevezes, nem FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid)
Group by megnevezes
HAVING Count(*)>1
;

SELECT megnevezes
FROM (SELECT DISTINCT megnevezes, nem FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid)
Group by megnevezes
HAVING Count(*)>1
;

-- 4.mo: háromargumentumú relációt építünk (egy tábla több példányban is szerepel!)

-- 3-argumentumú relációt hozunk létre R(x,y,z) = az x űrhajósnő az y küldetésen együtt volt a z űrhajósférfival

SELECT *
FROM ((urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid) INNER JOIN repules AS repules_1 ON kuldetes.id = repules_1.kuldetesid) INNER JOIN urhajos AS urhajos_1 ON repules_1.urhajosid = urhajos_1.id
WHERE urhajos.nem="N" AND urhajos_1.nem="F";

-- Ebből kiszedjük a megnevezést, hogy mi a küldetés

SELECT Distinct megnevezes
FROM ((urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid) INNER JOIN repules AS repules_1 ON kuldetes.id = repules_1.kuldetesid) INNER JOIN urhajos AS urhajos_1 ON repules_1.urhajosid = urhajos_1.id
WHERE urhajos.nem="N" AND urhajos_1.nem="F";

