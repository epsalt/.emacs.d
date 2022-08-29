(define-derived-mode web-tsx-mode web-mode "tsx")
(define-derived-mode web-jsx-mode web-mode "jsx")
(define-derived-mode web-vue-mode web-mode "vue")

(use-package js
  :hook (js-mode . lsp)
  :custom
  (js-indent-level 2)
  (lsp-diagnostics-disabled-modes '(js-mode))
  (lsp-modeline-diagnostics-enable nil)
  )

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp)
  :custom
  (typescript-indent-level 2))

(use-package prettier-js
  :ensure t
  :hook ((js-mode typescript-mode web-tsx-mode web-jsx-mode) . prettier-js-mode)
  :custom
  (prettier-js-command "prettier"))

(use-package web-mode
  :ensure t
  :mode (("\\.jsx$" . web-jsx-mode)
         ;; ("components\\/.*\\.js\\'" . web-jsx-mode)
         ;; ("pages\\/.*\\.js\\'" . web-jsx-mode)
	 ("\\.tsx$" . web-tsx-mode)
	 ("\\.html$" . web-mode)
         ("\\.vue$" . web-vue-mode)
         )
  :config
  (add-to-list 'web-mode-content-types-alist '("jsx" . "\\.js[x]?\\'"))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'") ))
  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-enable-auto-closing t)
  (web-mode-enable-auto-opening t)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-auto-indentation t)
  (web-mode-enable-current-element-highlight t)
  (web-mode-enable-auto-quoting nil))

(use-package web-vue-mode
  :hook (web-vue-mode . lsp))

(use-package web-tsx-mode
  :hook (web-tsx-mode . lsp))

(use-package web-jsx-mode
  :hook (web-jsx-mode . lsp))
