(use-package ivy
  :ensure t
  :after flx
  :diminish
  :ensure t
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config
  (ivy-mode)
  (setq ivy-re-builders-alist '((swiper . ivy--regex-plus)
				(t . ivy--regex-fuzzy))))

(use-package counsel
  :ensure t
  :diminish
  :after ivy
  :config (counsel-mode)
  (ivy-configure 'counsel-imenu
		 :update-fn 'auto))

(use-package flx
  :ensure t)

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))
