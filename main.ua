# Experimental!
I ~ "git: github.com/Marcos-cat/iris" ~ Color Draw Key Mouse Net T

Size ← 500

Margin ← 0.15
Cell   ← ÷₃¬×₂Margin

~ {
  Port ← ""
  Connection
  MyTurn ← ∞
  Board ← ↯3_3@\s
  BadMove ← 0
  Symbol ← ∞
}

Move ← ⍜⊡⋅⊸Symbol

TryMove ← ⍜⊙⊸Board(
  ⨬(⋅⊙(°⊸BadMove1)|Move) ◡(=@\s⬚@-⊡)
)

Text ← Draw~Text Centered:1 Font:"Uiua386.ttf"Color~Text

Code ← +@A⊥26

SubmitPort ← °⊸Symbol⊃(˜⊏"XO" <⊙Net~Port|⍜⊙Connection Net~Connect) ⊸(°Code Port)

Connecting ← (
  ⍜Port(▽⊸±⌵Key~Input)
  Key~Pressed‼@\n SubmitPort
  Key~Pressed‼@\s⊸(°&clip Code Net~Port Connection)
  ⊸(Text 100 250_100 Code Net~Port Connection)
  ⊸(Text 100 250_200 Port)
)

Playing ← (
  Mouse!Pressed‼Left(TryMove ⌊÷Cell-Margin÷Size T~Coords)
  Key~Pressed‼@\s⍜(˜⊗"XO"Symbol)¬
  ⊸(
    Text 100 ×Size+Margin×Cell +0.5⇡3_3 ⍉¤Board
  )
  Draw~Line Color~Text 5 ∩⌟(⊂≡(⊸⇌ ×Size ⊂)) ⊸¬ ⟜+Margin ⊟⊸×₂ Cell
)

New Net~Start

I~Open Size "Tic Tac Two"
I~Window!°FPS 60

I~Loop!(
  Draw~Background Color~Base
  ⨬(Connecting|Playing) ⊸(Net~Connected Connection)
)

Net~End Connection
