#!/bin/bash

# get date
dt=`date +%Y%m%d`

# Generate byol ZIP
zip ../azurebyol_$dt.zip *

# Generate bundle1 ZIP
sed -i -e 's/byol/bundle1/' mainTemplate.json
sed -i -e 's/ADB0E49C-84A5-421C-B6DC-52AA207049D1/5C789549-0D4A-46A4-BF95-51CDED58B0F0/' mainTemplate.json
sed -i -e 's/byol/bundle1/' createUiDefinition.json
rm -f mainTemplate.json-e
rm -f createUiDefinition.json-e
zip ../azurebundle1_$dt.zip *

# Generate bundle2 ZIP
sed -i -e 's/bundle1/bundle2/' mainTemplate.json
sed -i -e 's/5C789549-0D4A-46A4-BF95-51CDED58B0F0/4B4D44C9-B39D-4795-9BFB-5E9C9C325C9E/' mainTemplate.json
sed -i -e 's/bundle1/bundle2/' createUiDefinition.json
rm -f mainTemplate.json-e
rm -f createUiDefinition.json-e
zip ../azurebundle2_$dt.zip *

# Restore original files
git checkout mainTemplate.json
git checkout createUiDefinition.json
