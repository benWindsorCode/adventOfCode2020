∇Out←p9;In;Idx;SumIdx;Sums;TestVal
 In←⍎¨⊃⎕NGET'input\p9.txt' 1
 ⍝ Given an index and list, perform the check on the index+25th number using the Index, Index+1, ,,, Index+24 numbers
 TestVal←{Idx←(⍺-1)+⍳25 ⋄ SumIdx←(,(⍳25)∘.,(⍳25))~(⍳25),¨(⍳25) ⋄ Sums←⍵[Idx]∘.+⍵[Idx] ⋄ ⍵[(⍺-1)+26]∊Sums[SumIdx]}
 ⍝ Find the first value which fails, and return the number 25 ahead, which is where the value that failed was
 Out←In[25+⍸~{⍵ TestVal In}¨⍳(26-⍨⍴In)]
∇
