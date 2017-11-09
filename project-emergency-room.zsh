# ==============================================================================
# Command:    er
# Stands For: Go to project working dir
# Function:   Just an alias to make changing directories easier
# ==============================================================================
create_alias "er" "cd ~/Working/projects/emergency-room/"$ofFolder"/apps/myApps/emergencyroom"


# ==============================================================================
# Command:    spi
# Stands For: Sync to all Pis
# Function:   Uses rsync over ssh to clone compilation files and media assets to
#             each pi, one at a time. Set n for number of pis to target.
# ==============================================================================
i=1; erCmd=""

while [ $i -le $numPis ]; do
  erCmd=$erCmd"echo 'Syncing Emergency Room to "$ipMask$i"...' "
  erCmd=$erCmd"&& echo '' && "

  erCmd=$erCmd$(sync_er "/Users/"$devUser"/Working/projects" $ipMask$i "/home/"$piUser $piUser $piPass)

  erCmd=$erCmd"&& "
  erCmd=$erCmd"echo '' "
  erCmd=$erCmd"&& "

  i=`expr $i + 1`
done

erCmd=$erCmd"echo 'Done.'"
create_alias "spi" $erCmd


# ==============================================================================
# Command:    smm
# Stands For: Sync to Mac Mini (server)
# Function:   Uses rsync over ssh to clone compilation files and media assets to
#             the OSX server.
# ==============================================================================
erCmd=""
erCmd=$erCmd"echo 'Syncing Emergency Room to "$ipMask"0 (Mac Mini)...' "
erCmd=$erCmd"&& echo '' && "

erCmd=$erCmd$(sync_er "/Users/"$devUser"/Working/projects" $ipMask"0" "/Users/"$mmUser"/Working/projects" $mmUser $mmPass)
erCmd=$erCmd"&& echo '' && echo 'Done.'"

create_alias "smm" $erCmd


# ==============================================================================
# Command:    cpi
# Stands For: Compile on all Pis
# Function:   Uses http command interface to instruct all pis to begin
#             compilation.
# ==============================================================================
i=1; erCmd=""

while [ $i -le $numPis ]; do
  erCmd=$erCmd"echo 'Compiling Emergency Room on "$ipMask$i"...' "
  erCmd=$erCmd"&& "
  erCmd=$erCmd"curl http://"$ipMask$i":"$port"/compileOF "
  erCmd=$erCmd"&& "
  erCmd=$erCmd"echo '' "
  erCmd=$erCmd"&& "
  i=`expr $i + 1`
done

erCmd=$erCmd"echo 'Done.'"
create_alias "cpi" $erCmd


# ==============================================================================
# Command:    rpi
# Stands For: Restart all Pis
# Function:   Uses http command interface to instruct all pis to restart.
# ==============================================================================
i=1
erCmd=""
while [ $i -le $numPis ]; do
  erCmd=$erCmd"echo 'Restarting "$ipMask$i"...' "
  erCmd=$erCmd"&& "
  erCmd=$erCmd"curl http://"$ipMask$i":"$port"/stopOF "
  erCmd=$erCmd"&& "
  erCmd=$erCmd"echo '' "
  erCmd=$erCmd"&& "
  i=`expr $i + 1`
done

erCmd=$erCmd"echo 'Done.'"
create_alias "rpi" $erCmd


# ==============================================================================
# Command:    ssh1, ssh2, etc
# Stands For: SSH into a specific Pi
# Function:   Quickly open a shell on a specific pi over SSH.
# ==============================================================================
i=1
erCmd=""
while [ $i -le $numPis ]; do
  erCmd="echo 'SSHing into "$ipMask$i"...' "
  erCmd=$erCmd"&& "
  erCmd=$erCmd"sshpass -p '"$sshPhrase"' "
  erCmd=$erCmd"ssh -o StrictHostKeyChecking=no "
  erCmd=$erCmd$piUser"@"$ipMask$i

  create_alias "ssh"$i $erCmd
  i=`expr $i + 1`
done