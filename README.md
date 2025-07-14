# Introdução à Modelagem Bayesiana de Ocupação com o pacote `spOccupancy` em R

**Dr. José Wagner Ribeiro Jr. (Xuleta)**  
Ecólogo Quantitativo | [WildMon](https://wildmon.ai)  

<img src="https://img.shields.io/badge/license-CC_BY_4.0-green" alt="License CC-BY 4.0">  
*Slides, código e dados para a aula no TEMABio sobre modelagem de ocupação com aplicações em bioacústica.*

---

## 📌 Sobre esta aula
Material adaptado do [tutorial original](https://github.com/eco4cast/Statistical-Methods-Seminar-Series/tree/main/doser-finley-spocc) de **Jeffrey Doser (Michigan State University)**, com:
- Foco em dados de **monitoramento acústico passivo**
- Exemplos reprodutíveis usando dados reais
- Implementação de modelos hierárquicos bayesianos

---

## 📦 Instalação
```r
# Pacote principal
install.packages("spOccupancy")

# Dependências para análise e visualização
install.packages(c("MCMCvis", "sf", "stars", "ggplot2", "cowplot"))
## 📚 Referências Bibliográficas
```

---

1. **Modelagem de Ocupação**  
   - Doser, J.W., Finley, A.O. (2022). [spOccupancy: An R package for single-species, multi-species, and integrated spatial occupancy models](https://doi.org/10.1111/2041-210X.13897). *Methods in Ecology and Evolution*, 13(8), 1670-1678.  
   - MacKenzie, D.I. et al. (2002). [Estimating site occupancy rates when detection probabilities are less than one](https://doi.org/10.1890/0012-9658(2002)083[2248:ESORWD]2.0.CO;2). *Ecology*, 83(8), 2248-2255.

2. **Bioacústica e Monitoramento**  
   - Ribeiro Jr., J.W. et al. (2018). [Effects of agriculture and topography on tropical amphibian species and communities](https://doi.org/10.1002/eap.1741). *Ecological Applications*, 28(6), 1554-1564.
   - Rhinehart, T.A. et al. (2022). [A continuous-score occupancy model that incorporates uncertain machine learning output from autonomous biodiversity surveys](https://doi.org/10.1111/2041-210X.13905). *Methods in Ecology and Evolution*, 13(8), 1778-1789.
   - Ribeiro Jr., J.W. et al. (2022). [Passive acoustic monitoring as a tool to investigate the spatial distribution of invasive alien species](https://doi.org/10.3390/rs14184565). *Remote Sensing*, 14(18), 4565.

3. **Pacotes R Relacionados**  
   - [`unmarked`](https://cran.r-project.org/web/packages/unmarked/index.html): Modelos de ocupação frequencistas  
   - [`ubms`](https://cran.r-project.org/web/packages/ubms/index.html): Versão Bayesiana do `unmarked`

4. **spOccupancy**  
   - Página do pacote [**spOccupancy**](https://www.jeffdoser.com/files/spoccupancy-web/):   
✔ **Modelos flexíveis**: single-species, multi-espécies e modelos integrados  
✔ **Correção espacial**: Processos Gaussianos e NNGP para grandes conjuntos de dados  
✔ **Detecção imperfeita**: Incorporação direta em modelos hierárquicos  
✔ **Vignettes detalhadas**: Desde conceitos básicos até modelos espaço-temporais avançados  


