                                        ; package --- Summary

;;; Commentary:
;;; helm config

;;; Code:

(defun my-helm ()
  (interactive)
  (require 'helm-files)
  (helm-other-buffer
   (append

    (if (projectile-project-p)
        '(helm-source-projectile-buffers-list
          helm-source-projectile-files-list)
      '())

    '(helm-source-buffers-list
      helm-source-recentf)

    (if (projectile-project-p)
        '(
          helm-source-projectile-projects)
      '())

    '(helm-source-locate
      helm-source-buffer-not-found
      helm-source-file-name-history
      helm-source-info-pages)
    )
   helm-buffer ; " *my-helm*"
   ))

(global-set-key (kbd "C-\\") 'my-helm)


(provide 'config_helm)
