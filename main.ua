# Experimental!
I ~ "git: github.com/Marcos-cat/iris"

Size   ← 500
Margin ← 0.15
Cell   ← ÷₃¬×₂Margin
~ {
  OtherPort ← ""
  Tunnel
  MyTurn ← ∞
  Board ← ↯3_3@\s
  Symbol ← @X
}
MyPort ← I~Net~Port Tunnel

Win     ← /∨/×⍉⊂⊃(⊟∩⌞⌝⤸⊚2⊸⇌|⊂⊸⍉)
Won     ← Win=⊃(Symbol|Board)
Lost    ← Win=⊃(⍜(˜⊗"OX")¬Symbol|Board)
Move    ← ⊙(°⊸MyTurn0) ◡(I~Net~Give⊙Tunnel) ⍜⊡⋅⊸Symbol
TryMove ← ⍜⊙⊸Board(⨬◌Move ◡(=@\s⬚@-⊡))
Text    ← I~Draw~Text Centered:1 Font:"Uiua386.ttf" I~Color~Text
Message ← Text 40 ÷2_16Size
Code    ← +@A⊥26
SubmitPort ← (
  ⊃(<⊙MyPort|⍜⊙Tunnel I~Net~Connect) ⊸(°Code OtherPort)
  °⊸⊃(Symbol|MyTurn) ⊸˜⊏"OX"
)
DrawBoard ← (
  I~Draw~Line I~Color~Text 5 ∩⌟(⊂≡(⊸⇌ ×Size ⊂)) ⊸¬ ⟜+Margin ⊟⊸×₂ Cell
  Text 100 ×Size+Margin×Cell +0.5⇡3_3 ⍉¤Board
)
Connecting ← (
  ⍜OtherPort(▽⊸±⌵I~Key~Input)
  I~Key~Pressed‼@\n SubmitPort
  Message "Enter code"
  ⊸(Text 100 ℂ250 [100 200] ⊃{Code MyPort|OtherPort})
)
Playing ← (
  ⊸MyTurn
  ⨬(I~Net~Get!(°⊸MyTurn1 °⊸Board)⊸Tunnel
    Message "Waiting for other player..."
  | I~Mouse!Pressed‼Left(TryMove ⌊÷Cell-Margin÷Size I~T~Coords)
    Message "Make a move!")
  ⊸DrawBoard
)
Done ← ⊸⊃(Message ⨬"You lost :(""You won!" Won|DrawBoard)

New I~Net~Start LocalPort:+⚂₁₀₀ 8080

I~Open Size "Tic Tac Two"
I~Window!°FPS 30
I~Loop!(
  Draw~Background Color~Base
  ⨬(Connecting|Playing|Done)⊗1 ⊸⊃[¬I~Net~Connected Tunnel|¬∨⊃Won Lost]
)
I~Net~End Tunnel
