test_number=08
description="numeric max"

expected="$test_dir/test_$test_number.expected"

outfile="$test_dir/test_$test_number.1.actual"
$bin -p -k 1 -x 3,4 "$test_dir/test.in" > "$outfile"
if [ $? -ne 0 ] ||
   [ "`diff -q $outfile $expected`" ]; then
  test_status $test_number 1 "$description (indexes)" FAIL
else
  test_status $test_number 1 "$description (indexes)" PASS
  rm "$outfile"
fi

outfile="$test_dir/test_$test_number.actual"
$bin -p -K 'Text-1' -X 'Numeric-1,Numeric-2' "$test_dir/test.in" > "$outfile"
if [ $? -ne 0 ] ||
   [ "`diff -q $outfile $expected`" ]; then
  test_status $test_number 1 "$description (labels)" FAIL
else
  test_status $test_number 1 "$description (labels)" PASS
  rm "$outfile"
fi
