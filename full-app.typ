#set page(paper:"us-letter", margin:1in, numbering: "1")
//double spacing
#set text(12pt, top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: 2em)

== Background and significance

The gut microbiome assembles over the first years of life
through a chaotic but predictable ecological succession.
Pioneer colonizers arrive at birth,
expand under the selective pressure of a liquid diet (milk or forumla),
and are progressively replaced by a more diverse, adult-like community.
Disruptions to this process have been linked
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
There is also clear evolutionary evidence that the early microbiome
is important for infant health;
a major component of human breastmilk,
human milk oligosaccharides (HMOs),
are not digestible by infants themselves, but are instead
prebiotic food for a small set of adapted microbes.

Despite this clear importance,
attempts to understand the relationships between microbiome composition
in the first year of list and host development
remain beset by the persistent challenge that
the microbial population itself is in constant flux during this period.
Though we showed that age predicts the microbiome remarkably well,
the performance of our models were in large part driven
by a single extreme shift in composition that occurs around six months of age.
// Add figure w/proportion of taxa present at 3 months that are still present at 1 year
// Or: curves of most age-specific taxa
A one-year-old differs from a three-month-old in many ecologically-relevant ways
including gut pH, immune tone, transit time, mucosal secretions,
and most crucially, diet.
The strongest candidate for the engine of change
is a specific, near-universal environmental event,
namely the end of exclusive milk feeding and the introduction of solid food.
Indeed,  in the TEDDY cohort,
receipt of breast milk was the single largest factor
associated with microbiome structure
and cessation of breast milk accelerated maturation
@stewartTemporalDevelopmentGut2018.
Essentially none of the microbes that dominate a milk-fed microbiome
are present in the solid-food microbiome and vise versa (@fig-milkprepost).
As a consequence, longitudinal models of the microbiome that treat
composition as linear or even monotonic without accounting
for this profound ecological shift are hopelessly incomplete.

#figure([])<fig-milkprepost>

Weaning changes the gut's resource supply along two axes:
(1) the *intrinsic* (supplied by the host species) provisioning of HMOs and
(2) *extrinsic* (supplied by diet).
Solid foods introduce plant polysaccharides,
and dietary fiber is among the most powerful known modulators
of gut community composition at every age
@makkiImpactDietaryFiber2018.
At weaning, the intrinsic resource appears to be withdrawn
and the extrinsic resource arrives.
But the host does not stop feeding its microbiome.
Mucin O-glycans are secreted into the gut throughout life,
are built from the same monosaccharides as HMOs
(fucose, sialic acid, galactose, N-acetylglucosamine) in similar linkages,
and are degraded by overlapping bacterial enzyme families including GH33 sialidases,
GH29 and GH95 fucosidases, and GH2 beta-galactosidases
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

Ecologists distinguish a "press perturbation",
a permanent change in conditions that moves a community to a new equilibrium,
from a "pulse perturbation", a transient disturbance from which a community may return
@benderPerturbationExperimentsCommunity1984.
Where the microbiome literature treats perturbations at all,
it tends to treat all exposures alike.
Weaning is an archetypal press:
the resource that sustained the pioneer community is withdrawn and does not return,
while at the same time new resources (and news sources of dispersal) are introduced.
Other clinically relevant press perturbations such as the onset of chronic disease
or long-term treatments such as statins or GLP-1 drugs
may alter metabolism and immune posture in ways that 
affect gut microbial composition
@maierExtensiveImpactNonantibiotic2018
@thompsonAlterationsGutMicrobiome2023,
but modeling these effects is substantially more challenging,
since microbes may be both cause and effect,
effects of the perturbation are less dramatic 
and take place over a longer time period,
and treatments and diseases may confound one another in the signal.
Antibiotics and acute illness are examples of pulse perturbations,
and may also benefit from an ecological lens,
but are beyond the scope of this proposal.

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
The #underline[_rationale_] for this proposal is that...

== Gap and hypothesis

