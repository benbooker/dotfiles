;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Iosevka Term Curly" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 20))

(add-hook 'org-mode-hook (lambda () (setq-local line-spacing 0.1)))

;;(add-hook 'org-mode-hook (lambda () (setq-local line-spacing 0.2)))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Sync/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-hide-emphasis-markers t
        org-appear-autoemphasis t
        org-appear-autolinks t
        org-appear-autoentities t
        org-appear-autosubmarkers t
        org-appear-trigger 'manual)

  (add-hook 'org-mode-hook
            (lambda ()
              (add-hook 'evil-insert-state-entry-hook #'org-appear-manual-start nil t)
              (add-hook 'evil-insert-state-exit-hook #'org-appear-manual-stop nil t))))




(setq org-startup-indented t)

(use-package! org-modern
  :ensure t
  :custom
  (org-modern-hide-stars nil)                     ; show the actual stars
  (org-modern-star '("◉" "○" "✸" "✿"))            ; heading levels
  (org-modern-ellipsis "…")                       ; folded outline marker
  (org-modern-list '((?* . "•") (?+ . "‣")))       ; bullet styles
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

(after! org
  (require 'org-modern-indent nil :noerror)
  (add-hook! 'org-mode-hook :append #'org-modern-indent-mode))



; remove background from #+BEGIN_SRC header and footer
(after! org
  (custom-set-faces!
    '(org-block-begin-line :background nil :inherit default)
    '(org-block-end-line   :background nil :inherit default)))



(setq org-capture-templates
      '(("j" "Journal Entry"
         plain
         (file+olp+datetree "~/Documents/org/journal.org")
         "%?\n"
         :tree-type day
         :empty-lines 1)))


