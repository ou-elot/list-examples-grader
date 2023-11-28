
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

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" grading-area/*.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore grading-area/TestListExamples > grading-area/test-results.txt


if  grep -q "FAILURES" grading-area/test-results.txt 
then 
    echo "your code did not pass all tests" >> grading-area/test-results.txt
else 
    echo "your code passed the tests" >> grading-area/test-results.txt
    
fi
