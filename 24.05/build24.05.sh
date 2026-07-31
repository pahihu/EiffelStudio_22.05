export EIFFEL_SRC=$HOME/src/EiffelStudio/Src
export ISE_LIBRARY=$EIFFEL_SRC
export _EWEASEL_DIR=$HOME/src/EiffelStudio

if [ $# -eq 1 ];
then
    echo "clean..."
    rm -f *.log
    rm -rf EIFGENs BIN COMP
    rm -f ec ec.melted
    rm -rf EiffelXX Eiffel_24.05
    exit 0
fi

geant -b $EIFFEL_SRC/build.eant prepare 2>&1 | tee my_prepare.log && \
    geant -b $EIFFEL_SRC/build.eant compile 2>&1 | tee my_compile.log && \
    geant -b $EIFFEL_SRC/build.eant compile_workbench 2>&1 | tee my_compile_workbench.log && \
    geant -b $EIFFEL_SRC/build.eant make_delivery 2>&1 | tee my_make_delivery.log

if [ -d EiffelXX ];
then
    find EiffelXX | grep '\-config$' | xargs chmod +x
    mv EiffelXX Eiffel_24.05
    tar cfa Eiffel_24.05_gpl_107822-macosx-armv6.tar.bz2 Eiffel_24.05
fi
