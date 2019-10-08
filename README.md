# ghc-dump-tree

Dump GHC's abstract syntax trees (parsed, renamed, and type checked) in text or
JSON format. Useful for GHC devs or people who want to do something with GHC's
AST but don't want to hook into the GHC API itself.

Tested with GHC 8.6. Older versions support 7.4-8.0 (see commit history).
