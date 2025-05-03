# hsfetch 
[haskell-shield]: https://img.shields.io/badge/Haskell-5e5086?style=for-the-badge&logo=haskell&logoColor=white
[haskell-url]: https://www.haskell.org/

[![Haskell][haskell-shield]][haskell-url]
![GitHub repo size](https://img.shields.io/github/repo-size/NaGNU/rfetch?style=for-the-badge)
![GitHub Release](https://img.shields.io/github/v/release/NaGNU/rfetch?include_prereleases&sort=date&display_name=release&style=for-the-badge)

hsfetch is a lightweight and minimal system information fetch script for the terminal. It displays system details such as OS, kernel, uptime, packages, CPU, memory usage, and more. The goal is to keep it simple, fast, and easily customizable.

Use: To run hsfetch, simply execute hsfetch in your terminal.
You can place the script anywhere in your PATH for convenience.
Example:
sudo install -m755 hsfetch /usr/local/bin/hsfetch

How to build: rfetch is a shell script and does not require building.
If you are modifying it, clone the repository:
``` Bash
git clone https://github.com/NaGNU/hsfetch.git
cd hsfetch
make install
# Make your changes, test by running ./rfetch, and optionally install it with:
sudo install -m755 hsfetch /usr/local/bin/hsfetch
```

Contributing: Contributions are welcome.

    Please open an issue before submitting large changes.
    Follow the minimalistic and clean coding style.
    Avoid adding heavy dependencies or unnecessary features.
    Pull requests should include a clear description of changes.

License: hsfetch is licensed under the GPLv3 License.

Disclaimer: This software is provided "as is", without warranty of any kind.
The author is not responsible for any damage, loss, or issues caused by using this software.
By using rfetch, you agree to use it at your own risk.

