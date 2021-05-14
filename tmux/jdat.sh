#!/usr/bin/env bash

JDATE=$(jdate | gawk '{print $2" "$3}')

echo $JDATE
