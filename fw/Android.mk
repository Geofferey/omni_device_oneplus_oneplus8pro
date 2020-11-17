ifneq ($(filter $(ROM_BUILD_RADIO), true),)
ifeq ($(TARGET_DEVICE),$(filter $(TARGET_DEVICE),oneplus8pro))


LOCAL_PATH := $(call my-dir)


$(call add-radio-file,filesmap)
$(call add-radio-file,abl.img)
$(call add-radio-file,aop.img)
$(call add-radio-file,bluetooth.img)
$(call add-radio-file,cmnlib64.img)
$(call add-radio-file,cmnlib.img)
$(call add-radio-file,devcfg.img)
$(call add-radio-file,dsp.img)
$(call add-radio-file,featenabler.img)
$(call add-radio-file,hyp.img)
$(call add-radio-file,imagefv.img)
$(call add-radio-file,keymaster.img)
$(call add-radio-file,logo.img)
$(call add-radio-file,mdm_oem_stanvbk.img)
$(call add-radio-file,modem.img)
$(call add-radio-file,multiimgoem.img)
$(call add-radio-file,qupfw.img)
$(call add-radio-file,reserve.img)
$(call add-radio-file,tz.img)
$(call add-radio-file,uefisecapp.img)
$(call add-radio-file,xbl_config.img)
$(call add-radio-file,xbl.img)
$(call add-radio-file,storsec.img)
$(call add-radio-file,spunvm.img)

endif
endif
