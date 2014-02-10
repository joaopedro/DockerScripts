		#!/bin/bash
		# Make sure only root can run our script
		if [[ $EUID -ne 0 ]]; then
		   echo "This script must be run as root or using sudo" 1>&2
		   exit 1
		fi
		# if a previous version is here - get rid of it
			cd $1
				if [ -f UNINSTALL-jai_imageio ]; then
					echo 'Removing previous install of JAI ImageIO ...'
					bash UNINSTALL-jai_imageio
				fi
		#work in the temp folder
		cd /var/tmp
		#reassure the user something is happening
		echo 'Downloading JAI Image IO ...'
		#check which chipset we're using
		case $(arch) in
				i686)
						CHIP=i586
						CHIP2=i386
				;;
				x86_64)
						CHIP=amd64
						CHIP2=amd64
				;;
				*)
				;;
		esac
		#download the JAI tgz file
		# get jai binary
		if [ -f ./jai_imageio-1_1-lib-linux-$CHIP.tar.gz ]; then
				rm ./jai_imageio-1_1-lib-linux-$CHIP.tar.gz
			fi
		echo http://download.java.net/media/jai-imageio/builds/release/1.1/jai_imageio-1_1-lib-linux-$CHIP.tar.gz
		wget -q http://download.java.net/media/jai-imageio/builds/release/1.1/jai_imageio-1_1-lib-linux-$CHIP.tar.gz
		#reassure the user something is happening
		echo 'Installing JAI Image IO ...'
		#expand the tgz and put the files where they should go (excluding UNINSTALL)
		tar xzf ./jai_imageio-1_1-lib-linux-$CHIP.tar.gz 
		mv      ./jai_imageio-1_1/COPYRIGHT-jai_imageio.txt \
				./jai_imageio-1_1/DISTRIBUTIONREADME-jai_imageio.txt \
				./jai_imageio-1_1/ENTITLEMENT-jai_imageio.txt \
				./jai_imageio-1_1/LICENSE-jai_imageio.txt \
				./jai_imageio-1_1/THIRDPARTYLICENSEREADME-jai_imageio.txt \
					$1
		mv      ./jai_imageio-1_1/lib/libclib_jiio.so \
					$1/jre/lib/$CHIP2/
		mv      ./jai_imageio-1_1/lib/clibwrapper_jiio.jar \
				./jai_imageio-1_1/lib/jai_imageio.jar \
					$1/jre/lib/ext/
		#generate the UNINSTALL file - using the version that comes in the binary install
		cat > $1/UNINSTALL-jai_imageio <<DELIM
		#!/bin/sh
		# @(#)UNINSTALL-jai_imageio-jdk	3.1 06/05/12 16:18:39
		# usage: UNINSTALL-jai_imageio
		echo "Uninstalling Java Advanced Imaging Image I/O Tools"
		rm -f *jai_imageio.txt
		rm -f jre/lib/ext/jai_imageio.jar
		rm -f jre/lib/ext/clibwrapper_jiio.jar
		if [ \( `uname` = "SunOS" \) -a \( `uname -p` = "sparc" \) ]; then
			rm -f jre/lib/sparc/libclib_jiio.so
			rm -f jre/lib/sparc/libclib_jiio_vis.so
			rm -f jre/lib/sparc/libclib_jiio_vis2.so
			if [ -f jre/lib/sparcv9/libclib_jiio.so ]; then
			rm -f jre/lib/sparcv9/libclib_jiio.so
			rm -f jre/lib/sparcv9/libclib_jiio_vis.so
			rm -f jre/lib/sparcv9/libclib_jiio_vis2.so
			fi
		fi
		if [ -f jre/lib/amd64/libclib_jiio.so ]; then
			rm -f jre/lib/amd64/libclib_jiio.so
		fi
		if [ -f jre/lib/i386/libclib_jiio.so ]; then
			rm -f jre/lib/i386/libclib_jiio.so
		fi
		rm -f UNINSTALL-jai_imageio
		echo "Done"
		DELIM
