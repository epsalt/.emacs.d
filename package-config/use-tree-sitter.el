(use-package tree-sitter
  :ensure t
  :diminish
  :hook ((python-mode js-mode) . tree-sitter-hl-mode)
  :config
  (use-package tree-sitter-langs :ensure t)
  (add-to-list 'tree-sitter-major-mode-language-alist '(python-mode . python))
  (add-to-list 'tree-sitter-major-mode-language-alist '(js-mode . javascript))
  )
