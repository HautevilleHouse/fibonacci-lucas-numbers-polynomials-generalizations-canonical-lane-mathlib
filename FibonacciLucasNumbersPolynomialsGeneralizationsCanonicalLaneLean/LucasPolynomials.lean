import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

/-- Structure representing a Lucas polynomial L_n(x) -/
structure LucasPolynomial where
  n : Nat
  x : ℤ
  value : ℤ

def lucasPolynomial (x : ℤ) : ℕ → ℤ
  | 0 => 2
  | 1 => x
  | n + 2 => x * lucasPolynomial x (n + 1) + lucasPolynomial x n

/-- Identity: L_n(x) = F_{n-1}(x) + F_{n+1}(x) -/
theorem lucas_as_sum_of_fibonaccis (n : ℕ) (x : ℤ) :
  lucasPolynomial x n = fibonacciPolynomial x (n - 1) + fibonacciPolynomial x (n + 1) :=
by
  induction' n with k ih
  · simp [lucasPolynomial, fibonacciPolynomial]
  · rcases k with (rfl|m)
    · simp [lucasPolynomial, fibonacciPolynomial]
    · simp [lucasPolynomial, fibonacciPolynomial, add_comm, add_left_comm, add_assoc, ih]

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse