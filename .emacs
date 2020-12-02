;;; .emacs --- emacs startup file

;;; Commentary:
;; shutup Lisp flycheck

;;; Code:
;;no menubar
;;(menu-bar-mode -1)

;; setup the modeline nicely
(setq line-number-mode t)
(setq column-number-mode t)
(setq show-trailing-whitespace t)
(setq fill-column 72)

;; mouse-wheel: scroll
;;(global-set-key 'button4 'scroll-down-one)
;;(global-set-key 'button5 'scroll-up-one)

;; on the mac two-finger scroll pad define these so they dont beep
;;  this is probably close to what was meant...
;;(global-set-key 'button6 'scroll-up-one)
;;(global-set-key 'button7 'scroll-down-one)

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\M-g" 'goto-line)

(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)

;; need these 4 settings to map command to meta on macos (emacsformacosx)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(autoload 'magicalii-mode "~/.emacs.d/magicalii-mode.el" t)
(autoload 'bruker-mode "~/.emacs.d/bruker-mode.el" t)

;;(add-to-list 'load-path "~/.emacs.d/")
;;(require 'bruker-mode)
;;(require 'smooth-scroll)

;; list the packages you want
(setq package-list '(flycheck
                     cpputils-cmake
                     web-mode
                     ;;modern-cpp-font-lock
                     ;;irony
                     clang-format
		     editorconfig
                     lsp-mode
                     lsp-ui
                     ))

;; setup MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
;;(package-refresh-contents) ;; do this occasionally, not every time
;; done MELPA

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; enable flycheck
;;(global-flycheck-mode)
;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
;;(modern-c++-font-lock-global-mode t)

;; enable clang-format
;;(require 'clang-format)
(global-set-key (kbd "C-c C-f") 'clang-format-region)

;; look for .editorconfig file all the time
(editorconfig-mode 1)

;; use CMake to build c++ files for flycheck
;;(package-install 'cpputils-cmake)
;(setq cppcm-write-flymake-makefile nil)
;(setq cppcm-build-dirname "Build")
;(add-hook 'c-mode-common-hook
;          (lambda ()
;            (if (derived-mode-p 'c-mode 'c++-mode)
;                (cppcm-reload-all)
;              )))


(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode)) ;; Matlab
(add-to-list 'auto-mode-alist '("\\.md\\'" . rst-mode)) ;; ReStructured Text
;;(add-to-list 'auto-mode-alist '("\\.m\\'" . objc-mode)) ;; Objective-C
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode)) ;; Objective-C++
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode)) ;; C++
(add-to-list 'auto-mode-alist '("\\.swg\\'" . c-mode)) ;; swig
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c-mode)) ;; CUDA
(add-to-list 'auto-mode-alist '("\\.cl\\'" . c-mode)) ;; OpenCL
(add-to-list 'auto-mode-alist '("\\.vsh\\'" . c-mode)) ;; Vertex Shader OpenGL
(add-to-list 'auto-mode-alist '("\\.fsh\\'" . c-mode)) ;; Fragment Shader OpenGL
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . c-mode)) ;; OpenGL Shader Language
(add-to-list 'auto-mode-alist '("\\.cmn\\'" . fortran-mode)) ;; fortran common
(add-to-list 'auto-mode-alist '(".*/SConstruct*" . python-mode))
(add-to-list 'auto-mode-alist '(".*/maclib/*." . magicalii-mode))
(add-to-list 'auto-mode-alist '("\\.ppg\\'" . bruker-mode))
;;(add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))

;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
  (append
   '(("CMakeLists\\.txt\\'" . cmake-mode))
   '(("\\.cmake\\'" . cmake-mode))
   auto-mode-alist))

;; setup lsp-mode
;;; https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
(when (> emacs-major-version 24)
  (require 'lsp)
  (require 'lsp-clients)
  (require 'lsp-ui)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'c++-mode-hook 'lsp)
  (setq lsp-clients-clangd-args '("-j=2" "-background-index" "-log=error"))
  (setq lsp-prefer-flymake nil) ;; Prefer using lsp-ui (flycheck) over flymake.
  (setq lsp-enable-snippet nil) ;;
  ;;(add-hook 'c++-mode-hook 'flycheck-mode)
)

;;
;; disable auto autofilling in matlab mode (?)
;;
(defun my-matlab-mode-hook ()
  (setq-local fill-column 176))		; where auto-fill should wrap - never!
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;; bison file columns
(setq bison-rule-separator-column 6)
(setq bison-rule-enumeration-column 8)
(setq bison-decl-type-column 7)
(setq bison-decl-token-column 7)


;; uniquify.el is a helper routine to help give buffer names a better unique name.
(when (load "uniquify" 'NOERROR)
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)
  ;;(setq uniquify-buffer-name-style 'post-forward)
  )
(defun cmake-rename-buffer ()
  "Renames a CMakeLists.txt buffer to cmake-<directory name>."
  (interactive)
  ;;(print (concat "buffer-filename = " (buffer-file-name)))
  ;;(print (concat "buffer-name     = " (buffer-name)))
  (when (and (buffer-file-name) (string-match "CMakeLists.txt" (buffer-name)))
    ;(setq file-name (file-name-nondirectory (buffer-file-name)))
    (setq parent-dir (file-name-nondirectory
                      (directory-file-name
                       (file-name-directory (buffer-file-name)))))
    ;;(print (concat "parent-dir = " parent-dir))
    (setq new-buffer-name (concat "CMAKE-" parent-dir))
    ;;(print (concat "new-buffer-name= " new-buffer-name))
    (rename-buffer new-buffer-name t)
    )
  )

(add-hook 'cmake-mode-hook (function cmake-rename-buffer))

;; foursptab "style"
(defun set-foursptab-style ()
  "Set the current buffer to horrid four-space tabs."
  (progn (message "FOUR SPACE TAB style!")
         (setq c-basic-offset 4)
         (setq tab-width 4)
         (setq indent-tabs-mode t)
         ))
(defun maybe-foursptab-offset ()
  "Check if the current buffer should get horrid four-space tabs."
  (when (or (string-match "Xturbobadger" buffer-file-name)
            (string-match "Xlitehtml/src" buffer-file-name)
            (string-match "Xnanosvg" buffer-file-name)
            )
    (set-foursptab-style))
  )
(add-hook 'c++-mode-hook 'maybe-foursptab-offset)
(add-hook 'c-mode-hook 'maybe-foursptab-offset)
(add-hook 'text-mode 'maybe-foursptab-offset)
(if (boundp 'fundamental-mode-map)
    (define-key fundamental-mode-map (kbd "TAB") 'self-insert-command))

(when (eq system-type 'darwin)
  (setq custom-file "~/.emacs.d/custom-darwin.el"))
(when (eq system-type 'gnu/linux)
;;  (global-set-key "<mouse-4>" scroll-up-one)
;;  (global-set-key "<mouse-5>" 'scroll-down-one)
  (setq custom-file "~/.emacs.d/custom-linux.el"))
(load custom-file)

(when window-system
  (set-frame-position (selected-frame) -1 32)
  (set-frame-size (selected-frame) 120 63))

(provide '.emacs)
