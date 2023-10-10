(use-package cc-mode
  :hook ((c++-mode . lsp)
         (c++-mode . smartparens-mode)))


(use-package c-mode
  :hook ((c-mode . lsp)
         (c-mode . smartparens-mode)))

(use-package clang-format
  :commands (clang-format-buffer clang-format-region)
  :hook (c-mode . clang-format-buffer-save)
  :init
  (setq clang-format-style-option "llvm")

  (defun clang-format-buffer-save ()
    (add-hook 'before-save-hook 'clang-format-buffer nil t)))
