#creates line graph of global active power by time

if(!file.exists("household_power_consumption.txt")){
      print("no file")      
      
} else {

      alldata<-read.table("household_power_consumption.txt", sep = ";", head=TRUE)

      # we are only looking at a couple of days
      plotdata<-alldata[as.Date(c("2007-02-01","2007-02-02"))== 
                              as.Date(strptime(alldata[,1], "%d/%m/%Y")),]
      rm(alldata)

      #prepare your x and y data vectors
      sm1<-as.integer(plotdata$Sub_metering_1)
      sm2<-as.integer(plotdata$Sub_metering_2)
      sm3<-as.integer(plotdata$Sub_metering_3)
      dt<-strptime(paste(plotdata$Date,plotdata$Time),"%d/%m/%Y %H:%M:%S") 
      gap<-as.integer(plotdata$Global_active_power)
      
      #prepare a window of 4
      par(mfrow=c(2,2))
      
      #open the graphics device, a png file
      png(file="plot4.png")
      
      #plot top left
      hist(gap, col="red", main="Global Active Power",
           xlab="Global Active Power (kilowatts)")
      
      #plot top right
      plot(dt, gap, ylab="Global Active Power (kilowatts)", type="l")
      
      #plot bottom left
      plot(dt, sm1, ylab="Energy Sub Metering", type="l")
      lines(dt, sm2, col="blue")
      lines(dt, sm3, col="red")
      legend("topright",
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      
      #out of time for 4th!!
      
      dev.off()

}
