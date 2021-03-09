TEMPLATE = app
QT += dtkcore5.5 widgets

SOURCES += \
    $$PWD/dnd-test-client.cpp

DESTDIR = $$_PRO_FILE_PWD_/../../bin

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../src/release -ldtkgui5.5
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../src/debug -ldtkgui5.5
else:unix: LIBS += -L$$OUT_PWD/../../src -ldtkgui5.5

INCLUDEPATH += $$PWD/../../src

CONFIG(debug, debug|release) {
    unix:QMAKE_RPATHDIR += $$OUT_PWD/../../src
}

DTK_MODULE_NAME=dtkgui5.5
load(dtk_build_config)
target.path = $$TOOL_INSTALL_DIR

INSTALLS += target
