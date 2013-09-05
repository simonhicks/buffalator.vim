# Buffalator

The world's tiniest buffer management menu for vim. The basic premise is that
as nice as vim's buffer commands are, they all operate on buffer numbers and I'm
buggered if I can remember them. What Buffalator does is print a list of all
your currently active buffers, along with their buffer numbers and then wait for
input. Options are:

- *A number:* If you enter a number, buffalator will switch to that buffer.

- *Nothing:* If you hit enter without entering anything, buffalator will do
  nothing.

- *An ex command:* If you enter anything else, buffalator will execute it
  exactly as you wrote it, and then print the new list of buffers.

There is only one command (:Buffalate) and it either takes no arguments, or it
takes a regex to use as a filter for the list. Basically it's just a way to see
which buffer numbers correspond to which file names while you execute a series
of vim commands.

