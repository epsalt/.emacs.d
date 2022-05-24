;; Python
(add-hook 'python-mode-hook 'my/python-config-hook)

(defun my/python-config-hook ()
  (setq python-fill-docstring-style 'pep-257-nn))

;; Black
(remove-hook 'python-mode-hook 'blacken-mode)
(add-hook 'black-mode-hook 'my/black-config-hook)

(defun my/black-config-hook ()
  (setq blacken-skip-string-normalization t)
  (setq blacken-line-length 99))

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

;; Javascript
(remove-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook 'my/js-indent-hook)
(add-hook 'json-mode-hook 'my/js-indent-hook)

(defun my/js-indent-hook ()
  (setq js-indent-level 4))

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
