#creates line graph of global active power by time

if(!file.exists("household_power_consumption.txt")){
      print("no file")      
      
} else {

      alldata<-read.table("household_power_consumption.txt", sep = ";", head=TRUE)

      # we are only looking at a couple of days
      plotdata1<-alldata[as.character(alldata$Date)==c("1/2/2007"),]
      plotdata2<-alldata[as.character(alldata$Date)==c("2/2/2007"),]
      plotdata<-rbind(plotdata1,plotdata2)                    
      rm(alldata)

      #prepare your x and y data vectors
      sm1<-as.numeric(as.character(plotdata$Sub_metering_1))
      sm2<-as.numeric(as.character(plotdata$Sub_metering_2))
      sm3<-as.numeric(as.character(plotdata$Sub_metering_3))
      dt<-strptime(paste(as.character(plotdata$Date),as.character(plotdata$Time)),"%d/%m/%Y %H:%M:%S")

      #open your gr and plot!
      png(file="plot3.png")
      plot(dt, sm1, xlab = "", ylab="Energy sub metering", type="l")
      lines(dt, sm2, col="red")
      lines(dt, sm3, col="blue")
      legend("topright",lty = 1, col = c("black","red","blue"),
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      dev.off()

}
