sync_er () {
  sourceLoc=$1
  destIp=$2
  destLoc=$3
  destUser=$4
  destPass=$5

  syncCmd=""

  syncCmd=$syncCmd"echo 'Syncing projects...' && "
  syncCmd=$syncCmd"echo '-------------------' && "
  syncCmd=$syncCmd"sshpass -p '"$destPass"' "
  syncCmd=$syncCmd"rsync -avzh --delete "
  syncCmd=$syncCmd"--exclude '.DS_Store' "
  syncCmd=$syncCmd"--exclude '.git' "
  syncCmd=$syncCmd"--exclude '.gitignore' "

  if [ $destUser = $piUser ]
  then
    #Don't send mac extras
    syncCmd=$syncCmd"--exclude 'emergencyroom/emergencyroom.xcodeproj' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/openFrameworks-Info.plist' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/Project.xcconfig' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/bin/emergencyroom' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/bin/*.app' "
    #Don't overwrite pi extras
    syncCmd=$syncCmd"--exclude 'emergencyroom/obj' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/bin/readMe.txt' "
    #Don't send server-specific content
    syncCmd=$syncCmd"--exclude 'emergencyroom/bin/data/AudioUnitPresets' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/bin/data/test' "
  else
    #Do send mac extras but leave user workspaces intact
    syncCmd=$syncCmd"--exclude 'emergencyroom/emergencyroom.xcodeproj/project.xcworkspace' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/emergencyroom.xcodeproj/xcuserdata' "
    syncCmd=$syncCmd"--exclude 'emergencyroom/bin/*.app' "
  fi

  syncCmd=$syncCmd"--exclude 'emergencyroom/bin/data/log' "
  syncCmd=$syncCmd$sourceLoc"/emergency-room/"$ofFolder"/apps/myApps/ "
  syncCmd=$syncCmd$destUser"@"$destIp":"
  syncCmd=$syncCmd$destLoc"/emergency-room/"$ofFolder"/apps/myApps/ "
  syncCmd=$syncCmd"&& echo '' && "

  syncCmd=$syncCmd"echo 'Syncing addons...' && "
  syncCmd=$syncCmd"echo '-----------------' && "
  syncCmd=$syncCmd"sshpass -p '"$destPass"' "
  syncCmd=$syncCmd"rsync -avzh --delete " #--delete-excluded
  syncCmd=$syncCmd"--exclude '.DS_Store' "
  syncCmd=$syncCmd"--exclude '.git' "
  syncCmd=$syncCmd"--exclude '.gitignore' "
  syncCmd=$syncCmd"--exclude 'obj' "
  syncCmd=$syncCmd$sourceLoc"/emergency-room/"$ofFolder"/addons/ "
  syncCmd=$syncCmd$destUser"@"$destIp":"
  syncCmd=$syncCmd$destLoc"/emergency-room/"$ofFolder"/addons/ "
  syncCmd=$syncCmd"&& echo '' && "

  syncCmd=$syncCmd"echo 'Syncing media...' && "
  syncCmd=$syncCmd"echo '----------------' && "
  syncCmd=$syncCmd"sshpass -p '"$destPass"' "
  syncCmd=$syncCmd"rsync -avzh --delete "
  syncCmd=$syncCmd"--exclude '.DS_Store' "
  syncCmd=$syncCmd$sourceLoc"/emergency-room/er-media/ "
  syncCmd=$syncCmd$destUser"@"$destIp":"
  syncCmd=$syncCmd$destLoc"/emergency-room/er-media/ "

  echo $syncCmd
}