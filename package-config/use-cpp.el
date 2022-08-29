(use-package cc-mode
  :hook ((c++-mode . lsp)
         (c++-mode . smartparens-mode)))

(use-package clang-format
  :commands (clang-format-buffer clang-format-region)
  :init
  (setq clang-format-style-option "llvm"))
