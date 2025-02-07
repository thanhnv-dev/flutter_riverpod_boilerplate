icons_svg_folder=lib/assets/icons/svg
icons_other_folder=lib/assets/icons/other
images_svg_folder=lib/assets/images/svg
images_other_folder=lib/assets/images/other

output_path=lib/core/constants/app_assets.dart

# Check if output directory exists, if not create it
output_dir=$(dirname "$output_path")
if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

# Check if output file exists, if not create it
if [ ! -f "$output_path" ]; then
    touch "$output_path"
fi

# clear old data.
>$output_path

function capitalize_first_letter() {
    local input=$1
    local first_letter=$(echo "${input:0:1}" | tr '[:lower:]' '[:upper:]')
    local rest_of_string="${input:1}"
    echo "$first_letter$rest_of_string"
}

function snake_to_camel() {
    local input=$1
    local output=""
    local capitalize_next=false

    for ((i = 0; i < ${#input}; i++)); do
        local char="${input:i:1}"
        if [[ "$char" == "_" ]]; then
            capitalize_next=true
        else
            if [[ $capitalize_next == true ]]; then
                output+=$(capitalize_first_letter "$char")
                capitalize_next=false
            else
                output+="$char"
            fi
        fi
    done

    echo "$output"
}

function generate_class() {
    input_path=$1
    class_name=$2

    if [ $# -ne 2 ]; then
        echo "Usage: $0 <input_path> <class_name>"
        exit 1
    fi

    if [ ! -d "$input_path" ]; then
        echo "Folder not found: $1"
        exit 1
    fi

    echo "class $class_name {" >>$output_path
    find "$input_path" -type f \( -name "*.svg" -o -name "*.png" -o -name "*.jpeg" \) -exec basename {} \; | while read -r file; do
        file_name="${file%.*}"
        camel_case_name=$(snake_to_camel "$file_name")
        echo "  static const String $camel_case_name = \"$input_path/$file\";" >>$output_path
    done
    echo "}" >>$output_path

    echo "$class_name class generated in $output_path"
}

generate_class $icons_svg_folder "AppSvgIcons"

generate_class $icons_other_folder "AppOtherIcons"

generate_class $images_svg_folder "AppSvgImages"

generate_class $images_other_folder "AppOtherImages"
