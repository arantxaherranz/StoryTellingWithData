```{r}
# Libraries
library(tidyverse)
library(ggplot2)
library(lubridate)


# Load data 
holydays <- read.csv("holyday2.csv")
View(holydays)
head(holydays)

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
  scale_x_continuous(breaks=seq(1,31,1))+
  scale_y_discrete(limits = rev(levels("Month")))+
  theme_linedraw()+
  labs(title="Bank Holyday by type of Calendar",
       plot.title = element_text(hjust = 0.5),
       x ="Day", y = "Month",
       caption = "Author: Arantxa Herranz | Source: qppstudio")

#anothr calendar
install.packages("remotes")
remotes::install_github("jayjacobs/ggcal")
library(ggplot2)
library(ggcal)

mydate <- seq(as.Date("2017-02-01"), as.Date("2017-07-22"), by="1 day")
myfills <- rnorm(length(mydate))

print(ggcal(mydate, myfills))

#another calendar
library(calendR)

number <- read_delim("number_day.csv")
View(number)

#join month and day in a new column
holydays$Date <- make_date(year = "2022", month = holydays$Month, day = holydays$Day)
View(holydays)

#creating a Day of Year (doy) column
holydays$doy <- yday(holydays$Date)

calendR(year = 2022,
        start = "M",
        special.days = length(holydays$doy),
        )
          

        