```{r}
# Libraries
library(tidyverse)
library(ggplot2)


# Load data 
holydays <- read.csv("holyday2.csv")
View(holydays)
head(holydays)
holydays <- as.data.frame(holydays)

ggplot(holydays, aes(Day, Month, color = Calendar))+
  geom_point(size = 6)

#order month by logical, not alphabetical
holydays$Month = factor(holydays$Month, levels = month.abb)

ggplot(holydays, aes(Day, Month, color = Calendar))+
  geom_point(size = 6)+  
  scale_y_discrete(limits = rev(levels("Month")))

#reverse order
library(forcats)

ggplot(holydays) + 
  aes(x = Day, y = fct_rev(Month), color = Calendar, na.rm = TRUE) + 
  geom_point(size = 6)+
  scale_y_discrete(limits = rev(levels("Month")))+
  theme_linedraw()+
  labs(title="Bank Holyday by type of Calendar",
       plot.title = element_text(hjust = 0.5),
       x ="Day", y = "Month",
       caption = "Author: Arantxa Herranz | Source: qppstudio")

