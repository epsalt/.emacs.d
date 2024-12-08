;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode)
;;   :config
;;   (flycheck-add-mode 'javascript-eslint 'web-jsx-mode)
;;   (setq flycheck-highlighting-mode 'nil)
;;   (defun my/use-eslint-from-node-modules ()
;;     (let* ((root (locate-dominating-file
;;                   (or (buffer-file-name) default-directory)
;;                   "node_modules"))
;;            (eslint (and root
;;                         (expand-file-name "node_modules/eslint/bin/eslint.js"
;;                                           root))))
;;       (when (and eslint (file-executable-p eslint))
;;         (setq-local flycheck-javascript-eslint-executable eslint))))
;;   (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
;;   )
