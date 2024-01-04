local utils = {}
utils.__index = utils

-- Checks if packer exists
function utils:ensure_packer()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	local packer_git = "https://github.com/wbthomason/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		vim.api.nvim_echo({ { "Cloning packer.nvim", "Title" } }, true, {})
		fn.system({ "git", "clone", "--depth", "0", packer_git, install_path })

		return true
	end

	return false
end

return utils
