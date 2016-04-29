nei_file <- "../data/summarySCC_PM25.rds"
scc_file <- "../data/Source_Classification_Code.rds"

if (!file.exists(nei_file) || !file.exists(scc_file)) {
    zipfile <- "data.zip"
    download.file("http://j.mp/1uh0obC", zipfile, method = "curl", quiet = TRUE)
    unzip(zipfile, exdir = "../data")
}
# read data to data frames (may take a few minutes)
NEI <- readRDS(nei_file)
SCC <- readRDS(scc_file)
