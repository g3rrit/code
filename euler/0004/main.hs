main :: IO ()
main = do
    putStrLn $ show $ maximum [ x * y | x <- [1..999] , y <- [1..999] , show (x * y) == reverse (show (x * y)) ]
