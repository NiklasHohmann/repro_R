# repro_R

Materials for workshop "Open and Reproducible Science in R and RStudio"

## Author

__Niklas Hohmann__
Utrecht University  
email: n.h.hohmann [at] uu.nl  
Web page: [www.uu.nl/staff/NHohmann](https://www.uu.nl/staff/NHHohmann)  
ORCID: [0000-0003-1559-1838](https://orcid.org/0000-0003-1559-1838)

## Usage

Open the file "solution.Rproj" in the RStudio IDE. This will open the project, set all paths correctly, and install the `renv` package (if not already installed).
Then, run

```{r}
renv::restore()
```

to install all required packages in their correct versions. Now you can interact with the code. To run the analysis, run

```{r}
source("code/analysis.r")
```

in the console. This will save bootstrap results in the file `data/bootstrap.RData`. To generate the figures, run

```{r}
source("code/make_figs.r")
```

after running the analyses. This will generate all figures and store them under `figs/`.

## License

Apache 2.0, see LICENCE file for full text

## Repository structure

* example: folder containing initial example of dummy code and data for participants to work on
  * data.csv: dummy data
  * code.R: dummy code
  * gen_data.R: code to generate dummy data (for reproducibility)
