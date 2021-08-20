(use-package tree-sitter
  :ensure t
  :diminish
  ;; :hook ((python-mode js-mode typescript-mode web-jsx-mode web-tsx-mode) . tree-sitter-hl-mode)
  :hook ((python-mode js-mode typescript-mode) . tree-sitter-hl-mode)
  ;; :custom
  ;; (tree-sitter-hl-use-font-lock-keywords nil)
  :config
  (use-package tree-sitter-langs :ensure t)
  (add-to-list 'tree-sitter-major-mode-language-alist '(python-mode . python))
  (add-to-list 'tree-sitter-major-mode-language-alist '(js-mode . javascript))
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-mode . typescript))
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(web-jsx-mode . javascript))
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(web-tsx-mode . tsx))
  )
