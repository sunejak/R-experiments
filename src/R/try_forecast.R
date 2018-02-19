#
# with inspiration from: http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html
#
indat <- scan('January_2018.log', what=list("","","","","","","","","","","","","","","","",""), flush=TRUE)
str(indat)

totalTime <- as.numeric(indat[[2]]);
freeMem <- as.double(indat[[11]]);
findfrequency(freeMem);

minuteInput <- unlist(strsplit(indat[[9]], "Check=", fixed = TRUE))[c(FALSE,TRUE)];
# Get the day of the invocation
dayInput <- substr(indat[[12]], 7, 16);
# Merge day and time
sampleTime <- paste(dayInput, minuteInput);
# Convert to time input 
timeForSample <- strptime( sampleTime, "%Y_%m_%d %H_%M_%S");
summary(timeForSample)

df <- data.frame(timeForSample, freeMem);

require("forecast");
# show frequency of the data
findfrequency(df);
findfrequency(freeMem);

# when did we run on instance 2
timeForSample[indat[[17]] == '2']

# show decompose
dataset45 <- ts(freeMem, frequency=45);
png("dataset45.png", width=1268, height=951);
plot(decompose(dataset45));
dev.off()

dataset48 <- ts(df, frequency=48);
png("dataset48.png", width=1268, height=951);
plot(timeForSample, freeMem, col=grey(.5))
grid()
# symmetric filtering of 200 samples
lines(timeForSample, filter(freeMem, rep(1/200, 200), sides=2), col="red")
dev.off()

auto.arima(dataset45)
# Series: dataset45
# ARIMA(5,1,5)(2,0,0)[45]


iii <- ts(freeMem, frequency=1440, start=c(0,0))
plot(decompose(iii, type="multiplicative"))
plot(decompose(iii, type="additive"))

