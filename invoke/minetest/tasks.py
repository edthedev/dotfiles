from invoke import task
import os

@task
def debug(c):
    result = c.run('which minetest')
    print(result.ok)

@task
def install(c):
    result = c.run('which minetest')
    if not(result.ok):
        c.run("apt install minetest")
    else:
        print(f"MineTest installed at {result.stdout}")

@task
def restore(c, dir):
    if not os.path.isdir(dir):
        print(f"No backups found at {dir}")
        return
    print(f"Will restore MineTest backup from {dir}")
    home = os.path.expanduser('~')
    if os.path.isdir(f"{home}/.minetest") and not os.path.isdir("{home}/minetest"):
        print(f"Moving .minetest to minetest and linking.")
        c.run("mv ~/.minetest ~/minetest")
        c.run("ln -s ~/minetest ~/.minetest")
    world_folder = f"{home}/minetest/worlds"
    c.run(f"mkdir -p {world_folder}")
    c.run(f"mv {dir}/* {world_folder}")
    print("Finished")


