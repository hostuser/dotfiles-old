; package --- Summary

;;; Commentary:
;;; hydras

;;; Code:

(defhydra hydra-navigation (:color amaranth :columns 3)
  "Navigation commands"

  ("C-n" next-line "next line")
  ("C-p" previous-line "previous line")

  ("j" outline-next-visible-heading "next heading")
  ("k" outline-previous-visible-heading "prev heading")

  ("J" outline-forward-same-level "Same level, next heading")
  ("K" outline-backward-same-level "Same level, previous heading")
  ("C-k" outline-up-heading "Level up, previous heading")
  ("C-j" (progn (outline-up-heading 1)(outline-forward-same-level 1)) "Level up, next heading")

  ("w" widen "widen" :exit nil)
  ("n" org-narrow-to-subtree "narrow to subtree" :exit nil)

  ("g" beginning-of-buffer "beginning of page")
  ("<" beginning-of-buffer "beginning of page")
  ("G" end-of-buffer "end of page")
  (">" end-of-buffer "end of page")

  ("f" sp-forward-sexp "forward sexp")
  ("b" sp-backward-sexp "backward sexp")
  ("d" sp-down-sexp "down sexp")
  ("u" sp-up-sexp "up sexp")

  ("<tab>" org-cycle "cycle heading visibility")

  ;; ("u" outline-up-heading "up heading")
  ;; ("M-." org-demote-subtree "demote subtree")
  ;; ("M-," org-promote-subtree "promote subtree")
  ;; ("M-j" org-move-subtree-down "move subtree down")
  ;; ("M-k" org-move-subtree-up "move subtree up")
  ;; ("t" hs-toggle-hiding "toggle block")
  ;; ("s" hs-show-block "show block")
  ;; ("S" hs-show-all "show all")
  ;; ("d" hs-hide-block "hide block")
  ;; ("D" hs-hide-all "hide all")
  ;; ("/" makkus/org-find-and-enter "find and enter" :exit nil)
  ;; ;;("g" org-goto "goto" :exit t)

  ("SPC" nil "quit" :quit t)
  ("RET" nil "quit" :quit t)
  ("q" nil "quit" :quit t))



(provide 'hydras)
;;; hydras.el ends here
