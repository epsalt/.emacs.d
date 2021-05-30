(use-package flx
  :ensure t)

(use-package ivy
  :ensure t
  :after flx
  :diminish
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  (ivy-extra-directories ())
  (ivy-re-builders-alist '((swiper . ivy--regex-plus)
        		   (t . ivy--regex-fuzzy)))
  (ivy-use-selectable-prompt t)
  :config (ivy-mode))

(use-package counsel
  :ensure t
  :diminish
  :after ivy
  :config (counsel-mode)
  (ivy-configure 'counsel-imenu
    :update-fn 'auto))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))
