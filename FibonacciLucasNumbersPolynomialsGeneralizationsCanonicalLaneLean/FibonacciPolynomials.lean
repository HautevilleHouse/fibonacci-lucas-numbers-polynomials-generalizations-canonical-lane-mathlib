import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

/-- Structure representing a Fibonacci polynomial F_n(x) -/
structure FibonacciPolynomial where
  n : Nat
  x : ℤ
  value : ℤ

def fibonacciPolynomial (x : ℤ) : ℕ → ℤ
  | 0 => 0
  | 1 => 1
  | n + 2 => x * fibonacciPolynomial x (n + 1) + fibonacciPolynomial x n

/-- Identity: F_{m+n}(x) = F_m(x) * L_n(x) + (-1)^(n+1) * F_{m-n}(x) -/
theorem fibonacci_addition_identity (m n : ℕ) (x : ℤ) :
  fibonacciPolynomial x (m + n) = fibonacciPolynomial x m * lucasPolynomial x n + (-1)^(n+1) * fibonacciPolynomial x (m - n) := by
  induction' n with k ih generalizing m
  · simp [fibonacciPolynomial, lucasPolynomial]
  · rw [show (m + (k+1) : ℕ) = (m + k) + 1 by omega]
    rw [fibonacciPolynomial, ih, mul_add, add_assoc]
    simp [lucasPolynomial, add_comm, add_left_comm, add_assoc, mul_comm, mul_left_comm, mul_assoc]

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse