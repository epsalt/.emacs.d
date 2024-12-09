(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Keep custom settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Bulk package loads
(use-package load-dir
  :ensure t
  :custom (load-dir-recursive t))

(load-dir-one (expand-file-name "defuns" user-emacs-directory))
(load-dir-one (expand-file-name "package-config" user-emacs-directory))
(load-file (expand-file-name "misc.el" user-emacs-directory))
(load-file (expand-file-name "work.el" user-emacs-directory))
