; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; let's define a funcall which initializes auto-complete-c=headers
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '(("/usr/lib/gcc/mingw32/4.8.1/include")
  ("/usr/lib/gcc/mingw32/4.8.1/include-fixed")
  ("/usr/lib/gcc/mingw32/4.8.1/include/c++")
  ("/usr/lib/gcc/mingw32/4.8.1/include/c++/mingw32")
  ("/usr/lib/gcc/mingw32/4.8.1/include/c++/backward")
  ("C:\\MinGW\\include")
  ("/usr/mingw32/include")))
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

; start flymake-google-cpplint-load
; let's define a function for flymake initialization
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "F:\\python3\\Scripts\\cpplint.exe"))
  (flymake-google-cpplint-load)
  )

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; turn on Semantic
(semantic-mode 1)
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn onede mode
(global-ede-mode 1)
; create a project for our program.
(ede-cpp-root-project "My project" :file "~/tmp/src/main.cpp"
                      :include-path '("/../my_inc"))
; you can use system-include-path for setting up the sys
(global-semantic-idle-scheduler-mode 1)

(provide 'init-c)
