;;; packages.el --- edit layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: markus <markus@b7ab7a093e56>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `edit-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `edit/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `edit/pre-init-PACKAGE' and/or
;;   `edit/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst edit-packages
  '(whole-line-or-region easy-kill multiple-cursors password-generator))

(defun edit/init-password-generator ()
  (use-package password-generator
    :ensure password-generator
    ))

;;;; using "C-w" to kill a whole line if there is no active region
(defun edit/init-whole-line-or-region ()
  (use-package whole-line-or-region
    :ensure whole-line-or-region
    :diminish whole-line-or-region-minor-mode
    :init (whole-line-or-region-mode)
    ))

;;;; easy-kill is a drop-in replacement for kill-ring-save
;;;; link: https://github.com/leoliu/easy-kill
(defun edit/init-easy-kill ()
  (use-package easy-kill
    :ensure easy-kill
    :init
    (progn
      (global-set-key [remap kill-ring-save] 'easy-kill)
      (global-set-key [remap mark-sexp] 'easy-mark))
    )
  )

(defun edit/init-multiple-cursors ()
  (setq mc/list-file "~/.spacemacs.d/.mc-lists.el")
  (use-package multiple-cursors
    :ensure multiple-cursors
    :init
    (progn
      (global-set-key (kbd "C-)") 'mc/edit-beginnings-of-lines)
      (global-set-key (kbd "C-(") 'mc/mark-all-dwim))))


;;; packages.el ends here
