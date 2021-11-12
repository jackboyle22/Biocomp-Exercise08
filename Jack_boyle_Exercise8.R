#exercie 8

UWvMSU<-read.table("/Users/jackboyle/Documents/BioComputing/Biocomp-Exercise08/UWvMSU_1-22-13.txt")
UWvMSU


#You’ll want to generate a matrix or dataframe with a cumulative score for each team whenever either team scores.
#For plotting purposes, keep it simple. There is a function plot(x,y,type='l') in base package, where x and y are vectors and type=‘l’ specifies a line graph. You can add a second line to this graph with lines(x,y). Use the help file for these functions to figure out other argument to customize the line types if you would like.

#values will be set a 0 for each of the info needed
UWvMSU$UWscore = 0
UWvMSU$MSUscore = 0
UW = 0 
MSU = 0 
# for loop will separate the info needed related to the total score of the teams
for (i in 1:nrow(UWvMSU)){
  if (UWvMSU$team[i] == "UW"){
    if (i == 1){
      totalUW = UWvMSU$score[i]
      UWvMSU$UWscore[i] = totalUW
      UWvMSU$MSUscore[i] = totalMSU
    }else{
      totalUW = UWvMSU$score[i] + totalUW
      UWvMSU$UWscore[i] = totalUW
      UWvMSU$MSUscore[i] = totalMSU
    }
  } 
  else{
    if (i == 1){
      totalMSU = UWvMSU$score[i]
      UWvMSU$MSUscore[i] = totalMSU
      UWvMSU$UWscore[i] = totalUW
    }else{
      totalMSU = totalMSU + UWvMSU$score[i]
      UWvMSU$MSUscore[i] = totalMSU
      UWvMSU$UWscore[i] = totalUW
    }
  } 
}
#the plot will use the function "ggplot.
ggplot(data=df, aes(x= time)) + geom_line(aes(y = UWscore), color = "red") + 
  geom_line(aes(y = MSUscore), color = "green") + xlab("Time (minutes)") + ylab("Score") + 
  labs(title = "MSU (green) vs UW (red)", subtitle = "1/22/13") + geom_vline(xintercept = 20)

### Question 2

readnumber <- function()
{ y <- readline(prompt="Guess My Number: ")
#"if statement" will determine the number used inn the guessing game
if(!grepl("^[0-9]+$",y))
{return(readnumber())
}
return(as.integer(y))
}
x<-sample(1:100)
n<-1
print("Guess a number between 0 and 100")
while(n != x)
{ 
  n <- readnumber()
  if (n == x)
  {
    print("Correct!")
  }
  else if (n < x)
  {
    print("Higher")
  }
  else if(n > x)
  {
    print("Lower")
  }
}

#the code will print "Higher" for a higher guess and "Lower" for a lower guess, and "correct" if you correct the corrnect x value.
