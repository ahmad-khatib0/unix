- Here's a handy cheat sheet of **Bash built-in variables** that are commonly used in 
  scripting and command-line operations. These variables are automatically set by the shell and 
  provide useful information about the environment, script execution, and more.

---

### **Bash Built-in Variables Cheat Sheet**

| **Variable**       | **Description**                                                                 |
|---------------------|---------------------------------------------------------------------------------|
| `$0`               | Name of the script or shell being executed.                                     |
| `$1`, `$2`, ..., `$9` | Positional parameters (arguments passed to the script or function).             |
| `$#`               | Number of positional parameters (arguments) passed to the script or function.   |
| `$@`               | All positional parameters as a list (preserves spacing).                        |
| `$*`               | All positional parameters as a single string (words are joined with spaces).    |
| `$?`               | Exit status of the last executed command (0 = success, non-zero = failure).     |
| `$$`               | Process ID (PID) of the current shell or script.                                |
| `$!`               | Process ID (PID) of the last background command.                                |
| `$_`               | Last argument of the previous command.                                         |
| `$IFS`             | Internal Field Separator (default is space, tab, and newline).                 |
| `$HOME`            | Home directory of the current user.                                            |
| `$PWD`             | Current working directory.                                                     |
| `$OLDPWD`          | Previous working directory (before the last `cd` command).                      |
| `$USER`            | Username of the current user.                                                  |
| `$UID`             | User ID of the current user.                                                   |
| `$GROUPS`          | Array of group IDs the current user belongs to.                                |
| `$HOSTNAME`        | Hostname of the machine.                                                       |
| `$HOSTTYPE`        | Type of the system's hardware (e.g., `x86_64`).                                |
| `$OSTYPE`          | Operating system type (e.g., `linux-gnu`).                                     |
| `$PATH`            | Colon-separated list of directories to search for executables.                |
| `$PS1`             | Primary prompt string (e.g., `\u@\h:\w\$`).                                   |
| `$PS2`             | Secondary prompt string (used for multi-line commands).                        |
| `$BASH`            | Path to the Bash binary.                                                       |
| `$BASH_VERSION`    | Version of the Bash shell.                                                     |
| `$SECONDS`         | Number of seconds since the script or shell started.                           |
| `$RANDOM`          | Generates a random integer between 0 and 32767.                                |
| `$LINENO`          | Current line number in the script.                                             |
| `$FUNCNAME`        | Name of the current function (if inside a function).                           |
| `$SHLVL`           | Shell nesting level (incremented for each new shell instance).                 |
| `$REPLY`           | Default variable for `read` when no variable is specified.                     |
| `$TMOUT`           | Timeout for input (in seconds). If set, the shell exits after inactivity.      |

---

### **Special Variables for Arrays**
| **Variable**       | **Description**                                                                 |
|---------------------|---------------------------------------------------------------------------------|
| `${array[@]}`      | All elements of the array.                                                     |
| `${array[*]}`      | All elements of the array as a single string.                                  |
| `${#array[@]}`     | Number of elements in the array.                                               |
| `${!array[@]}`     | List of all array indices (keys).                                              |

---

### **Special Variables for Strings**
| **Variable**       | **Description**                                                                 |
|---------------------|---------------------------------------------------------------------------------|
| `${#var}`          | Length of the string stored in `$var`.                                         |
| `${var:position}`  | Substring of `$var` starting at `position`.                                    |
| `${var:position:length}` | Substring of `$var` starting at `position` with `length` characters.       |
| `${var#pattern}`   | Remove the shortest match of `pattern` from the beginning of `$var`.           |
| `${var##pattern}`  | Remove the longest match of `pattern` from the beginning of `$var`.            |
| `${var%pattern}`   | Remove the shortest match of `pattern` from the end of `$var`.                 |
| `${var%%pattern}`  | Remove the longest match of `pattern` from the end of `$var`.                  |
| `${var/old/new}`   | Replace the first occurrence of `old` with `new` in `$var`.                    |
| `${var//old/new}`  | Replace all occurrences of `old` with `new` in `$var`.                         |

---

### **Special Variables for File Paths**
| **Variable**       | **Description**                                                                 |
|---------------------|---------------------------------------------------------------------------------|
| `${0##*/}`         | Basename of the script (removes directory path).                                |
| `${0%/*}`          | Directory path of the script (removes basename).                               |
| `${file%.*}`       | Filename without the extension.                                                |
| `${file##*.}`      | File extension only.                                                           |

---

### **Example Usage**
```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Number of arguments: $#"
echo "All arguments: $@"
echo "Last command exit status: $?"
echo "Current PID: $$"
echo "Home directory: $HOME"
echo "Random number: $RANDOM"
echo "Current line number: $LINENO"
```

---

Let me know if you'd like further clarification or examples! 😊
