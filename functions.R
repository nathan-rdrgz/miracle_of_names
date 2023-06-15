add_up_digits <-Vectorize(function(x) {
  while (x > 9) {
    x <- sum(as.numeric(strsplit(as.character(x), "")[[1]]))
  }
  return(x)
})


GetCombo <- function(dt){
  # give a dt with one name column
  dt2 <- unique(dt[, .(name, name_lc = tolower(name))])
  
  for (letter in letters){
    dt2[, paste0(letter) := str_count(name_lc,pattern = letter)]
  }
}