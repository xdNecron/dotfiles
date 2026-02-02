;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "adameq")
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
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-snazzy)
;; (setq doom-font (font-spec :family "Adwaita Mono" :size 18))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/notes/")

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

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; (org-roam-db-autosync-mode)

(setq my/--last-created-node-title nil)

(setq yas-snippet-dirs
      '("~/.config/doom/snippets"))

(use-package! org-roam
 :ensure t
 :custom
 (org-roam-directory (file-truename "~/Documents/notes/roam/")))

(setq org-latex-packages-alist
      '(("dvipsnames" "xcolor" nil nil)
        ("linewidth=1pt" "mdframed" nil nil)
        ("" "minted" nil nil)))

(setq my/uni-path (file-truename (concat org-roam-directory "/uni")))

;; (use-package! websocket
;;   :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        ))

(use-package! org-roam-ui
  :after org-roam
  :hook (org-roam-mode . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-update-on-save t))

(setq org-roam-mode-sections
       (list #'org-roam-backlinks-section
             #'org-roam-reflinks-section
             #'org-roam-unlinked-references-section
             ))

(defun my/replace-with-nobreak ()
  "Replaces spaces behing conjunctions by no-break spaces according
        to Czech stylistic rules."
  (interactive)
  (evil-ex "%s/\\([^a-zA-Z0-9]\\| \\){1}\\(a\\|v\\|i\\|o\\|u\\) /\\1\\2 /g"))

(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "uni")))

(defun my/dired-open-roam-dir ()
  (interactive)
  (dired org-roam-directory))

(defun my/dired-open-uni-notes ()
  (interactive)
  (dired (concat org-roam-directory "/uni/podzim25")))

