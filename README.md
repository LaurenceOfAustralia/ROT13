# ROT13

Two toy programs that respectively allow you to encode some text in a ROT cipher of your choosing and to work out which cypher some text was encoded in.

## rot13.rb

Encodes text with ROT cypher of your choosing.

`rot13.rb {offset} {content}`

## rot13_solver

Attempts to work out what ROT cypher is needed to decode some text, through word matching. Works better with longer texts.

`rot13_solver.rb {content_to_solve}`