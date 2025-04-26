library(tidyverse)

med<-read_csv("/standard/BDShackathon/teams/cherry_garcia/cleaned_clinical_data_csvs/medications.csv")
sct<-read_csv("/standard/BDShackathon/data/leukemia/clinical/20250317_UVA_StemCellTransplant_V4.csv")
treatment <- med %>% left_join(sct %>% select(AvatarKey, SCTInd), by = "AvatarKey")
treatment <- treatment %>% mutate(SCTInd = recode(SCTInd, "No" = "FALSE", "Yes" = "TRUE"))
