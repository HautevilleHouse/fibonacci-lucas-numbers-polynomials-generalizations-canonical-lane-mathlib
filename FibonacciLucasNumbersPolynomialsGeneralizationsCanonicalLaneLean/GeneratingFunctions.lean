import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

/-- Ordinary generating function for Fibonacci polynomials -/
def fibonacciGeneratingFunction (x : ℤ) : ℚ[[t]] := by
  exact ∑' (n : ℕ), (fibonacciPolynomial x n : ℚ) * (t^n)

/-- Closed form of generating function: t / (1 - x t - t^2) -/
theorem fibonacci_gf_closed_form (x : ℤ) :
  fibonacciGeneratingFunction x = (t : ℚ[[t]]) / (1 - (x : ℚ[[t]]) * t - t^2) := by
  -- We use the known recurrence for Fibonacci polynomials and the power series identity
  -- Let F = ∑ f_n t^n, where f_n = fibonacciPolynomial x n
  -- Then F = t + x t F + t^2 F, i.e., F = t / (1 - x t - t^2)
  -- Since f_0 = 0, f_1 = 1, and f_{n+2} = x f_{n+1} + f_n
  ext n
  simp [fibonacciGeneratingFunction, seriesCoeff, PowerSeries.coeff_mul, PowerSeries.coeff_add, PowerSeries.coeff_sub, PowerSeries.coeff_one, PowerSeries.coeff_X, mul_comm, add_comm, add_left_comm, add_assoc, mul_add, add_mul, mul_assoc, PowerSeries.coeff_C, PowerSeries.coeff_pow, smul_eq_mul, map_mul, map_add, map_sub, map_pow, map_one, RingHom.map_mul, RingHom.map_add, PowerSeries.coeff_smul, PowerSeries.coeff_mul_eq_mul_coeff, PowerSeries.coeff_mul_coeff, PowerSeries.coeff_eq_zero_of_nat_lt_nat, fibonacciPolynomial, fibonacciPolynomial_succ_succ, fibonacciPolynomial_zero, fibonacciPolynomial_one, fibonacciPolynomial_succ, sub_eq_add_neg, add_comm, add_left_comm, add_assoc]
  -- We need to do case analysis on n
  cases n with
  | zero =>
    simp [fibonacciPolynomial_zero]
  | succ n =>
    cases n with
    | zero =>
      simp [fibonacciPolynomial_one, fibonacciPolynomial_zero]
    | succ n =>
      simp [fibonacciPolynomial_succ_succ, fibonacciPolynomial_succ, 
        PowerSeries.coeff_mul, PowerSeries.coeff_add, PowerSeries.coeff_sub, PowerSeries.coeff_one, 
        PowerSeries.coeff_X, mul_comm, add_comm, add_left_comm, add_assoc, mul_add, add_mul, mul_assoc,
        PowerSeries.coeff_C, PowerSeries.coeff_pow, smul_eq_mul, map_mul, map_add, map_sub, map_pow, map_one]
      ring

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse