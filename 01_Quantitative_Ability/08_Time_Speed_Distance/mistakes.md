# Time, Speed & Distance — Common Mistakes

## 1. Using Arithmetic Mean for Average Speed
- **Mistake:** Average speed = (S1 + S2) / 2
- **Fix:** Only valid if TIME is equal. If DISTANCE is equal, use harmonic mean: 2S1S2/(S1+S2)

## 2. Forgetting Train's Own Length
- **Mistake:** Time = Platform Length / Speed
- **Fix:** Time = (Train Length + Platform Length) / Speed

## 3. Unit Mismatch (km/h vs m/s)
- **Mistake:** Plugging km/h directly with meters
- **Fix:** ALWAYS check units. Convert: km/h × 5/18 = m/s

## 4. Wrong Relative Speed Formula
- **Mistake:** Same direction = S1 + S2, Opposite = S1 - S2
- **Fix:** Opposite = S1 + S2 (they approach faster), Same = |S1 - S2|

## 5. Boats Upstream Calculation
- **Mistake:** Upstream speed = B + S
- **Fix:** Upstream = B - S (current opposes motion)

## 6. Treating Equal-Time Journey as Harmonic Mean
- **Mistake:** Using 2S1S2/(S1+S2) when time periods are equal
- **Fix:** If equal TIME, arithmetic mean applies. If equal DISTANCE, harmonic mean.

## 7. Head-Start Problems — Calculating from Wrong Reference
- **Mistake:** Head start = time difference × speed of chaser
- **Fix:** Head start = time difference × speed of PERSON being chased
