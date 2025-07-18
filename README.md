# Introdução à Modelagem Bayesiana de Ocupação com o pacote `spOccupancy` em R

**Dr. José Wagner Ribeiro Jr. (Xuleta)**  
Ecólogo Quantitativo | [WildMon](https://wildmon.ai)  

<img src="https://img.shields.io/badge/license-CC_BY_SA_4.0-green" alt="License CC-BY-SA 4.0">
*Slides, código e dados para a aula no TEMABio sobre modelagem de ocupação com aplicações em bioacústica.*

---

## 📌 Sobre esta apresentação
Material desenvolvido para uma palestra introdutória de 1h30 sobre modelos de ocupação, com foco em aplicações ecológicas - especialmente no contexto de monitoramento acústico passivo. O conteúdo aborda:

- Fundamentos teóricos da ecologia da ocupação
- Definição de variáveis de estado
- Fontes de erro em dados ecológicos (variação espacial e detectabilidade)
- Estrutura de modelos hierárquicos e suas suposições
- Modelos de ocupação para espécie única e multiespécies

A parte prática demonstra o ajuste de um modelo de ocupação para *Vitreorana uranoscopa* usando dados reais de monitoramento acústico.
  
O material de reprodução no R foi adaptado do [tutorial original](https://github.com/eco4cast/Statistical-Methods-Seminar-Series/tree/main/doser-finley-spocc) de **Jeffrey Doser (North Carolina State University)**

---

## 📦 Estrutura do repositório

### 📂 data/
- `Vitreorana_Ribeiro2018EcoApps.rda`: Dados de detecção/não-detecção de *Vitreorana uranoscopa* (perereca-de-vidro) obtidos por monitoramento acústico passivo (Song Meter 3) em 50 riachos da Mata Atlântica (2015-2016), na região na bacia do Alto Paranapanema, São Paulo, Brasil. Dados formatados para `spOccupancy`. Dados provenientes de Ribeiro et al. (2018; Efeitos da agricultura e topografia em espécies e comunidades de anfíbios tropicais. Ecological Applications, 28(6), 1554-1564). O conjunto completo de dados utilizou dados de detecção e não detecção de unidades autônomas de registro acústico (Song Meter 3) e levantamentos humanos por meio de Amostragem Acústica e Visual de Transectos, e aqui usaremos apenas os dados de monitoramento acústico autônomo. O monitoramento acústico passivo foi conduzido entre outubro de 2015 e março de 2016 em 50 riachos. O objeto contém os dados do estudo formatados para uso em *spOccupancy*

### 📂 script/
- `occupancy_single_species_Vitreorana.R`: Ajusta modelos não-espaciais e espaciais para avaliar como a ocupação da perereca-de-vidro com características da paisagem.

---

## ⚙️ Instalação
```r
# Pacote principal
install.packages("spOccupancy")

# Dependências para análise e visualização
install.packages(c("MCMCvis", "sf", "stars", "ggplot2", "cowplot"))
```

---

## 📚 Referências Bibliográficas

1. **Modelagem de Ocupação**  
   - MacKenzie, D.I. et al. (2002). [Estimating site occupancy rates when detection probabilities are less than one](https://doi.org/10.1890/0012-9658(2002)083[2248:ESORWD]2.0.CO;2). *Ecology*, 83(8), 2248-2255.
   - MacKenzie, D.I., Royle J.A. (2005). [Designing occupancy studies: general advice and allocating survey effort](https://doi.org/10.1111/j.1365-2664.2005.01098.x)). *Journal of Applied Ecology*, 42(6), 1105-1114.
   - Iknayan, K. J. et al. (2014). [Detecting diversity: emerging methods to estimate species diversity](https://www.cell.com/trends/ecology-evolution/abstract/S0169-5347(13)00261-9?script=true). *Trends in Ecology & Evolution
*, 29(2), 97-106. 
   - Doser, J.W., Finley, A.O. (2022). [spOccupancy: An R package for single-species, multi-species, and integrated spatial occupancy models](https://doi.org/10.1111/2041-210X.13897). *Methods in Ecology and Evolution*, 13(8), 1670-1678.

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
