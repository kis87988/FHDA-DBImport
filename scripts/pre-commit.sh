#!/bin/bash
set -e

[ -n "$NO_HOOK" ] && exit 0

[ -n "$INNER_PRE_HOOK" ] && {
  # http://stackoverflow.com/a/21334985/1123955
  exit 0
}
GIT_ROOT=$(git rev-parse --show-toplevel)
echo "start autopep8 for code style formating"
autopep8 --verbose --in-place --recursive "${GIT_ROOT}"
echo "start pydocstyle for code docstring checking"
python -m pydocstyle "${GIT_ROOT}"/DBImport
  cat <<'_STR_'
       _ _                                   _ _    
      (_) |                                 (_) |   
  __ _ _| |_    ___ ___  _ __ ___  _ __ ___  _| |_  
 / _` | | __|  / __/ _ \| '_ ` _ \| '_ ` _ \| | __| 
| (_| | | |_  | (_| (_) | | | | | | | | | | | | |_  
 \__, |_|\__|  \___\___/|_| |_| |_|_| |_| |_|_|\__| 
  __/ |                                             
 |___/                                              
                                 _ _                
                                | | |               
 ___ _   _  ___ ___ ___  ___  __| | |               
/ __| | | |/ __/ __/ _ \/ _ \/ _` | |               
\__ \ |_| | (_| (_|  __/  __/ (_| |_|               
|___/\__,_|\___\___\___|\___|\__,_(_)               
                                                                                                      
_STR_

