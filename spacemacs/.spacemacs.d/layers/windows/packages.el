;;; packages.el --- windows layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: markus <markus@c2264f455ce1>
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
;; added to `windows-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `windows/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `windows/pre-init-PACKAGE' and/or
;;   `windows/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst windows-packages
  '(zoom-window key-chord))

;;;; shortcut key to full-screen a window, and exit full-screen when pressed again
(defun windows/init-zoom-window ()

  (use-package zoom-window
    :ensure zoom-window
    :init
    (global-set-key (kbd "<f8>") 'zoom-window-zoom)
    :config
    (setq zoom-window-mode-line-color "Red")
    ))

(defun windows/post-init-zoom-window ()

  (key-chord-define-global "fj" 'zoom-window-zoom))

;;; packages.el ends here
