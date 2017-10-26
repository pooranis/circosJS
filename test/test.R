
chr <- as.data.frame(t(c(len=100, id="chr1")))

df <- data.frame(start=c(1,30), end=c(10,70), block_id="chr1", type=c("red", "blue"))

ch <- circoshighlight(df, sectors = chr, color=c("red", "blue"), colorcat = "type", width = 500, height = 500)
