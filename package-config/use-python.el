(use-package python
  :demand t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :hook (inferior-python-mode . my-python-enable-eldoc-inferior-python)
  :bind (:map python-mode-map
              ("C-c C-j" . consult-imenu))
  :config
  (setq python-environment-directory (expand-file-name "~/.virtualenvs"))
  (setq python-shell-interpreter "python3")

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
    (setq-local eldoc-documentation-function #'python-eldoc-function))

  (use-package company-jedi
    :ensure t
    :custom
    (jedi:complete-on-dot t)
    (jedi:tooltip-method nil)
    (jedi:setup-keys t)
    :config
    (add-hook 'python-mode-hook 'jedi:setup)
    (defun my/python-mode-hook ()
      (add-to-list 'company-backends 'company-jedi))
    (add-hook 'python-mode-hook 'my/python-mode-hook)

    (setq jedi:environment-virtualenv
          (append python-environment-virtualenv '("--python" "python3"))))

  )
