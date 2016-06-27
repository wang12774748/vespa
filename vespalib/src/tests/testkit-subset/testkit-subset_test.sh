#!/bin/bash

set -e

TEST_SUBSET=pass $VALGRIND ./vespalib_testkit-subset_test_app 2> out.txt
TEST_SUBSET="extra\.cpp:.*pass.*" $VALGRIND ./vespalib_testkit-subset_test_app 2>> out.txt
cat out.txt | grep "\.cpp: " > out.relpath.txt
cmp -s out.relpath.txt out.ref.2.txt && exit 0
diff -u out.relpath.txt out.ref.txt
