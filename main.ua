# Experimental!
I ~ "git: github.com/Marcos-cat/iris" ~ Color Draw Key Mouse Net T

Size   ← 500
Margin ← 0.15
Cell   ← ÷₃¬×₂Margin
~ {
  OtherPort ← ""
  Connection
  MyTurn ← ∞
  Board ← ↯3_3@\s
  Symbol ← @X
}
MyPort ← Net~Port Connection

Win     ← /∨/×⍉⊂⊃(⊟∩⌞⌝⤸⊚2⊸⇌|⊂⊸⍉)
Won     ← Win=⊃(Symbol|Board)
Lost    ← Win=⊃(⍜(˜⊗"OX")¬Symbol|Board)
Move    ← ⊙(°⊸MyTurn0) ◡(Net~Give⊙Connection) ⍜⊡⋅⊸Symbol
TryMove ← ⍜⊙⊸Board(⨬◌Move ◡(=@\s⬚@-⊡))
Text    ← Draw~Text Centered:1 Font:"Uiua386.ttf" Color~Text
Message ← Text 40 ÷2_16Size
Code    ← +@A⊥26
SubmitPort ← (
  ⊃(<⊙MyPort|⍜⊙Connection Net~Connect) ⊸(°Code OtherPort)
  °⊸⊃(Symbol|MyTurn) ⊸˜⊏"OX"
)
DrawBoard ← (
  Draw~Line Color~Text 5 ∩⌟(⊂≡(⊸⇌ ×Size ⊂)) ⊸¬ ⟜+Margin ⊟⊸×₂ Cell
  Text 100 ×Size+Margin×Cell +0.5⇡3_3 ⍉¤Board
)
Connecting ← (
  ⍜OtherPort(▽⊸±⌵Key~Input)
  Key~Pressed‼@\n SubmitPort
  ⊸Key~Pressed‼@\s(°&clip Code MyPort)
  Message "Enter code"
  ⊸(Text 100 ℂ250 [100 200] ⊃{Code MyPort|OtherPort})
)
Playing ← (
  ⊸MyTurn
  ⨬(Net~Get!(°⊸MyTurn1 °⊸Board)⊸Connection
    Message "Waiting for other player..."
  | Mouse!Pressed‼Left(TryMove ⌊÷Cell-Margin÷Size T~Coords)
    Message "Make a move!")
  ⊸DrawBoard
)
Done ← ⊸⊃(Message ⨬"You lost :(""You won!" Won|DrawBoard)

New Net~Start Port:+⚂₁₀₀ 8080

I~Open Size "Tic Tac Two"
I~Window!°FPS 30
I~Loop!(
  Draw~Background Color~Base
  ⨬(Connecting|Playing|Done)⊗1 ⊸⊃[¬Net~Connected Connection|¬∨⊃Won Lost]
)
Net~End Connection
