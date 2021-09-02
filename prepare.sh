#/bin/sh
rm -rf cache rdf-files* catalog.txt
echo prepare: fetching
wget https://www.gutenberg.org/cache/epub/feeds/rdf-files.tar.bz2
echo prepare: untarring
tar xf rdf-files.tar.bz2
echo prepare: extracting
find cache -type f | xargs fgrep -f relevant.types >rdf-data.txt
ed rdf-data.txt <<end-ed
g;dc/terms/LCSH;j
wq
end-ed
