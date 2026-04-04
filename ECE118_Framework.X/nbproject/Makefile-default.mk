#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateES_Main.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateService.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/753956634/AD.o ${OBJECTDIR}/_ext/753956634/BOARD.o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o ${OBJECTDIR}/_ext/753956634/ES_Framework.o ${OBJECTDIR}/_ext/753956634/ES_PostList.o ${OBJECTDIR}/_ext/753956634/ES_Queue.o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o ${OBJECTDIR}/_ext/753956634/ES_Timers.o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o ${OBJECTDIR}/_ext/104121531/TemplateService.o ${OBJECTDIR}/_ext/753956634/pwm.o ${OBJECTDIR}/_ext/753956634/roach.o ${OBJECTDIR}/_ext/753956634/serial.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/753956634/AD.o.d ${OBJECTDIR}/_ext/753956634/BOARD.o.d ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/753956634/ES_Framework.o.d ${OBJECTDIR}/_ext/753956634/ES_PostList.o.d ${OBJECTDIR}/_ext/753956634/ES_Queue.o.d ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d ${OBJECTDIR}/_ext/753956634/ES_Timers.o.d ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o.d ${OBJECTDIR}/_ext/104121531/TemplateService.o.d ${OBJECTDIR}/_ext/753956634/pwm.o.d ${OBJECTDIR}/_ext/753956634/roach.o.d ${OBJECTDIR}/_ext/753956634/serial.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/753956634/AD.o ${OBJECTDIR}/_ext/753956634/BOARD.o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o ${OBJECTDIR}/_ext/753956634/ES_Framework.o ${OBJECTDIR}/_ext/753956634/ES_PostList.o ${OBJECTDIR}/_ext/753956634/ES_Queue.o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o ${OBJECTDIR}/_ext/753956634/ES_Timers.o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o ${OBJECTDIR}/_ext/104121531/TemplateService.o ${OBJECTDIR}/_ext/753956634/pwm.o ${OBJECTDIR}/_ext/753956634/roach.o ${OBJECTDIR}/_ext/753956634/serial.o

# Source Files
SOURCEFILES=C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateES_Main.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateService.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="C:\Users\jason\Documents\ECE118\ECE118_Lab0\bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/753956634/AD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c  .generated_files/flags/default/fea8b593edeccbe1fa5807776d6ee9809fe57792 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/AD.o.d" -o ${OBJECTDIR}/_ext/753956634/AD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/BOARD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c  .generated_files/flags/default/28f8d7877e8847d0e333aa509c2ce02f036ed820 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/BOARD.o.d" -o ${OBJECTDIR}/_ext/753956634/BOARD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c  .generated_files/flags/default/5d6111f059c9fc4572c6c96026dfc1a539bb14c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Framework.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c  .generated_files/flags/default/94066281509ffcd98a1b545b33a95d7e0d779d08 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Framework.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_PostList.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c  .generated_files/flags/default/94e4464aa907dbccf98ffb714d60e2f4d99ae77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_PostList.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Queue.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c  .generated_files/flags/default/a82d4455a7a7c1227950811db851489685267376 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Queue.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_TattleTale.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c  .generated_files/flags/default/31d20d51ac405e57aba2ce0a6084b3ab85cf32bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Timers.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c  .generated_files/flags/default/f0ac165b799409ff6a1e9af98240d0b350c33fb3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Timers.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c  .generated_files/flags/default/487ca6ed7b766c0dfb625352831ab14cb6fb2c47 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateES_Main.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateES_Main.c  .generated_files/flags/default/2818d33c62ff811bd5aa543ac09527372bac5bd6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateES_Main.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateService.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateService.c  .generated_files/flags/default/4cfc776b866855e9885de5cfe6faf6031249fb54 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateService.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateService.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/pwm.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c  .generated_files/flags/default/660e493741979d26de81125cc6b8ea3cfa8a125 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/pwm.o.d" -o ${OBJECTDIR}/_ext/753956634/pwm.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/roach.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c  .generated_files/flags/default/a51407957f86f0ae7f67175f48b73b6f42919e41 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/roach.o.d" -o ${OBJECTDIR}/_ext/753956634/roach.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/serial.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c  .generated_files/flags/default/79432e7c5002f0fbf5503d57e9fb13276bd97df5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/serial.o.d" -o ${OBJECTDIR}/_ext/753956634/serial.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/753956634/AD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c  .generated_files/flags/default/ae69c3ff7d0d88b8a53a057b6353a0fe497ec057 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/AD.o.d" -o ${OBJECTDIR}/_ext/753956634/AD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/BOARD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c  .generated_files/flags/default/5cf15f65b159eeea3733bfc103378461bdd6d147 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/BOARD.o.d" -o ${OBJECTDIR}/_ext/753956634/BOARD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c  .generated_files/flags/default/179f5f9ae4377c0421f7b454dface2de14cb0169 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Framework.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c  .generated_files/flags/default/e413d5d291b6e32a9ae45382105ef5c42a90ccef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Framework.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_PostList.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c  .generated_files/flags/default/bc5803340b45d5720201199ff5dab05b6789fd60 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_PostList.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Queue.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c  .generated_files/flags/default/bc78730302b05007738edb1e58cd1befa1310f75 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Queue.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_TattleTale.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c  .generated_files/flags/default/87b218598e62083bd2d14b1ea75301de7803348 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Timers.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c  .generated_files/flags/default/92ff73349a0efb652bf915b60916033ee93ab1ba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Timers.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c  .generated_files/flags/default/2bd84abcc190165aa044d804a64d537c33d947b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateES_Main.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateES_Main.c  .generated_files/flags/default/fcc87a3412ecb5246d3df5887dbacff8a42f3b0e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateES_Main.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateES_Main.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateService.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateService.c  .generated_files/flags/default/bbf2e072b28923cae56a4305d427b7a7398c890b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateService.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateService.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/pwm.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c  .generated_files/flags/default/c657790331925f54909441c8523c1bb5917b93c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/pwm.o.d" -o ${OBJECTDIR}/_ext/753956634/pwm.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/roach.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c  .generated_files/flags/default/4d68036c144c50e582f1ee54baf0d026711ab561 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/roach.o.d" -o ${OBJECTDIR}/_ext/753956634/roach.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/serial.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c  .generated_files/flags/default/53ad23d01b4e1e2b77472702463d3af80370989d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/serial.o.d" -o ${OBJECTDIR}/_ext/753956634/serial.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/Users/jason/Documents/ECE118/ECE118_Lab0/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PICKITBASIC=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PICKITBASIC=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/Users/jason/Documents/ECE118/ECE118_Lab0/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/ECE118_Framework.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
