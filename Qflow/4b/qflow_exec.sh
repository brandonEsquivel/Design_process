#!/usr/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/bran/Documentos/repositories/Design_process/Qflow/4b
#-------------------------------------------

 /usr/lib/qflow/scripts/synthesize.sh /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1
 /usr/lib/qflow/scripts/placement.sh -d /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1
 /usr/lib/qflow/scripts/vesta.sh /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1
 /usr/lib/qflow/scripts/router.sh /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1
# /usr/lib/qflow/scripts/placement.sh -f -d /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1
# /usr/lib/qflow/scripts/router.sh /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1 $status
# /usr/lib/qflow/scripts/cleanup.sh /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1
# /usr/lib/qflow/scripts/display.sh /home/bran/Documentos/repositories/Design_process/Qflow/4b counter_4b || exit 1
