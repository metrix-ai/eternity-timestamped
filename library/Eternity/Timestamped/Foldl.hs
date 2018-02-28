{-|
Folds on timestamped values
-}
module Eternity.Timestamped.Foldl
where

import Eternity.Timestamped.Prelude hiding (maximum)
import Eternity.Timestamped.Data
import Control.Foldl
import qualified Eternity.Timestamped.Conversion as A


untimestamped :: Fold input output -> Fold (Timestamped input) output
untimestamped =
  premap (\ (Timestamped _ x) -> x)

filteringByUtcTime :: (UTCTime -> Bool) -> Fold (Timestamped input) output -> Fold (Timestamped input) output
filteringByUtcTime filter =
  filteringByTimestamp (filter . A.timestampUtcTime)

filteringByTimestamp :: (Timestamp -> Bool) -> Fold (Timestamped input) output -> Fold (Timestamped input) output
filteringByTimestamp filter =
  prefilter (\ (Timestamped ts _) -> filter ts)

inUtcTimeRange :: UTCTime -> UTCTime -> Fold (Timestamped input) output -> Fold (Timestamped input) output
inUtcTimeRange start end =
  inTimestampRange (A.utcTimeTimestamp start) (A.utcTimeTimestamp end)

inTimestampRange :: Timestamp -> Timestamp -> Fold (Timestamped input) output -> Fold (Timestamped input) output
inTimestampRange start end =
  filteringByTimestamp (\ ts -> ts >= start && ts < end)
