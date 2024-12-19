(use-package go-ts-mode
  :ensure t
  :mode ("\\.go\\'" . go-ts-mode)
  :custom
  (go-ts-mode-indent-offset 4)
  :hook ((go-ts-mode . smartparens-mode)
         (go-ts-mode . eglot-ensure)))

(use-package project
  :demand t
  :config
  (defun project-find-go-module (dir)
    (when-let ((root (locate-dominating-file dir "go.mod")))
      (cons 'go-module root)))

  (cl-defmethod project-root ((project (head go-module)))
    (cdr project))

  (add-hook 'project-find-functions 'project-find-go-module))
