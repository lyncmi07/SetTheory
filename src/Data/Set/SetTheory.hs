module Data.Set.SetTheory where

class SetSatisfiable a where
    -- |Returns the union of the two objects
    union :: a -> a -> a
    -- |Returns the difference between the two objects
    difference :: a -> a -> a

class SetSatisfiable a => SizeableSet a where
    -- |The number of elements that are in the set
    size :: a -> Int

class SetSatisfiable a => MutuallyExcludable a where
    -- |The set given is empty
    isEmpty :: a -> Bool

mutuallyExclusive :: MutuallyExcludable a => a -> a -> Bool
mutuallyExclusive a b = isEmpty (intersection a b)
    

-- |Returns the union of two objects if and only if the intersection of the two objects is empty.
--Otherwise it returns the failure monad provided
concatenate :: (MutuallyExcludable a, Monad m) => m a -> a -> a -> m a
concatenate failureMonad a b
    | mutuallyExclusive a b = return $ union a b
    | otherwise = failureMonad

-- |Returns the intersection of the two objects
intersection :: (SetSatisfiable a) => a -> a -> a
intersection a b = difference a (difference a b)
