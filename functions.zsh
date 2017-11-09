create_alias () {
	if [ $testMode = true ]
	then
	  echo "alias "$1"=\""$2"\""
	  echo ""
	else
	  eval "alias "$1"=\""$2"\""
	fi
}