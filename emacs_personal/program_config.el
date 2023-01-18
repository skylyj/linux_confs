;;; package --- Summary
;;; Code:
;;; Commentary:

;; flycheck
(require 'flycheck)
;; Force flycheck to always use c++11 support. We use
;; the clang language backend so this is set to clang
;; Turn flycheck on everywhere
(global-flycheck-mode)


;; scala
(use-package scala-mode
  :interpreter
    ("scala" . scala-mode))

