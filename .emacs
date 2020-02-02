;; Enable MELPA repository
(require 'package)
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

;; MELPA packages
(defun ensure-package-installed (&rest packages)
  (mapcar
    (lambda (package)
      (unless (package-installed-p package)
        (package-refresh-contents)
        (package-install package)))
      packages)
)
(ensure-package-installed
 'monokai-theme
 'rust-mode
 'toml-mode
 'markdown-mode
 'powerline
)

;; Render whitespaces
(setq-default show-trailing-whitespace t)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Show line number with format
(global-linum-mode 1)
(setq linum-format "%4d \u2502")

;; Disable menu bar
(menu-bar-mode -1)

;; Show matching pairs
(show-paren-mode 1)

;; Disable backup files
(setq make-backup-files nil)

;; Disable auto save
(setq auto-save-default nil)

;; Load theme
(load-theme 'monokai t)

;; Enable powerline
(powerline-default-theme)
