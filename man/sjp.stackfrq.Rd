% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sjPlotStackFrequencies.R
\name{sjp.stackfrq}
\alias{sjp.stackfrq}
\title{Plot stacked proportional bars}
\usage{
sjp.stackfrq(items, legendLabels = NULL, sort.frq = NULL, weightBy = NULL,
  weightByTitleString = NULL, hideLegend = FALSE, title = NULL,
  legendTitle = NULL, includeN = TRUE, axisLabels.y = NULL,
  breakTitleAt = 50, breakLabelsAt = 30, breakLegendTitleAt = 30,
  breakLegendLabelsAt = 28, gridBreaksAt = 0.2, expand.grid = FALSE,
  geom.size = 0.5, geom.colors = "Blues", axisTitle.x = NULL,
  axisTitle.y = NULL, showValueLabels = TRUE, labelDigits = 1,
  showPercentageAxis = TRUE, jitterValueLabels = FALSE,
  showItemLabels = TRUE, showSeparatorLine = FALSE,
  separatorLineColor = "grey80", separatorLineSize = 0.3,
  coord.flip = TRUE, printPlot = TRUE)
}
\arguments{
\item{items}{A data frame with each column representing one likert-item.}

\item{legendLabels}{A list or vector of strings that indicate the likert-scale-categories and which
appear as legend text.}

\item{sort.frq}{Indicates whether the \code{items} should be ordered by
by highest count of first or last category of \code{items}.
\itemize{
  \item Use \code{"first.asc"} to order ascending by lowest count of first category,
  \item \code{"first.desc"} to order descending by lowest count of first category,
  \item \code{"last.asc"} to order ascending by lowest count of last category,
  \item \code{"last.desc"} to order descending by lowest count of last category,
  \item or \code{NULL} (default) for no sorting.
}}

\item{weightBy}{A weight factor that will be applied to weight all cases from \code{items}.
Must be a vector of same length as \code{nrow(items)}. Default is \code{NULL}, so no weights are used.}

\item{weightByTitleString}{If a weight factor is supplied via the parameter \code{weightBy}, the diagram's title
may indicate this with a remark. Default is \code{NULL}, so the diagram's title will not be modified when
cases are weighted. Use a string as parameter, e.g.: \code{weightByTitleString=" (weighted)"}.}

\item{hideLegend}{Indicates whether legend (guide) should be shown or not.}

\item{title}{Title of the diagram, plotted above the whole diagram panel.}

\item{legendTitle}{Title of the diagram's legend.}

\item{includeN}{If \code{TRUE} (default), the N of each item is included into axis labels.}

\item{axisLabels.y}{Labels for the y-axis (the labels of the \code{items}). These parameters must
be passed as list! Example: \code{axisLabels.y=list(c("Q1", "Q2", "Q3"))}
Axis labels will automatically be detected, when they have
a variable label attribute (see \code{\link[sjmisc]{set_var_labels}}) for details).}

\item{breakTitleAt}{Wordwrap for diagram title. Determines how many chars of the title are displayed in
one line and when a line break is inserted into the title.}

\item{breakLabelsAt}{Wordwrap for diagram labels. Determines how many chars of the category labels are displayed in
one line and when a line break is inserted.}

\item{breakLegendTitleAt}{Wordwrap for diagram legend title. Determines how many chars of the legend's title
are displayed in one line and when a line break is inserted.}

\item{breakLegendLabelsAt}{Wordwrap for diagram legend labels. Determines how many chars of the legend labels are
displayed in one line and when a line break is inserted.}

\item{gridBreaksAt}{Sets the breaks on the y axis, i.e. at every n'th position a major
grid is being printed. Valid values range from 0 to 1.}

\item{expand.grid}{If \code{TRUE} (default), the diagram has margins, i.e. the y-axis is not exceeded
to the diagram's boundaries.}

\item{geom.size}{size resp. width of the geoms (bar width)}

\item{geom.colors}{User defined color palette for geoms. If specified, must either be vector with color values
of same length as groups defined in \code{legendLabels}, or a specific color palette code (see below).
\itemize{
  \item If not specified, the sequential \code{"Blues"} color brewer palette will be used.
  \item If \code{"gs"}, a greyscale will be used.
  \item If \code{geom.colors} is any valid color brewer palette name, the related \href{http://colorbrewer2.org}{color brewer} palette will be used. Use \code{display.brewer.all()} from the \code{RColorBrewer} package to view all available palette names.
}
Else specify your own color values as vector (e.g. \code{geom.colors=c("#f00000", "#00ff00", "#0080ff")}).}

\item{axisTitle.x}{A label for the x axis. Useful when plotting histograms with metric scales where no category labels
are assigned to the x axis.}

\item{axisTitle.y}{A label for the y axis. Useful when plotting histograms with metric scales where no category labels
are assigned to the y axis.}

\item{showValueLabels}{Whether counts and percentage values should be plotted to each bar.}

\item{labelDigits}{The amount of digits for rounding \code{value.labels}. Default is 1,
i.e. value labels have 1 digit after decimal point.}

\item{showPercentageAxis}{If \code{TRUE} (default), the percentage values at the x-axis are shown.}

\item{jitterValueLabels}{If \code{TRUE}, the value labels on the bars will be "jittered", i.e. they have
alternating vertical positions to avoid overlapping of labels in case bars are
very short. Default is \code{FALSE}.}

\item{showItemLabels}{Whether x axis text (category names) should be shown or not.}

\item{showSeparatorLine}{If \code{TRUE}, a line is drawn to visually "separate" each bar in the diagram.}

\item{separatorLineColor}{The color of the separator line. only applies, if \code{showSeparatorLine} is \code{TRUE}.}

\item{separatorLineSize}{The size of the separator line. only applies, if \code{showSeparatorLine} is \code{TRUE}.}

\item{coord.flip}{If \code{TRUE}, the x and y axis are swapped.}

\item{printPlot}{If \code{TRUE} (default), plots the results as graph. Use \code{FALSE} if you don't
want to plot any graphs. In either case, the ggplot-object will be returned as value.}
}
\value{
(Insisibily) returns the ggplot-object with the complete plot (\code{plot}) as well as the data frame that
          was used for setting up the ggplot-object (\code{df}).
}
\description{
Plot items (variables) of a scale as stacked proportional bars. This
               function is useful when several items with identical scale/categoroies
               should be plotted to compare the distribution of answers.
}
\note{
Thanks to \href{http://www.clas.ufl.edu/users/forrest/}{Forrest Stevens} for bug fixes.
}
\examples{
# -------------------------------
# random sample
# -------------------------------
# prepare data for 4-category likert scale, 5 items
Q1 <- as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.2, 0.3, 0.1, 0.4)))
Q2 <- as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.5, 0.25, 0.15, 0.1)))
Q3 <- as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.25, 0.1, 0.4, 0.25)))
Q4 <- as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.1, 0.4, 0.4, 0.1)))
Q5 <- as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.35, 0.25, 0.15, 0.25)))

