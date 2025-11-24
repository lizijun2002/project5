## Part 1: AST

Complete the file `ast/ast.hs`, which has the functions `eval` and `eq` for evaluating and computing equality of expression ASTs, respectively. You can test your code by running `make; ./test_ast` in the `ast` directory. Do not modify any of the files other than `ast/ast.hs`.

## Part 2: Password

Complete the file `password/password.hs`, which defines a state monad for updating and checking a password. You should define the password operations `setPassword` and `checkPassword`, which must be composable using `do` notation (see `password/test_password.hs` for an example). Also write the runner function `runPwdOp`. Do not modify any files other than `password.hs`. You can test your code by running `make; ./test_password` in the `password` directory.