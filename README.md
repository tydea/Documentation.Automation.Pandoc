# Documentation.Automation.Pandoc

Convert Markdown to PDF documentation.

## Getting Started

### Prerequisites

Check out https://pandoc.org/installing.html.

### Preparing

Clone or download the current repository to your preferred location.

### Installing

If you have not installed chocolatey on your windows host, please refer to https://chocolatey.org/install.

Check out https://pandoc.org/installing.html.

Hint for avoiding problems with MikTex: Run MikTex Console (as administrator), switch du administrator mode and check updates.

## Running

### Markdown to PDF

Switch to the location of the cloned or copied repository:

```
cd yourLocalRepositoryPath
```

Execute the following command on the Command Prompt (as administrator):

```
powershell.exe -ExecutionPolicy bypass -File "markdownToPdf.ps1"
```

## Authors

- [Thierry Iseli](https://github.com/thierryiseli) - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Built With

- [Pandoc](https://pandoc.org/)
- [Eisvogel Template](https://github.com/Wandmalfarbe/pandoc-latex-template)
