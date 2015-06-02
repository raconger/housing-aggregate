library(XML)
library(stringr)

# returns string w/o leading whitespace
trim.leading <- function (x)  sub("^\\s+", "", x)

# returns string w/o trailing whitespace
trim.trailing <- function (x) sub("\\s+$", "", x)

# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

fileUrl <- "http://www.marchantpm.com/search-our-properties?action=search&type=Home&location=&county=&address=&subdivision=&bedsmin=&bedsmax=&bathsmin=&bathsmax=&pricemin=&pricemax=&submit=Search"
html.raw <- htmlTreeParse(fileUrl,useInternal=TRUE)

thepage <- readLines(fileUrl)

# mypattern = '<p><a href=">([^<]*)">View Property Details</a></p>'
mypattern = '<p><a href="'
endpattern = "\">View Property Details</a></p>"
datalines = grep(mypattern,thepage,value=TRUE)
datalines2 = gsub(mypattern,'',datalines)
datalines3 = gsub(endpattern,'',datalines2)
trimURLs <- trim.leading(datalines3)

html.frame <- data.frame(html.raw)
html.raw[2] <- htmlTreeParse(fileUrl,useInternal=TRUE)

col_headings <- c('Address','Price', 'Sqft', 'County', 'Beds', 'Baths', 'Halfbaths', 'Garage')
names(dataframe) <- col_headings

for (i in 1:length(trimURLs)) {
  temp <- htmlTreeParse(trimURLs[i],useInternal=TRUE)
}
