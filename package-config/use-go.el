(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :hook ((go-mode . lsp)
         (go-mode . smartparens-mode)
         (before-save . gofmt-before-save))
  :custom
  (lsp-go-hover-kind "FullDocumentation")
  :config

  (defun markdown-raw-links (&rest ignore)
    "Convert link markup [ANCHOR](URL) to raw URL
     so lsp-ui-doc--make-clickable-link can find it
     https://github.com/emacs-lsp/lsp-ui/issues/452"
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward markdown-regex-link-inline nil t)
          (replace-match (replace-regexp-in-string "\n" "" (match-string 6))))))
  (advice-add 'lsp--render-markdown :before #'markdown-raw-links)
)
