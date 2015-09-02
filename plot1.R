#making a histogram of the global active power kilowatts
if(!file.exists("household_power_consumption.txt")){
      print("no file")      
      
} else {

      alldata<-read.table("household_power_consumption.txt", sep = ";", head=TRUE)

      plotdata<-alldata[as.Date(c("2007-02-01","2007-02-02"))== 
                              as.Date(strptime(alldata[,1], "%d/%m/%Y")),]
      rm(alldata)
      
      #prepare your data for the graph
      gap<-as.integer(plotdata$Global_active_power)
      
      #open the graphics device, a png file
      png(file="plot1.png")
      
      #plot
      hist(gap, col="red", main="Global Active Power",
           xlab="Global Active Power (kilowatts)")
      dev.off()

}
