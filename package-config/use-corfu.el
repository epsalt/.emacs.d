;; (use-package corfu
;;   :ensure t
;;   :custom
;;   (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
;;   (corfu-auto t)                 ;; Enable auto completion
;;   (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
;;   (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
;;   (corfu-preview-current nil)    ;; Disable current candidate preview
;;   (corfu-preselect 'prompt)      ;; Preselect the prompt
;;   (corfu-on-exact-match nil)     ;; Configure handling of exact matches


;;   ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
;;   ;; be used globally (M-/).  See also the customization variable
;;   ;; `global-corfu-modes' to exclude certain modes.
;;   :init
;;   (global-corfu-mode))

;; (use-package emacs
;;   :custom
;;   ;; TAB cycle if there are only few candidates
;;   (completion-cycle-threshold 3)


;;   ;; Enable indentation+completion using the TAB key.
;;   ;; `completion-at-point' is often bound to M-TAB.
;;   (tab-always-indent 'complete)

;;   ;; Emacs 30 and newer: Disable Ispell completion function.
;;   ;; Try `cape-dict' as an alternative.
;;   (text-mode-ispell-word-completion nil)

;;   ;; Hide commands in M-x which do not apply to the current mode.  Corfu
;;   ;; commands are hidden, since they are not used via M-x. This setting is
;;   ;; useful beyond Corfu.
;;   (read-extended-command-predicate #'command-completion-default-include-p))
