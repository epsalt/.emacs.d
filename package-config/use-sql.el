(use-package sqlformat
  :ensure t
  :init
  (defcustom sqlformat-command 'sqlformat
    "Command used for reformatting.
This command should receive SQL input via STDIN and output the
reformatted SQL to STDOUT, returning an appropriate exit code."
    :type '(choice (const :tag "Use \"sqlformat\"" sqlformat)
                   (const :tag "Use \"pgformatter\"" pgformatter)
                   (const :tag "Use \"sqlfluff\"" sqlfluff)
                   (const :tag "Use \"sqlfmt\"" sqlfmt))
    )

  (reformatter-define sqlformat
    :program (pcase sqlformat-command
               (`sqlformat "sqlformat")
               (`pgformatter "pg_format")
               (`sqlfluff "sqlfluff")
               (`sqlfmt "sqlfmt")
               )
    :args (pcase sqlformat-command
            (`sqlformat  (append sqlformat-args '("-r" "-")))
            (`pgformatter (append sqlformat-args '("-")))
            (`sqlfluff (append '("fix") sqlformat-args '("-f" "-")))
            (`sqlfmt (append sqlformat-args '("-"))))
    :lighter " SQLFmt"
    :group 'sqlformat)

  :config
  (setq sqlformat-command 'sqlfmt)
)
