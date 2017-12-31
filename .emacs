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
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
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
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


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
(add-to-list 'load-path "~/lib/emacs/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/lib/emacs/haskell-mode/")


; Intero
(add-to-list 'load-path "~/.emacs.d/lib/intero/elisp")
(require 'intero)
(intero-global-mode 1)
