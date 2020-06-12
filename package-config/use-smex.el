(use-package smex
  :disabled t
  :ensure t
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command))
  :config (smex-initialize))
