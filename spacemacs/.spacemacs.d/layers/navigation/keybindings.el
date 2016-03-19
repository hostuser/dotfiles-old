(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-<") 'winner-undo)
(global-set-key (kbd "C->") 'winner-redo)

(global-set-key (kbd "C-\\") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-(") 'iedit-mode)
(global-set-key (kbd "C-:") 'makkus/avy-goto-end-of-word-or-subword-1)
(global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "M-g M-g") 'avy-goto-line)
(global-set-key (kbd "M-g g") 'avy-goto-line)

;; imenu
(global-set-key (kbd "M-i") 'helm-semantic-or-imenu)
