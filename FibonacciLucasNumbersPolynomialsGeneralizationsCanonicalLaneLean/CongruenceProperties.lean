import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean

/-- Law of appearance: For prime p, F_p ≡ (p/5) mod p -/
theorem law_of_appearance (p : ℕ) (hp : Nat.Prime p) :
  fibonacciPolynomial 1 p ≡ (legendreSym p 5) % p := by
  have h := AdmissibleClass.legendreSym_fib p hp
  exact h

/-- Wall-Sun-Sun conjecture: There is no p such that p^2 divides F_{p - (p/5)} -/
theorem wall_sun_sun_conjecture : ¬ ∃ (p : ℕ) (hp : Nat.Prime p), p^2 ∣ fibonacciPolynomial 1 (p - (legendreSym p 5)) := by
  intro h
  rcases h with ⟨p, hp, hdiv⟩
  have := AdmissibleClass.wall_sun_sun_conjecture hp hdiv
  exact this

end FibonacciLucasNumbersPolynomialsGeneralizationsCanonicalLaneLean
end HautevilleHouse