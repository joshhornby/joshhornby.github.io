# Liability mapping

### Liability Mapping: turning *“tech debt”* into an actionable risk portfolio

> *A single bucket called “debt” hides different beasts—some nibble at velocity, others can sink the company overnight. Mapping each to the right class unlocks clearer trade‑offs, budgets, and narratives.*

---

#### 1  Why retire the single “debt” bucket?

Your earlier post showed how the metaphor morphed into a hand‑wave for everything from ugly variable names to ossified architectures; no one can say *how much* debt exists or *what interest* we pay . The result: imprecise discussions and stalled investment. A taxonomy restores precision.

---

#### 2  The five‑class taxonomy

| Class         | Definition                                                                                     | Primary signal                                           | Typical owner action                                       |
| ------------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------------------- |
| **Liability** | Clear, externally‑visible risk that violates contractual, security, or compliance obligations. | CVE backlog, failed audits.                              | **Must‑fix** inside cycle time or sprint.                  |
| **Drag**      | Internal friction that slows feature flow but rarely harms customers directly.                 | Build times, flaky tests, manual deploy steps.           | Schedule & track via *flow‑metrics budget*.                |
| **Hazard**    | Latent defect with low frequency but high blast‑radius.                                        | Single‑point-of-failure, critical data coupling.         | Invest in redundancy or kill‑switches before feature work. |
| **Relic**     | Dormant code, unused infra, forgotten toggles that clutter cognition.                          | Zero‑call endpoints, abandoned feature flags.            | Archive or delete quarterly; measure LOC shrink.           |
| **Bet**       | Conscious shortcut taken for speed-to‑market with a written expiry date.                       | TODO markers with “sunset‑by” field; prototype branches. | Review in *risk council* before expiry; promote or retire. |

**Why these five?**
They map to distinct *impact vectors*: customer harm (liability, hazard), velocity tax (drag), cognitive overhead (relic), and strategic exploration (bet). Blurring them forces you to treat all work as equal urgency or, worse, ignore the nasty bits.

---

#### 3  How to create your first Liability Map

1. **Inventory evidence, not feelings.** Pull security scan results, flow metrics, incident post‑mortems, dead‑code reports.
2. **Workshop classification.** Cross‑functional group tags each item with the five labels; argue *once*, then record.
3. **Score quick triage metrics.**

    * *Impact now* (customer pain or regulatory fine)
    * *Impact later* (blast‑radius if incident occurs)
    * *Velocity hit* (lead‑time inflation %)
    * *Confidence* (evidence strength)
4. **Plot the map.** A 3×3 grid (Impact‑now vs Impact‑later) with colour by class surfaces surprises—e.g. a “drag” item with catastrophic latent risk is really a *hazard*.
5. **Link to budget cadence.** Liabilities and hazards go into the *run‑cost* budget; drags, relics, bets live in *change‑cost* or *innovation* buckets. Finance loves this split.

---

#### 4  From taxonomy to portfolio management

* **Operational review** Track liabilities/hazards alongside uptime and SLO burn; make them first‑class metrics.
* **Quarterly pruning ritual** Every quarter delete or sunset two relics; celebrate LOC‑reduction as proudly as feature launch.
* **Bet expiry alarms** Automate reminders when a bet’s sunset date nears; no more “temporary” hacks living forever.
* **Flow‑budget guard‑rail** Cap “drag time” (build, test, deploy) at < 25 % of lead time; TOC flow metrics signal when drag crosses the line .

---

#### 5  Narratives for exec buy‑in

| Exec worry                        | Framing with the map                                                                             |
| --------------------------------- | ------------------------------------------------------------------------------------------------ |
| “Why fund refactors now?”         | *Liability class* items expose legal & reputational downside—cheaper to fix than to litigate.    |
| “Isn’t this just ‘nice to have’?” | Show velocity deltas: drag cut by 20 % lifted feature throughput by \$X last quarter.            |
| “We can’t pause roadmap.”         | Map shows ≤15 % of capacity on relic cleanup yields compounding flow and lowers future run‑cost. |

---

#### 6  Avoiding taxonomy‑rot

* **No dual labels.** If an item feels like both drag *and* hazard, choose the one that dictates the *earliest safe fix*.
* **Expiry reviews.** Every label expires in 12 months unless re‑assessed; keeps the map honest.
* **Public artefact.** Store the map in the same repo as architecture decision records—transparency fights hand‑wavy “debt” resurrection.

---

### Close‑up example

Imagine a legacy payments microservice:

* **Liability**: Out‑of‑support TLS library → patch sprint.
* **Drag**: 18‑minute deployment wait → invest in blue/green infra.
* **Hazard**: Single replica in one AZ → add redundancy before Black Friday.
* **Relic**: X‑Pay integration dead for 18 months → delete endpoints.
* **Bet**: New GraphQL adapter built fast → reassess in 90 days.

A one‑page Liability Map converts fuzzy grumbles into a crisp action plan, schedule, and business story.

---

## Questions to dig further

**Q1**

Which current “tech debt” item in your backlog could you reclassify using this taxonomy to test the clarity and urgency shift?

**Q2**

What lightweight data (flow‑metrics, scan results, incident costs) can you expose to make each class’s impact visible without month‑long audits?

**Q3**

How might quarterly Liability Map reviews integrate with your existing sprint or OKR rhythm to keep the taxonomy alive, not ceremonial?
