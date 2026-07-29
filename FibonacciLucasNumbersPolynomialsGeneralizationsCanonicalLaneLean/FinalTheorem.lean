import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

def ConstrainedFibonacciLucasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fibonacci_lucas_endgame (A : AdmissibleClass) :
    ConstrainedFibonacciLucasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse