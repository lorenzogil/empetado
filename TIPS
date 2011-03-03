EMPETADO CHEATSHEET
===================

This is by no means a complete collection, just what I think is most useful.

Emacs Tricks
------------

`http://www.emacswiki.org/emacs/EmacsNiftyTricks`_
`http://www.reddit.com/r/programming/comments/8lfx7/what_emacs_commands_do_you_use_most_and_find_most/`_

 * ``M-m``: move to current line indentation
 * ``M-h``: mark paragraph
 * ``M-@``: mark word
 * ``C-M-f`` and ``C-M-b``: next/previous sexp
 * ``C-M-@``: mark sexp
 * ``C-x h``: mark entire buffer
 * ``C-x C-x``: exchange current position and mark
 * ``C-u C-SPC``: go to previous mark point
 * ``M-t``: transpose words
 * ``C-M-t``: transpose sexps
 * ``C-x r k``: kill rectangle
 * ``C-x r y``: yank rectangle
 * ``C-x r o``: open rectangle
 * ``C-x r c``: clear rectangle
 * ``C-x r t``: replaces rectangle with text
 * ``C-x (``: start macro
 * ``C-x )``: end macro
 * ``C-x e``: execute macro (keep pressing e to repeat)
 * ``F3`` and ``F4``: start/end macro, also insert macro count and repeat macro
 * ``M-g g`` or ``M-g M-g``: go to line
 * ``M-|``: filter region through shell command
 * ``M-\``: delete horizontal space
 * ``M-^``: delete indendation
 * ``C-M-\``: indent region

Ido
---

`http://www.emacswiki.org/emacs/InteractivelyDoThings`_

 * ``C-s`` and ``C-r``: next and previous match
 * ``C-f``: change to standard find-file (useful for opening multiple files)
 * ``C-t``: toggle regexp searching
 * ``C-p``: toggle between substring and prefix matching
 * ``C-c``: toggle case sensitivity matching
 * ``C-x C-d``: dired to current directory
 * ``M-n`` and ``M-p``: jump to previously used directories
 * ``M-s``: search files matching input in previously used directories
 * ``M-f`` and ``M-d``: search for files or directories

Undo-tree
---------

undo-tree.el upgrades the undo-redo system to work as a tree.

 * ``C-_``: undo.
 * ``M-_``: redo.
 * ``C-x u``: show undo tree.
 * ``C-x r u``: save undo status to register
 * ``C-x r U``: load undo status from register

Org-mode
--------

`http://orgmode.org/manual/index.html`_

 * ``C-a-a``: Agenda for current week
 * ``C-a-t``: Global list of TODO tasks
 * ``M-S-Return``: Insert new TODO task
 * ``C-c l``: Store link
 * ``C-c C-l``: Insert link (including stored links)
 * ``C-c C-t``: Mark task under the cursor as DONE
 * ``C-c C-s``: Schedule task under the cursor
 * ``C-c C-o``: Open link under the cursor
 * ``S-Tab``: Toggle headings folding
 * ``C-c C-x C-i``: Start clock on a task
 * ``C-c C-x C-o``: Stop clock and compute total time
 * ``C-c c``: Anytime, go to a special note taking org buffer.
 * ``C-c C-c``: In note capture mode, save changes and return.
 * ``C-c C-k``: In note capture mode, ignore changes and return.
 * ``C-c C-w``: In note capture mode, refile the entry and return.

For anniversaries and birthdays to appear in agenda mode create an org
file with one birthday per line in these formats::

  %%(diary-anniversary  month day) XYZ's birthday
  %%(diary-anniversary  month day year) XYZ is %d years old

Full info in `http://orgmode.org/manual/Weekly_002fdaily-agenda.html`_

Ropemacs
--------

`http://bitbucket.org/agr/ropemacs/src/tip/README.txt`_

 * ``C-c d``: show documentation
 * ``C-c f``: find ocurrences of name in the project
 * ``C-c g``: go to definition of name
 * ``C-x p f``: find file in project
 * ``C-x p n [mpfd]``: create new module|package|file|directory
 * ``C-c r r``: rename
 * ``C-c r l``: extract variable
 * ``C-c r m``: extract method
 * ``C-c r i``: inline
 * ``C-c r v``: move
 * ``C-c r x``: restructure
 * ``C-c r u``: use function
 * ``C-c r f``: introduce factory
 * ``C-c r s``: change signature
 * ``C-c r 1 r``: rename current module
 * ``C-c r 1 v``: move current module
 * ``C-c r 1 p``: module to package
 * ``C-c r o``: organize imports
 * ``C-c r n [vfcmp]``: generate variable|function|class|module|package
 * ``M-/``: shortcut for code assist
 * ``M-?``: shortcut for lucky code assist (automatically choose first option)

SVN (psvn)
----------

`http://www.xsteve.at/prg/emacs/psvn.el`_

``M-x svn-status`` or ``C-x M-v``, and there:

 * ``a``: add
 * ``A``: add (recursively)
 * ``b``: blame
 * ``c``: commit
 * ``C``: cp
 * ``D``: rm
 * ``g``: update
 * ``i``: info
 * ``l``: log
 * ``r``: revert
 * ``R``: mv
 * ``=``: diff
 * ``+``: mkdir
 * ``~``: get revision
 * ``^``: examine parent
 * ``m``: mark
 * ``u``: unmark
 * ``DEL``: unmark backwards
 * ``?``: toggle hide unknown files
 * ``_``: toggle hide unmodified files
 * ``* A``: mark added
 * ``* M``: mark modified
 * ``* D``: mark deleted
 * ``* *``: mark changed
 * ``* .``: mark by extension
 * ``* %``: mark by regexp
 * ``P l``: property list
 * ``P s``: property set
 * ``P C-i``: edit svn:ignore
 * ``P X e``: edit svn:externals
 * ``X v``: resolved
 * ``X X``: resolve conflicts
 * ``M-c``: cleanup

EMMS
----

 * ``s-z``: previous song
 * ``s-x``: start song
 * ``s-c``: show current song
 * ``s-v``: stop song
 * ``s-b``: next song
 * ``s-s``: toggle shuffle
 * ``s-left``: seek backward
 * ``s-right``: seek forward
 * ``C-x M-p``: show playlist
 * ``C-x M-f``: play a file
 * ``C-x M-d``: play a directory
 * ``C-x M-t``: play a directory (recursively)
 * ``C-x M-l``: show lyrics for current song
 * ``C-x M-g``: google for lyrics of the current song

ReST (rst-mode)
---------------

`http://docutils.sourceforge.net/docs/user/emacs.html`_

 * ``C-c C-a``: adjust section title
 * ``C-c C-n``: go to next section
 * ``C-c C-p``: go to previous section
 * ``C-c C-n``: go to next section
 * ``C-c C-c``: comment region
 * ``C-c C-l``: shift region left
 * ``C-c C-r``: shift region right
 * ``C-c C-b``: bullet list region
 * ``C-c C-e``: enumerate region
 * ``C-c C-d``: block region
 * ``C-c 1``: compile to HTML
 * ``C-c 4``: compile to PDF

ERC
---

 * ``C-c C-b``: change channel
 * ``C-c C-j``: join channel
 * ``C-c C-n``: list people in channel
 * ``C-c C-p``: quit channel
 * ``C-c C-q``: quit server
