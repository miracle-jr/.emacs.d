(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

(require 'whitespace)
(add-hook 'python-mode-hook
          '(lambda () (whitespace-mode 1)) t)
(add-hook 'python-mode-hook
          '(lambda () (local-set-key (kbd "M-*") 'pop-tag-mark)) t)

(elpy-enable)
(elpy-use-ipython)


;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python-mode)
