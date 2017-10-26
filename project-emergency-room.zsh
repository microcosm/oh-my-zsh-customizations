alias er='~/Working/projects/emergency-room/'$ofFolder'/apps/myApps/emergencyroom'


# ==============================================================================
# Command:    spi
# Stands For: Sync to all Pis
# Function:   Uses rsync over ssh to clone compilation files and media assets to
#             each pi, one at a time. Set n for number of pis to target.
# ==============================================================================
i=1
erSpiCmd=""
while [ $i -le $numPis ]; do
  erSpiCmd=$erSpiCmd"echo 'Syncing Emergency Room to "$ipMask$i"...' && sshpass -p '"$sshPhrase"' rsync -avzh --delete --exclude '.git' --exclude '.gitignore' --exclude '*.xcodeproj' --exclude 'openFrameworks-Info.plist' --exclude 'Project.xcconfig' --exclude '*.app' --exclude 'bin/data/AudioUnitPresets' --exclude 'bin/data/log' --exclude 'bin/data/test' --exclude '.DS_Store' --exclude 'obj' --exclude 'bin/emergencyroom' --exclude 'bin/readMe.txt' /Users/"$osxUser"/Working/projects/emergency-room/"$ofFolder"/apps/myApps/emergencyroom/ "$piUser"@"$ipMask$i":/home/"$piUser"/emergency-room/"$ofFolder"/apps/myApps/emergencyroom/ && sshpass -p '"$sshPhrase"' rsync -avzh --delete --exclude '.DS_Store' /Users/"$osxUser"/Working/projects/emergency-room/er-media/ "$piUser"@"$ipMask$i":/home/"$piUser"/emergency-room/er-media/ && echo '' && "
  i=`expr $i + 1`
done

erSpiCmd=$erSpiCmd"echo 'Done.'"

eval "alias spi=\""$erSpiCmd"\"" #echo "alias spi=\""$erSpiCmd"\""


# ==============================================================================
# Command:    cpi
# Stands For: Compile on all Pis
# Function:   Uses http command interface to instruct all pis to begin
#             compilation.
# ==============================================================================
i=1
erCpiCmd=""
while [ $i -le $numPis ]; do
  erCpiCmd=$erCpiCmd"echo 'Compiling Emergency Room on "$ipMask$i"...' && curl http://"$ipMask$i":"$port"/compileOF && echo '' && "
  i=`expr $i + 1`
done

erCpiCmd=$erCpiCmd"echo 'Done.'"

eval "alias cpi=\""$erCpiCmd"\"" #echo "alias cpi=\""$erCpiCmd"\""


# ==============================================================================
# Command:    rpi
# Stands For: Retstart all Pis
# Function:   Uses http command interface to instruct all pis to restart.
# ==============================================================================
i=1
erRpiCmd=""
while [ $i -le $numPis ]; do
  erRpiCmd=$erRpiCmd"echo 'Restarting "$ipMask$i"...' && curl http://"$ipMask$i":"$port"/stopOF && echo '' && "
  i=`expr $i + 1`
done

erRpiCmd=$erRpiCmd"echo 'Done.'"

eval "alias rpi=\""$erRpiCmd"\"" #echo "alias rpi=\""$erRpiCmd"\""


# ==============================================================================
# Command:    ssh1, ssh2, etc
# Stands For: SSH into a specific Pi
# Function:   Quickly open a shell on a specific pi over SSH.
# ==============================================================================
i=1
erSshCmd=""
while [ $i -le $numPis ]; do
  erSshCmd="alias ssh"$i"=\"echo 'SSHing into "$ipMask$i"...' && sshpass -p '"$sshPhrase"' ssh -o StrictHostKeyChecking=no "$piUser"@"$ipMask$i"\""
  eval $erSshCmd
  #echo $erSshCmd
  i=`expr $i + 1`
done