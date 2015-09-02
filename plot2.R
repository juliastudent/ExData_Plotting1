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
      gap<-as.integer(plotdata$Global_active_power)
      dt<-strptime(paste(plotdata$Date,plotdata$Time),"%d/%m/%Y %H:%M:%S")

      #open your gr and plot!
      png(file="plot2.png")
      plot(dt, gap, ylab="Global Active Power (kilowatts)", type="l")
      dev.off()

}
