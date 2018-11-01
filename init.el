(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Better defaults
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(column-number-mode)
(show-paren-mode t)
(mouse-wheel-mode t)
(set-default 'truncate-lines t)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq-default indent-tabs-mode nil)
(setq case-fold-search t)
(defalias 'yes-or-no-p 'y-or-n-p)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; Keep custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq settings-dir (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

;; No backups
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Platform specific settings
(setq is-mac (equal system-type 'darwin))
(setq is-linux (equal system-type 'gnu/linux))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; https://emacs.stackexchange.com/a/28933
(dolist (package
         '(base16-theme
           company
           company-jedi
           company-lua
           dictionary
           exec-path-from-shell
           fill-column-indicator
           flycheck
           html-check-frag
           js2-mode
           lua-mode
           magit
           markdown-mode
           pyvenv))
  (unless (package-installed-p package)
    (package-install package))
  (require package))

(when is-mac
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(when is-mac
  (progn
    (setq mac-option-modifier 'super)
    (setq mac-command-modifier 'meta)))

(when is-linux
  (progn
    (setq x-meta-keysym 'meta)
    (setq x-super-keysym 'super)))

;; Setting files
(require 'appearance)
(require 'prog)
(require 'text)

;; Some extensions
(require 'ido)
(ido-mode t)
(setq ido-auto-merge-work-directories-length -1)

(require 'smex)
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'fill-column-indicator)
(add-hook 'prog-mode-hook 'fci-mode)
(setq fci-rule-color "dark slate grey")

(defun dired-mode-setup ()
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'dired-mode-setup)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Packages
(setq load-prefer-newer t)
