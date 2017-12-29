; Autoload packages in lib dir
(defun pnh-reinit-libs ()
  (interactive)
  (let ((generated-autoload-file (concat user-emacs-directory "my-autoload.el")))
    (dolist (d (directory-files (concat user-emacs-directory "lib") t "^[^\.]"))
      (dolist (f (directory-files d t "\\.el$"))
        (byte-compile-file f))
      (update-directory-autoloads d))))

(dolist (l (directory-files (concat user-emacs-directory "lib") nil "^[^\.]"))
  (add-to-list 'load-path (concat user-emacs-directory "lib/" l))
  (autoload (intern l) (concat l ".el")))

(when (not (file-exists-p (concat user-emacs-directory "my-autoload.el")))
  (pnh-reinit-libs))

(load (concat user-emacs-directory "my-autoload.el"))


; Custom variables (machine-generated)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


; Emacs chrome config
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq visible-bell 1)


; PATH
(setenv "PATH"
  (concat "/usr/local/bin" ":"
          "~/.stack/programs/x86_64-osx/ghc-8.0.2/bin" ":"
          "~/.local/bin" ":"
          (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("~/.stack/programs/x86_64-osx/ghc-8.0.2/bin")))
(setq exec-path (append exec-path '("~/.local/bin")))


; Color theme
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-night)


; Evil (vim bindings)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)


; Evil-escape (escape with "fd")
(require 'evil-escape)
(evil-escape-mode)


; Relative line numbers
(require 'linum-relative)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")


; Projectile (project management)
(require 'projectile)
(projectile-mode) ; Automatically discover projects


; Fuzzy-matching for ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)


; Haskell-mode
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/lib/haskell-mode/")

;; Haskell compilation
(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
  '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

(setq haskell-compile-cabal-build-command "stack build")

;; Haskell REPL
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)

(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)


; ghc-mod (Haskell compiler info)
(add-to-list 'load-path "~/.emacs.d/lib/ghc-mod/elisp")
(setq ghc-debug t) ; enable debug logging
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
