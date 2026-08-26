== title

A press-perturbation model of the weaning gut microbiome

== Most significant research
// Briefly describe your most significant research contribution to date.
// 1400 characters

A throughline of my work for the past 7 years has been understanding the infant gut microbiome and how it shapes early brain development. I led three studies showing this association. In 381 healthy US children, I showed that microbial taxa and genes are associated with cognition and with the size of specific brain regions, and that machine-learning models can predict brain volumes from microbial profiles (Science Advances, 2023). In 194 South African infants followed across the first 18 months, I showed that microbial genes for metabolizing neuroactive compounds, measured near four months of age, are associated with the later maturation of visual neural circuitry measured by EEG (mBio, 2025). With colleagues I extended this to behavior, linking the infant microbiome to social behaviors associated with autism risk (Molecular Autism, 2024). Interpreting such associations requires knowing what normal microbial development looks like, so I also helped establish that succession follows conserved patterns across more than 1,800 infants in twelve countries (Nature Communications, 2025), and I have built open-source software to measure the infant microbiome rigorously, including targeted detection of the HMO specialist Bifidobacterium infantis. This work shows the early microbiome matters for the brain; my proposal asks how it develops, so we can understand why.

== Proposal focus
//Please provide a brief description of the overall focus of your Pew proposal in the space provided.
// 275 characters
I will model the infant gut microbiome's response to weaning as an ecological perturbation, testing whether time relative to the loss of milk and arrival of solid food explains succession better than age, and whether the host keeps feeding its microbiome even after weaning.

== Innovative approach
// Highlight the most innovative and novel aspects of your proposed research. Describe a risky or creative approach you might use in pursuit of your goals.
// 1400 characters
The central innovation is to stop treating infant microbiome development as a function of age and to model it as the community's response to a specific environmental perturbation. Weaning changes two resources at once: the host-supplied milk oligosaccharides and the diet-supplied plant fiber. Because their timing varies across infants, their effects should be separable.

The creative and risky element is how I handle the fact that the exact timing of weaning is rarely recorded. Cohorts typically note only whether each transition has yet occurred. Rather than treat this as missing data, I will make it central to the model, and test it by inferring each infant's transition times as latent variables from microbial composition. If the microbiome carries information about how long it has been since weaning, the model should date the transition more precisely than the metadata allows. An age-based clock cannot do this, so the model's ability to recover the timing becomes a direct falsification test of my hypothesis.

The most speculative prediction is that host resource provisioning to the microbiome does not end at weaning but switches substrate from milk glycans to mucin. If true, host-glycan foraging capacity in gut microbes should persist even as the taxa carrying it are replaced, revealing a lever on the microbiome that has been hidden in plain sight.

== Background and past experiences
// The program aims to support both the research and the researcher. Please describe how your personal background and/or scientific training have helped you stand out in your approach to science and your career
// 1400 characters

I was trained first as an experimental immunologist, studying innate immune signaling at the level of individual proteins and lipids, before moving into computational microbial ecology, epidemiology, and software development during my postdoctoral work. That path is unusual, and it shapes how I approach problems by constantly shifting perspective in spatial scales from molecules to ecosystems and in temporal scales from instantaneous interactions to evolutionary arms races. It also means I treat computational tools like any other experiment -- the method must match the question, and I will build the tools a question needs instead of forcing the question into the tools that exist. 

That tool-building has been a throughline of my career. I write and maintain open-source software for microbiome analysis with the specific goal of  bench scientists use methods that would otherwise require a computational collaborator. I believe methods developed using public or philanthropic funds should be provided as shared infrastructure rather than held for private advantage. Indeed, I have been recognized for efforts to broaden participation in scientific computing, and am an active participant in the open source julia community. The reference model I propose here will not be complete in my eyes unless it is something the whole field can use as production model to ground their own analyses.

== Abstract

The infant gut microbiome assembles over the first years of life through a chaotic but predictable ecological succession. This process matters for health, since disruptions to the early microbiome are linked to immune, metabolic, and neurodevelopmental outcomes that persist well beyond infancy. My own work has shown that succession follows conserved patterns across 1,800 infants from twelve countries, and that the microbial genes present in early infancy are associated with cognition and brain development.

Yet efforts to relate the microbiome to child development are undermined by the fact that the community itself is in constant flux, driven largely by a single dramatic shift around six months of age, when infants stop exclusive milk feeding and begin solid food. Existing models treat this as a nuisance, indexing development on chronological age and relegating diet to a covariate. Yet succession is a response to a changing environment, and the largest environmental change of infancy has a measurable date for every infant.

