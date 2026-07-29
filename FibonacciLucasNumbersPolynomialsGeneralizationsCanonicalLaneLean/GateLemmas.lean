import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.lane.endpointSatisfied ∨ A.lane.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse