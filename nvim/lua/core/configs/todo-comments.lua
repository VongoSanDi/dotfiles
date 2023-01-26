local status, tc = pcall(require, "todo-comments")
if not status then return end

tc.setup{}
