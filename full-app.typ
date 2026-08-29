#import "@preview/meander:0.4.2"

#set page(paper:"us-letter", margin:1in,
  numbering: "1"
)
//double spacing
#set text(12pt, font: "Liberation Serif", top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: 2em)
#show heading.where(level: 2): set text(12pt, weight: "bold")
#show heading.where(level: 3): it=>{
  set text(12pt, weight: "regular")
  underline(emph(it))
} 

#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: c=> [
  #set text(8pt)
  #set align(left)
  #set par(leading: 0.2em)

  #text(weight: "bold", font: "Noto Serif")[
    #smallcaps[
      #c.supplement #c.counter.display(c.numbering)
    ]
  ]
  #c.separator#c.body
]
#set figure(gap: 0.2em)
#show image: it=>{
  block(stroke: 0.5pt+gray, inset:2pt, it)
}

#meander.reflow({
  import meander: *

  placed(bottom + right,
    box(width: 39%)[
      #figure(image("assets/press_schema.svg"),
        caption: [
          Schematic of diet- and mucin- derived glycans available to feed the microbiome
          in breastfed infants.
          The press perturbation is primarily defined by the shift from dietary HMO
          from breastmilk to plant-derived fiber.
          Mucin composition and abundance also changes, but this change is less dramatic.
        ]
      )<fig-milkprepost>
    ]
  )

  container()

  content[
    == Background and significance
    
The gut microbiome assembles over the first years of life
through a chaotic but predictable ecological succession.
Pioneer colonizers arrive at birth,
expand under the selective pressure of a liquid diet (milk or formula),
and are progressively replaced by a more diverse, adult-like community.
There is clear evolutionary evidence that the early microbiome
is important for infant health.
Human milk oligosaccharides (HMOs), a major component of breastmilk,
are not digestible by infants themselves, but are instead
exclusively prebiotic food for a small set of adapted microbes.
Disruptions to the early life microbiome have been linked
to immune, metabolic, and neurodevelopmental outcomes that
persist well beyond infancy.
My previous work has sought to understand
how the composition of the infant microbiome affects host development.
We showed that succession follows conserved patterns
across 1,827 infants from 12 countries,
consistent enough that microbial composition alone predicts a child's age
to within about 2.5 months
@fahurbottinoEarlyLifeMicrobial2025.
We also showed that the species present in the first six months of life
and the neuroactive gene products they encode
are associated with cognitive development,
brain morphology measured with MRI,
and maturation of visual neural circuitry as measured by EEG
@bonhamGutresidentMicroorganismsTheir2023
@bonhamCodevelopmentGutMicrobial2025.

Despite this importance,
efforts to relate early-life microbiome composition to host development
are beset by the fact that
the microbial population _itself_ is in constant flux during this period.
Though age predicts the microbiome remarkably well,
our model's performance was largely driven
by a single extreme shift in composition around six months of age
// Add figure w/proportion of taxa present at 3 months that are still present at 1 year
// Or: curves of most age-specific taxa
coinciding with the end of exclusive milk feeding and the introduction of solid food
@stewartTemporalDevelopmentGut2018
(@fig-milkprepost).
Longitudinal models of the microbiome that treat
composition as linear or even monotonic without accounting
for this profound ecological shift are, therefore, incomplete.

#h(2em)Ecologists distinguish a "press perturbation",
a permanent change in conditions that moves a community to a new equilibrium,
from a "pulse perturbation", a transient disturbance from which a community may return
@benderPerturbationExperimentsCommunity1984.
Weaning is a clear example of a press perturbation,
permanently changing the gut's resource supply along two axes:
(1) an *intrinsic* change supplied by the host, as HMO provisioning is removed,
and (2) an *extrinsic* change supplied by diet,
with the introduction of plant polysaccharides and
particularly dietary fiber @makkiImpactDietaryFiber2018.
Yet despite the loss of HMOs,
other host-provided glycans may continue to feed and shape the microbiome.
Mucin O-glycans, secreted into the gut throughout life,
are built from the same monosaccharides as HMOs
(fucose, sialic acid, galactose, N-acetylglucosamine) in similar linkages,
and are degraded by overlapping bacterial enzyme families
// including GH33 sialidases,
// GH29 and GH95 fucosidases, and GH2 beta-galactosidases
@tailfordMucinGlycanForaging2015.
_Akkermansia muciniphila_, a mucin specialist, can grow on HMOs
but is out-competed when HMO specialists are present
@berkhoutMilkMucinGlycans2025.
Many _Bacteroides_ species contain gene sets for both substrates.
_Bifidobacterium longum_ subsp. _infantis_, the most adept HMO utilizer,
lacks the transporters to use mucin at all.
Host provisioning may therefore continue past weaning by a different route,
with a different set of beneficiaries,
shaping succession and the composition of the gut into adulthood.



    ]
})


