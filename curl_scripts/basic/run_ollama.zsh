


function _call_gemma3() {
	local OLLAMA_URL="http://localhost:11434/api/generate"
	local MODEL="gemma3:$1b-it-qat"
	shift
	local SYSTEM_PROMPT="$@"
  local PROMPT=$(git diff --cached)

  local PAYLOAD=$(jq -n \
    --arg model "$MODEL" \
    --arg system "$SYSTEM_PROMPT" \
    --arg prompt "$DIFF" \
    '{model: $model, stream: false, system: $system, prompt: $prompt}')

  local RESPONSE=$(curl -s -X POST "$OLLAMA_URL" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD" | jq -r .response)

  echo $RESPONSE
}
function call_gemma3_1b() {
	_call_gemma3 1 "$@"
}

function call_gemma3_4b() {
	_call_gemma3 4 "$@"
}

function call_gemma3_12b() {
	_call_gemma3 12 "$@"
}


