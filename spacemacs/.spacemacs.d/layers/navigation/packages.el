;;; packages.el --- navigation layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: markus <markus@38b7914688f0>
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
;; added to `navigation-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `navigation/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `navigation/pre-init-PACKAGE' and/or
;;   `navigation/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst navigation-packages
  '(key-chord imenu-anywhere hydra smartparens))

(defun navigation/init-hydra ()

  (use-package hydra
    :ensure hydra
    :init
    (progn
      (require 'hydras)
      )
    )
  )

(defun navigation/init-imenu-anywhere ()

  (use-package imenu-anywhere
    :ensure imenu-anywhere
    :init
    (global-set-key (kbd "C-x M-i") 'helm-imenu-anywhere)
    (global-set-key (kbd "M-I") 'helm-imenu-anywhere)))


(defun navigation/post-init-smartparens ()


  ;; smartparens setup (from: https://github.com/Fuco1/.emacs.d/blob/master/files/smartparens.el)
  (require 'smartparens-config)
  (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

  (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
  (define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
  (define-key smartparens-mode-map (kbd "C-S-d") 'sp-beginning-of-sexp)
  (define-key smartparens-mode-map (kbd "C-S-a") 'sp-end-of-sexp)

  (define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

  (define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
  (define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)

  (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
  (define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

  (define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
  (define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

  (define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
  (define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)

  (define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
  (define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
  (define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
  (define-key smartparens-mode-map (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

  (define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
  (define-key smartparens-mode-map (kbd "C-<left_bracket>") 'sp-select-previous-thing)
  (define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)

  (define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
  (define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)


  )

(defun navigation/init-key-chord ()

  (use-package key-chord
    :ensure key-chord
    :init
    (progn
      (key-chord-define-global "jk" 'avy-goto-word-or-subword-1)
      (key-chord-define-global "JK" 'makkus/avy-goto-end-of-word-or-subword-1)
      (key-chord-define-global ";j" 'hydra-navigation/body)

      ;; (key-chord-define-global "jg" 'avy-goto-line)
      (key-chord-define-global "jl" 'avy-goto-line)
      (key-chord-define-global "JL" 'makkus/avy-goto-end-of-line)
      (key-chord-define-global ";j" 'hydra-navigation/body)
      ;; (key-chord-define-global "jf" 'hydra-goto-commands/body)
      ;; (key-chord-define-global "jj" 'avy-goto-char-2)
      ;; (key-chord-define-global "jp" 'hydra-smartparens/body)
      ;; (key-chord-define-global ";d" 'hydra-display-commands/body)
      ;; (key-chord-define-global ";i" 'my-save-word)
      (key-chord-mode t))
    )
  )



;;; packages.el ends here
