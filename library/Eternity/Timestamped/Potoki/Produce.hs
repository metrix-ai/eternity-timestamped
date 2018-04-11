module Eternity.Timestamped.Potoki.Produce
where

import Eternity.Timestamped.Prelude
import Timestamp
import Potoki.Produce
import qualified Eternity.Potoki.Produce as A


{-| Same as 'A.readFromFile', only specialized to timestamped values. -}
readFromFile :: Serialize event => FilePath -> Produce (Either IOException (Either Text (Timestamped event)))
readFromFile = A.readFromFile

{-| Same as 'A.readFromDir', only specialized to timestamped values. -}
readFromDir :: Serialize event => FilePath -> Produce (Either IOException (Either Text (Timestamped event)))
readFromDir = A.readFromDir
