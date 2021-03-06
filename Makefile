.PHONY: all data clean

all: report/report.pdf data/eda-output.txt data/regression.Rdata

data: 
	curl -O "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"
	mv Advertising.csv data

report/report.pdf: report/report.Rmd data/regression.Rdata images/scatterplot-tv-sales.png
	cd report; Rscript -e '.libPaths(c("C:/Users/vlfgn/Documents/R/win-library/3.3", "C:/Users/vlfgn/Documents/R/win-library/3.3")); library(rmarkdown); render("report.Rmd")'
	
	
data/regression.Rdata: code/regression-script.R data/Advertising.csv
	cd code; Rscript regression-script.R
	
data/eda-output.txt: code/eda-script.R data/Advertising.csv
	cd code; Rscript eda-script.R
	
clean:
	rm -f report/report.pdf 
	
	