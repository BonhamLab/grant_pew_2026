#import "@preview/meander:0.4.2"

#set page(paper:"us-letter", margin:1in, numbering: "1")
//double spacing
#set text(12pt, font: "Liberation Serif", top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: 2em)
#show heading.where(level: 2): set text(12pt, weight: "bold")
#show heading.where(level: 3): it=>{
  set text(weight: "regular")
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


== Background and significance

The gut microbiome assembles over the first years of life
through a chaotic but predictable ecological succession.
Pioneer colonizers arrive at birth,
expand under the selective pressure of a liquid diet (milk or forumla),
and are progressively replaced by a more diverse, adult-like community.
There is clear evolutionary evidence that the early microbiome
is important for infant health;
a major component of human breastmilk,
human milk oligosaccharides (HMOs),
are not digestible by infants themselves, but are instead
prebiotic food for a small set of adapted microbes.
Indeed, disruptions to the early life microbiome have been linked
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
brain morphology by MRI,
and maturation of visual neural circuitry by EEG
@bonhamGutresidentMicroorganismsTheir2023
@bonhamCodevelopmentGutMicrobial2025.

Despite this clear importance,
attempts to understand the relationships between microbiome composition
in the first year of list and host development
remain beset by the persistent challenge that
the microbial population _itself_ is in constant flux during this period.
Though we showed that age predicts the microbiome remarkably well,
the performance of our models were in large part driven
by a single extreme shift in composition that occurs around six months of age
// Add figure w/proportion of taxa present at 3 months that are still present at 1 year
// Or: curves of most age-specific taxa
coinciding with the end of exclusive milk feeding and the introduction of solid food
@stewartTemporalDevelopmentGut2018
(@fig-milkprepost).
As a consequence, longitudinal models of the microbiome that treat
composition as linear or even monotonic without accounting
for this profound ecological shift are incomplete.

#meander.reflow({
  import meander: *

  container(width: 46%)
  container()

  content[#box(width:40%)[
      
#figure(image("assets/press_schema.svg"),
  caption: [
    Schematic of diet- and mucin- derrived glycans available to feed the microbiome
    in breastfed infants.
    The press perturbation is primarily defined by the shift from dietary HMO
    from breastmilk to plant-derived fiber.
    Mucin composition and abundance also changes, but this change is less dramatic.
  ])<fig-milkprepost>]]

      colbreak()

    content[
      Ecologists distinguish a "press perturbation",
a permanent change in conditions that moves a community to a new equilibrium,
from a "pulse perturbation", a transient disturbance from which a community may return
@benderPerturbationExperimentsCommunity1984.
Weaning is a clear example of a press,
as it permanently changes the gut's resource supply along two axes:
(1) the *intrinsic* (supplied by the host species) provisioning of HMOs
is removed and
(2) the *extrinsic* (supplied by diet) introduction of plant polysaccharides,
particularly dietary fiber @makkiImpactDietaryFiber2018 and other nutrients.
Interestingly, despite the loss of HMOs,
other host-provided glycans may continue to feed and shape the microbiome.
For example, mucin O-glycans are secreted into the gut throughout life,
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
shaping the ecology of succession and
the resulting composition of the gut into adulthood.


    ]
})
My #underline([_long term goal_]) is to understand the changing early-life
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
but switches substrate from milk oligosaccharides to mucin,
where it competes with dietary fiber to shape the emerging community.
An ecological press-perturbation model, in addition to providing a higher-fidelity
model of the critical early microbome assembly,
may be extended to
other clinically relevant press perturbations such as the onset of chronic disease
or long-term treatments such as statins or GLP-1 drugs
may alter metabolism and immune posture in ways that 
affect gut microbial composition
@maierExtensiveImpactNonantibiotic2018
@thompsonAlterationsGutMicrobiome2023.

*Gap:*
Existing models of infant microbiome development are
indexed on chronological age.
Whether they are machine-learning age predictors
@fahurbottinoEarlyLifeMicrobial2025
@subramanianPersistentGutMicrobiota2014
or the recent generation of probabilistic longitudinal models that treat covariates
as smooth modulators of a time trend
@chengAdditiveGaussianProcess2019
@yuanLGTMGaussianProcess,
they organize the data around age and treat diet as a nuisance covariate.
Further,
these models focus on microbial taxonomic identification,
which are proxies for metabolic function,
but do not address metabolic function itself,
which may cross species boundaries.
No existing framework indexes succession on perturbations themselves,
and as a consequence we have no quantitative description
of how the infant gut responds to the defining ecological event of early life.

