#!/usr/bin/bash
GLSLC=$1/x86_64/bin/glslc
if [$1 == ""]; then
	echo "vulkansdk path not provided, provide as absolute argument to script"
fi
echo $GLSLC
for FOLDER in $(ls ../shaders)
do
	for SHADER in $(ls ../shaders/$FOLDER)
	do
		$GLSLC ../shaders/$FOLDER/$SHADER -o ../shaders/$FOLDER/$SHADER.spv
	done
done
