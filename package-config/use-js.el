(define-derived-mode web-tsx-mode web-mode "tsx")
(define-derived-mode web-jsx-mode web-mode "jsx")
(define-derived-mode web-vue-mode web-mode "vue")

(use-package js
  :ensure nil
  :hook (js-mode . eglot-ensure)
  :custom
  (js-indent-level 2))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :hook (typescript-mode . eglot-ensure)
  :custom
  (typescript-indent-level 2))

(use-package prettier-js
  :ensure t
  :hook ((js-mode typescript-mode web-tsx-mode web-jsx-mode) . prettier-js-mode)
  :custom (prettier-js-command "prettier")
  :config
  (add-hook 'json-mode-hook (lambda () (prettier-js-mode -1))))

(use-package web-mode
  :ensure t
  :mode (("\\.jsx$" . web-jsx-mode)
         ("components\\/.*\\.js\\'" . web-jsx-mode)
         ("pages\\/.*\\.js\\'" . web-jsx-mode)
         ("\\.tsx$" . web-tsx-mode)
	 ("\\.vue$" . web-vue-mode)
	 ("\\.html$" . web-mode))
  :config
  (add-to-list 'web-mode-content-types-alist '("jsx" . "\\.js[x]?\\'"))
  (add-hook 'web-mode-hook (lambda () (setq-local standard-indent 2)))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))
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
  :hook (web-vue-mode . eglot-ensure)
  )

(use-package web-tsx-mode
  :hook (web-tsx-mode . eglot-ensure)
  )

(use-package web-jsx-mode
  :hook (web-jsx-mode . eglot-ensure)

  )

(use-package web-vue-mode
  :hook (web-vue-mode . eglot-ensure)
  :custom
  (web-mode-script-padding 0)
  (web-mode-style-padding 0))
