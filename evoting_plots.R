# Manifesto Counts for E-Voting Paper 
# Isabelle Borucki 

library(tidyverse)
library(plotly)
library(readr)
results <- read_csv("~/Google Drive/E-Voting Constitutions/Data collection/manifesto/Manifesto Coding - Search Results.csv")
View(results)

evoteyear <- table(results$Land,results$Jahr)

plot(results)

ggplot(results,
       aes(x=Jahr, y=Land))+
  geom_point(position = "jitter", alpha = 0.9) +
  labs(x = "Year",
       y = "Country") +
  theme_minimal()


