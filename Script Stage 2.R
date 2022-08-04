#Calculate the product of 31 and 78
a <- 31*78
#Divide 697 by 41
b <- 697/41
# Add 314 and 654
d <- 314 + 654
#Subtract 23 from 56765
f <- 56765-23
#Assign 39 to x
x <- 39
#Assign 14 to y
y <- 14
#Make z the value of x - y
z <- x-y
#Calculate the square root of 2345, and perform a log2 transformation on the result
w <- log2(sqrt(2345))
print(w)
#Create a vector called vec1 containing the numbers 2,5,8,12 and 16
vec1 <- c(2, 5, 8, 12, 16)
#Use seq() to make a vector of 100 values starting at 2 and increasing by 3 each time and store it in a new variable
g <-seq(2,302, by=3)
#Extract the values at positions 5,10,15 and 20 in the vector of 100 values you made
g[c(5,10,15,20)]
#Extract the values at positions 10 to 30 in the vector of 100 values you made
g[10:30]
print(g)
#Enter the following into a vector with the name mouse_colour. Remember to surround each piece of text with quotes: purple, red, yellow, brown
mouse_color <- c("purple", "red", "yellow", "brown")
#Enter the following into a vector with the name mouse_weight: 23, 21, 18, 16
mouse_weight <- c(23,21,18,16)
#Join the 2 vectors together using the data.frame function to make a data frame named mouse_info with 2 columns and 4 rows. Call the first column ‘color’ and the second one ‘weight’
mouse_info <- data.frame(color=mouse_color,weight=mouse_weight)
print(mouse_info)
#Read the file ‘small_file.txt’ [https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt] into a new data structure using read.table() OR read.delim(). Remember to assign a name to the data that you read in using the assignment operator
small_file <- read.table(file="https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt")
#View the data set to check that it has imported correctly
view(small_file)
#Read the file ‘Child_Variants.csv’ [https://github.com/HackBio-Internship/public_datasets/blob/main/R/Child_Variants.csv?raw=true] into a new data. This is a comma-separated file so you should use read.csv(). Again, remember to assign a name to the data when you import it
Child_Variants <- read.csv(file="https://github.com/HackBio-Internship/public_datasets/blob/main/R/Child_Variants.csv?raw=true")
#Use head and View to look at the data set to check that it has imported correctly.
head(Child_Variants,n=3)
View(Child_Variants)
#Calculate the mean of the column named MutantReadPercent. Think about how you are going to access a single column first (probably by using the $ notation or [] notation), then once you can access the data pass it to the mean function
mutant <- Child_Variants$MutantReadPercent
mean(mutant)
#Create a filtered version of the child variants dataset that only includes rows where the MutantReadPercent is >=70 using subset() function or the [] notation
filter_set <- subset(Child_Variants, MutantReadPercent >= 70)
View(filter_set)
# Search google for the “`Iris flower dataset`”. You are searching for the dataset because we want you to learn on how to search for datasets yourself
irisdata <- read.csv('https://gist.github.com/curran/a08a1080b88344b0c8a7/raw/0e7a9b0a5d22642a06d3d5b9bcbad9890c8ee534/iris.csv')
View(irisdata)
#With relevant plots, which species of flower has:
#shorter sepal length but longer width
#longer sepal lengths and shorter sepal widths
versicolor <- subset(irisdata, species == "versicolor")
setosa <- subset(irisdata, species == "setosa")
virginica <- subset(irisdata, species == "virginica")
boxplot(versicolor$sepal_length, versicolor$sepal_width,setosa$sepal_length, setosa$sepal_width,virginica$sepal_length, virginica$sepal_width,names=c('Versicolor sepal_length','Versicolor sepal_width','Setosa sepal_length','Setosa sepal_width','Virginica sepal_length','Virginica sepal_width'),las=2)
print('Setosa has shorter sepal length but longer width')
print('Virginica has longer sepal lengths and shorter sepal widths')
#- With relevant plots, which specie of flower has
#- shorter petal length as well as petal width
#- longer petal length as well as petal width
boxplot(versicolor$petal_length, versicolor$petal_width,setosa$petal_length, setosa$petal_width,virginica$petal_length, virginica$petal_width,names=c('Versicolor petal length','Versicolor petal width','Setosa petal length','Setosa petal width','Virginica petal length','Virginica petal width'),las=2)
print('Setosa has shorter petal length as well as petal width')
print('Virginica has longer petal length as well as petal width')
#Which variables (or columns) correlate best (use pairs() function)
pairs(irisdata[,1:4],col=iris[,5],oma=c(5,5,6,10))
par(xpd=TRUE)
legend(0.8,0.5, as.vector(unique(irisdata$species)),fill=c(1,2,3))
#correlation function
corr <- cor(irisdata[,1:4])
round(corr,3)
print('Petal lenth and petal width correlate best')
