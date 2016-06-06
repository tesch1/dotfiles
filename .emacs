;;
;;

;; (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

;; enable a Matlab mode
(autoload 'matlab-mode "~/.emacs.d/matlab.el" "Enter Octave mode." t)
(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)
(autoload 'magicalii-mode "~/.emacs.d/magicalii-mode.el" t)
(autoload 'bruker-mode "~/.emacs.d/bruker-mode.el" t)
(autoload 'web-mode "~/.emacs.d/web-mode.el" t)
(autoload 'go-mode "~/.emacs.d/go-mode.el" t)
(autoload 'lua-mode "~/.emacs.d/lua-mode.el" t)
(autoload 'flex-mode "~/.emacs.d/flex-mode.el" t)
(autoload 'bison-mode "~/.emacs.d/bison-mode.el" t)
;(autoload 'wolfram-mode "~/.emacs.d/wolfram-mode.el" nil t)
;(autoload 'mathematica-mode "~/.emacs.d/mathematica.el" nil t)

;(add-to-list 'load-path "~/.emacs.d/")
;(require 'bruker-mode)

(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) ;; Matlab
;(setq auto-mode-alist (cons '("\\.m\\'" . objc-mode) auto-mode-alist)) ;; Objective-C
(setq auto-mode-alist (cons '("\\.mm\\'" . objc-mode) auto-mode-alist)) ;; Objective-C++
(setq auto-mode-alist (cons '("\\.inl\\'" . c++-mode) auto-mode-alist)) ;; C++
(setq auto-mode-alist (cons '("\\.swg\\'" . c-mode) auto-mode-alist)) ;; swig
(setq auto-mode-alist (cons '("\\.cu\\'" . c-mode) auto-mode-alist)) ;; CUDA
(setq auto-mode-alist (cons '("\\.cl\\'" . c-mode) auto-mode-alist)) ;; OpenCL
(setq auto-mode-alist (cons '("\\.vsh\\'" . c-mode) auto-mode-alist)) ;; Vertex Shader OpenGL
(setq auto-mode-alist (cons '("\\.fsh\\'" . c-mode) auto-mode-alist)) ;; Fragment Shader OpenGL
(setq auto-mode-alist (cons '("\\.glsl\\'" . c-mode) auto-mode-alist)) ;; OpenGL Shader Language
(setq auto-mode-alist (cons '("\\.html\\'" . web-mode) auto-mode-alist)) ;; templates
(setq auto-mode-alist (cons '("\\.go\\'" . go-mode) auto-mode-alist)) ;; go
(setq auto-mode-alist (cons '("\\.lua\\'" . lua-mode) auto-mode-alist)) ;; Lua
(setq auto-mode-alist (cons '("\\.cmn\\'" . fortran-mode) auto-mode-alist)) ;; fortran common

(add-to-list 'auto-mode-alist '(".*/SConstruct*" . python-mode))
(add-to-list 'auto-mode-alist '(".*/maclib/*." . magicalii-mode))
(add-to-list 'auto-mode-alist '("\\.ppg\\'" . bruker-mode))
(add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
  (append
   '(("CMakeLists\\.txt\\'" . cmake-mode))
   '(("\\.cmake\\'" . cmake-mode))
   auto-mode-alist))

;
; disable auto autofilling in matlab mode (?)
;
(defun my-matlab-mode-hook ()
  (setq fill-column 176))		; where auto-fill should wrap - never!
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

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
    (setq parent-dir (file-name-nondirectory 
                      (directory-file-name 
                       (file-name-directory (buffer-file-name)))))
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
 '(c-offsets-alist (quote ((substatement-open . 0) (innamespace . 0))))
 '(c-tab-always-indent nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(fortran-line-length 120)
 '(frame-background-mode (quote dark))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lua-indent-level 2)
 '(matlab-indent-level 4)
 '(python-indent 4)
 '(python-indent-offset 4)
 '(show-paren-mode t)
 '(spice-output-local "Gnucap")
 '(spice-simulator "Gnucap")
 '(spice-waveform-viewer "Gwave")
 '(tool-bar-mode nil)
 '(toolbar-visible-p nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "cyan" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 131 :width normal :foundry "bitstream" :family "Courier 10 Pitch"))))
 '(font-lock-comment-face ((t (:foreground "Yellow"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "gray"))))
 '(font-lock-string-face ((t (:foreground "Orange")))))

