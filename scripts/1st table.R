install.packages("readxl")
install.packages("tidyverse")
install.packages("gtsummary")
install.packages("gt")
install.packages("easystats")
install.packages("openxlsx")
install.packages("nanair")
install.packages("dplyr") 
install.packages("ggthemes") 
install.packages("hrbrthemes")
install.packages("RColorBrewer")
install.packages("rio")
install.packages("sjPlot")

library(tidyverse)
library(gtsummary)
library(gt)
library(readxl)
library(openxlsx)
library(skimr)
data <- read_excel("D:/CHIRAL/R/AMR_Parental_KAP_C/data/AMR_Parental_KAP_Chiral_code.xlsx")
glimpse(data)
is.na(data) |> 
  sum()
sum(is.na(data))  
sum(duplicated(data))

#table 1
data |> 
  select(1:11) |> 
  tbl_summary(statistic = list(
    all_continuous() ~ "({mean} ({sd}))"
  )) |> 
  as_gt() |> 
  gtsave("tables/table_1_demographics.docx")




Amr_data <- read_excel("D:/CHIRAL/R/AMR_Parental_KAP_C/data/AMR_Parental_KAP_Chiral_code.xlsx")
glimpse(KAP_data)
summary(KAP_data)
KAP_data<- KAP_data|> mutate_if(is.character , as.factor) 
glimpse(KAP_data)
summary(KAP_data)
Amr_data |> 
  select(1:11) |> 
  tbl_summary() |> 
  as_gt() |> 
  gtsave("tables/table_01_demoraphics.docx")











