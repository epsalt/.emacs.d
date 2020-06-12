(use-package counsel
  :diminish
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :diminish
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))
