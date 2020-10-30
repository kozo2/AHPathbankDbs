species = c(""Homo sapiens", "Escherichia coli", "Mus musculus",
    "Arabidopsis thaliana", "Saccharomyces cerevisiae", "Bos taurus", "Caenorhabditis elegans",
    "Rattus norvegicus", "Drosophila melanogaster", "Pseudomonas aeruginosa")

meta <- data.frame(
    Title = "Pathbank Db for ",
    Description = paste0("RNA-seq data from study XYZ containing 10 normal ",
			 "and 10 tumor samples represented as a",
			 "SummarizedExperiment"),
    BiocVersion = "3.4",
    Genome = "GRCh38",
    SourceType = "CSV",
    SourceUrl = "http://www.path/to/original/data/file",
    SourceVersion = "Jan 01 2016",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "GEO",
    Maintainer = "Your Name <youremail@provider.com>",
    RDataClass = "SummarizedExperiment",
    DispatchClass = "Rda",
    ResourceName = "FileName.rda"
)

write.csv(meta, file="metadata.csv", row.names=FALSE)
