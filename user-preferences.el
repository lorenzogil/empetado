(setq user-mail-address "fidelramos@gmail.com")
(setq user-full-name "Fidel Ramos Sañudo")

(setq org-agenda-files (list "~/Docs/Org/personal.org"
                             "~/Docs/Org/work.org"
                             "~/Docs/Org/projects.org"
                             "~/Docs/Org/anniversaries.org"))

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dark-laptop)))

(setq-default erc-email-userid "Haplo")
(setq-default erc-nick "Haplo")
; (setq-default erc-nickserv-passwords '((freenode (("nick" . "password")))))
(setq-default erc-user-full-name "Fidel Ramos")
