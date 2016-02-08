;; color themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/replace-colorthemes")
(load-theme 'desert t)

;; key bindging
(global-set-key [f1] 'bs-cycle-previous)
(global-set-key [f2] 'bs-cycle-next)
(global-set-key (kbd "C-h C-r") 'replace-string)
(global-set-key (kbd "M-o M-m") 'menu-bar-open)
;; numpad
(define-key function-key-map [?\e ?O ?p] [?0])
(define-key function-key-map [?\e ?O ?q] [?1])
(define-key function-key-map [?\e ?O ?r] [?2])
(define-key function-key-map [?\e ?O ?s] [?3])
(define-key function-key-map [?\e ?O ?t] [?4])
(define-key function-key-map [?\e ?O ?u] [?5])
(define-key function-key-map [?\e ?O ?v] [?6])
(define-key function-key-map [?\e ?O ?w] [?7])
(define-key function-key-map [?\e ?O ?x] [?8])
(define-key function-key-map [?\e ?O ?y] [?9])
(define-key function-key-map [?\e ?O ?o] [?/])
(define-key function-key-map [?\e ?O ?j] [?*])
(define-key function-key-map [?\e ?O ?m] [?-])
(define-key function-key-map [?\e ?O ?k] [?+])

;; load library path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; sql.el
;;(require 'sql)

;;
(setq sql-connection-alist
      '((dbdismoiou1 (sql-product 'postgres)
		 (sql-port 5432)
		 (sql-server "db-dmo.dev.bilendi.net")
		 (sql-user "postgres")
		 (sql-password "")
		 (sql-database "dbdismoiou"))
	(dbdismoiou2 (sql-product 'postgres)
		 (sql-port 5432)
		 (sql-server "db-dmo.dev.bilendi.net")
		 (sql-user "postgres")
		 (sql-password "")
		 (sql-database "dbdismoiou2"))))
(defun dbdismoiou1 ()
  (interactive)
  (my-sql-connect 'postgres 'dbdismoiou1))

(defun dbdismoiou2 ()
  (interactive)
  (my-sql-connect 'postgres 'dbdismoiou2))

(defun my-sql-connect (product connection)
  ;; remember to set the sql-product, otherwise, it will fail for the first time
  ;; you call the function
  (setq sql-product product)
  (sql-connect connection))

;; bind keys for sql connection
(global-set-key (kbd "M-s <kp-1>") 'dbdismoiou1)


;; linum.el : affiche les numéros de lignes
(setq linum-format "%4d \u2502 ")
(require 'linum)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;; tab indent
(setq-default indent-tabs-mode t)
(setq tab-width 4)