The innovation of this proposal is to model succession as the community's response to environmental perturbation rather than as a function of age. In ecology, a press perturbation is a permanent change in conditions; weaning is the archetype. It changes two resources at once: an intrinsic resource supplied by the host (human milk oligosaccharides, which feed a specialized microbial community) and an extrinsic resource supplied by diet (plant fiber). Because the timing of milk cessation and solid-food introduction varies across infants, their effects can be statistically separated, a natural experiment that occurs in every child but that no age-indexed model exploits.

Using over 5,000 shotgun metagenomes already in hand, I will build a model grounded in ecological theory that treats each infant's transition times as latent variables and tests whether time relative to each perturbation explains succession better than age. I will then ask whether the response to each perturbation is mediated by its glycan resource, reading carbohydrate-active enzyme content directly from the metagenomes. A key hypothesis is that host provisioning does not cease at weaning but switches substrate from milk oligosaccharides to mucin, so that host-glycan foraging capacity persists even as the taxa carrying it turn over.

This work will provide the first quantitative, ecological account of infant microbiome development, establishing a framework that generalizes beyond weaning to the dietary changes, medications, and diseases that reshape the microbiome throughout life.

== Three papers

=== Paper 1

Bonham KS, Margolis ET, Fahur Bottino G, Sobrino AC, Patel F, McCann S, Zieff MR, Miles M, Herr D, Davel L, Bosco C, Khula South African Data Collection Team, Huttenhower C, Pini N, Alexander DC, Jones DK, Williams SCR, Amso D, Gladstone M, Fifer WP, Donald KA, Gabard-Durnam LJ, Klepac-Ceraj V. Codevelopment of gut microbial metabolism and visual neural circuitry over human infancy. mBio. 2025;16(8):e00835-25. doi:10.1128/mbio.00835-25

This study established, in a longitudinal cohort of 194 South African infants, that microbial genes for metabolizing neuroactive compounds are prospectively associated with the maturation of visual neural circuitry measured by EEG, with gene sets around four months of age predicting visual-evoked potentials months later more strongly than concurrently measured genes. It is among the first direct, gene-level demonstrations that early microbial metabolism tracks subsequent human brain development, moving the field past coarse taxonomic association. It is also the immediate inspiration for this proposal. We could not use the full scope of our data for lack of a quantitative model of development, and instead subset it into narrow time windows to avoid confounding with age. The ecological model proposed here would let us use the entire trajectory and make higher-fidelity associations, potentially enabling the identification of biomarkers of delayed development or micrbial intervention targets.

=== Paper 2

Bonham KS, Wolfe BE, Dutton RJ. Extensive horizontal gene transfer in cheese-associated bacteria. eLife. 2017;6:e22144. doi:10.7554/eLife.22144

Using cheese rind as a tractable model microbiome, I identified over 4,700 horizontally transferred genes across 165 bacterial genomes and showed that the most widely shared were nutrient-acquisition systems, particularly iron-siderophore transport, under strong selection in this environment. The work demonstrated that mapping which genes move within a community reveals the selective forces shaping it. It reflects the core disposition behind this proposal, that we can treat a microbiome as an ecosystem under selection and read its history off its gene content. 

This project was also my first largely computational project, and reflects my early commitment to open source. While my software engineering skills were rudimentary at the time, I made an effort to ensure that the software that identified these HGT events was open-source and accessible as an extensible tool for others to use.

=== Paper 3

Bonham KS, Orzalli MH, Hayashi K, Wolf AI, Glanemann C, Weninger W, Iwasaki A, Knipe DM, Kagan JC. A promiscuous lipid-binding protein diversifies the subcellular sites of Toll-like receptor signal transduction. Cell. 2014;156(4):705-716. doi:10.1016/j.cell.2014.01.019

This study overturned two prevailing views: that the sorting adaptor TIRAP acts only at the plasma membrane, and that phosphoinositide-binding proteins are highly specific. We showed that TIRAP's promiscuous lipid binding lets it assemble the TLR signaling complex at both the cell surface and endosomes, explaining how a single adaptor supports Toll-like receptor signaling from multiple organelles. It resolved a standing question about the spatial organization of innate immune signaling, but pursuing this project required trusting experimental results that contradicted established dogma. My advisors' principled approach to "doing the next best experiment", as well as his emphasis in grounding models in theory and evolution, remain foundational pillars of my scientific approach. This work grounds me in molecular immunology and mechanistic experimental biology, and provides perspective on the limits of computational microbiome science. I intend to hold onto this perspective as I move from ecological description toward mechanistic understanding of how the gut microbiome shapes development of the immune system and brain. 
