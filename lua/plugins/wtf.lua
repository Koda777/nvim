local M = {}

function M.config()
	require("wtf").setup({
		popup_type = "popup",
		openai_api_key = "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",
		openai_model_id = "gpt-3.5-turbo",
		context = true,
		language = "english",
		additional_instructions = "I want you to be explicit and give me the corrections explained line per line",
		search_engine = "google",
		hooks = {
			request_started = nil,
			request_finished = nil,
		},
	})
end

return M
