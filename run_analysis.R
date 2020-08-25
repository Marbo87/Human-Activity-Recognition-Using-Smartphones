library(dplyr)
# get feature labels and indices of mean() and std()
file = "./UCI_HAR_Dataset/features.txt"
features <- read.table(file, header = FALSE)
meanind <- grep("mean|std", features$V2)
meanlab <- features$V2[meanind]
meanlab <- tolower(gsub("-|\\(|\\)","",meanlab))

# get activity indices and corresponding labels
file = "./UCI_HAR_Dataset/test/y_test.txt"
acttest <- read.table(file, header = FALSE)
file = "./UCI_HAR_Dataset/train/y_train.txt"
acttrain <- read.table(file, header = FALSE)
file = "./UCI_HAR_Dataset/activity_labels.txt"
actlab <- read.table(file, header = FALSE)
acttestlab <- actlab$V2[acttest$V1]
acttrainlab <- actlab$V2[acttrain$V1]
c(t(t(acttrainlab)), t(t(acttestlab))) %>% rbind() %>% gsub("_", "", .) %>% tolower %>% as.vector -> actlaball

# get subject indices
file = "./UCI_HAR_Dataset/test/subject_test.txt"
subtest <- read.table(file, header = FALSE)
file = "./UCI_HAR_Dataset/train/subject_train.txt"
subtrain <- read.table(file, header = FALSE)
suball <- rbind(subtrain, subtest)$V1

# get training and test sets and combine them
file = "./UCI_HAR_Dataset/train/X_train.txt"
xtrain <- read.table(file, sep = "", header = FALSE)
file = "./UCI_HAR_Dataset/test/X_test.txt"
xtest <- read.table(file, sep = "", header = FALSE)
comb  <- rbind(xtrain, xtest)
# select only mean() and std() features
combmean <- comb[, meanind]
names(combmean) <- meanlab
# include label for activity as first column
combmean$activity <- actlaball
combined <- select(combmean, activity, tbodyaccmeanx:fbodybodygyrojerkmagmeanfreq)

# create average of each variable for each activity and each subject
data2 <- combined
data2$subject <- suball
data2 <- select(data2, activity, subject, tbodyaccmeanx:fbodybodygyrojerkmagmeanfreq)
data2 %>% group_by(activity, subject) %>% summarize(across(where(is.numeric), mean), .groups = 'drop') -> averages