Existing models of infant microbiome development are
monotonically indexed on chronological age.
Whether they are machine-learning age predictors
@fahurbottinoEarlyLifeMicrobial2025
@subramanianPersistentGutMicrobiota2014
or the recent generation of probabilistic longitudinal models that treat covariates
as smooth modulators of a time trend
@chengAdditiveGaussianProcess2019
@yuanLGTMGaussianProcess,
they organize the data around age and treat diet as a nuisance covariate.
While understandable from a practical methodological standpoint,
this discards the known biology in favor of an easy-to-measure
and easy-to-model continuous value (age).
Further,
these models focus on microbial taxonomic identification,
which are proxies for metabolic function,
but do not address metabolic function itself,
which may cross species boundaries.

I propose that the structure of the early-life gut microbiome
contains four ecologically distinct regimes.
The first is *assembly*, from birth through roughly the first month,
when a near-sterile gut is colonized under conditions of high turnover and strong priority effects.
While this state is important to understand, particularly for pre-term infants,
it is sparsely sampled in nearly every existing cohort.
The second structure is a *milk-adapted* quasi-stable state.
The composition of breastmilk undergoes many changes during this period
(indeed there is variation based on time of day
and even from the beginning of a feed to the end of a feed),
but the macronutrient content is relatively stable,
and can be modeled similarly to typical diet variation.
The third is the *weaning press*, when the resource base changes permanently.
The weaning transition is well sampled, can be temporally placed in most cohorts,
and is the point at which individual trajectories most plausibly begin to diverge.
The final phase is the stable, *adult-like* state
when milk is fully withdrawn and the gut microbiome
settles into its long-term configuration.

Succession is a response to a changing environment,
and the largest environmental change of infancy has a measurable date.
No framework indexes succession on the perturbation itself,
and as a consequence we have no quantitative description
of how the infant gut responds to the defining ecological event of early life,
nor of what the host contributes to the community that emerges from it.
I propose to use the weaning transition as a natural experiment
to characterize how the gut ecosystem responds
to a permanent change in its resource supply,
and to determine how that response is divided
between host-provided and diet-provided resources.

== Research strategy

My colleagues and I have assembled a databases of over 4,000 shotgun metagenomes
from children in the first three years.
These include the twelve-country dataset from #cite(<fahurbottinoEarlyLifeMicrobial2025>, form: "prose"),
additional samples from the Cape Town and Malawi arms of the Khula cohort,
and nearly 400 samples from 300 children in a cohort
contrasting Old Order Mennonite or urban/suburban Rochester families
@seppoTraditionalFarmingLifestyle2021.
Feeding status is recorded for most participants, though coarsely:
exclusive breastfeeding, exclusive formula, or mixed, and solid foods yes or no.
Shotgun metagenomes
provide both species and gene-level resolution
and avoid the substantial difficulties of reconciling amplicon data across studies.
Per-individual sampling is sparse,
so all analyses estimate population-level dynamics
by pooling across children rather than fitting dynamical systems to single infants.

== Aim 1: A two-press perturbation model of normative infant microbiome succession

Weaning consists of two mechanistically distinct events that are typically concurrent
but represent distinct perturbations;
(1) the cessation of breastmilk withdraws HMOs and other intrinsic, host-provided resources,
(2) and the introduction of solid food provides provides new extrinsic resources such as plant fiber.
Differences in infant feeding practices provide natural experiments
that will enable modeling succession as the response to these two presses.
For example, infants that switch from bresatfeeding to formula prior to the introduction
of solid food dramatically reduce HMO consumption without increasing plant fiber.
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
Because the milk-cessation press withdraws a resource the infant must first have received,
$g_j^"milk"$ is gated by prior breastmilk exposure:
it has nothing to act on in an infant fed formula from birth,
whose $h_i (t)$ is zero throughout,
and its amplitude scales with the exposure that precedes it.
An infant who switches from exclusive breastmilk to formula without starting solids
is therefore represented within the same model as a decline in $h_i (t)$
that isolates the withdrawal of human milk oligosaccharides
from the introduction of fiber.
I will implement the shared functions as additive Gaussian processes over each time axis
@chengAdditiveGaussianProcess2019
with a compositional observation model that maps the latent $eta$ to observed counts,
so that the sum-to-one constraint, irregular sampling, and measurement uncertainty
are handled directly rather than through _ad hoc_ transformation
[CITE: logistic-normal multinomial / Aitchison compositional model].
Under the clock hypothesis, $f$ dominates.
Under the perturbation-response hypothesis,
the exposure and press terms dominate.
I will quantify each component's contribution by variance attribution
@yuanLGTMGaussianProcess
and compare the age-only, two-press, and press-only models
by held-out predictive performance.

