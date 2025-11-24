import Password


-- Should output "(False, True)"
test1 :: (Bool, Bool)
test1 =
    let pwdOp = do setPassword "Hello World!"
                   c1 <- checkPassword "asdf"
                   c2 <- checkPassword "Hello World!"
                   return (c1, c2) in
    runPwdOp pwdOp

-- Should output "(True, False)"
test2 :: (Bool, Bool)
test2 = 
    let pwdOp = do setPassword "Hello World!"
                   c1 <- checkPassword "Hello World!"
                   setPassword "asdf"
                   c2 <- checkPassword "Hello World!"
                   return (c1, c2) in
    runPwdOp pwdOp


main :: IO ()
main = do
    print test1
    print test2
