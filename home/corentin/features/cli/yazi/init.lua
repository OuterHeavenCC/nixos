-- Sync yanked / cut files across all yazi's instances
require("session"):setup {
	sync_yanked = true,
}

-- Add Yazi's CWD to zoxide when navigating
require("zoxide"):setup {
    update_db = true,
}
