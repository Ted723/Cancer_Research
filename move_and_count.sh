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

    if [[ $1 == UVM* ]]; then
            destination="${destination_root}/UVMFOLDER"
    fi

    if [[ $1 == BRCA* ]]; then
            destination="${destination_root}/BRCAFOLDER"
    fi
    
    if [[ $1 == ACC* ]]; then
            destination="${destination_root}/ACCFOLDER"
    fi

    if [[ $1 == BLCA* ]]; then
            destination="${destination_root}/BLCAFOLDER"
    fi
    
    if [[ $1 == CESC* ]]; then
            destination="${destination_root}/CESCFOLDER"
    fi

    if [[ $1 == CHOL* ]]; then
            destination="${destination_root}/CHOLFOLDER"
    fi

    if [[ $1 == COAD* ]]; then
            destination="${destination_root}/COADFOLDER"
    fi

    if [[ $1 == DLBC* ]]; then
            destination="${destination_root}/DLBCFOLDER"
    fi
    
    if [[ $1 == ESCA* ]]; then
            destination="${destination_root}/ESCAFOLDER"
    fi

    if [[ $1 == GBM* ]]; then
            destination="${destination_root}/GBMFOLDER"
    fi
    
    if [[ $1 == HNSC* ]]; then
            destination="${destination_root}/HNSCFOLDER"
    fi

    if [[ $1 == KICH* ]]; then
            destination="${destination_root}/KICHFOLDER"
    fi

    if [[ $1 == KIRC* ]]; then
            destination="${destination_root}/KIRCFOLDER"
    fi
    
    if [[ $1 == KIRP* ]]; then
            destination="${destination_root}/KIRPFOLDER"
    fi

    if [[ $1 == LAML* ]]; then
            destination="${destination_root}/LAMLFOLDER"
    fi
    
    if [[ $1 == LGG* ]]; then
            destination="${destination_root}/LGGFOLDER"
    fi

    if [[ $1 == LIHC* ]]; then
            destination="${destination_root}/LIHCFOLDER"
    fi

    if [[ $1 == LUAD* ]]; then
            destination="${destination_root}/LUADFOLDER"
    fi

    if [[ $1 == LUSC* ]]; then
            destination="${destination_root}/LUSCFOLDER"
    fi
    
    if [[ $1 == MESO* ]]; then
            destination="${destination_root}/MESOFOLDER"
    fi

    if [[ $1 == OV* ]]; then
            destination="${destination_root}/OVFOLDER"
    fi
    
    if [[ $1 == PAAD* ]]; then
            destination="${destination_root}/PAADFOLDER"
    fi

    if [[ $1 == PCPG* ]]; then
            destination="${destination_root}/PCPGFOLDER"
    fi

    if [[ $1 == PRAD* ]]; then
            destination="${destination_root}/PRADFOLDER"
    fi

    if [[ $1 == READ* ]]; then
            destination="${destination_root}/READFOLDER"
    fi
    
    if [[ $1 == SARC* ]]; then
            destination="${destination_root}/SARCFOLDER"
    fi

    if [[ $1 == SKCM* ]]; then
            destination="${destination_root}/SKCMFOLDER"
    fi
    
    if [[ $1 == STAD* ]]; then
            destination="${destination_root}/STADFOLDER"
    fi

    if [[ $1 == TGCT* ]]; then
            destination="${destination_root}/TGCTFOLDER"
    fi

    if [[ $1 == THCA* ]]; then
            destination="${destination_root}/THCAFOLDER"
    fi

    if [[ $1 == THYM* ]]; then
            destination="${destination_root}/THYMFOLDER"
    fi
    
    if [[ $1 == UCEC* ]]; then
            destination="${destination_root}/UCECFOLDER"
    fi

    if [[ $1 == UCS* ]]; then
            destination="${destination_root}/UCSFOLDER"
    fi
    

    #Ensure folder is present
    mkdir -p ${destination} 
}

#Loop through all folders matching the jhu prefix
for instance in jhu-usc.edu_*
do
    #Count instances of *idat files and put the result in idat_count.txt file
    echo "${instance} - `find ${instance} -type f -name "*idat" | wc -l`" | tee -a idat_count.txt

    abbreviation `echo "${instance}" | sed s/jhu-usc.edu_//g`

    #Move the folder to the destination
    mv ${instance} ${destination}
done

