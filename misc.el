;; Start in home directory
(setq default-directory "~")

;; Fix Emacs defaults
(menu-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(column-number-mode 0)
(show-paren-mode t)

(defun my/frame (frame)
  (with-selected-frame frame
      (when (display-graphic-p)
	(scroll-bar-mode 0)
	(mouse-wheel-mode t))))

(my/frame (selected-frame))
(add-hook 'after-make-frame-functions 'my/frame)

(set-default 'truncate-lines t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq case-fold-search t
      disabled-command-function nil
      indent-tabs-mode nil
      inhibit-startup-message t
      initial-scratch-message nil
      nobreak-char-display nil
      ring-bell-function 'ignore
      visible-bell nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; System specific binds
(when (equal system-type 'darwin)
  (progn
    (setq mac-option-modifier 'super
          mac-command-modifier 'meta)))

(when (equal system-type 'gnu/linux)
  (progn
    (setq x-meta-keysym 'meta
          x-super-keysym 'super)))

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs-backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs-autosaves/" t)))
