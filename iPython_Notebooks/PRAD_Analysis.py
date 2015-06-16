#!/usr/bin/env python
import os
os.chdir("../PRAD/")
import pandas as pd
PRAD_mappings = pd.read_csv("PRAD.mappings.csv", index_col=0, usecols=['barcode','TCGA.ID','histology'])
a = PRAD_mappings
PRAD_patient = pd.read_csv('../Minfi_Output/PRAD_mset.csv', index_col=0)
PRAD =PRAD_patient.head().stack().head()
PRAD
b = PRAD_patient
c= b.transpose()
c.index.name = 'barcode'
d = c
final = pd.merge(a,d, on=a.index, how='outer')
finals = final.head()
finals.rename(columns={'key_0':'barcode'}, inplace=True)
final['Sample_Type'] = ["Normal" if '-20A-' in col else "Tumor" for col in final['TCGA.ID']] 
df = final.to_csv('PRAD_df.csv')