*Weaning is a transition, not a step.*
Breastfeeding is typically reduced over weeks to months rather than stopped at once.
Where cohorts record feeding intensity across visits
(exclusive, then partial, then none),
I will model each $g$ as a smooth response with a latent onset _and_ a duration,
so that the ramp is estimated rather than assumed instantaneous.
Where only a binary flag is recorded, the model recovers onset bounds but not duration,
and I will report the resulting resolution limit rather than over-interpret it.

*The transition times are latent, and inferring them is the core of the method.*
Most cohorts do not record the exact date of milk cessation or solid introduction.
They record, at each visit, whether each has yet occurred.
Because the flags are monotone, each event is interval-censored:
it lies between the last visit flagged "no" and the first flagged "yes".
Substituting the interval midpoint would inject error into the covariate
and bias the model toward the age explanation for a methodological reason.
To determine each infant's transition times,
I will treat $m_i$ and $s_i$ as latent variables,
place priors on them drawn from the population distribution of weaning times
and truncated to each infant's observed censoring interval,
and infer them jointly with $f$, $g^"milk"$, and $g^"solid"$.
This is identifiable because each $g$ is shared across all infants
and estimated from thousands of samples,
while each transition time is a single scalar constrained by hard bounds.
Infants whose sampling brackets a transition tightly pin down the alignment of $g$,
and that shared $g$ then localizes the transition for infants sampled more sparsely.

This design turns the coarse metadata into the sharpest available test of the hypothesis.
If succession is a response to the presses,
composition must carry information about how long it has been since each one,
and the model should date the transitions from composition alone
more precisely than the censoring interval allows.
An age clock has no reason to do this.
// This is the falsification criterion.
If the model cannot localize the transition times within their intervals
better than the prior, that is evidence against the hypothesis, not a technical failure,
and I will report it as such.
I will validate the inference by simulation-based calibration
[CITE: simulation-based calibration, Talts et al. 2018]
and by holding out tightly bracketed infants, hiding their bounds, and testing recovery.

*Separating the two presses depends on infants in whom they dissociate.*
The two response functions can be told apart only because milk cessation and
solid introduction do not always coincide.
Early formula-switchers and infants with extended breastfeeding alongside early solids
provide the discordant timing that powers the separation.
Whether the data can support a two-press model is therefore an empirical question
I can answer before fitting:
I will quantify, across the roughly 4,000 metagenomes in hand,
how many infants have discordant transition timing.
// Feasibility check; belongs in preliminary data.
If the great majority wean both axes together near six months,
I will report the two-press model as identifiable only for the taxa with the
strongest signals and fall back to a single weaning press for the remainder.

#block(stroke: 0.5pt, inset: 8pt, radius: 3pt)[
*Prospective validation (pilot).*
The retrospective cohorts contain the timing dissociation but not dense sampling
through the transition, nor direct measurement of HMO and fiber intake.
To ground-truth the latent-transition inference and to resolve the weaning ramp,
I will run a small pilot cohort with the Friedman School of Nutrition Science and Policy,
sampled monthly through the weaning window, with dietary assessment
and quantification of milk and fecal glycans.
This component calibrates the computational model and seeds a future dedicated study.
It is deliberately modest and is not the evidence on which the aim's conclusions rest,
since its sampling matures late in the award period.
]

