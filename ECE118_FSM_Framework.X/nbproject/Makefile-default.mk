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
MKDIR=cmd /c ..\\tools\\nb_mkdir.bat
RM=cmd /c ..\\tools\\nb_rm.bat
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateEventChecker.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateES_Main.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateService.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/753956634/AD.o ${OBJECTDIR}/_ext/753956634/BOARD.o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o ${OBJECTDIR}/_ext/753956634/ES_Framework.o ${OBJECTDIR}/_ext/753956634/ES_PostList.o ${OBJECTDIR}/_ext/753956634/ES_Queue.o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o ${OBJECTDIR}/_ext/753956634/ES_Timers.o ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o ${OBJECTDIR}/_ext/1441322116/TemplateService.o ${OBJECTDIR}/_ext/753956634/pwm.o ${OBJECTDIR}/_ext/753956634/roach.o ${OBJECTDIR}/_ext/753956634/serial.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/753956634/AD.o.d ${OBJECTDIR}/_ext/753956634/BOARD.o.d ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/753956634/ES_Framework.o.d ${OBJECTDIR}/_ext/753956634/ES_PostList.o.d ${OBJECTDIR}/_ext/753956634/ES_Queue.o.d ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d ${OBJECTDIR}/_ext/753956634/ES_Timers.o.d ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o.d ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o.d ${OBJECTDIR}/_ext/1441322116/TemplateService.o.d ${OBJECTDIR}/_ext/753956634/pwm.o.d ${OBJECTDIR}/_ext/753956634/roach.o.d ${OBJECTDIR}/_ext/753956634/serial.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/753956634/AD.o ${OBJECTDIR}/_ext/753956634/BOARD.o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o ${OBJECTDIR}/_ext/753956634/ES_Framework.o ${OBJECTDIR}/_ext/753956634/ES_PostList.o ${OBJECTDIR}/_ext/753956634/ES_Queue.o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o ${OBJECTDIR}/_ext/753956634/ES_Timers.o ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o ${OBJECTDIR}/_ext/1441322116/TemplateService.o ${OBJECTDIR}/_ext/753956634/pwm.o ${OBJECTDIR}/_ext/753956634/roach.o ${OBJECTDIR}/_ext/753956634/serial.o

# Source Files
SOURCEFILES=C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateEventChecker.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateES_Main.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateService.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/753956634/AD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c  .generated_files/flags/default/e15c956b878375bc0e3a029dec4af6f9fe5162f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/AD.o.d" -o ${OBJECTDIR}/_ext/753956634/AD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/BOARD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c  .generated_files/flags/default/38d588489022a9dbcac4c42126813637754f835e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/BOARD.o.d" -o ${OBJECTDIR}/_ext/753956634/BOARD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c  .generated_files/flags/default/b28e97dacf08609822dcaf20a56f1d6f72d33897 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Framework.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c  .generated_files/flags/default/e818cbb00ce80f7963ffd3107296cf16f1ce9699 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Framework.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_PostList.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c  .generated_files/flags/default/c56c3d1cd6ba5a2bfa4718d9137a1bd59179a02f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_PostList.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Queue.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c  .generated_files/flags/default/9c1c3d73c1cfd24cfb8804b65041db57f79258f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Queue.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_TattleTale.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c  .generated_files/flags/default/2d319373dfbce149ffd12e3e9db8c74267baa3ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Timers.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c  .generated_files/flags/default/903ef7b56ace23457f77c7be740afc7314ef33f2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Timers.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateEventChecker.c  .generated_files/flags/default/c7d9888bc2c9630c2fff37d751c8a829c0b7c484 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1441322116" 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateES_Main.c  .generated_files/flags/default/c443ddda76737a5b8c4b4d1fef1fe3fecbc17622 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1441322116" 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o.d" -o ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1441322116/TemplateService.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateService.c  .generated_files/flags/default/5c50c5388827a81b9e66960f814f60c6e2e3ec0f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1441322116" 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1441322116/TemplateService.o.d" -o ${OBJECTDIR}/_ext/1441322116/TemplateService.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/pwm.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c  .generated_files/flags/default/e212f90a3e3a0a4b5a1e54da308492435ebc157a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/pwm.o.d" -o ${OBJECTDIR}/_ext/753956634/pwm.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/roach.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c  .generated_files/flags/default/3b859e6d91c77e28b95ab7593d646c0f1a53431a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/roach.o.d" -o ${OBJECTDIR}/_ext/753956634/roach.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/serial.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c  .generated_files/flags/default/59ea954654eb6c150b659c8cceb545381d945d62 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/serial.o.d" -o ${OBJECTDIR}/_ext/753956634/serial.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/753956634/AD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c  .generated_files/flags/default/8cb335c8da6d568087341d70d3eac380e764434c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/AD.o.d" -o ${OBJECTDIR}/_ext/753956634/AD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/BOARD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c  .generated_files/flags/default/681c3f151c8c3013e6a88f2e9c6cb9e1da905a16 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/BOARD.o.d" -o ${OBJECTDIR}/_ext/753956634/BOARD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c  .generated_files/flags/default/5de489f5f9f791a37184b9c26d9b15c6fe059ff8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_CheckEvents.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Framework.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c  .generated_files/flags/default/af4a003f8eaf8f3696343d0124395339e673fba6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Framework.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_PostList.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c  .generated_files/flags/default/3f930aad93e42d255726d7986529509e51b8147d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_PostList.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Queue.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c  .generated_files/flags/default/cf52d7c94514a6e55f040203a7005d813fdbad8b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Queue.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_TattleTale.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c  .generated_files/flags/default/ed0e02d7433eec9b3fdc10b02718605c403948d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_TattleTale.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/ES_Timers.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c  .generated_files/flags/default/57cd5d9651c924a423ab111e684f2df26682f717 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/753956634/ES_Timers.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateEventChecker.c  .generated_files/flags/default/d09348a822288c043f683e196e312baeda26efe3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1441322116" 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/1441322116/TemplateEventChecker.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateES_Main.c  .generated_files/flags/default/18b4c380653f3519d905c99b38a29a763cc35250 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1441322116" 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o.d" -o ${OBJECTDIR}/_ext/1441322116/TemplateES_Main.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1441322116/TemplateService.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateService.c  .generated_files/flags/default/9ae03d50d78642c388edf8f39775c7022ca903a4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1441322116" 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1441322116/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1441322116/TemplateService.o.d" -o ${OBJECTDIR}/_ext/1441322116/TemplateService.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/fsm_templates/TemplateService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/pwm.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c  .generated_files/flags/default/80f504b28e8dcb4a86d1acaf7107c026d5d05c02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/pwm.o.d" -o ${OBJECTDIR}/_ext/753956634/pwm.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/roach.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c  .generated_files/flags/default/d1ac85232c14fbea58bf640b25ba164eff8c04b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/roach.o.d" -o ${OBJECTDIR}/_ext/753956634/roach.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/serial.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c  .generated_files/flags/default/9b04bcde900ada093527c1b1392d0711f758c262 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -I"." -I"../include" -I"../fsm_templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/serial.o.d" -o ${OBJECTDIR}/_ext/753956634/serial.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/Users/jason/Documents/ECE118/ECE118_Lab0/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PICKITBASIC=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PICKITBASIC=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/Users/jason/Documents/ECE118/ECE118_Lab0/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/ECE118_FSM_Framework.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
