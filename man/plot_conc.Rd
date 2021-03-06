% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/performance.R
\name{plot_conc}
\alias{plot_conc}
\title{Phasing concordance plot}
\usage{
plot_conc(acset, feats = NA, cex = 0.5)
}
\arguments{
\item{acset}{An acset list created by \code{\link{new_acset}}. The acset must
contain the elements 'gt_conc' and 'gt_phased_conc' which contain the
concordance and inconcordance for every gene before (gt_conc) and after
phasing (gt_phased_conc), see \code{\link{set_gt_conc}}.}

\item{feats}{A character vector of feature names to include in the plot.}

\item{cex}{A numerical value giving the amount by which plotting text and
symbols should be magnified relative to the default, see \code{\link{par}}.}
}
\description{
\code{plot_conc} plots the phasing concordance, see \code{\link{set_gt_conc}}
}
\details{
To assess the success of the phasing one can calculate the degree of
variability remaining if all cells with haplotype 2 are set to haplotype 1.
As a rough measure of this this function calculates the variability as the
number of cells that differ from the inferred haplotype for every gene with
two variants. The differing number of cells per gene we denote as the
inconcordance and the number of cells with identical haplotype to the
inferred haplotype as concordance, see \code{\link{set_gt_conc}} for further
details.
}
\examples{
##load dataset
invisible(marinov)
acset = new_acset(featdata = marinov[['featdata']], refcount =
marinov[['refcount']], altcount = marinov[['altcount']], phenodata =
marinov[['phenodata']])

##Call gt
acset = call_gt(acset, min_acount = 3, fc = 3)

##Filter variants and genes
acset = filter_acset(acset, nmincells = 5, nminvar = 2)

##Phase
acset = phase(acset, input = 'gt', weigh = FALSE, method = 'exhaust')

##Calculate the genotype concordance before and after phasing
acset = set_gt_conc(acset)

##Plot the genotype concordance before and after phasing
acset = plot_conc(acset)

}

