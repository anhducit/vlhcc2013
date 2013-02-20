module Varsheet where

type Dim = String
type Tag = String
type QTag = (Dim, Tag)
type QTags = [QTag]
type Label = Maybe QTags
type Pos = (Int, Int)
type Address = Int
type DimSpace = [QTags]

data F = V Int
       | A Address
       | Sum [F]
data Cell = Cell {add :: Address, v :: QTags, pos :: Pos}

type VSheet = (DimSpace, [Cell])


dim = fst

select :: Label -> QTag -> Label
select (Just qs) q = case q `elem` qs of
                        True -> Just $ filter ((/= dim q) . dim) qs
                        _ -> Nothing
select _         _ = Nothing



-- vari :: 
-- smart constructors
d `hasTags` ts = [ (d, t) | t <- ts ]

-- example
dA = "A"
dB = "B"
ts = ["1", "2"]
tsA = dA `hasTags` ts
tsB = dB `hasTags` ts

lbl1 = Just [(dA, "1"), (dB, "2")]

