
#' All currency codes
#'
#' @description A data frame including all currency names and codes. Used as reference by 'findcurr' function.
#'
#' @source \url{https://datahub.io/core/currency-codes}, downloaded 2020-12-16
#' @format A data frame with columns:
#' \describe{
#'  \item{Entity}{Country Names}
#'  \item{Currency}{Currency Names}
#'  \item{AlphabeticCode}{Currency Code}
#'  \item{NumericCode}{Numeric code of the currency}
#'  \item{MinorUnit}{decimals}
#'  \item{WithdrawalDate}{Withdrawal Date}
#'  }
#' @examples
#'  currcodes
#' @export
#'
"currcodes"
