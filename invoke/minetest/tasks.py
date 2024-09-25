from invoke import task
import os

@task
def debug(c):
    result = c.run('which minetest')
    print(result.ok)

@task
def install(c):
    print("Installing...")
    # result = c.run('which minetest')
    # if not(result.ok):
    c.run("sudo apt install flatpak")
    c.run("sudo apt install gnome-software-plugin-flatpak")
    c.run("flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")
    c.run("flatpak install flathub net.minetest.Minetest -y")
    result = c.run('which minetest')
    print(f"MineTest installed at {result.stdout}")
    print("To run: flatpak run net.minetest.Minetest")


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


