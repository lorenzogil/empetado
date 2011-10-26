WHY EMPETADO?
=============

empetado stands for EMacs Python Enhanced Tight Ass DOmination. It's a funny
word in Spanish, but you won't find it in your usual dictionary. Let's just say
that it refers to this configuration being full of coolness, awesomeness and
wonderfulness.

empetado is basically my emacs configuration, anything I find useful will
probably find its way here. The first thing I wanted to have was good Python
support, but there are more things in there, like git and subversion support,
org-mode, ido/smex, yasnippet, desktop-mode, EMMS, undo-tree,
browse-kill-ring...

empetado is intended for Emacs 24, it may work on Emacs 23, but it's
untested. If you use Debian/Ubuntu you can get packages for Emacs 24 from
`emacs.naquadah.org`_.

You might want to take a look at the TIPS file, it's got some useful commands
and key shortcuts (if you think some cool combination is missing, please send me
a note, I'm a keyboard shortcut junkie).

Are you wondering why the "Tight Ass"? Because `sexy sells!`_

.. _emacs.naquadah.org: http://emacs.naquadah.org/
.. _sexy sells!: http://www.reynoldsftw.com/2009/04/sexy-sells-i-have-the-stats-to-prove-it/

INSTALLATION
============

Clone the repository at ~/.emacs.d::

 $ git clone git@github.com:haplo/empetado.git ~/.emacs.d

Get code from git submodules::

 $ cd ~/.emacs.d/
 $ git submodule init
 $ git submodule update

Create a file with your user preferences::

 $ cp user_preferences.el.default user_preferences.el

empetado uses `el-get`_ to install and update packages. Before starting emacs
for the first time remember to check the `dependencies`_ section to install the
required programs. Then you only have to start Emacs once to have `el-get`_
download and install the configured packages. This may take some time, so be
patient. When it's finished, close Emacs and start it again, and everything
should be working fine. If something didn't install correctly I recommend
deleting the *~/emacs.d/el-get/* directory completely and restarting Emacs
to force a complete reinstall of all packages.

And that's all! Remember to edit *user_preferences.el* to define your preferences
and personal.

Enjoy!

.. _el-get: https://github.com/dimitri/el-get

DEPENDENCIES
============

empetado only supports Emacs 24. It probably works with Emacs 23 too, but it's
untested. Other versions of Emacs or XEmacs are unlikely to work out of the box.

Make sure you have the following dependencies installed and configured in your
system before installing empetado, they're required for el-get to install the
Emacs packages that empetado uses:

 * *autoconf* and *make* (just install **build-essentials** in Debian/Ubuntu)
 * *git* (**git-core** package in Debian/Ubuntu).
 * *mpg321*, *ogg123*, *mplayer* (for use by EMMS).
 * *makeinfo* (for installing magit, **texinfo** package in Debian/Ubuntu).
 * reStructuredText tools (**python-docutils** package in Debian/Ubuntu).
 * *CVS* (**cvs** package in Debian/Ubuntu).
 * *w3m* (as a dependency for EMMS, **w3m** package in Debian/Ubuntu).
 * *Subversion* (optional, **subversion** package in Debian/Ubuntu).
