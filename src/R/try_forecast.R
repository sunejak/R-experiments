#
# with inspiration from: http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html
#
indat <- scan('week_42_2017.log', what=list("","","","","","","","","","","","","","","","",""), flush=TRUE)

totalTime <- as.numeric(indat[[2]]);

minuteInput <- unlist(strsplit(indat[[9]], "Check=", fixed = TRUE))[c(FALSE,TRUE)];
# Get the day of the invocation
dayInput <- substr(indat[[12]], 7, 16);
# Merge day and time
sampleTime <- paste(dayInput, minuteInput);
# Convert to time input 
timeForSample <- strptime( sampleTime, "%Y_%m_%d %H_%M_%S");

df <- data.frame(timeForSample, freeMem)

iii <- ts(freeMem, frequency=1440, start=c(0,0))
plot(decompose(iii, type="multiplicative"))
plot(decompose(iii, type="additive"))

