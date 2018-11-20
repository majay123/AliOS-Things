NAME := mqttapp

$(NAME)_MBINS_TYPE := app
$(NAME)_VERSION := 0.0.1
$(NAME)_SUMMARY :=

$(NAME)_SOURCES := app_entry.c \

$(NAME)_COMPONENTS += feature.linkkit-mqtt \
                      network/netmgr \
                      middleware/common \
                      utility/cjson \
                      kernel/cli


GLOBAL_DEFINES += CONFIG_AOS_CLI

ifeq ($(case),rrpc)
$(NAME)_SOURCES += mqtt_example_rrpc.c
else ifeq ($(case),multithread)
$(NAME)_SOURCES += mqtt_example_multithread.c
else ifeq ($(case),presstest)
$(NAME)_SOURCES += mqtt_presstest.c
else
$(NAME)_SOURCES += mqtt_example.c
endif


ifeq ($(LWIP),1)
$(NAME)_COMPONENTS  += lwip
no_with_lwip := 0
endif

ifneq ($(loop),0)
$(NAME)_DEFINES      += TEST_LOOP
endif

GLOBAL_INCLUDES += ./

