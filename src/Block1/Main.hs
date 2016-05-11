module Main where
import Exercise1
import Exercise2
import Exercise3
import Exercise4
import Exercise5
import Exercise6
import Exercise7
import Exercise8
import Exercise9
import Exercise2_1
import Exercise2_2
import Exercise2_3
import Exercise2_4
import Exercise2_5
import Exercise2_6
import Exercise2_7

--Exercise 1 -------
--main = print(f 6)


--Exercise 2 -------
--main = do print(code 3 'a')
--          print(map (code 3) "hello")
--          print(map (code 4) "Tomorrow evening, 8 o\'clock in Amsterdam")

--Exercise 3 -------
--main = do print(amount 100 3 40)


--Exercise 4 -------

--main = do print(root1 5 6 1)
--          print(root2 5 6 1)

--Exercise 5 -------

--main = do print(extrY 1 0 (-4))

--Exercise 6 -------

--main = do print(mylength [1..10])
--          print(mysum [1..10])
--          print(myreverse [1..10])
--          print(mytake [1..10] 5)
--          print(myelem [1..10] 5)
--          print(myconcat [[1..10],[1..10],[1..10]])
--          print(mymaximum [-1,-3,-4,-6,-5,-2,-3])
--          print(myzip [1..10] [10,9,8,7,6,5,4,3,2])


--Exercise 7 -------

--main = do print(r1 1 2 5)
--          print(total [1..10] 3 6)
--          print(totalnew [1..10] 3 6)

--Exercise 8 -------

--main = do print(allEqual [1,1,1,1,1,1,1])
--          print(isAS [])


--Exercise 9 --------
--main = do print(allRowsEqualLength [[1..10],[1..10]])
--          print(rowsEqual [[1..10],[1..10]])
--          print(rowTotals [[1..10],[1..10],[1..10]])
--          print(transpose [[1..10],[1..10],[1..10]])
--          print(columnTotals [[1..10],[1..10],[1..10]])

-- Exercise 2-1 ---------
--main = do   print(myfilter (<=5) [1..10])
--            print(myfoldl (*) 3 [1..2])
--            print(myfoldr (*) 3 [1..2])
--            print(myzipWith (*) [1..10][1..10])

-- Exercise 2-2 ----------
--main = do   print(database)
--            print(getName ("Rogier", 20, "Male", "Enschede"))
--            print(increaseAgeRec 10 database)
--            print(increaseAgeLC 10 database)
--            print(increaseAgeHO 10 (increaseAgeHO 10 database))
--            print(womenRec database)
--            print(womenLC database)
--            print(womenHO database)
--            print(getAgeofName "John Do" database)
--            print(sortByAge database)


--Exercise 2-3 -------------
--main = do   print(isprimenumber 23)
--            print(nprimes 20)
--            print(primessmaller 100)
--            print(dividers 40)
--            print(isprime 97)

--Exercise 2-4 -------------
main = do   print(pyth 100)
            print(pyth1 50)

--Exercise 2-5 --------------
--main = do   print("Increasing: " ++  show (increasing [1..100]))
--            print("weaklyIncreasing: " ++ show(weaklyIncreasing [1..10]))

--Exercise 2-6 --------------
--main = do   print("Partial Sublist: " ++ show(partialsublist [1..10] [1..10]))
--            print("Sublist: " ++ show(sublist [1..10] [1..10]))

----Exercise 2-7---------------
--main = do   print(bsort [3,4,5,6,8,89,4,2,2,4,6,89,21,5,7])
--            print(mmsort [3,4,5,6,8,89,4,2,2,4,6,89,21,5,7])
--            print(ins [1,2,3,4,5,6,8,9] 7)
--            print(isort [3,4,5,6,8,89,4,2,2,4,6,89,21,5,7] )
--            print(msort [3,4,5,6,8,89,4,2,2,4,6,89,21,5,7])
--            print(qsort [3,4,5,6,8,89,4,2,2,4,6,89,21,5,7])
