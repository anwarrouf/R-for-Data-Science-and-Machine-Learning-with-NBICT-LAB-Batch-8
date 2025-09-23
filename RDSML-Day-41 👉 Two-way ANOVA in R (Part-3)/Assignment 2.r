# Problem 1: Recording Volunteer Names
# Background: During the recruitment phase of a breast cancer screening study, the first three volunteers to register were Hashem, Haris, and Mostafa
# Researchers often need to keep simple participant lists before linking them to detailed patient IDs.
# A vector is a good way to manage this information quickly in R
# Task: Create a vector with their names and print the first volunteer.

patients_name <- c("Hashem", "Haris", "Mostafa")
patients_name
patients_name[1]


# Problem 2: Assigning Patient IDs
# Background: Each patient in a clinical trial is assigned a numeric ID instead of using their actual name for confidentiality
# In your hypertension drug trial, the first four patients have IDs 1, 2, 3, 4.
# You want to store them for later reference
# Task: Store these IDs in a numeric vector and print them.
patients_ID <- c(1,2,3,4)
print(patients_ID)

# Problem 3: Student Participants in a Workshop
# Background: In a medical statistics workshop, three medical students — Maria, Shirmin, and Alam — participated in the hands-on R training session.
# Before analyzing their performance, you want to check how R classifies this vector of names (text or numeric?)
# Task: Create a vector of these names and check its class.
participants <- c("Maria","Shirmin","Alam")
class(participants)

# Problem 4: Extracting Test Results
# Background: A cardiologist recorded a patient’s systolic blood pressure at three consecutive visits: 120, 132, 138.
# Since blood pressure data is collected longitudinally,researchers may want to extract specific visits for comparison.
# Task: Store the readings in a vector and extract the last two readings.
sys_bp <- c(120,132,138)
sys_bp[c(2,3)]

# Problem 5: Labeling Gene Expression
# Background: In a small pilot study, you measured the expression counts (raw RNA-seq reads) for three cancer-related genes: TP53 (230), BRCA1 (120), and MYC (450).
# Properly labeling gene expression values helps prevent confusion during analysis
# Task: Store the values in a vector, assign the gene names as labels, and extract BRCA1’s value.

RNA_seq_read <- c(230,120,450)
names(RNA_seq_read) <- c("TP53", "BRCA1", "MYC")
RNA_seq_read
RNA_seq_read["BRCA1"]

# Problem 6: Creating an Expression Matrix
# Background: You measured expression values for 4 genes across 3 patients.
# In biomedical research, such rectangular data (genes × patients) is often stored as a matrix
# Task: Create a 4×3 matrix using values 1:12 filled row by row.
patient1 <- c(4,6,3,7)
patient2 <- c(5,8,12,8)
patient3 <- c(1,5,11,3)
expression_matrix <- matrix(data = c(patient1,patient2,patient3), byrow = FALSE, nrow = 4)
expression_matrix

# Problem 7: Checking Data Structure
# Background: Sometimes researchers mistakenly store gene expression data as a “list” or “data frame” instead of a “matrix.”
# Before applying matrix-specific functions, you must confirm its type
# Task: Use class() on the matrix from Problem 6 to check.
class(patient1)
class(expression_matrix)

# Problem 8: Mixing Data Types
# Background: In a lab notebook digitization project, someone mistakenly entered "hello", "hi", "bye" among numeric gene expression values
# R will automatically coerce all entries into one type, which can distort the dataset
# Task: Create a 2x3 matrix mixing text and numbers. Observe what happens.
matrix(data = c("hello", "hi", "bye",1,2,3), nrow = 2) 
# as the above one is a mixed type data, that's why, all data are converted into character

# Problem 9: Combining Patient Results into a Matrix
# Background: You measured glucose levels at three time points (fasting, 1-hour, 2-hour after glucose drink) for three patients:
# Asif: 90, 160, 120 • Harun: 100, 180, 150 • Afridi: 80, 145, 110
# Such data is best represented as a matrix for cross-patient comparisons
# Task: Create a matrix from these three patient vectors.
asif <- c(90,160,120)
harun <- c(100,180,150)
afridi <- c(80,145,110)
patients_glucose <- matrix (data = c(asif,harun,afridi), byrow = TRUE, nrow =3)
patients_glucose
rownames(patients_glucose) <- c("asif", "harun", "afridi")
colnames(patients_glucose) <- c("fasting","1-hour","2-hour")
patients_glucose

# or

patients <- c("asif","harun","afridi")
time_point <- c("fasting","1-hour","2-hour")
glucose_level <- matrix (data = c(90,160,120,100,180,150,80,145,110), byrow = TRUE, nrow = 3)
glucose_level
rownames(glucose_level) <- patients
colnames(glucose_level) <- time_point
glucose_level

# Problem 10: Adding Column Names for Time Points
# Background: The three columns correspond to the three test conditions: "Baseline","Treatment1", "Treatment2"
# Clear labels help make data interpretable at a glance
# Task: Assign these labels as column names.

