∇Out←p6second;In;Grouped
 In←⊃⎕NGET'input\p6.txt' 1
 ⍝ Create array where each elem is a sub array of each persons responses
 Grouped←In⊆⍨∊0≠⍴¨In
 ⍝ Reduce unique op over each sub array, count and sum
 Out←+/{⍴⊃⍵}¨(∩/)¨Grouped
∇
