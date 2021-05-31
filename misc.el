;; Start in home directory
(setq default-directory "~")

(setq initial-scratch-message
      ";; Postpone today.\n;; Conquer tomorrow.\n\n")

(with-current-buffer (generate-new-buffer "*text*")
  (markdown-mode))

;; Fix Emacs defaults
(menu-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(column-number-mode 1)
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
      inhibit-startup-message t
      ring-bell-function 'ignore
      visible-bell nil)

(setq-default indent-tabs-mode nil)
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

;; Unbind suspend-frame
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

(bind-key "C-M-<backspace>" #'delete-indentation)
(bind-key "C-o" #'open-line)

;; Backups
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; LSP defaults
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(let ((autosave-dir (concat user-emacs-directory "autosaves/")))
  (if (not (file-exists-p autosave-dir))
      (make-directory autosave-dir t))
  (setq auto-save-file-name-transforms
        (append auto-save-file-name-transforms
                `((".*" ,autosave-dir t)))))
