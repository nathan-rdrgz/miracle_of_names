AddUpDigits <-Vectorize(function(x) {
  while (x > 9) {
    x <- sum(as.numeric(strsplit(as.character(x), "")[[1]]))
  }
  return(x)
})


GetCombo <- function(dt){
  
  # give a dt with one name column
  dt2 <- unique(dt[, .(name, name_lc = tolower(name))])
  
  # determin how many instances of each lett there are in the name
  for (letter in letters){
    dt2[, paste0(letter) := str_count(name_lc, pattern = letter)]
  }
  
  # key chart multiplication
  dt2[, a := a*1]
  dt2[, b := b*2]
  dt2[, c := c*3]
  dt2[, d := d*4]
  dt2[, e := e*5]
  dt2[, f := f*6]
  dt2[, g := g*7]
  dt2[, h := h*8]
  dt2[, i := i*9]
  dt2[, j := j*1]
  dt2[, k := k*2]
  dt2[, l := l*3]
  dt2[, m := m*4]
  dt2[, n := n*5]
  dt2[, o := o*6]
  dt2[, p := p*7]
  dt2[, q := q*8]
  dt2[, r := r*9]
  dt2[, s := s*1]
  dt2[, t := t*2]
  dt2[, u := u*3]
  dt2[, v := v*4]
  dt2[, w := w*5]
  dt2[, x := x*6]
  dt2[, y := y*7]
  dt2[, z := z*8]
  
  # summations
  # Y exception; if no other vowels treat y as vowel
  dt2[, vowels := ifelse((a+e+i+o+u) == 0, y, (a+e+i+o+u))]
  # count consonants
  dt2[, consonants := rowSums(.SD), .SDcols = c(3:5,7:9,11:15,17:21,23:25,27)+1]
  dt2[, consonants := ifelse(y!=vowels,consonants+y,consonants)]
  # count total
  dt2[, tot := vowels+consonants]
  
  # break up sums
  dt2[, vowels := AddUpDigits(vowels)]
  dt2[, consonants := AddUpDigits(consonants)]
  dt2[, tot := AddUpDigits(vowels+consonants)]
  dt2[, combo := paste0(vowels,'-',consonants,'-',tot)]
  return(dt2[, .(name, combo)])
}

NumToCombo <- function(number){
  number_str <- as.character(number)
  number_str <- paste(strsplit(number_str, "")[[1]], collapse = "-")
  return(number_str)
}

createCombinationTable <- function(dataTable1, dataTable2) {
  
  # Add a temporary key column to both data tables
  dataTable1[, key := 1]
  dataTable2[, key := 1]
  
  # Perform a cartesian join to get all combinations
  combinationTable <- CJ(dataTable1$name, dataTable2$name)
  
  # Remove the temporary key column
  #combinationTable[, key := NULL]
  
  return(combinationTable)
}

