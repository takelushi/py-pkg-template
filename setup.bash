#!/usr/bin/bash

# echo 'Package Name:'
# read project_name

if [ $1 = 'pyproject' ] ; then
    echo 'Create pyproject.toml'
    rm -f pyproject.toml
    cp pyproject.example.toml pyproject.toml
    echo 'Update pyproject.toml: "vi pyproject.toml".'
    echo '[tool.poetry]'
    echo '[tool.poetry.dependencies]'
    echo '[tool.poetry.urls]'
elif [ $1 = 'name' ] ; then
    echo 'Set project name.'
    echo 'Project Name:'
    read project_name
    package_name=$(echo ${project_name} | sed 's/-/_/g')
    echo "Package name: ${package_name}"
    sed -i "s/\"pkg-name\"/\"${project_name}\"/g" pyproject.toml
    sed -i "s/\"pkg_name\"/\"${package_name}\"/g" pyproject.toml
    sed -i "s/= pkg_name/= ${package_name}/g" .flake8
    mv './src/pkg_name' "./src/${package_name}"
    mv './tests/pkg_name' "./tests/${package_name}"
elif [ $1 = 'package' ] ; then
    poetry install
    echo 'Install packages'
    echo 'Install development requirements'
    poetry add --dev $(cat dev-requirements.txt | grep -E '^[^# ]' | cut -d= -f1 | tr '\n' ' ')
    # cat dev-requirements.txt | grep -E '^[^# ]' | cut -d= -f1 | xargs -n 1 poetry add --dev

    echo 'Install requirements'
    poetry add --dev $(cat requirements.txt | grep -E '^[^# ]' | cut -d= -f1 | tr '\n' ' ')
    # dev-requirements.txt | grep -E '^[^# ]' | cut -d= -f1 | xargs -n 1 poetry add --dev

elif [ $1 = 'clean' ] ; then
    echo 'Remove all files...'
    # rm pyproject.example.toml
    # rm dev-requirements.txt
    # rm requirements.txt
    echo 'Finally execute "rm setup.bash".'
else
    echo "Unknown subcommand. '${1}'"
    exit 1
fi

exit 0





