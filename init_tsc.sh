#!/bin/bash

function usage() {
  echo "Usage: ${0} -d" >&2
  echo "Initialize simple typescript project" >&2
  echo "Example: ${0} -d project-dir" >&2
  echo "-h  Help" >&2
  exit 1
}

function try_execute_succesfully() {
  local COMMAND="${1}"
  eval "${COMMAND}"
  if [[ "${?}" -ne 0 ]]; then
    echo "Command failed: ${COMMAND} . Exiting..." >&2
    exit 1
  fi
}

while getopts d:h OPTION
do
  case ${OPTION} in
    d)
      DIRECTORY="${OPTARG}"
      ;;
    h|?)
      usage
      exit 1
      ;;
  esac
done

if [[ -z "${DIRECTORY+x}" ]]; then
  echo "-d param mandatory" >&2
  exit 1
fi

if [[ -d "${DIRECTORY}" ]]; then
  read -p "Directory ${DIRECTORY} exists. Would you like to remove it? Type yes or no: " IS_REMOVE
  if [[ "${IS_REMOVE}" == "yes" ]]; then
    try_execute_succesfully "rm -r ${DIRECTORY}"
    echo "Directory ${DIRECTORY} successfully removed"
  else
    exit 1
  fi
fi

echo "Creating directory ${DIRECTORY}"
try_execute_succesfully "mkdir ${DIRECTORY}"
cd "${DIRECTORY}"

try_execute_succesfully "npm i typescript --save-dev"
try_execute_succesfully "npx tsc --init"

# "strict": true,
cat > tsconfig.json << EOF 
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "outDir": "dist",
    "sourceMap": true,
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "allowSyntheticDefaultImports": true,
    "lib": [
      "es6"
    ],
    "incremental": true
  }
}
EOF

cd ../
SRC_PATH="${DIRECTORY}/src"
mkdir "${SRC_PATH}"
INDEX_PATH="${SRC_PATH}/index.ts"
touch "${INDEX_PATH}"
cat "${INDEX_PATH}" << EOF
  console.log('Hello world')
EOF

echo "Simple typescript project has been created. Compiling and watching for changes..."

cd "${DIRECTORY}"
code .
npx tsc -w