(use-package restclient
  :quelpa (restclient
           :fetcher github
           :repo "pashky/restclient.el"
           :files ("*.el"))
  :mode (("\\.http\\'" . restclient-mode)
         ("\\.rest\\'" . restclient-mode)))
