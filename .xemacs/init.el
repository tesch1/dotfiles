(setq load-path (cons "~/.xemacs" load-path))
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;; (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)


;; mouse-wheel: scroll
(global-set-key 'button4 'scroll-down-one)
(global-set-key 'button5 'scroll-up-one)

;; on the mac two-finger scroll pad define these so they dont beep
;;  this is probably close to what was meant...
(global-set-key 'button6 'scroll-up-one)
(global-set-key 'button7 'scroll-down-one)

(global-set-key "\C-x\C-b" 'electric-buffer-list)
;	.emacs:
;	emacs startup file. 
;
;	$Id: .emacs,v 1.4 1995/08/19 01:13:28 dparter Exp $
;	
;	this file is empty by default, there is nothing needed
;
;;;****************************************************************************
;;; modified 10may95 timc!
;;; timc!'s .emacs file, stolen from:
;;; Dean's .emacs file, stolen from:
;;; This is Steve Swartz's .emacs file for emacs19
;;; Built 11/7/89 from thp's file
;;;
;;; Set debug on for .emacs file itself -- setup display options

;; ============================
;; End of Options Menu Settings
;(custom-set-variables
; '(c-site-default-style "bsd"))
;(custom-set-faces)

;=============================

;; ###########################################################################
;; The following two lines fix a problem that some people have. The original
;; emacs mapped C-h to be the help screen. Unfortunately, this is the same 
;; as backspace. So, attempting to press backspace would bring up a help
;; screen. The new key-binding for help is C-x h.
(global-set-key "\^xh" 'help-for-help)
(global-set-key "\^h"  'backward-delete-char-untabify)

;(setq inhibit-startup-message t)
;;;****************************************************************************
;;; Change default behavior to suit myself
;;;****************************************************************************
;(load-library "paren")
;;(setq inhibit-startup-message t)
;(setq text-mode-hook '(lambda () (auto-fill-mode 0)))
;;(setq-default fill-column 78)
;(setq blink-matching-paren-distance 12000)
(setq line-number-mode t)
(setq column-number-mode t)
; (auto-fill-mode 0) ; doesnt' seem to change matlab mode :(

;; enable a Matlab mode
(autoload 'matlab-mode "~/.xemacs/matlab.el" "Enter Octave mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) ;; Matlab
(setq auto-mode-alist (cons '("\\.cu\\'" . c-mode) auto-mode-alist)) ;; CUDA
(setq auto-mode-alist (cons '("\\.cl\\'" . c-mode) auto-mode-alist)) ;; OpenCL

; untested:
(defun my-matlab-mode-hook ()
  (setq fill-column 176))		; where auto-fill should wrap - never!
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;;(setq-default c-auto-newline t)
;;(setq-default c-argdecl-indent 0)

(setq-default version-control 'never)

;;;********
;;; PRINTER
;;;********
(setq lpr-switches '("-Plps1"))
(setq lpr-command "lpr")


;;;****************************************************************************
;;; Highlighting and display stuff
;;;****************************************************************************

;;;****************************************************************************
;;; Change default key mappings
;;;****************************************************************************

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-c\C-c" 'compile)
(global-set-key "\C-c\C-s" 'shell)
;(global-set-key "\C-c\C-g" 'what-page)
;;(global-set-key "\C-c\C-q" 'indent-region)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)

;;;****************************************************************************
;;; Diary things
;;;****************************************************************************

;;(setq diary-file "~/.diary")


;;;****************************************************************************
;;; Turn off debug -- .emacs is done
;;; Clear message area
;;;****************************************************************************

;(setq debug-on-error nil)
;(setq debug-on-signal nil)
;;(display-time)
;(message " ")

;(setq minibuffer-max-depth nil)

;;=============================================================================
;;                    scroll on  mouse wheel
;;=============================================================================
      
; scroll on wheel of mouses
(define-key global-map 'button4
  '(lambda (&rest args)
     (interactive) 
     (let ((curwin (selected-window)))
       (select-window (car (mouse-pixel-position)))
       (scroll-down 5)
       (select-window curwin)
       )))
(define-key global-map [(shift button4)]
  '(lambda (&rest args)
     (interactive) 
     (let ((curwin (selected-window)))
       (select-window (car (mouse-pixel-position)))
       (scroll-down 1)
       (select-window curwin)
       )))
(define-key global-map [(control button4)]
  '(lambda (&rest args)
     (interactive) 
     (let ((curwin (selected-window)))
       (select-window (car (mouse-pixel-position)))
       (scroll-down)
       (select-window curwin)
       )))
(define-key global-map 'button5
  '(lambda (&rest args)
     (interactive) 
     (let ((curwin (selected-window)))
       (select-window (car (mouse-pixel-position)))
       (scroll-up 5)
       (select-window curwin)
       )))
(define-key global-map [(shift button5)]
  '(lambda (&rest args)
     (interactive) 
     (let ((curwin (selected-window)))
       (select-window (car (mouse-pixel-position)))
       (scroll-up 1)
       (select-window curwin)
       )))
(define-key global-map [(control button5)]
  '(lambda (&rest args)
     (interactive) 
     (let ((curwin (selected-window)))
       (select-window (car (mouse-pixel-position)))
       (scroll-up)
       (select-window curwin)
       )))
