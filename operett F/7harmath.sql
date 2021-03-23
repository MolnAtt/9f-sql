
SELECT DISTINCT alkoto_1.nev
FROM alkoto INNER JOIN (kapcsolat INNER JOIN (alkoto AS alkoto_1 INNER JOIN kapcsolat AS kapcsolat_1 ON alkoto_1.id = kapcsolat_1.alkotoid) ON kapcsolat.muid = kapcsolat_1.muid) ON alkoto.id = kapcsolat.alkotoid
WHERE alkoto_1.nev<>"Harmath Imre" AND alkoto.nev="Harmath Imre" AND kapcsolat_1.tipus="zene";
