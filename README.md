# R-script-to-compare-two-LDs
A simple R script to compare two LD plots and to find the optimal Kendall`s` tau arrow 

This pipeline is the part of bioengineering and bioinformatics faculty coursework

## Before you start

The full script is available only for <i>Linux</i> users </br>
Make sure that you have installed all components:
<ul>
<li>R and R-Studio with basic packages https://www.rstudio.com/
</ul>


## Getting started

### Installation

First of all you have to ```clone``` this directory</br></br>
```git clone https://github.com/Pavel-Kravchenko/R-script-to-compare-two-LDs/```</br></br>
Then ```cd``` in Evolution-of-mitochondrial-DNA-inheritance-patterns</br></br>
```cd R-script-to-compare-two-LDs```</br></br>
And ```tar``` Data.tar.gz</br></br>
```tar -xvf Data.tar.gz```</br></br>
Command ```ls -1``` and make sure that you have all files in your directory
```
Data.tar.gz
LD_Drosophila.txt
LD_Saccharomyces.txt
R_2_plots.R
README.md
script.sh

```
Now you are ready to start.
Command 
```bash script.sh``` and wait until the program is completed. 
You are expected to receive such demo result:

<img alt="LD" src="http://kodomo.fbb.msu.ru/~pavel-kravchenko/GitHub/Drosophila_Saccharomyces.png">


## Bonus
You may want to variate the length of the arrow used in Kendall`s` correlation test. You can easily do it just uncommitted suitable lines in the R script. 

## Contact me

Feel free to contact me for any suggestions or critique.

Email: pavel-kravchenk0@yandex.ru 

Site: http://kodomo.fbb.msu.ru/~pavel-kravchenko/index.html 