#h(2em)My #underline([_long-term goal_]) is to understand the changing early-life
microbiome in ecological terms,
and use that understanding to investigate the interactions between
microbiome composition and child development.
My #underline[_overall objectives_] for this proposal are to
develop a press-perturbation model of infant microbiome development,
and to apply it to model changes in taxonomic and gene-functional composition,
particularly of carbohydrate-active enzymes (CAZymes).
My #underline[_central hypotheses_] are
(1) that weaning acts as a press perturbation on the infant gut ecosystem;
(2) that the timing, magnitude, and resolution of the community's response to weaning
explains early-life succession better than chronological age does;
and (3) that host glycan provisioning does not cease at weaning
but switches substrate from milk to mucin,
where it competes with dietary fiber to shape the emerging community.
An ecological press-perturbation model, in addition to providing a higher-fidelity
model of the critical early microbome assembly,
may be extended to
other clinically relevant press perturbations such as the onset of chronic disease
or long-term treatments such as statins or GLP-1 drugs,
which may alter metabolism and immune posture in ways that 
affect gut microbial composition
@maierExtensiveImpactNonantibiotic2018
@thompsonAlterationsGutMicrobiome2023.

*Gap:*
Existing models of infant microbiome development are
indexed on chronological age.
Whether they are machine-learning age predictors
@fahurbottinoEarlyLifeMicrobial2025
@subramanianPersistentGutMicrobiota2014
or probabilistic longitudinal models that treat covariates
as smooth modulators of a time trend
@chengAdditiveGaussianProcess2019
@yuanLGTMGaussianProcess,
they organize the data around age and treat diet as a covariate to control for.
No existing framework indexes succession on perturbations themselves,
and as a consequence we have no quantitative description
of how the infant gut responds to the defining ecological event of early life.

== Research strategy
We have assembled a database of over 5,000 shotgun metagenomes
from children in the first three years of life:
(1) the twelve-country dataset from #cite(<fahurbottinoEarlyLifeMicrobial2025>, form: "prose"),
nearly 3,200 samples from more than 1,800 infants spanning the globe;
(2) samples from the Cape Town and Malawi arms of the Khula cohort,
and (3) nearly 400 samples from 300 children
contrasting Old Order Mennonite and urban/suburban Rochester families
@seppoTraditionalFarmingLifestyle2021.
Feeding status is recorded for most participants,
and metagenomes provide both species and gene-level resolution.

#underline(emph[Aim 1: A press perturbation model of normative infant microbiome succession:])
Weaning consists of two mechanistically distinct but typically concurrent perturbations:
(1) the cessation of breastmilk and (2) the introduction of solid food.
Crucially, differences in the timing of these two events across infants
provide natural experiments for modeling succession as their joint response.
For example, infants who switch from breastfeeding to formula before starting solids
reduce HMO consumption without adding plant fiber,
while infants weaning from exclusive formula gain dietary fiber
without a major loss of HMOs.

My #underline([central hypothesis]) is that time relative to each press perturbation
explains normative taxonomic succession better than chronological age does,
and that the two have distinct taxonomic and gene-function signatures.
To test this, I will fit models that decompose composition
into an age component and two transition-response components
and compare their explanatory power.
For infant $i$ and taxon $j$, I will model the latent log-ratio abundance as

$ eta_(i j)(t) = f_j(t) + h_i(t) dot c_j + g_j^"milk"(t - m_i) + g_j^"solid"(t - s_i) + b_(i j) + epsilon_(i j)(t) $

where $t$ is chronological age,
$h_i (t) in [0, 1]$ is the breastmilk fraction of the infant's feeds over time
(one for exclusive breastfeeding, zero for exclusive formula, intermediate for mixed),
$m_i$ and $s_i$ are the infant's milk-cessation and solid-introduction times,
$f_j$ is a shared function of age,
$c_j$ is the taxon's response to intrinsic-resource level,
$g_j^"milk"$ and $g_j^"solid"$ are shared functions of time relative to each press perturbation,
and $b_(i j)$ is a subject-level random effect.
In plain language, the first term asks how much of a taxon's behavior is explained
by how old the child is; the $h_i (t) dot c_j$ term captures how the milk-adapted community
is shaped by ongoing exposure to human milk oligosaccharides,
which distinguishes breastfed from formula-fed infants before any weaning;
and the last two ask how much is explained by
how long it has been since that child stopped milk and started solids, respectively.

I will implement the shared functions as additive Gaussian processes
over each time axis
@chengAdditiveGaussianProcess2019
with a compositional observation model mapping the latent $eta$ to observed counts,
accounting for compositionality, irregular sampling, and measurement uncertainty.
The learned $f$ and the exposure and press-perturbation terms
will determine whether age or ecology dominates community composition.
I will quantify each component's contribution by variance attribution
@yuanLGTMGaussianProcess
and compare the predictive performance of age-only, two-press, and single-press models.
Since weaning takes place over several months,
I will model each $g$ with latent onset _and_ duration,
so the ramp is estimated rather than assumed instantaneous.
I will validate by simulation-based calibration
@modrakSimulationBasedCalibrationChecking2025
and standard train/test methods.

