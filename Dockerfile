# Official vLLM v0.29.0 image + Ray (local build). Same as the head repo —
# official vllm-openai has no `ray`; layer Ray 2.58.0 for the two-node Ray cluster.
FROM vllm/vllm-openai:v0.29.0

RUN python3 -m pip install --no-cache-dir "ray==2.58.0" \
 && ray --version \
 && python3 - <<'PY'
import ray
import vllm
assert ray.__version__ == "2.58.0", ray.__version__
assert vllm.__version__ == "0.29.0", vllm.__version__
print(f"vLLM {vllm.__version__}; Ray {ray.__version__}")
PY
