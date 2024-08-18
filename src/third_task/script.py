import os
import tarfile

etc_dir = "/etc"
backup_dir = "/etc/bkp"

os.makedirs(backup_dir, exist_ok=True)

for item in os.listdir(etc_dir):
    full_path = os.path.join(etc_dir, item)

    if os.path.isdir(full_path) and item.startswith("cron"):
        archive_path = os.path.join(backup_dir, f"{item}.tar.gz")
        with tarfile.open(archive_path, "w:gz") as tar:
            tar.add(full_path, arcname=item)
