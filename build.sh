mkdir -p public/en public/fr
cp README.md public

wget https://github.com/QCBSRworkshops/templateWorkshops/archive/master.zip
unzip master

cp -r -t public/fr Atelier01/Atelier01.Rmd images
cp -r -t public/en Workshop01/Workshop01.Rmd images

for i in "en" "fr"
do
  cp -r -t public/$i templateWorkshops-master/assets templateWorkshops-master/qcbs*
done

rm -rf master.zip templateWorkshops-master


cd public/fr && Rscript -e "rmarkdown::render('Atelier01.Rmd')" && cd ../..
cd public/en && Rscript -e "rmarkdown::render('Workshop01.Rmd')" && cd ../..
