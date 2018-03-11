;; Autocompletion
(add-hook 'prog-mode-hook 'company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

(setq python-shell-interpreter "python3")

;; Lua
(defun my/lua-mode-hook ()
  (add-to-list 'company-backends 'company-lua))
(add-hook 'lua-mode-hook 'my/lua-mode-hook)

;; Javascript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; HTML
(require 'html-check-frag)
(add-hook 'html-mode-hook (lambda () (html-check-frag-mode 1)))

(provide 'prog)
