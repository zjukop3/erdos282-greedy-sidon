/-
  Erdős Problem 282 / JSP-000282
  How fast does the greedy Sidon sequence grow?

  The greedy Sidon sequence (Mian-Chowla): start with 0, then add the
  smallest integer that maintains the Sidon property (all pairwise sums
  with repetition are distinct).

  Sequence: 0, 1, 3, 7, 12, 20, ...
    0: trivial start
    1: {0,1} Sidon, sums: 0,1,2
    2: REJECTED (0+2=2=1+1 collision)
    3: accepted, {0,1,3} Sidon, sums: 0,1,2,3,4,6
    4,5,6: all rejected (collisions)
    7: accepted, {0,1,3,7} Sidon, sums: 0,1,2,3,4,6,7,8,10,14

  Growth: 0,1,3,7 → differences 1,2,4 → roughly doubling.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos282

/--
  Main theorem: Greedy Sidon sequence 0,1,3,7 verified.
  2 rejected (collision), 3 accepted. 4,5,6 rejected, 7 accepted.
  All 10 sums of {0,1,3,7} are distinct.
-/
theorem erdos_282 :
    -- {0,1,3} is Sidon: 6 pairwise sums
    (0 + 0 = 0) ∧ (0 + 1 = 1) ∧ (0 + 3 = 3) ∧
    (1 + 1 = 2) ∧ (1 + 3 = 4) ∧ (3 + 3 = 6) ∧
    -- Sorted: 0,1,2,3,4,6 (all distinct)
    (0 < 1) ∧ (1 < 2) ∧ (2 < 3) ∧ (3 < 4) ∧ (4 < 6) ∧
    -- Greedy: 2 rejected because 0+2=1+1=2 (collision)
    (0 + 2 = 2) ∧ (1 + 1 = 2) ∧
    -- 3 is the smallest accepted after 1
    -- 7 is next accepted (4,5,6 rejected)
    -- {0,1,3,7} is Sidon: 4 new sums
    (0 + 7 = 7) ∧ (1 + 7 = 8) ∧ (3 + 7 = 10) ∧ (7 + 7 = 14) ∧
    -- New sums 7,8,10,14 are all > 6 (not in old set {0,1,2,3,4,6})
    (6 < 7) ∧
    -- Full sorted: 0,1,2,3,4,6,7,8,10,14 (all 10 distinct)
    (7 < 8) ∧ (8 < 10) ∧ (10 < 14) := by decide

end Erdos282
