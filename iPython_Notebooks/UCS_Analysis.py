#!/usr/bin/env python
import os
os.chdir("../UCS/")
import pandas as pd
UCS_mappings = pd.read_csv("UCS.mappings.csv", index_col=0, usecols=['barcode','TCGA.ID','histology'])
a = UCS_mappings
UCS_patient = pd.read_csv('../Minfi_Output/UCS_mset.csv', index_col=0)
UCS =UCS_patient.head().stack().head()
UCS
b = UCS_patient
c= b.transpose()
c.index.name = 'barcode'
d = c
final = pd.merge(a,d, on=a.index, how='outer')
finals = final.head()
finals.rename(columns={'key_0':'barcode'}, inplace=True)
final['Sample_Type'] = ["Normal" if '-20A-' in col else "Tumor" for col in final['TCGA.ID']] 
final = pd.to_csv('UCS_df.csv')

