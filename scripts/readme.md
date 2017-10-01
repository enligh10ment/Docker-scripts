# Collection of bash scripts for Docker #

This is a collection of bash scripts I use for docker. Some are written with a very specific need in mind and might not be helpful for most users.

### Docker Scripts Overview###

#### DeviceMapperChk.sh ####

Find out how much Device Mapper space is used/available/total on your docker hosts

<pre>
cars@sre:~/sre-tools/scripts/docker$ ./DeviceMapperChk.sh

HOST                USED     TOTAL    AVAILABLE
cjXXXXXX.com        62.31GB  193.3GB  131GB
cjXXXXXX.com        49.6GB   64.42GB  14.83GB
cjXXXXXX.com        41.02GB  64.42GB  23.4GB
cjXXXXXX.com        39GB     64.42GB  25.42GB
cjXXXXXX.com        49.81GB  64.42GB  14.62GB
cjXXXXXX.com        18.7GB   64.42GB  45.72GB
cjXXXXXX.com        39.73GB  64.42GB  24.7GB
cjXXXXXX.com        50.89GB  64.42GB  13.54GB
cjXXXXXX.com        46.01GB  64.42GB  18.42GB
cjXXXXXX.com        46.03GB  64.42GB  18.4GB
cjXXXXXX.com        32.71GB  64.42GB  31.72GB
cjXXXXXX.com        20.23GB  64.42GB  44.19GB
cjXXXXXX.com        16.84GB  64.42GB  47.58GB
cjXXXXXX.com        10.65GB  64.42GB  53.78GB
csXXXXXX.com        29.48GB  102GB    72.52GB
csXXXXXX.com        25.96GB  102GB    76.04GB
csXXXXXX.com        25.79GB  102GB    76.21GB
csXXXXXX.com        24.59GB  102GB    77.42GB
csXXXXXX.com        24.21GB  64.42GB  40.21GB
csXXXXXX.com        22.89GB  64.42GB  41.53GB
</pre>
