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

=== Aim 1. A press-perturbation model of early life microbiome composition

To determine which axis organizes succession,
I will fit models that decompose microbial composition
into an age component and a transition-response component
and compare their explanatory power.
For infant *i* and taxon *j*, I will model the latent log-ratio abundance as

$ η_"ij"(t) = f_j(t) + g_j(t − w_i) + b_"ij" + ε_"ij"(t) $

where $t$ is chronological age,
$w_i$ is the child's weaning time,
$f_j$ is a shared function of age,
$g_j$ is a shared function of time relative to the transition,
and $b_"ij"$ is a subject-level random effect.
In plain language: the first term asks how much of a taxon's behavior is explained by how old the child is,
and the second asks how much is explained by how long it has been since that child started solid food.
Because $w_i$ varies across children, the two terms are not collinear and their contributions can be separated.
I will implement these as additive Gaussian processes over the two time axes with a compositional (logistic-normal multinomial) observation model,
which handles irregular sampling, the sum-to-one constraint, and the uncertainty that linear models on this data type do not.
Under the clock hypothesis, $f$ dominates.
Under the perturbation-response hypothesis, $g$ dominates.

The weaning transition bundles two events that are not identical.
Withdrawal of milk removes the resource sustaining HMO specialists;
arrival of solid food supplies plant polysaccharides.
TEDDY suggests the former is the stronger driver.
Our metadata records breastfeeding status and solid food introduction separately,
and where their timing differs across children I will fit each as its own event axis and compare.

*Expected outcome:* a quantitative answer to whether age or transition better explains succession,
and a shared response function describing the average trajectory of each major taxon relative to the transition.
A complementary effort to build an individual-level "microbiome age" instrument is ongoing in the group of my former trainee, Guilherme Fahur Bottino.
Nothing here depends on that instrument,
and I will adopt it if it proves fit for purpose rather than duplicate it.

=== Aim 2. Determine the geometry and dynamics of the weaning press.

Describing a perturbation as a displacement presumes we know the shape of the space the community moves through.
That shape is not established.
The community-state literature assumes discrete states;
the critiques of enterotypes argue for a continuum.
The question is decidable,
and it determines which description of perturbation is even meaningful.

To determine whether the space of infant community states is continuous or branched, I will apply topological data analysis to the full collection of metagenomes.
Persistent homology in degree zero measures whether the point cloud of community states separates into components that persist across a range of scales,
giving a threshold-free test for discrete states rather than an imposed clustering.
Mapper produces a graph summary of the same point cloud,
and is well suited to detecting branch points,
where a set of pre-weaning trajectories splits into distinct post-weaning configurations.
I will use these as a structural description that the probabilistic models of Aim 1 then do inference within.
I am explicit that topological methods here are descriptive,
are sensitive to the choice of metric (I will use Aitchison distance, appropriate for compositional data, and test sensitivity to alternatives),
and provide no calibrated uncertainty.
They set the geometry;
they do not do the inference.

Within that geometry, I will estimate from the event-aligned models of Aim 1 a set of ecological quantities that have not been measured for this transition:
the *displacement* (how far the community moves),
the *relaxation time* (how long until it settles into a new quasi-stationary state),
the *transient variance* (whether between-infant variability rises during the transition, indicating a window of reduced stability),
and the *dependence of the endpoint on the starting state*
(whether the pre-weaning community predicts the post-weaning one,
which would indicate priority effects and would link the assembly period to the weaning outcome without requiring dense sampling of assembly itself).

I will test whether these quantities generalize by contrasting populations that differ in the extrinsic resource.
The Old Order Mennonite and urban Rochester comparison holds geography relatively constant
while varying diet, farm exposure, and family structure.
The Malawi and Cape Town arms of Khula differ in diet and environment against a shared study design.
If the weaning press has a common structure, the response function should be recognizable across all of them,
with the dietary axis modulating its endpoint.

*Risk and limitation:* our per-individual sampling density does not support fitting per-child dynamical models,
and I do not propose to.
Estimates of relaxation time and transient variance will be population-level and pooled,
and their resolution is bounded by sampling interval.
If the transition is faster than we can resolve, I will report the bound rather than over-interpret,
and a response faster than months would itself be an informative result.

=== Aim 3. Determine whether host provisioning of the microbiome persists across weaning, and how it competes with dietary fiber.

Our dietary metadata is too coarse to quantify fiber intake.
I will therefore read the resource environment off the community itself.
Carbohydrate-active enzyme repertoires distinguish the two axes directly:
host and milk glycan foraging is carried by GH33 sialidases, GH29 and GH95 fucosidases, GH2 beta-galactosidases, and GH20 hexosaminidases,
while plant polysaccharide foraging is carried by families including GH5 and GH9 cellulases, GH10 and GH11 xylanases, GH51 arabinofuranosidases, and pectate lyases.
The functional profile is a more direct measure of what the community is eating than any questionnaire.

To determine whether host provisioning persists, I will test whether taxonomic turnover across weaning exceeds functional turnover in host-glycan foraging genes.
If the host continues to feed its microbiome through mucin, the glycan-foraging capacity should outlive the taxa that carried it before the transition.
Specifically, HMO specialists that cannot use mucin (*B. longum* subsp. *infantis*, which lacks the necessary transporters) should decline steeply,
while taxa capable of both (*B. bifidum*, *Bacteroides* spp., *A. muciniphila*) should persist or increase,
and the aggregate abundance of host-glycan enzyme families should fall considerably less than the abundance of the pre-weaning taxa carrying them.

To determine how the intrinsic and extrinsic axes compete, I will compare their conservation across populations.
This yields a prediction that would explain our own prior result.
The host-provided resource is universal;
the dietary resource is not.
If host provisioning is doing real work after weaning,
then host-glycan foraging capacity should be *more conserved across the twelve-country dataset and across the Mennonite, Rochester, Cape Town, and Malawi contrasts*
than plant-glycan foraging capacity, which should track diet and geography.
Under this hypothesis, the universality of succession that we reported in 2025 is carried by the host-provisioned component,
and the variability by the dietary one.
This is directly testable by partitioning the variance in each functional module across populations.

*Expected outcome:* evidence for or against the proposition that the host's evolved investment in feeding its microbiome extends past infancy.
A positive result identifies mucin glycan foraging as a persistent host lever on community composition and a plausible intervention target.
A negative result, in which host-glycan capacity collapses with the taxa that carried it, is equally informative,
and would mean the post-weaning community is governed principally by diet.

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
