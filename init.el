;; Changing font size
(set-face-attribute 'default nil :height 70)

;; Disabling the toolbar completely
(tool-bar-mode -1)

;; Adding tuareg to emacs
(add-to-list 'load-path "/home/hamidi/.opam/system/share/emacs/site-lisp/")
(load "/home/hamidi/.opam/system/share/emacs/site-lisp/tuareg-site-file")

;; Add opam emacs directory to the load-path
     (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
     (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
     ;; Load merlin-mode
     (require 'merlin)
     ;; Start merlin on ocaml files
     (add-hook 'tuareg-mode-hook 'merlin-mode t)
     (add-hook 'caml-mode-hook 'merlin-mode t)
     ;; Enable auto-complete
     (setq merlin-use-auto-complete-mode 'easy)
     ;; Use opam switch to lookup ocamlmerlin binary
     (setq merlin-command 'opam)

;; Add ocp_indent indentation mode for ocaml
;;(add-to-list 'load-path "/home/hamidi/.opam/system/share/emacs/site-lisp")
;;   (require 'ocp-indent)

;; Add support for Scala
(add-to-list 'load-path "/usr/local/src/scala/misc/scala-tool-support-master/tool-support/emacs")
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook '(lambda () (yas/minor-mode-on)))


;; Installing ELPA (Emacs package manager) and Ensime mode for Scala Dev
;(require 'package)
;(add-to-list 'package-archives
;	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;We have "sbt" and "scala" in /usr/local/bin so we add this path to the PATH environment
;(setq exec-path (append exec-path '("/usr/local/bin")))
;(setq exec-path (append exec-path '("/usr/local/sbin")))
;(setenv "PATH" (shell-command-to-string "/bin/bash -c 'echo -n $PATH'"))

;(require 'ensime)
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Vim emulation in emacs
(push "~/.emacs.d/evil" load-path)
    (require 'evil)
    (evil-mode 1)

;; Package managers
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("marmalade" . "https://marmalade-repo.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))
