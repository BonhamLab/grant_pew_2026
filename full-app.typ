

== 1. Background and significance

The gut microbiome assembles over the first years of life
through a chaotic but predictable ecological succession.
Pioneer colonizers arrive at birth,
expand under the selective pressure of a milk diet,
and are progressively replaced by a more diverse, adult-like community.
Disruptions to this process have been linked
to immune, metabolic, and neurodevelopmental outcomes that
persist well beyond infancy.
My previous work has sought to investigate both ends of this picture.
We showed that succession follows conserved patterns
across 1,827 infants from 12 countries,
consistent enough that microbial composition alone predicts a child's age
to within about 2.5 months (Fahur Bottino et al., 2025).
We also showed that the species present in the first six months of life,
and the neuroactive gene products they encode,
are associated with cognitive scores,
brain morphology by MRI,
and maturation of visual neural circuitry by EEG
(Bonham et al., 2023; Bonham et al., 2025).

While that work described relationships along this trajectory,
it does not explain how host development should affect microbial succession.
Age predicts the microbiome remarkably well in this time window,
and a one-year-old differs from a three-month-old in many ecologically-relevant ways
including gut pH, immune tone, transit time, and mucosal secretions.
However, the strongest candidate for the engine of succession
is a specific, near-universal environmental event,
namely the end of exclusive milk feeding and the introduction of solid food.
Indeed,  in the TEDDY cohort,
receipt of breast milk was the single largest factor
associated with microbiome structure,
and cessation of breast milk accelerated maturation (Stewart et al., 2018).

Weaning changes the gut's resource supply along two axes at once,
and the distinction between them is the conceptual center of this proposal.
The first axis is **intrinsic** (supplied by the host).
Human milk oligosaccharides (HMOs) are indigestible by the infant
and are instead metabolized by a small set of adapted microbes,
most notably _Bifidobacterium longum_ subsp. _infantis_.
In other words, they are an evolved mechanism
by which mothers feed their infant's microbiome,
and their metabolic cost is strong evidence that selection
has acted on the composition of the infant gut community.
The second axis is **extrinsic** (supplied by diet).
Solid foods introduce plant polysaccharides,
and dietary fiber is among the most powerful known modulators
of gut community composition at every age.

At weaning, the intrinsic resource appears to be withdrawn
and the extrinsic resource arrives.
But the host does not stop feeding its microbiome.
Mucin O-glycans are secreted into the gut throughout life,
are built from the same monosaccharides as HMOs
(fucose, sialic acid, galactose, N-acetylglucosamine) in similar linkages,
and are degraded by overlapping bacterial enzyme families including GH33 sialidases,
GH29 and GH95 fucosidases, and GH2 beta-galactosidases (Kelly et al., 2023).
_Akkermansia muciniphila_, a mucin specialist, grows on HMOs.
_Bacteroides_ species induce the same gene sets for both substrates.
_B. infantis_, by contrast, lacks the transporters to use mucin at all.
Host provisioning may therefore continue past weaning by a different route,
with a different set of beneficiaries,
in competition with the arriving dietary resource.

Early life contains three ecologically distinct regimes.
The first is **assembly**, from birth through roughly the first month,
when a near-empty gut is colonized under conditions of high turnover and strong priority effects.
The second is a **milk-adapted quasi-stable state**.
The third is the **weaning press**, when the resource base changes permanently.
These are not the same kind of problem.
Assembly cannot be framed as a perturbation because there is no established community to perturb,
and it is sparsely sampled in nearly every existing cohort.
The weaning transition, by contrast, is well sampled, has a recorded date in most cohorts,
and is the point at which individual trajectories most plausibly begin to diverge.
It is the tractable entry point,
and I address it here.

== 2. Gap and hypothesis

**Key gap:** Existing models of infant microbiome development are indexed on chronological age.
Whether they are machine-learning age predictors (Fahur Bottino et al., 2025; Subramanian et al., 2014)
or the recent generation of probabilistic longitudinal models that treat covariates
as smooth modulators of a time trend (Cheng et al., 2019; Yuan et al., 2026),
they organize the data around age and treat diet as a nuisance covariate.
This inverts the biology.
Succession is a response to a changing environment,
and the largest environmental change of infancy has a measurable date.
No framework indexes succession on the perturbation itself,
and as a consequence we have no quantitative description of how the infant gut responds to the defining ecological event of early life,
nor of what the host contributes to the community that emerges from it.

**The long-term goal of this project is to understand early-life microbial succession
as a sequence of responses to environmental perturbation,
rather than as an autonomous developmental clock.**
The immediate objective is to use the weaning transition as a natural experiment
to characterize how the gut ecosystem responds to a permanent change in its resource supply,
and to determine how that response is divided between host-provided and diet-provided resources.

