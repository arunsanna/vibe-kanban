-- Add per-attempt isolation mode: 'worktree' (default) or 'branch'
ALTER TABLE task_attempts ADD COLUMN isolation_mode TEXT NOT NULL DEFAULT 'worktree';

