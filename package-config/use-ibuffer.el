(use-package ibuffer
  :ensure t
  :bind ("C-x C-b" . ibuffer)
  :config

  (setq ibuffer-saved-filter-groups
        (quote (("default"
                 ("org"
                  (or (mode . org-mode)
                      (mode . org-agenda-mode)))
                 ("markdown"
                  (or (mode . markdown-mode)
                      (mode . mhtml-mode)))
                 ("dired"
                  (mode . dired-mode))
                 ("emacs"
                  (or
                   (mode . emacs-lisp-mode)
                   (name . "^\\*scratch\\*$")
                   (name . "^\\*Messages\\*$")))
                 ("programming"
                  (or (mode . python-mode)
                      (mode . ess-r-mode)
                      (mode . sql-mode)))
                 ))))

  (defun ibuffer-ido-find-file (file &optional wildcards)
    "Like `ido-find-file', but default to the directory of the buffer at point.
   https://www.emacswiki.org/emacs/InteractivelyDoThings#toc18"
    (interactive
     (let ((default-directory
             (let ((buf (ibuffer-current-buffer)))
               (if (buffer-live-p buf)
                   (with-current-buffer buf
                     default-directory)
                 default-directory))))
       (list (ido-read-file-name "Find file: " default-directory) t)))
    (find-file file wildcards))
  (define-key ibuffer-mode-map "\C-x\C-f" 'ibuffer-ido-find-file)

  (setq ibuffer-show-empty-filter-groups nil)

  ;; https://github.com/purcell/emacs.d/blob/master/lisp/init-ibuffer.el
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size)))

  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 18 18 :left :elide)
                " "
                (size-h 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " "
                filename-and-process)))

  (add-hook 'ibuffer-mode-hook
            '(lambda ()
               (ibuffer-switch-to-saved-filter-groups "default")
               (ibuffer-auto-mode 1)))
  )
