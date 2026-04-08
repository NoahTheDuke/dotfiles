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
