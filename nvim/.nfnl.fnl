(local core (require :nfnl.core))
(local config (require :nfnl.config))
(local defaults (config.default))

{:compiler-options (core.merge
                     defaults.compiler-options
                     {:compilerEnv _G
                      :error-pinpoint false})
 :fennel-path "./?.fnl;./fnl/?.fnl"
 :fennel-macro-path "./?.fnl;./fnl/?.fnl;./?.fnlm;./fnl/?.fnlm"}
