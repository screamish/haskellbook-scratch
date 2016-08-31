module Chapter9Spec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import Chapter9

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

idempotent f = property $ \x -> f x == f (f x)

spec :: Spec
spec = do
  describe "2. onlyUppers" $ do
    it "removes non-uppers" $ do
      onlyUppers "HbEfLrLxO" `shouldBe` "HELLO"
    it "is idempotent" $ idempotent onlyUppers

  describe "3. capitalise" $ do
    it "julie to Julie" $
      capitalise "julie" `shouldBe` "Julie"

  describe "4. holler" $ do
    it "woot to WOOT" $
      holler "woot" `shouldBe` "WOOT"

  describe "5 & 6. upperHead" $ do
    it "abc to A" $ do
      upperHead "abc" `shouldBe` 'A'
      upperHead' "abc" `shouldBe` 'A'
      upperHead'' "abc" `shouldBe` 'A'
