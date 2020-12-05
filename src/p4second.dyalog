∇Out←p4second;In;Grouped;KeyValue;Keys;Required;HaveAllKeys;Byr;Iyr;Eyr;Hgt;Hcl;Ecl;Pid
 In←⊃⎕NGET'input\p4.txt' 1
 ⍝ Group detecting the double \n\n as an elem of length zero
 Grouped←In⊆⍨∊{0<⍴⍵}¨In
 ⍝ Split on space and fiddle to join so each elem of group is an array of passport key value pairs
 Grouped←(⊃⊃/)¨,/¨{⍵⊆⍨⍵≠' '}¨¨Grouped
 KeyValue←{⍵⊆⍨⍵≠':'}¨¨Grouped
 ⍝ Extract the first element of each pair and check which required are there
 Keys←{⊃⍵}¨¨KeyValue
 Required←'byr' 'iyr' 'eyr' 'hgt' 'hcl' 'ecl' 'pid'
 ⍝ Valid passports have all 7 keys, first get only these
 HaveAllKeys←(7≥⍨{+/⍵∊Required}¨Keys)/KeyValue
 ⍝ THIS IS NOT A NICE SOLUTION AT ALL, couldn't get the nesting to play nicely to turn into a function
 Byr←⍎¨(⊃⊃)¨{⍵[2]}¨¨({+/⍵∊⊆'byr'}¨¨HaveAllKeys)/¨HaveAllKeys
 Iyr←⍎¨(⊃⊃)¨{⍵[2]}¨¨({+/⍵∊⊆'iyr'}¨¨HaveAllKeys)/¨HaveAllKeys
 Eyr←⍎¨(⊃⊃)¨{⍵[2]}¨¨({+/⍵∊⊆'eyr'}¨¨HaveAllKeys)/¨HaveAllKeys
 Hgt←(⊃⊃)¨{⍵[2]}¨¨({+/⍵∊⊆'hgt'}¨¨HaveAllKeys)/¨HaveAllKeys
 Hcl←(⊃⊃)¨{⍵[2]}¨¨({+/⍵∊⊆'hcl'}¨¨HaveAllKeys)/¨HaveAllKeys
 Ecl←(⊃⊃)¨{⍵[2]}¨¨({+/⍵∊⊆'ecl'}¨¨HaveAllKeys)/¨HaveAllKeys
 Pid←(⊃⊃)¨{⍵[2]}¨¨({+/⍵∊⊆'pid'}¨¨HaveAllKeys)/¨HaveAllKeys
 ⍝ Check each condition
 Byr←(Byr≥1920)∧(Byr≤2002)
 Iyr←(Iyr≥2010)∧(Iyr≤2020)
 Eyr←(Eyr≥2020)∧(Eyr≤2030)
 Hcl←{(7=⍴⍵)∧(⍵[1]='#')∧(∧/(1↓⍵)∊'0123456789abcdef')}¨Hcl
 Ecl←Ecl∊'amb' 'blu' 'brn' 'gry' 'grn' 'hzl' 'oth'
 Pid←{(∧/⍵∊'0123456789')∧(9=⍴⍵)}¨Pid
 ⍝ Deal with Height separately, first for any which dont have cm/in at the end replace with 000cm invalid but with the postfix
 Hgt[⍸~{(2=+/⍵∊'cm')∨(2=+/⍵∊'in')}¨Hgt]←(+/~{(2=+/⍵∊'cm')∨(2=+/⍵∊'in')}¨Hgt)⍴(⊆'000cm')
 Hgt←{Val←⍎¯2↓⍵ ⋄ Unit←¯2↑⍵ ⋄ ((∧/Unit='cm')∧(Val≥150)∧(Val≤193))∨((∧/Unit='in')∧(Val≥59)∧(Val≤76))}¨Hgt

 Out←+/(Byr∧Iyr∧Eyr∧Hgt∧Hcl∧Ecl∧Pid)
∇
