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
MyPort ← Net~Port Connection

# ? Cell Board Game
Move ← ⊙(°⊸MyTurn0) ◡(Net~Give⊙Connection) ⍜⊡⋅⊸Symbol

TryMove ← ⍜⊙⊸Board(
  ⨬(⋅⊙(°⊸BadMove1)|Move) ◡(=@\s⬚@-⊡)
)

Text    ← Draw~Text Centered:1 Font:"Uiua386.ttf" Color~Text
Message ← Text 40 ÷2_16Size

Code ← +@A⊥26

SubmitPort ← (
  ⊃(<⊙MyPort|⍜⊙Connection Net~Connect) ⊸(°Code Port)
  °⊸⊃(Symbol|MyTurn) ⊸˜⊏"OX"
)

Connecting ← (
  ⍜Port(▽⊸±⌵Key~Input)
  Key~Pressed‼@\n SubmitPort
  Key~Pressed‼@\s⊸(°&clip Code MyPort)
  Message "Enter code"
  ⊸(Text 100 250_100 Code MyPort)
  ⊸(Text 100 250_200 Port)
)

# ? Game
Playing ← (
  ⊸MyTurn
  ⨬(Net~Get!(°⊸MyTurn1 °⊸Board)⊸Connection
    Message "Waiting for other player..."
  | Mouse!Pressed‼Left(TryMove ⌊÷Cell-Margin÷Size T~Coords)
  )

  Key~Pressed‼@\s⍜(˜⊗"XO"Symbol)¬
  ⊸(Text 100 ×Size+Margin×Cell +0.5⇡3_3 ⍉¤Board)
  Draw~Line Color~Text 5 ∩⌟(⊂≡(⊸⇌ ×Size ⊂)) ⊸¬ ⟜+Margin ⊟⊸×₂ Cell
)

New Net~Start Port:+⚂₁₀₀ 8080

I~Open Size "Tic Tac Two"
I~Window!°FPS 30

I~Loop!(
  Draw~Background Color~Base
  ⨬(Connecting|Playing) ⊸(Net~Connected Connection)
)

Net~End Connection
