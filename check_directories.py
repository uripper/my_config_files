import platform as pl
from pathlib import Path
import contextlib

os_name = pl.system()
WINDOWS = os_name == "Windows"
LINUX = os_name == "Linux"
CWD = Path.cwd()
HOME = Path()

if LINUX:
    HOME = Path("/home/").expanduser()


if WINDOWS:
    HOME = Path("C:/Users/")
for num, file in enumerate(HOME.iterdir()):
    print(num, file.name)
user_num = int(input("Enter user number: "))
home_list = list(HOME.iterdir())
HOME = home_list[user_num]

print(HOME)
names_to_check = [
    ".zshrc",
    ".config/kak/kakrc",
    ".zsh/aliases.zsh",
    ".zsh/evals.zsh",
    ".zsh/exports.zsh",
    ".alacritty.yml",
]

with contextlib.suppress(FileNotFoundError):
    for file in names_to_check:
        current_file = HOME / file
        if current_file.exists():
            current_file.unlink()
            print(f"{current_file} deleted")
        else:
            print(f"{current_file} does not exist")
    zsh_config = CWD / ".zshrc"
    zsh_target = HOME / ".zshrc"
    kak_config = CWD / ".kakrc"
    kak_target = HOME / ".config/kak/kakrc"
    antigen_config = CWD / ".antigen.zsh"
    antigen_target = HOME / ".antigen.zsh"
    zsh_dir = CWD / ".zsh"
    zsh_new_dir = HOME / ".zsh"
    zsh_new_dir.mkdir(exist_ok=True)

    zsh_target.symlink_to(zsh_config)
    kak_target.symlink_to(kak_config)
    with contextlib.suppress(FileExistsError):
        antigen_target.symlink_to(antigen_config)
    for file in zsh_dir.iterdir():
        zsh_dir_file = zsh_dir / file.name
        working_file = HOME / ".zsh" / file.name
        working_file.symlink_to(zsh_dir_file)
