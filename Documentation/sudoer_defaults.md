# Sudo `Defaults` Configuration Reference

This document provides a concise and structured overview of commonly used `Defaults` directives for customizing sudo behavior. These options can be applied in `/etc/sudoers` or within drop-in files under `/etc/sudoers.d/`, and should always be edited via `visudo` to ensure syntax validation.

---

## 1. Authentication Controls
- `passwd_tries=NUM` — Defines the number of permitted password attempts.  
- `badpass_message="text"` — Custom message displayed after an incorrect password.  
- `passwd_timeout=MIN` — Duration for which authentication credentials remain cached.  
- `timestamp_timeout=MIN` — Time interval before re-authentication is required.  
- `authenticate` / `!authenticate` — Enables or disables password authentication.  
- `rootpw` — Requires root’s password for sudo authentication.  
- `targetpw` — Requires the password of the target user specified with `-u`.  
- `runaspw` — Prompts for the password of the user specified with `-u`.

---

## 2. Logging and Auditing
- `logfile="/path/file"` — Writes sudo logs to a specified file.  
- `loglinelen=NUM` — Maximum character length before log lines wrap.  
- `syslog=facility` — Selects the syslog facility (e.g., `auth`, `local0`).  
- `syslog_goodpri=priority` — Priority for logging successful commands.  
- `syslog_badpri=priority` — Priority for logging failed attempts.  
- `log_input` / `log_output` — Captures full terminal input and/or output.  
- `iolog_dir=/path` — Directory where I/O logs are stored.

---

## 3. Environment Handling
- `env_reset` — Resets the environment to a minimal default set.  
- `env_keep="VAR …"` — Allows specified environment variables to be preserved.  
- `env_check="VAR …"` — Environment variables that must pass safety checks.  
- `secure_path="/bin:/usr/bin:..."` — Overrides the `PATH` used for sudo commands.

---

## 4. Command Execution Behavior
- `lecture` — Controls the sudo introductory message (`never`, `once`, `always`).  
- `umask=MASK` — Enforces a specific file creation mask.  
- `requiretty` — Restricts sudo usage to interactive terminals.  
- `insults` — Displays humorous feedback on failed authentication attempts.  
- `fast_glob` — Enables faster wildcard expansion.  
- `set_home` — Sets `HOME` to the target user’s home directory.  
- `always_set_home` — Overrides `HOME` for all sudo-executed commands.

---

## 5. Security Enforcement
- `noexec` — Prevents executed commands from spawning child processes.  
- `ignore_dot` — Ignores the `.` directory entry in the `PATH` for safety.  
- `visiblepw` — Permits password entry when terminal echo cannot be disabled (not recommended).  
- `closefrom=NUM` — Closes all file descriptors with a number equal or higher than `NUM`.  
- `ignore_requiretty` — Overrides the `requiretty` restriction.

---

## 6. User Interface and Editor Settings
- `editor="/usr/bin/vim"` — Defines the default editor for `sudo -e`.  
- `askpass=/path/app` — Specifies a helper program for password prompts in GUI contexts.  
- `pwfeedback` — Displays visual feedback (e.g., asterisks) while typing passwords (Debian-specific).

---
