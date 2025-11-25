{-# LANGUAGE OverloadedStrings #-}

module E9571.ConfigReader
  ( loadConfig
  , loadConfigOrDie
  ) where

import           Data.Aeson             (FromJSON(..), eitherDecode)
import qualified Data.ByteString.Lazy   as LBS
import           System.Directory       (doesFileExist)

loadConfig :: FromJSON a => IO (Either String a)
loadConfig = do
    let path = "config.json"
    exists <- doesFileExist path
    if not exists
        then return $ Left "Error: config.json not found in current directory"
        else do
            bs <- LBS.readFile path
            pure $ either (Left . ("JSON parse error: " ++)) Right (eitherDecode bs)

loadConfigOrDie :: FromJSON a => IO a
loadConfigOrDie = loadConfig >>= either fail pure