import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

structure PolynomialBridge where
  poly : Polynomial ℤ
  fibEval : ℕ → ℤ
  lucEval : ℕ → ℤ
  consistency : ∀ n, fibEval n = poly.eval (1) → lucEval n = poly.eval (2)

def fibPoly : Polynomial ℤ := Polynomial.monomial 1 1
def lucPoly : Polynomial ℤ := Polynomial.C 2 + Polynomial.monomial 1 1

theorem fib_poly_closed (A : AdmissibleClass) : fibPoly.eval 1 = 1 := by
  native_decide

theorem luc_poly_closed (A : AdmissibleClass) : lucPoly.eval 1 = 3 := by
  native_decide

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse