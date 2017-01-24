# Rgeo

Utilitaire de géolocalisation à partir d'un code postal.

## Remarques

- Utilisation du [fichier des communes](http://www.nosdonnees.fr/wiki/index.php/Fichier:EUCircos_Regions_departements_circonscriptions_communes_gps.csv.gz) de [NosDonnées.fr](http://www.nosdonnees.fr).
- Pour une géolocalisation plus précise, utiliser des services basés sur l'adresse.

## Utilisation

```r
(sample <- data.frame(
    cp = c("22000", "29000", "35000", "35999", "56000", "56999")
))
```

| cp    |
|-------|
| 22000 |
| 29000 |
| 35000 |
| 35999 |
| 56000 |
| 56999 |

```r
source("Rgeo/Rgeo.R", chdir = T)
sample[, c("lon", "lat")] <- get_coordinates(sample$cp)
sample
```

| cp    | lon       | lat      |
|-------|-----------|----------|
| 22000 | -2.783333 | 48.51667 |
| 29000 | -4.100000 | 48.00000 |
| 35000 | -1.683333 | 48.08333 |
| 35999 | NA        | NA       |
| 56000 | -2.750000 | 47.66667 |
| 56999 | NA        | NA       |

## Utilisation du paramètre strict

Géolocalisation à partir d'un code postal de la forme `<département>000` (exemple : 35999 => 35000).

```r
sample[, c("lon", "lat")] <- get_coordinates(sample$cp, strict = F)
sample
```

| cp    | lon       | lat      |
|-------|-----------|----------|
| 22000 | -2.783333 | 48.51667 |
| 29000 | -4.100000 | 48.00000 |
| 35000 | -1.683333 | 48.08333 |
| 35999 | -1.683333 | 48.08333 |
| 56000 | -2.750000 | 47.66667 |
| 56999 | -2.750000 | 47.66667 |
