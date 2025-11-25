# e9571-config-reader-haskell

A tiny, **zero-configuration** Haskell library that instantly reads a `config.json` file from the current working directory.

**Out-of-the-box, no setup required.**  
Just drop a `config.json` file next to your executable and start using the library — it just works.

### Usage (two steps)

1. Create a `config.json` file in the same directory as your program:

   ```json
   {
     "host": "127.0.0.1",
     "port": 8080
   }
   ```

2. ```Haskell
      {-# LANGUAGE OverloadedStrings #-}
      
      import E9571.ConfigReader
      import Data.Aeson
      
      data Config = Config { host :: String, port :: Int } deriving Show
      
      instance FromJSON Config where
          parseJSON = withObject "Config" $ \o -> Config
              <$> o .: "host"
              <*> o .: "port"
      
      main :: IO ()
      main = do
          cfg <- loadConfigOrDie :: IO Config   -- automatically reads ./config.json
          putStrLn $ "Server starting at " ++ host cfg ++ ":" ++ show (port cfg)
      
          




### Features

- Automatically looks for ./config.json at runtime
- No file paths, no command-line flags, no environment variables
- Works with any FromJSON instance
- Helpful error messages when the file is missing or malformed
- Only depends on aeson

### Installation

```bash
cabal install e9571-config-reader-haskell
```

Source: https://github.com/e9571/e9571-config-reader-haskell
Hackage: https://hackage.haskell.org/package/e9571-config-reader-haskell

Enjoy the simplicity!