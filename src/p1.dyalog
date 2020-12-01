InputData←⍎¨⊃⎕nget'input/p1.txt'1
Mult←{Coords←⊃(⍸(⍵∘.+⍵)=2020)[1] ⋄ ×/⍵[(⊃Coords)(⊃⌽Coords)]}
FirstAns←Mult InputData
Mult2←{Coords←⊃(⍸(⍵∘.+⍵∘.+⍵)=2020)[1] ⋄ ×/TestData[(Coords[1])(Coords[2])(Coords[3])]}
SecondAns←Mult2 InputData
