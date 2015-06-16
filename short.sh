#!/bin/bash
for instance in jhu-usc.edu_*
do
    #Count instances of *idat files and put the result in idat_count.txt file
    echo "${instance} - `find ${instance} -type f -name "*.idat" | wc -l`" | tee -a idat_count.txt
done
