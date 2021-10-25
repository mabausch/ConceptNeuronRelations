This repository contains code and data accompanying the following paper [(Bausch et al., 2021)](https://www.nature.com/articles/s41467-021-26327-3): 

### Concept neurons in the human medial temporal lobe flexibly represent abstract relations between concepts 

Marcel Bausch<sup>1</sup>, Johannes Niediek<sup>1</sup>, Thomas P. Reber<sup>1,2*</sup>, Sina Mackay<sup>1</sup>, Jan Boström<sup>3</sup>, Christian E. Elger<sup>1</sup>, Florian Mormann<sup>1</sup>

<sup>1</sup> Department of Epileptology, University of Bonn Medical Centre, Bonn, Germany

<sup>2</sup> Faculty of Psychology, UniDistance Suisse, Brig, Switzerland

<sup>3</sup> Department of Neurosurgery, University of Bonn Medical Centre, Bonn, Germany


If you have any questions, please contact <marcel.bausch.ukb@gmail.com>. All data files and code are in Matlab format.


### Code
We used Matlab R2016b with the statistics toolbox. To reproduce the figures in the manuscript, start matlab, navigate to the repository-folder and add it to the matlabpath:

```
cd('/Path/to/this/repo');
addpath(pwd);
```

Then call one of these scripts or functions: 

- `plot_figures.m`: gives an overview of all functions. Run each code block separately to reproduce the respective figure from the paper.
- `plot_*.m`: all functions with this prefix in plot_figures.m do the actual plotting.
- `create_*.m`: all functions with this prefix in plot_figures.m show how the statistics for the respective subfigure was computed.