*Expected outcomes.*
A quantitative answer to whether age or the presses better explain succession,
a shared response function for each major taxon relative to each press,
and a calibrated method for placing an individual infant on the succession trajectory
from sparse samples.

*Potential problems and alternatives.*
If milk cessation and solid introduction prove statistically inseparable in this dataset,
the single-press model remains valid and still improves on the age clock.
If the compositional model is computationally prohibitive at this sample size,
I will use a basis-function approximation to the Gaussian process
[CITE: Hilbert-space reduced-rank GP approximation],
which scales linearly in the number of samples and is the approach taken by
recent longitudinal microbiome models @yuanLGTMGaussianProcess.

== Aim 2: Glycan utilization as the mediator of the compositional response

Aim 1 describes _what_ happens to the community at each press.
Aim 2 tests _why_, at the level of the resource each press changes.
The presses are defined by glycans:
milk cessation withdraws HMOs, and solid food adds plant fiber.
If these resources drive the compositional response,
then the community's glycan-foraging gene content should change with each press
in a substrate-specific way, and should do so whether or not the carrying taxa persist.
Because the dietary metadata is too coarse to quantify intake,
I will read the resource environment off the community's own gene content,
which is a more direct measure of what the community can consume than any questionnaire.

*Hypothesis.*
I hypothesize that the compositional response to each press is mediated by the change
in its corresponding glycan resource,
and specifically that host glycan provisioning does not cease at milk withdrawal
but switches substrate from milk oligosaccharides to mucin,
where it competes with dietary fiber to shape the emerging community.

*Approach.*
I will partition the carbohydrate-active enzyme (CAZyme) repertoire quantified
from the metagenomes into a host- and milk-glycan module
(including GH33 sialidases, GH29 and GH95 fucosidases, GH2 beta-galactosidases,
and GH20 hexosaminidases)
and a plant-glycan module
(including GH5 and GH9 cellulases, GH10 and GH11 xylanases,
GH51 arabinofuranosidases, and pectate lyases),
using the family assignments from a versioned annotation
[CITE: dbCAN / CAZy database].
HMOs and mucin O-glycans are built from the same monosaccharides
and are degraded by overlapping enzyme families
@tailfordMucinGlycanForaging2015 [CITE: Shuoker et al. 2023, mucin sialidases/fucosidases],
which is what makes a substrate switch from milk to mucin possible for some taxa
but not others.

To determine whether each press acts through its own glycan resource,
I will align each functional module to each press using the transition times from Aim 1
and test whether the host-glycan module responds to milk cessation
and the plant-glycan module responds to solid introduction.

To determine whether host provisioning persists across milk withdrawal,
I will test whether taxonomic turnover across the milk-cessation press
exceeds functional turnover in the host-glycan module.
If the host continues to feed its microbiome through mucin,
host-glycan foraging capacity should outlive the taxa that carried it before the press.
The stratified output of the functional profiler makes this directly observable:
I can follow a host-glycan family's total abundance across the press
while its taxonomic contributors switch from _Bifidobacterium longum_ subsp. _infantis_,
which lacks the transporters to use mucin
[CITE: B. infantis mucin transporter deficiency],
to mucin-competent taxa such as _Bacteroides_ and _Akkermansia muciniphila_
@berkhoutMilkMucinGlycans2025.
Function persisting while the taxa carrying it turn over is the mediation result
in a single view.

*Natural experiments dissociate the two resources.*
The strongest test comes from infants in whom the two presses are decoupled.
Infants who switch from exclusive breastmilk to formula experience
withdrawal of HMOs without the addition of fiber.
I predict that in these infants the host-glycan module falls
while the plant-glycan module is unchanged,
and that composition shifts partway toward the post-weaning state.
Infants who begin solids while breastfeeding continues experience
the addition of fiber without withdrawal of HMOs,
and I predict the mirror-image response.
// This is the causal handle that links Aim 2 back to the two-press design in Aim 1.
I will use these subgroups to test whether each resource change moves
glycan-foraging capacity and composition in the predicted, dissociable directions.
The main confound is that some modern formulas are supplemented with HMOs
such as 2'-fucosyllactose [CITE: HMO-supplemented infant formula],
so I will restrict this analysis to infants whose formula composition is known
or predates widespread supplementation, and treat formula as an imperfect instrument.

