(defun makkus/full-screen-toggle ()
  "toggle full-screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))

;;;; create pop-up org-capture frame
;;;; from: https://cestdiego.github.io/blog/2015/08/19/org-protocol/
(defadvice org-capture
    (after make-full-window-frame activate)
  "Advise capture to be the only window when used as a popup"
  (if (equal "org-capture" (frame-parameter nil 'name))
      (delete-other-windows)))

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (if (equal "org-capture" (frame-parameter nil 'name))
      (delete-frame)))

;;;; from
(defun makkus/org-capture ()
         "Create a new frame and run org-capture."
         (interactive)
         (delete-other-windows)
         (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
           (org-capture)))
