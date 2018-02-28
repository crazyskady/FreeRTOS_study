RM := rm -rf

PROJ_ROOT  :=.
BUILD_TMP  :=$(PROJ_ROOT)/tmp
TARGET_INC := -I$(PROJ_ROOT)/inc \
	          -I$(PROJ_ROOT)/FreeRTOS_Kernel/include \
	          -I$(PROJ_ROOT)/FreeRTOS_Kernel/portable/GCC/Posix 

-include subdir.mk
-include FreeRTOS_Kernel/subdir.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

all:simulator_linux.bin

simulator_linux.bin: $(OBJS)
	@echo 'Building target: $@'
	gcc -pthread -lrt -o"simulator_linux.bin" $(OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) simulator_linux.bin
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: