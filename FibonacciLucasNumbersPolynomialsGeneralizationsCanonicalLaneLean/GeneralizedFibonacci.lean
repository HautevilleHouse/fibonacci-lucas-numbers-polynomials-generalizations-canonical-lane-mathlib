import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

/-- Generalized Fibonacci sequence with parameters a, b -/
def generalizedFibonacci (a b : ℤ) : ℕ → ℤ
  | 0 => a
  | 1 => b
  | n + 2 => generalizedFibonacci a b (n + 1) + generalizedFibonacci a b n

/-- Catalani's identity for generalized Fibonacci -/
theorem catalani_identity (a b : ℤ) (n : ℕ) :
  generalizedFibonacci a b (n + 2)^2 - generalizedFibonacci a b (n + 3) * generalizedFibonacci a b (n + 1) = (-1)^n * (a^2 - a*b - b^2) := by
  induction' n with k ih
  · simp [generalizedFibonacci]
    ring
  · have h1 : generalizedFibonacci a b (k + 3) = generalizedFibonacci a b (k + 2) + generalizedFibonacci a b (k + 1) := by
      simp [generalizedFibonacci, add_comm, add_left_comm, add_assoc]
    have h2 : generalizedFibonacci a b (k + 4) = generalizedFibonacci a b (k + 3) + generalizedFibonacci a b (k + 2) := by
      simp [generalizedFibonacci, add_comm, add_left_comm, add_assoc]
    have h3 : generalizedFibonacci a b (k + 2)^2 - generalizedFibonacci a b (k + 3) * generalizedFibonacci a b (k + 1) = (-1)^k * (a^2 - a*b - b^2) := ih
    calc
      generalizedFibonacci a b (k + 3)^2 - generalizedFibonacci a b (k + 4) * generalizedFibonacci a b (k + 2)
          = (generalizedFibonacci a b (k + 2) + generalizedFibonacci a b (k + 1))^2 - (generalizedFibonacci a b (k + 3) + generalizedFibonacci a b (k + 2)) * generalizedFibonacci a b (k + 2) := by
            simp [h1, h2]
      _ = (generalizedFibonacci a b (k + 2)^2 + 2 * generalizedFibonacci a b (k + 2) * generalizedFibonacci a b (k + 1) + generalizedFibonacci a b (k + 1)^2) - (generalizedFibonacci a b (k + 3) * generalizedFibonacci a b (k + 2) + generalizedFibonacci a b (k + 2)^2) := by ring
      _ = generalizedFibonacci a b (k + 2)^2 + 2 * generalizedFibonacci a b (k + 2) * generalizedFibonacci a b (k + 1) + generalizedFibonacci a b (k + 1)^2 - generalizedFibonacci a b (k + 3) * generalizedFibonacci a b (k + 2) - generalizedFibonacci a b (k + 2)^2 := by ring
      _ = 2 * generalizedFibonacci a b (k + 2) * generalizedFibonacci a b (k + 1) + generalizedFibonacci a b (k + 1)^2 - generalizedFibonacci a b (k + 3) * generalizedFibonacci a b (k + 2) := by ring
      _ = -(generalizedFibonacci a b (k + 2)^2 - generalizedFibonacci a b (k + 3) * generalizedFibonacci a b (k + 1)) := by
        nlinarith
      _ = -((-1)^k * (a^2 - a*b - b^2)) := by rw [h3]
      _ = (-1)^(k+1) * (a^2 - a*b - b^2) := by
        ring
        simp [pow_add, mul_comm]

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse