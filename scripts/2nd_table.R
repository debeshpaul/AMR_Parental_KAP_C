library(sjPlot)
library(hrbrthemes)
library(RColorBrewer)
library(rio)
library(fastmap)
library(readxl)
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)
library(openxlsx)
library(naniar)
library(dplyr)
library(ggthemes)
data <- read_excel("D:/CHIRAL/R/AMR_Parental_KAP_C/data/AMR_Parental_KAP_Chiral_code.xlsx")
glimpse(data)





#table 2
data |> 
  select("Source(s) of information about antibiotics") |> 
  tbl_summary(type = all_categorical() ~ "categorical",
              statistic = list(all_continuous()~ "{mean} ({sd)}")) |> 
  as_gt() |> 
  gtsave("tables/table_2_demographics.docx")


#table 3
data |> 
  select(69:71) |> 
  tbl_summary(statistic = list(
    all_continuous() ~ "({mean} ({sd}))"
  )) |> 
  as_gt() |> 
  gtsave("tables/table_3_KAP.docx")

# Table 4

data2<- read_xlsx("D:/CHIRAL/R/AMR_Parental_KAP_C/data/AMR_Parental_KAP_Chiral_T4.xlsx")
glimpse(data2)
data2 |> 
  select(1:9, Knowledge_Level) |> 
  tbl_uvregression(
    method = glm,
    y = Knowledge_Level,
    method.args = list(family= gaussian),
  ) |> 
  bold_p(t=0.05) |> 
  as_gt() |> 
  gtsave("tables/table_4_UV.docx")



# Table 5

data2<- read_xlsx("D:/CHIRAL/R/AMR_Parental_KAP_C/data/AMR_Parental_KAP_Chiral_T4.xlsx")
glimpse(data2)
data2 |> 
  select(1:9, Attitude_Level) |> 
  tbl_uvregression(
    method = glm,
    y = Attitude_Level,
    method.args = list(family= gaussian),
    exponentiate = T
  ) |> 
  bold_p(t=0.05) |> 
  as_gt() |> 
  gtsave("tables/table_5_UV.docx")



# Table 6

data3<- read_xlsx("D:/CHIRAL/R/AMR_Parental_KAP_C/data/AMR_Parental_KAP_Chiral_code_T6.xlsx")
glimpse(data2)
data3 |> 
  select(1:9,69,70, Practice_Level) |> 
  tbl_uvregression(
    method = glm,
    y = Practice_Level,
    method.args = list(family= binomial),
    exponentiate = T
  ) |> 
  bold_p(t=0.05) |> 
  as_gt() |> 
  gtsave("tables/table_6_UV_Practice.docx")












