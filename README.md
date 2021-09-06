# Data_Course_RAWSONThis README file contains information about my uploaded assignments
“microbiology is cool”
“microbiology is cool”
“microbiology is cool”
microbiology is sooo cool
“microbiology is cool”
microbiology is cool
This is the test that let me remove conda from my computer
The first step to removing coda is to say conda activate
the second step is to deactivate conda by saying deactive conda
I forgot to add that when you activate conda you need to say base at the end
in terminal you just hit enter to move forward
In RStuido you have to hit command enter to move forward
The notes file on my computer has my R command cheat sheet
Life plan step one: gradute college
Life Plan Step Two: get my MD/PhD
Life Plan Step Three: Maybe get a JD or MPH after residency
Life Plan Step Four: Move to New York and find a partner
Life Plan Step Five: Practice medicine and travel when I can
csv_files <- list.files(path = Data,pattern = *.csv,recursive = TRUE, full.names = TRUE)
# This step allowed me to find and name all of the files in DATA_Course that are csv files

length(csv_files)
# This step allowed me use my brain less and instead of counting how many files I can make the computer tell me

df <- read.csv(Data/wingspan_vs_mass.csv)
# This step allowed me to open the right file, read it, and store it s a R object named df

head(df,5)
# This command let me inspect the first 5 lines of this data using the head function

list.files(path = Data, pattern = *^b,recursive = TRUE, full.names= TRUE)
# This step let me find all of the files that begain with b in the name that where in the Data directory
