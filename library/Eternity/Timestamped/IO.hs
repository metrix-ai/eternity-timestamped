module Eternity.Timestamped.IO
where

import Eternity.Timestamped.Prelude
import Eternity.Timestamped.Data


timestamp :: event -> IO (Timestamped event)
timestamp event =
  do
    posixTime <- getPOSIXTime
    return (Timestamped (posixTimeTimestamp posixTime) event)
