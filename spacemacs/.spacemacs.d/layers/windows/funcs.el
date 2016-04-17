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

(defun makkus/toggle-read-novel-mode ()
  "Setup current window to be suitable for reading long novel/article text.

• Line wrap at word boundaries.
• Set a right margin.
• line spacing is increased.
• variable width font is used.

Call again to toggle back."
  (interactive)
  (if (null (get this-command 'state-on-p))
      (progn
        (set-window-margins nil 0
                            (if (> fill-column (window-body-width))
                                0
                              (progn
                                (- (window-body-width) fill-column))))
        (variable-pitch-mode 1)
        (setq line-spacing 0.4)
        (setq word-wrap t)
        (put this-command 'state-on-p t))
    (progn
      (set-window-margins nil 0 0)
      (variable-pitch-mode 0)
      (setq line-spacing nil)
      (setq word-wrap nil)
      (put this-command 'state-on-p nil)))
  (redraw-frame (selected-frame)))

(global-set-key (kbd "<f9>") 'makkus/toggle-read-novel-mode)

(defun makkus/get-frame-name (frame)
  (cdr (assoc (quote name) (frame-parameters frame))))

(defun makkus/is-mu4e-frame (frame)
  (string= (makkus/get-frame-name frame) "mu4e"))


(defun makkus/is-non-mu4e-frame (frame)
  (not
   (or
    (string= (makkus/get-frame-name frame) "mu4e")
    (string= (makkus/get-frame-name frame) "F1")))
)

(defun makkus/mu4e-frame (lst)
  (first (delq nil
               (mapcar (lambda (x) (and (string= (makkus/get-frame-name x) "mu4e") x)) lst)))
  )

(defun makkus/non-mu4e-frames (lst)
  (delq nil
        (mapcar (lambda (x) (and (makkus/is-non-mu4e-frame x) x)) lst))
  )

(defun makkus/non-mu4e-frame (lst)
  (first (makkus/non-mu4e-frames lst)))
