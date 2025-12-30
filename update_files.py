import os
import argparse
from filecmp import dircmp


# Recursion hell
def list_files(path="."):  # path name is temporary
    def get_files(path):
        files = []
        directories = []
        with os.scandir(path) as scanned_directory:
            for entry in scanned_directory:
                if entry.is_dir() and entry.name != ".git":
                    directories.append(path + "/" + entry.name)
                else:
                    files.append(entry.name)
            scanned_directory.close()
        return {"path": path, "files": files, "directories": directories}

    def file_paths(path):
        files = get_files(path)
        paths = [files]
        # For a good file manager, you would want to use an enumeration on the
        # `for` loop, since that would prevent excess memory from being used.
        # In this case, since I know that the directory will eventually end, I'm
        # free to not do that.
        for directory in files["directories"]:
            new_path = file_paths(directory)
            paths += [new_path]
        return paths

    everything = []
    def make_readable(paths):
        for path in paths:
            if isinstance(path, dict):
                everything.append(path)
            else:
                make_readable(path)

    paths = file_paths(path)
    paths = make_readable(paths)
    return everything


def grab_files(files_here, files_there):
    # files_here = list_files(files_here)
    # files_there = list_files(files_there)
    return dircmp(files_here, files_there)

def build_system():
    ...

# list_files()
# files = list_files(".")
print(dircmp(".", "/etc/nixos/").common())