== Research strategy

We have assembled a databases of over 4,000 shotgun metagenomes
from children in the first three years.
These include the twelve-country dataset from #cite(<fahurbottinoEarlyLifeMicrobial2025>, form: "prose"),
additional samples from the Cape Town and Malawi arms of the Khula cohort,
and nearly 400 samples from 300 children in a cohort
contrasting Old Order Mennonite or urban/suburban Rochester families
@seppoTraditionalFarmingLifestyle2021.
Feeding status is recorded for most participants,
and metagenomes provide both species and gene-level resolution.

=== Aim 1: A press perturbation model of normative infant microbiome succession

Weaning consists of two mechanistically distinct events that are typically concurrent
but represent distinct perturbations:
(1) the cessation of breastmilk and (2) the introduction of solid food.
Crucially, differences in infant feeding practices
with respect to the timing of these two events provide natural experiments
that will enable modeling succession as the response to these two presses.
For example, infants that switch from bresatfeeding to formula
prior to the introduction of solid food
dramatically reduce HMO consumption without increasing plant fiber.
Infants that wean from exclusive formula feeding have the added dietary fiber
without a major loss in HMOs (since they have a reduced quantity to begin with).

My #underline([central hypothesis]) is that time relative to each press
explains normative taxonomic succession better than chronological age does,
and that the two presses have distinct taxonomic signatures.
To determine whether succession is organized by age or by response to the presses,
I will fit models that decompose composition into an age component
and two transition-response components and compare their explanatory power.
For infant $i$ and taxon $j$, I will model the latent log-ratio abundance as

$ eta_(i j)(t) = f_j(t) + h_i(t) dot c_j + g_j^"milk"(t - m_i) + g_j^"solid"(t - s_i) + b_(i j) + epsilon_(i j)(t) $

where $t$ is chronological age,
$h_i (t) in [0, 1]$ is the breastmilk fraction of the infant's feeds over time
(one for exclusive breastfeeding, zero for exclusive formula, intermediate for mixed),
$m_i$ and $s_i$ are the infant's milk-cessation and solid-introduction times,
$f_j$ is a shared function of age,
$c_j$ is the taxon's response to intrinsic-resource level,
$g_j^"milk"$ and $g_j^"solid"$ are shared functions of time relative to each press,
and $b_(i j)$ is a subject-level random effect.
In plain language, the first term asks how much of a taxon's behavior is explained
by how old the child is; the $h_i (t) dot c_j$ term captures how the milk-adapted community
is shaped by ongoing exposure to human milk oligosaccharides,
which distinguishes breastfed from formula-fed infants before any weaning;
and the last two ask how much is explained by
how long it has been since that child stopped milk and started solids.

I will implement the shared functions as additive Gaussian processes
over each time axis
@chengAdditiveGaussianProcess2019
with a compositional observation model that maps the latent $eta$ to observed counts,
so that compositionality, irregular sampling, and measurement uncertainty
are handled directly.
The learned values of $f$ (the function of time)
and the exposure and press terms will determine whether
age or ecology are the dominant forces shaping community composition.
I will quantify each component's contribution by variance attribution
@yuanLGTMGaussianProcess
and compare the predictive performance of age-only, two-press, and press-only models.
Since weaning typically takes place over several months,
I will model each $g$ as a smooth response with latent onset _and_ duration,
so that the ramp is estimated rather than assumed instantaneous.
I will validate the inference by simulation-based calibration
@modrakSimulationBasedCalibrationChecking2025
and by holding out tightly bracketed infants, hiding their bounds, and testing recovery.

