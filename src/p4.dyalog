∇ Out←p4;In;Grouped;KeyValue;Keys;Required;Count
  In←⊃⎕NGET'input\p4.txt' 1
  ⍝ Group detecting the double \n\n as an elem of length zero
  Grouped←In⊆⍨∊{0<⍴⍵}¨In
  ⍝ Split on space and fiddle to join so each elem of group is an array of passport key value pairs
  Grouped←(⊃⊃/)¨,/¨{⍵⊆⍨⍵≠' '}¨¨Grouped
  KeyValue←{⍵⊆⍨⍵≠':'}¨¨Grouped
  ⍝ Extract the first element of each pair and check which required are there
  Keys←{⊃⍵}¨¨KeyValue
  Required←'byr' 'iyr' 'eyr' 'hgt' 'hcl' 'ecl' 'pid'   
  ⍝ Valid passports have all of the 7 required keys, find and count the number of valid entries
  Out←+/7≥⍨{+/⍵∊Required}¨Keys
∇ 
