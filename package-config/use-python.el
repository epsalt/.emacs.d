;; from https://github.com/fast-90/dotfiles/blob/main/repos/config-files/emacs/config.org
(defun find-ruff-config-files-in-current-project ()
  "Search for .ruff.toml, ruff.toml, or pyproject.toml in the project root of the current buffer."
  (let* ((project-root (project-root (project-current)))  ;; Automatically find project root
         (files '(".ruff.toml" "ruff.toml" "pyproject.toml")))
    (if project-root
        (cl-loop for file in files
                 for filepath = (expand-file-name file project-root)
                 when (file-exists-p filepath)
                 return filepath)
      nil)))

(use-package python
  :mode ("\\.py\\'" . python-ts-mode)
  :hook ((python-ts-mode . flymake-mode)
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
    (setq-local python-flymake-command `("ruff" "check" "--output-format" "pylint" "--config" ,(find-ruff-config-files-in-current-project) "--quiet" "--stdin-filename" ,buffer-file-name "-"))))
