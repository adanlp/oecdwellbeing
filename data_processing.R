library(tidyr)

# Load the data
wb0 <- read.csv("./oecd_wellbeing.csv", stringsAsFactors=FALSE)

# Tidy the data, mostly gathering columns
wb <- gather(wb0, key=topic, value=education:life_satisfaction, -country)

# Order by topic (important to create the star plot)
wb <- wb[order(wb[,2], wb[,1]),]

# Final processing
colnames(wb)[3] <- "value"
wb$topic <- as.factor(wb$topic)
