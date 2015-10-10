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
      gap<-as.numeric(as.character(plotdata$Global_active_power))
      dt<-strptime(paste(as.character(plotdata$Date),as.character(plotdata3$Time)),"%d/%m/%Y %H:%M:%S")

      #open your gr and plot!
      png(file="plot2.png")
      plot(dt, gap, yaxp=c(2,6,2), xlab = "", ylab="Global Active Power (kilowatts)", type="l")
      dev.off()
     
}