*Prospective validation (pilot):*
The retrospective cohorts contain the timing dissociation but not dense sampling
through the transition, nor direct measurement of HMO and fiber intake.
To establish ground truth for model parameters,
I will run a small pilot cohort with the Friedman School of Nutrition Science and Policy
and the Women, Mother + Baby (WoMB) institute at Tufts Medical Center,
sampled monthly through the weaning window, with dietary assessment
and quantification of milk and fecal glycans.
This will help calibrate the model and seed a larger study,
but is deliberately modest and not expected to stand alone.

*Expected outcomes:*
This work is expected to provide
a quantitative answer to whether age or ecology better explains succession,
shared response functions for each major taxon relative to each press,
and a calibrated method for modeling individual infants' succession trajectory.
*Potential problems and alternatives:*
If milk cessation and solid introduction prove statistically inseparable in this dataset,
a single-press perturbation model remains valid and still improves on the age clock.
If the compositional model is computationally prohibitive at this sample size,
I will use a basis-function approximation to the Gaussian process
which scales linearly with the number of samples and has previously been used
for microbiome models @yuanLGTMGaussianProcess.

#underline(emph[Aim 2: Characterizing glycan utilization as a mediator of compositional response:])
While Aim 1 addresses _what_ happens to the community at each press,
Aim 2 asks _why_.
My #underline[_central hypothesis_] is that
the compositional response to each weaning press perturbation is mediated
by the change in its corresponding glycan resource,
HMOs (breastfeeding) or dietary fiber (plants).
If these resources drive composition,
the glycan-foraging gene content of the community should change with each press
in a substrate-specific way, independent of which taxa carry it.

*Approach:*
I will partition the carbohydrate-active enzyme (CAZyme) repertoire quantified
from the metagenomes into a host- and milk-glycan module
//(including GH33 sialidases, GH29 and GH95 fucosidases, GH2 beta-galactosidases,
// and GH20 hexosaminidases)
and a plant-glycan module
//(including GH5 and GH9 cellulases, GH10 and GH11 xylanases,
//GH51 arabinofuranosidases, and pectate lyases),
using the CAZy database
@zhengDbCAN3AutomatedCarbohydrateactive2023.
To test whether each component of weaning (HMO withdrawal, adding solid food)
acts through its own glycan resource,
I will align each module to each component using the transition times from Aim 1
and test whether the host-glycan module responds to milk cessation
and the plant-glycan module to solid introduction.
To test whether host provisioning persists,
I will ask whether taxonomic turnover across the milk-cessation press
exceeds functional turnover in the host-glycan module:
if the host keeps feeding its microbiome through mucin,
host-glycan foraging capacity should outlive the taxa that carried it.

*Expected outcomes:*
Evidence for or against the proposition that host glycan provisioning persists past weaning,
identification of the enzyme families and taxa that mediate each press,
and a test of whether the two press perturbations act through their respective glycan resources.
*Potential problems and alternatives:*
A negative result,
in which host-glycan capacity collapses along with its carrying taxa,
is equally informative and would indicate that the post-weaning community is governed
principally by diet rather than by continued host provisioning.
If gene-family resolution proves too coarse to separate the modules cleanly,
I will refine the assignment to the substrate-specific enzyme and transporter genes
with the least cross-substrate ambiguity,
at the cost of coverage.
Functional profiling from short-read metagenomes can measure metabolic capacity 
rather than activity.
Targeted metabolomics in the pilot cohort of Aim 1 may provide
additional resolution in future work.

*Future directions:*
Natural extensions include (a) dense sampling through weaning
(extending the proposed pilot) to improve resolution,
(b) relating disruptions in normative assembly to health outcomes,
and (c) investigating how host factors
(breastmilk composition, immune development)
shape community development.
Ecologically-grounded study of the gut microbiome
need not be limited to weaning or early life:
other press perturbations such as chronic disease onset,
dietary change, or long-term medication use
may alter the microbiome in important ways,
while pulse perturbations such as antibiotic exposure
disrupt it transiently and may require a different modeling approach.

*Expected impact*:
This project will provide a quantitative ecological account
of an early and consequential microbiome perturbation,
forming the foundation for a generalizable
press- and pulse- perturbation model with relevance throughout life,
as dietary change, migration, antibiotics, and disease
shape and are shaped by microbial communities.
A validated perturbation-response description
// Not best characterized - it's the GAP
of the most universal ecological transition in human life will provide a template approach 
for other, less common events.
Framing it as a competition
between host- and diet-provided resources
also connects to an evolutionary framework
and to the experimental work on infant-associated microbial physiology
my lab is pursuing in parallel.

#pagebreak()
#bibliography("refs.bib", style: "apa")
