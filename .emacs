;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)
(setq load-path (cons "~/.emacs.d" load-path))

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)
(setq auto-mode-alist (cons '("\\.cl\\'" . c-mode) auto-mode-alist)) ;; OpenCL
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-g" 'goto-line)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; undo stupid new emacs default to split horizontal
(setq split-height-threshold 0) (setq split-width-threshold 0)

;; default to unified diffs
(setq diff-switches "-u")

;; hide M-x M-c from fat fingers!
(defun david-kill-C-x-C-c ()
  (interactive)
  (define-key global-map [(control x) (control c)] (lambda () (interactive) (message "No! Use the mouse!"))))

;; enable a Matlab mode
;;(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(autoload 'matlab-mode "~/.xemacs/matlab.el" "Enter Octave mode." t)
;; (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) ;; Matlab
(setq matlab-indent-function t)
(setq matlab-indent-level 2)
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq fill-column 176))               ; where auto-fill should wrap - never!
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;(setq load-path (cons (expand-file-name "~/.xemacs") load-path))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

(require 'magicalii-mode)
(add-to-list 'auto-mode-alist 
             '(".*/maclib/*." . magicalii-mode))

(require 'bison-mode)
(setq auto-mode-alist (cons '("\\.y\\'" . bison-mode) auto-mode-alist)) ;; bison / yacc

;(require 'yacc-mode)
;(setq auto-mode-alist (cons '("\\.y\\'" . yacc-mode) auto-mode-alist)) ;; bison / yacc

(require 'flex-mode)
(setq auto-mode-alist (cons '("\\.l\\'" . flex-mode) auto-mode-alist)) ;; lex / flex

;; always end a file with a newline
;(setq require-final-newline 'query)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(c-tab-always-indent nil)
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "cyan" :background "black" :size "12pt" :family "Fixed" :bold t))))
 '(blue ((t (:foreground "blue" :background "blue8"))))
 '(cperl-array-face ((((class color) (background light)) (:foreground "lightblue" :bold t))))
 '(custom-comment-face ((((class grayscale color) (background light)) (:background "blue"))) t)
 '(custom-comment-tag-face ((((class color) (background light)) (:foreground "light blue"))) t)
 '(custom-group-tag-face ((((class color) (background light)) (:foreground "red4" :background "light green" :underline t))) t)
 '(custom-rogue-face ((((class color)) (:foreground "white" :background "black"))) t)
 '(custom-state-face ((((class color) (background light)) (:foreground "green2"))) t)
 '(custom-variable-tag-face ((((class color) (background dark)) (:underline t :foreground "orange"))) t)
 '(diff-file-header-face ((((class color) (background light)) (:foreground "green4" :background "white" :bold t))))
 '(diff-header-face ((((class color) (background light)) (:foreground "black" :background "grey85"))))
 '(diff-hunk-header-face ((((class color) (background light)) (:foreground "blue" :background "grey85"))))
 '(diff-index-face ((((class color) (background light)) (:foreground "red" :background "grey70" :bold t))))
 '(dired-face-executable ((((class color)) (:foreground "green1" :background ""))))
 '(font-lock-comment-face ((t (:foreground "yellow1"))))
 '(font-lock-doc-string-face ((t (:foreground "alice blue"))))
 '(font-lock-emphasized-face ((t (:foreground "red" :background "lightyellow2"))))
 '(font-lock-function-name-face ((t (:foreground "white"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:foreground "white"))))
 '(font-lock-other-emphasized-face ((t (:italic t :background "brown"))))
 '(font-lock-other-type-face ((t (:foreground "green1"))))
 '(font-lock-preprocessor-face ((t (:foreground "orange"))))
 '(font-lock-reference-face ((t (:foreground "yellow2"))))
 '(font-lock-string-face ((t (:foreground "aliceblue"))))
 '(font-lock-type-face ((t (:foreground "gold"))))
 '(font-lock-variable-name-face ((t (:foreground "lawn green"))))
 '(font-lock-warning-face ((((class color) (background light)) (:foreground "magenta"))))
 '(highlight ((t (:foreground "orange4" :background "darkgreen2"))))
 '(isearch ((t (:background "orange"))))
 '(list-mode-item-selected ((t (:foreground "black" :background "gray68"))))
 '(message-header-other-face ((((class color) (background dark)) (:foreground "pink"))))
 '(mode-line-buffer-id ((t (:foreground "green3" :background "black"))))
 '(modeline-mousable-minor-mode ((t (:foreground "green" :background "Gray20"))))
 '(paren-blink-off ((t (:foreground "black" :background "lightblue"))))
 '(paren-match ((t (:foreground "yellow" :background "DeepPink"))))
 '(primary-selection ((t (:background "gray35"))))
 '(secondary-selection ((t (:foreground "red" :background "paleturquoise"))))
 '(text-cursor ((t (:foreground "black" :background "red"))))
 '(unicode-invalid-sequence-warning-face ((t (:foreground "black" :background "darkseagreen"))))
 '(widget-documentation-face ((((class color) (background light)) (:foreground "dark green" :background "white"))) t)
 '(widget-field-face ((((class grayscale color) (background light)) (:foreground "pink2" :background "brown"))) t)
 '(widget-inactive-face ((((class grayscale color) (background light)) (:foreground "dim grey"))) t)
 '(zmacs-region ((t (:background "grey35")))))
