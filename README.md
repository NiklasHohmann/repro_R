# repro_R

Materials for workshop "Open and Reproducible Science in R and RStudio"

## Author

**Niklas Hohmann** Utrecht University\
email: n.h.hohmann [at] uu.nl\
Web page: [www.uu.nl/staff/NHohmann](https://www.uu.nl/staff/NHHohmann)\
ORCID: [0000-0003-1559-1838](https://orcid.org/0000-0003-1559-1838)

## Requirements

R version \>= 4.2 and the RStudio IDE

## Usage

Open the file "repro_R" in the Rstudio IDE. This will set all paths correctly, and install the `renv` package (if not already installed). Then, run

```{r}
renv::restore()
```

to install all packages in the correct version. A description of the workshop can be found under `workshop/`.

## License

Apache 2.0, see LICENCE file for full text

## Repository structure

-   example: folder containing initial example of dummy code and data for participants to work on
    -   data.csv: dummy data
    -   code.R: dummy code
    -   gen_data.R: code to generate dummy data (for reproducibility)
-   slides: workshop slides as .pdf
-   solution: one potential solution of how to make the example code open and reproducible. Standalone RProject
-   workshop: folder with workshop materials
    - description : file with brief description of workshop structure
    - key_points : key points covered in the workshop
-   renv: folder for `renv` package
-   renv.lock: lockfile for `renv` package
-   .gitignore: untracked files
-   LICENSE: Apache 2.0 license text
-   .Rprofile: R session settings
-   repro_R.Rproj: R project file

## Citation

To cite these materials, please use

* TBA