*Prospective validation (pilot):*
The retrospective cohorts contain the timing dissociation but not dense sampling
through the transition, nor direct measurement of HMO and fiber intake.
To establish ground-truth for model parameters,
I propose to run a small pilot cohort with the Friedman School of Nutrition Science and Policy and the Women, Mother + Baby (WoMB) institute at Tufts Medical Center,
sampled monthly through the weaning window, with dietary assessment
and quantification of milk and fecal glycans.
This component will help calibrate the computational model
and provide preliminary data for a larger study,
but will be deliberately modest and is not expected to be complete within the scope of this program.

*Expected outcomes:*
This work is expected to generate
a quantitative answer to whether age or ecology better explain succession,
shared response functions for each major taxon relative to each press,
and a calibrated method for modeling individual infants' succession trajectory.
*Potential problems and alternatives:*
If milk cessation and solid introduction prove statistically inseparable in this dataset,
a single-press model remains valid and still improves on the age clock.
If the compositional model is computationally prohibitive at this sample size,
I will use a basis-function approximation to the Gaussian process
which scales linearly in the number of samples and is the approach taken by
recent longitudinal microbiome models @yuanLGTMGaussianProcess.

=== Aim 2: Characterizing glycan utilization as a mediator of compositional response

While Aim 1 is focused on _what_ happens to the community at each press,
Aim 2 will attempt to answer _why_.
My #underline[_central hypothesis_] for this aim is that
the compositional response the weaning press is mediated by the change
in its corresponding glycan resource, HMOs (breastfeeding) or dietary fiber (plants).
If these resources drive community composition,
then glycan-foraging gene content should change with each press
in a substrate-specific way, and should do independent of which taxa carry them.

*Approach:*
I will partition the carbohydrate-active enzyme (CAZyme) repertoire quantified
from the metagenomes into a host- and milk-glycan module
//(including GH33 sialidases, GH29 and GH95 fucosidases, GH2 beta-galactosidases,
// and GH20 hexosaminidases)
and a plant-glycan module
//(including GH5 and GH9 cellulases, GH10 and GH11 xylanases,
//GH51 arabinofuranosidases, and pectate lyases),
using the family assignments from the CAZy database
@zhengDbCAN3AutomatedCarbohydrateactive2023.
To determine whether each component of weaning
(HMO withdrawl and solid food introduction)
acts through its own glycan resource,
I will align each functional module to each component
using the transition times learned in Aim 1
and test whether the host-glycan module responds to milk cessation
and the plant-glycan module responds to solid introduction.
To determine whether host provisioning persists across milk withdrawal,
I will test whether taxonomic turnover across the milk-cessation press
exceeds functional turnover in the host-glycan module.
If the host continues to feed its microbiome through mucin,
host-glycan foraging capacity
should outlive the taxa that carried it before the press.

*Expected outcomes:*
Evidence for or against the proposition that host glycan provisioning persists past weaning,
identification of the enzyme families and taxa that mediate each press,
and a test of whether the two presses act through their respective glycan resources.
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
Natural extensions of this work will be to collect dense data
during weaning (extending the proposed pilot study) to improve resolution,
identifying how disruptions or differences in normative community assembly
are associated with health outcomes,
and investigating the effects of host factors
(different breastmilk composition, immune system development, etc)
on community development.
But ecologically-grounded investigation of the gut microbiome
should not be limited to weaning or even to early life.
Other press perturbations such as chronic disease onset,
changes in diet, or long-term use of medications may alter
the gut microbiome in important ways.
Pulse-perturbations such as antibiotic exposure 
clearly disrupt the microbiome and have health implications,
including during development, and may require a different modeling approach.
Finally,
a major open question is how the microbiome is seeded in the first place,
both in terms of the source of microbes
and the shaping of the gut ecosystem that enables them to flourish.

*Expected impact*:
Upon completion, this project is expected to provide a quantitiative ecological account
of an early and consequential microbiome perturbation.
This framework will form the foundation for a generalizable 
press and pulse perturbation model with relevance throughout life
as dietary change, migration, antibiotics, and disease, shape and are shaped by microbial communities.
A validated perturbation-response description
of the best-characterized transition in human life provides a template for the rest.
Framing the transition as a competition
between host-provided and diet-provided resources
also connects population-scale metagenomics to the evolutionary question of what the host is selecting for,
and to the experimental work on infant-associated microbial physiology that my lab is pursuing in parallel.

#pagebreak()
#bibliography("refs.bib", style: "apa")