**I hypothesize that the introduction of solid food acts as a press perturbation on the infant gut ecosystem;
that the timing, magnitude, and resolution of the community's response
explains early-life succession better than chronological age does;
and that host glycan provisioning does not cease at weaning but switches substrate from milk oligosaccharides to mucin,
where it competes with dietary fiber to shape the emerging community.**

Ecologists distinguish a *press* perturbation, a permanent change in conditions that moves a community to a new equilibrium,
from a *pulse*, a transient disturbance from which a community may return (Bender et al., 1984).
The microbiome literature tends to treat all exposures alike.
Weaning is the archetypal press:
the resource that sustained the pioneer community is withdrawn and does not return.
Antibiotic exposure is the archetypal pulse.
Treating both as instances of a common framework, with distinguishable signatures,
is the organizing idea of this program.

The design insight that makes the question tractable is that weaning timing varies across infants,
typically six months plus or minus one to two months,
while chronological age does not.
That natural variation decorrelates the two clocks and makes their effects separable.

== 3. Research strategy

I have roughly 4,000 shotgun metagenomes from the first three years of life in hand.
These include the twelve-country dataset from Fahur Bottino et al. (2025),
the Cape Town and Malawi arms of the Khula cohort,
and about 400 samples from 300 children in a cohort contrasting Old Order Mennonite and urban Rochester families.
Feeding status is recorded for most participants, though coarsely:
exclusive breastfeeding, exclusive formula, or mixed, and solid foods yes or no.
I restrict this work to shotgun metagenomes,
which give species and gene-level resolution and avoid the substantial difficulties of reconciling amplicon data across studies.
Per-individual sampling is sparse,
so all analyses estimate population-level dynamics by pooling across children rather than fitting dynamical systems to single infants.

=== Aim 1. Determine whether succession is governed by a developmental clock or by response to environmental transition.

To determine which axis organizes succession, I will fit models that decompose microbial composition
into an age component and a transition-response component
and compare their explanatory power.
For infant *i* and taxon *j*, I will model the latent log-ratio abundance as

$η_ij(t) = f_j(t) + g_j(t − w_i) + b_ij + ε_ij(t)$

where $t$ is chronological age,
$w_i$ is the child's weaning time,
$f_j$ is a shared function of age,
$g_j$ is a shared function of time relative to the transition,
and $b_ij$ is a subject-level random effect.
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
the **displacement** (how far the community moves),
the **relaxation time** (how long until it settles into a new quasi-stationary state),
the **transient variance** (whether between-infant variability rises during the transition, indicating a window of reduced stability),
and the **dependence of the endpoint on the starting state**
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
If host provisioning is doing real work after weaning, then host-glycan foraging capacity should be **more conserved across the twelve-country dataset and across the Mennonite, Rochester, Cape Town, and Malawi contrasts**
than plant-glycan foraging capacity, which should track diet and geography.
Under this hypothesis, the universality of succession that we reported in 2025 is carried by the host-provisioned component,
and the variability by the dietary one.
This is directly testable by partitioning the variance in each functional module across populations.

*Expected outcome:* evidence for or against the proposition that the host's evolved investment in feeding its microbiome extends past infancy.
A positive result identifies mucin glycan foraging as a persistent host lever on community composition and a plausible intervention target.
A negative result, in which host-glycan capacity collapses with the taxa that carried it, is equally informative,
and would mean the post-weaning community is governed principally by diet.

== 4. Future directions

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

== 5. Expected impact

This project reframes early-life microbiome development from a description of what happens when to an ecological account of why.
If succession is best understood as a response to environmental transition, then the transition, not the calendar,
is where individual variation originates and where intervention should be aimed.
The framework is general:
press and pulse perturbations recur throughout life as dietary change, migration, antibiotics, and disease,
and a validated perturbation-response description of the best-characterized transition in human life provides a template for the rest.
Framing the transition as a competition between host-provided and diet-provided resources also connects population-scale metagenomics to the evolutionary question of what the host is selecting for,
and to the experimental work on infant-associated microbial physiology that my lab is pursuing in parallel.

== 6. Personal significance

*[Placeholder. Threads to draw on: I am the father of two children, both delivered by cesarean section, one with eczema,
and like all parents we struggled to know what was best for them at exactly the moments this proposal studies.
More broadly, I am drawn to what evolution reveals about hard biological questions,
and the fact that we evolved to feed our infants' microbes with a costly, indigestible sugar is among the most striking examples I know.
Whether that evolutionary pressure simply stops when a child starts eating solid food seems unlikely to me,
and worth finding out.]*

---


#bibliography("refs.bib", title: none, style: "apa")
