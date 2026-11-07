# Machine-Verified Formal Proofs in Modular Arithmetic & Superlinear Recurrences (Lean 4)

[![Lean 4](https://img.shields.io/badge/Lean_4-v4.33+-blue.svg)](https://lean-lang.org/)
[![Build: Zero Sorry](https://img.shields.io/badge/Verification-100%25_Proven-brightgreen.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository contains machine-verified, self-contained formal mathematical proofs authored in the **Lean 4** interactive theorem prover. All theorems in this repository compile with **zero warnings, zero errors, and zero `sorry` placeholders**.

> **Scope Note (Scientific Audit v2.0):** These files serve as pedagogical and foundational exercises in Lean 4 formal verification of discrete dynamical systems (finite modular state spaces and discrete quadratic recurrences on $\mathbb{N}$). While `Ouroboros_NavierStokes_Proven.lean` is motivated as a discrete toy analogy for superlinear growth ($E_{n+1} \ge E_n^2$), it operates strictly on discrete natural-number sequences and does **not** formalize continuous partial differential equations, Sobolev spaces, or the 3D incompressible Navier–Stokes / Beale–Kato–Majda regularity problem.

---

## Verified Theorems

### 1. Universal Pisano Period in the Ring $\mathbb{Z}_9$
* **File:** `Ouroboros_Pisano_Proven.lean`
* **Formal Claim:**
  * For all $a, b \in \mathrm{Fin}\,9$, iterating the transition operator $T(x, y) = (y, (x+y)\pmod 9)$ exactly 24 times yields $T^{24}(a, b) = (a, b)$ identically.
  * By structural induction on $\mathbb{N}$, we formally verify universal periodicity:
    $$\forall n \in \mathbb{N},\quad T^{n+24}(a, b) = T^n(a, b)$$
* **Verification:** Machine-checked via exhaustive finite case decision (`decide`) and inductive propagation.

### 2. Doubly-Exponential Divergence of Discrete Quadratic Recurrences
* **File:** `Ouroboros_NavierStokes_Proven.lean`
* **Mathematical Context:** Discrete toy model of superlinear recurrence growth on $\mathbb{N}$ ($E(n+1) \ge E(n)^2$).
* **Formal Claim:**
  * Let $E : \mathbb{N} \to \mathbb{N}$ satisfy $E(0) \ge 2$ and $E(n+1) \ge E(n)^2$.
  * We prove the doubly-exponential lower bound lemma by structural induction:
    $$E(n) \ge 2^{2^n}$$
  * Using Cantor's diagonal exponential bound ($n < 2^n$), we formally prove the non-existence of uniform upper bounds:
    $$\forall M \in \mathbb{N},\quad \exists N^* \in \mathbb{N} \quad \text{such that}\quad E(N^*) > M$$
* **Verification:** Machine-checked in pure Lean 4 core using `omega` and structural induction.

### 3. Triadic Multiplicative Ideal Closure in $\mathbb{Z}_9$
* **File:** `Ouroboros_Triadic.lean`
* **Formal Claim:** The modular subset $I = \{0, 3, 6\} \subset \mathbb{Z}_9$ (the principal ideal $(3) \subset \mathbb{Z}/9\mathbb{Z}$) is invariant under multiplication by arbitrary ring elements:
  $$\forall x, y \in \mathrm{Fin}\,9,\quad x \in \{0, 3, 6\} \implies (x \cdot y \bmod 9) \in \{0, 3, 6\}$$

---

## Verification & Compilation

These proofs are self-contained and require only a standard installation of Lean 4 (no external `mathlib4` dependencies required).

```bash
# Verify the Pisano Periodicity Theorem in Z_9
lean Ouroboros_Pisano_Proven.lean

# Verify the Discrete Quadratic Recurrence Divergence Theorem
lean Ouroboros_NavierStokes_Proven.lean

# Verify the Triadic Multiplicative Closure in Z_9
lean Ouroboros_Triadic.lean
```
*Expected output: Empty output with exit code 0 (all goals verified).*

---

## License

MIT License. See [LICENSE](LICENSE) for details.
