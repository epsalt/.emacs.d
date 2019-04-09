(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :commands python-mode
  :after (pyvenv)
  :hook (inferior-python-mode . my-python-enable-eldoc-inferior-python)
  :config
  (defcustom ipython-shell-interpreter-args "-m IPython --simple-prompt --pprint -i"
    "Default arguments for the IPython interpreter."
    :type 'string
    :group 'python)

  (defun ipython-shell-calculate-command ()
    (format "%s %s"
            (combine-and-quote-strings (list python-shell-interpreter))
            ipython-shell-interpreter-args))

  (defun run-ipython ()
    (interactive)
    (run-python (ipython-shell-calculate-command) nil t))

  (defun my-python-enable-eldoc-inferior-python ()
    (setq-local eldoc-documentation-function #'python-eldoc-function)))
