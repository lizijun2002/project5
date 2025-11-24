module Password where

newtype PwdOp a = PwdOp (String -> (a, String))

instance Functor PwdOp where
  fmap f (PwdOp g) = PwdOp $ \s ->
    let (a, s') = g s
    in (f a, s')

instance Applicative PwdOp where
  pure x = PwdOp $ \s -> (x, s)
  (PwdOp ff) <*> (PwdOp fa) = PwdOp $ \s ->
    let (f, s')  = ff s
        (a, s'') = fa s'
    in (f a, s'')

instance Monad PwdOp where
  return = pure
  (PwdOp fa) >>= f = PwdOp $ \s ->
    let (a, s')  = fa s
        PwdOp fb = f a
    in fb s'

setPassword :: String -> PwdOp ()
setPassword pwd = PwdOp $ \_ ->
  ((), pwd)

checkPassword :: String -> PwdOp Bool
checkPassword input = PwdOp $ \currentPwd ->
  (input == currentPwd, currentPwd)

runPwdOp :: PwdOp a -> a
runPwdOp (PwdOp f) =
  let (result, _) = f ""
  in result
