#making a histogram of the global active power kilowatts
if(!file.exists("household_power_consumption.txt")){
      print("no file")      
      
} else {

      alldata<-read.table("household_power_consumption.txt", sep = ";", head=TRUE)

      plotdata1<-alldata[as.character(alldata$Date)==c("1/2/2007"),]
      plotdata2<-alldata[as.character(alldata$Date)==c("2/2/2007"),]
      plotdata<-rbind(plotdata1,plotdata2)                    
      rm(alldata)
      
      #prepare your data for the graph
      gap<-as.numeric(as.character(plotdata$Global_active_power))
      
      #open the graphics device, a png file
      png(file="plot1.png")
      
      #plot
      hist(gap, col="red", main="Global Active Power",
           xlab="Global Active Power (kilowatts)")
      dev.off()

}
