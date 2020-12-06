∇Out←p6;In;Grouped
 In←⊃⎕NGET'input\p6.txt'1
 ⍝ Group on new lines then flatten each group into one string
 Grouped←∊¨In⊆⍨∊0≠⍴¨In
 ⍝ Per group count unique elems and sum accross groups
 Out←+/(⍴∪)¨Grouped
 ∇
