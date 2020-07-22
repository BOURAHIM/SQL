-- Listez les articles dans l’ordre alphabétique des désignations
 
 SELECT * FROM ARTICLE 
 ORDER BY `designation` ASC;
 
 -- Listez les articles dans l’ordre des prix du plus élevé au moins elevé
 
 SELECT * FROM ARTICLE
 ORDER BY `PRIX` DESC;
 
 -- Listez les articles dont le prix est supérieur à 25€
 
 SELECT * FROM ARTICLE 
 WHERE `PRIX` > 25.00;
 
 -- Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant
 
 SELECT * FROM ARTICLE 
 WHERE `DESIGNATION` LIKE 'Boulon%'
 ORDER BY `PRIX` ASC;
 
 -- Listez tous les articles dont la désignation contient le mot « sachet ».
 
  SELECT * FROM ARTICLE 
  WHERE `DESIGNATION` LIKE '%sachet%';
 
 -- Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !
 
 SELECT * FROM ARTICLE 
 WHERE LOWER(`DESIGNATION`) LIKE '%sachet%';
 
 -- Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.

 SELECT * FROM ARTICLE
 INNER JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID
 ORDER BY `PRIX` DESC

-- Listez les articles de la société « Dubois & Fils »

 SELECT * FROM ARTICLE
 INNER JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID
 WHERE FOURNISSEUR.NOM = 'Dubois & Fils'

 -- Calculez la moyenne des prix des articles de la société « Dubois & Fils »
 
 SELECT FOURNISSEUR.NOM, AVG(PRIX) AS Moyenne FROM ARTICLE
 INNER JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID
 WHERE FOURNISSEUR.ID = 3
 GROUP BY FOURNISSEUR.NOM;
 
 -- Calculez la moyenne des prix des articles de chaque fournisseur
 
 SELECT FOURNISSEUR.NOM, AVG(PRIX) AS Moyenne FROM ARTICLE
 INNER JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID
 GROUP BY FOURNISSEUR.NOM;
 
 -- Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
 
 SELECT * FROM BON
 WHERE DATE_CMDE < '2019-04-05 12:00:00' AND DATE_CMDE > '2019-03-01 12:00:00';
 
 -- Sélectionnez les divers bons de commande qui contiennent des boulons
 
 SELECT NUMERO FROM BON
 INNER JOIN COMPO ON COMPO.ID_BON = BON.ID
 INNER JOIN ARTICLE ON ARTICLE.ID = COMPO.ID_ART
 WHERE ARTICLE.DESIGNATION LIKE 'Boulon%';
 
