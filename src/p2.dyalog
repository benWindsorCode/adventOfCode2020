∇Passed←p2;In;Stripped;Idx;Restrictions;Chars;Counts;Passed;Passwords;Passed
 In←(⊃⎕NGET'input/p2.txt' 1)
 ⍝ Remove the : and - and then split the string on whitespace
 Stripped←{(' '(≠⊆⊢)⍵)}¨{New←⍵ ⋄ New[⍸(New='-')∨(New=':')]←' ' ⋄ New}¨In
 ⍝ Split into three arrays, one of the min/max, one of the letters to check, one of the passwords
 Idx←⍳⍴Stripped
 Restrictions←2(⊃⍴Stripped)⍴Stripped[(Idx∘.,1),(Idx∘.,2)]
 (Chars)(Passwords)←(Stripped[Idx∘.,3])(Stripped[Idx∘.,4])
 ⍝ Convert restriction digits from strings to integers
 (Restrictions[1;])(Restrictions[2;])←(⍎¨Restrictions[1;])(⍎¨Restrictions[2;])
 ⍝ For each password turn to 1,0 where it matches the specified char, sum occurance, then check if passed and sum how many
 Counts←{+/⍵}¨Passwords=Chars
 Passed←+/(Counts≥Restrictions[1;])∧(Counts≤Restrictions[2;])
∇
