(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-by-moving-to-trash t)
 '(dirvish-quick-access-entries
   '(("h" "~/" "Home") ("d" "~/.dotfiles/" "Dotfiles")
     ("p" "~/Documents/projects/" "projects")
     ("g" "~/Documents/playground/" "playground")
     ("n" "~/Documents/notes/roam/uni/jaro26/" "Notes")
     ("rd" "~/remotes/dionysos" "dionysos remote home")
     ("w" "~/Documents/uni-work/jaro26/" "Uni Work")))
 '(jabber-account-list '(("xeldunia@fi.muni.cz")))
 '(lsp-mode-hook
   '(lsp-completion-mode +lookup--init-lsp-mode-handlers-h lsp-ui-mode) t)
 '(lsp-pyls-plugins-flake8-ignore '("D100" "D103" "D102" "D101" "D107"))
 '(lsp-pylsp-plugins-flake8-ignore ["F405"])
 '(lsp-pylsp-plugins-pycodestyle-ignore ["F405"])
 '(lsp-pylsp-plugins-ruff-ignore ["F405"])
 '(nerd-icons-fonts-subdirectory "NerdFonts")
 '(org-agenda-files
   '("~/Documents/notes/roam/uni/podzim25/fss-bezstrat/fss-bezstrat-todo.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fi-vypsys/fi-vypsys-1001.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fi-matzakl/fi-matzakl-c-1001.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fi-datsys/fi-datsys-0923.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fi-matzakl/fi-matzakl-0924.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fi-matzakl/fi-matzakl-01.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fi-vypsys/fi-vypsys-0924.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fss-bezstrat/fss-bezstrat-0923.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fss-valka/fss-valka-01.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fss-valka/fss-valka-0925.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fss-bezstrat/lit/the-landscape-of-hyrbid-threats/0923-the_landscape_of_hybrid_threats.org"
     "/home/popos/Documents/notes/roam/uni/podzim25/fi-matzakl/fi-matzakl-c-0924.org"))
 '(org-capture-after-finalize-hook '(+org-capture-cleanup-frame-h))
 '(org-cite-export-processors
   '((latex biblatex "iso-authoryear,currentlang,backend=bibtex" nil)))
 '(org-directory "~/Documents/notes/")
 '(org-export-with-broken-links t)
 '(org-latex-compiler "pdflatex")
 '(org-latex-default-packages-alist
   '(("" "amsmath" t ("lualatex" "xetex")) ("" "fontspec" t ("lualatex" "xetex"))
     ("AUTO" "inputenc" t ("pdflatex")) ("T1" "fontenc" t ("pdflatex"))
     ("" "graphicx" t nil) ("" "longtable" nil nil) ("" "wrapfig" nil nil)
     ("" "rotating" nil nil) ("normalem" "ulem" t nil)
     ("" "amsmath" t ("pdflatex")) ("" "amssymb" t ("pdflatex"))
     ("" "capt-of" nil nil) ("" "hyperref" nil nil)))
 '(org-latex-packages-alist
   '(("dvipsnames" "xcolor" nil nil) ("linewidth=1pt" "mdframed" nil nil)
     ("utf8" "inputenc" nil nil)))
 '(org-latex-pdf-process
   '("latexmk -f -pdf -pdfxelatex=\"xelatex -shell-escape\" -pdflatex=\"pdflatex -shell-escape\" -%latex -interaction=nonstopmode -output-directory=%o %f"))
 '(org-preview-latex-process-alist
   '((dvipng :programs ("xelatex" "dvipng") :description "dvi > png" :message
      "you need to install the programs: latex and dvipng." :image-input-type
      "dvi" :image-output-type "png" :image-size-adjust (1.0 . 1.0)
      :latex-compiler
      ("xelatex -interaction nonstopmode -output-directory %o %f")
      :image-converter ("dvipng -D %D -T tight -o %O %f")
      :transparent-image-converter
      ("dvipng -D %D -T tight -bg Transparent -o %O %f"))
     (dvisvgm :programs ("latex" "dvisvgm") :description "dvi > svg" :message
      "you need to install the programs: latex and dvisvgm." :image-input-type
      "dvi" :image-output-type "svg" :image-size-adjust (1.7 . 1.5)
      :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
      :image-converter
      ("dvisvgm %f --no-fonts --exact-bbox --scale=%S --output=%O"))
     (imagemagick :programs ("latex" "convert") :description "pdf > png"
      :message "you need to install the programs: latex and imagemagick."
      :image-input-type "pdf" :image-output-type "png" :image-size-adjust
      (1.0 . 1.0) :latex-compiler
      ("pdflatex -interaction nonstopmode -output-directory %o %f")
      :image-converter
      ("convert -density %D -trim -antialias %f -quality 100 %O"))))
 '(org-safe-remote-resources
   '("\\`https://upload\\.wikimedia\\.org/wikipedia/commons/8/8d/OSI_Model_v1\\.svg\\'"))
 '(package-selected-packages
   '(cl-libify emacsql f magit-section org-roam org-roam-ui pdf-tools
     typescript-mode undo-tree vue3-mode wakatime-mode))
 '(scroll-margin 8)
 '(svelte-basic-offset 4)
 '(trash-directory "/home/adamdgaf/.local/share/Trash"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#282c34" :foreground "#bbc2cf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 150 :width normal :foundry "CTDB" :family "Fira Mono"))))
;;  '(org-link ((t (:inherit link :foreground "yellow")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
