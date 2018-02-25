library(dplyr)
library(tidyr)
data <- read_excel("stem_persistence_update.xlsx")

data2 <- data %>% separate("graduationsemester", c("gradyear", "gradsem"), sep = 4, remove = FALSE)
data4 <- data2 %>% separate("gradsem", c("gradsem", "gradcampus"), sep = 1, remove = TRUE)
data3 <- data2 %>% unite("graduationsemester", c("gradyear", "gradsem"), sep = "", remove = TRUE)


#This will do it!!!!
data4$gradsem[which(data4$gradsem==1)] <- "fall"
data4$gradsem[which(data4$gradsem==2)] <- "summer"
data4$gradsem[which(data4$gradsem==3)] <- "spring"


