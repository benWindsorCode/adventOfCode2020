∇Out←p6second;In;Grouped
 In←⊃⎕NGET'input\p6.txt' 1
 Grouped←In⊆⍨∊0≠⍴¨In
 Out←+/{⍴⊃⍵}¨(∩/)¨Grouped
∇
