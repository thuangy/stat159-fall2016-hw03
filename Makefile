report = report/report.pdf
eda = data/eda-output.txt
reg = data/regression.RData
ad = data/Advertising.csv
eda-script = code/scripts/eda-script.R
reg-script = code/scripts/regression-script.R

.PHONY: all data tests eda regression report clean

all: eda regression report

data: 
	curl -o $(ad) http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests:
	Rscript code/test-that.R

report: $(reg) report/report.Rmd data/correlation-matrix.RData  data/regression.RData images/scatterplot-matrix.png
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"

eda: $(eda-script) $(ad)
	Rscript $(eda-script)

regression: $(reg-script) $(ad)
	Rscript $(reg-script)

clean:
	rm -f $(report)