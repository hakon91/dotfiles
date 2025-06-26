#!/usr/bin/env bash

# This script is used to setup a new C++ project.
# It will create a CMakeLists file.
# It will add a .clang-format file.
# It will add a python script to format all files in the project.

# the following arguments are required:
# -n or --project-name 
# -l or --project-path


# Define the usage function
usage() {
  cat <<EOF
Usage: setup-project-cpp.sh [options]
Options:
  -n, --project-name <name>       The name of the project.
  -l, --project-location <path>   The location of the project.
EOF
    exit 1
    }

# Check if the number of arguments is correct
if [ $# -ne 4 ]; then
  usage
fi

# Define the command-line options
short_options="n:l:"
long_options="project-name:,project-location:"


# Parse the command-line options
PARSED=$(getopt --options=$short_options --longoptions=$long_options --name "$0" -- "$@")
if [ $? -ne 0 ]; then
  exit 1
fi

# Evaluate the command-line options
eval set -- "$PARSED"

# Parse the command-line arguments
while true; do
  case "$1" in
    -n|--project-name)
      project_name="$2"
      shift 2
      ;;
    -l|--project-location)
      project_location="$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
      usage
      ;;
  esac
done

# Define the root folder containing the language subfolders
top=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Files to copy to the new project folder
files_to_copy=(
  "CMakeLists.txt"
  ".clang-format"
  "format-files.py"
)

# Check if project folder already exists
if [ -d "$project_location/$project_name" ]; then
  echo "The project folder $project_location/$project_name already exists."
  echo "Aborting..."
  exit 1
fi

# Create the project folder
mkdir -p "$project_location/$project_name"

# Copy the files to the new project folder
for file in "${files_to_copy[@]}"; do
  cp "$top/$file" "$project_location/$project_name"
done

# Replace the keyword in the CMakeLists file
file_path="$project_location/$project_name/CMakeLists.txt"
replacement_string="$project_name"
keyword_to_replace="project-name-to-be-repalced"

echo "Replacing $keyword_to_replace with $replacement_string in $file_path"


sed -i '' "s/$keyword_to_replace/$replacement_string/g" "$file_path"

