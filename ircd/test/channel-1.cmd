define srv localhost:7701

connect cl1 Alex alex %srv% :Test client 1
connect cl2 Bubb bubb %srv% :Test client 2
:cl1 join #test
:cl1 join #test2
:cl1 mode #test +bb *!*@127.0.0.1 *!*@127.0.0.2
:cl2 wait cl1
:cl2 join #test
:cl1 wait cl2
:cl1 invite Bubb #test
:cl2 expect *cl1 invite #test
:cl2 join #test
:cl2 privmsg #test :Hello, *cl1.
:cl2 nick Buba
:cl2 mode #test +l 15
:cl1 wait cl2
:cl1 privmsg #test :Hello, *cl2.
:cl1 mode #test -b+kv *!*@127.0.0.1 secret Bubb
:cl1 mode #test +b foo!bar@baz
:cl1 mode #test +b
:cl1 mode #test :
:cl1 mode #test
:cl1 raw who #test %lfuh
:cl2 wait cl1
:cl2 part #test
:cl1 wait cl2
:cl2 join #test public
:cl2 join #test secret
:cl1 join 0
:cl1 join #test2
:cl2 wait cl1
:cl2 join #test2
:cl1 wait cl2
:cl1 mode #test2 +smtinrDlAU 15 apples oranges
:cl1 mode #test2
:cl2 wait cl1
:cl2 join #test2 apples
:cl2 privmsg #test2 :Hello, oplevels.
:cl2 mode #test2
:cl2 mode #test2 -io+v Alex Alex
:cl1 wait cl2
:cl1 part #test2
:cl1 join #test2
:cl2 wait cl1
:cl2 mode #test2 -D
:cl2 mode #test +v Alex
:cl1 oper oper1 oper1
:cl1 wait cl2
:cl1 raw die :testing over
