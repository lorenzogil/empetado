(add-to-list 'load-path "~/.emacs.d")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("GNU" . "http://elpa.gnu.org/packages/")
                         ("Marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

; load el-get, and download it if necessary
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq
 el-get-sources
 '((:name buffer-move         ; have to add your own keys
	  :after (lambda ()
               (global-set-key (kbd "<C-S-up>")     'buf-move-up)
               (global-set-key (kbd "<C-S-down>")   'buf-move-down)
               (global-set-key (kbd "<C-S-left>")   'buf-move-left)
               (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

   (:name smex				  ; a better (ido like) M-x
	  :after (lambda ()
               (setq smex-save-file "~/.emacs.d/.smex-items")
               (global-set-key (kbd "M-x") 'smex)
               (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit				  ; git meet emacs, and a binding
	  :after (lambda ()
               (setq magit-repo-dirs '("~/Code/"))
               (global-set-key (kbd "C-x C-g") 'magit-status)))

   (:name browse-kill-ring    ; navigate all entries in the kill ring
	  :after (lambda ()
               (global-set-key (kbd "C-c k") 'browse-kill-ring)
               (global-set-key (kbd "C-c C-k") 'browse-kill-ring)))
   (:name emms
	  :after (lambda ()
               (emms-all)
               (emms-default-players)
               ; show song name when changing tracks
               (add-hook 'emms-player-started-hook 'emms-show)
               ; libtag support
               (require 'emms-info-libtag)
               (setq emms-info-functions '(emms-info-libtag))
               ; allow seeking
               (require 'emms-player-mpg321-remote)
               (push 'emms-player-mpg321-remote emms-player-list)
               (push 'emms-player-mplayer emms-player-list)
               (push 'emms-player-mplayer-playlist emms-player-list)
               ; default directory
               (setq emms-source-file-default-directory "~/Music/")
               ; Faster file finding (won't work on Windows, but who cares?)
               (setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
               ; Current track name and time in modeline
               (emms-mode-line 1)
               (emms-playing-time 1)
               ; Show "Album - Artist - Track name [Duration]" as track info
               (defun my-emms-info-track-description (track)
                 "Return a description of the current track, including album,
  artist, track name and total duration if available."
                 (let ((pmin (emms-track-get track 'info-playing-time-min))
                       (psec (emms-track-get track 'info-playing-time-sec))
                       (ptot (emms-track-get track 'info-playing-time))
                       (alb  (emms-track-get track 'info-album))
                       (art  (emms-track-get track 'info-artist))
                       (tit  (emms-track-get track 'info-title)))
                   (if (and alb art tit)
                       (cond ((and pmin psec) (format "%s - %s - %s [%s:%s]" alb art tit pmin psec))
                             (ptot (format  "%s - %s - %s [%s:%02d]" alb art tit (/ ptot 60) (% ptot 60)))
                             (t (emms-track-simple-description track)))
                     (emms-track-simple-description track))))
               (setq emms-track-description-function 'my-emms-info-track-description)
               ; standard ZXCVB shortcuts (well, almost)
               (global-set-key (kbd "s-z") 'emms-previous)
               (global-set-key (kbd "s-x") 'emms-pause)
               (global-set-key (kbd "s-c") 'emms-show)
               (global-set-key (kbd "s-v") 'emms-stop)
               (global-set-key (kbd "s-b") 'emms-next)
               ; seeking
               (global-set-key (kbd "s-<kp-right>") 'emms-seek-forward)
               (global-set-key (kbd "s-<kp-left>")  'emms-seek-backward)
               (global-set-key (kbd "s-<right>")    'emms-seek-forward) ; arrows in my laptop
               (global-set-key (kbd "s-<left>")     'emms-seek-backward) ; arrows in my laptop
               ; playlist
               (global-set-key (kbd "C-x M-f")    'emms-play-file)
               (global-set-key (kbd "C-x M-F")    'emms-add-file)
               (global-set-key (kbd "C-x M-d")    'emms-play-directory)
               (global-set-key (kbd "C-x M-D")    'emms-add-directory)
               (global-set-key (kbd "C-x M-t")    'emms-play-directory-tree)
               (global-set-key (kbd "C-x M-T")    'emms-add-directory-tree)
               (global-set-key (kbd "C-x M-m")    'emms-play-m3u-playlist)
               (global-set-key (kbd "C-x M-M")    'emms-add-m3u-playlist)
               ; play files and dirs in a dired buffer
               (add-hook 'dired-mode-hook
                         (lambda ()
                           (local-set-key (kbd "<s-return>") 'emms-play-dired)
                           (local-set-key (kbd "<S-s-return>") 'emms-add-dired)))
               (define-key emms-playlist-mode-map "S" 'emms-shuffle)
               ; utilities
               (defun emms-google-for-lyrics ()
                 (interactive)
                 (browse-url
                  (concat "http://www.google.com/search?q="
                          (replace-regexp-in-string " +" "+"
                                                    (concat "lyrics "
                                                            (delete ?- (emms-track-description
                                            (emms-playlist-current-selected-track))))))))
               (global-set-key (kbd "s-s")        'emms-shuffle)
               (global-set-key (kbd "C-x M-l")    'emms-lyrics-toggle)
               (global-set-key (kbd "C-x M-g")    'emms-google-for-lyrics)
               (global-set-key (kbd "C-x M-b")    'emms-smart-browse)
               (global-set-key (kbd "C-x M-p")    'emms-playlist-mode-go)))
   (:name erc
	  :after (lambda ()
               (setq erc-modules
                     '(autoaway autojoin button completion fill irccontrols list match
                       menu move-to-prompt netsplit networks noncommands readonly ring
                       scrolltobottom services stamp spelling track truncate))
               (setq erc-nick-uniquifier "_")
               (setq erc-server "irc.freenode.net")
               (setq erc-port 6667)
               (setq erc-prompt-for-password nil)
               (setq erc-public-away-p t)
               (if (fboundp 'erc-customization) ; erc-customization should be defined
                   (erc-customization))))       ; in user-preferences.el
   (:name undo-tree    ; keep and browse complete undo history
	  :after (lambda ()
	       (require 'undo-tree)
               (global-undo-tree-mode)))
 ))

(setq
 my:el-get-packages
 '(el-get                 ; el-get is self-hosting
   auto-complete          ; complete as you type with overlays
   js2-mode               ; better Javascript mode
  ))

(when (el-get-executable-find "cvs")
  (add-to-list 'my:el-get-packages 'emacs-goodies-el)) ; debian addons for emacs

(when (el-get-executable-find "svn")
  (loop for p in '(psvn             ; M-x svn-status
                   yasnippet        ; powerful snippet mode
                   )
	do (add-to-list 'my:el-get-packages p)))

(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

(el-get 'sync my:el-get-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; skip welcome screen
(setq inhibit-startup-screen t)

; no message in scratch buffer
(setq initial-scratch-message "")

; syntax highlightning on by default
(setq-default global-font-lock-mode t)

; show column numbers
(setq-default column-number-mode t)

; show current line
(setq-default line-number-mode t)

; display buffer size in modeline
(size-indication-mode t)

; automatic wrap to 80 columns (TODO)
(setq-default fill-column 80)
; (setq auto-fill-mode t)

; show matching parenthesis
(show-paren-mode t)

; disable the menubar (promotes good emacs memory :)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

; blinking top and bottom lines instead of speaker buzz
(setq-default visible-bell t)

; always show trailing whitespace
(setq-default show-trailing-whitespace t)

; required for non-English keys (like dead acute) to work
; http://osdir.com/ml/help-gnu-emacs-gnu/2009-05/msg00170.html
(require 'iso-transl)

; better diff coloring
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

; display time at status bar
(setq-default display-time-24hr-format t)
(display-time)

; move the mouse away from the cursor
(mouse-avoidance-mode 'animate)

; freedesktop standard fullscreen
(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] 'fullscreen)

; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

; display current filename or buffer name in the window title bar
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

; custom themes path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

; force white cursor on every frame
(set-cursor-color "gray80")
(add-hook 'window-setup-hook
          '(lambda () (set-cursor-color "gray80")))
(add-hook 'after-make-frame-functions
          '(lambda (f) (with-selected-frame f (set-cursor-color "gray80"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Behavior
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; backup files are for sissies
(setq-default make-backup-files nil)

; always indent with spaces
(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 4)

; save files to home directory by default
(setq-default default-directory '~)

; move between windows with SHIFT+arrows
(windmove-default-keybindings)

; replace yes/no questions with y/n
(fset 'yes-or-no-p 'y-or-n-p)

; (much) bigger kill ring
(setq-default kill-ring-max 1000)

; enable set goal column (C-x C-n)
(put 'set-goal-column 'disabled nil)

; mondays are the first day of the week (for M-x calendar)
(setq-default calendar-week-start-day 1)

;; keep session between emacs runs (~/.emacs.desktop)
(setq desktop-save 'if-exists)
(desktop-save-mode 1)
(setq desktop-globals-to-save
      (append '((extended-command-history . 50)
                (file-name-history        . 200)
                (grep-history             . 50)
                (compile-history          . 50)
                (minibuffer-history       . 100)
                (query-replace-history    . 100)
                (read-expression-history  . 100)
                (regexp-history           . 100)
                (regexp-search-ring       . 100)
                (search-ring              . 50)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

; use ssh, not rsh
(setq-default remote-shell-program "ssh")

; ease operations between two direds side by side
(setq-default dired-dwim-target t)

; integrate copy/paste with X
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

; enable disabled commands, I'm a big guy
(put 'narrow-to-region 'disabled nil)
(put 'not-modified 'disabled t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

; make scripts (files that start with #!) executable after saving
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

; automatically revert files that changed on disk when the open buffer
; has no unsaved changes
(global-auto-revert-mode 1)

; echo keystrokes after 0.1s (default is 1s)
(setq echo-keystrokes 0.1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "M--") 'dabbrev-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

; font size
(define-key global-map (kbd "C-M-+") 'text-scale-increase)
(define-key global-map (kbd "C-M--") 'text-scale-decrease)

; generic apropos (of any symbol) better than apropos-command
(global-set-key "\C-ha" 'apropos)

; I hate minimize
(global-set-key "\C-z" 'ignore)
(global-set-key "\C-x\C-z" 'ignore)

; quicker window splitting
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-s") 'other-window) ; was center-line

; shortcuts for calc
(global-set-key "\C-xc" 'calc)
(global-set-key "\C-x\C-c" 'calc) ; was save-buffers-kill-terminal
(global-set-key "\C-xC" 'full-calc)

; zap-back-to-char
(global-set-key "\C-\M-z" #'(lambda (arg char)
                              (interactive "p\ncBack-zap to char: ")
                              (zap-to-char (- arg) char)))

; region commenting
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

; whitespace cleanup
(global-set-key "\C-c\C-w" 'whitespace-cleanup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(global-set-key "\C-cs" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
; capture tasks in org-mode directly, without going through template selection
(global-set-key "\C-ct" (lambda ()
                          (interactive) (org-capture nil "t")))

(setq org-disputed-keys (quote (([(shift up)] . [(meta shift up)])
                                ([(shift down)] . [(meta shift down)])
                                ([(shift left)] . [(meta shift left)])
                                ([(shift right)] . [(meta shift right)])
                                ([(control shift right)] . [(control meta shift right)])
                                ([(control shift left)] . [(control meta shift left)])))
      org-replace-disputed-keys t)

(setq org-directory "~/Docs/Org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

; record date and time when a task is marked as DONE
(setq org-log-done t)

; detect idle time when clock is running
(setq org-clock-idle-time 10)

; disable linum-mode in org buffers, it's too slow
(add-hook 'org-mode-hook
  '(lambda () (linum-mode 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ido (Interactively Do Things)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ido)
(ido-mode t)

; allow fuzzy searching for consecutive characters when there are no results
(setq ido-enable-flex-matching t)

; take filename from cursor if exists
(setq-default ido-use-filename-at-point 'guess)
(setq-default ido-use-url-at-point 'guess)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uniquify (smart buffer renaming)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
; rename after killing uniquified
(setq uniquify-after-kill-buffer-p t)
; don't mess with special buffers
(setq uniquify-ignore-buffers-re "^\\*")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dired-x (extras for dired mode)
;; http://www.gnu.org/software/emacs/manual/html_mono/dired-x.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'dired-load-hook
          (lambda ()
            (load-library "dired-x")
            ;; Set dired-x global variables here.
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.
            ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python environment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/emacs-for-python/epy-init.el")

; use pyflakes for flymake
(epy-setup-checker "pyflakes %f")

; load django snippets
(epy-django-snippets)

; disable highlightning current line
(global-hl-line-mode 0)

; disable global-linum-mode
(global-linum-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ReST mode (rst-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; associate with .rst and .rest extensions
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

; auto-update the TOC after adjusting a section title
(add-hook 'rst-adjust-hook 'rst-toc-update)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown mode (markdown-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; associate with .md extension
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; User customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-library "user-preferences")
