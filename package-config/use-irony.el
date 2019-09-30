(use-package irony
  :ensure t
  :custom
  (irony-cmake-executable "/usr/local/opt/cmake/bin/cmake")
  (irony-extra-cmake-args (list "-DCMAKE_PREFIX_PATH=/usr/local/opt/llvm/"
				"-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON"))
  :config
  (use-package company-irony
    :ensure t)
  (use-package company-irony-c-headers
    :ensure t
    :config
    (add-to-list
     'company-backends '(company-irony-c-headers company-irony)))
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; export CXX="/usr/local/opt/llvm/bin/clang++" && export CC="/usr/local/opt/llvm/bin/clang" && /usr/local/opt/cmake/bin/cmake -DCMAKE_INSTALL_PREFIX\=/Users/esalt/.emacs.d/irony/ -DLIBCLANG_LIBRARY\=/usr/local/opt/llvm/include -DLIBCLANG_INCLUDE\=/usr/local/opt/include -DCMAKE_PREFIX_PATH\=/usr/local/opt/llvm/ -DCMAKE_INSTALL_RPATH_USE_LINK_PATH\=ON /Users/esalt/.emacs.d/elpa/irony-20190703.1732/server && /usr/local/opt/cmake/bin/cmake --build . --use-stderr --config Release --target install
