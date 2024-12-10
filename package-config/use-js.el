(use-package js-ts-mode
  :ensure nil
  :mode "\\.jsx?\\'"
  :hook ((js-ts-mode . eglot-ensure)
  (js-ts-mode . flymake-eslint-enable))
  :custom
  (js-indent-level 2))

(use-package typescript-ts-mode
  :ensure t
  :mode "\\.tsx?\\'"
  :hook ((typescript-ts-mode . eglot-ensure)
  (typescript-ts-mode . flymake-eslint-enable))
  :custom
  (typescript-indent-level 2))

(use-package prettier-js
  :ensure t
  :hook ((js-ts-mode typescript-ts-mode) . prettier-js-mode)
  :custom (prettier-js-command "prettier")
  :config
  (add-hook 'json-mode-hook (lambda () (prettier-js-mode -1))))

(use-package web-mode
  :ensure t
  :mode (("\\.html$" . web-mode))
  :config
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

(use-package flymake-eslint
  :ensure t
  :config
  (setq flymake-eslint-prefer-json-diagnostics t)
  (setq flymake-eslint-executable-name "eslint_d"))
