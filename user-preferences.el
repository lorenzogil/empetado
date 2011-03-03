(setq user-mail-address "fidelramos@gmail.com")
(setq user-full-name "Fidel Ramos Sañudo")

(setq org-agenda-files (list (concat org-directory "/personal.org")
                             (concat org-directory "/work.org")
                             (concat org-directory "/projects.org")
                             (concat org-directory "/anniversaries.org")))

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dark-laptop)))

(setq-default erc-email-userid "Haplo")
(setq-default erc-nick "Haplo")
; (setq-default erc-nickserv-passwords '((freenode (("nick" . "password")))))
(setq-default erc-user-full-name "Fidel Ramos")
