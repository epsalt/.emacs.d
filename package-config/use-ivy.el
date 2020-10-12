(use-package counsel
  :diminish
  :ensure t
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :diminish
  :ensure t
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config
  (ivy-mode)
  (set-face-attribute 'ivy-virtual nil :foreground "yellow"))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))
