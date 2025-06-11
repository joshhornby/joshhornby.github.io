Example 4 – SpendSphere: B2B expense‑management SaaS
Pretend problem – Support ticket volume outpaces headcount, CSAT slipping below 75 %.

Systems‑thinking approach

Functional decomposition – OCR engine, policy rules, approval workflow, finance export.

Causal‑loop diagram exposes “Fixes that fail”: every hot‑patch to the OCR model reduces accuracy of edge cases, spawning new tickets.

Systems‑dynamics model of ticket inflow vs. self‑service deflection.

Leverage point – implement a closed‑loop learning pipeline where each resolved ticket retrains OCR within 24 hours; simulation shows ticket volume peaking then falling 40 % in two release cycles.

