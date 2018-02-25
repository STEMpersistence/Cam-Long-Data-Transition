library(dplyr)
library(tidyr)
data <- read_excel("stem_persistence_update.xlsx") # read in data

data2 <- data %>% separate("graduationsemester", c("gradyear", "gradsem"), sep = 4, remove = FALSE) # seperate columns into year and (semester and campus)
data4 <- data2 %>% separate("gradsem", c("gradsem", "gradcampus"), sep = 1, remove = TRUE) # seperate columns into semester and campus
data3 <- data2 %>% unite("graduationsemester", c("gradyear", "gradsem"), sep = "", remove = TRUE) # reunite year and semester


#This will reassign numeric semester values to corresponding word values
data4$gradsem[which(data4$gradsem==1)] <- "fall"
data4$gradsem[which(data4$gradsem==2)] <- "summer"
data4$gradsem[which(data4$gradsem==3)] <- "spring"


