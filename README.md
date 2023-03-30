---
title: "README"
output: html_document
date: "2023-03-20"
---
# Additional material to the manuscript "Constitutional Structures for E-Voting throughout Europe"

This repository contains the scripts and raw data collected for the paper "Constitutional Structures for E-Voting throughout Europe".

The manuscript is under review for a special issue at Frontiers in Political Science and thus, the script to run the analysis on Eurobarometers is provided here, too. 

The study investigates the distribution of e-voting perceptions throughout Europe by analysing the [constitutions](https://github.com/isaborucki/e-voting_constitutions/tree/main/data), <a href="https://github.com/isaborucki/e-voting_constitutions/tree/main/data" target= "_blank"> party manifestos </a>, and <a href="https://search.gesis.org/research_data/ZA6653" target="_blank">Eurobarometer surveys</a>. 

## Abstract
Techno-optimists agree that e-voting lies at the heart of implementing e-government and digitalisation into democratic structures. However, we do not know much about the specific extent to which e-voting exists in European constitutions, even after one generation of intense debate about its possible implementation. Perceptions on e-voting matter because of the omnipresent digital transformation and discussions about how democracies (could) digitalise. How do party policies resemble e-voting on the national and European levels? E-voting represents a crucial, bottom-up part of top-down e-government and, through this, of digital transformation. The example of the “e-state” Estonia proves the relevance: e-voting has been in (legal) practice since 2005, and research can take much empirical evidence from this laboratory for digital innovation. The fact that Estonia is an exception to the rule within the EU member states explains the comparative approach to the (possible) legal framework for e-participation. With focussing on liberal democracies’ constitutional predefinitions, voting procedures in the virtual age have not been compared yet. 

We approach the question of “legalistic opportunity structures” by relying on constitutions of European member states and parties´ policies. Using a dictionary approach, our research design analyses the constitutions and manifestos of parties running for the European elections. Therefore, national constitutions and party manifestos are part of this study, which we analyse using several mixed-methods approaches. Our results have the broader implications that we need to study in more detail what the digital transformation and the constitutionalisation of electronic decision-making entail to develop a digital democracy and link it to a public sphere throughout Europe. In the end, we conclude by analysing whether or not the EU pushes its member states to e-voting and will implement e-voting for European elections.

The [.Rmd`-File](https://github.com/isaborucki/e-voting_constitutions/blob/main/eurobarometerEvoting.Rmd) is in a premature stadium, so please, add remarks and recommendations to improve the code (`code review`) here to the discussion. Thank you. The first plot of the distribution of e-voting through party platforms was produced using the following `R-script`:

#### Short R-Script to reproduce plot 1

```{r, echo=FALSE, message=FALSE}

library(tidyverse)
library(dplyr)
library(plotly)
library(readr)
library(ggplot2)
library(hrbrthemes)


data <- read_csv("https://raw.githubusercontent.com/isaborucki/e-voting_constitutions/main/data/Manifesto_Coding-Search_Results.csv")
View(data)

evoteyear <- table(data$Land,data$Jahr) # this shall check whether we have absolute counts for the countries coded in our material

View(evoteyear)

df <- data %>% 
        count(Land, Jahr)

# Plot the distribution of keywords mentions over years per country
Freq <- data %>% 
      group_by(Land) %>% 
      summarise(n = n()) %>% 
      mutate(Freq = n/sum(n)) %>% 
  mutate(Land = factor(Land, Land))

# To plot, we use ggplot, first only a scatterplot to see how the unique entries are distributed over the years
  ggplot(data, aes(x=Jahr, y=Land))+
    geom_point(alpha = 0.5) +
    theme_minimal()
  
# Being more concrete we add boxplots with mean and median to assess the range of said total counts of mentions wihtin the manifestos. 

ggplot(df,
       aes(x=Jahr, y=Land, size=n))+
  geom_point(alpha = 0.5) +
  #geom_boxplot() +
  #geom_rug(col="steelblue",alpha=0.1, linewidth=1.5) +
  #geom_violin()+
  #stat_summary(fun.y = mean, colour = "darkblue")+
  #stat_summary(fun.y = median, colour = "black")+
  labs(x = "Year",
       y = "Country") +
  theme_minimal() +
  theme(legend.position="none") 
```
