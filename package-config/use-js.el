(define-derived-mode web-tsx-mode web-mode "tsx")
(define-derived-mode web-jsx-mode web-mode "jsx")

(use-package js
  :custom
  (js-indent-level 2)
  )

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :custom
  (typescript-indent-level 2)
  )

(use-package prettier-js
  :ensure t
  :hook ((js-mode typescript-mode pweb-tsx-mode web-jsx-mode) . prettier-js-mode)
  :custom
  (prettier-js-command "prettier")
  )

(use-package tide
  :ensure t
  :hook (((js-mode typescript-mode web-tsx-mode web-jsx-mode) . tide-setup)
         ((js-mode typescript-mode web-tsx-mode web-jsx-mode) . tide-hl-identifier-mode)
         ((js-mode typescript-mode web-tsx-mode web-jsx-mode) . my/use-eslint-from-node-modules))
  :bind (:map tide-mode-map
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

  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

  (flycheck-define-generic-checker 'web-tsx-tide
    "A TSX syntax checker using tsserver."
    :start #'tide-flycheck-start
    :verify #'tide-flycheck-verify
    :modes '(web-tsx-mode)
    :predicate (lambda ()
                 (and
                  (tide-file-extension-p "tsx")
                  (tide-flycheck-predicate))))

  (flycheck-define-generic-checker 'web-jsx-tide
    "A JSX syntax checker using tsserver."
    :start #'tide-flycheck-start
    :verify #'tide-flycheck-verify
    :modes '(web-jsx-mode)
    :predicate (lambda ()
                 (and
                  (tide-file-extension-p "jsx")
                  (tide-flycheck-predicate))))

  (add-to-list 'flycheck-checkers 'web-tsx-tide t)
  (add-to-list 'flycheck-checkers 'web-jsx-tide t)
  )

(use-package web-mode
  :ensure t
  :mode (("\\.jsx$" . web-jsx-mode)
         ("components\\/.*\\.js\\'" . web-jsx-mode)
         ("pages\\/.*\\.js\\'" . web-jsx-mode)
	 ("\\.tsx$" . web-tsx-mode)
	 ("\\.html$" . web-mode)
	 ("\\.json$" . web-mode))
  :config
  (add-to-list 'web-mode-content-types-alist '("jsx" . "\\.js[x]?\\'"))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))
  ;; (flycheck-add-mode 'tsx-tide 'web-tsx-mode)
  ;; (flycheck-add-mode 'jsx-tide 'web-jsx-mode)
  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-enable-auto-closing t)
  (web-mode-enable-auto-opening t)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-auto-indentation t)
  (web-mode-enable-current-element-highlight t)
  (web-mode-enable-auto-quoting nil)
  )
