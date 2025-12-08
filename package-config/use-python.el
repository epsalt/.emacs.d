(use-package python
  :mode ("\\.py\\'" . python-ts-mode)
  :hook ((python-ts-mode . flymake-mode)
         (python-ts-mode . apheleia-mode)
         (python-ts-mode . eglot-ensure)
         (python-ts-mode . my/python-hook))
  :interpreter ("python" . python-ts-mode)
  :bind (:map python-ts-mode-map
              ("C-c C-j" . consult-imenu))
  :custom
  (python-environment-directory (expand-file-name "~/.virtualenvs"))
  (python-flymake-command-output-pattern
   '("^\\(?:.*\\):\\(?1:[0-9]+\\):\\(?:\\(?2:[0-9]+\\):?\\)? \\(?3:.*\\)$"
     1 2 nil 3))
  :preface
  (defun my/python-hook ()
  (setq-local python-flymake-command `("ruff" "check" "--output-format" "pylint" "--quiet" "--stdin-filename" ,buffer-file-name "-"))))
