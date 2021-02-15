(use-package pico8-mode
  :ensure t
  :mode ("\\.p8\\'" . pico8-mode)
  :quelpa (pico8-mode :fetcher github :repo "Kaali/pico8-mode")
  :config
  (setq pico8-documentation-file "/usr/local/bin/pico-8/pico-8.txt")
  )
