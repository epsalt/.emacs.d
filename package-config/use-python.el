(use-package python
  :demand t
  :mode ("\\.py\\'" . python-ts-mode)
  :hook (python-ts-mode . eglot-ensure)
  :interpreter ("python" . python-ts-mode)
  :bind (:map python-ts-mode-map
              ("C-c C-j" . consult-imenu))
  :custom
  (python-environment-directory (expand-file-name "~/.virtualenvs"))
  :config
  (eglot-ensure))

(use-package blacken
  :ensure t
  :after python
  :hook (python-mode . blacken-mode))

;; (use-package python
;;   :demand t
;;   :mode ("\\.py\\'" . python-mode)
;;   :hook (python-ts-mode . eglot-ensure)
;;   :interpreter ("python" . python-mode)
;;   :bind (:map python-ts-mode-map
;;               ("C-c C-j" . consult-imenu))
;;   :custom
;;   (python-environment-directory (expand-file-name "~/.virtualenvs"))
;;   :config
;;   (eglot-ensure))

;; (use-package blacken
;;   :ensure t
;;   :after python
;;   :hook (python-mode . blacken-mode))
