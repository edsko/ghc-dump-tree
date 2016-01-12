{-# LANGUAGE CPP #-}
module Main (main) where

import Language.Haskell.GHC.DumpTree

import Prelude
import Options.Applicative



#if MIN_VERSION_base(4,8,0)
#else
import Data.Monoid (mconcat)
#endif

{-------------------------------------------------------------------------------
  Main application
-------------------------------------------------------------------------------}

main :: IO ()
main = do
    Options{..} <- execParser opts
    trees       <- treesForTargetsIO optionsTargets
    if optionsDumpJson
      then dumpJson trees
      else dumpText trees
  where
    opts = info (helper <*> parseOptions) $ mconcat [
        fullDesc
      , header "ghc-dump-tree - Dump GHC's ASTs"
      ]

{-------------------------------------------------------------------------------
  Command line arguments
-------------------------------------------------------------------------------}

data Options = Options {
    optionsDumpJson :: Bool
  , optionsTargets  :: [FilePath]
  }

parseOptions :: Parser Options
parseOptions = Options
  <$> (switch $ mconcat [
          long "json"
        , help "Output JSON"
        ])
  <*> some (argument str (metavar "TARGETS..."))
