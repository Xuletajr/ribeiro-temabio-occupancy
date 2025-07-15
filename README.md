# Introdução à Modelagem Bayesiana de Ocupação com o pacote `spOccupancy` em R

**Dr. José Wagner Ribeiro Jr. (Xuleta)**  
Ecólogo Quantitativo | [WildMon](https://wildmon.ai)  

<img src="https://img.shields.io/badge/license-CC_BY_4.0-green" alt="License CC-BY 4.0">  
*Slides, código e dados para a aula no TEMABio sobre modelagem de ocupação com aplicações em bioacústica.*

---

## 📌 Sobre esta apresentação
Esta apresentação foi desenvolvida para um minicurso introdutório de 1h30min sobre modelos de ocupação, com foco em aplicações ecológicas — especialmente no contexto de monitoramento acústico passivo. O conteúdo abrange os principais fundamentos teóricos da ecologia da ocupação, incluindo: definição de variáveis de estado, fontes de erro em dados ecológicos (variação espacial e detectabilidade), estrutura de modelos hierárquicos e suas suposições. Também é apresentada uma introdução aos modelos de ocupação de espécie única e aos modelos multiespécies, destacando sua utilidade para lidar com grandes volumes de dados, inclusive de espécies raras ou crípticas.

A parte prática da apresentação demonstrará o ajuste de um modelo de ocupação para uma espécie de sapo, utilizando dados reais de presença-ausência obtidos por meio de monitoramento acústico passivo. Os dados e scripts utilizados estarão disponíveis neste repositório para facilitar a reprodutibilidade e o treinamento de novos usuários.
  
O material de reprodução no R foi adaptado do [tutorial original](https://github.com/eco4cast/Statistical-Methods-Seminar-Series/tree/main/doser-finley-spocc) de **Jeffrey Doser (North Carolina State University)**

---

## 📦 Instalação
```r
# Pacote principal
install.packages("spOccupancy")

# Dependências para análise e visualização
install.packages(c("MCMCvis", "sf", "stars", "ggplot2", "cowplot"))
```

---

## 📚 Referências Bibliográficas

1. **Modelagem de Ocupação**  
   - Doser, J.W., Finley, A.O. (2022). [spOccupancy: An R package for single-species, multi-species, and integrated spatial occupancy models](https://doi.org/10.1111/2041-210X.13897). *Methods in Ecology and Evolution*, 13(8), 1670-1678.  
   - MacKenzie, D.I. et al. (2002). [Estimating site occupancy rates when detection probabilities are less than one](https://doi.org/10.1890/0012-9658(2002)083[2248:ESORWD]2.0.CO;2). *Ecology*, 83(8), 2248-2255.

2. **Monitoramento Acústico e Ocupação**  
   - Ribeiro Jr., J.W. et al. (2018). [Effects of agriculture and topography on tropical amphibian species and communities](https://doi.org/10.1002/eap.1741). *Ecological Applications*, 28(6), 1554-1564.
   - Rhinehart, T.A. et al. (2022). [A continuous-score occupancy model that incorporates uncertain machine learning output from autonomous biodiversity surveys](https://doi.org/10.1111/2041-210X.13905). *Methods in Ecology and Evolution*, 13(8), 1778-1789.
   - Ribeiro Jr., J.W. et al. (2022). [Passive acoustic monitoring as a tool to investigate the spatial distribution of invasive alien species](https://doi.org/10.3390/rs14184565). *Remote Sensing*, 14(18), 4565.

3. **spOccupancy**  
   - Página do pacote [**spOccupancy**](https://www.jeffdoser.com/files/spoccupancy-web/):   
✔ **Modelos flexíveis**: single-species, multi-espécies e modelos integrados  
✔ **Correção espacial**: Processos Gaussianos e NNGP para grandes conjuntos de dados  
✔ **Detecção imperfeita**: Incorporação direta em modelos hierárquicos  
✔ **Vignettes detalhadas**: Desde conceitos básicos até modelos espaço-temporais avançados  

4. **Pacotes R Relacionados**  
   - [`unmarked`](https://cran.r-project.org/web/packages/unmarked/index.html): Modelos de ocupação frequencistas  
   - [`ubms`](https://cran.r-project.org/web/packages/ubms/index.html): Versão Bayesiana do `unmarked`
