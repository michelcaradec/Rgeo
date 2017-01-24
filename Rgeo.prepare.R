# Fichier des communes contenant les informations de géolocalisation ----
# http://www.nosdonnees.fr/wiki/index.php/Fichier:EUCircos_Regions_departements_circonscriptions_communes_gps.csv.gz
.communes <- read.csv(
  "data/EUCircos_Regions_departements_circonscriptions_communes_gps.csv",
  sep = ";",
  header = T,
  quote = "",
  as.is = T,
  col.names = c(
    "eu.circo",
    "region.code",
    "region.nom",
    "region.chef_lieu",
    "departement.numero",
    "departement.nom",
    "prefecture",
    "circonscription.numero",
    "commune.nom",
    "code_postal",
    "code_insee",
    "latitude",
    "longitude",
    "eloignement"
  ),
  colClasses = c(
    rep("factor", 8),
    rep("character", 3),
    rep("numeric", 3)
  )
)

.codepostal <- .communes[, c("code_postal", "longitude", "latitude")]

save(.codepostal, file = "data/codepostal.RData")

rm(list = ls())
