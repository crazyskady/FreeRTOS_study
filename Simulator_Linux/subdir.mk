C_SRCS += \
$(PROJ_ROOT)/src/main.c 

OBJS += \
$(BUILD_TMP)/main.o 

C_DEPS += \
$(BUILD_TMP)/main.d 

# Each subdirectory must supply rules for building sources it contributes
$(BUILD_TMP)/%.o: $(PROJ_ROOT)/src/%.c
	@echo 'Building file: $<'
	gcc -DUSE_STDIO=1 -D__GCC_POSIX__=1 $(TARGET_INC) -O2 -Wall -c -fmessage-length=0 -pthread -lrt -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '