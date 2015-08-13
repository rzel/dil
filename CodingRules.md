# Coding Rules #
You must adhere to the following rules, if you would like to contribute code to this project:

  * Indent with two spaces. No tabs.
  * 80 characters per line is pretty much a strict limit (only to be broken if absolutely necessary.)
  * All Ddoc comments start with three slashes, e.g.: `/// Returns xyz.`
  * One space between keyword and left parenthesis, e.g.: `while (something() == 1)`
  * Curly braces are always on a new line. Exception: a control statement with only two inner statements.
  * List internal imports first, then foreign (Tango) imports.
  * Goto labels start with a capital L, e.g.: `goto Lerr;`

# Commit Messages #

  * A commit message starts with a relevant keyword or the name of a package or module, followed by a colon.
  * Use a short descriptive message on the first line that describes the main changes.
  * Enter two newlines to add more explanations if necessary.
  * Always mind the 80chars/line limit.
Example:
<pre>
Parser: recognise 3 more errors in parseParameterList().<br>
<br>
* Removed the out-contract from the function.<br>
Issue a parser error instead.<br>
* Added some comments.<br>
</pre>