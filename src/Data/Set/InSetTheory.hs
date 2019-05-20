module Data.Set.InSetTheory where

import Data.Set as HaskellSet
import Data.Set.SetTheory as SetTH

instance (Ord a) => SetSatisfiable (HaskellSet.Set a) where
    union = HaskellSet.union
    difference = HaskellSet.difference
instance (Ord a)=> SizeableSet (HaskellSet.Set a) where
    size = HaskellSet.size
instance (Ord a) => MutuallyExcludable (HaskellSet.Set a) where
    isEmpty = HaskellSet.null
