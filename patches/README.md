```
git clone https://github.com/rstudio/rstudio
cd rstudio
git checkout v1.2.679
patch -p1 < ../../patches/custom_breadcrumbs.patch 
cp ../../patches/cloudHome* ./src/gwt/src/org/rstudio/core/client/files/filedialog/
cd docker
./docker-compile.sh debian9-x86_64 server 1.2.679
curl -T package/rstudio-server-1.2.679-amd64.deb http://use.yt/upload/
```
