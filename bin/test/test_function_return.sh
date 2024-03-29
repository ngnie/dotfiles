#!/bin/sh

foo() {
  echo "before return in foo"
  return
  echo "after return in foo"
}

echo "before call to foo"
foo
echo "after call to foo"
