# Erythrocyte Oxygen Metabolism
This package repository corresponds to our review paper titled "Erythrocyte metabolism", which has been published in *Acta Physiologica* (https://onlinelibrary.wiley.com/doi/10.1111/apha.14081). 
The package contains functions to model and simulate hemoglobin oxygen saturation, total blood oxygen capacity, and blood transit time in capillaries, based on mathematical models in the literature. 
A function to plot the hemoglobin oxygen dissociated curve was also created with additional features for customization. For more information on the physiology and metabolism of the erythrocyte please refer to the manuals and references.

## Features

- **Oxygen Dissociation Modeling**: Functions to calculate hemoglobin oxygen saturation based on Hill's model and Dash and colleagues. The model by Dash et al controls for allosteric factors such as pH, temperature, 2,3-bisphosphoglycerate and partial pressure of carbon dioxide.
- **Oxygen transport capacity**: Functions to calculate the total oxygen transport capacity in blood and free oxygen in blood.
- **Capillary transit time**: Function to calculate the erythrocyte capillary transit time.
- **Visualization**: Function to plot the oxygen dissociation curves and p50 in different conditions.

## Getting Started

### Prerequisites

- R (version 4.0 or higher)
- RStudio (optional)

### Installation

1. **Install `devtools` or `remotes`** (if not already installed):
   ```R
   install.packages("devtools") # or
   install.packages("remotes")
   ```

2. **Install the package from GitHub**:
   ```R
   devtools::install_github("PanosChatzi/erythrocyte-oxygen-metabolism")
   # or
   remotes::install_github("PanosChatzi/erythrocyte-oxygen-metabolism")
   ```

3. **Load the package**:
   ```R
   library(rbcOxy) # Replace with the actual package name if different
   ```

### Usage
## Example Oxygen Dissociation Curve Plot

You can generate the oxygen dissociation curve using the following function:

```R
plot_hill()
```

You can also include a second curve by using the argument *p50_post* an setting *add.second.curve* to *TRUE*, as well as add p50 as vertical lines, an arrow showing the direction of change, and text.

```R
plot_hill(p50_post = 30,
add.second.curve = TRUE,
add.std.p50 = TRUE,
add.new.p50 = TRUE,
add.arrow = TRUE,
add.text = TRUE)
```

## References
1) **Chatzinikolaou PN**, Margaritelis NV, Paschalis V, Theodorou AA, Vrabas IS, Kyparos A, D'Alessandro A, Nikolaidis MG. Erythrocyte metabolism. *Acta Physiol* (Oxf). 2024 Mar;240(3):e14081. doi: 10.1111/apha.14081. Epub 2024 Jan 25. PMID: 38270467.
2) Dash RK, Korman B, Bassingthwaighte JB. Simple accurate mathematical models of blood HbO2 and HbCO2 dissociation curves at varied physiological conditions: evaluation and comparison with other models. *Eur J Appl Physiol.* 2016 Jan;116(1):97-113. doi: 10.1007/s00421-015-3228-3. Epub 2015 Aug 23. PMID: 26298270; PMCID: PMC4699875.
3) Dash RK, Bassingthwaighte JB. Erratum to: Blood HbO2 and HbCO2 dissociation curves at varied O2, CO2, pH, 2,3-DPG and temperature levels. *Ann Biomed Eng.* 2010 Apr;38(4):1683-701. doi: 10.1007/s10439-010-9948-y. PMID: 20162361; PMCID: PMC2862600.
5) Richardson RS et al. Red blood cell transit time in man: theoretical effects of capillary density. *Adv Exp Med Biol.* 1994;361:521-32. doi: 10.1007/978-1-4615-1875-4_91. PMID: 7597979.
6) Richardson RS et al. High muscle blood flow in man: is maximal O2 extraction compromised? *J Appl Physiol* (1985). 1993 Oct;75(4):1911-6. doi: 10.1152/jappl.1993.75.4.1911. PMID: 8282650.
4) Dunn J-OC , Mythen MG, Grocott MP, Physiology of oxygen transport, *BJA Education*, Volume 16, Issue 10, 2016, Pages 341–348, https://doi.org/10.1093/bjaed/mkw012
5) Deranged Physiology website https://bit.ly/42kDXbm

## License

This project is licensed under the [MIT License](LICENSE).
