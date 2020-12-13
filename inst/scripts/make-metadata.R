pathbank_species <- c("Homo sapiens", "Escherichia coli", "Mus musculus",
    "Arabidopsis thaliana", "Saccharomyces cerevisiae", "Bos taurus",
    "Caenorhabditis elegans", "Rattus norvegicus",
    "Drosophila melanogaster", "Pseudomonas aeruginosa")

pathbank_taxonomyids <-c("9606", "562", "10090",
    "3702", "4932", "9913",
    "6239", "10116",
    "7227", "287")

metabolite_titles <- paste("pathbank", gsub(" ", "_", pathbank_species), "metabolites.rda", sep = "_")
protein_titles <- paste("pathbank", gsub(" ", "_", pathbank_species), "proteins.rda", sep = "_")
titles <- c(metabolite_titles, protein_titles)

metabolite_descriptions <- paste('Metabolite names linked to PathBank', pathbank_species, 'pathways (includes KEGG and ChEBI IDs)')
protein_descriptions <- paste('Protein names linked to PathBank', pathbank_species, 'pathways (includes UniProt IDs)')
descriptions <- c(metabolite_descriptions, protein_descriptions)

meta <- data.frame(
    Title = titles,
    Description = descriptions,
    BiocVersion = "3.13",
    Genome = NA,
    SourceType = "CSV",
    SourceUrl = "https://pathbank.org/downloads",
    SourceVersion = "Dec 13 2020",
    Species = c(pathbank_species, pathbank_species),
    TaxonomyId = c(pathbank_taxonomyids, pathbank_taxonomyids),
    Coordinate_1_based = NA,
    DataProvider = "PathBank",
    Maintainer = "Kozo Nishida <kozo.nishida@gmail.com>",
    RDataClass = "Tibble",
    DispatchClass = "Rda",
    RDataPath = paste0('AHPathbankDbs/', titles),
    Tags = "Pathways:metabolites:proteins:HMDB:KEGG:ChEBI:Drugbank:CAS:Uniprot"
)

write.csv(meta, file="metadata.csv", row.names=FALSE)
