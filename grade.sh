
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
if ! test -f student-submission/ListExamples.java; then
  echo "File does not exist."
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp lib/hamcrest-core-1.3.jar grading-area
cp lib/junit-4.13.2.jar grading-area

javac -cp ".;grading-area/hamcrest-core-1.3.jar;grading-area/junit-4.13.2.jar" grading-area/*.java
cd grading-area
java -cp ".;junit-4.13.2.jar;hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > test-results.txt


if  grep -q "FAILURES" test-results.txt 
then 
    echo "your code did not pass all tests" >> test-results.txt
else 
    echo "your code passed the tests" >> test-results.txt
    
fi
