module Eternity.Timestamped.IO
where

import Eternity.Timestamped.Prelude
import Timestamp


timestamp :: event -> IO (Timestamped event)
timestamp event =
  do
    posixTime <- getPOSIXTime
    return (Timestamped (posixTimeTimestamp posixTime) event)
