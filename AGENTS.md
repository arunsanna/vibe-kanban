# Repository Guidelines

## Project Structure & Module Organization
- `crates/` holds the Rust workspace: `server` (HTTP binaries), `db` (SQLx models + migrations), plus `executors`, `services`, `utils`, `deployment`, and `local-deployment`.
- The React app lives in `frontend/` (`frontend/src` for source; dialogs under `frontend/src/components/dialogs`).
- Generated TS types land in `shared/types.ts`; edit `crates/server/src/bin/generate_types.rs` and rerun `npm run generate-types` instead of touching the output.
- Assets sit in `assets/`, `dev_assets/`, and `dev_assets_seed/`; CLI artifacts in `npx-cli/`; helper scripts in `scripts/`.

## Build, Test, and Development Commands
- `pnpm i` installs workspace dependencies.
- `pnpm run dev` runs frontend and backend together with auto-assigned ports.
- `npm run backend:dev:watch` and `npm run frontend:dev` watch the Rust API and React app independently.
- `npm run backend:check` plus `cargo test --workspace` cover Rust checks and tests.
- `npm run check`, `npm run lint`, and `npm run build` cover TypeScript type checking, linting, and production Vite builds.
- `npm run generate-types` refreshes shared types; `npm run prepare-db` stages SQLx offline data.

## Coding Style & Naming Conventions
- Rust: obey `rustfmt.toml`, group imports by crate, keep modules snake_case and types PascalCase, derive `Debug`/`Serialize`/`Deserialize` when useful.
- TypeScript/React: ESLint + Prettier enforce 2-space indentation, single quotes, 80-column guide; components PascalCase, functions/vars camelCase, files prefer kebab-case.
- Keep functions tight and add comments only for non-obvious logic.

## Testing Guidelines
- Rust tests stay next to the code under `#[cfg(test)]`; run `cargo test --workspace` before pushing.
- Frontend uses Vite/Vitest; place specs beside components and ensure `npm run check` plus `npm run lint` pass cleanly.
- After changing shared types, run `npm run generate-types` and review `shared/types.ts`.

## Commit & Pull Request Guidelines
- History favors imperative subjects with scopes like `fix:` or `chore:` and PR numbers, e.g. `fix: retry modal horizontal overflow (#991)`.
- Keep commits focused on a single change set and call out migrations or generated artifacts when included.
- PRs should outline intent, link issues, list command results (`cargo test`, `npm run check`, etc.), and attach UI evidence when behavior shifts.

## Security & Configuration Tips
- Keep secrets in `.env`; configure `FRONTEND_PORT`, `BACKEND_PORT`, `HOST`, and optional `GITHUB_CLIENT_ID` there.
- Use `scripts/setup-dev-environment.js` to sync dev ports and assets and avoid committing local overrides.
