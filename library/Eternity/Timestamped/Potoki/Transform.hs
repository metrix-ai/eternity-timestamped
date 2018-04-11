module Eternity.Timestamped.Potoki.Transform
where

import Eternity.Timestamped.Prelude
import Timestamp
import Potoki.Transform
import qualified Eternity.Timestamped.IO as A


{-|
Useful for getting a Consume,
which timestamps the events automatically as they arrive.

E.g., you can apply it to 'Eternity.Timestamped.Potoki.Consume.writeToDir':

@
'Potoki.Consume.transform' timestamp . 'Eternity.Timestamped.Potoki.Consume.writeToDir' :: FilePath -> 'Potoki.Consume.Consume' event (Either IOException ())
@
-}
timestamp :: Transform event (Timestamped event)
timestamp =
  mapInIO A.timestamp
