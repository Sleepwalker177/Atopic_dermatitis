# Set estimates and a posteriori standard errors
estimate <- 0.000903
posterior_se <- 0.000046

z_value <- estimate / posterior_se
p_value <- 2 * (1 - pnorm(abs(z_value)))

z_value
p_value

if (p_value < 0.05) {
    cat("This value is significantly different from 0（p-value =", p_value, "）\n")
} else {
    cat("This value is not significantly different from 0（p-value =", p_value, "）\n")
}

