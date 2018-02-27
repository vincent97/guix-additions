;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 Roel Janssen <roel@gnu.org>
;;;
;;; This file is not officially part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (umcu packages bioconductor)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system r)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bioinformatics)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cran)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web))

(define-public r-rmisc
  (package
  (name "r-rmisc")
  (version "1.5")
  (source
    (origin
      (method url-fetch)
      (uri (cran-uri "Rmisc" version))
      (sha256
        (base32
          "1ijjhfy3v91fspid77rrkc5dkcb2lav37wc3f4k5lwrn24wzy5y8"))))
  (properties `((upstream-name . "Rmisc")))
  (build-system r-build-system)
  (propagated-inputs
   `(("r-plyr" ,r-plyr)
     ("r-rcpp" ,r-rcpp)
     ("r-lattice" ,r-lattice)))
  (home-page
    "http://cran.r-project.org/web/packages/Rmisc")
  (synopsis "Rmisc: Ryan Miscellaneous")
  (description "The Rmisc library contains functions for data analysis and
utility operations.")
  (license license:gpl3)))

(define-public r-pastecs
  (package
    (name "r-pastecs")
    (version "1.3-18")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "pastecs" version))
              (sha256
               (base32
                "0ixlnc1psgqgm71bsf5z5j65lvr92ghpsk9f1ifm94dzjhi6d22i"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)))
    (home-page "http://www.sciviews.org/pastecs")
    (synopsis "Analysis of space-time ecological series")
    (description
     "Regulation, decomposition and analysis of space-time series.  The
pastecs library is a PNEC-Art4 and IFREMER initiative to bring PASSTEC 
2000 (http://www.obs-vlfr.fr/~enseigne/anado/passtec/passtec.htm)
functionalities to R.")
    (license license:gpl2+)))

