(defun makkus/avy-goto-end-of-word-or-subword-1 ()
  (interactive)
  (call-interactively 'avy-goto-word-or-subword-1)
  (forward-word)
  )

(defun makkus/avy-goto-end-of-line ()
  (interactive)
  (call-interactively 'avy-goto-line)
  (end-of-line)
  )

(defun makkus/org-find-and-enter ()
  "Find imenu heading, go to it, then enter subtree there and show children"
  (interactive)
  (helm-imenu)
  (org-narrow-to-subtree)
  (show-children)
  )

