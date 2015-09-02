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

      #open your gr and plot!
      png(file="plot3.png")
      plot(dt, sm1, ylab="Energy Sub Metering", type="l")
      lines(dt, sm2, col="blue")
      lines(dt, sm3, col="red")
      #out of time to clean up and finish legend :-(
      legend("topright",
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      dev.off()

}
