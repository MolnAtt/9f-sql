SELECT *
FROM mu INNER JOIN (alkoto INNER JOIN kapcsolat ON alkoto.id = kapcsolat.alkotoid) ON mu.id = kapcsolat.muid;


SELECT nev, tipus
FROM mu INNER JOIN (alkoto INNER JOIN kapcsolat ON alkoto.id = kapcsolat.alkotoid) ON mu.id = kapcsolat.muid
WHERE cim="Bob herceg"
;
