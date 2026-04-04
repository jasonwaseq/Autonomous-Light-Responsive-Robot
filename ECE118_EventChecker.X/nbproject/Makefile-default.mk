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
MKDIR=powershell -NoProfile -Command New-Item -ItemType Directory -Force
RM=powershell -NoProfile -Command Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/753956634/AD.o ${OBJECTDIR}/_ext/753956634/BOARD.o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o ${OBJECTDIR}/_ext/753956634/pwm.o ${OBJECTDIR}/_ext/753956634/roach.o ${OBJECTDIR}/_ext/753956634/serial.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/753956634/AD.o.d ${OBJECTDIR}/_ext/753956634/BOARD.o.d ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d ${OBJECTDIR}/_ext/753956634/pwm.o.d ${OBJECTDIR}/_ext/753956634/roach.o.d ${OBJECTDIR}/_ext/753956634/serial.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/753956634/AD.o ${OBJECTDIR}/_ext/753956634/BOARD.o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o ${OBJECTDIR}/_ext/753956634/pwm.o ${OBJECTDIR}/_ext/753956634/roach.o ${OBJECTDIR}/_ext/753956634/serial.o

# Source Files
SOURCEFILES=C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/753956634/AD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c  .generated_files/flags/default/869115eb1d68ac25602831be4d0fa8b4dc1dab3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/AD.o.d" -o ${OBJECTDIR}/_ext/753956634/AD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/BOARD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c  .generated_files/flags/default/b4f9f9c4878c7ab42aaff019df6cf940c9d900b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/BOARD.o.d" -o ${OBJECTDIR}/_ext/753956634/BOARD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c  .generated_files/flags/default/a1c0446cf8e0477be594b249f52cf6902e0ec67b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/pwm.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c  .generated_files/flags/default/b5560dd09760e561605fceb9c6779e0b1656e580 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/pwm.o.d" -o ${OBJECTDIR}/_ext/753956634/pwm.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/roach.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c  .generated_files/flags/default/3b20aec3f70e2644717d39078fda5295695181ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/roach.o.d" -o ${OBJECTDIR}/_ext/753956634/roach.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/serial.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c  .generated_files/flags/default/89f56ebd6745393055a818828f45f2a2cb1edc3c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKITBASIC=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/serial.o.d" -o ${OBJECTDIR}/_ext/753956634/serial.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/753956634/AD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c  .generated_files/flags/default/94d2eec01bc98a90682526b4deb14a386d00e393 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/AD.o.d" -o ${OBJECTDIR}/_ext/753956634/AD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/BOARD.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c  .generated_files/flags/default/15074fdf26f83a8d755b4f0ae5f3a9409ae51a30 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/BOARD.o.d" -o ${OBJECTDIR}/_ext/753956634/BOARD.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c  .generated_files/flags/default/fac8aa992fb4f0c1e121c00a0f2af53afc5df27e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/104121531" 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/104121531/TemplateEventChecker.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/pwm.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c  .generated_files/flags/default/390fecfc2f40aee209ffabe747bc6f38ac7b61f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/pwm.o.d" -o ${OBJECTDIR}/_ext/753956634/pwm.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/roach.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c  .generated_files/flags/default/67da24b4508ce9626668028b35959e6fbfe1a73 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/roach.o.d" -o ${OBJECTDIR}/_ext/753956634/roach.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/753956634/serial.o: C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c  .generated_files/flags/default/940e5a193c5000c16cc0b45998d826c1523863f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/753956634" 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/753956634/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../include" -I"../templates" -MP -MMD -MF "${OBJECTDIR}/_ext/753956634/serial.o.d" -o ${OBJECTDIR}/_ext/753956634/serial.o C:/Users/jason/Documents/ECE118/ECE118_Lab0/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/Users/jason/Documents/ECE118/ECE118_Lab0/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PICKITBASIC=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PICKITBASIC=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/Users/jason/Documents/ECE118/ECE118_Lab0/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/ECE118_EventChecker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
