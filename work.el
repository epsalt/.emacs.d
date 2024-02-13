;; Black
(defun my/black-config-hook ()
  (setq blacken-line-length 99))

(add-hook 'blacken-mode-hook 'my/black-config-hook)

;; Flycheck
(add-hook 'flycheck-mode-hook 'my/flycheck-config-hook)
;; (add-hook 'js-mode-hook 'my/flycheck-js-config-hook)

(defun my/flycheck-config-hook ()
  (setq flycheck-python-flake8-executable "/home/epsalt/.local/bin/flake8")
  (setq flycheck-flake8rc "~/.flake8")
  (setq-default flycheck-disabled-checkers '(python-pylint))
  (setq flycheck-help-echo-function nil))

;; (defun my/flycheck-js-config-hook ()
;;   (flycheck-select-checker 'javascript-tide))

;;Javascript
(add-hook 'js-mode-hook 'my/js-indent-hook)
;; (add-hook 'json-mode-hook 'my/js-indent-hook)
(add-hook 'web-jsx-mode-hook 'my/web-indent-hook)

(defun my/js-indent-hook ()
  (setq js-indent-level 4))
(defun my/web-indent-hook ()
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-markup-indent-offset 4)
  (setq js-indent-level 4)
  (setq-local standard-indent 4))

;; Org
(add-hook 'org-mode-hook 'my/org-directory-hook)

(defun my/org-directory-hook ()
  (setq org-agenda-files '("~/org/todo.org"))
  (setq org-directory '("~/org/")))

;; Web mode
(add-hook 'web-mode-hook 'my/web-mode-indentation-hook)
(add-hook 'editorconfig-custom-hooks 'my/editorconfig-script-padding-hook)

(defun my/web-mode-indentation-hook ()
  (setq web-mode-enable-control-block-indentation nil)
  (setq web-mode-script-padding 0))

(defun my/editorconfig-script-padding-hook (hash)
  (setq web-mode-script-padding 0))

(setq browse-url-generic-program "wslview")

;; https://gist.github.com/cpbotha/fdd2c5ab3d22a33679c546323ea3bc0b
(when (getenv "WAYLAND_DISPLAY")
  (setq
   interprogram-cut-function
   (lambda (text)
     ;; strangest thing: gui-select-text leads to gui-set-selection 'CLIPBOARD
     ;; text -- if I eval that with some string, it mostly lands on the wayland
     ;; clipboard, but not when it's invoked from this context.
     ;; (gui-set-selection 'CLIPBOARD text)
     ;; without the charset=utf-8 in type, emacs / wl-copy will crash when you paste emojis into a windows app
     (start-process "wl-copy" nil "wl-copy" "--trim-newline" "--type" "text/plain;charset=utf-8"  text))))
