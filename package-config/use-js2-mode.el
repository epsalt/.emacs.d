(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :hook (js2-mode . lsp)
  :ensure t
  :custom
  (js-indent-level 2)
  (js-indent-align-list-continuation nil)
  (js-expr-indent-offset 0)
  (js-chain-indent nil)
  :config

  ;; https://emacs.stackexchange.com/a/29975
  (defun js--proper-indentation-custom (parse-status)
    "Return the proper indentation for the current line."
    (save-excursion
      (back-to-indentation)
      (cond ((nth 4 parse-status)    ; inside comment
             (js--get-c-offset 'c (nth 8 parse-status)))
            ((nth 3 parse-status) 0) ; inside string
            ((eq (char-after) ?#) 0)
            ((save-excursion (js--beginning-of-macro)) 4)
            ;; Indent array comprehension continuation lines specially.
            ((let ((bracket (nth 1 parse-status))
                   beg)
               (and bracket
                    (not (js--same-line bracket))
                    (setq beg (js--indent-in-array-comp bracket))
                    ;; At or after the first loop?
                    (>= (point) beg)
                    (js--array-comp-indentation bracket beg))))
            ((js--ctrl-statement-indentation))
            ((nth 1 parse-status)
             ;; A single closing paren/bracket should be indented at the
             ;; same level as the opening statement. Same goes for
             ;; "case" and "default".
             (let ((same-indent-p (looking-at "[]})]"))
                   (switch-keyword-p (looking-at "default\\_>\\|case\\_>[^:]"))
                   (continued-expr-p (js--continued-expression-p))
                   (original-point (point))
                   (open-symbol (nth 1 parse-status)))
               (goto-char (nth 1 parse-status)) ; go to the opening char
               (skip-syntax-backward " ")
               (when (eq (char-before) ?\)) (backward-list))
               (back-to-indentation)
               (js--maybe-goto-declaration-keyword-end parse-status)
               (let* ((in-switch-p (unless same-indent-p
                                     (looking-at "\\_<switch\\_>")))
                      (same-indent-p (or same-indent-p
                                         (and switch-keyword-p
                                              in-switch-p)))
                      (indent
                       (cond (same-indent-p
                              (current-column))
                             (continued-expr-p
                              (goto-char original-point)
                              ;; Go to beginning line of continued expression.
                              (while (js--continued-expression-p)
                                (forward-line -1))
                              ;; Go to the open symbol if it appears later.
                              (when (> open-symbol (point))
                                (goto-char open-symbol))
                              (back-to-indentation)
                              (+ (current-column)
                                 js-indent-level
                                 js-expr-indent-offset))
                             (t
                              (+ (current-column) js-indent-level
                                 (pcase (char-after (nth 1 parse-status))
                                   (?\( js-paren-indent-offset)
                                   (?\[ js-square-indent-offset)
                                   (?\{ js-curly-indent-offset)))))))
                 (if in-switch-p
                     (+ indent js-switch-indent-offset)
                   indent))))
            ((js--continued-expression-p)
             (+ js-indent-level js-expr-indent-offset))
            (t 0))))

  (advice-add 'js--proper-indentation :override 'js--proper-indentation-custom))
