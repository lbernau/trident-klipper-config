sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.octopus
make menuconfig KCONFIG_CONFIG=config.octopus
make KCONFIG_CONFIG=config.octopus
read -p "Octopus firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

make flash KCONFIG_CONFIG=config.octopus FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_33005D001551303432323631-if00
read -p "Octopus firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

# make clean KCONFIG_CONFIG=config.sht42
# make menuconfig KCONFIG_CONFIG=config.sht42

# make KCONFIG_CONFIG=config.sht42
# read -p "SHT 42 (CAN-Board) firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# make flash KCONFIG_CONFIG=config.sht42

sudo service klipper start