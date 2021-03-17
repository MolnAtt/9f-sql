SELECT Count(allekerdezes.orszag)
FROM (SELECT Distinct orszag
FROM urhajos) AS allekerdezes;
