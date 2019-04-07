#!/bin/bash

OUT="index.html"

parse_body(){
	# echo "<section id=\"$ANCHOR\">" >> $OUT
	ANCHOR=$(cat $1 | grep "ANCHOR" | awk '{ print $2 }')
	TITLE=$(cat $1 | grep "TITLE" | awk '{ print $2 }')
	echo "<div class=\"content\" id=\"$ANCHOR\">" >> $OUT
	
	# echo "<a id=\"$ANCHOR\"></a>" >> $OUT
	
	echo "<h1>$TITLE</h1>" >> $OUT
	
	
	cat $1 | tail -n +4 >> $OUT
	echo "</div>" >> $OUT
	# echo "</section>" >> $OUT
}

add_whitespace(){
	# echo "<div class=\"content\"><div class=\"white_space\"></div></div>" >> $OUT
	echo "<div class=\"white_space\"></div>" >> $OUT
}


echo "<html>" > $OUT
cat html/head.html >> $OUT
echo "<body onload='\$(document).scrollTop(0)'>" >> $OUT
cat html/sidebar.html >> $OUT


parse_body html/about.markdown
add_whitespace

parse_body html/contact.markdown
add_whitespace

parse_body html/resume.markdown
add_whitespace
add_whitespace

parse_body html/project_dice.markdown
add_whitespace

parse_body html/project_pvrp.markdown
add_whitespace
add_whitespace




echo "</body>" >> $OUT
echo "</html>" >> $OUT


