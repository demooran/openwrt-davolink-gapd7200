define Device/davolink_gapd-7200
	DEVICE_VENDOR := Davolink
	DEVICE_MODEL := GAPD-7200
	DEVICE_DTS := qcom-ipq4019-gapd7200
	SOC := qcom-ipq4019
	KERNEL_SIZE := 4096k
	IMAGE_SIZE := 122880k
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	IMAGES := sysupgrade.bin
	IMAGE/sysupgrade.bin := append-kernel | pad-to $$(KERNEL_SIZE) | append-rootfs | pad-rootfs | append-metadata | check-size
endef
TARGET_DEVICES += davolink_gapd-7200
