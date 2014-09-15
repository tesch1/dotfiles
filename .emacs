;;
;;

;; (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

;; enable a Matlab mode
(autoload 'matlab-mode "~/.xemacs/matlab.el" "Enter Octave mode." t)
(autoload 'cmake-mode "~/.xemacs/cmake-mode.el" t)
(autoload 'magicalii-mode "~/.xemacs/magicalii-mode.el" t)
(autoload 'web-mode "~/.xemacs/web-mode.el" t)
(autoload 'go-mode "~/.xemacs/go-mode.el" t)
(autoload 'lua-mode "~/.xemacs/lua-mode.el" t)

(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) ;; Matlab
(setq auto-mode-alist (cons '("\\.cu\\'" . c-mode) auto-mode-alist)) ;; CUDA
(setq auto-mode-alist (cons '("\\.cl\\'" . c-mode) auto-mode-alist)) ;; OpenCL
(setq auto-mode-alist (cons '("\\.html\\'" . web-mode) auto-mode-alist)) ;; templates
(setq auto-mode-alist (cons '("\\.go\\'" . go-mode) auto-mode-alist)) ;; go
(setq auto-mode-alist (cons '("\\.lua\\'" . lua-mode) auto-mode-alist)) ;; Lua

;
; disable auto autofilling in matlab mode (?)
;
(defun my-matlab-mode-hook ()
  (setq fill-column 176))		; where auto-fill should wrap - never!
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

(add-to-list 'auto-mode-alist 
   '(".*/maclib/*." . magicalii-mode))

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
  (append
   '(("CMakeLists\\.txt\\'" . cmake-mode))
   '(("\\.cmake\\'" . cmake-mode))
   auto-mode-alist))

;; uniquify.el is a helper routine to help give buffer names a better unique name.
(when (load "uniquify" 'NOERROR)
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)
 ;(setq uniquify-buffer-name-style 'post-forward)
  )
(defun cmake-rename-buffer ()
  "Renames a CMakeLists.txt buffer to cmake-<directory name>."
  (interactive)
  ;(print (concat "buffer-filename = " (buffer-file-name)))
  ;(print (concat "buffer-name     = " (buffer-name)))
  (when (and (buffer-file-name) (string-match "CMakeLists.txt" (buffer-name)))
    ;(setq file-name (file-name-nondirectory (buffer-file-name)))
    (setq parent-dir (file-name-nondirectory (directory-file-name (file-name-directory (buffer-file-name)))))
    ;(print (concat "parent-dir = " parent-dir))
    (setq new-buffer-name (concat "CMAKE-" parent-dir))
    ;(print (concat "new-buffer-name= " new-buffer-name))
    (rename-buffer new-buffer-name t)
    )
  )

(add-hook 'cmake-mode-hook (function cmake-rename-buffer))

(setq line-number-mode t)
(setq column-number-mode t)

;; mouse-wheel: scroll
;(global-set-key 'button4 'scroll-down-one)
;(global-set-key 'button5 'scroll-up-one)

;; on the mac two-finger scroll pad define these so they dont beep
;;  this is probably close to what was meant...
;(global-set-key 'button6 'scroll-up-one)
;(global-set-key 'button7 'scroll-down-one)

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\M-g" 'goto-line)

(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)

; need these 4 settings to map command to meta on macos (emacsformacosx)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(c-basic-offset 2)
 '(c-tab-always-indent nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lua-indent-level 2)
 '(matlab-indent-level 2)
 '(python-indent 2)
 '(python-indent-offset 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(toolbar-visible-p nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "Yellow"))))
 '(font-lock-string-face ((t (:foreground "Orange"))))
 '(menu ((t (:inverse-video t)))))

