∇Out←p5;In;F;B;L;R;Row;Seat;Rows;Seats
 ⎕IO←0
 In←⊃⎕NGET'input/p5.txt' 1
 ⍝ Create operators whose names match the input chars, taking a list and keeping upper/lower half
 F←{⍵[(2÷⍨⍴⍵)↑⍳⍴⍵]}
 B←{⍵[(2÷⍨⍴⍵)↓⍳⍴⍵]}
 L←F
 R←B
 ⍝ Apply 'execute' to each char, so the respective op is called in sequence
 Row←{(⍎⍵[6])(⍎⍵[5])(⍎⍵[4])(⍎⍵[3])(⍎⍵[2])(⍎⍵[1])(⍎⍵[0])⍳128}
 Seat←{(⍎⍵[9])(⍎⍵[8])(⍎⍵[7])⍳8}
 ⍝ Return ceil applied over Seat+8×Row as required from puzzle
 Out←⌈/(Seat¨In)+8×(Row¨In)
∇
