
(require 'package)
(setq package-enable-at-startup nil)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/evil")

(require 'evil)
(evil-mode 1)
(helm-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212337" "#ff5370" "#c7f59b" "#ffbd76" "#70b0ff" "#baacff" "#34d3fb" "#e4f3fa"])
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "2a3ffb7775b2fe3643b179f2046493891b0d1153e57ec74bbe69580b951699ca" "1728dfd9560bff76a7dc6c3f61e9f4d3e6ef9d017a83a841c117bd9bebe18613" "f589e634c9ff738341823a5a58fc200341b440611aaa8e0189df85b44533692b" "0713580a6845e8075113a70275b3421333cfe7079e48228c52300606fa5ce73b" "f30aded97e67a487d30f38a1ac48eddb49fdb06ac01ebeaff39439997cbdd869" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" default)))
 '(display-battery-mode t)
 '(display-line-numbers-type (quote relative))
 '(display-time-mode t)
 '(fci-rule-color "#383e5c")
 '(jdee-db-active-breakpoint-face-colors (cons "#161a2a" "#baacff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#161a2a" "#c7f59b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#161a2a" "#383e5c"))
 '(objed-cursor-color "#ff5370")
 '(package-selected-packages
   (quote
    (linum-relative pdfgrep pdf-tools smart-mode-line-powerline-theme smart-mode-line powerline-evil neotree tabbar helm doom-themes evil)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(vc-annotate-background "#212337")
 '(vc-annotate-color-map
   (list
    (cons 20 "#c7f59b")
    (cons 40 "#d9e28e")
    (cons 60 "#eccf82")
    (cons 80 "#ffbd76")
    (cons 100 "#ffb071")
    (cons 120 "#ffa36c")
    (cons 140 "#ff9668")
    (cons 160 "#e89d9a")
    (cons 180 "#d1a4cc")
    (cons 200 "#baacff")
    (cons 220 "#d18ecf")
    (cons 240 "#e8709f")
    (cons 260 "#ff5370")
    (cons 280 "#cd4d6b")
    (cons 300 "#9b4866")
    (cons 320 "#694361")
    (cons 340 "#383e5c")
    (cons 360 "#383e5c")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono for Powerline" :foundry "outline" :slant normal :weight bold :height 98 :width normal)))))
(evil-mode t)

(require 'doom-themes)
(setq inhibit-startup-screen t)
(load-theme 'doom-one)

(setq doom-line-numbers-style 'relative)
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("blue" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))


(require 'powerline-evil)
(powerline-evil-vim-color-theme)

;; These two lines are just examples
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
(setq sml/theme 'powerline)
(sml/setup)

(setq shell-file-name (executable-find "zsh.exe"))
;;(setq shell-file-name (executable-find "zsh-5.5.1.exe"))

(setenv "PATH" (concat (getenv "PATH") ":D:\\home\\apps\\cygwin\\bin"))
;;(setq exec-path (append exec-path '("D:\\home\\apps\\cygwin\\bin")))
(setq explicit-shell-file-name "D:\\home\\apps\\cygwin\\bin\\zsh.exe")
(setq shell-file-name "zsh")
(setq explicit-zsh.exe-args '("-l" "-i"))

(setq display-line-numbers-mode t)
(setq display-line-numbers 'relative)
;;wont be able to open pdf's in docview mode without ghostscript
(setq doc-view-ghostscript-program "C:\\Program Files\\gs\\gs9.50\\bin\\gswin64.exe")
;;settings this for zsh. basically lets zsh know its running inside emacs and not a terminal
(setenv "INSIDE_EMACS")
(windmove-default-keybindings)