## System Password Policy Reference

| Category | Where Configured | Purpose / What It Controls | Example Settings |
|---------|-----------------|----------------------------|-----------------|
| **User Password Aging** | `chage` (`/etc/shadow`) | Set maximum/minimum password age, warning period before expiration | `-M 30 -m 1 -W 7` |
| **System-Wide Aging Defaults** | `/etc/login.defs` | Default password aging for new users | `PASS_MAX_DAYS 30`<br>`PASS_MIN_DAYS 1`<br>`PASS_WARN_AGE 7` |
| **Password Complexity Rules** | PAM (`pam_pwquality`) | Enforce length, digits, uppercase, lowercase, special characters | `minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1` |
| **Account Lockout** | PAM (`pam_faillock` / `pam_tally2`) | Lock accounts after repeated failed attempts | `deny=5 unlock_time=600 fail_interval=900` |

## PAM Password Policy Reference

| Parameter | Description | Notes / Usage |
|-----------|------------|---------------|
| `minlen=10` | Minimum number of characters required in the password | Ensures password is not too short |
| `ucredit=-1` | Requires at least one uppercase letter | Negative sign `-` = minimum; positive `+` = maximum |
| `dcredit=-1` | Requires at least one digit | Same logic as `ucredit` |
| `lcredit=-1` | Requires at least one lowercase letter | Ensures mixed-case passwords |
| `maxrepeat=3` | Prevents the same character from repeating more than 3 times consecutively | Helps avoid trivial patterns like `aaa` |
| `reject_username` | Prevents the password from containing the username | Adds protection against easy-to-guess passwords |
| `difok=7` | Requires at least 7 characters to differ from the previous password | Prevents minor variations of old passwords |
| `enforce_for_root` | Applies the password policy to the root account as well | Important for system security |