(define-public r-gviz
  (package
    (name "r-gviz")
    (version "1.22.1")
    (source (origin
              (method url-fetch)
              (uri (bioconductor-uri "Gviz" version))
              (sha256
               (base32
                "182f88s18vx7wkd6s4sy4bvrkn81733ha9pfiifya92c2ipb6jan"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-s4vectors" ,r-s4vectors)
       ("r-iranges" ,r-iranges)
       ("r-genomicranges" ,r-genomicranges)
       ("r-xvector" ,r-xvector)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-biomart" ,r-biomart)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-biobase" ,r-biobase)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-bsgenome" ,r-bsgenome)
       ("r-biostrings" ,r-biostrings)
       ("r-biovizbase" ,r-biovizbase)
       ("r-rsamtools" ,r-rsamtools)
       ("r-latticeextra" ,r-latticeextra)
       ("r-matrixstats" ,r-matrixstats)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-digest" ,r-digest)))
    (home-page "http://bioconductor.org/packages/Gviz")
    (synopsis "Plotting data and annotations along genomic coordinates")
    (description "This package uses the biomaRt and the rtracklayer packages to
perform live annotation queries to Ensembl and UCSC and translates this to e.g.
gene/transcript structures in viewports of the grid graphics package.  This
results in genomic information plotted together with your data.")
    (license license:artistic2.0)))

(define-public r-amap
  (package
    (name "r-amap")
    (version "0.8-14")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "amap" version))
              (sha256
               (base32
                "1dz37z9v4zvyvqrs4xvpfv468jwvpxav60qn2w0049bw8llj6xdl"))))
    (build-system r-build-system)
    (inputs
     `(("gfortran" ,gfortran)))
    (home-page "http://mulcyber.toulouse.inra.fr/projects/amap/")
    (synopsis "Another multidimensional analysis package")
    (description "Tools for clustering and principal component analysis (with
robust methods, and parallelized functions).")
    (license license:gpl2+)))

(define-public r-diffbind
  (package
    (name "r-diffbind")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "DiffBind" version))
       (sha256
        (base32
         "1i6s1hxhcw0x7c2mhi297dcq89d0r4j30k83gxg27yaxjswni4b5"))))
    (properties `((upstream-name . "DiffBind")))
    (build-system r-build-system)
    (inputs
     `(("zlib" ,zlib)))
    (propagated-inputs
     `(("r-amap" ,r-amap)
       ("r-biocparallel" ,r-biocparallel)
       ("r-deseq2" ,r-deseq2)
       ("r-dplyr" ,r-dplyr)
       ("r-edger" ,r-edger)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-ggrepel" ,r-ggrepel)
       ("r-gplots" ,r-gplots)
       ("r-iranges" ,r-iranges)
       ("r-lattice" ,r-lattice)
       ("r-limma" ,r-limma)
       ("r-locfit" ,r-locfit)
       ("r-rcolorbrewer" , r-rcolorbrewer)
       ("r-rcpp" ,r-rcpp)
       ("r-rsamtools" ,r-rsamtools)
       ("r-s4vectors" ,r-s4vectors)
       ("r-systempiper" ,r-systempiper)
       ("r-zlibbioc" ,r-zlibbioc)))
    (home-page "http://bioconductor.org/packages/DiffBind")
    (synopsis "Differential binding analysis of ChIP-Seq peak data")
    (description
     "This package computes differentially bound sites from multiple
ChIP-seq experiments using affinity (quantitative) data.  Also enables
occupancy (overlap) analysis and plotting functions.")
    (license license:lgpl3+)))

(define-public r-ripseeker
  (package
    (name "r-ripseeker")
    (version "1.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "RIPSeeker" version))
       (sha256
        (base32
         "0bqkzwrncww7il36273chkd3gfxmii7p566ycki9qij419pwr35y"))))
    (properties `((upstream-name . "RIPSeeker")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-s4vectors" ,r-s4vectors)
       ("r-iranges" ,r-iranges)
       ("r-genomicranges" ,r-genomicranges)
       ("r-summarizedexperiment" ,r-summarizedexperiment)
       ("r-rsamtools" ,r-rsamtools)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-rtracklayer" ,r-rtracklayer)))
    (home-page "http://bioconductor.org/packages/RIPSeeker")
    (synopsis
     "Identifying protein-associated transcripts from RIP-seq experiments")
    (description
     "This package infers and discriminates RIP peaks from RIP-seq alignments
using two-state HMM with negative binomial emission probability.  While
RIPSeeker is specifically tailored for RIP-seq data analysis, it also provides
a suite of bioinformatics tools integrated within this self-contained software
package comprehensively addressing issues ranging from post-alignments
processing to visualization and annotation.")
    (license license:gpl2+)))

(define-public r-multtest
  (package
    (name "r-multtest")
    (version "2.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "multtest" version))
       (sha256
        (base32
         "0n11rd49xl2vn3ldmfips7d3yb70l8npjcqsxyswr9ypjhgzkv9j"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-survival" ,r-survival)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-biobase" ,r-biobase)
       ("r-mass" ,r-mass)))
    (home-page "http://bioconductor.org/packages/multtest")
    (synopsis "Resampling-based multiple hypothesis testing")
    (description
     "Non-parametric bootstrap and permutation resampling-based multiple
testing procedures (including empirical Bayes methods) for controlling the
family-wise error rate (FWER), generalized family-wise error rate (gFWER),
tail probability of the proportion of false positives (TPPFP), and false
discovery rate (FDR).  Several choices of bootstrap-based null distribution
are implemented (centered, centered and scaled, quantile-transformed).  
Single-step and step-wise methods are available.  Tests based on a variety of
t- and F-statistics (including t-statistics based on regression parameters
from linear and survival models as well as those based on correlation
parameters) are included.  When probing hypotheses with t-statistics, users
may also select a potentially faster null distribution which is multivariate
normal with mean zero and variance covariance matrix derived from the vector
influence function.  Results are reported in terms of adjusted p-values,
confidence regions and test statistic cutoffs.  The procedures are directly
applicable to identifying differentially expressed genes in DNA microarray
experiments.")
    (license license:lgpl3)))

(define-public r-regioner
  (package
    (name "r-regioner")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "regioneR" version))
       (sha256
        (base32
         "1vprp3l929hwzmvgskbhawfgnrymwc9n2rxd16rgagnv1dxnjxfp"))))
    (properties `((upstream-name . "regioneR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-memoise" ,r-memoise)
       ("r-genomicranges" ,r-genomicranges)
       ("r-bsgenome" ,r-bsgenome)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-iranges" ,r-iranges)))
    (home-page "http://bioconductor.org/packages/regioneR")
    (synopsis
     "Association analysis of genomic regions based on permutation tests")
    (description
     "This package offers a statistical framework based on customizable
permutation tests to assess the association between genomic region sets
and other genomic features.")
    (license license:artistic2.0)))

(define-public r-idr
  (package
    (name "r-idr")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "idr" version))
              (sha256
               (base32
                "05nvgw1xdg670bsjjrxkgd1mrdkciccpw4krn0zcgdf2r21dzgwb"))))
    (build-system r-build-system)
    (home-page "http://cran.r-project.org/web/packages/idr")
    (synopsis "Irreproducible discovery rate")
    (description
     "This is a package for estimating the copula mixture model and plotting
correspondence curves in \"Measuring reproducibility of high-throughput
experiments\" (2011), Annals of Applied Statistics, Vol. 5, No. 3, 1752-1779,
by Li, Brown, Huang, and Bickel")
    (license license:gpl2+)))

(define-public r-venndiagram
  (package
    (name "r-venndiagram")
    (version "1.6.18")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "VennDiagram" version))
              (sha256
               (base32
                "05vhsk5ylspa6b919gk9v4rbwm9sc4lsfq0wz308a8dilkg8cqpa"))))
    (properties `((upstream-name . "VennDiagram")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-futile-logger" ,r-futile-logger)))
    (home-page "http://cran.r-project.org/web/packages/VennDiagram")
    (synopsis "Generate High-Resolution Venn and Euler Plots")
    (description
     "This package provides a set of functions to generate high-resolution
Venn and Euler plots.  Includes handling for several special cases, including
two-case scaling, and extensive customization of plot shape and structure.")
    (license license:gpl2+)))

(define-public r-chippeakanno
  (package
    (name "r-chippeakanno")
    (version "3.12.4")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "ChIPpeakAnno" version))
       (sha256
        (base32
         "0mnz79kmkmjxx88rxranfri6y6q7zy823ljs1gljz6iz4gvgdj02"))))
    (properties `((upstream-name . "ChIPpeakAnno")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-go-db" ,r-go-db)
       ("r-biomart" ,r-biomart)
       ("r-bsgenome" ,r-bsgenome)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-matrixstats" ,r-matrixstats)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-limma" ,r-limma)
       ("r-multtest" ,r-multtest)
       ("r-rbgl" ,r-rbgl)
       ("r-graph" ,r-graph)
       ("r-biocinstaller" ,r-biocinstaller)
       ("r-regioner" ,r-regioner)
       ("r-dbi" ,r-dbi)
       ("r-ensembldb" ,r-ensembldb)
       ("r-biobase" ,r-biobase)
       ("r-seqinr" ,r-seqinr)
       ("r-idr" ,r-idr)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-summarizedexperiment" ,r-summarizedexperiment)
       ("r-rsamtools" ,r-rsamtools)
       ("r-venndiagram" ,r-venndiagram)))
    (home-page "http://bioconductor.org/packages/ChIPpeakAnno")
    (synopsis
     "Batch annotation of peaks identified from ChIP-seq and ChIP-chip experiments")
    (description
     "The package includes functions to retrieve the sequences around the peak,
obtain enriched Gene Ontology (GO) terms, find the nearest gene, exon, miRNA or
custom features such as most conserved elements and other transcription factor
binding sites supplied by users.  Starting 2.0.5, new functions have been added
for finding the peaks with bi-directional promoters with summary statistics
(peaksNearBDP), for summarizing the occurrence of motifs in peaks 
(summarizePatternInPeaks) and for adding other IDs to annotated peaks or
enrichedGO (addGeneIDs). This package leverages the biomaRt, IRanges, Biostrings,
BSgenome, GO.db, multtest and stat packages.")
    (license license:gpl2+)))

