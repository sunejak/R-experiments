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
findfrequency(df);
findfrequency(freeMem);

# when did we run on instance 2
timeForSample[indat[[17]] == '2']



iii <- ts(freeMem, frequency=1440, start=c(0,0))
plot(decompose(iii, type="multiplicative"))
plot(decompose(iii, type="additive"))

