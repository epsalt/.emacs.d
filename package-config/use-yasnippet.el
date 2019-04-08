(use-package yasnippet
  :ensure t
  :diminish yas-global-mode yas-minor-mode
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode t))