(cl-defun my/org-roam-node-find (&optional other-window initial-input filter-fn pred &key templates)
  "Creates new NODE and opens it in current window."
  (interactive current-prefix-arg)
  (let ((node (org-roam-node-read initial-input filter-fn pred)))
    (if (org-roam-node-file node)
        (org-roam-node-visit node other-window)
      (let* ((title (org-roam-node-title node)))
        (defun my/--temp-capture-hook ()
          (when-let ((new-node (org-roam-node-from-title-or-alias title)))
            (org-roam-node-open new-node))
          (remove-hook 'org-capture-after-finalize-hook #'my/--temp-capture-hook)))
        (add-hook 'org-capture-after-finalize-hook #'my/--temp-capture-hook)
        (org-roam-capture-
         :node node
         :templates templates
         :props '(:immediate-finish t)))))

(defun my/select-semester ()
  "Opens a minibuffer selection of semeseters in \'my/uni-path\'.
Selected semester is stored in \'my/--last-semester-path\' for use
in calls to \'my/select-course\'."
  (interactive)
  (let ((semester-list '()))
    (dolist (file (directory-files my/uni-path nil "^[^\.{,2}]"))
      (setq semester-list (cons file semester-list)))
    (let ((selection (completing-read "Select semester: " semester-list nil t)))
      (setq my/--last-semester-path (concat my/uni-path "/" selection)) selection)))

(defun my/select-course ()
  "Opens a minibuffer selection of courses found in \'my/--last-semester-path\'.
Return format is \'<course-name>/<course-name>\' for org-capture template compatibility."
  (interactive)
  (let ((course-list '()))
    (dolist (file (directory-files my/--last-semester-path nil "^[^\.{,2}]"))
      (setq course-list (cons file course-list)))
    (let ((selection (completing-read "Select course: " course-list nil t)))
      (concat selection "/" selection))))

(defun my/open-docs ()
  (interactive)
  (let ((docs-path (concat org-roam-directory "/docs")))
    (let ((docs-list (directory-files docs-path nil (rx ".html" eos))))
      (let ((selection  (completing-read "Open docs: " docs-list nil t)))
        (browse-url-xdg-open (format "%s/%s" docs-path selection))))))

(setq org-roam-capture-templates
      '(("d" "default" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t
         )
        ("b" "books" plain
         "\n* About\n** Author: %?\n** Genre: \n\n"
         :target (file+head "books/${slug}.org" "#+title: ${title}\n#+filetags: :books:")
         :unnarrowed t)
        ("u" "uni")
        ("un" "uni notes" plain
         "\n%?"
         :target (file+head "uni/%(my/select-semester)/%(my/select-course)-%<%m%d>.org" "#+title: ${title}\n#+filetags: :uni:
#+setupfile: ~/.dotfiles/.config/doom/setupfiles/latex-default-cs.org")
         :unnarrowed t)
        ("t" "term" plain
         "\n\n* ${title}\n\n%?"
         :target (file+head "terms/t_${slug}.org" "#+title: ${title}\n#+filetags: :terms:"))
        ("ub" "uni literature" plain
         "\n%?"
         :target (file+head "uni/%<%m%d>-${slug}.org" "#+title: ${title}\n#+filetags: :literature:uni:\n")
         :unnarowed t)
        ))

(defun uni/generate-complete-notes (path file-name)
  (let ((file-title (read-from-minibuffer "Title: "))
        (notes (directory-files path 1 (rx (** 1 4 num) ".org" eos)))
        (file-path (concat (file-name-directory path) file-name ".org")))
    (if (not file-title)
        (setq file-title file-name))
    (when notes
      (f-write-text (format "#+title: %s\n#+setupfile: ~/.dotfiles/.config/doom/setupfiles/latex-default.org" file-title) 'utf-8 file-path)
        (dolist (note notes)
          (let ((note-title (org-get-title note)))
            (f-append (format "\n* %s\n#+include: \"%s\" :only-contents t :lines \"7-\"" note-title note) 'utf-8 file-path)))
        (find-file file-path)
        (org-latex-export-to-pdf))))

(defun uni/get-course-notes (path)
  (interactive (list (or (when buffer-file-name
                           (file-name-directory buffer-file-name))
                         default-directory)))
  (if (uni/course-directory-p path)
      ((lambda ()
         (let ((course-name (file-name-base (directory-file-name path))))
           (uni/generate-complete-notes
            path (format "%s-complete" course-name)))))
    (message "Not inside a course directory.")))

(defun uni/course-directory-p (path)
  (not (booleanp (string-match-p (format "%s/[^/]+/[a-z]+-[a-z]+/$" my/uni-path) path))))

(defun uni/get-course-file (course-path)
  (let ((course-name (file-name-base (directory-file-name course-path)))
        (course-file))
    (if (uni/course-directory-p course-path)
        (setq course-file (format "%s\.org" course-name))
      (message "No match."))
    (message course-file)
    course-file))

(defun my/open-in-vsplit (file)
  (let ((evil-vsplit-window-right t))
    (if file
        (+evil-window-vsplit-a nil file)
      (message (format "File not found.")))))

(defun uni/open-course-file (course-path)
  (interactive (list (or (when buffer-file-name
                           (file-name-directory buffer-file-name))
                         default-directory)))
  (if (string-prefix-p my/uni-path course-path)
      (my/open-in-vsplit (uni/get-course-file course-path))
    (message "Not inside a course directory.")))


;; —————————————————
;; KEYMAPS

(map! :leader
      :desc "Open org-roam-ui"
      "n r u" #'org-roam-ui-open
      :desc "Find node"
      "r f" #'my/org-roam-node-find
      :desc "Insert node"
      "r i" #'org-roam-node-insert
      :desc "Open org-roam directory"
      "r d" #'my/dired-open-roam-dir
      )

(map! :leader
      :desc "Open uni notes"
      "n u" #'my/dired-open-uni-notes)

(map! :leader
      :desc "Create empty file"
      "=" #'dired-create-empty-file)

(map! :n
      "M" #'evil-set-marker)
(map! :nv
      "m" #'evil-goto-mark)

(map! :leader
      :desc "Open uni docs"
      "o c" #'my/open-docs)

(map! :map evil-org-mode-map
      :nv
      "g j" #'evil-next-visual-line)

(map! :map evil-org-mode-map
      :nv
      "g k" #'evil-previous-visual-line)

(map! :leader
      :prefix ("r" . "roam")
      :desc "Completion at point"
      :nv
      "c" #'completion-at-point)


(map! :map evil-org-mode-map
      :leader
      :desc "Org agenda file to front"
      "z" #'org-agenda-file-to-front)

(map! :leader
      :prefix ("y". "yas")
      :desc "Create new snippet"
      :nv
      "n" #'yas-new-snippet)

(map! :n
      "-" #'dired-jump)

(map! :map doom-leader-map
      :leader
      :desc "Open man-page"
      "h m" #'man)

(after! org-agenda
  (my/org-roam-refresh-agenda-list))
