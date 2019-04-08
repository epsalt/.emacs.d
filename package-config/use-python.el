(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :commands python-mode
  :after (pyvenv)
  :custom
  (python-shell-interpreter "python3")
  (py-python-command "python3")
  :hook
  (python-mode . my-python-enable-lsp)
  (inferior-python-mode . my-python-enable-eldoc-inferior-python)

  :config
  (defun ipython ()
    (interactive)
    (run-python "python3 -m IPython --simple-prompt -i" t t))

  (defun my-python-enable-eldoc-inferior-python ()
    (setq-local eldoc-documentation-function #'python-eldoc-function))

  (defun my-python-enable-lsp ()
    (unless pyvenv-virtual-env-name
      (pyvenv-activate "$HOME/.virtualenvs/default/"))
    (lsp)
    (setq-local company-backends '(company-lsp))))
