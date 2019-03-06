#!/usr/bin/env python

#
# File: get_abrev.py
# Author: amort
#
# Description: Takes a file containing a list of command and finds the
#   minimum portion of the command that makes it unique. The command is
#   printed into a new file with brackets around the characters that no
#   longer are needed to differentiate the command.
#
#   Example:
#
#       Input:
#           alert
#           alter
#
#       Output:
#           ale[rt]
#           alt[er]
#

import sys
import datetime
import os
import re
import argparse

try:
    import pathlib
except ImportError:
    import pathlib2 as pathlib

def main():
    # Parse arguments to get paths
    path_input, path_output = parse_arguments()

    # Process data
    data = process_data(path_input)

    # Write output file
    write_output(path_output, data)

    print "Done."


# Parse input arguments
def parse_arguments():
    global verbose

    # Setup argument parser
    parser = argparse.ArgumentParser(description="" \
        "This program takes a file containing a list of command and finds" \
        " the minimum portion of the command that makes it unique. The"    \
        " command is printed into a new file with brackets around the"     \
        " characters that no longer are needed to differentiate the command.")
    parser.add_argument("input",  help="input file")
    parser.add_argument("-o", "--output", help="output file")
    parser.add_argument("-v", "--verbose", action="store_true")
    args = parser.parse_args()

    # Get arguments
    verbose           = args.verbose
    filename_input    = args.input
    filename_output   = args.output

    # Get pathlib object for input
    path_input = pathlib.Path(filename_input)

    if verbose:
        print("INFO: Input path " + str(path_input) + ".")

    # Get pathlib object for output
    if (filename_output):
        path_output = pathlib.Path(filename_output)
    else:
        # Path to output file with same name as input file in pwd
        path_output = pathlib.Path(path_input.name + "_out")

    if verbose:
        print("INFO: Output path " + str(path_output) + ".")

    return path_input, path_output

def process_data(input_path):
    global verbose

    if verbose:
        print "INFO: Opening input file " + str(input_path) + " for read ..."

    root = dict()

    # Open input file
    with open(str(input_path)) as in_file:
        # Assume each line is a command
        for line in in_file:
            line = line.strip()

            # Add command into tree
            add_item(root, line)

    # Create names with extra characters surrounded by []
    data = get_tree(root)
    data = "\n".join(data)

    return data

def add_item(root, line):
    # Return if line is empty
    if line == "":
        return

    if not line[0] in root:
        root[line[0]] = dict()

    # Add remainer of string to tree
    add_item(root[line[0]], line[1:])

def get_tree(root):
    ret = []
    for key in sorted(root.keys()):
        # Last character in word (full word is unique)
        if not root[key]:
            ret.append(key)

        # Partial word exists
        else:
            cur = get_tree(root[key])

            # Concat each word and key
            for word in cur:
                # Returned word was unique until this element
                if len(cur) == 1 and len(root.keys()) > 1:
                    word = "[" + word + "]"

                word = key + word
                ret.append(word)

    return ret

def write_output(output_path, data):
    if verbose:
        print "INFO: Opening output file " + str(output_path) + " for write ..."

    try:
        # Open output file now, so we know it is openable before doing work
        with open(str(output_path), 'w') as out_file:

            if verbose: 
                print "INFO: Writing data to file..."

            # Write data to file
            for line in data:
                out_file.write(line)

    except:
        if verbose:
            print "INFO: Deleting output file..."

        # Delete output file if it was created
        try:
            if os.path.isfile(str(output_path)):
                os.remove(str(output_path))
        except:
            pass

        # Raise error for failed output file creation
        raise

# Run program
if __name__ == "__main__":
  main()
