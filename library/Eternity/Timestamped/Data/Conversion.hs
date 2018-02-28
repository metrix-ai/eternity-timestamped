module Eternity.Timestamped.Data.Conversion
where

import Eternity.Timestamped.Prelude
import Eternity.Timestamped.Data.TypesAndInstances


timestampMicroSecondsInt64 :: Timestamp -> Int64
timestampMicroSecondsInt64 (Timestamp prim) = prim
  
timestampNominalDiffTime :: Timestamp -> NominalDiffTime
timestampNominalDiffTime =
  unsafeCoerce . (* 1000000) . toInteger . timestampMicroSecondsInt64

timestampPosixTime :: Timestamp -> POSIXTime
timestampPosixTime = timestampNominalDiffTime

timestampUtcTime :: Timestamp -> UTCTime
timestampUtcTime = posixSecondsToUTCTime . timestampPosixTime

utcTimeTimestamp :: UTCTime -> Timestamp
utcTimeTimestamp =
  posixTimeTimestamp . utcTimeToPOSIXSeconds

posixTimeTimestamp :: POSIXTime -> Timestamp
posixTimeTimestamp =
  Timestamp . fromIntegral . flip div 1000000 . (unsafeCoerce :: NominalDiffTime -> Integer)
