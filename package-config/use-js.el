(use-package js
  :ensure t
  :config
  (setq js-indent-level 2)
  )

(use-package prettier-js
  :ensure t
  :hook (js-mode . prettier-js-mode)
  :config
  (setq prettier-js-command "~/.npm-global/bin/prettier")
  )

(use-package nodejs-repl
  :ensure t
  :commands nodejs-repl
  :bind (("C-c C-r" . nodejs-repl-send-region)
	 ("C-c C-c" . nodejs-repl-send-buffer)
	 ("C-c C-z" . nodejs-repl-switch-to-repl)))

(use-package tide
  :ensure t
  :hook ((js-mode . tide-setup)
         (js-mode . tide-hl-identifier-mode))
  :bind (("C-c ." . tide-jump-to-definition)
	 ("C-c ," . tide-jump-back)
	 ("C-c ?" . tide-documentation-at-point))
  :config

  (defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint
          (and root
               (expand-file-name "node_modules/.bin/eslint"
                                 root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

  (setq tide-always-show-documentation t)
  (setq tide-server-max-response-length (* 1024 1024))

  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  )
