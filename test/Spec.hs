import Test.Tasty
import Test.Tasty.HUnit

import Test.Tasty.Muffled (muffledMain)

main :: IO ()
main = muffledMain $ testGroup "Simple tests" 
    [ testCase "This shouldn't have a call stack" $ error "Yo"
    , testCase "And it shouldn't tell me how to rerun the test" $ error "Not implemented"
    ]