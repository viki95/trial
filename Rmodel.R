# Data cleaning on Data Calls 
#import data from Excel
library(readxl)
library(dplyr)

install.packages("dplyr")
#library(data.table)
#data_calls.table

# Importing Excel Data to R 
data_calls = read_excel('C:\\Users\\Vignesh\\Desktop\\Data\\calls data.xlsx')

?read_excel

names(data_calls)
str(data_calls)
!is.null(data_calls)
--------------------------------------------------------------------------------------
# SLICING the Data 

data1 <- data_calls[,c('42583','CUPS...2')] 
#names(data1) <- c("42583", "DATE")
colnames(data1) = c('Date', 'Calls')
#stopword = c("Saturday","Sunday"))
data1
#setnames(data1, old=c("42583","CUPS...2"), new=c("DATE", "CALLS"))

data2 <- data_calls[,c('42614','CUPS...4')]
colnames(data2) = c('Date', 'Calls')
#colnames(data2)[colnames(data2)=="CUPS...4"] <- "CALLS"
#colnames(data2)[colnames(data2)=="42614"] <- "DATE"
data2

data3 <- data_calls[,c('42644','CUPS...6')]
colnames(data3) = c('Date', 'Calls')
#colnames(data3)[colnames(data3)=="CUPS...6"] <- "CALLS"
#colnames(data3)[colnames(data3)=="42644"] <- "DATE"
data3

data4 <- data_calls[,c('42736','CUPS...8')]
colnames(data4) = c('Date', 'Calls')
#colnames(data4)[colnames(data4)=="CUPS...4"] <- "CALLS"
#colnames(data4)[colnames(data4)=="42736"] <- "DATE"
data4

data5 <- data_calls[,c('42705','CUPS...10')]
colnames(data5) = c('Date', 'Calls')
#colnames(data5)[colnames(data5)=="CUPS...5"] <- "CALLS"
#colnames(data5)[colnames(data5)=="42705"] <- "DATE"
data5
--------------------------------------------------------------------------------
typeof(data_calls)
class(data_calls)

class(data1)
is.na(data_calls)
sum(is.na(data_calls))
#stopword = c("Saturday","Sunday"))

print(data_calls)

#[data2.CUPS == 'NULL'] <- 0
#data_calls[data_calls == "NULL"] <- 0
#smartbind(data1,data2,data3,data4,data5,fill = 0)
-------------------------------------------------------------------------------
#Concatenating all the data to one DF

data_all <- do.call("rbind", list(data1,data2,data3,data4,data5))
data_all
-------------------------------------------------------------------------------
#creating a new dataframe
#data_filter <- data_calls
#select(data_filter
#stopword = c("Saturday","Sunday")
--------------------------------------------------------------------------------
# Taking Sat and Sun from the DF 

data_all
data_filter = filter(data_all,Calls!="Saturday" & Calls !="Sunday")
data_filter
------------------------------------------------------------------------------
#data_filter = filter(data_all.Calls = "Saturday" & data_all.Calls = "Sunday")
#data_filter = filter_row(data_all, "CALLS", c("Saturday", "Sunday"))
#data_all >> select[X.Firstcolumn,X.Secondcolumn]

#Replacing holidays with NA

data_filter.Calls %>% str_replace("Holiday", "0")
#data_filter%>%
#  data_filter.Calls(Holiday=replace(Holiday, Holiday==0, NA)) %>%
#  as.data.frame()
data_filter$Holiday <- 0
data_filter
select (data_filter,-c(Holiday))
#data_replaced <- data_filter %>%
#mutate(Calls = str.replace(Calls,"Holiday","0"))
#?str.replace
#data_filter %>% 
#mutate(Calls = gsub("Holiday", "0", Calls))

#Reduce(function(CALLS,DATE) merge(CALLS,DATE, all=TRUE), list(data1, data2, data3,data4,data5))
# total <- merge(data frameA,data frameB,by=c("ID","Country"))
#data_all <- merge(data1,data2,data3,data4,data5, by = c("DATE","CALLS"))
# merge(x, y, by, by.x, by.y, sort = TRUE)
#  merge(data1,data2,data3,data4,data5, by,by.x="DATE", by.y="CALLS", sort = TRUE)
library(gsubfn)
#data_filter$Calls <- gsub('Holiday', '0', data_filter$Calls)
#data_filter
#data_filter$Calls <- str_replace_all(data_filter$Calls, 'Holiday', '0')           
#data_filter$Calls <- chartr("0", "Holiday", data_filter$Calls)                  
#data_filter
#gsub(data_filter, Calls("Holiday", "0"))

