(defun makkus/full-screen-toggle ()
  "toggle full-screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
