{-# LANGUAGE OverloadedStrings #-}

import E9571.ConfigReader
import Data.Aeson

data Config = Config { host :: String, port :: Int } deriving Show

instance FromJSON Config where
    parseJSON = withObject "Config" $ \o -> Config
        <$> o .: "host"
        <*> o .: "port"

main :: IO ()
main = loadConfigOrDie >>= \cfg ->
       putStrLn $ "Server starting at " ++ host cfg ++ ":" ++ show (port cfg)