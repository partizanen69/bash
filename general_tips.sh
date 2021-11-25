######################### Getting script arguments #########################
${0} - script being launched
${#} - number of parameters passed
${@} - list of all parameters passed which you can loop through
${1}, ${2}, ... - parameters passed one by one

# Remove the options while leaving the remaining arguments.
shift "$(( OPTIND - 1 ))"
if [[ "${#}" -lt 1 ]] # no arguments except options were supplied



## example usage function
usage() {
  # Display the usage and exit.
  echo "Usage: ${0} [-nsv] [-f FILE] COMMAND" >&2
  echo 'Executes COMMAND as a single command on every server.' >&2
  echo "  -f FILE  Use FILE for the list of servers. Default: ${SERVER_LIST}." >&2
  echo '  -n       Dry run mode. Display the COMMAND that would have been executed and exit.' >&2
  echo '  -s       Execute the COMMAND using sudo on the remote server.' >&2
  echo '  -v       Verbose mode. Displays the server name before executing COMMAND.' >&2
  exit 1
}

## simple case example
case "${1}" in
  start) echo 'Starting.' ;;
  stop) echo 'Stopping.' ;;
  status) echo 'Status:' ;;
  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

## parsing options provided while file launched
while getopts f:nsv OPTION
do
  case ${OPTION} in
    f) SERVER_LIST="${OPTARG}" ;;
    n) DRY_RUN='true' ;;
    s) SUDO='sudo' ;;
    v) VERBOSE='true' ;;
    h|?) usage ;;
  esac
done

######################### If conditions #########################
## string comparison
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]

## check if last command executed successfully
type curl &> /dev/null
if [[ "${?}" -ne 0 ]]; then

## check if run with root privileges
if [[ "${UID}" -ne 0 ]]

## check if variable is set
if [[ -z "${BRANCH_NAME+x}" ]]; then
  # BRANCH_NAME is not set

## check variable against regular expression
re="^[0-9]+$"
if [[ "${REQ_TIMEOUT}" =~ $re ]]; then
  # it complies with re

## check if number of supplied args is less then one
if [[ "${#}" -lt 1 ]]

## check if directory exists
if [[ ! -d "${ARCHIVE_DIR}" ]]

## check if file exists
if [[ ! -e "${SERVER_LIST}" ]]
  # file does not exist

######################### awk example usage #########################
## show open ports on the machine
netstat -nutl ${1} | grep : | awk '{print $4}' | awk -F':' '{print $NF}'

## parse log file
grep Failed ${LOG_FILE} | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr |  while read COUNT IP
do
  if [[ "${COUNT}" -gt "${LIMIT}" ]]
  then
    LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
    echo "${COUNT},${IP},${LOCATION}"
  fi
done

## cut example usage
cut -d '"' -f 2 ${LOG_FILE} | cut -d ' ' -f 2 | sort | uniq -c | sort -n | tail -3

######################### Operations with file descriptors #########################
# Redirect STDOUT to a file.
FILE="/tmp/data" && head -n1 /etc/passwd > ${FILE}

# Redirect STDIN to a program.
read LINE < ${FILE} && echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file, overwriting the file.
head -n3 /etc/passwd > ${FILE}

# Redirect STDOUT to a file, appending to the file.
echo "${RANDOM} ${RANDOM}" >> ${FILE}

# Redirect STDIN to a program, using FD 0.
read LINE 0< ${FILE} && echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file using FD 1, overwriting the file.
head -n3 /etc/passwd 1> ${FILE}

# Redirect STDERR to a file using FD 2.
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

# Redirect STDOUT and STDERR to a file.
head -n3 /etc/passwd /fakefile &> ${FILE}

# Redirect STDOUT and STDERR through a pipe.
head -n3 /etc/passwd /fakefile |& cat -n

# Send output to STDERR
echo "This is STDERR!" >&2

# Discard STDOUT
head -n3 /etc/passwd /fakefile > /dev/null

# Discard STDERR
head -n3 /etc/passwd /fakefile 2> /dev/null

# Discard STDOUT and STDERR
head -n3 /etc/passwd /fakefile &> /dev/null

######################### Miscelaneous #########################
## for loop example
PORTS="
  24038
  24039
  24040
"
for PORT in ${PORTS}
do 
  # do something
done

## execute multiline script on remote server
ssh "${LOGIN}"@remote.server.com << EOF
  echo
  chmod 755 ./deploy-dev-remote.sh
  echo "Removing old ./deploy directory if any"
  rm -r ./deploy &> /dev/null
  echo "Creating new empty ./deploy directory"
  mkdir ./deploy
EOF

## run script on remote machine with sudo
ssh -t "${LOGIN}"@remote.server.com "sudo ./deploy-dev-remote.sh ${LOGIN} ${IS_RESTART} ${BRANCH_NAME}"

## read prompt input into variable
read -p "Do you want to update containers and restart services after files are copied? (type yes/no): " IS_RESTART

## example of adding new user to the system
main() {
  if [[ "${UID}" -ne 0 ]]; then
    echo "Can be run only by root user"
    return
  fi

  read -p "Enter the username to create: " USER_NAME
  read -p "Enter comment: " COMMENT
  read -p "Enter the password: " PASS

  echo "You entered username ${USER_NAME}; comment ${COMMENT}; password ${PASS}"

  useradd -c "${COMMENT}" -m "${USER_NAME}"
  echo ${PASS} | passwd --stdin "${USER_NAME}"

  # force password change on first login
  passwd -e ${USER_NAME}
}

## strong password generation
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"