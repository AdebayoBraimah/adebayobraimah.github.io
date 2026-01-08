#!/usr/bin/env bash

# TODO: 
#   - Move git submodule repo to main level

script_dir=$(realpath $(dirname "${0}"))
_cwd=$(pwd)

cd ${script_dir}

# Bibliography files
in_bib_file=${script_dir}/assets/pdf/Braimah-CV/BraimahCV.bib
out_bib_file=${script_dir}/_bibliography/papers.bib

# CV files
in_cv_file=${script_dir}/assets/pdf/Braimah-CV/BraimahCV.pdf
out_cv_file=${script_dir}/assets/pdf/cv_ab.pdf

# Update git submodules
# git submodule update --init --recursive      # Initializes, if not already done
git pull --recurse-submodules                # Pulls remote repo changes to local repo
git submodule update --remote --merge        # Any remote changes will now be merged with your local repo

# Git submodules
cd ${script_dir}/assets/pdf/Braimah-CV

# Update old files
cp ${in_bib_file} ${out_bib_file}
cp ${in_cv_file} ${out_cv_file}