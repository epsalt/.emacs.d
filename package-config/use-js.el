(use-package js
  :config
  (setq js-indent-level 2)
  )

(use-package prettier-js
  :ensure t
  :hook (js-mode . prettier-js-mode)
  :config
  (setq prettier-js-command "~/.npm-global/bin/prettier")
  )

(use-package tide
  :ensure t
  :hook ((js-mode . tide-setup)
         (js-mode . tide-hl-identifier-mode))
  :bind (:map js-mode-map
              ("C-c ." . tide-jump-to-definition)
              ("C-c ," . tide-jump-back)
              ("C-c ?" . tide-documentation-at-point))
  :custom
  (tide-always-show-documentation t)
  (tide-server-max-response-length (* 1024 1024))
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

  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  )