(define-public r-marray
  (package
   (name "r-marray")
   (version "1.56.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "marray" version))
            (sha256
             (base32 "14c93i86yc7jn4ax8p4l0z6v9xisw1bv7gzb4a0gbxhxn7mddaic"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biobase" ,r-biobase)
      ("r-limma" ,r-limma)))
   (home-page "http://bioconductor.org/packages/marray")
   (synopsis "Exploratory analysis for two-color spotted microarray data")
   (description "This package contains class definitions for two-color spotted
microarray data.  Fuctions for data input, diagnostic plots, normalization and
quality checking.")
   (license license:lgpl2.0+)))

(define-public r-cghbase
  (package
   (name "r-cghbase")
   (version "1.38.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "CGHbase" version))
            (sha256
             (base32 "0fynvcsjdbgp69i0nxrc8ni58rhb1kx9k5r3nb91n9i8s43gjqlm"))))
   (properties `((upstream-name . "CGHbase")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biobase" ,r-biobase)
      ("r-marray" ,r-marray)))
   (home-page "http://bioconductor.org/packages/CGHbase")
   (synopsis "Base functions and classes for arrayCGH data analysis")
   (description "This package contains functions and classes that are needed by
arrayCGH packages.")
   (license license:gpl2+)))

(define-public r-snowfall
  (package
   (name "r-snowfall")
   (version "1.84-6.1")
   (source (origin
            (method url-fetch)
            (uri (cran-uri "snowfall" version))
            (sha256
             (base32 "13941rlw1jsdjsndp1plzj1cq5aqravizkrqn6l25r9im7rnsi2w"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-snow" ,r-snow)))
   (home-page "http://cran.r-project.org/web/packages/snowfall")
   (synopsis "Easier cluster computing (based on snow).")
   (description "Usability wrapper around snow for easier development of
parallel R programs.  This package offers e.g. extended error checks, and
additional functions.  All functions work in sequential mode, too, if no
cluster is present or wished.  Package is also designed as connector to
the cluster management tool sfCluster, but can also used without it.")  
   (license license:gpl2+)))

(define-public r-cghcall
  (package
   (name "r-cghcall")
   (version "2.40.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "CGHcall" version))
            (sha256
             (base32 "11pi6awz3858yb4s0z3qf3kcmsdgp6d4aj41g4lfix1sv5amllch"))))
   (properties `((upstream-name . "CGHcall")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biobase" ,r-biobase)
      ("r-cghbase" ,r-cghbase)
      ("r-impute" ,r-impute)
      ("r-dnacopy" ,r-dnacopy)
      ("r-snowfall" ,r-snowfall)))
   (home-page "http://bioconductor.org/packages/CGHcall")
   (synopsis "Base functions and classes for arrayCGH data analysis")
   (description "This package contains functions and classes that are needed by
arrayCGH packages.")
   (license license:gpl2+)))

(define-public r-qdnaseq
  (package
   (name "r-qdnaseq")
   (version "1.14.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "QDNAseq" version))
            (sha256
             (base32 "0lgbv4s0xqgrs7q6ynb3c273sf7pyrp51jnc8ravq1z5g0a2zshy"))))
   (properties `((upstream-name . "QDNAseq")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biobase" ,r-biobase)
      ("r-cghbase" ,r-cghbase)
      ("r-cghcall" ,r-cghcall)
      ("r-dnacopy" ,r-dnacopy)
      ("r-genomicranges" ,r-genomicranges)
      ("r-iranges" ,r-iranges)
      ("r-matrixstats" ,r-matrixstats)
      ("r-r-utils" ,r-r-utils)
      ("r-rsamtools" ,r-rsamtools)))
   (home-page "http://bioconductor.org/packages/QDNAseq")
   (synopsis "Quantitative DNA sequencing for chromosomal aberrations")
   (description "The genome is divided into non-overlapping fixed-sized bins,
number of sequence reads in each counted, adjusted with a simultaneous
two-dimensional loess correction for sequence mappability and GC content, and
filtered to remove spurious regions in the genome.  Downstream steps of
segmentation and calling are also implemented via packages DNAcopy and CGHcall,
respectively.")
   (license license:gpl2+)))

(define-public r-funcisnp-data
  (package
   (name "r-funcisnp-data")
   (version "1.14.0")
   (source (origin
            (method url-fetch)
            (uri (string-append "http://bioconductor.org/packages/release/"
                                "data/experiment/src/contrib/FunciSNP.data_"
                                version ".tar.gz"))
            (sha256
             (base32 "0zsffyhd9nxsg3a34sd2mycbvs8dsw96pqn1jj7zw5whldjihjwh"))))
   (properties `((upstream-name . "FunciSNP.data")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-iranges" ,r-iranges)
      ("r-rtracklayer" ,r-rtracklayer)))
   (home-page "http://bioconductor.org/packages/FunciSNP.data")
   (synopsis "Various data sets for use with the FunciSNP package")
   (description "This package provides data sets needed for FunciSNP to
integrate information from GWAS, 1000genomes and chromatin feature, in
order to identify functional SNP in coding or non-coding regions.")
   (license license:gpl3+)))

(define-public r-funcisnp
  (package
   (name "r-funcisnp")
   (version "1.22.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "FunciSNP" version))
            (sha256
             (base32 "1lgvca8npk1092dyl5jhx46ir46b3ab5jgshj5b19dg0bdzi0fj1"))))
   (properties `((upstream-name . "FunciSNP")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-ggplot2" ,r-ggplot2)
      ("r-txdb-hsapiens-ucsc-hg19-knowngene" ,r-txdb-hsapiens-ucsc-hg19-knowngene)
      ("r-funcisnp-data" ,r-funcisnp-data)
      ("r-biocgenerics" ,r-biocgenerics)
      ("r-biobase" ,r-biobase)
      ("r-s4vectors" ,r-s4vectors)
      ("r-iranges" ,r-iranges)
      ("r-genomicranges" ,r-genomicranges)
      ("r-rsamtools" ,r-rsamtools)
      ("r-rtracklayer" ,r-rtracklayer)
      ("r-chippeakanno" ,r-chippeakanno)
      ("r-variantannotation" ,r-variantannotation)
      ("r-plyr" ,r-plyr)
      ("r-snpstats" ,r-snpstats)
      ("r-reshape" ,r-reshape)
      ("r-scales" ,r-scales)))
   (home-page "http://bioconductor.org/packages/FunciSNP")
   (synopsis "Identification of candidate regulatory SNPs")
   (description "This package integrates information from GWAS, 1000genomes
and chromatin feature to identify functional SNP in coding or non-coding
regions.")
   (license license:gpl3+)))

(define-public r-pasilla
  (package
    (name "r-pasilla")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://bioconductor.org/packages/release/data/experiment"
                    "/src/contrib/pasilla_" version ".tar.gz"))
              (sha256
               (base32
                "0h6ll2csja5vnmylazb1qklz7ybk5hn0nxgkvxhhsmyqk9w7gk6m"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dexseq" ,r-dexseq)
       ("r-biocstyle" ,r-biocstyle)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-knitr" ,r-knitr)))
    (home-page "http://bioconductor.org/packages/pasilla/")
    (synopsis "Data package with per-exon and per-gene read counts")
    (description "This package provides per-exon and per-gene read counts
computed for selected genes from RNA-seq data that were presented in the
article 'Conservation of an RNA regulatory map between Drosophila and mammals'
by Brooks et al., Genome Research 2011.")
    (license license:lgpl2.1+)))

(define-public r-grimport
  (package
    (name "r-grimport")
    (version "0.9-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "grImport" version))
       (sha256
        (base32
         "1d8fd7502qj7cirjqdkr1qj51rylw2fz5hs06avfvc2dxs2xwfw1"))))
    (properties `((upstream-name . "grImport")))
    (build-system r-build-system)
    (inputs
     `(("ghostscript" ,ghostscript)))
    (propagated-inputs
     `(("r-xml" ,r-xml)))
    (home-page "http://cran.r-project.org/web/packages/grImport")
    (synopsis "Importing Vector Graphics")
    (description "This package provides functions for converting, importing,
and drawing PostScript pictures in R plots.")
    (license license:gpl2+)))

(define-public r-tfmpvalue
  (package
    (name "r-tfmpvalue")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TFMPvalue" version))
       (sha256
        (base32
         "1892jmgqywm0jp5l5k88brp4h8szkbi9bxi0v1jni1929qnsmqyf"))))
    (properties
     `((upstream-name . "TFMPvalue")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/ge11232002/TFMPvalue")
    (synopsis
     "Efficient and accurate P-value computation for position weight matrices")
    (description "In putative Transcription Factor Binding Sites (TFBSs)
identification from sequence/alignments, we are interested in the significance
of certain match score.  TFMPvalue provides the accurate calculation of P-value
with score threshold for position weight matrices, or the score with given
P-value.  This package is an interface to code originally made available by
Helene Touzet and Jean-Stephane Varre, 2007, Algorithms Mol Biol:2, 15.")
    (license license:gpl2)))

(define-public r-splitstackshape
  (package
   (name "r-splitstackshape")
   (version "1.4.2")
   (source
    (origin
     (method url-fetch)
     (uri (cran-uri "splitstackshape" version))
     (sha256
      (base32
       "0m9karfh0pcy0jj3dzq87vybxv9gmcrq5m2k7byxpki95apbrsmg"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-data-table" ,r-data-table)))
   (home-page "http://github.com/mrdwab/splitstackshape")
   (synopsis "Stack and Reshape Datasets After Splitting Concatenated Values")
   (description "Online data collection tools like Google Forms often export
multiple-response questions with data concatenated in cells.  The concat.split
(cSplit) family of functions splits such data into separate cells.  The package
also includes functions to stack groups of columns and to reshape wide data,
even when the data are \"unbalanced\".")
   (license license:gpl3)))

(define-public r-motifdb
  (package
   (name "r-motifdb")
   (version "1.20.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "MotifDb" version))
            (sha256
             (base32 "16gk7sbrk188kv3mdsnvcnfzvd2dyxm7wmmwvcqz560x0xn0l0k9"))))
   (properties `((upstream-name . "MotifDb")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biocgenerics" ,r-biocgenerics)
      ("r-s4vectors" ,r-s4vectors)
      ("r-biostrings" ,r-biostrings)
      ("r-iranges" ,r-iranges)
      ("r-rtracklayer" ,r-rtracklayer)
      ("r-splitstackshape" ,r-splitstackshape)))
   (home-page "http://bioconductor.org/packages/MotifDb")
   (synopsis "Annotated collection of protein-DNA binding sequence motifs")
   (description "This package provides more than 2000 annotated position
frequency matrices from nine public sources, for multiple organisms.")
   (license license:artistic2.0)))

(define-public r-motifbreakr
  (package
   (name "r-motifbreakr")
   (version "1.8.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "motifbreakR" version))
            (sha256
             (base32 "1jfff6jgvrylhnpyc5zq1fah33xq8vf7hypv22vg7js6m8bmcx5j"))))
   (properties `((upstream-name . "motifbreakR")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-grimport" ,r-grimport)
      ("r-stringr" ,r-stringr)
      ("r-biocgenerics" ,r-biocgenerics)
      ("r-s4vectors" ,r-s4vectors)
      ("r-iranges" ,r-iranges)
      ("r-genomeinfodb" ,r-genomeinfodb)
      ("r-genomicranges" ,r-genomicranges)
      ("r-biostrings" ,r-biostrings)
      ("r-bsgenome" ,r-bsgenome)
      ("r-rtracklayer" ,r-rtracklayer)
      ("r-variantannotation" ,r-variantannotation)
      ("r-biocparallel" ,r-biocparallel)
      ("r-motifstack" ,r-motifstack)
      ("r-gviz" ,r-gviz)
      ("r-matrixstats" ,r-matrixstats)
      ("r-tfmpvalue" ,r-tfmpvalue)
      ("r-motifdb" ,r-motifdb)))
   (home-page "http://bioconductor.org/packages/motifbreakR")
   (synopsis "Predicting disruptiveness of single nucleotide polymorphisms on transcription factor binding sites")
   (description "This package allows biologists to judge in the first place
whether the sequence surrounding the polymorphism is a good match, and in
the second place how much information is gained or lost in one allele of
the polymorphism relative to another.  This package is both flexible and
extensible over previous offerings; giving a choice of algorithms for
interrogation of genomes with motifs from public sources that users can choose
from; these are 1) a weighted-sum probability matrix, 2) log-probabilities,
and 3) weighted by relative entropy.  This package can predict effects for
novel or previously described variants in public databases, making it suitable
for tasks beyond the scope of its original design.  Lastly, it can be used to
interrogate any genome curated within Bioconductor (currently there are 22).")
   (license license:gpl3+)))

(define-public r-rgadem
  (package
   (name "r-rgadem")
   (version "2.26.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "rGADEM" version))
            (sha256
             (base32 "1rbw8k20ri6jhqn9mgkjzyjp7s1z58bgxd5hb35zcpyd7fb2aifw"))))
   (properties `((upstream-name . "rGADEM")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biostrings" ,r-biostrings)
      ("r-iranges" ,r-iranges)
      ("r-bsgenome" ,r-bsgenome)
      ("r-seqlogo" ,r-seqlogo)))
   (home-page "http://bioconductor.org/packages/rGADEM")
   (synopsis "De novo motif discovery")
   (description "This package is an efficient de novo motif discovery tool for
large-scale genomic sequence data.")
   (license license:artistic2.0)))

(define-public r-motiv
  (package
   (name "r-motiv")
   (version "1.34.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "MotIV" version))
            (sha256
             (base32 "0lvkzbw328mxyp2pd95ymi1nbk78jx880h00jxwdf17a5rkikgh6"))))
   (properties `((upstream-name . "MotIV")))
   (build-system r-build-system)
   (inputs
    `(("gsl" ,gsl)))
   (propagated-inputs
    `(("r-s4vectors" ,r-s4vectors)
      ("r-iranges" ,r-iranges)
      ("r-biostrings" ,r-biostrings)
      ("r-rgadem" ,r-rgadem)
      ("r-lattice" ,r-lattice)))
   (home-page "http://bioconductor.org/packages/MotIV/")
   (synopsis "Motif Identification and validation")
   (description "This package makes use of STAMP for comparing a set of motifs
to a given database (e.g. JASPAR).  It can also be used to visualize motifs,
motif distributions, modules and filter motifs.")
   (license license:gpl2)))

(define-public r-motifstack
  (package
   (name "r-motifstack")
   (version "1.22.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "motifStack" version))
            (sha256
             (base32 "0jx2wny3pbfmlwn1ndd7hgka1gzvikad16ncynrxxz3rdfl859pf"))))
   (properties `((upstream-name . "motifStack")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-grimport" ,r-grimport)
      ("r-motiv" ,r-motiv)
      ("r-ade4" ,r-ade4)
      ("r-scales" ,r-scales)
      ("r-htmlwidgets" ,r-htmlwidgets)
      ("r-xml" ,r-xml)
      ("r-biostrings" ,r-biostrings)))
   (home-page "http://bioconductor.org/packages/motifStack/")
   (synopsis "Plot stacked logos for DNA, RNA, and amino acid sequence")
   (description "This package is designed for graphic representation of
multiple motifs with different similarity scores.  It works with both DNA/RNA
sequence motif and amino acid sequence motif.  In addition, it provides the
flexibility for users to customize the graphic parameters such as the font type
and symbol colors.")
   (license license:gpl2+)))

(define-public r-snplocs.hsapiens.dbsnp144.grch37
  (package
    (name "r-snplocs.hsapiens.dbsnp144.grch37")
    (version "0.99.20")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "http://bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib"
                                  "/SNPlocs.Hsapiens.dbSNP144.GRCh37_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1z8kx43ki1jvj7ms7pcybakcdimfwr6zpjvspkjmma97bdz093iz"))))
    (properties
     `((upstream-name . "SNPlocs.Hsapiens.dbSNP144.GRCh37")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-s4vectors" ,r-s4vectors)
       ("r-iranges" ,r-iranges)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-bsgenome" ,r-bsgenome)
       ("r-biostrings" ,r-biostrings)))
    (home-page
     "http://bioconductor.org/packages/SNPlocs.Hsapiens.dbSNP144.GRCh37")
    (synopsis "SNP locations for Homo sapiens (dbSNP Build 144)")
    (description "This package provides SNP locations and alleles for Homo
sapiens extracted from NCBI dbSNP Build 144.  The source data files used for
this package were created by NCBI on May 29-30, 2015, and contain SNPs mapped
to reference genome GRCh37.p13.  WARNING: Note that the GRCh37.p13 genome is a
patched version of GRCh37.  However the patch doesn't alter chromosomes 1-22,
X, Y, MT. GRCh37 itself is the same as the hg19 genome from UCSC *except* for
the mitochondrion chromosome.  Therefore, the SNPs in this package can be
injected in @code{BSgenome.Hsapiens.UCSC.hg19} and they will land at the
correct position but this injection will exclude chrM (i.e. nothing will be
injected in that sequence).")
    (license license:artistic2.0)))

(define-public r-flock
  (package
    (name "r-flock")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "flock" version))
              (sha256
               (base32
                "1zg93p74icj4bhxnmnssj2xp6vw4yaksyavq03497v33xfpdxss7"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-rcpp" ,r-rcpp)))
    (home-page "http://cran.r-project.org/web/packages/flock")
    (synopsis "Process Synchronization Using File Locks")
    (description "Implements synchronization between R processes (spawned by
using the @code{parallel} package for instance) using file locks.  Supports both
exclusive and shared locking.")
    (license license:asl2.0)))

(define r-spp-custom
  (package
    (name "r-spp-custom")
    (version "1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kundajelab/phantompeakqualtools/raw/master/spp_"
                    version ".tar.gz"))
              (sha256
               (base32 "02sj0482ph0sn9lpmxcmldsrj3sph70r4jp5k0idgbl27qbfcfyh"))))
    (build-system r-build-system)
    (inputs
     `(("boost" ,boost)
       ("zlib" ,zlib)))
    (propagated-inputs
     `(("r-catools" ,r-catools)
       ("r-rsamtools" ,r-rsamtools)))
    (home-page "https://github.com/kundajelab/phantompeakqualtools")
    (synopsis "")
    (description "")
    (license #f)))

(define-public r-phantompeakqualtools
  (package
    (name "r-phantompeakqualtools")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kundajelab/phantompeakqualtools/"
                    "archive/" version ".tar.gz"))
              (sha256
               (base32
                "0s0nk9y7jb0gm1kvbcxn5n6aiavwlkc779myrnqm1wb51flcrjw6"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((script (string-append (assoc-ref outputs "out")
                                          "/share/scripts")))
               (install-file "run_spp.R" script)))))))
    (propagated-inputs
     `(("r-catools" ,r-catools)
       ("r-snow" ,r-snow)
       ("r-snowfall" ,r-snowfall)
       ("r-bitops" ,r-bitops)
       ("r-rsamtools" ,r-rsamtools)
       ("r-spp-custom" ,r-spp-custom)
       ("gawk" ,gawk)
       ("samtools" ,samtools)
       ("boost" ,boost)
       ("gzip" ,gzip)))
    (home-page "https://github.com/kundajelab/phantompeakqualtools")
    (synopsis "")
    (description "")
    (license #f)))

(define-public r-fda
  (package
   (name "r-fda")
   (version "2.4.7")
   (source (origin
            (method url-fetch)
            (uri (cran-uri "fda" version))
            (sha256
             (base32
              "0371c32kxxvfdh18ldgc2p76dr2436ay0n9prdjwm9v0azp4rp9k"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-matrix" ,r-matrix)))
   (home-page "http://www.functionaldata.org")
   (synopsis "Functional Data Analysis")
   (description
    "These functions were developed to support functional data analysis as
described in Ramsay, J.  O.  and Silverman, B.  W. (2005) Functional Data
Analysis.  New York: Springer.  They were ported from earlier versions in
Matlab and S-PLUS.  An introduction appears in Ramsay, J.  O., Hooker,
Giles, and Graves, Spencer (2009) Functional Data Analysis with R and
Matlab (Springer).  The package includes data sets and script files working
many examples including all but one of the 76 figures in this latter book.
Matlab versions of the code and sample analyses are no longer distributed
through CRAN, as they were when the book was published.  For those, ftp
from <http://www.psych.mcgill.ca/misc/fda/downloads/FDAfuns/> There you find
a set of .zip files containing the functions and sample analyses, as well as
two .txt files giving instructions for installation and some additional
information.  The changes from Version 2.4.1 are fixes of bugs in density.fd
and removal of functions create.polynomial.basis, polynompen, and polynomial.
These were deleted because the monomial basis does the same thing and because
there were errors in the code.")
   (license license:gpl2+)))

(define-public r-lsd
  (package
   (name "r-lsd")
   (version "3.0")
   (source (origin
            (method url-fetch)
            (uri (cran-uri "LSD" version))
            (sha256
             (base32
              "069p33aw6iwikp82b7b8wa77wlyjqwr4hcwvrgaxgwqdgn6jjg3k"))))
   (properties `((upstream-name . "LSD")))
   (build-system r-build-system)
   (home-page "http://cran.r-project.org/web/packages/LSD")
   (synopsis "Lots of Superior Depictions")
   (description "Create lots of colorful plots in a plethora of variations
(try the LSD demotour())")
   ;; License: "unlimited" -- whatever that means.
   (license #f)))

(define-public r-fourcseq
  (package
   (name "r-fourcseq")
   (version "1.12.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "FourCSeq" version))
            (sha256
             (base32 "08fq289m8g7fgmsrph1gq45q6zpfnrzpm0n4qyf2vc5hsdgnm4qh"))))
   (properties `((upstream-name . "FourCSeq")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-deseq2" ,r-deseq2)
      ("r-biobase" ,r-biobase)
      ("r-biostrings" ,r-biostrings)
      ("r-genomicranges" ,r-genomicranges)
      ("r-summarizedexperiment" ,r-summarizedexperiment)
      ("r-rsamtools" ,r-rsamtools)
      ("r-ggbio" ,r-ggbio)
      ("r-reshape2" ,r-reshape2)
      ("r-rtracklayer" ,r-rtracklayer)
      ("r-fda" ,r-fda)
      ("r-genomicalignments" ,r-genomicalignments)
      ("r-gtools" ,r-gtools)
      ("r-matrix" ,r-matrix)
      ("r-lsd" ,r-lsd)
      ("r-ggplot2" ,r-ggplot2)))
   (home-page "http://bioconductor.org/packages/FourCSeq/")
   (synopsis "Package analyse 4C sequencing data")
   (description "FourCSeq is an R package dedicated to the analysis of (multiplexed) 4C sequencing data. The package provides a pipeline to detect specific interactions between DNA elements and identify differential interactions between conditions. The statistical analysis in R starts with individual bam files for each sample as inputs. To obtain these files, the package contains a python script (extdata/python/demultiplex.py) to demultiplex libraries and trim off primer sequences. With a standard alignment software the required bam files can be then be generated.")
   (license license:gpl3+)))

(define-public r-txdb-dmelanogaster-ucsc-dm3-ensgene
  (package
    (name "r-txdb-dmelanogaster-ucsc-dm3-ensgene")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "http://bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib"
                                  "/TxDb.Dmelanogaster.UCSC.dm3.ensGene_"
                                  "3.2.2.tar.gz"))
              (sha256
               (base32
                "1337x23rdmiiza83ms225kri37h16q5hw1lw0m577abcgip3d7c7"))))
    (properties
     `((upstream-name . "TxDb.Hsapiens.UCSC.hg19.knownGene")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-genomicfeatures" ,r-genomicfeatures)))
    (home-page
     "http://bioconductor.org/packages/TxDb.Dmelanogaster.UCSC.dm3.ensGene/")
    (synopsis "Annotation package for Dmelanogaster in TxDb format")
    (description
     "This package provides an annotation databases generated from UCSC by
exposing these as @code{TxDb} objects.")
    (license license:artistic2.0)))

;;
;; RStudio was imported from:
;; https://github.com/BIMSBbioinfo/guix-bimsb/blob/master/bimsb/packages/staging.scm
;;

(define-public rstudio-server
  (package
   (name "rstudio-server")
   (version "1.1.220")
   (source (origin
            (method url-fetch)
            (uri (string-append
                  "https://github.com/rstudio/rstudio/archive/v"
                  version ".tar.gz"))
            (sha256
             (base32
              "1ialz330hlb7kl4q8c9zi2ib4jnr138lc3hdn4sbj3m2rg23747c"))
            (file-name (string-append name "-" version ".tar.gz"))))
   (build-system cmake-build-system)
   (arguments
    `(#:configure-flags '("-DRSTUDIO_TARGET=Server")
      #:tests? #f ; no tests
      #:phases
      (modify-phases %standard-phases
        (add-before 'build 'set-java-home
          (lambda* (#:key inputs #:allow-other-keys)
            (setenv "JAVA_HOME" (assoc-ref inputs "jdk"))
            #t))
        (add-after 'unpack 'fix-dependencies
          (lambda _
            ;; Disable checks for bundled dependencies.  We take care of them by other means.
            (substitute* "src/cpp/session/CMakeLists.txt"
                         (("if\\(NOT EXISTS \"\\$\\{RSTUDIO_DEPENDENCIES_DIR\\}/common/rmarkdown\"\\)") "if (FALSE)")
                         (("if\\(NOT EXISTS \"\\$\\{RSTUDIO_DEPENDENCIES_DIR\\}/common/rsconnect\"\\)") "if (FALSE)"))
            #t))
        (add-after 'unpack 'copy-clang
          (lambda* (#:key inputs #:allow-other-keys)
            (with-directory-excursion "dependencies/common"
                                      (let ((clang   (assoc-ref inputs "clang"))
                                            (dir     "libclang")
                                            (lib     "libclang/3.5")
                                            (headers "libclang/builtin-headers"))
                                        (mkdir-p dir)
                                        (mkdir-p lib)
                                        (mkdir-p headers)
                                        (for-each (lambda (file)
                                                    (install-file file lib))
                                                  (find-files (string-append clang "/lib") ".*"))
                                        (install-file (string-append clang "/include") dir)
                                        #t))))
        (add-after 'unpack 'unpack-dictionaries
          (lambda* (#:key inputs #:allow-other-keys)
            (with-directory-excursion "dependencies/common"
                                      (mkdir "dictionaries")
                                      (mkdir "pandoc") ; TODO: only to appease the cmake stuff
                                      (zero? (system* "unzip" "-qd" "dictionaries"
                                                      (assoc-ref inputs "dictionaries"))))))
        (add-after 'unpack 'unpack-mathjax
          (lambda* (#:key inputs #:allow-other-keys)
            (with-directory-excursion "dependencies/common"
                                      (mkdir "mathjax-26")
                                      (zero? (system* "unzip" "-qd" "mathjax-26"
                                                      (assoc-ref inputs "mathjax"))))))
        (add-after 'unpack 'unpack-gin
          (lambda* (#:key inputs #:allow-other-keys)
            (with-directory-excursion "src/gwt"
                                      (install-file (assoc-ref inputs "junit") "lib")
                                      (mkdir-p "lib/gin/1.5")
                                      (zero? (system* "unzip" "-qd" "lib/gin/1.5"
                                                      (assoc-ref inputs "gin"))))))
        (add-after 'unpack 'unpack-gwt
          (lambda* (#:key inputs #:allow-other-keys)
            (with-directory-excursion "src/gwt"
                                      (mkdir-p "lib/gwt")
                                      (system* "unzip" "-qd" "lib/gwt"
                                               (assoc-ref inputs "gwt"))
                                      (rename-file "lib/gwt/gwt-2.7.0" "lib/gwt/2.7.0"))
            #t)))))
   (native-inputs
    `(("pkg-config" ,pkg-config)
      ("unzip" ,unzip)
      ("ant" ,ant)
      ("jdk" ,icedtea "jdk")
      ("gin"
       ,(origin
         (method url-fetch)
         (uri "https://s3.amazonaws.com/rstudio-buildtools/gin-1.5.zip")
         (sha256
          (base32 "155bjrgkf046b8ln6a55x06ryvm8agnnl7l8bkwwzqazbpmz8qgm"))))
      ("gwt"
       ,(origin
         (method url-fetch)
         (uri "https://s3.amazonaws.com/rstudio-buildtools/gwt-2.7.0.zip")
         (sha256
          (base32 "1cs78z9a1jg698j2n35wsy07cy4fxcia9gi00x0r0qc3fcdhcrda"))))
      ("junit"
       ,(origin
         (method url-fetch)
         (uri "https://s3.amazonaws.com/rstudio-buildtools/junit-4.9b3.jar")
         (sha256
          (base32 "0l850yfbq0cgycp8n0r0a1b7xznd37pgfd656vzdwim4blznqmnw"))))
      ("mathjax"
       ,(origin
         (method url-fetch)
         (uri "https://s3.amazonaws.com/rstudio-buildtools/mathjax-26.zip")
         (sha256
          (base32 "0wbcqb9rbfqqvvhqr1pbqax75wp8ydqdyhp91fbqfqp26xzjv6lk"))))
      ("dictionaries"
       ,(origin
         (method url-fetch)
         (uri "https://s3.amazonaws.com/rstudio-dictionaries/core-dictionaries.zip")
         (sha256
          (base32 "153lg3ai97qzbqp6zjg10dh3sfvz80v42cjw45zwz7gv1risjha3"))))))
   (inputs
    `(("r" ,r)
      ("r-rmarkdown" ,r-rmarkdown) ; TODO: must be linked to another location
      ;;("r-rsconnect" ,r-rsconnect) ; TODO: must be linked to another location
      ("clang" ,clang-3.5)
      ("boost" ,boost)
      ("libuuid" ,util-linux)
      ("pandoc" ,ghc-pandoc)
      ("openssl" ,openssl)
      ("pam" ,linux-pam)
      ("zlib" ,zlib)))
   (home-page "http://www.rstudio.org/")
   (synopsis "Integrated development environment (IDE) for R")
   (description
    "RStudio is an integrated development environment (IDE) for the R
programming language. Some of its features include: Customizable workbench
with all of the tools required to work with R in one place (console, source,
plots, workspace, help, history, etc.); syntax highlighting editor with code
completion; execute code directly from the source editor (line, selection, or
file); full support for authoring Sweave and TeX documents.  RStudio can also
be run as a server, enabling multiple users to access the RStudio IDE using a
web browser.")
   (license license:agpl3+)))

(define-public rstudio
  (package (inherit rstudio-server)
    (name "rstudio")
    (arguments
     (substitute-keyword-arguments (package-arguments rstudio-server)
       ((#:configure-flags flags)
        '(list "-DRSTUDIO_TARGET=Desktop"
               (string-append "-DQT_QMAKE_EXECUTABLE="
                              (assoc-ref %build-inputs "qtbase")
                              "/bin/qmake")))
       ((#:phases phases)
        `(modify-phases ,phases
                        (add-after 'unpack 'relax-qt-version
                                   (lambda _
                                     (substitute* "src/cpp/desktop/CMakeLists.txt"
                                                  (("5\\.4") "5.7"))
                                     #t))))))
    (inputs
     `(("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("qtlocation" ,qtlocation)
       ("qtsvg" ,qtsvg)
       ("qtsensors" ,qtsensors)
       ("qtxmlpatterns" ,qtxmlpatterns)
       ("qtwebkit" ,qtwebkit)
       ,@(package-inputs rstudio-server)))
    (synopsis "Integrated development environment (IDE) for R (desktop version)")))
