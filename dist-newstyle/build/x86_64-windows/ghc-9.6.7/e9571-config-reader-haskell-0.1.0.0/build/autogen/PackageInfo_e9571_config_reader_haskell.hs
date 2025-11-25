{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_e9571_config_reader_haskell (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "e9571_config_reader_haskell"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "Automatically read config.json from the current directory"
copyright :: String
copyright = ""
homepage :: String
homepage = "https://github.com/e9571/e9571-config-reader-haskell"
