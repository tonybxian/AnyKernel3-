### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=APTKernel by ApartTUSITU @ AstideLabs
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=apollo
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=auto;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;
NO_BLOCK_DISPLAY=1;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# Select the correct image to flash
if [ -f $AKHOME/kernels/miui/Image ]; then
kern="miui";
else
kern="aosp";
fi;
mv $AKHOME/kernels/$kern/Image $AKHOME/Image;
mv $AKHOME/kernels/$kern/dtb $AKHOME/dtb;
mv $AKHOME/kernels/$kern/dtbo.img $AKHOME/dtbo.img;


# boot install
split_boot;

flash_boot;
flash_generic dtbo;
## end boot install

