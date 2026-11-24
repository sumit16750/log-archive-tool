# Log Archive Tool

A simple Bash-based CLI tool that archives logs by compressing them into a timestamped `.tar.gz` file and storing them in a dedicated archive directory.

This project was built as part of the roadmap.sh DevOps Projects collection.

## Project URL

https://roadmap.sh/projects/log-archive-tool

---

## Features

- Accepts a log directory as a command-line argument
- Creates compressed `.tar.gz` archives
- Adds timestamps to archive filenames
- Stores archives in a dedicated directory
- Logs archive operations with date and time
- Simple and lightweight Bash implementation
- Can be automated using Cron jobs

---

## Project Structure

```text
log-archive-tool/
│
├── log-archive.sh
├── archive.log
├── README.md
│
└── archives/
    └── logs_archive_YYYYMMDD_HHMMSS.tar.gz
```

---

## Prerequisites

- Linux/Unix-based Operating System
- Bash Shell
- tar utility

Verify:

```bash
bash --version
tar --version
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/sumit16750/log-archive-tool.git
```

Move into the project directory:

```bash
cd log-archive-tool
```

Make the script executable:

```bash
chmod +x log-archive.sh
```

---

## Usage

Run the script by passing a log directory:

```bash
./log-archive.sh /var/log
```

Example:

```bash
./log-archive.sh test-logs
```

---

## Example Output

```bash
Archive created: archives/logs_archive_20261125_005137.tar.gz
```

Archive directory:

```text
archives/
└── logs_archive_20261125_005137.tar.gz
```

Archive log entry:

```text
Wed Nov 25 00:51:37 IST 2026 : Archived test-logs into archives/logs_archive_20261125_005137.tar.gz
```

---

## Script Explanation

### Validate Input

Ensures exactly one argument is provided.

```bash
if [ $# -ne 1 ]
```

### Verify Directory

Checks whether the supplied directory exists.

```bash
if [ ! -d "$LOG_DIR" ]
```

### Create Archive Directory

Creates the archive directory if it doesn't already exist.

```bash
mkdir -p archives
```

### Generate Timestamp

Creates a unique timestamp.

```bash
date +"%Y%m%d_%H%M%S"
```

Example:

```text
20261125_005137
```

### Compress Logs

Creates a compressed archive.

```bash
tar -czf archive-name.tar.gz <directory>
```

Options:

- `-c` Create archive
- `-z` Compress using gzip
- `-f` Specify filename

### Log Archive Activity

Records archive activity in `archive.log`.

```bash
echo "$(date) : Archived..." >> archive.log
```

---

## Testing

Create sample logs:

```bash
mkdir test-logs

echo "Application Error" > test-logs/app.log
echo "Database Error" > test-logs/db.log
```

Run:

```bash
./log-archive.sh test-logs
```

Verify archive:

```bash
ls archives
```

Check archive contents:

```bash
tar -tzf archives/<archive-file>.tar.gz
```

---

## Cron Automation

Open crontab:

```bash
crontab -e
```

Run every day at 1:00 AM:

```cron
0 1 * * * /path/to/log-archive.sh /var/log
```

Verify:

```bash
crontab -l
```

---

## Future Improvements

- Delete archives older than 30 days
- Upload archives to AWS S3
- Send email notifications
- Store archives on a remote server
- Add archive size reporting
- Add configurable archive location

---

## Author

Sumit

DevOps Learning Project
