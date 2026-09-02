# COMP7044 Systems Scripting — Practice Exercises

A small collection of Bash and Python practice exercises prepared while
studying Systems Scripting in Cloud Computing at MTU.

These are self-study exercises with worked model answers, not a graded
submission. They demonstrate conditionals, loops, functions, process-management
commands, cron syntax, file handling, Python functions, `random`, and file I/O.

## Files

| File | Contents |
|---|---|
| `bash_exercises.sh` | Bash conditionals, loops, permissions, process-management commands, logging and reference syntax |
| `python_exercises.py` | `is_even`, a bounded random-guess exercise, directory listing, and write/filter-read exercises |

## Run

```bash
bash -n bash_exercises.sh
bash bash_exercises.sh

python -m py_compile python_exercises.py
python python_exercises.py
```

The Bash file is a learning reference and runs several harmless examples when
executed. The process-kill commands remain comments. The Python program is
interactive when run directly.
