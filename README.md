 **# README**

**This repository hosts a Bash script for displaying content within a visually appealing banner format in the terminal.**

## Installation from source

**1. Clone this repository:**

```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
```

**2. Navigate to the repository directory:**

```bash
cd <your-repo-name>
```

**3. Install

```bash
chmod +x ./install.sh && sudo ./install.sh
```

## Usage

**Run the script with the following options:**

```bash
slash [-c <content>]
```

**Available options:**

* **-t <text>:** Specific text on the header
* **-c <command>:** Specifies a command to run with the banner
* **--help:** Displays this help message.

**Examples:**

* To display a simple banner:

![carbon(2)](https://github.com/emiara/slash-command/assets/61361584/793493bd-96ed-4924-bedb-a05a7834fb0a)

* To display a banner and run assosiated command:

![carbon(3)](https://github.com/emiara/slash-command/assets/61361584/4e105e36-48fe-478d-9d4f-7b1eb2604a54)

## Additional Notes

* The script automatically adjusts the banner width to match the terminal window size.
* If no content is specified using the `-c` option, a simple line of equals signs will be displayed.

## Contributing

**Please feel free to contribute to this project!**

* Submit issues for any bugs or feature requests.
* Create pull requests to suggest code changes or improvements.

## License

**This project is licensed under the MIT License: [https://opensource.org/license/mit](https://opensource.org/license/mit).**
