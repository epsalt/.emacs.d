(use-package treesit
  :ensure nil
  :demand t
  :custom
  (treesit-font-lock-level 4)
  (treesit-language-source-alist
   '((css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.23.2"))
     (html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.23.2"))
     (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.23.1"))
     (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.23.0"))
     (go . ("https://github.com/tree-sitter/tree-sitter-go" "v0.20.0"))
     (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod" "v1.1.0"))
     (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.23.2"))
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx/src"))
     (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript/src"))
     (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0")))))
