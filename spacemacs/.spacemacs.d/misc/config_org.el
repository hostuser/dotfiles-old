                                        ; package --- Summary

;;; Commentary:
;;; Org mode config

;;; Code:


(progn
  ;; (define-key org-mode-map (kbd "C-.") nil)
  ;; (define-key org-mode-map (kbd "C-,") nil)
  ;; (define-key org-mode-map (kbd "C-c \\") nil)
  ;; (define-key org-mode-map (kbd "C-c <") nil)
  ;; (define-key org-mode-map (kbd "C-c >") nil)

  (spacemacs/set-leader-keys-for-major-mode 'org-mode "w" 'widen)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
  (setq org-todo-keyword-faces
        '(("TODO" . org-warning) ("WAIT" . "blue") ("CANCELLED" . (:foreground "blue" :weight bold))))

  (require 'ox-latex)
  (add-to-list 'org-latex-classes
               '("handout"
                 "\\documentclass{tufte-handout}
\\usepackage{color}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{gensymb}
\\usepackage{nicefrac}
\\usepackage{units}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("tuftebook"
                 "\\documentclass{tufte-book}\n
\\usepackage{color}
\\usepackage{amssymb}
\\usepackage{gensymb}
\\usepackage{nicefrac}
\\usepackage{units}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


  (eval-after-load 'ox '(require 'ox-koma-letter))
  (eval-after-load 'ox-koma-letter
    '(progn
       (add-to-list 'org-latex-classes
                    '("my-letter"
                      "\\documentclass[a4paper,10pt,DIV=9]\{scrlttr2\}
     \\usepackage[english]{babel}
     \[DEFAULT-PACKAGES]
     \[PACKAGES]
     \[EXTRA]"))

       (setq org-koma-letter-default-class "my-letter")))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . t)
     (sh . t)
     ;;           (R . t)
     ))
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-fontify-natively t)
  (setq org-latex-caption-above nil)

  (setq org-startup-folded nil)

  (setq org-directory "~/Documents/notes")

  (setq org-return-follows-link nil)
  (setq org-read-date-prefer-future nil)
  (setq org-agenda-files
        (list "~/Documents/notes/todo_personal.org"
              ;; "~/Work/research-data-management/rdm.org"
              ;; "~/Work/figshare/figshare.org"
              "~/Projects/Misc/rdm_todo.org"
              "~/Projects/rdm-uspo/rdm_tasks.org"
              ;; "~/Documents/memacs/mail.org"
              ))



;;;; org capture
  (setq org-default-notes-file (concat org-directory "/notes.org"))

  (setq org-capture-templates
        '(("t" "Add todo item")
          ("tt" "Generic" entry (file+headline "~/Documents/notes/notes.org" "Tasks")
           "* TODO %?\n")
          ("tr" "Research data" entry (file+headline "~/Projects/Misc/rdm_todo.org" "Tasks")
           "* TODO %?\n")
          ("td" "Research projects" entry (file+headline "~/Projects/research-project-management/rpm.org" "Tasks")
           "* TODO %?\n")
          ("d" "Stuff to download" entry (file+headline "~/Documents/notes/to_download.org" "Links" "** TODO %?\n"))
          ("p" "Add package")
          ("pd" "Debian package" entry (file+headline "~/Documents/notes/setup.org" "packages")
           "* %?\n")
          ("pp" "Pip package")
          ("pp2" "Pip2 package" entry (file+headline "~/Documents/notes/setup.org" "pip")
           "* %?\n")
          ("pp3" "Pip3 package" entry (file+headline "~/Documents/notes/setup.org" "pip3")
           "* %?\n")
          ("pf" "Firefox extension" entry (file+headline "~/Documents/notes/setup.org" "firefox")
           "* %?\n")
          ("ps" "Add to stow" entry (file+headline "~/Documents/notes/setup.org" "stow")
           "* %?\n")
          ("pm" "Manual install" entry (file+headline "~/Documents/notes/setup.org" "manual")
           "* %?\n")
          ("pc" "Custom command" entry (file+headline "~/Documents/notes/setup.org" "commands") "* %?\n")
          ("w" "Add something writing related")
          ("wt" "Topic" entry (file+headline "~/Documents/write/topics.org" "Topics") "** %?\n")
          ("wq" "Quote" entry (file+headline "~/Documents/write/quotes.org" "Quotes") "** %?\n    - from: ")
          ("c" "Capture misc items")
          ("cl" "Link" entry (file+headline "~/Documents/notes/links.org" "Links")
           "** %?\n")
          ))



  )



(provide 'config_org)
