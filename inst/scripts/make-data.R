pathbank_species <- c("Homo sapiens", "Escherichia coli", "Mus musculus",
    "Arabidopsis thaliana", "Saccharomyces cerevisiae", "Bos taurus",
    "Caenorhabditis elegans", "Rattus norvegicus",
    "Drosophila melanogaster", "Pseudomonas aeruginosa")

createPathbankMetabolitesDb <- function() {
    tmpdir <- tempdir()
    url <- "https://pathbank.org/downloads/pathbank_all_metabolites.csv.zip"
    file <- basename(url)
    download.file(url, file)
    unzip(file, exdir = tmpdir)
    csv_file = paste(tmpdir, "pathbank_all_metabolites.csv", sep = .Platform$file.sep)
    pathbank_all_metabolites = readr::read_csv(file = csv_file,
        col_types = readr::cols(
            `PathBank ID` = col_character(),
            `Pathway Name` = col_character(),
            `Pathway Subject` = col_character(),
            Species = col_character(),
            `Metabolite ID` = col_character(),
            `Metabolite Name` = col_character(),
            `HMDB ID` = col_character(),
            `KEGG ID` = col_character(),
            `ChEBI ID` = col_character(),
            `DrugBank ID` = col_character(),
            CAS = col_character(),
            Formula = col_character(),
            IUPAC = col_character(),
            SMILES = col_character(),
            InChI = col_character(),
            `InChI Key` = col_character()
        )
    )
    for (species in pathbank_species) {
        filename = paste("pathbank", gsub(" ", "_", species), "metabolites.rda", sep = "_")
        pathbank_metabolites = pathbank_all_metabolites[pathbank_all_metabolites$Species == species, ]
        save(pathbank_metabolites, file = filename, compress = "xz")
    }
}

createPathbankProteinsDb <- function() {
    tmpdir <- tempdir()
    url <- "https://pathbank.org/downloads/pathbank_all_proteins.csv.zip"
    file <- basename(url)
    download.file(url, file)
    unzip(file, exdir = tmpdir)
    csv_file = paste(tmpdir, "pathbank_all_proteins.csv", sep = .Platform$file.sep)
    pathbank_all_proteins = readr::read_csv(file = csv_file,
        col_types = readr::cols(
            `PathBank ID` = col_character(),
            `Pathway Name` = col_character(),
            `Pathway Subject` = col_character(),
            Species = col_character(),
            `Uniprot ID` = col_character(),
            `Protein Name` = col_character(),
            `HMDBP ID` = col_character(),
            `DrugBank ID` = col_character(),
            `GenBank ID` = col_character(),
            `Gene Name` = col_character(),
            Locus = col_character()
        )
    )
    for (species in pathbank_species) {
        filename = paste("pathbank", gsub(" ", "_", species), "proteins.rda", sep = "_")
        pathbank_proteins = pathbank_all_proteins[pathbank_all_proteins$Species == species, ]
        save(pathbank_proteins, file = filename, compress = "xz")       
    }
}
