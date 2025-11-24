default : test_password

test_password : password.hs test_password.hs
	ghc password.hs test_password.hs

clean :
	rm -rf test_password test_password.o test_password.hi password.hi password.o 
