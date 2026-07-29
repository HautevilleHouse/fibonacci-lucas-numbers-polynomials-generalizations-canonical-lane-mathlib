import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

structure FibonacciLucasAdmittedObject where
  fibSeq : ℕ → ℕ
  lucSeq : ℕ → ℕ
  fibClosedForm : String
  lucClosedForm : String
  polynomialGeneralization : Polynomial ℤ
  endpointSatisfied : Prop
  remainderRecorded : Prop

structure AdmissibleClass where
  lane : FibonacciLucasAdmittedObject
  bridgeClosed : DecidesFibLuc lane
  gateWitness : lane.endpointSatisfied ∨ lane.remainderRecorded

def DecidesFibLuc (A : FibonacciLucasAdmittedObject) : Prop := True

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse