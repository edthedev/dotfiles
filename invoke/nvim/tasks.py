from invoke import task
import os

home = os.path.expanduser('~')
config_dir = f"{home}/AppData/Local/nvim"

@task
def status(c):
    result = c.run('powershell Get-Command nvim')
    print(f"Nvim installed? {result.ok}")

    print(f"Config dir is {config_dir}")
    c.run(f"powershell ls {config_dir}")
