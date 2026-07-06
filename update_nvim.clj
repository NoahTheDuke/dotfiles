#!/usr/bin/env bb

;; will download to the folder where it's called, so go to ~/personal or something, and
;; then run this. symlink ~/.local/bin/nvim to ~/personal/nvim-macos-arm64/bin/nvim

(ns update-nvim
  (:require
   [clojure.java.io :as io]
   [babashka.fs :as fs]
   [babashka.process :as p]))

(def branch (or (first *command-line-args*) "nightly"))

(def filename "nvim-macos-arm64.tar.gz")

(defn copy-uri-to-file [uri file]
  (with-open [in (io/input-stream uri)
              out (io/output-stream file)]
    (io/copy in out)))

(copy-uri-to-file (format "https://github.com/neovim/neovim/releases/download/%s/nvim-macos-arm64.tar.gz" branch) filename)

(p/shell (format "tar xzvf %s" filename))

(fs/delete-if-exists filename)