likert_4 <- data.frame(Q1, Q2, Q3, Q4, Q5)

# create labels
levels_4 <- list(c("Independent",
                   "Slightly dependent",
                   "Dependent",
                   "Severely dependent"))

# plot stacked frequencies of 5 (ordered) item-scales
sjp.stackfrq(likert_4, legendLabels = levels_4)


# -------------------------------
# Data from the EUROFAMCARE sample dataset
# -------------------------------
library(sjmisc)
data(efc)

# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c82cop1")

# recveive first item of COPE-index scale
end <- which(colnames(efc) == "c90cop9")

# retrieve variable and value labels
varlabs <- get_var_labels(efc)
vallabs <- get_val_labels(efc)

# create value labels. We need just one variable of
# the COPE-index scale because they have all the same
# level / categorie / value labels
levels <- vallabs['c82cop1']

# create item labels
items <- list(varlabs[c(start:end)])

sjp.stackfrq(efc[, c(start:end)],
             legendLabels = levels,
             axisLabels.y = items,
             jitterValueLabels = TRUE)

# -------------------------------
# auto-detection of labels
# -------------------------------
efc <- set_var_labels(efc, varlabs)
sjp.stackfrq(efc[, c(start:end)])
}
\seealso{
\itemize{
             \item \href{http://www.strengejacke.de/sjPlot/sjp.stackfrq/}{sjPlot manual: sjp.stackfrq}
             \item \code{\link{sjt.stackfrq}}
             }
}

