#Data Manipulation and Introduction to Regression Analysis

#Today we will be exploring more data analysis tools in R.  So far we have played 
#around with creating data frames, downloading data, cleaning data, and saving
#new data sets.  Moving forward you will need to know how to combine and alter data
#to obtain the information you need to run regression analysis.  



################################################################################
#Row Binds

#Starting off today we will look at different methods of combining data sets. Let's
#begin by coding three vectors and creating a data frame.

key = c(1,2,3,4,5)
name = c("Mary", "Mark", "Tony", "Alice", "Derek")
age = c(34, 52, 33, 61, 12)




#Now lets code a second data frame with the same variables but different entries.

key = c(6,7,8,9,10)
name = c("Aaron", "Jeff", "Diane", "Nick", "Sarah")    
age = c(23, 51, 24, 63, 98)




#We have two data frames with the same information covering different groups of
#people.  Let's combine these two data frames into one large table.  To do this 
#we will use the command rbind(), row bind.  These is a useful function when combining
#sets of data with the SAME variables and SAME number of variables.





#Great job! What would have happened if one of the sets was missing a variable?

df_missing = cbind(key, name)

df_missing = as.data.frame(df_missing)

df_missing_example = rbind(df_1, df_missing)


################################################################################
#Merging

#Now lets create a new data frame where one of the variables is key from df_3:

key = c(3,2,6,1,5,4,7,9,8,10)

SSN = c(5783819, 1946180, 4802849, 9104719, 3338920, 3891047, 0274829, 1738402, 9301748, 2740174)

edu = c(12, 16, 12, 16, 16, 18, 20, 20, 24, 12)

df_4 = cbind(key, SSN, edu)

df_4 = as.data.frame(df_4)


#Note that we have the variable 'key' that is the same in both data sets.  Let's 
#suppose that the social security numbers and years of education in df_4 correspond
#to the people in df_3.  We want to combine these tables together.  To do so we 
#will do a merge.  

#There are multiple ways of doing a merge in R.  The most basic is the function
#merge().  Look at the R notation for merge.  We want to combine the two data
#sets by their unique key, in this case the variable 'key'.  A unique key is necessary
#to perform a merge, otherwise incorrect values from one table may be assigned to
#values in another.




#Looking at the new merged table we see that the the SSN's and years of education 
#have been correctly matched to the names and ages in the other data frame.  





################################################################################
#The Tidyverse

#This will feel like a divergence from what we just covered with merges, however
#it does loop back around.  The tidyverse package dyplr is needed to move forward with
#your data manipulation skills.

#The tidyverse is a set of R packages with their own unique coding format that
#simplify the R coding process. Today we will be introduced to the various kinds
#of merges and pivots in the tidyverse.  First, however, it's important to understand the 
#coding structure that the tidyverse uses.

#Install the packages "tidyverse" and "dplyr" if you have not already done so.

library(tidyverse)
library(dplyr)

#Let's try something we know how to do, create a new variable by adding two columns
#together.  

a = c(1,2,3,4)
b = c(5,6,7,8)

data = cbind(a,b)
data = as.data.frame(data)

#What our code would look like without tidyverse:

data$c = data$a + data$b


#In tidyverse:

data = data %>%
  mutate(c = a + b)


#The "%>%" is called a pipe.  It is an operator that tells R to read the above script
#as the following:

#   "Take 'data' and (%>%) do the function 'mutate' to create the new variable 'c'
#   "by adding 'a' and 'b'.

#Many people enjoy this form of coding because it mimics how you would give directions 
#in English.  We will see more examples of this coding style moving forward, especially
#in the data cleaning process.




################################################################################
#The Tidyverse and Merges: dyplr

#There are four main types of merges:
#   inner joins: only combines data that has a matching key in both data sets, removes the rest.
#   outer joins: combines all data in both sets, with or without matching keys.
#   left joins: takes all data from one set and combines it with the overlapping data from the other.
#   right joins: the same as a left join but with the other data set.


#Looking up a picture of this may be helpful, may web sites explain the joins with
#charts.

#Let's do some simple examples with the two data sets A and B

key = c(1,2,3,4,5)
name = c("Mary", "Mark", "Tony", "Alice", "Derek")
age = c(34, 52, 33, 61, 12)

A = cbind(key, name, age)

A = as.data.frame(A)
A$key = as.numeric(A$key)



key = c(3,4,5,6,7)
SSN = c(5783819, 1946180, 4802849, 9104719, 3338920)
edu = c(12, 16, 12, 16, 16)

B = cbind(key, SSN, edu)

B = as.data.frame(B)



#Inner Join: Only the data with matching keys in both A and B

inner = inner_join(A, B, by = "key")
inner


#Outer Join: Everything from A and B

outer = full_join(A, B, by = "key")
outer


#Left Join: Everything in A and the matching parts from B

left = left_join(A, B, by = "key")
left


#Right Join: Everything from B and the matching parts from A

right = right_join(A, B, by = "key")
right






################################################################################

#######################           Exercises           ##########################

################################################################################

###Exercise 1

#A school is trying to find indicators of student success in teacher salary, education
#and employment history.  Download the two excel files "Students" and "Teacher."
#Three classes have been selected for the evaluation.




#Find summary statistics for both data sets, can anything be leaned from the independent
#data sets?



#Merge the data sets together.  What will you use for the key? Rename the variable(s)
#if necessary.






#Perform the four merges discussed above. What kind of merge will you use?







#Evaluate the average reading and math scores in the different classes.  Does there 
#appear to be any correlation between the average score in the class and the teacher's
#degree focus?






#Does having both a math and reading degree appear to have an impact on student scores?
















