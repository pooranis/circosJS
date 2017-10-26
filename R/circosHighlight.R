#' circosHighlight
#'
#' highlight chart
#'
#' @import htmlwidgets
#'
#' @export
circoshighlight <- function(df, sectors, color, colorcat, width = NULL, height = NULL, elementId = NULL) {

  df$colorcat <- df[,colorcat]
  color <- as.list(color)
  color <- lapply(color, function (x) paste0('rgb(',paste(col2rgb(x), collapse = ','),')'))
  names(color) <- sort(unique(df$colorcat))

  if(!("color" %in% colnames(sectors))) {
    sectors$color <- rep("#ffffff00", nrow(sectors))
  }
  x <- list(df=df, sectors=sectors, color=color)

  # create widget
  htmlwidgets::createWidget(
    name = 'circosHighlight',
    x,
    width = width,
    height = height,
    package = 'circosJS',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      viewer.padding = 0,
      viewer.paneHeight = 500,
      browser.fill = FALSE
    )
  )
}

#' Shiny bindings for circosHighlight
#'
#' Output and render functions for using circosJS within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a circosJS
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name circosJS-shiny
#'
#' @export
circosHighlightOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'circosJS', width, height, package = 'circosJS')
}

#' @rdname circosJS-shiny
#' @export
renderCircosHighlight <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, circosHighlightOutput, env, quoted = TRUE)
}
