def step9 (p : Fin 9 × Fin 9) : Fin 9 × Fin 9 :=
  (p.2, p.1 + p.2)

def iter9 : Nat → (Fin 9 × Fin 9) → (Fin 9 × Fin 9)
| 0, p => p
| n + 1, p => step9 (iter9 n p)

theorem universal_pisano_24 (a b : Fin 9) : iter9 24 (a, b) = (a, b) := by
  revert a b
  decide

theorem universal_pisano_periodic (n : Nat) (a b : Fin 9) :
  iter9 (n + 24) (a, b) = iter9 n (a, b) := by
  induction n with
  | zero =>
    exact universal_pisano_24 a b
  | succ k ih =>
    show step9 (iter9 (k + 24) (a, b)) = step9 (iter9 k (a, b))
    rw [ih]
