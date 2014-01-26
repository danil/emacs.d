package.path = package.path .. ";/home/danil/.imapfilter/?.lua"
require "config/options"
require "config/gmail"

-- IMAPFilter can be detached from the controlling terminal and run in
-- the background as a system daemon.
--
-- The auxiliary function daemon_mode() is supplied for conveniency.
-- The following example puts imapfilter in the background and runs
-- endlessly, executing the commands in the forever() function and
-- sleeping for 600 seconds between intervals:
function forever()
   gmail_filtering()
end
become_daemon(600, forever)