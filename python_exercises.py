"""
COMP7044 — Systems Scripting in Cloud Computing
Python practice exercises with model answers.
Prepared as a self-study reference for systems-scripting practice.
"""

import os
import random


# ── Exercise: is_even ────────────────────────────────────────────────────
def is_even(number):
    return number % 2 == 0


# ── Exercise (Lab 07 Ex.5 style): guess the length of a word ───────────────
# Ask the user for a word/sentence under 20 characters. A function should
# try to guess its length, at most 12 attempts, using random.randint.
# On success, print the length and stop; after 12 failed tries, print a
# "no luck" message and stop.
def guess_length(text):
    if not 1 <= len(text) <= 20:
        raise ValueError("Text must contain between 1 and 20 characters.")
    actual = len(text)
    for attempt in range(12):
        guess = random.randint(1, 20)
        if guess == actual:
            print(f"Guessed it! Length is {guess}, took {attempt + 1} tries.")
            return
    print("No luck after 12 tries.")

# A `for` loop with a fixed range is the natural fit here since the attempt
# limit (12) is known in advance — no need for a `while` with a manual counter.


# ── Exercise (Lab 09 style): list files in a directory, write, then read ───
# List the contents of /etc/default into fileNames.txt (recreating the file
# if it exists), then read it back and print its contents one line at a time.
def list_dir_to_file():
    target = "/etc/default"

    if os.path.exists(target):
        if os.path.exists("fileNames.txt"):
            os.unlink("fileNames.txt")

        with open("fileNames.txt", "w") as f:
            for name in os.listdir(target):
                f.write(name + "\n")

        with open("fileNames.txt", "r") as f:
            for line in f:
                print(line.strip())
    else:
        print(f"{target} does not exist.")

# Two separate `with open(...)` blocks — one for writing, one for reading —
# keeps each file handle scoped to exactly what it's used for.


# ── Exercise (Lab 09 Ex.5 style): write then filter-read a text file ───────
# Function 1: given a filename, delete it if it exists, recreate it, and
# write a short multi-line text into it (typed by the user, ending when
# they type "end"). Function 2: read that file back and print only the
# lines starting with "When", "I", or "Hard".
def write_file(filename):
    if os.path.exists(filename):
        os.unlink(filename)
    with open(filename, "w") as f:
        while True:
            line = input("Enter a line ('end' to stop): ")
            if line == "end":
                break
            f.write(line + "\n")


def read_selected_lines(filename):
    with open(filename, "r") as f:
        for line in f:
            if line.startswith("When") or line.startswith("I") or line.startswith("Hard"):
                print(line.strip())

# str.startswith() checked with `or` across the three prefixes — matches
# the prefix-check pattern taught in Lecture 17.


###############################################################################
# Reference syntax used throughout the exercises above
###############################################################################

# --- File handling -----------------------------------------------------
# with open("data.txt", "r") as f:
#     content = f.read()                      # read the whole file
#
# with open("data.txt", "r") as f:
#     for line in f:
#         print(line.strip())                 # strip() removes the \n
#
# with open("output.txt", "w") as f:          # "w" overwrites
#     f.write("line 1\n")
#
# with open("log.txt", "a") as f:             # "a" appends
#     f.write("new event\n")
#
# `with open(...) as f:` closes the file automatically — this is the form
# instructors expect to see on an exam; avoid opening a file without `with`.


if __name__ == "__main__":
    print(is_even(4), is_even(7))

    word = input("Enter a word or sentence (1-20 characters): ")
    try:
        guess_length(word)
    except ValueError as error:
        print(error)

    name = input("Enter file name: ")
    write_file(name)
    read_selected_lines(name)
