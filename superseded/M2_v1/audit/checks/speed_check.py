# Check for the discussion of 10 Nov 2026: "slower along the pillowcase" and "slower as we see it"
# for a single object that is massless in the full space, with energy E fixed (units c = 1).
#   E^2 = p_vis^2 + p_hid^2 ;   mass seen in four dimensions  m = p_hid.
# Three speeds:
#   visible speed (what we see)                    v_vis       = p_vis / E
#   hidden speed of the wave pattern (phase speed) v_hid_phase = E / p_hid   (wavelength x frequency along the hidden direction)
#   hidden speed of the object itself (group)      v_hid_group = p_hid / E
import math
E = 1.0
print("fixed energy E = 1; raising the hidden momentum p_hid (= the mass seen in 4D):")
print("  m = p_hid | visible speed | hidden wave speed (in units of c) | hidden wavelength | hidden travel speed")
for ph in (0.05, 0.2, 0.5, 0.8, 0.95):
    pv = math.sqrt(E*E - ph*ph)
    print("  %8.2f | %13.4f | %33.3f | %17.3f | %19.4f" % (ph, pv/E, E/ph, 2*math.pi/ph, ph/E))
print("As the mass rises: the visible speed FALLS, the hidden wave speed FALLS, the hidden wavelength SHORTENS.")
print("Only the object's own rate of travel round the hidden direction rises.")
print()
print("With a warp w on the hidden direction and a conserved integer n: local hidden momentum p_hid = n / w.")
for w in (4.0, 2.0, 1.0, 0.5):
    print("  w = %4.1f : p_hid = n/w = %.3f n   (smaller w: shorter wavelength, larger mass)" % (w, 1/w))