#replace.value( data_filter, Calls, from=Holiday, to=as.integer(0), verbose = FALSE)
#filter(select(Calls),Calls = "Holiday")
data_filter %>%
replace_with_na(replace = list(Calls = c("Holiday",0))
data_filter$Calls <- as.integer(data_filter$Calls)                  
data_filter   
#data_filter$Days <-as.Date(data_filter$Days,format ="%d-%m-%y")
------------------------------------------------------------------------------------
# Adding days and months column 
data_filter['Days'] <- format(data_filter$Date,format = '%A')
data_filter['Months'] <- format(data_filter$Date,format = '%B')
data_change = data_filter
colSums(is.na(data_filter))
--------------------------------------------------------------------------------------
#converting date
#data_filter['Month'] <- as.Date(data_filter$Month, format='month')
#str(data)
#data_filter['Year'] <- format(data_filter$Date, '%Y')
#format(data_filter$Date, '%m')
#format(data_filter$Date, '%B')
#format(data_filter$Date, '%d')
#data_filter['Days'] <- format(data$Date, '%A')

#data_filter
#data_filter['Year'] <- format(data_filter$Date, '%Y')#

select(data_filter,-c(Holiday))
data_change = data_filter                 
data_change = select(data_filter,-c(Year,Holiday,Month))                 
data_change                  
----------------------------------------------------------------------------------------
# Conversion of column to numeric
  
data_change['Calls'] <- as.numeric(data_change$Calls)
typeof(data_change['Calls'])                  
class(data_change['Calls'])                  
----------------------------------------------------------------------------------------
names(data_change)
#df_A = select(data_Change, ends_with('August'))                  
str(data_change)                  
library(sqldf)                  
#d1 = sqldf('Select Months from data_Change where Months = August')                  
#d1 = sqldf('select Date,Calls,Days,Months from data_change where Months like "A%" orderby "Month"')

----------------------------------------------------------------------------------------
# Filling the NA value 

data_change
d1 = data_change %>% select(Date,Calls,Days,Months) %>% group_by(Months) %>% filter(Months =='August')                   
d1                  
colSums(is.na(d1))  
mean(d1$Calls)
d1['Calls'][is.na(d1$Calls),] <- mean(d1$Calls, na.rm = TRUE)                  
d1

d2 = data_change %>% select(Date,Calls,Days,Months) %>% group_by(Months) %>% filter(Months =='September')
d2
d2['Calls'][is.na(d2$Calls),] <- mean(d2$Calls, na.rm = TRUE) 
mean(d2$Calls)
d2
colSums(is.na(d2))

d3 = data_change %>% select(Date,Calls,Days,Months) %>% group_by(Months) %>% filter(Months =='October')
d3
d3['Calls'][is.na(d3$Calls),] <- mean(d3$Calls, na.rm = TRUE)
mean(d3$Calls)
d3
colSums(is.na(d3))

d4 = data_change %>% select(Date,Calls,Days,Months) %>% group_by(Months) %>% filter(Months =='December')
d4
colSums(is.na(d4))

d5 = data_change %>% select(Date,Calls,Days,Months) %>% group_by(Months) %>% filter(Months =='January')
d5
d5['Calls'][is.na(d5$Calls),] <- mean(d5$Calls, na.rm = TRUE)
mean(d5$Calls)
d5
colSums(is.na(d5))
------------------------------------------------------------------------------------
# Concatnation of all the data to one 

data_new <- do.call("rbind", list(d1,d2,d3,d4,d5))
data_new

data_new 
d = data_new[order(as.Date(data_new$Date, format = "%d/%m/%Y")),]
d
-------------------------------------------------------------------------------------
library(ggplot2)

ggplot(d,aes(x=d$Calls)+ geom_bar()
hist(d$Date)  
#order by date 
dn = d %>% select(Date,Calls,Days,Months) %>% group_by(Date)
dn
------------------------------------------------------------------------------------
# Bar plot 

library(ggplot2)
library(ggthemes)
library(plotly)
install.packages("plotly")

#p <- ggplot(d, aes(x=`Months`)) + geom_bar() + theme_hc()  + scale_colour_hc()
#ggplotly(p)
--------------------------------------------------------------------------------------
# TREND FOR EACH MONTH GRAPH PLOT 

p <- ggplot(dn, aes(x= factor(dn$Months), y=`Calls`, colour=`Months`)) + geom_point() + labs(x='Months',y='Calls',title='Month Vs Calls ') + theme_light() 
ggplotly(p)

#qplot(x=Months, y=Calls, color = Months) + geom_point()

-------------------------------------------------------------------------------------
# Overall Trend

ggplot(data = dn,
       aes(Months, Calls)) +
  stat_summary(fun.y = sum, # adds up all observations for the month
               geom = "bar")  # or "line"
  scale_x_date(
    labels = date,format("%d/%m/%Y"),
    breaks = "1 month") # custom x-axis labels
--------------------------------------------------------------------------------------
#box plot

#plot(dn,type = "o", col = "red", xlab = "Months", ylab = "Calls",
#     main = "Calls Vs Month ")
#p <- plot_ly(dn, x = ~Months, y = ~Calls, type = 'scatter', mode = 'lines')
#p
#boxplot
#p <- ggplot(dn, aes(y=`Calls`)) + geom_boxplot() + labs(x='Date',title = 'Calls Vs DAte ',subtitle = 'Just a boxplot',caption = 'Made with ggplot2')
#ggplotly(p)
#options(scipen=999)

#data_new %>% 
#  mutate(new_days = str_replace(Days, "Monday", "1"))

#data_new%>%
#  mutate(Days=case_when(
#    .$Days=="Monday" ~ 1,
#    .$Days=="Tuesday" ~ 2,
#    .$Days=="Wednesday" ~ 3,
#    .$Days=="Thursday" ~ 4,
#    .$Days=="Friday" ~ 5,
#  ))
#data_new %>%
#  str_c(collapse = "---") %>%
#  str_replace_all(c("one" = "1", "two" = "2", "three" = "3"))
--------------------------------------------------------------------------
# Create Another data frame with weekdays represented as numbers 

d['Day_num'] <- d$Date
d$Day_num <- as.numeric(strftime(as.Date(d$Day_num, "%d-%m-%y"),"%u"))
d
------------------------------------------------------------------------

# Dropping Date and Month column 

  #d
#select()
#select(d,-c(Date,Months))
#select(d,-c(Months))
#df = cols.dont.want <- c("Months") # if you want to remove multiple columns
#df
#d
#df <- d[,0:4]
#df
#rm_col <- c("Date") 
keeps <- c("Calls","Days")
df = d[keeps]
df
------------------------------------------------------------------------