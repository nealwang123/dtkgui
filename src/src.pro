TARGET = dtkgui5.5
TEMPLATE = lib
QT += dtkcore5.5 gui gui-private dbus network
CONFIG += internal_module

# 龙芯架构上没有默认添加PT_GNU_STACK-section,所以此处手动指定一下
contains(QMAKE_HOST.arch, mips.*): QMAKE_LFLAGS_SHLIB += "-Wl,-z,noexecstack"

# don't link library
QMAKE_CXXFLAGS += $$system(pkg-config --cflags-only-I librsvg-2.0)

INCLUDEPATH += \
    $$PWD/filedrag \
    $$PWD/kernel \
    $$PWD/util \
    $$PWD/private

include(filedrag/filedrag.pri)
include(kernel/kernel.pri)
include(util/util.pri)
include(private/private.pri)

includes.files += \
    $$PWD/*.h \
    $$PWD/DtkGuis \
    $$PWD/dtkgui_config.h \
    $$PWD/kernel/*.h \
    $$PWD/kernel/DForeignWindow \
    $$PWD/kernel/DGuiApplicationHelper \
    $$PWD/kernel/DNativeSettings \
    $$PWD/kernel/DPalette \
    $$PWD/kernel/DPlatformHandle \
    $$PWD/kernel/DPlatformTheme \
    $$PWD/kernel/DRegionMonitor \
    $$PWD/kernel/DWindowGroupLeader \
    $$PWD/kernel/DWindowManagerHelper \
    $$PWD/filedrag/*.h \
    $$PWD/filedrag/DFileDrag \
    $$PWD/filedrag/DFileDragClient \
    $$PWD/filedrag/DFileDragServer \
    $$PWD/util/*.h \
    $$PWD/util/DFontManager \
    $$PWD/util/DSvgRenderer \
    $$PWD/util/DTaskbarControl \
    $$PWD/util/DThumbnailProvider

dbus_monitor.files += $$PWD/dbus/com.deepin.api.XEventMonitor.xml
dbus_monitor.header_flags += -i dbus/arealist.h
DBUS_INTERFACES += dbus_monitor

DTK_MODULE_NAME=$$TARGET
load(dtk_build)

INSTALLS += includes target

load(dtk_cmake)
load(dtk_module)
