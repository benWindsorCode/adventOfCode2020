∇Out←p2second;In;Stripped;Idx;Restrictions;Chars;Passwords;FirstLetter;SecondLetter
 In←(⊃⎕NGET'input/p2.txt' 1)
 ⍝ Remove the : and - and then split the string on whitespace
 Stripped←{(' '(≠⊆⊢)⍵)}¨{New←⍵ ⋄ New[⍸(New='-')∨(New=':')]←' ' ⋄ New}¨In
 ⍝ Split into three arrays, one of the min/max, one of the letters to check, one of the passwords
 Idx←⍳⍴Stripped
 Restrictions←2(⊃⍴Stripped)⍴Stripped[(Idx∘.,1),(Idx∘.,2)]
 (Chars)(Passwords)←(Stripped[Idx∘.,3])(Stripped[Idx∘.,4])
 ⍝ Convert restriction digits from strings to integers
 (Restrictions[1;])(Restrictions[2;])←(⍎¨Restrictions[1;])(⍎¨Restrictions[2;])
 ⍝ Extract the required letters, then perform an XOR and sum
 FirstLetter←Passwords[Idx,¨Restrictions[1;]]=Chars
 SecondLetter←Passwords[Idx,¨Restrictions[2;]]=Chars
 Out←+/FirstLetter≠SecondLetter
∇
