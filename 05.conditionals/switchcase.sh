#!/usr/bin/env bash
fruit="apple"

case "${fruit}" in
    "apple")
        echo "item = apple"
    ;;
    "banana")
        echo "item = banana"
    ;;
    *)
        echo "default (none of above)"
    ;;
esac
