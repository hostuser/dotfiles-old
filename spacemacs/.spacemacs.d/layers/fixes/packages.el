;;; packages.el --- fixes layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Makkus <makkus@go>
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
;; added to `fixes-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `fixes/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `fixes/pre-init-PACKAGE' and/or
;;   `fixes/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst fixes-packages
  '(company))

(defun fixes/post-init-company ()

  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "<RET>") nil)
    )

  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0)
  (setq company-show-numbers t)

  )


;;; Packages.el ends here
