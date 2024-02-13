(use-package python
  :demand t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :hook (inferior-python-mode . my/inferior-python-hook)
  :bind (:map python-mode-map
              ("C-c C-j" . consult-imenu))
  :custom
  (python-environment-directory (expand-file-name "~/.virtualenvs"))
  (python-shell-interpreter "python3")
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
  (defun my/inferior-python-hook ()
    (setq-local eldoc-documentation-function #'python-eldoc-function)
    (setq-local completion-styles '(basic partial-completion emacs22)))
  )

(use-package company-jedi
  :ensure t
  :hook ((python-mode . jedi:setup)
         (python-mode . my/python-mode-hook))
  :custom
  (jedi:complete-on-dot t)
  (jedi:tooltip-method nil)
  (jedi:setup-keys t)
  (jedi:environment-virtualenv (append python-environment-virtualenv '("--python" "python3")))
  :config
  (defun my/python-mode-hook ()
      (add-to-list 'company-backends  'company-jedi))
  )

(use-package blacken
  :ensure t
  :after python
  :hook (python-mode . blacken-mode))
