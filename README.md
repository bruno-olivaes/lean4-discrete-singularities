# Formal Proofs in Discrete Algebra & Fluid Blow-Up (Lean 4)

[![Lean 4](https://img.shields.io/badge/Lean_4-v4.33+-blue.svg)](https://lean-lang.org/)
[![Build: Zero Sorry](https://img.shields.io/badge/Verification-100%25_Proven-brightgreen.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository contains machine-verified, self-contained formal mathematical proofs authored in the **Lean 4** interactive theorem prover. All core theorems in this repository compile with **zero warnings, zero errors, and zero `sorry` placeholders**.

---

## Verified Theorems

### 1. Universal Pisano Period in the Ring $\mathbb{Z}_9$
* **File:** `Ouroboros_Pisano_Proven.lean`
* **Formal Claim:**
  * For all $a, b \in \mathrm{Fin}\,9$, iterating the transition operator $T(x, y) = (y, (x+y)\pmod 9)$ exactly 24 times yields $T^{24}(a, b) = (a, b)$ identically.
  * By structural induction on $\mathbb{N}$, we formally verify universal periodicity:
    $$\forall n \in \mathbb{N},\quad T^{n+24}(a, b) = T^n(a, b)$$
* **Verification:** Machine-checked via exhaustive finite case decision (`decide`) and inductive propagation.

### 2. Finite-Time Enstrophy Blow-Up under Superlinear Vortex Stretching
* **File:** `Ouroboros_NavierStokes_Proven.lean`
* **Mathematical Context:** Relates to the Beale-Kato-Majda (BKM) regularity breakdown in 3D incompressible fluid dynamics.
* **Formal Claim:**
  * Let $E : \mathbb{N} \to \mathbb{N}$ satisfy quadratic enstrophy growth: $E(0) \ge 2$ and $E(n+1) \ge E(n)^2$.
  * We prove the lower bound lemma:
    $$E(n) \ge 2^{2^n}$$
  * We formally prove the non-existence of global uniform bounds:
    $$\forall M \in \mathbb{N},\quad \exists N^* \in \mathbb{N} \quad \text{such that}\quad E(N^*) > M$$
* **Verification:** Machine-checked in pure Lean 4 core using `omega` and power induction.

### 3. Triadic Multiplicative Closure
* **File:** `Ouroboros_Triadic.lean`
* **Formal Claim:** The modular subset $\{3, 6, 0\} \subset \mathbb{Z}_9$ forms an invariant multiplicative attractor:
  $$\forall x, y \in \mathbb{Z}_9,\quad x \in \{3, 6, 0\} \implies (x \cdot y) \in \{3, 6, 0\}$$

---

## Verification & Compilation

These proofs are self-contained and require only a standard installation of Lean 4.

```bash
# Verify the Pisano Periodicity Theorem
lean Ouroboros_Pisano_Proven.lean

# Verify the Navier-Stokes Enstrophy Explosion Theorem
lean Ouroboros_NavierStokes_Proven.lean

# Verify the Triadic Multiplicative Closure
lean Ouroboros_Triadic.lean
```
*Expected output: Empty output with exit code 0 (all goals verified).*

---

## Citation

```bibtex
@software{olivaes2026lean4,
  author    = {Olivaes, Bruno Lu\c{c}ardo},
  title     = {Machine-Verified Formal Proofs in Discrete Algebra and Superlinear Fluid Enstrophy Explosions in Lean 4},
  year      = {2026},
  publisher = {Zenodo},
  doi       = {10.5281/zenodo.xxxxxx}
}
```

---

## License

MIT License. See [LICENSE](LICENSE) for details.
