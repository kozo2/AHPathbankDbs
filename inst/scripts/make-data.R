download.file("https://pathbank.org/downloads/pathbank_all_pathways.csv.zip", "pathbank_all_pathways.csv.zip")
download.file("https://pathbank.org/downloads/pathbank_all_metabolites.csv.zip", "pathbank_all_metabolites.csv.zip")
download.file("https://pathbank.org/downloads/pathbank_all_proteins.csv.zip", "pathbank_all_proteins.csv.zip")
unzip("pathbank_all_pathways.csv.zip")
unzip("pathbank_all_metabolites.csv.zip")
unzip("pathbank_all_proteins.csv.zip")

pathways = read.csv(file = './pathbank_all_pathways.csv')
metabolites = read.csv(file = './pathbank_all_metabolites.csv')
proteins = read.csv(file = './pathbank_all_proteins.csv')

selectMetabolitesBySpecies <- function(species=c(""Homo sapiens", "Escherichia coli", "Mus musculus",
    "Arabidopsis thaliana", "Saccharomyces cerevisiae", "Bos taurus", "Caenorhabditis elegans",
    "Rattus norvegicus", "Drosophila melanogaster", "Pseudomonas aeruginosa")){
    return(metabolites[metabolites$Species == species, ])
}

selectProteinsBySpecies <- function(species=c(""Homo sapiens", "Escherichia coli", "Mus musculus",
    "Arabidopsis thaliana", "Saccharomyces cerevisiae", "Bos taurus", "Caenorhabditis elegans",
    "Rattus norvegicus", "Drosophila melanogaster", "Pseudomonas aeruginosa")){
    return(proteins[proteins$Species == species, ])
}

makePathbankSQLiteFromTables <- function(path=".", species=c(""Homo sapiens", "Escherichia coli", "Mus musculus",
    "Arabidopsis thaliana", "Saccharomyces cerevisiae", "Bos taurus", "Caenorhabditis elegans",
    "Rattus norvegicus", "Drosophila melanogaster", "Pseudomonas aeruginosa"), dbname){
    con <- dbConnect(dbDriver("SQLite"), dbname=dbname)
    message("Processing 'pathways' table ... ", appendLF = FALSE)
    dbWriteTable(con, name="pathways", pathways, row.names=FALSE)
    message("OK")
    message("Processing 'metabolites' table ... ", appendLF = FALSE)
    dbWriteTable(con, name="metabolites", selectMetabolitesBySpecies(species=species), row.names=FALSE)
    message("OK")
    message("Processing 'proteins' table ... ", appendLF = FALSE)
    dbWriteTable(con, name="proteins", selectProteinsBySpecies(species=species), row.names=FALSE)
    message("OK")
}
