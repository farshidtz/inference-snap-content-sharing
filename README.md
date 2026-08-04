# Content interfaces for inference snaps

Proofs of concept for sharing data between snaps using the content interface, in the context of inference snaps.

## PoCs

- [Inference snap default provider](defaults-to-inference-snaps/README.md) — the inference manager snap (`inference`) shares engine and model configurations with inference snaps (e.g. `gemma3-jane`) as interface attributes, mimicking gadget-seeded configuration.
- [Inference snaps to clients](inference-snap-to-clients/README.md) — inference snaps share provider details (e.g. the OpenAI API base URL) and model weights with client snaps via content interfaces.
