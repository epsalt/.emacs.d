(use-package tree-sitter
  :ensure t
  :demand t
  :diminish
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  (add-to-list 'tree-sitter-major-mode-language-alist '(web-jsx-mode . javascript))
  (add-to-list 'tree-sitter-major-mode-language-alist '(web-tsx-mode . tsx)))
