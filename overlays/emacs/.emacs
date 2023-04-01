; custom .emacs

(setq load-path
      (append (list nil "~/.emacs.d/el")
              load-path)
      )

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;(load-theme 'gruvbox-dark-soft t)
;(load-theme 'gruvbox-dark-medium t)
(load-theme 'gruvbox-dark-hard t)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

; markdown support
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; yaml suppport
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
	  '(lambda ()
	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(require 'linum)
(global-linum-mode 1)
;; use customized linum-format: add a addition space after the line number                                                                      
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))
(line-number-mode t)
(column-number-mode t)
(setq default-major-mode 'indented-text-mode)
;(text-mode)
(display-time)

(fset 'replace-bracket
   [escape ?% ?) ?{ return ?) ?\C-q ?\C-j ?{ return ?! escape ?<])
(fset 'replace-else
   [escape ?% ?} ?e ?l ?s ?e ?{ return ?} ?\C-q ?\C-j ?e ?l ?s ?e ?\C-q ?\C-j ?{ return ?! escape ?< escape ?% ?} ?e ?l ?s return ?} ?\C-q ?\C-j ?e ?l ?s return ?! escape ?<])
(fset 'correct-bracket
   [?\C-s ?{ ?\C-a tab down tab])
(fset 'correct-else
   [?\C-s ?e ?l ?s ?\C-a tab up tab down down tab])
(fset 'replace-exit
   [escape ?% ? ?/ ?> return ?/ ?> return ?! ?\C-x ?\C-s ?\C-x ?k return])

(keyboard-translate ?\C-h ?\C-?)
(global-set-key [delete]       'delete-char)
(global-set-key [kp-delete]    'delete-char)
(global-set-key "\M-g"         'goto-line)
(global-set-key "\C-x#"        'what-line)
;(global-set-key "\C-x\C-c"      nil)
(global-set-key "\C-x?"        'describe-key)
(global-set-key "\e "          'set-mark-command)
(global-set-key "\C-x\C-q"     'replace-bracket)
(global-set-key "\C-x\C-g"     'replace-else)
(global-set-key "\C-x\C-y"     'correct-bracket)
(global-set-key "\C-x\C-d"     'correct-else)
(global-set-key "\C-x\C-a"     'replace-exit)

(setq-default fill-column 80)

;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)

;(global-set-key "\C-x\C-c\C-z" 'save-buffers-kill-emacs)

;(global-set-key [home]      'beginning-of-line)
;(global-set-key [end]       'end-of-line)
(global-set-key [\C-prior]  'beginning-of-buffer)
(global-set-key [\C-next]   'end-of-buffer)
(global-set-key [\C-up]     'backward-paragraph)
(global-set-key [\C-down]   'forward-paragraph)
(global-set-key [\C-right]  "\exforward-word\C-m\exforward-word\C-m\exbackward-word\C-m")
(global-set-key [\C-left]   'backward-word)

(setq auto-mode-alist (cons '("\\.html\\'" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm\\'"  . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.inc\\'"  . html-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.js\\'"   . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.css\\'"  . java-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.comp\\'" . text-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.scn\\'"  . pascal-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.prs\\'"  . pascal-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.pl\\'"   . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cgi\\'"  . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pm\\'"   . perl-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.f\\'"   . fortran-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.h\\'"   . fortran-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.h\\'"   . c++-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.php\\'"   . php-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.tex\\'"   . LaTeX-mode) auto-mode-alist))

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))


(add-hook 'pascal-mode-hook     'turn-on-font-lock)
(add-hook 'html-mode-hook       'turn-on-font-lock)
(add-hook 'latex-mode-hook      'turn-on-font-lock)
;(add-hook 'tex-mode-hook        'turn-on-font-lock)
(add-hook 'c++-mode-hook        'turn-on-font-lock)
(add-hook 'fortran-mode-hook    'turn-on-font-lock)
(add-hook 'perl-mode-hook       'turn-on-font-lock)
(add-hook 'write-file-hooks     'time-stamp)
(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'c-mode-hook          'turn-on-font-lock)

(autoload 'flyspell-babel "flyspell babel automatic language detection" t)
(add-hook 'latex-mode-hook 'turn-on-flyspell)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(add-hook 'tex-mode-hook 'turn-on-flyspell)
(setq-default ‘flyspell-issue-message-flag’ nil)
(add-hook 'flyspell-mode-hook 'flyspell-buffer)


(cond ((not running-xemacs)(global-font-lock-mode t)))
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(put 'eval-expression 'disabled nil)
(custom-set-variables
 '(make-backup-files nil))

(normal-erase-is-backspace-mode 0)

;; Author: Patrick Gundlach 
;; nice mark - shows mark as a highlighted 'cursor' so user 'always' 
;; sees where the mark is. Especially nice for killing a region.
(defvar pg-mark-overlay nil
  "Overlay to show the position where the mark is") 
(make-variable-buffer-local 'pg-mark-overlay)

(put 'pg-mark-mark 'face 'secondary-selection)

(defvar pg-mark-old-position nil
  "The position the mark was at. To be able to compare with the
current position")

(defun pg-show-mark () 
  "Display an overlay where the mark is at. Should be hooked into 
activate-mark-hook" 
  (unless pg-mark-overlay 
    (setq pg-mark-overlay (make-overlay 0 0))
    (overlay-put pg-mark-overlay 'category 'pg-mark-mark))
  (let ((here (mark t)))
    (when here
      (move-overlay pg-mark-overlay here (1+ here)))))

(defadvice  exchange-point-and-mark (after pg-mark-exchange-point-and-mark)
  "Show visual marker"
  (pg-show-mark))

(ad-activate 'exchange-point-and-mark)
(add-hook 'activate-mark-hook 'pg-show-mark)

;(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-d") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

(global-font-lock-mode 1)


(set-face-foreground 'mode-line-buffer-id "white")
;(put 'customize-face 'mode-line-buffer-id)

;(add-to-list 'load-path "/home/sietze/.emacs.d")

;(require 'php-mode)
;(setq auto-mode-alist
;  (append '(("\\.php$" . php-mode)
;            ("\\.module$" . php-mode))
;              auto-mode-alist))

;;(autoload 'php-mode "php-mode" "PHP editing mode" t)
;;(add-to-list 'auto-mode-alist '("\\.php3\\'" . php-mode))
;;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))


(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
