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
  erSpiCmd=$erSpiCmd"echo 'Syncing Emergency Room to "$ipMask$i"...' "
  erSpiCmd=$erSpiCmd"&& "
  erSpiCmd=$erSpiCmd"sshpass -p '"$sshPhrase"' "
  erSpiCmd=$erSpiCmd"rsync -avzh --delete "
  erSpiCmd=$erSpiCmd"--exclude '.git' "
  erSpiCmd=$erSpiCmd"--exclude '.gitignore' "
  erSpiCmd=$erSpiCmd"--exclude '*.xcodeproj' "
  erSpiCmd=$erSpiCmd"--exclude 'openFrameworks-Info.plist' "
  erSpiCmd=$erSpiCmd"--exclude 'Project.xcconfig' "
  erSpiCmd=$erSpiCmd"--exclude '*.app' "
  erSpiCmd=$erSpiCmd"--exclude 'bin/data/AudioUnitPresets' "
  erSpiCmd=$erSpiCmd"--exclude 'bin/data/log' "
  erSpiCmd=$erSpiCmd"--exclude 'bin/data/test' "
  erSpiCmd=$erSpiCmd"--exclude '.DS_Store' "
  erSpiCmd=$erSpiCmd"--exclude 'obj' "
  erSpiCmd=$erSpiCmd"--exclude 'bin/emergencyroom' "
  erSpiCmd=$erSpiCmd"--exclude 'bin/readMe.txt' "
  erSpiCmd=$erSpiCmd"/Users/"$osxUser"/Working/projects/emergency-room/"$ofFolder"/apps/myApps/emergencyroom/ "
  erSpiCmd=$erSpiCmd$piUser"@"$ipMask$i":"
  erSpiCmd=$erSpiCmd"/home/"$piUser"/emergency-room/"$ofFolder"/apps/myApps/emergencyroom/ "
  erSpiCmd=$erSpiCmd"&& "
  erSpiCmd=$erSpiCmd"sshpass -p '"$sshPhrase"' "
  erSpiCmd=$erSpiCmd"rsync -avzh --delete "
  erSpiCmd=$erSpiCmd"--exclude '.DS_Store' "
  erSpiCmd=$erSpiCmd"/Users/"$osxUser"/Working/projects/emergency-room/er-media/ "
  erSpiCmd=$erSpiCmd$piUser"@"$ipMask$i":"
  erSpiCmd=$erSpiCmd"/home/"$piUser"/emergency-room/er-media/ "
  erSpiCmd=$erSpiCmd"&& "
  erSpiCmd=$erSpiCmd"echo '' "
  erSpiCmd=$erSpiCmd"&& "
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
  erCpiCmd=$erCpiCmd"echo 'Compiling Emergency Room on "$ipMask$i"...' "
  erCpiCmd=$erCpiCmd"&& "
  erCpiCmd=$erCpiCmd"curl http://"$ipMask$i":"$port"/compileOF "
  erCpiCmd=$erCpiCmd"&& "
  erCpiCmd=$erCpiCmd"echo '' "
  erCpiCmd=$erCpiCmd"&& "
  i=`expr $i + 1`
done

erCpiCmd=$erCpiCmd"echo 'Done.'"

eval "alias cpi=\""$erCpiCmd"\"" #echo "alias cpi=\""$erCpiCmd"\""


# ==============================================================================
# Command:    rpi
# Stands For: Restart all Pis
# Function:   Uses http command interface to instruct all pis to restart.
# ==============================================================================
i=1
erRpiCmd=""
while [ $i -le $numPis ]; do
  erRpiCmd=$erRpiCmd"echo 'Restarting "$ipMask$i"...' "
  erRpiCmd=$erRpiCmd"&& "
  erRpiCmd=$erRpiCmd"curl http://"$ipMask$i":"$port"/stopOF "
  erRpiCmd=$erRpiCmd"&& "
  erRpiCmd=$erRpiCmd"echo '' "
  erRpiCmd=$erRpiCmd"&& "
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
  erSshCmd="echo 'SSHing into "$ipMask$i"...' "
  erSshCmd=$erSshCmd"&& "
  erSshCmd=$erSshCmd"sshpass -p '"$sshPhrase"' "
  erSshCmd=$erSshCmd"ssh -o StrictHostKeyChecking=no "
  erSshCmd=$erSshCmd$piUser"@"$ipMask$i
  eval "alias ssh"$i"=\""$erSshCmd"\"" #echo "alias ssh"$i"=\""$erSshCmd"\""
  i=`expr $i + 1`
done