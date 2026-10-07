-- [nfnl] fnl/noahtheduke/lsp/java.fnl
local utils = require("noahtheduke.utils")
local jls = "/Users/noah/programming/open-source/java-language-server/dist/lang_server_mac.sh"
vim.lsp.config("java", {cmd = {jls}, filetypes = {"java"}, root_markers = {"pom.xml"}, trace = "verbose"})
if utils["file-exists"](jls) then
  vim.lsp.enable("java")
else
end
return nil
