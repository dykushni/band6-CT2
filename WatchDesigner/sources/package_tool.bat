@echo off<nul 3>nul 

set PATH=%PATH%;C:\Windows\System32

@rem 生成表盘主资源bin及map表
cd ./watchface/res
copy ..\tools\* .\
mkdir watchface_img
cd ./watchface_img
mkdir img16
cd ..\

mkdir switch_img
cd ./switch_img
mkdir img16
cd ..\

xcopy .\watchface_res\*.* .\watchface_img\img16 /s /e /y
xcopy .\switch_res\*.* .\switch_img\img16 /s /e /y

package_img "GUI" "1.1.676" "watchface_img" "ui_watce_face_img.bin" "ui_bitmap_mapping.c" "watchface_res.h" "__UI_RES__H__" "g_u32ResTotalLen"
move ui_watce_face_img.bin ../../ui_watce_face_img.bin

bitMappingToBin.exe ui_bitmap_mapping.c
move ui_bitmap_mapping.bin ../../ui_bitmap_mapping.bin

@rem 生成表盘切换图bin及map表
package_img "GUI" "1.1.676" "switch_img" "ui_switch_watce_face_img.bin" "ui_bitmap_mapping.c" "switch_res.h" "__UI_RES__H__" "g_u32ResTotalLen"
move ui_switch_watce_face_img.bin ../../ui_switch_watce_face_img.bin

bitMappingToBin.exe ui_bitmap_mapping.c
move ui_bitmap_mapping.bin ../../ui_switchFacebitmap_mapping.bin

copy .\TemplateWatch.exe ..\..\
copy .\7z.exe ..\..\
copy .\7z.dll ..\..\
del *.exe
del *.h
del *.c
del *.csv
del *.dll

rd /q /s .\watchface_img
rd /q /s .\switch_img

cd ..\
copy .\watch_face_config.xml ..\
copy .\watch_face_info.xml ..\ 

copy .\tools\TemplateWatch.exe ..\
copy .\tools\7z.exe ..\
copy .\tools\7z.dll ..\

cd ..\

TemplateWatch.exe "%cd%"

del *.exe
del *.dll
del *.bin
del com.huawei.watchface
del watch_face_config.xml
del watch_face_info.xml

@echo Packing succeeded.
@pause
exit /b