---
name: file-defect
description: >-
  Discusses a Linguista discrepancy or guess with QA and files an accepted
  defect in the defects spreadsheet, including screenshots on Google Drive.
  Use when QA discusses a discrepancy, a guess, or asks to file a defect.
---

# File a defect

Read addresses from `.cursor/links.md`. Do not copy them into this skill. Do not write a login, password, token, or email address into the repository or into the defect row.

## Google session

Before creating a folder, uploading a file, or writing a row, open the defects spreadsheet from `.cursor/links.md` in the browser.

If the page is anonymous or shows a sign-in control, ask QA to sign in. Do not type the email, password, or code. Do not change the spreadsheet while waiting. Wait until QA says that sign-in is done.

Then read the account control. Continue only when the signed-in account is Инна Курьянова. Open the Drive screenshots folder from `.cursor/links.md` in that same session and check the same account. If the account is different, stop and ask QA. Do not create a folder or edit a cell until both pages are open under this account.

If that account is already signed in, do not ask QA to sign in again.

The row is not created earlier than the discussion. It may be written later. One accepted item becomes one new row. The row uses the wording from the discussion, not a new paraphrase. All prose in the row is Russian.

## 1. Discussion with QA

Bring a discrepancy or a guess to QA with these four fields, in Russian, and attach the local screenshot:

- **Предусловие.** The state before the steps. If nothing was required beforehand, say so.
- **Шаги.** How the item was checked.
- **Ожидаемый результат.** The requirement line as written in the source. For a guess, add that it is not based on the requirements.
- **Фактический результат.** What was seen on the stand.

In the same text, propose **вид тестирования**: функциональное, UX, локализация, безопасность, or a combination when the gap is about more than one of these.

QA decides whether to file the row. A guess is filed only when QA says so. QA may keep the proposed testing type or change it. The cell receives the agreed type. If QA does not change it, use the proposal. A comment is included only when the discussion adds something beyond the four fields.

Do not choose severity, priority, or assignee. Do not bring a defect from a tool failure, a page that has not finished loading, or an observation taken off the staging stand.

## 2. Filing the defect

Read the defects spreadsheet from `.cursor/links.md`. Take the next integer after the largest number already used. A number with a trailing dot and the same number without a dot are the same number. Add a new row. Do not overwrite a row whose number is already taken.

| Column | What to write |
|---|---|
| № | The integer one greater than the largest number already used |
| Вид тестирования | The agreed testing type |
| Summary | A short Russian summary of the gap |
| Project | The staging stand address from `.cursor/links.md` |
| Status | `Новый` |
| Author | Инна |
| Environment | The browser and its version used to open the stand for this check |
| Precondition | Предусловие from the discussion |
| Steps to Reproduce | Шаги from the discussion |
| Expected Result | Ожидаемый результат from the discussion |
| Actual Result | Фактический результат from the discussion |
| Комментарий | Only the text the discussion added. Otherwise leave empty |
| Скриншот / видео | The file links from section 3 |

Leave Version, severity, priority, and assignee empty.

## 3. Screenshots

Leave the local files in the screenshots path from `.cursor/links.md`. Do this only for the new row. Do not change screenshot cells in rows that already exist.

In the Google Drive screenshots folder from `.cursor/links.md`, create a folder named `Баг-трекер - №<this row's number>`. Put every screenshot of this defect there. Name each file briefly by its content.

For each file, open its Share dialog and set General access to anyone with the link, as a viewer. Copy the share link. Insert the links into `Скриншот / видео` of the new row as file chips by following [file-chips.md](file-chips.md). In that file, `C4` means this cell.

## 4. Row color

After the new row is filled, select that whole row and set its fill color. Open the fill-color menu. Skip the gray row and the row directly under it. Use the next row, the one that starts one row below the grays. Pick one of its swatches at random. Look at the defect row above and do not use its fill color. Do not change the color of any other row.

## Before writing

- The defects spreadsheet and the Drive screenshots folder are open under the account Инна Курьянова.
- QA has decided to file this item. A guess was filed only because QA said so. If QA has not decided, do not write the row.
- The testing type is the agreed one.
- The four fields match the discussion.
- Status is `Новый` and Author is `Инна`. If either differs, set it to that value.
- The prose in the row is Russian.
- Комментарий is empty unless the discussion added text beyond the four fields. If it did not, clear the comment.
- Environment is the browser and version used for this check. If it was copied from another row, replace it with this check's browser.
- The number is one greater than the largest number already used. The write does not replace an existing defect and does not fill a gap.
- Version, severity, priority, and assignee are empty.
- The reply and the row contain no login, password, token, or email address.
- A tool failure, an unfinished page, or an off-stand observation is not filed.
- `Скриншот / видео` in the new row contains file chips, inserted by [file-chips.md](file-chips.md). The formula bar shows file names separated by spaces, not raw URLs. Each file is shared so anyone with the link can open it. If a file is still restricted, change that setting before leaving the row.
- The new row's fill color is one swatch from the row that starts one row below the grays, and it is not the fill color of the defect row above.
- Nothing needed to continue was unclear. If an action, a requirement, or anything else needed to write the row is unclear, ask and do not write the row. Do not invent the missing meaning.

If a check fails, fix it before writing the row. Read the largest number once, write one new row with the next integer, and do not write a second row for the same defect. Do not edit an existing row and do not reuse a gap. If a secret appears, remove it. If the new row's fill color matches the row above, choose another swatch from that same row, the one that starts one row below the grays.
