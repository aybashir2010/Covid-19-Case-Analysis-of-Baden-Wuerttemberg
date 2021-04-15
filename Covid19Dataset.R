library(covid19.analytics)
library(tools)
library(dplyr)
library(Rserve)
library(ggplot2)
covid19.ger.path = 'C:/Users/Owner/Desktop/RR/COVID19-GERMANY/covid_de.csv'
Output = "C:/Users/Owner/Desktop/Programming/R/COVID 19/"
covid19.germ.file = read.csv(covid19.ger.path)
baden.data = covid19.germ.file[1:82909,]
#Removing All rows with NA #######
baden.data = baden.data[!(baden.data$age_group == 'NA'),]
baden.data = baden.data[!(baden.data$gender == "NA"),]
##Arranging the dataframe acording to Age and Date.
badenw = order(baden.data$age_group, baden.data$date)
baden.data = baden.data[badenw,]
baden.data.age4 = baden.data %>% filter(age_group == "00-04")
baden.data.age14 = baden.data %>% filter(age_group == "05-14")
baden.data.age34 = baden.data %>% filter(age_group == "15-34")
baden.data.age59 = baden.data %>% filter(age_group == "35-59")
baden.data.age79 = baden.data %>% filter(age_group == "60-79")
baden.data.age89 = baden.data %>% filter(age_group == "80-99")
mylist = c("baden.data","baden.data.age4","baden.data.age14",
                "baden.data.age34","baden.data.age59",
                "baden.data.age79","baden.data.age89")
for(i in 1:length(mylist)){
  write.csv2(get(mylist[i]), paste0("C:/Users/Owner/Desktop/Programming/R/COVID 19/",
                                    mylist[i],".csv"), row.names = FALSE)
}
