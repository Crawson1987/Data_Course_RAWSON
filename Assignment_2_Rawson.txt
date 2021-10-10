csv_files <- list.files(path = "Data",pattern = "*.csv",recursive = TRUE, full.names = TRUE)
# This step allowed me to find and name all of the files in DATA_Course that are csv files

length(csv_files)
# This step allowed me use my brain less and instead of counting how many files I can make the computer tell me

df <- read.csv("Data/wingspan_vs_mass.csv")
# This step allowed me to open the right file, read it, and store it s a R object named df

head(df,5)
# This command let me inspect the first 5 lines of this data using the head function

list.files(path = "Data", pattern = "*^b",recursive = TRUE, full.names= TRUE)
# This step let me find all of the files that begain with b in the name that where in the Data directory
