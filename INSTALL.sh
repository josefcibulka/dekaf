INSTALL_LOCATION=`pwd`
read -e -p "Enter the location, where dekaf was installed: " -i $INSTALL_LOCATION INSTALL_LOCATION
for f in *.sh
do
  ./change_basedir.awk -v INSTALL_LOCATION=$INSTALL_LOCATION < $f > install_tmp && chmod --reference=$f install_tmp && mv install_tmp $f
done
echo "To tweak other file locations, edit the environment.sh, which currently contains:"
cat environment.sh
