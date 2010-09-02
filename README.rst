WHY EMPETADO?
=============

empetado stands for EMacs Python Enhanced Tight Ass DOmination. It's a funny
word in Spanish, but you won't find it in your usual dictionary. Let's just say
that it refers to this configuration being full of coolness, awesomeness and
wonderfulness.

empetado is basically my emacs configuration, anything I find useful will
probably find its way here. The first thing I wanted to have was good Python
support (hint: it didn't come first, nor second, nor third...), but there are
more things in there, like git and subversion support, org-mode, ido/smex,
yasnippet, desktop-mode, EMMS...

You might want to take a look at the TIPS file, it's got some useful commands
and key shortcuts (if you think some cool combination is missing, please send me
a note, I'm a keyboard shortcut junkie).

Are you wondering why the "Tight Ass"? Because `sexy sells!`_

.. _sexy sells!: http://www.reynoldsftw.com/2009/04/sexy-sells-i-have-the-stats-to-prove-it/

INSTALLATION
============

Clone the repository at ~/.emacs.d::

 $ git clone git@github.com:haplo/empetado.git ~/.emacs.d

Get code from git submodules::

 $ cd ~/.emacs.d/
 $ git submodule init
 $ git submodule update

Link the main configuration file as ~/.emacs::

 $ ln -s ~/.emacs.d/dotemacs ~/.emacs

And that's all! Remember to edit user_preferences.el to at least change your
email address.

Enjoy!

DEPENDENCIES
============

empetado configures the following modes and external elisp files. Those
available using package tools (APT for Debian in my case) are supposed to be
installed system-wide. Those that aren't are either bundled in Emacs 23 or
included in empetado's configuration.

empetado only supports Emacs 23, it may or may not work with earlier versions
or XEmacs.

An incomplete list:

 * Color theme (color-theme.el, emacs-goodies-el package).
 * Desktop-mode.
 * Django HTML template mode (django-html-mode.el).
 * EMMS (Emacs MultiMedia System) (emms package).

   * Requires mpg321, ogg123 and mplayer.
   * emms-get-lyrics requires w3m.

 * Wonderful file and buffer finding (ido.elc is bundled with Emacs 23).
 * (Good) Subversion support (psvn.el, subversion package).
 * emacs-for-python (http://github.com/gabrielelanaro/emacs-for-python).
 * reStructuredText mode (rst.el, python-docutils package).
 * Better buffer renaming (uniquify.el, bundled since Emacs 22).
 * yasnippet (yasnippet.el, yasnippet package).
 * Org-mode (bundled in Emacs 22 and 23).
 * nxml-mode (bundled in Emacs 23).
 * ERC (IRC client, erc package in Debian).
 * magit (a Git frontend, http://philjackson.github.com/magit/).
 * no-word (open Word files as plain text, requires antiword).
 * browse-kill-ring (emacs-goodies-el package in Debian)
