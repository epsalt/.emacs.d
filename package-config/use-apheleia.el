(use-package apheleia
  :ensure t
  :custom
  (apheleia-mode-lighter nil)
  :config
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-isort ruff))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-isort ruff)))
