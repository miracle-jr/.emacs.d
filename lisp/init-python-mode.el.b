(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

(require 'whitespace)
(add-hook 'python-mode-hook
          '(lambda () (whitespace-mode 1)) t)


(provide 'init-python-mode)
