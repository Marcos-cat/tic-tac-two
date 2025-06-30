# Experimental!
I ~ "git: github.com/Marcos-cat/iris" ~ Color Draw Key Mouse T

Size ← 500

I~Open Size "Tic Tac Two"
I~Window!°FPS 60

Margin    ← 0.15
Cell      ← ÷₃¬×₂Margin
DrawBoard ← Draw~Line Color~Text 5 ∩⌟(⊂≡(⊸⇌ ×Size ⊂)) ⊸¬ ⟜+Margin ⊟⊸×₂ Cell

↯3_3@\s

I~Loop!(
  Draw~Background Color~Base

  Mouse!Pressed‼Left(⍜⊙⊡⊙◌@X ⌊÷Cell-Margin÷Size T~Coords)
  Mouse!Pressed‼Right(⍜⊙⊡⊙◌@O ⌊÷Cell-Margin÷Size T~Coords)

  Draw~Text Centered:1 Font:"Uiua386.ttf" Color~Text 100 ×Size+Margin×Cell +0.5⇡3_3⊸(⍉¤)

  DrawBoard
)


