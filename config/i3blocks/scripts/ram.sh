#!/bin/bash

free --mebi | sed -n '2{p;q}' | awk '{printf ("RAM: %2.2fG/%2.2fG\n", ( $3 / 1024), ($2 / 1024))}'
