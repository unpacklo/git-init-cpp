#!/bin/bash
set -e
mkdir $1
cd $1

if [ ! -e main.cpp ]; then
    printf "#include <cstdio>\n\nint main(int argc, char* argv[])\n{\n  printf(\"Hello, World!\\\\n\");\n  return 0;\n}\n" > main.cpp
fi

if [ ! -e build.sh ]; then
    printf "#!/bin/bash\nclang++ main.cpp -O3 -g -o $1" > build.sh
    chmod +x build.sh
fi

git init
git add main.cpp build.sh
git commit -m "Initial commit for \"$1\""
