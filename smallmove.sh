#!/bin/bash
#Definition of where you want the directory to be moved
destination_root="/data/nrnb01_nobackup/agross/TCGA_methylation"

#Unzip and extract tar files
#for i in *tar.gz; do tar xzif ; done

#Delete tar.gz files
#find . -type f -name '*tar.gz' -exec rm {} +

#Move all files within cancersubtype folders into current directory to allow ease of moving to specific directories
#find . -mindepth 2 -type f -print -exec mv {} . \;

function abbreviation() {
    #Default
    destination="${destination_root}/UNKNOWN"
    
    if [[ $1 == ACC* ]]; then
            destination="${destination_root}/ACCFOLDER"
    fi   
    
    if [[ $1 == UVM* ]]; then
            destination="${destination_root}/UVMFOLDER"
    fi   

    #Ensure folder is present
    mkdir -p ${destination} 
}

#Loop through all folders matching the jhu prefix
for instance in jhu-usc.edu_*
do
    #Count instances of *idat files and put the result in idat_count.txt file
    #echo "${instance} - `find ${instance} -type f -name "*idat" | wc -l`" | tee -a idat_count.txt

    abbreviation `echo "${instance}" | sed s/jhu-usc.edu_//g`

    #Move the folder to the destination
    mv ${instance} ${destination}


done
