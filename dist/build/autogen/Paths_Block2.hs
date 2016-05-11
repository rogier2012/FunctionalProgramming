module Paths_Block2 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Rogier/.cabal/bin"
libdir     = "/Users/Rogier/.cabal/lib/x86_64-osx-ghc-7.10.3/Block2-1.0-A2BV2XG7SFA4otbcNk3KfE"
datadir    = "/Users/Rogier/.cabal/share/x86_64-osx-ghc-7.10.3/Block2-1.0"
libexecdir = "/Users/Rogier/.cabal/libexec"
sysconfdir = "/Users/Rogier/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Block2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Block2_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Block2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Block2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Block2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
