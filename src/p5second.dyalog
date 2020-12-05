∇Out←p5second;In;F;B;L;R;Row;Seat;Rows;Seats;RowSeatPairs;TicketPairs;MissingPairs
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
 ⍝ Create list of all possible seats + all seats with tickets, return those with no ticket
 RowSeatPairs←,(⍳128)∘.,(⍳8)
 TicketPairs←(Row¨In),¨(Seat¨In)
 MissingPairs←RowSeatPairs[⍸~RowSeatPairs∊TicketPairs]
 ⍝ Examining output there is obvious seat which has no pass, but before all the missing rows start
 Out←MissingPairs
∇
