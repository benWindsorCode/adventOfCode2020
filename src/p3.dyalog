∇Out← StepDown p3 StepRight;In;Height;Width;Steps
 ⍝ For the modular arithmetic index this task from zero
 ⎕IO←0
 ⍝ Pull in the data and shape into clean matrix (not nice to hardcode size here)
 In←323 32⍴(⊃⎕NGET'input/p3.txt')
 ⍝ Sneaky space char at end of each line, strip this off
 In←In[;⍳31]
 (Height)(Width)←(⍴In)[0,1]
 ⍝ Step down, modulo the width (dropping the 0,0 coord), pull out 'trees' and sum where tree present
 Steps←⌈(Height÷StepDown)
 Out←+/In[1↓(StepDown×⍳Steps),¨(Width|StepRight×⍳Steps)]='#'
∇
