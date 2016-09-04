
;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((minver "23.3"))
  (when (version<= emacs-version "23.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(setq inhibit-startup-message t)  ;; hide the startup message
(load-theme 'material t) ;; load material themen
(global-linum-mode t) ;; enable line numbers globally

(require 'init-elpa)

(require 'init-editing-utils)
(require 'init-whitespace)

(require 'init-c)
(require 'init-python-mode)


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


(provide 'init)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("9e9f2fe0614ba1e521f936dd9be75f6eea611274279447d0df04511091082c38" "f0f50a70587bc96234dfa0b7fab8e9cf6b99f585b219242eef4ad60ef2ec7677" "7911cd1188ac372ea7a175c6a3253c18712b53bb20fd24e466c1357870012c1e" default)))
 '(fci-rule-color "#37474f")
 '(flymake-google-cpplint-command "F:\\python3\\Scripts\\cpplint.exe")
 '(hl-sexp-background-color "#1c1f26")
 '(package-selected-packages
   (quote
    (google-c-style flymake-cursor flymake-google-cpplint iedit auto-complete-c-headers yasnippet auto-complete omtose-phellack-theme ein let-alist el-get material-theme flycheck elpy better-defaults)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
