library(data.table)
library(stringr)
library(shiny)
library(DT)

source('functions.R')

# get census names
#git  <<- 'https://raw.githubusercontent.com/'
#git1 <<- paste0(git,'hadley/data-baby-names/master/baby-names.csv')
#git2 <<- paste0(git,'fivethirtyeight/data/master/most-common-name/surnames.csv')
#dtF <<- fread(git1)
#dtL <<- fread(git2)
#firstDT <<- GetCombo(dtF[, .(name)])
#lastDT  <<- GetCombo(dtL[, .(name)])
#fwrite(firstDT, 'data/first_names.csv')
#fwrite(lastDT, 'data/last_names.csv')


firstDT <<- fread('data/first_names.csv')
lastDT  <<- fread('data/last_names.csv')