*A cross-population prediction that would explain our prior result.*
The host-provided resource is universal; the dietary resource is not.
If host provisioning does real work after weaning,
host-glycan foraging capacity should be more conserved across populations
than plant-glycan capacity, which should track local diet.
To test this, I will partition the variance in each functional module across
the twelve-country dataset and the Mennonite, Rochester, Cape Town, and Malawi contrasts,
comparing on a fair-footing statistic rather than raw variance,
since the two modules differ in size and prevalence.
Under this hypothesis, the universality of succession we reported
@fahurbottinoEarlyLifeMicrobial2025 is carried by what the host provides,
and its variability by what the child eats.

*Expected outcomes.*
Evidence for or against the proposition that host glycan provisioning persists past weaning,
identification of the enzyme families and taxa that mediate each press,
and a test of whether the two presses act through their respective glycan resources.

*Potential problems and alternatives.*
A negative result, in which host-glycan capacity collapses along with its carrying taxa,
is equally informative and would indicate that the post-weaning community is governed
principally by diet rather than by continued host provisioning.
If gene-family resolution proves too coarse to separate the modules cleanly,
I will refine the assignment to the substrate-specific enzyme and transporter genes
with the least cross-substrate ambiguity,
at the cost of coverage.
Functional profiling from short-read metagenomes assigns capacity, not expression,
and I will state this limit explicitly;
metatranscriptomics or targeted assays in the pilot cohort of Aim 1 could address it
in future work.
== Future directions

Two limitations of the existing data define the next phase of this program,
and I intend to use this award to generate the pilot data that makes each fundable at scale.

First, the pulse perturbation is currently untestable with data in hand.
Antibiotic exposure is the clearest natural pulse in early life,
and comparing pulse against press within a single framework is where the perturbation account becomes general.
I have colleagues in Infectious Disease at Tufts Medical Center and will develop a focused cohort sampled around antibiotic courses.

Second, our dietary metadata is coarse,
and our sampling around weaning is sparse relative to the speed of the transition.
With the Friedman School of Nutrition Science and Policy at Tufts, I will design a cohort with dense sampling through the weaning window and proper dietary assessment,
which would allow the resource-axis competition in Aim 3 to be measured rather than inferred.

The assembly period, from birth through the first weeks, remains the least tractable and most interesting regime.
It is where priority effects are established,
and it is the regime most disrupted in preterm birth.
It is also the one setting where dense sampling already exists, in NICU populations.
Aim 2 provides the entry point, by testing whether the pre-weaning state predicts the post-weaning outcome;
if it does, then assembly matters through a measurable channel,
and characterizing it becomes the natural successor to this work.

== Expected impact

This project reframes early-life microbiome development from a description of what happens when to an ecological account of why.
If succession is best understood as a response to environmental transition, then the transition, not the calendar,
is where individual variation originates and where intervention should be aimed.
The framework is general:
press and pulse perturbations recur throughout life as dietary change, migration, antibiotics, and disease,
and a validated perturbation-response description of the best-characterized transition in human life provides a template for the rest.
Framing the transition as a competition between host-provided and diet-provided resources also connects population-scale metagenomics to the evolutionary question of what the host is selecting for,
and to the experimental work on infant-associated microbial physiology that my lab is pursuing in parallel.

== Personal significance

*[Placeholder. Threads to draw on: I am the father of two children, both delivered by cesarean section, one with eczema,
and like all parents we struggled to know what was best for them at exactly the moments this proposal studies.
More broadly, I am drawn to what evolution reveals about hard biological questions,
and the fact that we evolved to feed our infants' microbes with a costly, indigestible sugar is among the most striking examples I know.
Whether that evolutionary pressure simply stops when a child starts eating solid food seems unlikely to me,
and worth finding out.]*

---


#bibliography("refs.bib", title: none, style: "apa")
