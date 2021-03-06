module Eternity.Timestamped.Potoki.Consume where

import           Eternity.Timestamped.Prelude
                                         hiding ( fold )
import           Timestamp
import           Potoki.Consume
import qualified Eternity.Potoki.Consume       as A


{-| Same as 'A.writeToFile', only specialized to timestamped values. -}
writeToFile
  :: Serialize event
  => Bool  -- ^ on `True` stream will be flushed on each event, on `False` buffering will be enabled
  -> FilePath
  -> Consume (Timestamped event) (Either IOException ())
writeToFile = A.writeToFile

{-| Same as 'A.writeToDir', only specialized to timestamped values. -}
writeToDir
  :: Serialize event
  => Bool -- ^ on `True` stream will be flushed on each event, on `False` buffering will be enabled
  -> FilePath
  -> Consume (Timestamped event) (Either IOException ())
writeToDir = A.writeToDir
